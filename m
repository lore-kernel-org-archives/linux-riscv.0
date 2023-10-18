Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8627ACDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiJLiX/bjwgdngqKUu45mlhrl6JPBYINki6I+4J3gL0=; b=veEOCyTxelGpB/
	dQiSuKakVqNhp2+VJuHYxoUd3EzfqbIIyKS8Q4F4zzo2i8SUEa1bjcNg/MGor/ffNTEWUgNmga43f
	Q1zEN5g0p5oBaAlxg7UhkY/QlmPYL/wSb3q2mIoxYjtchhbc0477cfXK5Uz57rs6GM8qDKax8DMbe
	EDYH+tpQT1P2+E20xP9vcuHrnUMzb4YO/AAbu5m0ScTduhW/s+8/QZeleVNupZYNU7GMONkUDiQBo
	/oeoqm3kEmWinENGthAqEaNddr7FGGz7h4f744EO5JmAqyf8q9fhac4Y6vE0GXowtWrvigB3LL+Pu
	pwVxeSh5N+VEKeX0T8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALw-00FJi3-1X;
	Wed, 18 Oct 2023 17:29:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALr-00FJfa-39
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c50906f941so81112281fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650138; x=1698254938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KecMZIvYhLiPYK1GTiccjaRpV9Eq5PLhQIfDXh9BqmM=;
        b=bSd5P05mW0khJ1D/IhU7kXcm2gc+34z1HVODR1hbo7M9VzHobPi2gaeSc87lMtUkhl
         ZNlxDtZAuVUSi9hujBkbiK6DT3EIVV4Yg7Z8f1D8lHtXpKHp9KyCTlYIlEGnX29Jyngz
         gh14mJVVrNlDD0dieJTGhjOGgEB9DKHhHD4IJIAoX2r/QRI4gGr7V2I7EW7AJLvUZVGy
         q5CkqZ5UHx6ulRcxv0hx1uI2UKFbSGsJ9TkfVouLk/XnqnNvSe3W1TZNPs9/E6UhpVaP
         8dCke/Fe7Kv6A8AEMp0lM03GmrJgTyyRE4bDarOEmq0grhUXR126MdQhlYgUzeIcZXeY
         r/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650138; x=1698254938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KecMZIvYhLiPYK1GTiccjaRpV9Eq5PLhQIfDXh9BqmM=;
        b=VTcwKVfYnglzUcr2SlIFtvbeU10/vyV/VCGBFmf2Q5bOIQDUDPNKr9q+UFRHEGUwXh
         2d2oCFgaCICb0P8BtQvn2rUr4axXTrqg6tNCnrTVJdpGgwu9f+XxfzRlDjCJdGUgwnM0
         sWPtMpzpP4wUQEkzEfEnTfJiS7PTqVWLIzYFKG6X79J/DerrXM4QAlzJH3DGvupnlIKI
         SRWUiGfmBhPyh/Ln8cn9T+Uas0inov85rr51DzPrwRU16bkx2/p5CsbfKIUf2TT4S+QL
         UlEhsYmIwW35n6a4U75afiFioJ/mn1EvKiqHYLKBjobyGoMtEmuFxyCJGs9R4Nimbvbq
         fsPg==
X-Gm-Message-State: AOJu0YwZrcU/N8uu32cENTaDt1Sa9DVAre/fMCJIDU4XLt6bnfBbhRUp
	Rp0pb4GM51HQNZVPoYLh38ZuAuf1iyf1luPjAyAL2g==
X-Google-Smtp-Source: AGHT+IEtoY1yZMCUmYkHB9d1SqV2lcdLSWQ0+n+bBu7Zg4eMSM1qn1YEnUNWUrCwdIkscxBAZQ3k/ahzY9IjsKI+bfI=
X-Received: by 2002:a05:651c:227:b0:2be:54b4:ff90 with SMTP id
 z7-20020a05651c022700b002be54b4ff90mr4251984ljn.53.1697650137918; Wed, 18 Oct
 2023 10:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-12-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-12-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:22 -0700
Message-ID: <CALs-HsvXt_gPCJ2hh5ftPn0sJxWKNzn3_8uyamko4OufCE0+vA@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] riscv: add ISA extension parsing for Zihintntl
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102900_015347_84B9E9F7 
X-CRM114-Status: UNSURE (   7.41  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcGFyc2luZyBmb3IgWmloaW50bnRsIElTQSBl
eHRlbnNpb25bMV0gdGhhdCB3YXMgcmF0aWZpZWQgaW4gY29tbWl0Cj4gMGRjOTFmNSAoIlppaGlu
dG50bCBpcyByYXRpZmllZCIpIG9mIHJpc2N2LWlzYS1tYW51YWxbMl0uCj4KPiBMaW5rOiBodHRw
czovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzEzX3dzTjhZbVJmSDhZV3lzRnlUWC1EalRrQ25C
ZDloai92aWV3IFsxXQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2Et
bWFudWFsL2NvbW1pdC8wZGM5MWY1MDVlNmQgWzJdCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2
YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
