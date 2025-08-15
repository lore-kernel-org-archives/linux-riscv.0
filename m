Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76CACA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlbP71mGjXT9hXkjdEr27IsWCTlcasyJTLgVhdqVZxw=; b=x6QaKDiM7HiGK7
	3HoFWkPADGNqQGCi7YteYeJop22Ck86WOPWqerxvRq8swb7ZcKyLXmlLZsFXUDT5O/hRkk1fzA4tJ
	nvK/sU2N/ey8+ZGlIN32Sxxwtd2OUa78lSQxkfdF1X+gz+glHXo0r94FM/u8k1wa2GiirQ/cPgdg8
	pY6GzHA0+lmcsB2ZRzk0ROhPH3qG/jUVDTbBCkR7AGUMK1+wPSwyH5y9AwElauFn79Y+qT8QOYs94
	TO4dwEaWT15AZGCcVlt3t+B9xwUjyUHkODpddiDueM1xxs5bPDBHxZUdrUa01Dina6M/Uoargq6fo
	ttF9tWeABCANPPmHzTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtCl-00000002PaN-3vof;
	Fri, 15 Aug 2025 12:06:43 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqQ6-00000001zbv-3ngx
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 09:08:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4c3GVF26ztzKHMnj
	for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 17:08:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 988A11A1B04
	for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 17:08:04 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgCHUBHz+J5ogLYDDw--.38943S2;
	Fri, 15 Aug 2025 17:08:04 +0800 (CST)
Message-ID: <381def4c-ebe1-4dc1-a301-72cdc7f9176a@huaweicloud.com>
Date: Fri, 15 Aug 2025 17:08:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <87v7n21deu.fsf@all.your.base.are.belong.to.us>
 <00538107-08e3-4ba3-a11a-19fa9fd0a496@huaweicloud.com>
 <8ef2259d-eb58-4c66-a27a-3ee0b85aa639@iogearbox.net>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <8ef2259d-eb58-4c66-a27a-3ee0b85aa639@iogearbox.net>
X-CM-TRANSID: gCh0CgCHUBHz+J5ogLYDDw--.38943S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1xGF1xKw17tw17Cr1rJFb_yoW5JFWfpw
	s5CasIyrWrCr1fAwnrtr18JryfKr48Jw15Xr1UJFy8Arsrtr4jgF4xX3Wj9r1DJrWrXr15
	Cr1YyrnxZw15ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020819_303747_6C15C8E3 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDI1LzgvMTUgMTY6NTUsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiA4LzUvMjUg
