Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969F0C54787
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEQyvHmy7Km3I/qLGyiEzNpgKBAFOPSJ4RIc5ir4fQM=; b=Jno8WgmEK1p5zt
	eRQUdUY3NRpMb4N8x/TbfWuHLP4KCNw2ztI3GzUG0/Dc9lyBsL6zYBI7zhqnIb/TPA1PSiBvPY6q+
	bMMSQsxTCWMe6iaMLBP1SYGBNRjMKUSpfzy7LavrmwMBo9ZE8+Cpv9E+VX2s10X9phhQRbbMEao7x
	Wweigdjsoa2rHyQoqxE5qxLWatnpzLuLOLUYGGCBp8e+Srz9hzUkpVCkAL4Q0Md3k3AK7IQdwA+Hr
	JwcPnZFXun1ItamKNcNSAmGP21qXanqfe4h+QU1lYh3zkN8yfybh+2fDK3r2vpQAqxX858/wFv4Bp
	SllsmL7hMs8yProh3CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOgI-0000000EXdQ-3QDw;
	Tue, 20 Feb 2024 11:53:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOgE-0000000EXaQ-3MT1;
	Tue, 20 Feb 2024 11:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49F556101F;
	Tue, 20 Feb 2024 11:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B23C433F1;
	Tue, 20 Feb 2024 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708429978;
	bh=Y2qkFn4bmXwXYca1c369pPVRRLBO5myyrH01GFN0MQE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a5MYsN1vtLZTOY5660h0Xo0rFMc3tCbDWIt+5wHztoZ4og8nhpngw6bDAa20TckhI
	 EWKSotFxQ9zYrmPACHTJ/RwEuIzxknCSAW8M6rPX086hTTJrIvwk+tMOelrQs79f8p
	 2rPAq1ProW7T4M5egPPsDCM2o4a9yLPyAu0Ov/vGgKmW1p4dkr6lMmgYcExIQlZCLm
	 90iIVEd8Ouvsrn17NyhabgE3FGaYIOo31mEvCJeBSNIE88U2qSeJaSzZMtwEwyRlf8
	 eLAmm6COiGVSfADwiTubn1ho8NxuBXyVVLhnnmm8nXtNkKO3Z6pfkCFaKGtEp/bpF8
	 HcRd9MKWfQyTA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 00/13] Linux RISC-V AIA Support
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 12:52:54 +0100
Message-ID: <87edd7fj3d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_035258_991230_56C0B309 
X-CRM114-Status: GOOD (  12.46  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIFJJU0Mt
ViBBSUEgc3BlY2lmaWNhdGlvbiBpcyByYXRpZmllZCBhcy1wZXIgdGhlIFJJU0MtViBpbnRlcm5h
dGlvbmFsCj4gcHJvY2Vzcy4gVGhlIGxhdGVzdCByYXRpZmllZCBBSUEgc3BlY2lmY2F0aW9uIGNh
biBiZSBmb3VuZCBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL3JlbGVh
c2VzL2Rvd25sb2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKPgo+IEF0IGEgaGlnaC1s
ZXZlbCwgdGhlIEFJQSBzcGVjaWZpY2F0aW9uIGFkZHMgdGhyZWUgdGhpbmdzOgo+IDEpIEFJQSBD
U1JzCj4gICAgLSBJbXByb3ZlZCBsb2NhbCBpbnRlcnJ1cHQgc3VwcG9ydAo+IDIpIEluY29taW5n
IE1lc3NhZ2UgU2lnbmFsZWQgSW50ZXJydXB0IENvbnRyb2xsZXIgKElNU0lDKQo+ICAgIC0gUGVy
LUhBUlQgTVNJIGNvbnRyb2xsZXIKPiAgICAtIFN1cHBvcnQgTVNJIHZpcnR1YWxpemF0aW9uCj4g
ICAgLSBTdXBwb3J0IElQSSBhbG9uZyB3aXRoIHZpcnR1YWxpemF0aW9uCj4gMykgQWR2YW5jZWQg
UGxhdGZvcm0tTGV2ZWwgSW50ZXJydXB0IENvbnRyb2xsZXIgKEFQTElDKQo+ICAgIC0gV2lyZWQg
aW50ZXJydXB0IGNvbnRyb2xsZXIKPiAgICAtIEluIE1TSS1tb2RlLCBjb252ZXJ0cyB3aXJlZCBp
bnRlcnJ1cHQgaW50byBNU0lzIChpLmUuIE1TSSBnZW5lcmF0b3IpCj4gICAgLSBJbiBEaXJlY3Qt
bW9kZSwgaW5qZWN0cyBleHRlcm5hbCBpbnRlcnJ1cHRzIGRpcmVjdGx5IGludG8gSEFSVHMKPgo+
IEZvciBhbiBvdmVydmlldyBvZiB0aGUgQUlBIHNwZWNpZmljYXRpb24sIHJlZmVyIHRoZSBBSUEg
dmlydHVhbGl6YXRpb24KPiB0YWxrIGF0IEtWTSBGb3J1bSAyMDIyOgo+IGh0dHBzOi8vc3RhdGlj
LnNjaGVkLmNvbS9ob3N0ZWRfZmlsZXMva3ZtZm9ydW0yMDIyL2ExL0FJQV9WaXJ0dWFsaXphdGlv
bl9pbl9LVk1fUklTQ1ZfZmluYWwucGRmCj4gaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/
dj1yMDcxZEw4WjB5bwo+Cj4gVG8gdGVzdCB0aGlzIHNlcmllcywgdXNlIFFFTVUgdjcuMiAob3Ig
aGlnaGVyKSBhbmQgT3BlblNCSSB2MS4yIChvciBoaWdoZXIpLgo+Cj4gVGhpcyBzZXJpZXMgZGVw
ZW5kcyB1cG9uIHBlci1kZXZpY2UgTVNJIGRvbWFpbiBwYXRjaGVzIG1lcmdlZCBieSBUaG9tYXMg
KHRnbHgpCj4gd2hpY2ggYXJlIGF2YWlsYWJsZSBpbiBpcnEvbXNpIGJyYW5jaCBhdDoKPiBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQKPgo+
IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2FpYV92MTMgYnJh
bmNoIGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQ2hhbmdl
cyBzaW5jZSB2MTI6Cj4gIC0gUmViYXNlZCBvbiBMaW51eC02LjgtcmM1Cj4gIC0gRHJvcHBlZCBw
ZXItZGV2aWNlIE1TSSBkb21haW4gcGF0Y2hlcyB3aGljaCBhcmUgYWxyZWFkeSBtZXJnZWQgYnkg
VGhvbWFzICh0Z2x4KQo+ICAtIEFkZHJlc3NlZCBuaXQgY29tbWVudHMgZnJvbSBUaG9tYXMgYW5k
IENsZW1lbnQKPiAgLSBBZGRlZCBhIG5ldyBwYXRjaDIgdG8gZml4IGxvY2sgZGVwZW5kZW5jeSB3
YXJuaW5nCj4gIC0gUmVwbGFjZWQgbG9jYWwgc3luYyBJUEkgaW4gdGhlIElNU0lDIGRyaXZlciB3
aXRoIHBlci1DUFUgdGltZXIKPiAgLSBTaW1wbGlmaWVkIGxvY2tpbmcgaW4gdGhlIElNU0lDIGRy
aXZlciB0byBhdm9pZCBsb2NrIGRlcGVuZGVuY3kgaXNzdWVzCj4gIC0gQWRkZWQgYSBkaXJ0eSBi
aXRtYXAgaW4gdGhlIElNU0lDIGRyaXZlciB0byBvcHRpbWl6ZSBwZXItQ1BVIGxvY2FsIHN5bmMg
bG9vcAoKVGhhbmtzLCBBbnVwLgoKSSB3aWxsIHRha2UgaXQgZm9yIGEgc3Bpbiwgd2l0aCBBbGV4
JyB2MSBvZiB0aGUgc3RvcF9tYWNoaW5lKCkvZnRyYWNlCklQSSBmaXguCgpUaGUgZGVmY29uZmln
IGNoYW5nZSAoMTIvMTMpYnJlYWtzIGEgYnVuY2ggYSBidWlsZHM6Cmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9ODI3NzA2CgpEb3du
bG9hZCB0aGUgbG9ncyBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgt
cmlzY3Yvc3VpdGVzLzIwOTE3MTAyMTYwL2xvZ3M/YXR0ZW1wdD0xCmFuZCBncmVwIGZvciAnIyNb
ZXJyb3JdJwoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
