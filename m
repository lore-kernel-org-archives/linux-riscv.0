Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA25C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJG2iIMpCr8bfVutxGNPJVou4lgrL2uRgMojVntTTRg=; b=vitzn2BJr3JvUG
	cQbNiaAjngwihiXTiXjRwI78eM8haFEORIId6DN28gQuI29ErsWnjL88b/nTLqbT9fzqbDSORdQ11
	XKmUVwX2FuT0ENp8MvEl4XmDsW9NTsHaKRvL1YNMfG+1bROMfTS28+pH9QxsjnpUSFLSYzHU4j0yF
	HL9EMhLsnUnxnxOy/hRGgzDTbG3+hPK3KYCUH1+ZIAqoHdL0iwliDnFL5mi921qzUcJHMh4d8hrOO
	5Xsb0ZeQguQ9FiA2gEJOqJNsh2RJVRcBwc38i4vGRWjUEyUFy7Pbb/+ugbLPwgjoHdlb1uqK1cCTh
	xEjNyDCn1Z5fAUibGPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPNN-00Epkx-0n;
	Wed, 13 Dec 2023 13:34:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPNF-00EpdY-2w
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:34:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3363653e180so1273730f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702474442; x=1703079242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dyjir5JRDNINX6nR7/5ESizZ9tEUbuiCsuJQ4w7zFo=;
        b=AM8N6N1Qfp1FT9Dw93lqgLmwcUn2IKOsu8QYrDSEt/Ow0NUIkn+CaYOnxiN69O6aCP
         VOTavCSGrZtJaPpLlQyLckPAFJewDqxXIdko3scvH14DqUUuzJDFNhfRyWZ42Uwj/vYc
         M+CoI7zjs1aFpkmq/PnbeRWl9BTHTPaWYvENVvlXKHIyVxDKWUtOFQUYWLOdCBgryCCi
         0Ph2yDqSXkK0rjzdH4+ig4LB/hVC/zDbzD9uY++Ei5hQRdl0mHr6cAXF10MwvZ6Q986z
         ePSfTl3c1wSQ1mVX8TYjtJmU0Y6E0tqIdmXCFVRKbzMTUQ/vMSmTMYLYdpOC4okGziB/
         phaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474442; x=1703079242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dyjir5JRDNINX6nR7/5ESizZ9tEUbuiCsuJQ4w7zFo=;
        b=MWfFw64r7bEA95froZG/G7OXHqzBjtisuWGxksgZT2UalIydSq1bSwAv1v7KRDy0ie
         6gJ35pCotCJ2cGOksxLNFjVSaapOE/LAnLP3t7R3x5rT/VHh2DLSeC882zm96JlqJp/8
         /DOPVXyGiwr1EXJaam3jWmpBupB8pcvyCOjOR3VlmEtqFfRKSLumB9OC9/Ug1+YCbX0f
         XjL2M2EAPYQUhgB56OXdCsAfXX0tt5WlykoieE4d8qnFBAt+ttzvXNaArA3RnoJouyJO
         GXyspiBxD+8fgMYUPWgVHbukGW1Trbdnv/MTrwMpPy6tK+LwkDXYZf7wX8rlqQ8gRtXW
         fH/A==
X-Gm-Message-State: AOJu0YwjWHf3ndtr8/mFu+S7q6aAXsYtIVy9eh/DutzVBVv5CH3+iPTi
	1QtEdWbXt7IofA7/zfOdnXzHir1tvwsYd9702outkg==
X-Google-Smtp-Source: AGHT+IFybgoQ6Al99rIKrMcsVnZxQR6oFoK6iWMIGdqOMI6Sp6BCx7NcNiQgT+gKVVCUUSRnONFO8oE8BX/RwIP3ftI=
X-Received: by 2002:adf:e884:0:b0:332:fa1b:9f8b with SMTP id
 d4-20020adfe884000000b00332fa1b9f8bmr3416809wrm.69.1702474442029; Wed, 13 Dec
 2023 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com> <20231213-excretory-ashen-03a34f3a4c90@spud>
