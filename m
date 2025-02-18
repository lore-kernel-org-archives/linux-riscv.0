Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9BC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVPkq9RoY5IJYgWgHTknzq0y0+e86NE89XmkG/ZC+gk=; b=JujzaV5QCDnQ4O
	Ot2jOwLyDqCVWVetzSVrVJDrIAOTqXwzQEFtA7++2EKSFTxS4A3MA3ugx8BAKUtn9l9AjRB8xA8ZC
	LbtcA3uzWUDeL2SiM+YbZRTE3jhcqkx6Hlh6RAsY7pexF0V3vhoJGRBDIKfp3AYNXo0CRnAYXSLoE
	7SI2eQ4mGN7j1w5Eqqw4iW6y286RpbORbsWBkl9NhxMdsGlQm6hllWW62adRbZZiGLuDhm8uePRYY
	6//Xa2ew7J1buOFo4sP+NF9tnrSCGZm8j+kO6L7q3KYr36fZ3fsC0BpHNlf5m63EyAnzplwLx9cqb
	Doj2Jmq7giQ6RVNB213Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMnD-00000008AJn-32du;
	Tue, 18 Feb 2025 12:33:39 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMj5-000000089F9-1qzt;
	Tue, 18 Feb 2025 12:29:24 +0000
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so51382081fa.0;
        Tue, 18 Feb 2025 04:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739881756; x=1740486556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+VJIQ0ApMIfEX8niiA/w5UOINZk4mk6qd15CEV+pRs=;
        b=pT/4pYP9VT9vlHg6DEHMl0moyXNpw5t0/3b1qLKXyCwxzEYkMmx1IKsdeWiry9tL+J
         Ie3ktUI07o1wYEi3oBD9aBVwZnBkm93SUdUBHptctIBRbHDKg7pZMMfYtPpPJsVtU0bF
         BQkxjHgOJCErWhx80HHCK5wsu5AUEJXo5meIOFtjwMael/XosJyHbPtsiAl4fSWbFHPg
         uq8ETati8wFRI3RZN+BLOgigVcs8ZDFuBedfPEFdMSoIpZwZj6UvH7gSIcqkpWTaAwWi
         R+GyoXHzopgYsu8AEsnLRS71LmBe6DmI94atuKxbwHoDXb6mRVyo5KiBM5n+sOpKDt7r
         i49Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+DvhQ0JWftawmBaTRMQxc1SrmQpKSW8IRZyIZG7/UqSorPAYuPo1Jqw9KB3pv9+tG2sDKOJdQP1uzPgAt@lists.infradead.org, AJvYcCW4riitRsMbMNKyPZ0JOMq4N/ZCzefyW4mS2YC9iRTotWM3rLISimcVBWfONxpSlRal87Q0ZJmWxuX/S84=@lists.infradead.org, AJvYcCXGflRK4fzhoC30IIQbyJl3jQjtxYZx0a54XZRJUshYBExsFNniNIYYPJG3PY6AtL/ind5/7hqO8zHWw2mK/0O3qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlQ20ebiEKtTrmRNhADD/1szqiAJZ8YzIOjMj0O46kVqcewxyx
	+mXUGCcDcmeYBVCczmhS5A4ArKAVgarrPIQ425Nt8HXTn9gCHrlugbMQDIWK4Dc=
X-Gm-Gg: ASbGncvRk7KeE1mHbhoutZJyJ5kPfcpP7jlpowyqkCVW9sqYlRGiwllqc0O8Db0yA66
	VR+Yy07xlJR3VU+A6TI7hN/yB3/fYT48Uy0IFqOzCyNm91enKFYLYwmsmnzH2qKirdBV1aq4laE
	sgdgRhPK5x5UvU3KgV441XykgSxIDegSmqr2kRMld485ps0lN0LOWlZEOE9540oHti+jpOrvs9F
	+x8q2of3vzPKZFkoK5eJWL6V4mMNLejJyDXXGlyZxMBd/SY6wHzJYQO3A6ih1FaM/tRwupdwrDb
	ZrrnbZFFzzgcX0Idj5hjpugFrY/7hT7tfh9cJQ796npNoOrt
