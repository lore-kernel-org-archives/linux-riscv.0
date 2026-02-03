Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DCE7FDE0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 00:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDVOowvNG14a9tEmY5vkGSWGLRba7Kd2USGCkLhV8hk=; b=USgkbbmtRtQJbf
	l0p9bX6ryEEO2eHNJO3YFc0AsR04otWOgBl27CCXiuZJ9aW7gydo1VorByQax5ap3PbIeUcyZ6735
	rmb7kyJsk77tkfeADeuSuUjWn+DAhnl0FWctOiCH6QTCVbf4Tg/kQxWD6NRRN+y3bYzh7rBna4Q26
	nenZnLCW2hxX0BFQo8f3cFT534lUUeabLI9NL0bjniIDw2zV/A9ZAs0MFy2aT+86B0rQrZ4HTgwtQ
	xKnLQd+6t68wQsg5gravXbbgU/sDkNP0cRxwHNMpgLQy3LhaWrv+7KXMzS4MHOXNeH1Lj4Xj5Bvxi
	dAgMw0eh/p03oEGavgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn3vF-00000005m2T-0TfN;
	Tue, 03 Feb 2026 00:05:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn3vD-00000005m2N-3y1o
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 00:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BC9660010
	for <linux-riscv@lists.infradead.org>; Tue,  3 Feb 2026 00:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEE3C116C6
	for <linux-riscv@lists.infradead.org>; Tue,  3 Feb 2026 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077134;
	bh=kKdeou5Pe7UeE6Ix+YqLXbuufCdY2z3T0wxGDQhiRmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BFnNi+Zv2dDy+uisnj62bhZmOx+Uo1c9U+Shqx5+M+Q41ftZ8Ifk/eOO8xYo4huRR
	 YPlMfNNCepNr+JIRQqPG2w2vjDnss3R0hIv4JhvSWyjyxC7PNQ4K/3KU5YS/NgidbI
	 CJNwwXfZ875JGiPaqCLo9lyonoSjbZNTJtkRpggtzfCM+Zl3thRgdOWiOqElJ58I5n
	 AhhWLprnJG7Druc1mYPMQ+aOXhJ0kgbQIPccu/fsQnWWpa8l2+o15K4QMvtclt4Qj/
	 pQ4vb8ODVBZIZpqdgZrTWzDTOttVLJiWiVht7YjVJgWoDj7t8NoBsWBAaKih6+GINJ
	 vG9TqvTQjfWdw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64965ee303dso4824127d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 16:05:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX/JqKCHmeJ9ufoAbA9X3ur3GsTtaxAadUU5mtXJHLMsDrv6IRyiAs0Wjfu5gyQSaezXrVkwpbhFx39A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzei9QCpJYF/SE+y6wPBID62e33aq5H4HfalkYIx85BtlMLrO9h
	THFZXQ0DaECHfpj9UkwmdGcAY5RzmR2f0r2QlgVq7XcKIHDOChBDd8D3xK6ykcx6hh364U8K3zd
	LNiUZCJQt3ykUErVuUo7x2GRJYx/nR1w=
X-Received: by 2002:a05:690e:124a:b0:644:51a4:4f16 with SMTP id
 956f58d0204a3-649a847327dmr10877144d50.45.1770077133463; Mon, 02 Feb 2026
 16:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
In-Reply-To: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:05:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLmMRcgo9-sMOh6+y+Hg73HjmXPG_ur=mPUEQ-hhuWCtfg@mail.gmail.com>
X-Gm-Features: AZwV_QjYr-Xcsc5cz_CTbglqWcpBs2gdc2w-EI4ETCV9es47TMb_bMpE3EZUcaA
Message-ID: <CAD++jLmMRcgo9-sMOh6+y+Hg73HjmXPG_ur=mPUEQ-hhuWCtfg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check warning
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgMTI6MjLigK9QTSBZaXh1biBMYW4gPGRsYW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgb25lIHZhbHVlIGZyb20gZHJpdmUt
c3RyZW5ndGggbWF5IG1hdGNoIHRvIG1vcmUgdGhhbgo+IHR3byBkaWZmZXJlbnQgZW51bSBncm91
cHMgd2hpY2ggbGVhZCB0byBEVCBjb21wbGFpbnQsIHN3aXRjaCB0byB1c2UgJ2FueU9mJwo+IHRv
IGZpeCB0aGlzIGtpbmQgd2FybmluZy4KPgo+IEZpeGVzOiBjM2VmYWMwNTkyZjggKCJkdC1iaW5k
aW5nczogcGluY3RybDogc3BhY2VtaXQ6IGNvbnZlcnQgZHJpdmUgc3RyZW5ndGggdG8gc2NoZW1h
IGZvcm1hdCIpCj4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CgpQ
YXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