In-Reply-To: <20231213-excretory-ashen-03a34f3a4c90@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Dec 2023 14:33:50 +0100
Message-ID: <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_053405_962407_444DC5A3 
X-CRM114-Status: GOOD (  13.53  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo1N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCAwOTowMToxN0FNICsw
MTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBIaSBSYW5keSwKPiA+Cj4gPiBPbiBNb24s
IERlYyAxMSwgMjAyMyBhdCAxMDoxN+KAr1BNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRl
YWQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gT24gMTIvMTAvMjMgMjI6MjUs
IFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiA+ID4gSGkgYWxsLAo+ID4gPiA+Cj4gPiA+ID4g
Q2hhbmdlcyBzaW5jZSAyMDIzMTIwODoKPiA+ID4gPgo+ID4gPgo+ID4gPiBvbiByaXNjdjMyOgo+
ID4gPgo+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4
L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5j
dGlvbiBgLkw0JzoKPiA+ID4gcGF0Y2guYzooLnRleHQrMHhiZSk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYF9fZXhpdHRleHRfYmVnaW4nCj4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAt
bm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50ZXh0
KzB4YzIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+ID4gPiAv
b3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMy
LWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5jdGlvbiBgLkwxMic6
Cj4gPiA+IHBhdGNoLmM6KC50ZXh0KzB4ZDIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4
aXR0ZXh0X2VuZCcKPiA+ID4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlzY3Yz
Mi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2guYzooLnRleHQrMHhkNik6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+ID4gPiAvb3B0L2Nyb3NzdG9vbC9n
Y2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5jdGlvbiBgLkwxNSc6Cj4gPiA+IHBhdGNoLmM6
KC50ZXh0KzB4MWVhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9iZWdpbicK
PiA+ID4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlzY3YzMi1saW51eC9iaW4v
cmlzY3YzMi1saW51eC1sZDogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gubzogaW4gZnVuY3Rpb24g
YC5MNyc6Cj4gPiA+IHBhdGNoLmM6KC50ZXh0KzB4MWVlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgX19leGl0dGV4dF9iZWdpbicKPiA+ID4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xp
YmMvcmlzY3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2guYzooLnRleHQrMHgx
ZmUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2VuZCcKPiA+ID4gL29wdC9j
cm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlzY3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51
eC1sZDogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gubzogaW4gZnVuY3Rpb24gYC5MMjInOgo+ID4g
PiBwYXRjaC5jOigudGV4dCsweDIwMik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRl
eHRfZW5kJwo+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxp
bnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBm
dW5jdGlvbiBgX19wYXRjaF9pbnNuX3dyaXRlJzoKPiA+ID4gcGF0Y2guYzooLnRleHQrMHg0MTAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+ID4gPiAvb3B0L2Ny
b3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4
LWxkOiBwYXRjaC5jOigudGV4dCsweDQxNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhp
dHRleHRfYmVnaW4nCj4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2
MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50ZXh0KzB4NDI0KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9lbmQnCj4gPiA+IC9vcHQvY3Jvc3N0b29s
L2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBh
dGNoLmM6KC50ZXh0KzB4NDI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9l
bmQnCj4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgv
YmluL3Jpc2N2MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0
aW9uIGAuTDQ2JzoKPiA+ID4gcGF0Y2guYzooLnRleHQrMHg1M2MpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4w
LW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4
dCsweDU0MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfYmVnaW4nCj4gPiA+
IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2
MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDQ4
JzoKPiA+ID4gcGF0Y2guYzooLnRleHQrMHg1NTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBf
X2V4aXR0ZXh0X2VuZCcKPiA+ID4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlz
Y3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2guYzooLnRleHQrMHg1NTQpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2VuZCcKPiA+ID4KPiA+ID4KPiA+ID4g
RnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuCj4gPgo+ID4gV2UgY2FuIGlnbm9yZSB0
aGlzIG9uZSBhcyBDT05GSUdfWElQIGlzIGVuYWJsZWQgYW5kIHdlIGFncmVlZCBhdCBMUEMKPiA+
IHRoYXQgSSdsbCByZW1vdmUgdGhpcyBzb29uLgo+Cj4gSSBkb24ndCB0aGluayB3ZSBjYW4gKGV2
ZW4gaWYgcGVvcGxlIGhhZG4ndCBzZW50IHBhdGNoZXMgeWVzdGVyZGF5IGZvcgo+IFhJUCkgYWN0
IGFzIGlmIFhJUCBiZWluZyByZW1vdmVkIGlzIGEgZm9yZWdvbmUgY29uY2x1c2lvbi4KCk9rLCB0
aGUgZml4IGlzIGVhc3kgZW5vdWdoIGZvciBtZSB0byBzZW5kIGl0IHJpZ2h0IG5vdywgc28gSSds
bCBmaXggdGhhdCA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
