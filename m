Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C60CC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 02:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+OL8y3BmxkWUSY+BNXvqimzB9Q09OOCqYWqJVxmaqY=; b=iIDaLCjJjlY3Ze
	oXdCEiem5tfve0Ml/3Mv8MIaXAakcgTAT1BhCUQwEnk1UF2+pzmX3Wvgn1nu+VejPXTvqZnQwFtmF
	dukj9ERq+QDAh62TsZWiYqMNkPwl2n0cQfhnJKs7QKvceEfEpA2tVS9wFx6N1hkygahFbQCaYLElg
	BBdvvz+Dz7yPbQcHlTU5OqZ7tLiycLEGEUYzEKInie22BTPJbC0mphZpxuD6Z1FeYJjyng/SKFiJG
	ap0Nr+oME0yCkGu8QJrU6o9e94rB2uEjhJa3h09E9ZjxVvC514NHdBqTf/GaGkGEFCJ6ZutV8bzTY
	u5aPax7s8zz/TBq4skjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcaa-00HE5I-FW; Fri, 06 Jan 2023 02:36:12 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcaV-00HE0n-HP
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 02:36:10 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Np6s94hXvz4f409T
	for <linux-riscv@lists.infradead.org>; Fri,  6 Jan 2023 10:35:57 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgA3MR8Nibdj+7tMBA--.38173S2;
	Fri, 06 Jan 2023 10:35:58 +0800 (CST)
Message-ID: <1c35ce46-27ff-f311-44f5-b3add388c045@huaweicloud.com>
Date: Fri, 6 Jan 2023 10:35:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH RESEND bpf-next 1/4] bpf: Rollback to text_poke when
 arch not supported ftrace direct call
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
 <20221220021319.1655871-2-pulehui@huaweicloud.com>
 <a2bf7ed9-4977-608c-d5a5-8ee6a520cf52@huawei.com>
 <0039743b-5837-c0d3-7574-7719698f9dc1@huaweicloud.com>
 <87k023u8kp.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87k023u8kp.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: _Ch0CgA3MR8Nibdj+7tMBA--.38173S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15ZF43ZrWrJF17CryrCrg_yoW5ur1fpF
	WrC3W5u3yUXr1kWFnFq3W8XFyjy3ykJ34DGr4UJa4rWa9agr9FgF4jqr1Fgryvyrs5WFy2
	yF1Yqr9IvFyDZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_183607_960542_FD4BD1E5 
