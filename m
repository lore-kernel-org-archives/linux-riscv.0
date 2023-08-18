Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953D9C71147
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmbKBvgAYgViAxSuPrsdwkr8+GmHR3r19mGaV+8uuGw=; b=ihiVXhGprsKLTH
	xreS4GVZHzO0TaMBeOpHYqAXrFolTSdcGzDIA2LbmEo6MfK406ipwbCLnE8/CZ+/O7TyUrWV0jsQf
	CyNjJGVEWl42fwV9sBzQwd08Rp3FyHZRW7K/yGEmueVni31jj8orSnmOEy/m0A26TB5iFoLWXjjnF
	PrEPMxXy893KvDEIbxHxw1kVhPaFXi3DG4W5v0O//lgc9zzWFmY+/GtFAGA1TF6wS3JwCQdrXY6Dq
	rzrkkq5R7rrXDNIqaufqJ2cV2ahp5nu6UarlxXNxow2xA/Fi+apQsLe9qIY6wwpIRuZmC3V2Byg9O
	plSobHDaa3p1ZdnR22cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzbA-009On0-1f;
	Fri, 18 Aug 2023 13:33:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzb7-009Omj-2P
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:33:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 713F460E15;
	Fri, 18 Aug 2023 13:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6155DC433C7;
	Fri, 18 Aug 2023 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692365583;
	bh=nQkSvjw/b52/PsLHpuHKay9SWoBTTMGR4P0aQ3yKgKg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=r+Uw3TaYEO8U6g7zP7fe1guf5B0kFPn65KoDCs+KY7uqsyZiQW75+lcWJffWHI1sc
	 E91kdgDxcCMebfX4jRAaQXOmd40NMtNw0ArIcuF+yNcUj0tZEdwMIPcqvGaovI582/
	 OQkYIsCOb78TaU1yZ0aFAqcBCxE7nIi9nbLadPBUoQ0S6JSJ8Jbxb0nwO8ewg715V2
	 jDBmzkcNZrA3WEZoOh+BmEVoy8kwicDbd8WjLm57SFk5VOHzVtfJjU8QN94Grr+vOw
	 2pi2lQ4hQtbh4+E6i9APbK1MhUDYi1Aygn0hbv1xFjaoYgLa64/q1ici8YS1+7UDv2
	 Qrk+RWWJy/GzA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, jszhang@kernel.org,
 andy.chiu@sifive.com, cuiyunhui@bytedance.com,
 dave.hansen@linux.intel.com, elver@google.com, glider@google.com,
 cyphar@cyphar.com, kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: add userland instruction dump to RISC-V splats
In-Reply-To: <20230818121504.60492-1-cuiyunhui@bytedance.com>
References: <20230818121504.60492-1-cuiyunhui@bytedance.com>
Date: Fri, 18 Aug 2023 15:33:01 +0200
Message-ID: <878ra8o4qa.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_063305_846771_2B438471 
X-CRM114-Status: UNSURE (   6.22  )
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
PgoKTmljZSEKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