ODo1MiBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+IE9uIDIwMjUvOC81IDE0OjM4LCBCasO2cm4gVMO2
cGVsIHdyb3RlOgo+Pj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6
Cj4+Pgo+Pj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4KPj4+PiBw
YXRjaCAxLTMgcmVmYWN0b3IgcmVkdW5kYW50IGxvYWQgYW5kIHN0b3JlIG9wZXJhdGlvbnMuCj4+
Pj4gcGF0Y2ggNC03IGFkZCBaYWNhcyBpbnN0cnVjdGlvbnMgZm9yIGNtcHhjaGcuCj4+Pj4gcGF0
Y2ggOCBvcHRpbWl6ZXMgZXhjZXB0aW9uIHRhYmxlIGhhbmRsaW5nLgo+Pj4+IHBhdGNoIDktMTAg
YWRkIHN1cHBvcnQgYXJlbmEgYXRvbWljcyBmb3IgUlY2NC4KPj4+Pgo+Pj4+IFRlc3RzIGB0ZXN0
X3Byb2dzIC10IGF0b21pYyxhcmVuYWAgaGF2ZSBwYXNzZWQgYXMgc2hvd24gYmVsbG93LAo+Pj4+
IGFzIHdlbGwgYXMgYHRlc3RfdmVyaWZpZXJgIGFuZCBgdGVzdF9icGYua29gIGhhdmUgcGFzc2Vk
Lgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+IFB1IExlaHVpICgxMCk6Cj4+Pj4gwqDCoCByaXNjdiwg
YnBmOiBFeHRyYWN0IGVtaXRfc3R4KCkgaGVscGVyCj4+Pj4gwqDCoCByaXNjdiwgYnBmOiBFeHRy
YWN0IGVtaXRfc3QoKSBoZWxwZXIKPj4+PiDCoMKgIHJpc2N2LCBicGY6IEV4dHJhY3QgZW1pdF9s
ZHgoKSBoZWxwZXIKPj4+PiDCoMKgIHJpc2N2OiBTZXBhcmF0ZSB0b29sY2hhaW4gc3VwcG9ydCBk
ZXBlbmRlbmN5IGZyb20gUklTQ1ZfSVNBX1pBQ0FTCj4+Pj4gwqDCoCByaXNjdiwgYnBmOiBBZGQg
cnZfZXh0X2VuYWJsZWQgbWFjcm8gZm9yIHJ1bnRpbWUgZGV0ZWN0aW9uIAo+Pj4+IGV4dGVudHNp
b24KPj4+PiDCoMKgIHJpc2N2LCBicGY6IEFkZCBaYWNhcyBpbnN0cnVjdGlvbnMKPj4+PiDCoMKg
IHJpc2N2LCBicGY6IE9wdGltaXplIGNtcHhjaGcgaW5zbiB3aXRoIFphY2FzIHN1cHBvcnQKPj4+
PiDCoMKgIHJpc2N2LCBicGY6IEFkZCBleF9pbnNuX29mZiBhbmQgZXhfam1wX29mZiBmb3IgZXhj
ZXB0aW9uIHRhYmxlCj4+Pj4gwqDCoMKgwqAgaGFuZGxpbmcKPj4+PiDCoMKgIHJpc2N2LCBicGY6
IEFkZCBzdXBwb3J0IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQKPj4+PiDCoMKgIHNlbGZ0ZXN0cy9i
cGY6IEVuYWJsZSBhcmVuYSBhdG9taWNzIHRlc3RzIGZvciBSVjY0Cj4+Pj4KPj4+PiDCoCBhcmNo
L3Jpc2N2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSAtCj4+Pj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4
Y2hnLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstCj4+Pj4gwqAgYXJjaC9y
aXNjdi9rZXJuZWwvc2V0dXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMSArCj4+Pj4gwqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3MCArKy0KPj4+PiDCoCBhcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvbXA2NC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDUx
NiAKPj4+PiArKysrKy0tLS0tLS0tLS0tLS0KPj4+PiDCoCAuLi4vc2VsZnRlc3RzL2JwZi9wcm9n
cy9hcmVuYV9hdG9taWNzLmPCoMKgwqDCoMKgwqAgfMKgwqAgOSArLQo+Pj4+IMKgIDYgZmlsZXMg
Y2hhbmdlZCwgMjE0IGluc2VydGlvbnMoKyksIDM4OSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBXaGF0
IGEgbmljZSBzZXJpZXMhIFRoZSBiZXN0IGtpbmQgb2YgY2hhbmdlc2V0IC0tIG5ldyBmZWF0dXJl
LCBsZXNzCj4+PiBjb2RlISBUaGFuayB5b3UsIExlaHVpISBBZ2FpbiwgYXBvbG9naWVzIGZvciB0
aGUgaG9ycmlibGUgU0xBLiBUaGUKPj4+IHdlYXRoZXIgaW4gU3dlZGVuIHdhcyBzaW1wbHkgVG9v
IEdvb2QgdGhpcyBzdW1tZXIhCj4+Cj4+IFNvdW5kcyBsaWtlIGEgZ3JlYXQgdmFjYXRpb24hCj4g
Cj4gVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMhIEkganVzdCB0b29rIHRoaXMgaW50byBicGYt
bmV4dCwgcGxlYXNlIGFsc28KPiBtYWtlIHN1cmUgdG8gYWRkcmVzcyB0aGUgc21hbGwgZm9sbG93
LXVwIHJlcXVlc3QgZnJvbSBCam9ybi4KCkhpIERhbmllbCwKCkFscmVhZHkgZXhwbGFpbmVkIGFu
ZCBhbGlnbmVkIHdpdGggQmpvcm4sIG5vIGZ1cnRoZXIgcHJvY2Vzc2luZyBpcyAKcmVxdWlyZWQu
IFRoYW5rcy4KCj4gCj4+PiBUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4gIyBRRU1VIG9ubHkKPj4+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPgo+IAo+IFRoYW5rcywKPiBEYW5pZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