X-Google-Smtp-Source: AGHT+IGEHeAW1f4vIdDqZ7AzqLi+b9aRuN/j9KIk1gBLBXocsY6kiAdb+lQLY7NcKrLiYPpMqUrJpA==
X-Received: by 2002:a2e:8808:0:b0:308:f4cc:9519 with SMTP id 38308e7fff4ca-30927a2cd16mr36962241fa.5.1739881756385;
        Tue, 18 Feb 2025 04:29:16 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b75esm19495651fa.103.2025.02.18.04.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 04:29:15 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30a317e4c27so18774201fa.2;
        Tue, 18 Feb 2025 04:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVhvUxpHJT3OP24WkZAK5nlhIIDb7Cp7dbQYl7C2ZniIbIbWubMwbXGXKAWIu9WqrJBh6+ukpoRKlQcD02@lists.infradead.org, AJvYcCWfMeEOa0b3s+wsZx9bc/m02Yi2Vvf/xpfc1ZNS0MAPStpWSUzQR00UFRJnr5hN2BwevGylVWtK2Hj/5Onbe4fl2g==@lists.infradead.org, AJvYcCWkevGYhBeRFbulYs3EQrAK2CkfZL59wWbOcOr5NdgtD1lLa8V5Eeq4ou2/Brwb3/j1PFzLlLu28cfwPsI=@lists.infradead.org
X-Received: by 2002:a2e:9995:0:b0:308:fac7:9cc9 with SMTP id
 38308e7fff4ca-30927a474acmr41266951fa.14.1739881754898; Tue, 18 Feb 2025
 04:29:14 -0800 (PST)
MIME-Version: 1.0
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk> <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Feb 2025 20:29:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
X-Gm-Features: AWEUYZmOiTlBF_l0MM194DGfKDDxifchVc42QrgCh8BPzRfhHgMRNbv9Q3dSaz0
Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_speed
 is an int
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Drew Fustini <drew@pdp7.com>, Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, NXP S32 Linux Team <s32@nxp.com>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_042923_483668_CB9C1D69 
X-CRM114-Status: GOOD (  12.86  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgNjoyNeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gcHJpdi0+cGxhdC0+Zml4X21h
Y19zcGVlZCgpIGlzIGNhbGxlZCBmcm9tIHN0bW1hY19tYWNfbGlua191cCgpLCB3aGljaAo+IGlz
IHBhc3NlZCB0aGUgc3BlZWQgYXMgYW4gImludCIuIEhvd2V2ZXIsIGZpeF9tYWNfc3BlZWQoKSBp
bXBsaWNpdGx5Cj4gY2FzdHMgdGhpcyB0byBhbiB1bnNpZ25lZCBpbnQuIFNvbWUgcGxhdGZvcm0g
Z2x1ZSBjb2RlIHByaW50IHRoaXMgdmFsdWUKPiB1c2luZyAldSwgb3RoZXJzIHdpdGggJWQuIFNv
bWUgaW1wbGljaXRseSBjYXN0IGl0IGJhY2sgdG8gYW4gaW50LCBhbmQKPiBvdGhlcnMgdG8gdTMy
Lgo+Cj4gR29vZCBwcmFjdGljZSBpcyB0byB1c2Ugb25lIHR5cGUgYW5kIG9ubHkgb25lIHR5cGUg
dG8gcmVwcmVzZW50IGEgdmFsdWUKPiBiZWluZyBwYXNzZWQgYXJvdW5kIGEgZHJpdmVyLgo+Cj4g
U3dpdGNoIGFsbCBvZiB0aGVzZSBvdmVyIHRvIGNvbnNpc3RlbnRseSB1c2UgImludCIgd2hlbiBk
ZWFsaW5nIHdpdGggYQo+IHNwZWVkIHBhc3NlZCBmcm9tIHN0bW1hY19tYWNfbGlua191cCgpLCBl
dmVuIHRob3VnaCB0aGUgc3BlZWQgd2lsbAo+IGFsd2F5cyBiZSBwb3NpdGl2ZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Cj4gLS0tCgo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1z
dW54aS5jICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
