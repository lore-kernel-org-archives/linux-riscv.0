Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEDBC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7m6kvwQ+xErXsHzin3reVl3L6akVpcHMZ6OoI83moy4=; b=lgAduvtxIg82sH
	+U4FTwZ++AeimvBNySihpLkgE/9T5gKQkTSdJ2byUl+jC9lfclG8i2bb7UuXKn9CMdvBiRj7roXsO
	x7rqSdug4jtXryGsI1upfEYIyb1OSxf96TJkigBKQ4r8dLafOVEmSJ+GF00i19PSo3tS+MVFWbz0v
	gAePyxKFZJ5gsLNUo+4W2Fj0yrXLyGIXBp1aD0O+dhq82hynxC7xIVrQ0ccGUa1Ps9j0qvx515UW8
	LEIhpx0UHcO/DDz1LWxx1p6YzN/4dSbIPmQQ6ZdIYxRFdac0UcSkI5l4OMmO9LZe+Gg7GCtIlZFlr
	W99gr2ROan1reuLUgJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LmG-0000000BUK5-3Xs0;
	Tue, 07 May 2024 14:26:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LmC-0000000BUGb-23UX
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B71B361794
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 14:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A258C4AF66
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715091999;
	bh=JNqrpqc21+cKfdnld6kiGbjyWGSw4W52xBgykV/FR58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e9Og7GVdJzIjOa1yiMRxlsx/5Fmrnu06uhpsdF8fWOQP7kDgR+ITE1t15w4U03+WV
	 5HNkAZpJ1P0dTLATnMCfNvChpu8wiGVrlxbs/BJV7beeiTvOFyidaXJDArpi6S5Kqo
	 4hQzPuNw733XDHeB5vUon+ad9/y45uDhb2lDniTJTvm6vycggA+BdjJwKHpLH3Blix
	 yXFA3+zSA++gX1xd7vYG1OGi/rcJMXWQ3opLQdJux5MOyfcv+9rxBrZgcd/GWgKxtO
	 qhO3ChTNc+MIS/cPNGYZSq8vCdeXUxo29kFW/O9Aj4LBhv08uoFQfUIpe4a5LKqFW9
	 NRUiB2TOXFLig==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51fea3031c3so4061382e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwgiC+AE1Oi0HLqhiB1qlS+I3w0oCFn9duYlgcnAC5Zid+qb1Pj
	fuUUnwXnCx95OCQtmjOlkDKHeNVk4xz0DoCIYURl3ir5FD6I1nU/GqJg+PJA7lCkNr+bWuJEYxU
	8Mlb8Ix149tQL+EeMCkfmrsbzunQ=
X-Google-Smtp-Source: AGHT+IF5vP9PGP0zs6z3+nYvoHn0waIZDDrmRwV0Au1KuFJGmdVeV3TYY+M+A2GjIjs4b1QbdcR8vz8hxEY3JW7ctVk=
X-Received: by 2002:a19:c505:0:b0:51f:2f5a:54ae with SMTP id
 w5-20020a19c505000000b0051f2f5a54aemr10429525lfe.7.1715091998116; Tue, 07 May
 2024 07:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com> <20240504193446.196886-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-2-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 23:26:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ=nu0N4NsXwU9-qu=pPnm3WYMRfkGWoV2advj1oxTNkw@mail.gmail.com>
Message-ID: <CAK7LNAQ=nu0N4NsXwU9-qu=pPnm3WYMRfkGWoV2advj1oxTNkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: make image compression configurable
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072640_639344_B71F4DA4 
X-CRM114-Status: GOOD (  10.43  )
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

T24gU3VuLCBNYXkgNSwgMjAyNCBhdCA0OjM04oCvQU0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gUHJldmlvdXNseSB0
aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCBhbHdheXMgc2V0IEtCVUlMRF9JTUFHRSB0byB0aGUKPiB1
bmNvbXByZXNzZWQgSW1hZ2UgZmlsZSAodW5sZXNzIFhJUF9LRVJORUwgb3IgRUZJX1pCT09UIHdh
cyBlbmFibGVkKSBhbmQKPiB1bmNvbmRpdGlvbmFsbHkgY29tcHJlc3MgaXQgaW50byBJbWFnZS5n
ei4gSG93ZXZlciB0aGVyZSBhcmUgYWxyZWFkeQo+IGJ1aWxkIHRhcmdldHMgZm9yIEltYWdlLmJ6
MiwgSW1hZ2UubHo0LCBJbWFnZS5sem1hLCBJbWFnZS5sem8gYW5kCj4gSW1hZ2UuenN0ZCwgc28g
bGV0J3MgbWFrZSB1c2Ugb2YgdGhvc2UsIG1ha2UgdGhlIGNvbXByZXNzaW9uIG1ldGhvZAo+IGNv
bmZpZ3VyYWJsZSBhbmQgc2V0IEtCVUlMRF9JTUFHRSBhY2NvcmRpbmdseSBzbyB0aGF0IHRhcmdl
dHMgbGlrZQo+ICdtYWtlIGluc3RhbGwnIGFuZCAnbWFrZSBiaW5kZWItcGtnJyB3aWxsIHVzZSB0
aGUgY2hvc2VuIGltYWdlLgo+Cj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVu
bmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+CgoKClJldmlld2VkLWJ5OiBNYXNhaGlybyBZYW1h
ZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8g
WWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
