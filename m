Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EECC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUjTDsI4JNlqKwcJjSejnQJURpS5I6cLC4N+HNSH9QU=; b=HOCDPbRoQa62Mc
	5V9LbqFJSBw+HDR+7yUqFoe+oVkPPyCsciIQwuTB6nA/JSKkecNaCVaEPGaP8EfOM1Lo/TmPDnAaO
	Hb0XW0bCDN0Jh5nW3X9zy+VZTKzryiJTOHtkPjbBs+l5t5SBT1shzjKgzeVB/Uj0q7KjfmPBTTyxt
	7vknoeyWbjzjUVJAbsc8UYD5ICVdvoojDOefLxm8yf06Jjedf2r0HkKhu6GrQ5A5w5Tg+k5iIGvcz
	70Xsx07PKrQVI6x9JxYHZ0w55oBPlpBTlbfkv1EaAP0DfcoYdWbVsyYbI4HFbWjQTtFSCnWRCDVRi
	Rt/V4IT5V+26dUdzay5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyad-00000006s9s-0Fca;
	Tue, 10 Jun 2025 13:00:31 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuY-00000006kJp-2vrH
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54e98f73850so5750249e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=GYQW6IpewUXtN1tx1n8cCgxD2Qpj9wdsvpx4HO6yAZZIX3H25+rpBEM7pMNO+6rmFw
         bum/KaE1dpvpyajmh/85dN7Fq+kDbMw9g8SmrHnY9CA8tMVSTks7natnKoxznnPThBy1
         XNJiH+TWOCSfvSpPWtPvfl3KN/9M9XkPzRpo8sMKSA1tOkt03BldOufRp9/tyLZt6dkP
         cc3QzVOF9xzYMaLpyh/412bqEx9U8wtAivhSFzFe+ztAuaEl1YVSEiyXaxtlvQMZgPSY
         j0ERoQ1bmCihlnhSSueyBnFCnN2YKrkUVx2RLktYWI+xlsebsczZo1A1qV8a1l3xmCyr
         yCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=X5hlOUIu23VFDuV9oR3jBf8siukFfI2TKlzv0ZaYiYZi+sP5GUiAUVqi3sN/HalfG5
         CpNXnXwoqKYDozQ+EgEZgk8SNq/QNNjCFGBEFIsawVJEADfDfKDoB27cG+EflcRK60cJ
         snx/jdJK0OVoUIXRwcYXxbrZpdjTTIYfI/hXeJAzuLqGyj+fAWt6IP/ppW/NO2hqLzz5
         xFH1Wm4v7yVMpDyRLnwLW6FdDVp+ngTSO6HFDtRBuuFhINxGMjdAU8Wjf/E3vqRS5xy0
         8Qk9xV8UU72An6IeBCyPU7ncN6JaFvGtvZbSz29k/VbIVel3ZtzBASXz1jURdd3keT6e
         YVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2pJxkaBrBt2DElKOEYYhSpdbuSyAqT09cy77dV1wHNPIqeH/LtoJZOfJrQ4/H7f0Y3YdNK3aC7F1zVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSvy17H+cQFTgPBFEu9sFf8iqDI16xvfUW+Q9cg9bOAYGYfUhl
	EJRXK6uV0Kqb8zKIUavvw1SVaFQHCZ8qyiL/9WNjHEdls918o4QH9ssXoVaw20mNW4SHpzhlPB7
	2Yh6075/j23nlfNWnHA/Ism+0J8Ac82oPgwWmGDP30Q==
X-Gm-Gg: ASbGncspfnYBSVZ1HPm0FCw08B8fdEcgt6rMXX4N3u/eEbnRo8S1O3hfhLeagZfFlLi
	2PXV5F7isuyDHEn9lwbRiUBpLg3rEe6yiG/nfsRB4S5TxwCOLCcqfdthEdu07pSnAhlPY24ad+g
	Zl0u8keSomlgWmPSc5IOpkYI/Pz8gDXHI5hjw/SLiGa1kDcM5FGgEIrg==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051702_752721_E26ABA4F 
X-CRM114-Status: UNSURE (   8.40  )
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

SGkgS3J6eXN6dG9mLAoKT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTI6NDHigK9QTSBLcnp5c3p0
b2YgS296bG93c2tpCjxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBJ
biBzZXZlcmFsIGRyaXZlcnMgcG9pbnRlcnMgdG8gJ3N0cnVjdCBwaW5jdHJsX2Rlc2MnIGlzIG5v
dCBtb2RpZmllZCwgc28KPiBzaW5jZSBjb3JlIGRvZXMgbm90IG1vZGlmeSBpdCwgaXQgY2FuIGJl
IG1hZGUgYXMgY29uc3QuCgp3aWxsIHlvdSByZWJhc2UgdGhpcyBzZXJpZXMgb24gdjYuMTYtcmMx
LCBmaXggdGhlIHNuYWdzIGFuZCBzZW5kIGEgbmV3IHZlcnNpb24/Ckl0J3MgYWxsIG5pY2UgY2xl
YW51cHMgc28gaXQnZCBiZSBncmVhdCB0byBqdXN0IG1lcmdlIHRoaXMuCgpZb3VycywKTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
