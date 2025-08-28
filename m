Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB817CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzZZGqUW5ZVZ+6iQ9WR0raFL5va/tTR/lnAVj5Mked4=; b=md9nqCbJ1TcOBJ
	qeaG4u8pEFEjlZ1UatNEqThF93IW4u+87fMX48YKLNFANhp4WKh06qKYWT7wqaWur/tLCw4Div01E
	h80mR+X01BxS+R8xwD9BlAHTYIJQ13LEVf3Ug1akCuu69Dsp/o6JLH6zbOR7l0xHuq08FhPsvFWM9
	ufneNp2/GxhR0mW721D4gj4fbs/i/chiOdzTZVrONHB2gdq4ukNvag71mOU8vR2yPTRGb8CIGR4IT
	0UNH42UuA5PFWgyjuL3u57Fa+QA4vkPtXl0/T/Sicp0HU/6NKGv0X+ilc/dsTWk7IXGmbuULWH6hs
	tzNC70D83rKJ1BNSJMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1Y-00000003gO9-1kk7;
	Thu, 28 Aug 2025 23:27:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlXD-00000003XrB-2soD;
	Thu, 28 Aug 2025 22:56:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2489359cc48so3009045ad.2;
        Thu, 28 Aug 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421759; x=1757026559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=UhroEcIh+TLGM3gRXJHfRPp+QCdZqRidSYsdR/X7dhYoQt+kLi2w7tYGHqWsszm2kz
         7QCZNyNA5+YSFXJNjXm5w/0PYN8Ob4Zqr6aPe9J0OqHPT9LcTJB9PtbvmunVfP+yO4yl
         F3U2QqlSGBjJLVuLyZhrQCUTZCz8DGjPFNJhXelaq4lIsKMZ1c7MnyQaekyT5+kpsoC4
         uS8dNUtrUueCtueBythUemSlqLZEMD66ZKeumZkU6n+/C3IyVjc9pnCAHwzxF8UtXD7H
         19hCoFhclb0qi0piyrCp6sAl4mYbuKBbIDZXGoQHUTH0WkeUZjDVA7DwCNNVP9TbqMxM
         1x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421759; x=1757026559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=J+oGgy9uXt4cxttCGvIHmlyAcWrb1yeJUXwL+bLYkSAEcMSc8i/VArVjuXgeaeXwVo
         N7OdmVMwePuZJRrep8bNTN0Qj8oPZOKKnienIVsVX7E0LOVVDpZxO2xLeD7P1cZ1baOu
         +FCqHoGvmSAkXGV2+BO2onO/ELyK0Ti7Pk3icSsiJHGhiPxOkeDSkiwAV+2H2o53nuWX
         l1jDoIdVkWafHuzQ4cBtUpgscRHkakXva0rM8yKC8R7plnhcodYOhUzw2vwyrei4ATTV
         7o6BK63S7+yNEloW6twmkKMc9xAnT3XO7RETUlkX5Ose84q+Ck83uMuKLxRIgXXL6Qtp
         Vr8A==
X-Forwarded-Encrypted: i=1; AJvYcCVzv/Q7X5baYbtjXj9kmmcCgXuRy9RGLxkuYKLkEE1amB6J/3fP6qtRqyTUH2od7r8RAF3xZE6eQO8zK2+VN4Wf@lists.infradead.org, AJvYcCW8HIKos2VBHkmjND1ARrztkZJHZBXM13ao09qE7+rTs8BpsYtR+GlbYOmlkkgWvT5FVthql018Y27CuZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFY1/+Mcf2EhfpyMZ0yyhIZhd40uYzQNNXXIK9vETTVtaxi4O
	au8vPHsWY0h+INLRGz2O2+H8z9ETIlK9XvwV8U2xRc0O0MOKFzqpclnrakqMN4Ppe66A0aT8jNv
	sZ2Mkg3qAEXn+/pUyPCzQ+bVHPagtf1g=
X-Gm-Gg: ASbGncucwnRAwYvux+bgeY/BFyyAXhtQbmkNsP1LFSZkthfPqSSufg4kaaZL0myR6Uf
	ae5HjehAMgn/CHoCfDhuJycXbt8CAZ3prbkMoYQLe6ZcJdGReDWoyHM84IepJFc3jhlLeeeHfjK
	gbPM9pWXyr2r0zalZS1U7lNUzOB4Mr+8abTydSTXtkVcSvefdpnxqxgFhsNq9oIidZqxUJ93LCV
	o8dsQh7CBj7wNu7wpnx+MSEnmuGWVMW2yJUJrLRaqLko+7X8R4sUjHMiToUpqdtlryFoIVBE6kN
	Q00UTn+j31rfVPPb8+/bTdb+vw==
X-Google-Smtp-Source: AGHT+IGyhiVQPmqOT0rpkocxIF4+MoNVf9DAEsmChvxF7JPD+Cb6PcP1MNWLZ1lQ4jj5g+ohcbCqTNY4bA0OxcF+1AI=
X-Received: by 2002:a17:903:22c8:b0:246:a93c:aa0d with SMTP id
 d9443c01a7336-246a93cacc7mr149453825ad.11.1756421758714; Thu, 28 Aug 2025
 15:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162> <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:55:46 +0200
X-Gm-Features: Ac12FXxNeQ4YfImZMukInEZi5M8BoR7IH_90HG8_feBBu1eJLxGu0KIOUkXPLIY
Message-ID: <CANiq72=1XKdy6VrAPE7xH65nadFzmrBBJWsLw5tYmxNJqFbnYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@outflux.net>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_155559_746208_0A5C80BC 
X-CRM114-Status: UNSURE (   9.56  )
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMTA6MzLigK9QTSBLZWVzIENvb2sgPGtlZXNAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPaCEgS2VlcCBDRklfQ0xBTkcgdGhlIHZpc2libGUgb3B0aW9uPyBX
aWxsIHRoZSBsYXRlciByZW5hbWUgd29yayByaWdodD8gSSdsbCBnaXZlIGl0IGEgdHJ5LgoKWWVh
aCAtLSB3aGVuZXZlciB3ZSB3YW50LCB3ZSBjYW4gbW92ZSBldmVyeXRoaW5nIHRvIHRoZSBDRkkg
b25lLCBhbmQKaG9wZWZ1bGx5IG1hbnkgdXNlcnMgdGhhdCBlbmFibGVkIGl0IHdpbGwgbm90IHNl
ZSB0aGUgcHJvbXB0IHNpbmNlCnRoZXkgd2lsbCBhbHJlYWR5IGhhdmUgdGhlIHZhbHVlIHRoZXJl
IGFscmVhZHkuCgpLY29uZmlnIGRvZXNuJ3Qgc2F2ZSB0aGUgdW5zZXQgdmFsdWUgaW4gdGhpcyBj
YXNlLCBzbyBzb21lIHVzZXJzIHdpbGwKc3RpbGwgc2VlIHRoZSBwcm9tcHQuIFdoaWNoIEkgZ3Vl
c3MgaXMgZ29vZCBmb3IgdGhlIEdDQyB1c2Vycywgc2luY2UKZm9yIHRoZW0gaXQgaXMgYSBuZXcg
cG9zc2liaWxpdHkgYWZ0ZXIgYWxsLCB0aGF0IHRoZXkgc2hvdWxkIGNvbnNpZGVyLgoKSSBkaWRu
J3QgcmVhbGx5IHRlc3QgaXQgdGhvcm91Z2hseSB0aG91Z2guIENhdmVhdCBlbXB0b3IgYW5kIGFs
bCB0aGF0Li4uCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
