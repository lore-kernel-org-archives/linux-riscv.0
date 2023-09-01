Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EECA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eojjNvIyKgysB2j2UCVLRExcIYA0F51U2sTVpPvMh0s=; b=MmsHrnrml3zefY
	T4uEpXmCSXYk0UZCL9HJf0avuLURqEKlwWmR3glKCRtgoAfMrZPkPqcqnr/Wg+1gxx4Wm7hEF6EnZ
	1EP3StHRjWhPySCaUCzlLVy/7UGGKbra5OQpKLPkf/cIw8tvMspA5I39qoWN2CCW+X831VKvbeuWh
	p1ReVfBGZ1ovbtMBjpxRG0KpZRnAFe3bBhjUIHWpoQTvTyo7sZcFS6EPRPjMDXnlCrF1xmXLigxW+
	NY1Zuvv49STCNuvHbpIehGZDtyGHM4/uk/BYImJSaf5Fgk3cyPAvDxR/1+V7kYATJZfYIcNOM0+FT
	xGaHkW9BT8iO20VjjdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc06K-00Gimc-2B;
	Fri, 01 Sep 2023 09:06:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc06G-00GilO-39
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 09:05:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AADEBB823FC;
	Fri,  1 Sep 2023 09:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED147C433C7;
	Fri,  1 Sep 2023 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693559151;
	bh=bqIQfHHns56XlqLjVZklK3xIcE+Q1rtzJas0HrLow6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z9SbDqJW8wKthxnD3bt/OkJ4t/JXVjKo6TwW0NTQnqvHfiVkxk61U0X55NvjAAixa
	 Sh4kff34C0uwBzH1gwTENhVUNN5N6ybV7YFm6gIctrKWCVecUsJ97ihOy71pxnn60l
	 rvHMFcPadyX10OANQlRDRdHE5cmV5z2d+Z4Rs8Oot5TQe0OxRn7jg3MdZNkkEPUV/T
	 Ri9qnDPU7+GVCZcMo6seO0lo6hO4g/QrzEvPOGtp4RBk5HZTQ2EDmSLtQ3iFR48+S6
	 7AvgoID8Szf61kM1Iy/F5fcw/b+L5Zwi4ntACILsV/QhH3tDVGThW0FzTEky0p4TJM
	 QLgbvHkdfmpow==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
 jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com,
 elver@google.com, glider@google.com, cyphar@cyphar.com,
 kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH v4] riscv: add userland instruction dump
 to RISC-V splats
In-Reply-To: <CAEEQ3wmL90oOZcmpv8G34u7kg44zGscpHJiiRHLi=_LAm=C1jg@mail.gmail.com>
References: <20230818121504.60492-1-cuiyunhui@bytedance.com>
 <878ra8o4qa.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3wmL90oOZcmpv8G34u7kg44zGscpHJiiRHLi=_LAm=C1jg@mail.gmail.com>
