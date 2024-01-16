Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9954C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PXLKY9XqbtA0lv+AOoGH2odKbU+pOu5lpS0XqpQaxA=; b=huvQlv98SAKj83
	VCUQT2b6HTIRyqADyyqN+ZX9iLqlV9/5R4DXqinunnlCEMMH40neTEbcMphQsmKZwfBKJyt3bTEQw
	qMQQgSfxjnDCp7l7WQzbiUMbZVvv6/ytGxn7TnFlTMpfuK7N6G4kALY9tXZIN8GKVNdGAbmO2JPSz
	fVD0TqvWIoNAphepgoUjInOpNfkMQB0eoyIkX9Esv2dZiZhevEY/+9ov4MzJ58s3A/6a2YeNijJdQ
	oQEjqbpAxQseGRmg0czziuqNqibqZusW19GHKhobGfI0B0NWWf/7tJ1GvvxqtvV1fqS5Jemc4+5fP
	ze74W9jpu2P6WCdTzjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkJo-00CHYH-13;
	Tue, 16 Jan 2024 14:21:32 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkJk-00CHVv-1e
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 14:21:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TDrlp02Sxz4f3kFF
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 22:21:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B223C1A0BC1
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 22:21:13 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgAXamzYkKZlxjsZBA--.56272S2;
	Tue, 16 Jan 2024 22:21:13 +0800 (CST)
Message-ID: <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
Date: Tue, 16 Jan 2024 22:21:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87lecqobyb.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgAXamzYkKZlxjsZBA--.56272S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15ZF4UJrW8Gw4DAFW8Zwb_yoW5GFWrpF
	Wak3W7Kw1vgr4Ikrn7AF48Xa95Cr4xA3W3Ar1Iqr1Fya1jkrZ2gr43GFWj9Fy8Zrn7Kw1Y
	qr4jqanxCr4DZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU13rcDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_062128_983211_EB6DCC04 
X-CRM114-Status: GOOD (  21.56  )
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

