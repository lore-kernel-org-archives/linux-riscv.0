Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F44C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae8zLBpN7M/nGlm/fnQ/i6CZbT1AVoo5N6S2NmDKeiA=; b=1T0LqwM920zkHH
	DJFmMyjEtJOvYVw6boLhh720gwsqXVzp+lxTM1cks8rfbxw3aM7HPPvfRuR7ryomPLRic75aUkNR7
	bdbrhKTaBRj2ZVGO0+ljjN5GefcJu7kx1XtWEoPc9tu2c5Gnj9F+4Ga4vYWJcnG4dP1O1VhGPE7QN
	drXNNk/CmNjb7dpd2OJDtqZkkKl9rqntZMzysD57qO8/TUddYkf/W3H7J7Y8PIggtG3KF7LRh7T0Z
	Q30Dy/uyIT3E6oEe2at/bCr8afGEJZxaCoJOFAmakhqxub83HXUWYcIjwJuQT757JbyPNmqG7IKSD
	jlDEHcuAa++UJf6LSSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Oko-00000002IoB-1NiY;
	Sun, 20 Apr 2025 07:06:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Okl-00000002Imi-3cn9
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:06:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so3112256b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132771; x=1745737571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=cguWo0iNjq1YePrm/gx4DYXyFVygo35T6ragRZTaRXbgGsEkVz012I+XAlAuGEhgqg
         wU9v2LiBoBYlIJNEEScaBrZsf8E/Rt5zalD9anjYOZElbLkjRlSbfNtL3Jc9LZ4nOyRE
         DiiWssdncV1PFUPkF3ekWi1lH020BwI4vZ77TW5kPt6P35oI/KVUUpMa39ZJe9JkvlSc
         cg9UxtbgFjLXebXZl6QZXc2B8Ud3e9v9gVc4Ib0xxItnfA9i84UWAd0VyLel44JysOzP
         laO7kI4PAxA7wU9/mg63pY2PeBdnC3HVe7bYTVw0DfAKpLyA9z2HwJYRQU4H5cCxLrKM
         C8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132771; x=1745737571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=HA12DhdryJWK2K4P24InXs+jcs+aJfu8iScvjnXw3d7xQwFUrnbS6iacoNF7lBmjTs
         hsj/vxlnUq9EUBd2Qblc0zJMFbf+OCuQoJ4MhHMguA9Fo+faTk2uCyEmb5LYNuTatEFr
         xBOfHvvkSOHE4pp2xA0VK3aVG8viSk+Izv9nh38uG+VSAsu4pgpBk+vBRFtBxNv1n0zw
         HR2tjThVj11TKNxkm0YmXnVIericj3Nbm8RpmGJ2lXNx0c4yURyxcjlrAuYkDuqgJv1W
         622LOkelXeDm1cbfqBaTJCcd7wHX3ttY4g7f48qNEQYLn+jx52fr50xaozPekXJCDS6a
         6xRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR9WfraLXYdow6z95/BHljXPa+geVKaQuYN6WOiuCAzPGMlgUVm63JnZeViPS7drQ0PcTX0qFurKdnOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyxvNaMpvQIqVppMnXT7haMgQ8Iv4UHY3hATuuYyx/FXmtu/Ml
	3S+dWQgzXcDo8LI+wKedjq++oAetkpjM3YqU7UXXsyxyDGGBv6gJ6LmjqimWf4A=
X-Gm-Gg: ASbGncv/WOxdS1UmWXcK64Wub7qT8cJBPL3YPrQBmXv39yXjKA3S3o3YojOjoNcbdDp
	YNh6ZT+MnQ2VVwlwUvV0hxPOAwWSfXajSLFphCJwkobnoFNmG3E9iy0pc1Adj1K7+1AiVQMNL2h
	a6sOtNxEZwDclJC4CeSBLZTRw8ASukuSlu0rk8dlvmrfzc1Ze2MpmuqmyKxXbavyRj+WBSf+N5S
	plLGYjNovInOxNRsl7hkQtfpWH+KGC9oqRTdNtohXifYQrUw6c0cNgJehBztEze9EpXhpJCOtiI
	y25uAHbJuco9eEpFWw9Kb9yF/ARxVqr3E/YNgoev
X-Google-Smtp-Source: AGHT+IEE+OeQFiCCtU8Ee9YBkXu2dzO/ybh/igItlS4KQN0WO89uCSH/pwRn+/1oKh3T6c5poKcuYg==
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr10174885b3a.11.1745132771298;
        Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:06:10 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Sun, 20 Apr 2025 15:02:51 +0800
Message-ID: <20250420070251.378950-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000611_899913_D36B9782 
X-CRM114-Status: UNSURE (   8.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Changed PWM_PXA from built-in to a loadable module (=m)

arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4888529df1d8..8a8b77a0ac5a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
