Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3816C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oL737lS1FRE8JMJ0b/F4QiIHh0WIWbqjiwjajVsF4dA=; b=12PeX0XkpNaqCb
	oG1vJujsOm5qOcOQp3/Mk1+NDMxBy2mjGVnHjUTb60am/pGvLPOzhcXiuyE7uIBB5QkAcAIu2tB8Q
	yi2ciSM0gKLGrkks/Y+wNBFXy+btynNZZaSdbvL2lT+KPtKzR+N4/GrpJjHT1zvpp8d7/y7JptekC
	/PGxJTX/gVq/ecIX2VHvoSDL0qQHtfJAjZwKb+MQWQzCerB4qNCcxhpFgQWwfzqRbkix6idjTKX9i
	CnSdpcUe4VTB5Jt32J393YLHAYeIcShzpoWoDK/ZoZtMyTKYC4KhIspaPUsbzEHxFzOQS/kKeFmbv
	+DAWDke65KRNYvKNv30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvRO-00CQoi-2E;
	Mon, 22 Jan 2024 14:38:22 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvRK-00CQkD-34
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 14:38:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TJXrL3c72z4f3jrn
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:37:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 61AA51A0272
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:37:58 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgC3iBHEfa5ltWuLBg--.55325S2;
	Mon, 22 Jan 2024 22:37:58 +0800 (CST)
Message-ID: <baffbab8-721f-462a-8b58-64972f5eae70@huaweicloud.com>
Date: Mon, 22 Jan 2024 22:37:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
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
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <87il3lqvye.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87il3lqvye.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: cCh0CgC3iBHEfa5ltWuLBg--.55325S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr47Zw1rtr1xGF4kuFW5GFg_yoW8uF4Dpa
	n5Kwn0kF1vq3WDWry0qa18XF13t3yvq3srGFWFgrWF9a9IqrykKF15ta4Yy34ayrsY9r43
	AFZ093Wqy3W8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_063819_391598_7E4D38CC 
X-CRM114-Status: GOOD (  10.72  )
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

CgpPbiAyMDI0LzEvMjIgMjI6MzMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEFkZCBaYmIgc3VwcG9ydCBbMF0g
dG8gb3B0aW1pemUgY29kZSBzaXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJVC4KPj4gTWVh
bndoaWxlLCBhZGp1c3QgdGhlIGNvZGUgZm9yIHVuaWZpY2F0aW9uIGFuZCBzaW1wbGlmaWNhdGlv
bi4gVGVzdHMKPj4gdGVzdF9icGYua28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFz
IHdlbGwgYXMgdGhlIHJlbGF0aXZlCj4+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4KPj4KPj4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlwL3JlbGVhc2VzL2Rv
d25sb2FkLzEuMC4wL2JpdG1hbmlwLTEuMC4wLTM4LWc4NjVlN2E3LnBkZiBbMF0KPj4KPj4gdjMg
cmVzZW5kOgo+PiAtIHJlc2VuZCBmb3IgbWFpbCBiZSB0cmVhdGVkIGFzIHNwYW0uCj4+Cj4+IHYz
Ogo+PiAtIENoYW5nZSB0byBlYXJseS1leGl0IGNvZGUgc3R5bGUgYW5kIG1ha2UgY29kZSBtb3Jl
IGV4cGxpY2l0Lgo+IAo+IExlaHVpLAo+IAo+IFNvcnJ5IGZvciB0aGUgZGVsYXkuIEknbSBjaGFz
aW5nIGEgc3RydWN0X29wcyBSSVNDLVYgQlBGIHJlZ3Jlc3Npb24gaW4KPiA2LjgtcmMxLCBJIHdp
bGwgbmVlZCB0byB3cmFwIG15IGhlYWQgYXJvdW5kIHRoYXQgcHJpb3IgcmV2aWV3aW5nCj4gcHJv
cGVybHkuCj4gCgpPaCwgSSBhbHNvIGZvdW5kIHRoZSBwcm9ibGVtIHdpdGggc3RydWN0IG9wcyBh
bmQgZml4ZWQgaXQKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IApiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggNDJjZmQxZWQyOTVlLi41
YzRlMGFjMzg5ZDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
KysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtNzk1LDYgKzc5NSw3IEBA
IHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IApicGZfdHJh
bXBfaW1hZ2UgKmltLAogICAgICAgICBzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICpmZW50cnkgPSAm
dGxpbmtzW0JQRl9UUkFNUF9GRU5UUlldOwogICAgICAgICBzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtz
ICpmZXhpdCA9ICZ0bGlua3NbQlBGX1RSQU1QX0ZFWElUXTsKICAgICAgICAgc3RydWN0IGJwZl90
cmFtcF9saW5rcyAqZm1vZF9yZXQgPSAKJnRsaW5rc1tCUEZfVFJBTVBfTU9ESUZZX1JFVFVSTl07
CisgICAgICAgYm9vbCBpc19zdHJ1Y3Rfb3BzID0gZmxhZ3MgJiBCUEZfVFJBTVBfRl9JTkRJUkVD
VDsKICAgICAgICAgdm9pZCAqb3JpZ19jYWxsID0gZnVuY19hZGRyOwogICAgICAgICBib29sIHNh
dmVfcmV0OwogICAgICAgICB1MzIgaW5zbjsKQEAgLTg3OCw3ICs4NzksNyBAQCBzdGF0aWMgaW50
IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCAKYnBmX3RyYW1wX2ltYWdlICpp
bSwKCiAgICAgICAgIHN0YWNrX3NpemUgPSByb3VuZF91cChzdGFja19zaXplLCAxNik7CgotICAg
ICAgIGlmIChmdW5jX2FkZHIpIHsKKyAgICAgICBpZiAoIWlzX3N0cnVjdF9vcHMpIHsKICAgICAg
ICAgICAgICAgICAvKiBGb3IgdGhlIHRyYW1wb2xpbmUgY2FsbGVkIGZyb20gZnVuY3Rpb24gZW50
cnksCiAgICAgICAgICAgICAgICAgICogdGhlIGZyYW1lIG9mIHRyYWNlZCBmdW5jdGlvbiBhbmQg
dGhlIGZyYW1lIG9mCiAgICAgICAgICAgICAgICAgICogdHJhbXBvbGluZSBuZWVkIHRvIGJlIGNv
bnNpZGVyZWQuCkBAIC05OTgsNyArOTk5LDcgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9i
cGZfdHJhbXBvbGluZShzdHJ1Y3QgCmJwZl90cmFtcF9pbWFnZSAqaW0sCgogICAgICAgICBlbWl0
X2xkKFJWX1JFR19TMSwgLXNyZWdfb2ZmLCBSVl9SRUdfRlAsIGN0eCk7CgotICAgICAgIGlmIChm
dW5jX2FkZHIpIHsKKyAgICAgICBpZiAoIWlzX3N0cnVjdF9vcHMpIHsKICAgICAgICAgICAgICAg
ICAvKiB0cmFtcG9saW5lIGNhbGxlZCBmcm9tIGZ1bmN0aW9uIGVudHJ5ICovCiAgICAgICAgICAg
ICAgICAgZW1pdF9sZChSVl9SRUdfVDAsIHN0YWNrX3NpemUgLSA4LCBSVl9SRUdfU1AsIGN0eCk7
CiAgICAgICAgICAgICAgICAgZW1pdF9sZChSVl9SRUdfRlAsIHN0YWNrX3NpemUgLSAxNiwgUlZf
UkVHX1NQLCBjdHgpOwoKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
