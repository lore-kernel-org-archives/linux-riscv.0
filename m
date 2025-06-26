Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F56C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpmdGLxtqB/zlmo8Li1Ghw2Vz/JV677QL/5d3eJ31eI=; b=AiLURu4MysSfPY
	yQd8K/YggzQLaiYrMENOoO4NRpkEhz6n+eeCMGGRT+pxaWXHAO88uXZkn1AUGrcKoMUwJqi8t5rrH
	Wo4f3IjylZLgyKGPZyHDMVKAAeGbg2Cp4VK8GkpJyQlWVIGN5tHI/vcW1/sKgemPIJdjJjGF6WAah
	HGZaXSjopDv3meTP6dWLHfJIuuMqOa0XmQKSe/su+5cHwysQoRFMn32P9aUODb2GWxsG+4bQsjr3J
	MYg2S5Ypv49WGGeWcPiL0fAzjNVT/4dlusz/Dtas3Edjp9266cLTlfDGBzsyA5BZc7C2NQKADnzlb
	kTdIqz3VqXIX9G0SnI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhem-0000000AtWZ-4BmX;
	Thu, 26 Jun 2025 08:08:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhXv-0000000AsQt-2Prq
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:01:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23636167afeso7486695ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924883; x=1751529683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=CWmFO3Gc0GDf2r7g12yhI80zlbI/Wn3i6MCrsb1ZnYLGm/vht8pKvLjLQyd7NCjgZR
         vxF+eZHAaYtXqEA2ZNljYWmgsPdQNUZM3YlNyXlfVFkssMmmkLS3ZuHJMvitfFmMIRHS
         YcJDs5qTKB8CzGfIDZylPtKSbLi7wXhgCzHvqaHvpEhx38qTGGiANQ8AKqHfbIsMUTMs
         p45FECwUdOp/S0psJFDYonW7GqQmnwlt0HfUmTxRkBXCpauDq9U5akBopkROHP7wEYDD
         SfHNtIbUOUw9q1pDGj5r/gryDHBnvXrAh8KJcBaDTrfHf5oCUzAcl6MgT2FVd9YVc2KK
         rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924883; x=1751529683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=GiFcBc30F6VI2t8s4usslIau+ARvZrb13tsv42N6Ik7VanLQf+ph9BsGByR+sQG0sq
         VC3GdeIHFyL5A8J+0YAhzexZ7eRvzTuxigZWbTrZMBex3jSkM8+GdZcDBJ6iWtsgjELO
         lhTQhqFfl27ZTyMU0VEtvQslxU4HTU4BoZA+fD6VKtMFSFLi/P3uNUFGWV5RlyDmIr6e
         u4FIQtBYRZ2Po8tjLHVYM2EwPfuLfcN+JLEVjnFKrFSnOFsaLQBOn8/eks8gFZLpPRyE
         w+l3vt6a9Gaw0vQSp1jYcq43j72LGpXsz1BGPJYsU67UoNeqd9ezsICi9YVkC8DFOKlb
         iLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW7fQjNYjvYpduN2+uw6P1lgy3jAKr79BJpd5sTLIQxPCB5RbAE/l7oTiOiAhWYTwu+a2Ear2Oe6Tq2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGMdpKG5Of+YEEJYNAwzi28EjIKuMP/6ZtDgud/GlYheyi8JUJ
	+n8LfJdPM1JgGv+ADu8FmRvInQkNM0Rc0zm2/Q/sGoCh96PaVuPMx7/h
X-Gm-Gg: ASbGnctnCxZO7LomnK1xzAAvjRK39IKWBbx1UEKNLeuhD6AbVswcfNVmYwvRUs/fss2
	keX+cD94csRIUR/rXKyHFjgkShKjV1qmRYKGioMAuz1WpOOefUb7JCWm6suMo0ZDKM9UDYbPq9k
	5VdLsBzBgsqBoaxo5brUQi0uCo8Pg2u2uOkuQYN9gSWm6IGROIEiaQjDmXwq/cZb6I/OWUlOoCS
	AduWACviF6QzsfjqS50ALtA0bdEVBOS/xuqmCuRzXC0p9yw8Ri3q0gPlvZb8SJWNBaWn8yCAIgv
	FiRvAVUgO0pGiY2UmyKNxibHhIrdxG43AaXC1vHQ/kTAj+TgslJ//lHDVJwcoA==
X-Google-Smtp-Source: AGHT+IHEcN9TqXpZqCIhiJkeXd5Rd4ZpIJF9ZCmoYkubJ2AJSnfavgHhpNIHpdPsx+RjCvP+UqGFrw==
X-Received: by 2002:a17:902:e947:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23823f88824mr119070055ad.10.1750924882766;
        Thu, 26 Jun 2025 01:01:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8695195sm156236865ad.187.2025.06.26.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 4/4] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Thu, 26 Jun 2025 16:00:54 +0800
Message-ID: <20250626080056.325496-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010123_611826_1CAFC8A8 
X-CRM114-Status: UNSURE (   8.12  )
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

Enable ethernet controller and mdio multiplexer device on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..4a5835fa9e96 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,14 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
