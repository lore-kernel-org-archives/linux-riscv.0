Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC438CD1288
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fTLGYePLbIZdjVTqNubN6JAd/9RLB5Uy+63QhKC5+s=; b=G6MA/3qUH/uKbI
	VwGMDFZj6u0kwZiOiG3hinP+/8ZKwwoY3SVS0ILhhpLTUrdZldbLV80WULFEXaufjY0w3/0DSvKOD
	FnCPeuV7DbUXOk18GCMHpwg+6N990ImlybC8iuAcQMmNhW6osNzBWHgDSexCPhjTmGBvRVIrcMGiY
	UigEqSjyho4Q8vgeGG1iHDZ0NxK1qMVNadbwCpb7WM0MSXEoWGOx4c4H6u1TGm/inSo23WTcSizr7
	+tdZWoPE5jFa3kXtoIJ2Aev5Rgd5weQD7crf+TZf2N9bA7Ne0kkayn8DzJd2VqV+dhIqr2w8Ge651
	daT3zXBA6hhju8fUku7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrMhQ-00000008az3-1vZO;
	Mon, 01 Apr 2024 18:48:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLY1-00000008TCO-173l
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 17:34:19 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-61149e50602so29078857b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711992854; x=1712597654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4MAUcmgMKuhD5Gbh9i7N0D2vbnfTkjFUipl6Ki2fa4=;
        b=SQ/faTXb1qyjRD5VjL8phvMuXa8UO+cTxiDMugHhJ0if+6z4B3X2a5Zzf28WrFH5qp
         H/DAVlNjYr9X1DmvUnetTywytOlburKIO9N1e3tM+l0aTvvjkCW2jfpiH1vBGBuH9fty
         6ApOVvCwbvezSFRYCz8M83bhNw3rAeqKlw5ODTufzwfShq1GwV0ib8zpgFiqKnYX0s5l
         xJT0MjXyhXaNSWeqZ6lzWeaItjC/2Lp0AYXFzZWj2xRhmWnM16W552JW5e1IMQ1n8oxI
         HogCExy47IsLbfao7iuCXXI/1lTBluA7PnGPSko8sLd5umN8zUYBwgfqkGz55p7O+MwB
         e88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711992854; x=1712597654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4MAUcmgMKuhD5Gbh9i7N0D2vbnfTkjFUipl6Ki2fa4=;
        b=NN3+tvmNkmAQwy05d7hD83jl5SiHKJjVoARnOU78dFMkDwK+w1njdKPnMY1YRlaU0t
         3+3Y+w/wstRC7sscV6tN78nDN/jKjKHhQFY6ade6R8gt/sh1A0nUHCqftexWTBwX/HvG
         dlDK4JeVs7LnarYxErto/c3QCJG2xRtbrM/scUV2GfABuHqpN08q4njxas3NX9z8Fohi
         IIBCDxk+/oQTryBIt1h+8+MW+bDNqfUUvW9fVAwCqtJ+ZydZOey9vDYmvpma7e86Gvjm
         hdFBFHnadbODh8bWlG402eONQ+9YIReyQo1Ht/KAoiPUtCI073W6ATBfHlejfPFy5R3C
         Ta3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkGHIi9w5uAEWRBf48+XBsD74qkrNhSE2tPpWpA0ZG7yMSTxEfjuvukuSQRsntkKQ7ZleNXUHwN0lpVvzyJLB/4c9GwRvVjcEivoW5fXrL
X-Gm-Message-State: AOJu0YwUqATic0Gi/pxfyLCZO+MMxy70v23CillyIvSy+9TjBM0Ocr0H
	KrHCRBnsnOf9VoUEItwnWBYHOGc4h18bXLeyoQSB5vUAbPynilMHjAsWb9bjRqebGbIuzLFrmvU
	2dSzbmlpZxMyW1fg/aFVJP/Lm5TNOrTlo6zeIYw==
