Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB51C46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPCV103ROIlo2YWhzagp9XIV3k6AIOupTIYf2rQCAPk=; b=AuYvVnxuNs4t6W
	c6/r4DJe1rowtWjxHVKD8o6C7Wxt/KnQ7EB7h7jv7FAjP5qObLqmt7oWbIBgUPMPXbAAN4j3tcuat
	CYudf2jwo7PL4yT5fQI6OI+Sq3qlwLvVk8t0p6vet3uU8nPIkwLCy7gbC8rXxNeoLqg2qlXv7oRPk
	JF79OhPhnEaCDiJQMB3BBeyDLh7TsfnoEH8klUUKlC6pqhvJUn4UGbiQtRBzYslQ+Pi07ZuW9V5Hf
	j6qlx/CUJIB+bqC03B5TWk2UyOoR2s72BuLflHUHvt52OiKxx4YeQ4fWmQ9Q8OnXuK1mDLUe+Pxjn
	d8tVIE0LSUJi9hys1XSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFc-00GmN6-30;
	Wed, 20 Dec 2023 09:52:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFZ-00GmJY-2q;
	Wed, 20 Dec 2023 09:52:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2698eae0a9so22808566b.3;
        Wed, 20 Dec 2023 01:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065942; x=1703670742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGX77AFM52taWZ32rxqG8Bwre+qwZG4HAT6q9bfPoTE=;
        b=ko0yGOpmUV4GCMZ0dW/OjAL6WcvifYz1rsJ4SP2MU+uVaA6gexm/FG5m2uTdb+CQ8w
         5U/XuvhQ7jzA2+UMLPHan95yLVxM8wG7gJxzFthlC+SSdJdc9lDyrHSNlTim4Chv8bfD
         NriJNguVUndiCTdUcqcCH6T7E9EJbRCWUnLXLyDGwK7DTyX/LTb2IiePKWMxLvR5+MC1
         G95qgQ5qHvUs/Ok2HlZ4A6jzLZCnjr2UL4pnLWO4h8h8duVvkHcWF+5TBttDZvjRfmOg
         mTZC1RkMW1Fgn2oNS7UXZ5D4fPTAOGRbdRWPe0DHoeioOwOd6Od0+ankPeU+p+r4UDBF
         r/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065942; x=1703670742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGX77AFM52taWZ32rxqG8Bwre+qwZG4HAT6q9bfPoTE=;
        b=r1UQDhH/Al3mshdJX6eyl7Cfq/6sw/9aFaxjat6GD/Crvqenv2WeQxfppW3Vcu09By
         8y/Kk0lBZ7Vnkutmz4QmX/T9SRBN9nBWZW3HbnQQt9YfTCbTikXcOhtKqiJm6znjFfxY
         SabXztjHsJZfOTJC5Y1zNQSSRHHYsQeZYEc1LbqumnDgsOWQN78eX0/9Cp2uLbRm1exy
         oST0bU6S8uc8pLxzgepJECexJJkZy1p0vpnjYgmNfYubzcS62rsDmtQPvMIiZOg9TrHv
         o+t1JWWWoB+LYYBAz5oIPk4qPYU8NTh71y/ovGlMSCVvSxywkrLFtXGErEgnALmUSTql
         tLGQ==
X-Gm-Message-State: AOJu0YxNtQ7Kj3h+I5OApt2zaaxU4XkRFFSgL3SpwHdFaKd14ZvwSJxN
	f/MuA3jt1rxm0Bu+gELDJQg=
X-Google-Smtp-Source: AGHT+IFVwEX6DGx95xrmNxtWF3DNvy+WJuinCzQ56EUrqHU17sekrONr1kDAVmlp0UrKjEcsHl00/A==
X-Received: by 2002:a17:906:1de:b0:a23:743a:ac6e with SMTP id 30-20020a17090601de00b00a23743aac6emr1420552ejj.104.1703065941785;
        Wed, 20 Dec 2023 01:52:21 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.158])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm16596791ejc.18.2023.12.20.01.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:52:21 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH 2/2] riscv: dts: allwinner: Fill in OPPs
Date: Wed, 20 Dec 2023 10:51:41 +0100
Message-Id: <20231220095141.27883-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231220095141.27883-1-fusibrandon13@gmail.com>
References: <20231220095141.27883-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_015225_923205_34E1734F 
X-CRM114-Status: UNSURE (   9.73  )
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

Specifies two voltage ranges, in order of increasing stability,
for each OPP. This is heavily inspired by

https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133

and

https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 2f1771c19..8e7bc8bd0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -48,13 +48,17 @@ opp_table_cpu: opp-table-cpu {
 		opp-408000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt-speed0 = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 900000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt-speed0 = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000 900000 1100000>;
+			opp-microvolt-speed1 = <950000 900000 1100000>;
 		};
 	};
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
