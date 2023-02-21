Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC13DC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FN4T0+w8Vfkyu65vmXHayTnmfqEY0zhKAgUxWWVPfPE=; b=gyyBsuFNA719LW
	EzmDkBach8LlczSj7dMZTF9MMdSQ+mfLkfHGeurpr4xvv4hyk14lpqBzjyFRnQ5lw6Elijza4/6fr
	T0TqtoBADrD3tJ2IvH9vAGrapRFSURXyzFg7jrkGPAXTzoS6a1CypYvW+/yB81SwYL48ZAjbmEwnc
	ZMUVT9PpFo07w5FJi+k2jQtZjcdn1dglDk5fcfUMDVhgqMwoCEXJBkB2KJop2+Y4Uxxp56oDRn2vw
	XnUhbOvr1fhysBkEdiMQIRy427PoSsRFcK93WR271s57wzQtQATajLA7ChHNaopIicZTA0kTM+xTW
	VhaCEGu86gc8krR39RLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUuk-008oma-Bc; Tue, 21 Feb 2023 15:50:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUug-008ojx-Gb
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 15:50:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E85861072;
	Tue, 21 Feb 2023 15:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62303C433D2;
	Tue, 21 Feb 2023 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676994638;
	bh=mz1tP6BevVUDwP7gGFCXZ6st2qmh6ulbhacqzwUvUso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GBgce3wlKR5rpfnz/ODQ0zKLchmDKoi2uiK6MkclthkVW7rUR/b0V8MXCYj6wrIiD
	 V/lZbK5MeV07fqkb+EHzIP0wW+rTmvtDsIpbSLtHUf9Tc75UK9YYj7wqCWlyH9u9Fw
	 X7Y0kxQll0sSTor+6HssmDImeEoQXk4RIiIp4cTXOiOfYxIv4TOWCJasfcrGtsZVri
	 6GJl5n+t3WDeVtcz+YqMxWs3Xfzs7QGek1ngsZnUb0Z3QB0gy63MghJFdy66j/6muU
	 r+Q059k6Ov+NN9fgSbCbmkujKargusrMpITLkizyFvGsdsSWu5khC1Qvpn5/Lr1+pM
	 Z4mHNBdvkQhog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/4] riscv: Introduce KASLR