X-CRM114-Status: GOOD (  16.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzEvMyAyMDowNSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gT24gMjAyMi8xMi8yMCAxMDozMiwg
WHUgS3VvaGFpIHdyb3RlOgo+Pj4gT24gMTIvMjAvMjAyMiAxMDoxMyBBTSwgUHUgTGVodWkgd3Jv
dGU6Cj4+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+Pgo+Pj4+IFRo
ZSBjdXJyZW50IGJwZiB0cmFtcG9saW5lIGF0dGFjaCB0byBrZXJuZWwgZnVuY3Rpb25zIHZpYSBm
dHJhY2UgZGlyZWN0Cj4+Pj4gY2FsbCBBUEksIHdoaWxlIHRleHRfcG9rZSBpcyBhcHBsaWVkIGZv
ciBicGYyYnBmIGF0dGFjaCBhbmQgdGFpbCBjYWxsCj4+Pj4gb3B0aW1pemF0aW9uLiBGb3IgYXJj
aGl0ZWN0dXJlcyB0aGF0IGRvIG5vdCBzdXBwb3J0IGZ0cmFjZSBkaXJlY3QgY2FsbCwKPj4+PiB0
ZXh0X3Bva2UgaXMgc3RpbGwgYWJsZSB0byBhdHRhY2ggYnBmIHRyYW1wb2xpbmUgdG8ga2VybmVs
IGZ1bmN0aW9ucy4KPj4+PiBMZXQncyByZWxheCBpdCBieSByb2xsYmFjayB0byB0ZXh0X3Bva2Ug
d2hlbiBhcmNoaXRlY3R1cmUgbm90IHN1cHBvcnRlZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIGtlcm5lbC9i
cGYvdHJhbXBvbGluZS5jIHwgOCArKy0tLS0tLQo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2tlcm5l
bC9icGYvdHJhbXBvbGluZS5jIGIva2VybmVsL2JwZi90cmFtcG9saW5lLmMKPj4+PiBpbmRleCBk
NjM5NTIxNWI4NDkuLjM4NjE5N2E3OTUyYyAxMDA2NDQKPj4+PiAtLS0gYS9rZXJuZWwvYnBmL3Ry
YW1wb2xpbmUuYwo+Pj4+ICsrKyBiL2tlcm5lbC9icGYvdHJhbXBvbGluZS5jCj4+Pj4gQEAgLTIy
OCwxNSArMjI4LDExIEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2ZlbnRyeShzdHJ1Y3QgYnBmX3RyYW1w
b2xpbmUKPj4+PiAqdHIsIHZvaWQgKm9sZF9hZGRyLCB2b2lkICpuZXdfYWQKPj4+PiAgwqAgc3Rh
dGljIGludCByZWdpc3Rlcl9mZW50cnkoc3RydWN0IGJwZl90cmFtcG9saW5lICp0ciwgdm9pZCAq
bmV3X2FkZHIpCj4+Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDCoCB2b2lkICppcCA9IHRyLT5mdW5j
LmFkZHI7Cj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGZhZGRyOwo+Pj4+ICDCoMKgwqDCoMKg
IGludCByZXQ7Cj4+Pj4gLcKgwqDCoCBmYWRkciA9IGZ0cmFjZV9sb2NhdGlvbigodW5zaWduZWQg
bG9uZylpcCk7Cj4+Pj4gLcKgwqDCoCBpZiAoZmFkZHIpIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKCF0ci0+Zm9wcykKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1RT
VVBQOwo+Pj4+ICvCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTKSAmJgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAhIWZ0cmFjZV9sb2NhdGlv
bigodW5zaWduZWQgbG9uZylpcCkpCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB0ci0+ZnVuYy5m
dHJhY2VfbWFuYWdlZCA9IHRydWU7Cj4+Pj4gLcKgwqDCoCB9Cj4+Pj4KPj4+Cj4+PiBBZnRlciB0
aGlzIHBhdGNoLCBhIGtlcm5lbCBmdW5jdGlvbiB3aXRoIHRydWUgdHJhY2VfbG9jYXRpb24gd2ls
bCBiZQo+Pj4gcGF0Y2hlZAo+Pj4gYnkgYnBmIHdoZW4gQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTIGlzIGRpc2FibGVkLCB3aGljaAo+Pj4gbWVhbnMKPj4+IHRoYXQgYSBr
ZXJuZWwgZnVuY3Rpb24gbWF5IGJlIHBhdGNoZWQgYnkgYm90aCBicGYgYW5kIGZ0cmFjZSBpbiBh
IG11dHVhbGx5Cj4+PiB1bmF3YXJlIHdheS4gVGhpcyB3aWxsIGNhdXNlIGZ0cmFjZSBhbmQgYnBm
X2FyY2hfdGV4dF9wb2tlIHRvIGZhaWwgaW4gYQo+Pj4gc29tZXdoYXQgcmFuZG9tIHdheSBpZiB0
aGUgZnVuY3Rpb24gdG8gYmUgcGF0Y2hlZCB3YXMgYWxyZWFkeSBwYXRjaGVkCj4+PiBieSB0aGUg
b3RoZXIuCj4+Cj4+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuIEFuZCB5ZXMsIHRoaXMgaXMgYSBi
YWNrd2FyZCBjb21wYXRpYmxlIHNvbHV0aW9uCj4+IGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgbm90
IHN1cHBvcnQgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMuCj4gCj4gSXQncyBub3Qg
ImJhY2t3YXJkIGNvbXBhdGlibGUiLiBSZWl0ZXJhdGluZyB3aGF0IEt1b2hhaSBzYWlkOyBUaGUg
QlBGCj4gdHJhbXBvbGluZSBtdXN0IGJlIGF3YXJlIG9mIGZ0cmFjZSdzIHN0YXRlIC0tIHdpdGgg
dGhpcyBwYXRjaCwgdGhlCj4gdHJhbXBvbGluZSBjYW4ndCBibGluZGx5IHBva2UgdGhlIHRleHQg
bWFuYWdlZCBteSBmdHJhY2UuCj4gCj4gSSdkIHJlY29tbWVuZCB0byByZW1vdmUgdGhpcyBwYXRj
aCBmcm9tIHRoZSBzZXJpZXMuCj4gCgpBZnRlciBkZWVwIGNvbnNpZGVyYXRpb24sIEt1b2hhaSdz
IGNhdGNoaW5nIGlzIG11Y2ggbW9yZSByZWFzb25hYmxlLiAKV2lsbCByZW1vdmUgaXQgaW4gdGhl
IG5leHQuCgpJbiB0aGUgbWVhbnRpbWUsIEkgZm91bmQgdGhhdCBzb25nIGFuZCBndW9yZW4gaGF2
ZSB3b3JrZWQgb24gc3VwcG9ydGluZyAKcmlzY3YgZnRyYWNlIHdpdGggZGlyZWN0IGNhbGwgWzBd
LCBzbyB3ZSBjYW4gY29uY2VudHJhdGUgb24gbWFraW5nIApicGZfYXJjaF90ZXh0X3Bva2Ugc3Bl
Y2lmaWNhbGx5IGZvciB0aGUgYnBmIGNvbnRleHQuCgpIb3dldmVyLCByaXNjdiBmdHJhY2UgYmFz
ZSBmcmFtZXdvcmsgd2lsbCBjaGFuZ2UgYmVjYXVzZSBbMF0gdXNlcyB0MCBhcyAKdGhlIGxpbmsg
cmVnaXN0ZXIgb2YgdHJhY2VkIGZ1bmN0aW9uLiBXZSBzaG91bGQgY29uc2lkZXIgdGhlIGdlbmVy
YWxpdHkgCm9mIHJpc2N2IGJwZiB0cmFtcG9saW5lIGZvciBrZXJuZWwgZnVuY3Rpb24gYW5kIGJw
ZiBjb250ZXh0LiBJdCdzIG5vdCAKY2xlYXIgaWYgWzBdIHdpbGwgYmUgdXBzdHJlYW1lZCwgc28g
bWF5YmUgd2Ugc2hvdWxkIHdhaXQgZm9yIGl0PwoKWzBdIApodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDIyMTIwODA5MTI0NC4yMDM0MDctNy1ndW9yZW5Aa2VybmVsLm9yZwoK
QW55d2F5LCB0aGFua3MgYm90aCBvZiB5b3UgZm9yIHRoZSByZXZpZXcuCgo+IAo+IEJqw7ZybgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