Date: Fri, 01 Sep 2023 11:05:48 +0200
Message-ID: <87msy6p8k3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_020557_436096_85950386 
X-CRM114-Status: GOOD (  14.78  )
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

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSGkgQmrDtnJu
77yMCj4KPiBPbiBGcmksIEF1ZyAxOCwgMjAyMyBhdCA5OjMz4oCvUE0gQmrDtnJuIFTDtnBlbCA8
Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPiB3cml0ZXM6Cj4+Cj4+ID4gQWRkIHVzZXJsYW5kIGluc3RydWN0aW9uIGR1bXAg
YW5kIHJlbmFtZSBkdW1wX2tlcm5lbF9pbnN0cigpCj4+ID4gdG8gZHVtcF9pbnN0cigpLgo+PiA+
Cj4+ID4gQW4gZXhhbXBsZToKPj4gPiBbICAgIDAuODIyNDM5XSBGcmVlaW5nIHVudXNlZCBrZXJu
ZWwgaW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogNjkxNksKPj4gPiBbICAgIDAuODIzODE3XSBSdW4g
L2luaXQgYXMgaW5pdCBwcm9jZXNzCj4+ID4gWyAgICAwLjgzOTQxMV0gaW5pdFsxXTogdW5oYW5k
bGVkIHNpZ25hbCA0IGNvZGUgMHgxIGF0IDB4MDAwMDAwMDAwMDA1YmUxOCBpbiBiYlsxMDAwMCs1
ZmIwMDBdCj4+ID4gWyAgICAwLjg0MDc1MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0
YWludGVkIDUuMTQuMC1yYzQtMDAwNDktZ2JkNjQ0MjkwYWE3Mi1kaXJ0eSAjMTg3Cj4+ID4gWyAg
ICAwLjg0MTM3M10gSGFyZHdhcmUgbmFtZTogICwgQklPUwo+PiA+IFsgICAgMC44NDE3NDNdIGVw
YyA6IDAwMDAwMDAwMDAwNWJlMTggcmEgOiAwMDAwMDAwMDAwMDc5ZTc0IHNwIDogMDAwMDAwM2Zm
ZmNhZmRhMAo+PiA+IFsgICAgMC44NDIyNzFdICBncCA6IGZmZmZmZmZmODE2ZTlkYzggdHAgOiAw
MDAwMDAwMDAwMDAwMDAwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgICAgMC44NDI5NDdd
ICB0MSA6IDAwMDAwMDNmZmZjOWZkZjAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogMDAwMDAw
MDAwMDAwMDAwMAo+PiA+IFsgICAgMC44NDM0MzRdICBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAg
OiAwMDAwMDAzZmZmY2EwMTkwIGExIDogMDAwMDAwM2ZmZmNhZmUxOAo+PiA+IFsgICAgMC44NDM4
OTFdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAw
MDAwMDAwMDAwMDAwMAo+PiA+IFsgICAgMC44NDQzNTddICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAg
YTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgICAgMC44
NDQ4MDNdICBzMiA6IDAwMDAwMDAwMDAwMDAwMDAgczMgOiAwMDAwMDAwMDAwMDAwMDAwIHM0IDog
MDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgICAgMC44NDUyNTNdICBzNSA6IDAwMDAwMDAwMDAwMDAw
MDAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgICAg
MC44NDU3MjJdICBzOCA6IDAwMDAwMDAwMDAwMDAwMDAgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMx
MDogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgICAgMC44NDYxODBdICBzMTE6IDAwMDAwMDAwMDBk
MTQ0ZTAgdDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsg
ICAgMC44NDY2MTZdICB0NSA6IDAwMDAwMDAwMDAwMDAwMDAgdDYgOiAwMDAwMDAwMDAwMDAwMDAw
Cj4+ID4gWyAgICAwLjg0NzIwNF0gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMDIwIGJhZGFkZHI6IDAw
MDAwMDAwZjAwMjgwNTMgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDIKPj4gPiBbICAgIDAuODQ4MjE5
XSBDb2RlOiBmMDZmIGZmNWYgMzgyMyBmYTExIDAxMTMgZmIwMSAyZTIzIDAyMDEgMDI5MyAwMDAw
ICg4MDUzKSBmMDAyCj4+ID4gWyAgICAwLjg1MTAxNl0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAwMDQKPj4gPgo+PiA+
IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+Pgo+
PiBOaWNlIQo+Pgo+PiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gV2hlbiBjYW4gdGhpcyBwYXRjaCBiZSBhcHBsaWVkIHRvIHRoZSBsaW51eC1uZXh0
IGJyYW5jaD8KCkl0IGxvb2tzIGxpa2UgeW91J3JlIGdldHRpbmcgYSBzcGFyc2Ugd2FybmluZyBv
biB0aGUgcGF0Y2ggWzFdLCBhbmQKdGhhdCdzIHByb2JhYmx5IHdoeSBpdCBoYXNuJ3QgYmVlbiBj
b25zaWRlcmVkLiBZb3UgbmVlZCBzb21ldGhpbmcgbGlrZToKCi0tCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCA2
OWI1ZDE4YjVhZTkuLmM1MzY0MTMxYjhiZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC0zNCw3ICszNCw3IEBA
IGludCBzaG93X3VuaGFuZGxlZF9zaWduYWxzID0gMTsKIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0so
ZGllX2xvY2spOwogCiAjZGVmaW5lIGdldF91c2VyX25vZmF1bHQodmFsLCBwdHIpICh7ICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgY29uc3QgdHlwZW9mKHZhbCkgKl9fZ2tfcHRy
ID0gKHB0cik7ICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgY29uc3QgdHlwZW9mKHZhbCkg
X191c2VyICpfX2drX3B0ciA9IChfX2ZvcmNlIGNvbnN0IHR5cGVvZih2YWwpIF9fdXNlciAqKShw
dHIpOyBcCiAgICAgICAgY29weV9mcm9tX3VzZXJfbm9mYXVsdCgmKHZhbCksIF9fZ2tfcHRyLCBz
aXplb2YodmFsKSk7XAogfSkKLS0KCklESywgbWF5YmUgaXQgd29ydGggcmVtb3ZpbmcgdGhlIGRl
ZmluZSBhbGwgdG9nZXRoZXIsIGFuZCBqdXN0IG9wZW4gY29kZQppdC4KCldoZW4geW91J3JlIHN1
Ym1pdHRpbmcgcGF0Y2hlcywgaXQncyBhIGdvb2QgdGhpbmcgdG8gdHJhY2sgcGF0Y2h3b3JrIGZv
cgp3YXJuaW5ncy9lcnJvcnMuCgoKQmrDtnJuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMwODE4MTIxNTA0LjYwNDkyLTEtY3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