X-Google-Smtp-Source: AGHT+IGWLd+uB6H49i9ExUSpS3d/6MA4XGgkBBQBM3nTLsDV2PwbysZLh8i9VvQ3W9VGzIjrMeAWK2hXdQjjikUWmc4=
X-Received: by 2002:a81:4849:0:b0:615:19b1:5367 with SMTP id
 v70-20020a814849000000b0061519b15367mr22572ywa.6.1711992853801; Mon, 01 Apr
 2024 10:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044459.3990638-1-debug@rivosinc.com> <20240329044459.3990638-28-debug@rivosinc.com>
 <4b38393a-f69d-4a77-a896-b6cd42c7edcf@collabora.com> <CAKC1njQ_RU=uHhrna=MFVdjAMjjQNqZWnkjPoJvO7CxtPMeNuQ@mail.gmail.com>
 <ef72ae20-6b68-496a-a819-8818ade0d433@collabora.com>
In-Reply-To: <ef72ae20-6b68-496a-a819-8818ade0d433@collabora.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Apr 2024 10:34:06 -0700
Message-ID: <CAKC1njQj7GfkdE1HJD54utkoPqJXyqMeoXOxa6ActqZ-fSDuKQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] kselftest/riscv: kselftest for user mode cfi
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	tech-j-ext@lists.risc-v.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, 
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com, shuah@kernel.org, 
	brauner@kernel.org, andy.chiu@sifive.com, jerry.shih@sifive.com, 
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com, 
	xiao.w.wang@intel.com, charlie@rivosinc.com, apatel@ventanamicro.com, 
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com, sameo@rivosinc.com, 
	shikemeng@huaweicloud.com, willy@infradead.org, vincent.chen@sifive.com, 
	guoren@kernel.org, samitolvanen@google.com, songshuaishuai@tinylab.org, 
	gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_103417_456141_378EBB8E 
X-CRM114-Status: GOOD (  11.22  )
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

T24gTW9uLCBBcHIgMSwgMjAyNCBhdCAyOjQ44oCvQU0gTXVoYW1tYWQgVXNhbWEgQW5qdW0KPHVz
YW1hLmFuanVtQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L01ha2VmaWxlICAgICAgICB8ICAgMiArLQo+ID4+PiAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlICAgIHwgIDEwICsKPiA+Pj4g
IC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvY2ZpX3J2X3Rlc3QuaCB8ICA4NSArKysr
Cj4gPj4+ICAuLi4vc2VsZnRlc3RzL3Jpc2N2L2NmaS9yaXNjdl9jZmlfdGVzdC5jICAgICAgfCAg
OTEgKysrKysKPiA+Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hhZG93c3Rh
Y2suYyB8IDM3NiArKysrKysrKysrKysrKysrKysKPiA+Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9jZmkvc2hhZG93c3RhY2suaCB8ICAzOSArKwo+ID4+IFBsZWFzZSBhZGQgZ2VuZXJh
dGVkIGJpbmFyaWVzIGluIHRoZSAuZ2l0aWdub3JlIGZpbGVzLgo+ID4KPiA+IGhtbS4uLgo+ID4g
SSBkb24ndCBzZWUgYmluYXJ5IGFzIHBhcnQgb2YgdGhlIHBhdGNoLiBXaGljaCBmaWxlIGFyZSB5
b3UgcmVmZXJyaW5nCj4gPiB0byBoZXJlIGJlaW5nIGJpbmFyeT8KPiBzaGFkb3dzdGFjayB3b3Vs
ZCBiZSBnZW5lcmF0ZWQgYnkgdGhlIGJ1aWxkLiBDcmVhdGUgYSAuZ2l0aWdub3JlIGZpbGUgYW5k
Cj4gYWRkIGl0IHRoZXJlLiBGb3IgZXhhbXBsZSwgbG9vayBhdAo+IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlIHRvIHVuZGVyc3RhbmQuCgpJdCdzIGBzaGFk
b3dzdGFjay5jYCAoYSBDIHNvdXJjZSBmaWxlKSBhbmQgbm90IGEgYmluYXJ5IGZpbGUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
