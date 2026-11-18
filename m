Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8960A2619
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TxuR/bGw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hp1UKGXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QbqoIoAP0R0F8b7T2uFpYYONonklMoTOtN3gagBTX0E=; b=TxuR/bGwb+gRvXxshsdDq8G3xm
	vUVH/0Ia8wWoTdZPJiBRktoSn17iITi5Xv71ol4ZqkwnAHcuulAZstOBAUPg8wXbk7DLprNRvxVep
	0elGqdor9aA/b9HLmNFhfoc6HWz+30R+helPKzK/RvW6lYXQdrU7mX+1i1bnysv4nLx8065wlAVzH
	qbQ/MFIny/z2+cZWOaaP0Oia6tkrQlJAEdjl/gRKkkCZbXkeg/y9uYY1qKUtgOR12E2x0mrV49Eci
	rNNXiKkhssXHhGNBVWxn3pD0Z4DOeKF2GtHemjxEfaXMmz0fwtFCSLy3a+4owuy8J0IdhNtt706sL
	BU8UtUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgOU-000000094Br-3pDa;
	Wed, 18 Nov 2026 14:12:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgOO-000000094A2-21j4
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 14:12:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so381296f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795011126; x=1795615926; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=Hp1UKGXaavw5ONPuwGOcjuGjLQ0vcvtFTnJSKB0C/a+hpZzcizIO/XjRHXgSKrQv2C
         KF51qmZqZkAI0kPAh+1In8fxi2Om1Wvy6rIdrGyyLuTlZrwpDwSZC0DGuLVKzd8a79wN
         dVV4yCGw2he/LTO3X8EXzbdbXtpnUahiQPLGKtgq38Z0ka2F9hBZoBZAluVD+dHvU5MD
         rcFbVpZxrHlGhZ6xrMSZ9sHXX4pbuLEHgKWVGNv//odnGBu/nQHvxkdsPHKYJurAFROG
         p37Q29FXFUyQRvnjr/gWbYKc8XIa3XeI7J/EULh4mNt5wRuw3TzGkuRJsyXGVCeN+TB/
         SFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011126; x=1795615926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=uDrKy1p+2ApQP22PFBq765ImTZUUFQu0j91AYWXzYVj7EklNHFOJanywV45x0ZscCA
         4xzLqRXR+eFaWO4+tJ7c7EsfOBKgW1ea/jZ4E5+iIi7xFt7ii6aJMa1Pci6+jaZKcPFH
         7ZzdzZMWJ4pJfEKgEbIgOyZ6FqUXVaxfVVrVTca5jWtnNGiN58rAIA8S0syLILbrA1Re
         QSRJRQtdOu5M0UmsCYGgjKaNqGN1QaORCOzWpCFVaKo3MypV2abgedz+GzNoEfemHMu3
         medSalJNAcfIPgoOfeAhgQRpQHatd0tS1WOH1kpnrTrSR/s4PeaudZk/DDx3IhX9MsHY
         EyAg==
X-Forwarded-Encrypted: i=1; AL+hErEwr1l6qz6AOQ2CjiqeT8jbzzlcthMhIxXYst3I7n9RW/GgMPzrjWRQ36J0kBmZ220VBMpGL2yRnlIcLg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+KM1BCHpBUPr7abCTFYECjCRqICuytma5v+Z0vUQFKEuUa3t+7
	PwN+jiZyX2QaK3g7Xim/349ujOQXqFcV29Z6dLhaPck3g+5AUiDe8TlRsmKBDE2NPxo=
X-Gm-Gg: AZFdTZctvJXfRlhIEhMgYQYANr5Tc7HxVww6MYzA7PHUrwNHYZw6n7VS9SlHBKLu/xk
	uXzDnxornFUscfNYMgiNAtM4YxzX/Tzs2dR437TbtXPKMuxxgtjTIrWkmhRInuRF8Qqigd7N1tx
	GXElwhbdB1FDIej6TvCeKJ+yrGuZ7fsz3t+1OnaMbIqoeB0BTfVnxzoUGAFP6Z/L6ViMH7pDEdm
	Yd0ip7gjSYOx11W62uv/TFmJ0BF+HGCDm4mQNL9RAAMA2fXr9/3L1uHPJflOjvVVMaIMhdjKslc
	JWPVdmepB10rpsye2FqU1ly6MAID8Rk3o+xGVsY/SB+bkc5mYIq37a1fot5Mu3U/faF7eLT5l7U
	0gFZq8443qTKeTZ7961qy169XbUxCuL+wWueI9S/1Sl4xxXT8EmnoDpI64tLpIjHForCC+pgE7r
	DZStId0XJFnulffl1/bsH1g/V31sfcu0xqSYok29qxRrh+aJbzWxHmdWmokTGtGndc9TJiiy/4R
	79ft/GY447sGOsTUwPFY8p2oOeJ/byfhV5l1eSsktr3vFNLlA73uKHAnEF7Tz96wUiHHp+WYoEZ
	IRpA3JJc3m6o2bI1EhciAaJY1Hx9DiEX1Z/GmfuJvYVLHgkH
X-Received: by 2002:a05:6000:186b:b0:48e:88e2:fe6a with SMTP id ffacd0b85a97d-4a63f4623d2mr6222883f8f.49.1795011126108;
        Wed, 18 Nov 2026 06:12:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5590663f8f.8.2026.11.18.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
Date: Wed, 18 Nov 2026 15:12:02 +0100
Message-Id: <179501112283.639563.5233054429317576626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vlDn3aALOXByZVs7mEqRvuJC3A1ctnxY975yMiaHYv8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/N5nknC99zPPvkMAeEz+LJ/rb3O42SObtqLnBOZNhY
 rKGh3pmRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyv5rhf+pRtSNHwkU+xf62
 3H1MSnpnB/t0htMrxT57Xp29uUlbppLhf/BEnSWNU72uGOXvU9VP+/jowUV9g7UhNjMfXXfY/J3
 3GgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_061208_545572_8AE16BE0 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> maintaining its drivers. Jia's listed company email address is
> no longer available.
> 
> Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> Xincheng Zhang from the PCIe maintainer entry.
> 
> Having two maintainers provides continuity for maintenance and
> patch review when either maintainer is unavailable, as suggested
> by Conor Dooley during the UltraRISC maintenance handover.
> 
> Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/
> 
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> ---
> Hi all,
> 
> Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> maintain these drivers. Jia's listed company email address is
> no longer available.

Maintenance is not necessarily tied to an employer.
It would be better if the people removed could Ack the change, and let
the community know they don't plan on being involved anymore.

If they do not reply within a reasonable timeframe (a cycle maybe?) I guess
you can remove them anyway.

That does not prevent you from adding yourself in the meantime.

I suppose this would go through a starfive/riscv tree ?

For the clock:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
