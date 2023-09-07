Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065AFEC8750
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfFd/4UZWfqwzqjWWU/WKUKidOJf6mRdm1UVMmPMnnw=; b=kQ/81rJkNnesBn
	AKForCRMXg8B6Oawf9uwxKMNpgZHlFSvF6GrFfXQd2yrrPmjCpCxM1HaLkD83dzmmTcsiEjJx9yKv
	/sXnRSFt7EPfjxzbka5vyPNu9du6XcuDRRhy4qouDBHWYUC1x6vBNYvZc65hbpfQviQZYqiKa+Vod
	9TMV5eNPsBc9fBlTLsVHdSI/QV99DHtdKV0/Mqctu/1tmrwvRv0zgyrEKM/7ifSVdEA7hUN8+szRD
	8o5v0FQcJ8VQ403Lw51jfqPMJtgWS4qEr88XGEwvb8bK5NQK5p6HhB73gZTT9jP1/lgTfSdze62K3
	vQG3g+9goJxxvjRhb8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeK0b-00CZZX-3A;
	Thu, 07 Sep 2023 18:45:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeK0Y-00CZZB-2d
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 18:45:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3803461366;
	Thu,  7 Sep 2023 18:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199AEC433C8;
	Thu,  7 Sep 2023 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694112336;
	bh=QXlLEPcw9T8cbpBpm+xTTvQEb5fFY7BYBMzEoncfs1w=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=FQYSpc/YwsYLsLl4MwCTQYuIUJv5RdIsiXNP7TtdCi00h3kOcAH8oGMaWFtF4BSID
	 d6pwrhst3nsRHariq4NIshjUuJbHmGbvpNxewFuZA8eEJloTom+jhxy+LLRBWiooOv
	 xBJXO2gM5PFlO2x8ghXkwnSEzxsXHKqV1PXngxt3643B2ILJyVyxDXR9g0K6HNBXWt
	 zwzg84GXERQnqaqPtFlRTyKd4PTGD5PEPHWJ426+Oo5JNe1nsHSycPR8XCcbxcBAoH
	 PoQ2GJnpg5pVvYGIOzSwcALE3lL0Vjl2SmCPf+LZSQVFBhC5kKsnD9y9QM6KYAguTR
	 huvv4BEyKCNjw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, jszhang@kernel.org,
 andy.chiu@sifive.com, cuiyunhui@bytedance.com,
 dave.hansen@linux.intel.com, elver@google.com, glider@google.com,
 cyphar@cyphar.com, kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] riscv: add userland instruction dump to RISC-V splats
