Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F72D5E145
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVBWbJU+xtS/JGAdkfSouzOrkKEKN4paP+Y3UdSWHmM=; b=4FT3l72LwllxK/
	ZF+eKcIrs5SyA7EGcIAn6OHvd0NF3BGB8/d1rcT9as6U0vJPv3Ytii+D25G2hCFHgUtRrhnIItHFV
	myCvLCuMbqi79UeATY04EtCJoIAp6H8NfysQT7LPG0rTLTqqVKV+kZwSkGZu8YiQUawzP63bA71n+
	KLvk6Jb4XPUp2DK9RJJLisXNvAieMECdcPZf62JCYH54eabdas/WpsnqeyierI7R2EmcHCXomVUhe
	Dvd3p98dUi0sgXj2fSGUxXCbPs40Qm7pdy0wmg5YS3OGSsU8AH5vADknzJIOZqmWWKxl2Tm+0Q39Q
	VoD70bY5nbf//HWo9jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KOM-00000009mFu-0PSF;
	Fri, 08 Nov 2024 08:30:54 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KIG-00000009lJ2-1PSn
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 08:24:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so18411571fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 00:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054275; x=1731659075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBfWj2JA7AswWd35Ieq6U2nWlsPIx9QsGVzoX3QMvLg=;
        b=sp66wauIyQhc5NPQDDymw653WxJ4vHmiQFhnx3OtPh8qkhQekdy8TILSFMxHQfPQRk
         BYUtcqFfY2fnd9pnCREB1QhXjv30QpJ22/rXEoPmZxxzuoIEeGS/sEQlN/MLl+GOq3qq
         LTUwyryduzJLfRc+5oayNBdOFSOURbOBVdwxrAZzlRY4nzOi5mmSB2r708U3NBw2eqnt
         H4cAXBWBw0/BcV3Mce+D4hnuC6/l21nu+E5IfNQhfV07oi0r38buQIfLWRJJegPrQyar
         2u2lS9f0c56axT6zmt7cKQ5J2ZVFUFA+lnyin07/5ThdbxGcNajk0MkX1w7852lfubcX
         fWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054275; x=1731659075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBfWj2JA7AswWd35Ieq6U2nWlsPIx9QsGVzoX3QMvLg=;
        b=vS/MnKqbRUhLgfz4NGr4zopRcuHH7tvXoAnb2wz7sUoc6ah5N/GnHfH5AIoTZerxFh
         IhFPZ+UYdeUDCQBw/8wGDCrkAb/t7aXtcD17UnbTSm4KyRVXGRtJH0MkM7hkOOM7nzKm
         nIMtF2kfKEzHJaPMdiRnklUFw6/sa3+UuyyQnuHFJq2VyivX+kddR7A4kxrGKmLtsvpn
         RMrdjqteadr9ruqxbWGEy0TMOE4XfCGeu6gT9ZyTeUU1kRMopqELf+aJXQjSr8LHBeGq
         zA6ViLcrewje2MozMIHwKs3vA9ZPvNJd8gp0LcbhcaTZow0LSgxyXcq4k6x1x1+TuWA4
         0mPw==
X-Forwarded-Encrypted: i=1; AJvYcCXH9FaLadhqJXXvqnhSRaEq4h1z/DRhQFOwT3t2rGXBwvHz3lBQKxqPFEau/mDC+yZw672sJkjo9sxa7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YznjrBq/jGc2h4LB2NgJvkQAepjJvPxDeTanxowiljJhWVAgbAk
	xIfDHl9eQw32PJN1HDDr736JvngNYibW0kdTFBiGLZ98oX/pS/q5bL26lfj6Y4wUNGvRSG/LMg2
	z/oXXbzunCuKhBvNbYRPUcQw/HoYj4H1DSLMh8w==
X-Google-Smtp-Source: AGHT+IGnVc1nyOnAYHft+MoTr7KRjl4or/9wNP6G/ex9jiHF5SnJGvSQsEQBuKYZuIsNr5c2RRu8y2/CfOwy0TH/7vE=
X-Received: by 2002:a2e:a913:0:b0:2fb:b59:8167 with SMTP id
 38308e7fff4ca-2ff20281d3dmr8301041fa.39.1731054274717; Fri, 08 Nov 2024
 00:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20241029012312.3448287-1-unicornxw@gmail.com> <MA0P287MB282298E7A00528040BBEC5DEFE512@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB282298E7A00528040BBEC5DEFE512@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:24:23 +0100
Message-ID: <CACRpkdYGhrzB9Jv_fFOFd-dMJEGD0zyuXZ7-Xhae6N-DYBF3zA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, inochiama@outlook.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002436_395044_6D4C45F2 
X-CRM114-Status: UNSURE (   6.39  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAyOjUy4oCvQU0gQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdA
b3V0bG9vay5jb20+IHdyb3RlOgoKPiBXaWxsIHlvdSBwaWNrIHRoaXMgZml4ZXMgYW5kIFBSIGZv
ciA2LjEyPwo+Cj4gT3IgSSB3aWxsIHRha2UgdGhpcyBvdmVyIGFuZCBQUiB0aGlzIGZvciA2LjEz
IGR1ZSB0byBpdCBpcyBhIG1pbm9yIHRleHQKPiBjaGFuZ2UuCgpJIGhhdmUgcXVldWVkIGl0IGZv
ciB2Ni4xMyBiZWNhdXNlIGl0IGlzIG5vdCB1cmdlbnQuCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