CgpPbiAyMDIzLzkvMjggMTc6NTksIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEluIHRoZSBjdXJyZW50IFJWNjQgSklULCBpZiB3ZSBqdXN0
IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJwcm9nLAo+PiB0aGUgVENDIGNhbiBiZSBw
cm9wYWdhdGVkIGZyb20gdGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNzLCBidXQK
Pj4gdGhlIFRDQyBvZiB0aGUgcGFyZW50IHByb2Nlc3MgY2Fubm90IGJlIHJlc3RvcmVkIHdoZW4g
dGhlIHN1YnByb2Nlc3MKPj4gZXhpdHMuIFNpbmNlIHRoZSBSVjY0IFRDQyBpcyBpbml0aWFsaXpl
ZCBiZWZvcmUgc2F2aW5nIHRoZSBjYWxsZWUgc2F2ZWQKPj4gcmVnaXN0ZXJzIGludG8gdGhlIHN0
YWNrLCB3ZSBjYW5ub3QgdXNlIHRoZSBjYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KPj4gcGFzcyB0
aGUgVENDLCBvdGhlcndpc2UgdGhlIG9yaWdpbmFsIHZhbHVlIG9mIHRoZSBjYWxsZWUgc2F2ZWQg
cmVnaXN0ZXIKPj4gd2lsbCBiZSBkZXN0cm95ZWQuIFNvIHdlIGltcGxlbWVudGVkIG1peGluZyBi
cGYyYnBmIGFuZCB0YWlsY2FsbHMKPj4gc2ltaWxhciB0byB4ODZfNjQsIGkuZS4gdXNpbmcgYSBu
b24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5zZmVyCj4+IHRoZSBUQ0MgYmV0d2VlbiBm
dW5jdGlvbnMsIGFuZCBzYXZpbmcgdGhhdCByZWdpc3RlciB0byB0aGUgc3RhY2sgdG8KPj4gcHJv
dGVjdCB0aGUgVENDIHZhbHVlLiBBdCB0aGUgc2FtZSB0aW1lLCB3ZSBhbHNvIGNvbnNpZGVyIHRo
ZSBzY2VuYXJpbwo+PiBvZiBtaXhpbmcgdHJhbXBvbGluZS4KPiAKPiBIaSEKPiAKPiBUaGUgUklT
Qy1WIEpJVCB0cmllcyB0byBtaW5pbWl6ZSB0aGUgc3RhY2sgdXNhZ2UsIGUuZy4gaXQgZG9lc24n
dCBoYXZlIGEKPiBmaXhlZCBwcm8vZXBpbG9ndWUgbGlrZSBzb21lIG9mIHRoZSBvdGhlciBKSVRz
LiBJIHRoaW5rIHdlIGNhbiBkbyBiZXR0ZXIKPiBoZXJlLCBzbyB0aGF0IHRoZSBwYXNzLVRDQy12
aWEtcmVnaXN0ZXIgY2FuIGJlIHVzZWQsIGFuZCB0aGUgYWRkaXRpb25hbAo+IHN0YWNrIGFjY2Vz
cyBjYW4gYmUgYXZvaWRlZC4KPiAKPiBUb2RheSwgdGhlIFRDQyBpcyBwYXNzZWQgdmlhIGEgcmVn
aXN0ZXIgKGE2KSBhbmQgY2FuIGJlIHZpZXdlZCBhcyBhCj4gInN0YXRlIiB2YXJpYWJsZS90cmFu
c3BhcmVudCBhcmd1bWVudC9yZXR1cm4gdmFsdWUuIEFzIHlvdSBwb2ludCBvdXQsIHdlCj4gbG9v
c2UgdGhpcyB3aGVuIHdlIGRvIGEgY2FsbC4gT24gKGFueSkgY2FsbHMgd2UgbW92ZSB0aGUgVEND
IHRvIGEKPiBjYWxsZWUtc2F2ZWQgcmVnaXN0ZXIuCj4gCj4gV0RZVCBhYm91dCB0aGUgZm9sbG93
aW5nIHNjaGVtZToKPiAKPiAxIFBpY2t1cCB0aGUgYXJtNjQgYnBmMmJwZi90YWlsbWl4IG1lY2hh
bmlzbSBvZiBqdXN0IGNsZWFyaW5nIHRoZSBUQ0MKPiAgICBmb3IgdGhlIG1haW4gcHJvZ3JhbS4K
PiAyIEZvciBCUEYgaGVscGVyIGNhbGxzLCBtb3ZlIFRDQyB0byBzNiwgcGVyZm9ybSB0aGUgY2Fs
bCwgYW5kIHJlc3RvcmUKPiAgICBhNi4gRGl0byBmb3Iga2Z1bmMgY2FsbHMgKEJQRl9QU0VVRE9f
S0ZVTkNfQ0FMTCkuCj4gMyBGb3IgYWxsIG90aGVyIGNhbGxzLCBhNiBpcyBwYXNzZWQgdHJhbnNw
YXJlbnRseS4KPiAKPiBGb3IgMiBicGZfaml0X2dldF9mdW5jX2FkZHIoKSBjYW4gYmUgdXNlZCB0
byBkZXRlcm1pbmUgaWYgdGhlIGNhbGxlZSBpcwo+IGEgQlBGIGhlbHBlciBvciBub3QuCj4gCj4g
SW4gc3VtbWFyeTsgRGV0ZXJtaW5lIGluIHRoZSBKSVQgaWYgd2UncmUgbGVhdmluZyBCUEYtbGFu
ZCwgYW5kIG5lZWQgdG8KPiBtb3ZlIHRoZSBUQ0MgdG8gYSBjYWxsZWUtc2F2ZWQgcmVnLCBvciBu
b3QsIGFuZCBzYXZlIHVzIGEgYnVuY2ggb2Ygc3RhY2sKPiBzdG9yZS9sb2Fkcy4KPiAKClZhbHVh
YmxlIHNjaGVtZS4gQnV0IHdlIG5lZWQgdG8gY29uc2lkZXIgVENDIGJhY2sgcHJvcGFnYXRpb24u
IExldCBtZSAKc2hvdyBhbiBleGFtcGxlIG9mIGNhbGxpbmcgc3VicHJvZyB3aXRoIFRDQyBzdG9y
ZWQgaW4gQTY6Cgpwcm9nMShUQ0M9PTEpewogICAgIHN1YnByb2cxKFRDQz09MSkKICAgICAgICAg
LT4gdGFpbGNhbGwxKFRDQz09MCkKICAgICAgICAgICAgIC0+IHN1YnByb2cyKFRDQz09MCkKICAg
ICBzdWJwcm9nMyhUQ0M9PTApIDwtLS0gc2hvdWxkIGJlIFRDQz09MQogICAgICAgICAtXC0+IHRh
aWxjYWxsMiA8LS0tIGNhbid0IGJlIGNhbGxlZAp9CgpXZSBjYWxsIHByb2cxIGFuZCBUQ0MgaXMg
MS4gcHJvZzEgaGFzIHR3byBzdWJwcm9ncywgc3VicHJvZzEgYW5kIApzdWJwcm9nMy4gc3VicHJv
ZzEgY2FsbHMgdGFpbGNhbGwxIGFuZCBUQ0MgYmVjb21lIHRvIDAuIHRhaWxjYWxsMSBjYWxsIApz
dWJwcm9nMiBhbmQgdGhlbiByZXR1cm4gdG8gcHJvZzEgd2l0aCBUQ0MgaXMgMC4gQXQgdGhpcyB0
aW1lLCBzdWJwcm9nMyAKY2Fubm90IGNhbGwgdGFpbGNhbGwyIGJlY2F1c2UgVENDIGlzIDAuIEJ1
dCBUQ0Mgc2hvdWxkIGJlIDEgaGVyZS4KClRoZSBxdWVzdGlvbiBpcyBBNiBjYW5ub3QgYmUgc2F2
ZWQgYW5kIHJlc3RvcmVkLCB0aGF0IGlzIHdoeSBJIHNhdmVkIEE2IAppbiBzdGFjayBhdCBwcm9s
b2d1ZSwgYW5kIHJlc3RvcmVkIGF0IGVwaWxvZ3VlLgoKPiAKPiBCasO2cm4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
