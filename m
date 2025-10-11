Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD5CCD187
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 02:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW5bxmyQlf1yJcAxUKFbJVsN824OVCOBr6LcP1euvrA=; b=Nt0vCPcDi+9T6g
	/IxK3TZt1oABSGBMEhiDGMKe+IvXbcAd8OX5F5Ov/wM9tyuAoqUbc5sETuowvReRL9du5Adaawquu
	jXTZTOKn2O8ADp89XVDd+0cEdNUG4VfYu5xeDTifIqrCnIVP1KEd8KqxlRGhYcDdIZt7ak4bI7g50
	GWpPXgtf3gxWVNBvSwC/tCBRlog+MOtwVr7jHozhZTjJyx9//0EeJ4ArOhXM+2Dpsodw2ws2p1bis
	o1UmkYEpehHt+otOAJehxXt3kysLjmOv7C/fc+l3xNb45d2zHnZIbhERPEHIxYjNAM3RCDePlcGI8
	Y/JjuZSqf+k2xpEDvLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pkr-00000009iG3-1Rn3;
	Sat, 11 Oct 2025 02:54:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pkp-00000009iEP-1olI
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 02:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80CBB452E7
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 02:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F734C19421
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 02:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760151280;
	bh=0BsgeZrUj1KXKp6RgSEwCit69Zxybcd5U5cra+JDpqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AopT685ZVyiq/B13YoWAdE/uU7ZByQOi8O//wNShEHRW/aN7M8he3IudB6pmzAhLk
	 rsxTX5qL0jtNz/l3oj+f0O5j2/bPe9ffDzsjX66OgRuL2Ef2BCCOPyXULb404xZmDn
	 Use3yrTlDNkLxKts4HbYNtXaA526ofA0016/swVhUnIeUhOcJO6mbBXnQQeEMNDn5h
	 0yOE5FNaknEXbNoOUgIJA0IFog+fl1XOO3BpHi0Ei43RiQPLtNTYovB67pjNJnb+u2
	 lwD76XIrCBkRfaDb0581OJe0haU56lUwPm8Iw0GPLpOK0EuuP3BSEIjapKAIXp9XUN
	 1kVyCSEUYol3g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-634a3327ff7so5447172a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 19:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF4ztB+mcyh972WtZFwXx+LZr3+l/1+Sgyph0kziUFrBJaKV7/Yv9bSzetwsIyPyIhdRCnBAejflu2pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHv/NN9CGwA045V7HDs55CrcDSUtpn8ngQeTJ5p+yh0UWo1gRP
	3E1a+7G0REcekYCpyRO5mYNum51AWPHTbms201npCOj42JcV1pQG53U19OVGiPCKopdB7Cnjagd
	98TSDqH2QyWCiVAjgWUh3LS0Fr3i4HpY=
X-Google-Smtp-Source: AGHT+IF9JxI+9VeTgFvdqyJbZPk/80hHvb+lokzIbLfoZR2oxQr/1YSDD9mWyNinLrGKRqjQU4ppDgkuAk1ji6g4P9g=
X-Received: by 2002:a05:6402:194:b0:62f:2f9f:88bf with SMTP id
 4fb4d7f45d1cf-639d5c76af0mr9286969a12.38.1760151278841; Fri, 10 Oct 2025
 19:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
In-Reply-To: <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 10:54:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
X-Gm-Features: AS18NWBWal44DW5X5_JBBkD_g1Z13iGjEk6ARiGEjcxdbyEFQrUdwFzObW-aflA
Message-ID: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_195443_492632_C95F3DBA 
X-CRM114-Status: UNSURE (   9.75  )
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

T24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgOToxM+KAr0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IE9uIDIwMjUvMTAvMTEg5LiK5Y2IMTI6MjUsIEFyZCBC
aWVzaGV1dmVsIHdyb3RlOgo+IC4uLgo+ID4gV2h5IGRvIHdlIG5lZWQgYm90aCAoMSkgYW5kICgy
KT8KPgo+IE5vdCBib3RoLCBlaXRoZXIgKDEpIG9yICgyKS4KPiBXaGljaCBvbmUgZG8geW91IHBy
ZWZlcj8gT3IgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+Cj4gVGFraW5nIGFsbCBvZiB0aGUgY29u
c2lkZXJhdGlvbnMgaW4gYmFsYW5jZSwgd2Ugc2hvdWxkIGRlY2lkZQo+IHdoYXQgaXMgdGhlIHBy
b3BlciB3YXkuCkFzIGEgc3VtbWFyeSwgdGhlcmUgYXJlIHRocmVlIG1ldGhvZHM6CigxKSBPbmx5
IGxpbmsgbGlic3R1YiB3aXRoIHZtbGludXgubyBkdXJpbmcgdGhlIGZpbmFsIHZtbGludXggbGlu
ay4KKDIpIFJlbW92ZSB0aGUgYXR0cmlidXRlIF9fbm9yZXR1cm4gZm9yIHJlYWxfa2VybmVsX2Vu
dHJ5KCkgYW5kIGFkZCB3aGlsZSAoMSkuCigzKSBJZ25vcmUgIl9fZWZpc3R1Yl8iIHByZWZpeCBp
biBvYmp0b29sLgoKSm9zaCBwcmVmZXJzIG1ldGhvZCAoMSksIEkgcHJlZmVyIG1ldGhvZCAoMykg
YnV0IGFsc28gYWNjZXB0IG1ldGhvZAooMSkgaWYgaXQgaXMgbm90IG9ubHkgc3BlY2lmaWMgdG8g
bG9vbmdhcmNoLgoKSHVhY2FpCgo+Cj4gVGhhbmtzLAo+IFRpZXpodQo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
