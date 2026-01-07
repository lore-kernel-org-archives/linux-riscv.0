Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76665CFD640
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBxVCdl0d8eyCoZ2mBIHD3JyR7fj6RXgCl3taxVH2rA=; b=4GO0VJQ0y0kKoP
	OAZHQ93QpBSsXi+ANHU6YIXHoJddJ2eiI9Esh/YPVgM/Fw9SiyWKeFJthElqlOnvDpK214dBzakml
	5EACGwlRH6s5JzdMuIUe92VCM4OBr8kiyZGdcuZI0LqCPmXBPpPOZFP3q5NhbiqTCPCsVT7LOzQyx
	r4WkNhCYbJSgFMfV+ho4SkUOrVEQ75GvmB351+FguVi12ETodKxL5aYiRn3DBNT8OT0QgrlusdlqM
	6W8xrnJ2aFMjGY1+DHrDV7myeje3uzZj40aeUKTmRD5N8ytiOu/q36eaDsJ7KC47GPrrM/4R2IcFD
	OXr5fCSXbxLzJyKUwVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUEA-0000000F3qJ-2O4B;
	Wed, 07 Jan 2026 14:09:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUE8-0000000F3pS-0Age
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 14:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12A8843B9D
	for <linux-riscv@lists.infradead.org>; Wed,  7 Jan 2026 14:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AB8C19421
	for <linux-riscv@lists.infradead.org>; Wed,  7 Jan 2026 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794970;
	bh=o+CRaV666z5N98g0zrWQ+oTRAL2ghObwdkDLLmds+mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uI5cDTSmFRR5wTwqMz1zK5zwht6zvrsLfPAfaG/xvgHfPv6ayTSg1yzUBjMbNzPmY
	 ZX3Jv/vSXOJ20vzfMBicXQHi1wCoxU/3FSRk7jYMPCySttNlXbBO7t5ZOLRbgrsDuk
	 37OKi9wQNTjrzeBCbOfqDG8BnXzfOSv7JbLPHNgpzipbwDGGeM3nU+0NsUnafrz1rx
	 5rG9qnVoQU3D5QKFrZfNiU+RKw7kIRAERDF59t9QxWUTYQt3Kli6IrkLZUImy4M7FE
	 wru7NuKVChz7sQf+N4opRiWI82bzxL5WLRhurHpruyluPcEG1iNh3aVzBfxmL9wMJ0
	 NfBjvWZApRTIQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fb7ab7562so20231737b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 06:09:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXir9QMH+DVrDHa056PpbOT5LjQA9b9NHI8bFCwVK0Qju/jn1heD/86leR8u9QC13CtXltZSncam2P05Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq2dLliaJ6+EW5D/Kp1W/DJ73mMAQ+yTGh907AHSz5fhH7bKac
	bCE9gEspvnjvSNDXtph2CFMx2gWi7QASH5A4RbfY2/iQljzzC/RpPC1e6NjeMPV1FPUjR7MsH77
	BXEEgcLCVUtAV+jwGHKOKbMTQLpsk0N4=
X-Google-Smtp-Source: AGHT+IGVJM9u88lYk0P1zu24w+D9Abmp3Tgpsp7039pR3VGD21RawjWoaVZAeFtTaqSswOj71vp7ze28kyoqG0dQd7Y=
X-Received: by 2002:a05:690c:4910:b0:78f:bede:57c0 with SMTP id
 00721157ae682-790b5758118mr54075567b3.23.1767794970275; Wed, 07 Jan 2026
 06:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
X-Gm-Features: AQt7F2prYO2wsLFjbT7JVZq2qxObPCjIw8OX61DKF7WP4Vo2QsoGwU2QDnedbJ0
Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060932_097910_C97BDB6E 
X-CRM114-Status: UNSURE (   8.73  )
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

T24gRnJpLCBKYW4gMiwgMjAyNiBhdCA4OjAx4oCvQU0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5v
cmc+IHdyb3RlOgoKPiBUaGlzIHNlcmllcyBhdHRlbXB0IHRvIGFkZCBwaW5jdHJsIHN1cHBvcnQg
Zm9yIFNwYWNlbWlUIEszIFNvQywKPgo+IEkndmUgcmVtb3ZlZCB0aGUgUkZDIHRhZyBhcyB0aGUg
ZHJpdmVyIGlzIHRlc3RlZCBvbiBLMyBTb0MuCgpQYXRjaGVzIGFwcGxpZWQgZm9yIExpbnV4IHY3
LjAhCgpUaGFua3MgZm9yIHlvdXIgbmljZSB3b3JrLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
