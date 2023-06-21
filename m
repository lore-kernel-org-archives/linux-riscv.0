Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFE0EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pZZ0iO79PSw4OEEPM7OC6LdY4RRr5mfI77g8HGP2mc=; b=TTtziZynmY3dKW
	6aaUOlwUPqtfx+H/QCb7Uy+jBI5nueyJn2T7t/d8bpWhudQGbfPtk5CE8egwyUy/yFZfshPiXIlU9
	ftGxU13sEcKCVLOt4oQPkp0y0jSkICumcQrgCy7n/YNvzL9VEiorYn1D29m1ZcUG1JM7cPHJYXewW
	g1OSCsaLk+r5YlfGjPxZYhJuyMSYUMn9xqrTUmMo4uW4wYCzL0/rWME8UtwzJR7bHsIz8fvJX9qP7
	SgDv8QvefKNJK28vmqIYX6k1rCLbVJZFRhq9I2++jUqgfPIu5PZC6rGxIQ0oMEA7uSsmlllEzpZFC
	mMExVBfsxtclOWgx3xnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC5ZX-00FoLK-0N;
	Wed, 21 Jun 2023 21:41:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC5ZT-00FoKg-3B
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 21:41:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F920616BE;
	Wed, 21 Jun 2023 21:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682C4C433C0;
	Wed, 21 Jun 2023 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687383658;
	bh=H7MMfO7lU9OiY7kUqvAGSquK4o5FGzYBGkOlRgJ0zDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tLUkAEr733RixTuU6p6EBloof9tdGbrHBccTpoDAWjyn8Nncs32g7CDNV9mE4CERA
	 ESM2LGbb/oZNPVC+sKDqpcThl7kRkTKMp7nOpfvgkFgapfzkgmPEYLlvoYvbW+OJkn
	 reUWpwc9DMysZ/H+JuiGt0rqFe7QlliU3es2z1ooANJO4Pt+VkIPy4b+SQI80CWx7e
	 cXZsxNaM3lWU+J9NoMPPU/H9N7tgXe9M//uaf4lCr+HuWNUHMPF04NfYbcRuLst3gw
	 bp5yg5QBY8iRCEXkTodyEl5D7nHO7qm50O/vVPzgYxEGU9oFH+MVVRq72dZYRhX8s8
	 Xx3zZbnsoGX/g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <CABgGipUBObbwLx_sB1gyE4np=s7yu==CyWXzomVoZ7x+WTkU0g@mail.gmail.com>
References: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
 <878rccoprt.fsf@all.your.base.are.belong.to.us>
 <CABgGipUBObbwLx_sB1gyE4np=s7yu==CyWXzomVoZ7x+WTkU0g@mail.gmail.com>
Date: Wed, 21 Jun 2023 23:40:56 +0200
Message-ID: <871qi4334n.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_144100_065222_6FE68AF4 
X-CRM114-Status: GOOD (  10.06  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAr
ewo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmw7Cj4+ICsKPj4gKyAgICAgICBpZiAoIXJpc2N2
X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiArCj4+
ICsgICAgICAgcmlzY3Zfdl92c3RhdGVfb24ocmVncyk7Cj4KPiBEbyB3ZSBuZWVkIHRoaXMgcmlz
Y3Zfdl92c3RhdGVfb24oKT8gIElmIGl0IGlzIG5vdCBvbiB3ZSdkIHJldHVybgo+IGVhcmx5IGlu
IHRoZSBwcmV2aW91cyAiaWYiIHN0YXRlbWVudCwgcmlnaHQ/CgpyaXNjdl92X3ZzdGF0ZV9vbigp
IGp1c3Qgc2V0IHRoZSBzdGF0ZSB0byBJbml0aWFsLCByaWdodD8gT3IgZG8geW91IG1lYW4KdGhh
dCByaXNjdl92X3ZzdGF0ZV9xdWVyeSgpIGlzIHRvbyBtdWNoLCBhbmQgd2Ugc2hvdWxkIG9ubHkg
Y2hlY2sgaWYgdGhlCnN0YXRlIGlzIGRpcnR5PwoKPj4gKwo+PiArICAgICAgIHJpc2N2X3ZfZW5h
YmxlKCk7Cj4+ICsgICAgICAgYXNtIHZvbGF0aWxlICgKPj4gKyAgICAgICAgICAgICAgICIub3B0
aW9uIHB1c2hcblx0Igo+PiArICAgICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+
PiArICAgICAgICAgICAgICAgInZzZXR2bGkgICAgICAgICUwLCB4MCwgZTgsIG04LCB0YSwgbWFc
blx0Igo+PiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYwLCAwXG5cdCIKPj4gKyAg
ICAgICAgICAgICAgICJ2bXYudi5pICAgICAgICB2OCwgMFxuXHQiCj4+ICsgICAgICAgICAgICAg
ICAidm12LnYuaSAgICAgICAgdjE2LCAwXG5cdCIKPj4gKyAgICAgICAgICAgICAgICJ2bXYudi5p
ICAgICAgICB2MjQsIDBcblx0Igo+PiArICAgICAgICAgICAgICAgIi5vcHRpb24gcG9wXG5cdCIK
Pj4gKyAgICAgICAgICAgICAgIDogIj0mciIgKHZsKSA6IDogIm1lbW9yeSIpOwo+PiArICAgICAg
IHJpc2N2X3ZfZGlzYWJsZSgpOwo+Cj4gTWF5YmUgY29uc2lkZXIgY2xlYW5pbmcgdGhlIHZzdGF0
ZSAoc3RhdHVzLnZzKSBoZXJlLiBBcyBzdWNoIHdlIGRvbid0Cj4gaGF2ZSB0byBzYXZlIFYgZHVy
aW5nIGNvbnRleHQgc3dpdGNoLiAKCkl0J3MgbGF0ZSwgYW5kIEknbSBzbG93ZXIgdGhhbiB1c3Vh
bC4gVGhlIHJlZ3MgYXJlIGNsZWFyZWQsIGFuZCB0aGUKc3RhdGUgaXMgSW5pdGlhbC4gTm8gc2F2
ZSBvbiBjb250ZXh0IHN3aXRjaCwgYnV0IHJlc3RvcmUsIHJpZ2h0PwoKPiBPciwgbWF5YmUgd2Ug
Y291bGQgc2V0IHZzdGF0ZSBhcyBvZmYgZHVyaW5nIHN5c2NhbGwgYW5kIGRpc2NhcmQgVi1yZWcK
PiArIHJlc3RvcmUgc3RhdHVzLlZTIHdoZW4gcmV0dXJuaW5nIGJhY2sgdG8gdXNlcnNwYWNlPwoK
SG1tLCBpbnRlcmVzdGluZy4gV2UgbmVlZCB0byB0cmFjayB0aGUgc3RhdHVzLlZTIHRvIHJlc3Rv
cmUgc29tZXdoZXJlLi4uCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