In-Reply-To: <20230901123043.73700-1-cuiyunhui@bytedance.com>
References: <20230901123043.73700-1-cuiyunhui@bytedance.com>
Date: Thu, 07 Sep 2023 20:45:33 +0200
Message-ID: <878r9hvn3m.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_114538_962440_287C673F 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gQWRkIHVzZXJs
YW5kIGluc3RydWN0aW9uIGR1bXAgYW5kIHJlbmFtZSBkdW1wX2tlcm5lbF9pbnN0cigpCj4gdG8g
ZHVtcF9pbnN0cigpLgo+Cj4gQW4gZXhhbXBsZToKPiBbICAgIDAuODIyNDM5XSBGcmVlaW5nIHVu
dXNlZCBrZXJuZWwgaW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogNjkxNksKPiBbICAgIDAuODIzODE3
XSBSdW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gWyAgICAwLjgzOTQxMV0gaW5pdFsxXTogdW5o
YW5kbGVkIHNpZ25hbCA0IGNvZGUgMHgxIGF0IDB4MDAwMDAwMDAwMDA1YmUxOCBpbiBiYlsxMDAw
MCs1ZmIwMDBdCj4gWyAgICAwLjg0MDc1MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0
YWludGVkIDUuMTQuMC1yYzQtMDAwNDktZ2JkNjQ0MjkwYWE3Mi1kaXJ0eSAjMTg3Cj4gWyAgICAw
Ljg0MTM3M10gSGFyZHdhcmUgbmFtZTogICwgQklPUwo+IFsgICAgMC44NDE3NDNdIGVwYyA6IDAw
MDAwMDAwMDAwNWJlMTggcmEgOiAwMDAwMDAwMDAwMDc5ZTc0IHNwIDogMDAwMDAwM2ZmZmNhZmRh
MAo+IFsgICAgMC44NDIyNzFdICBncCA6IGZmZmZmZmZmODE2ZTlkYzggdHAgOiAwMDAwMDAwMDAw
MDAwMDAwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDI5NDddICB0MSA6IDAwMDAw
MDNmZmZjOWZkZjAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogMDAwMDAwMDAwMDAwMDAwMAo+
IFsgICAgMC44NDM0MzRdICBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiAwMDAwMDAzZmZmY2Ew
MTkwIGExIDogMDAwMDAwM2ZmZmNhZmUxOAo+IFsgICAgMC44NDM4OTFdICBhMiA6IDAwMDAwMDAw
MDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsg
ICAgMC44NDQzNTddICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAw
IGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDQ4MDNdICBzMiA6IDAwMDAwMDAwMDAw
MDAwMDAgczMgOiAwMDAwMDAwMDAwMDAwMDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAg
MC44NDUyNTNdICBzNSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3
IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDU3MjJdICBzOCA6IDAwMDAwMDAwMDAwMDAw
MDAgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44
NDYxODBdICBzMTE6IDAwMDAwMDAwMDBkMTQ0ZTAgdDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDog
MDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDY2MTZdICB0NSA6IDAwMDAwMDAwMDAwMDAwMDAg
dDYgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgICAwLjg0NzIwNF0gc3RhdHVzOiAwMDAwMDAwMjAw
MDAwMDIwIGJhZGFkZHI6IDAwMDAwMDAwZjAwMjgwNTMgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDIK
PiBbICAgIDAuODQ4MjE5XSBDb2RlOiBmMDZmIGZmNWYgMzgyMyBmYTExIDAxMTMgZmIwMSAyZTIz
IDAyMDEgMDI5MyAwMDAwICg4MDUzKSBmMDAyCj4gWyAgICAwLjg1MTAxNl0gS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAw
MDQKPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgMTkgKysrKysrKysrKysrKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+IGluZGV4IGY3OThjODUzYmVkZS4uOTIzYjQ5YzM4OTg1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gQEAgLTMzLDcgKzMzLDE5IEBAIGludCBzaG93X3VuaGFuZGxlZF9zaWduYWxz
ID0gMTsKPiAgCj4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soZGllX2xvY2spOwo+ICAKPiAtc3Rh
dGljIHZvaWQgZHVtcF9rZXJuZWxfaW5zdHIoY29uc3QgY2hhciAqbG9nbHZsLCBzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiArc3RhdGljIGludCBjb3B5X2NvZGUoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHUxNiAqdmFsLCBjb25zdCB1MTYgKmluc25zKQo+ICt7Cj4gKwlpZiAoIXVzZXJfbW9kZShyZWdz
KSkKPiArCQlyZXR1cm4gZ2V0X2tlcm5lbF9ub2ZhdWx0KCp2YWwsIGluc25zKTsKPiArCj4gKwkv
KiBUaGUgdXNlciBzcGFjZSBjb2RlIGZyb20gb3RoZXIgdGFza3MgY2Fubm90IGJlIGFjY2Vzc2Vk
LiAqLwo+ICsJaWYgKHJlZ3MgIT0gdGFza19wdF9yZWdzKGN1cnJlbnQpKQo+ICsJCXJldHVybiAt
RVBFUk07Cj4gKwo+ICsJcmV0dXJuIGNvcHlfZnJvbV91c2VyX25vZmF1bHQodmFsLCBpbnNucywg
c2l6ZW9mKCp2YWwpKTsKCkhtbSwgSSB0aGluayB5b3UgbWlzc2VkIHRoZSBhY3R1YWwgcHJvYmxl
bSBpbiBbMV0uIEknbSBzdGlsbCBnZXR0aW5nOgoKICB8ICAgQ0hFQ0sgICBhcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCiAgfCBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOjQ2OjQ0OiB3YXJuaW5n
OiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAyIChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMp
CiAgfCBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOjQ2OjQ0OiAgICBleHBlY3RlZCB2b2lkIGNv
bnN0IFtub2RlcmVmXSBfX3VzZXIgKnNyYwogIHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo0
Njo0NDogICAgZ290IHVuc2lnbmVkIHNob3J0IGNvbnN0IFt1c2VydHlwZV0gKmluc25zCgpUaGlz
IG9ubHkgbW92ZXMgdGhlIHByb2JsZW0uIFlvdSBuZWVkcyB0byBjYXN0IHRoZSAiaW5zbiIgd2l0
aCBzb21ldGhpbmcKbGlrZToKCiAgfCBjb25zdCB2b2lkIF9fdXNlciAqdWFkZHIgPSAgKF9fZm9y
Y2UgY29uc3Qgdm9pZCBfX3VzZXIgKilpbnNuOwoKLi4uYW5kIHBhc3MgdWFkZHIgdG8gY29weV9m
cm9tX3VzZXJfbm9mYXVsdCgpLgoKICB8IGxvbmcgY29weV9mcm9tX3VzZXJfbm9mYXVsdCh2b2lk
ICpkc3QsIGNvbnN0IHZvaWQgX191c2VyICpzcmMsIHNpemVfdCBzaXplKTsKCk5vdGljZSB0aGUg
Il9fdXNlciIgdGFnIHRvIHNyYy4KCgpCasO2cm4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi84N21zeTZwOGszLmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8u
dXMvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