In-Reply-To: <20230215145113.465558-1-alexghiti@rivosinc.com>
References: <20230215145113.465558-1-alexghiti@rivosinc.com>
Date: Tue, 21 Feb 2023 16:50:36 +0100
Message-ID: <878rgrqapf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_075042_633040_398E569B 
X-CRM114-Status: GOOD (  15.85  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoZSBm
b2xsb3dpbmcgS0FTTFIgaW1wbGVtZW50YXRpb24gYWxsb3dzIHRvIHJhbmRvbWl6ZSB0aGUga2Vy
bmVsIG1hcHBpbmc6Cj4KPiAtIHZpcnR1YWxseTogd2UgZXhwZWN0IHRoZSBib290bG9hZGVyIHRv
IHByb3ZpZGUgYSBzZWVkIGluIHRoZSBkZXZpY2UtdHJlZQo+IC0gcGh5c2ljYWxseTogb25seSBp
bXBsZW1lbnRlZCBpbiB0aGUgRUZJIHN0dWIsIGl0IHJlbGllcyBvbiB0aGUgZmlybXdhcmUgdG8K
PiAgIHByb3ZpZGUgYSBzZWVkIHVzaW5nIEVGSV9STkdfUFJPVE9DT0wuIGFybTY0IGhhcyBhIHNp
bWlsYXIgaW1wbGVtZW50YXRpb24KPiAgIGhlbmNlIHRoZSBwYXRjaCAzIGZhY3Rvcml6ZXMgS0FT
TFIgcmVsYXRlZCBmdW5jdGlvbnMgZm9yIHJpc2N2IHRvIHRha2UKPiAgIGFkdmFudGFnZS4KPgo+
IFRoZSBuZXcgdmlydHVhbCBrZXJuZWwgbG9jYXRpb24gaXMgbGltaXRlZCBieSB0aGUgZWFybHkg
cGFnZSB0YWJsZSB0aGF0IG9ubHkKPiBoYXMgb25lIFBVRCBhbmQgd2l0aCB0aGUgUE1EIGFsaWdu
bWVudCBjb25zdHJhaW50LCB0aGUga2VybmVsIGNhbiBvbmx5IHRha2UKPiA8IDUxMiBwb3NpdGlv
bnMuCj4KPiBOb3RlIHRoYXQgdGhlIHBhdGNoICJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2Vz
IGZvciB0aGUgbGluZWFyCj4gbWFwcGluZyIgaXMgbmVjZXNzYXJ5IHRvIHJldHJpZXZlIHRoZSBt
ZW1vcnkgYmVsb3cgdGhlIHBoeXNpY2FsIGtlcm5lbAo+IGFkZHJlc3MsIHNvIHRoYXQgdGhlIEVG
SSBzdHViIGRvZXMgbm90IGhhdmUgdG8gdHJ5IHRvIHJlbG9jYXRlIHRoZSBrZXJuZWwKPiBhcyBj
bG9zZSBhcyBwb3NzaWJsZSB0byB0aGUgc3RhcnQgb2YgZHJhbS4KPgo+IFRoaXMgcGF0Y2hzZXQg
aXMgcmViYXNlZCBvbiB0b3Agb2Y6Cj4KPiBJbnRyb2R1Y2UgNjRiIHJlbG9jYXRhYmxlIGtlcm5l
bCAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDIxNTE0MzYyNi40NTM0OTEtMS1h
bGV4Z2hpdGlAcml2b3NpbmMuY29tLykKPiBSSVNDLVYga2FzYW4gcmV3b3JrIChodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sL1k2VFR2a3UlMkZ5dVNqbTQyakBzcHVkL1QvKQo+IHJpc2N2OiBV
c2UgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyAoaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIzMDEyNTExNDIyOS5ocmhzeXc0YWVncm5tb2F1QG9yZWwvVC8p
Cj4gcmlzY3Y6IEFsbG93IHRvIGRvd25ncmFkZSBwYWdpbmcgbW9kZSBmcm9tIHRoZSBjb21tYW5k
IGxpbmUgKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FIVlh1YmplU012ZlRQbnZybllS
dXBPR3g2K3ZVdlVHZlJTM3BpVGVvPVRIMmNIS05nQG1haWwuZ21haWwuY29tLykKPiBiYXNlLWNv
bW1pdC10YWc6IHY2LjItcmM3Cj4KPiBUaGlzIHBhdGNoc2V0IHdhcyB0ZXN0ZWQgd2l0aCB1LWJv
b3QgYm9vdHRpbWUgc2VydmljZSBmb3IgdGhlIHNlZWQgb246Cj4gLSB1YnVudHUgZGVmY29uZmln
ICsga2FzYW4gb3V0bGluZSAoc3YzOSwgc3Y0OCwgc3Y1Nyk6IE9LCj4gLSB1YnVudHUgZGVmY29u
ZmlnICsga2FzYW4gaW5saW5lIChzdjM5LCBzdjQ4LCBzdjU3KTogT0sKPiAtIHVidW50dSBkZWZj
b25mZyAoc3YzOSwgc3Y0OCwgc3Y1Nyk6IE9LCgpJJ3ZlIHRha2VuIHRoZSBzZXJpZXMgZm9yIGEg
c3BpbiAocWVtdSB1LWJvb3QgVUVGSSwgYW5kIHFlbXUgbm9uLVVFRkkpLApvbi10b3Agb2YgdGhl
IHBhdGNoZXMgb3V0bGluZSBhYm92ZSwgYnV0IHdpdGggNi4yIHByb3Blci4KCkZvciB0aGUgc2Vy
aWVzOgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpUZXN0
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
