Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4BF30296
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyqUFCsf/ZbF8orvENhaN3m/xXHAH3K7qGIoCv1m2J0=; b=TcvRN9IybFwJxC
	qlV4LE00QnpXfzwpw5q9ehYzNvDAmxdBsbKi8Mkp0NiA4LpCcxndX4b6F44WdYdq+NH7Kw/Lx7n8S
	/p6mYp7UoLr9z1Jj9cjHAlNTkmkLPHee0vc2yOTr22Ovxx1ztwGDkiOFEY78by4asDtbj/pm7ZYwz
	aBm9XsWs0ueJ4tnnajgiPryQLTFghO2gqQEj8AXQxX13kaQj2uRqiroEjTRnYdAZ8td4w06yVlRco
	3R9NE0mjHqe1ZYKlABSIIEOfBIPDbUormwEozW/6PAa2m4g2yiSM2rumdaBdlhGB8PPBputHDjAFh
	cM+ncHVnZfo6rm0EsbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKk-000000033xt-1OCG;
	Mon, 16 Mar 2026 01:01:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKX-000000033se-12Dy
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8299c75f730so2243106b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622872; x=1774227672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=PGhBCzfVeOqMeFg4ZHk4Z+1yQs4HSfEVhcyc1o3b14gIKxsTxdj9ozi5n4TbJZULl1
         FQBrjc+ZqbqOthnk+kaIMvIiFCkgGy1XgQ++q2lmerMZ2TtAs3KWVFmlaB93VP6k2BxT
         9fjDnclaw+fJSKKgPYyJbZG7zLGrhedIZ+YHWE2fG3O4ntJ1mXuH3+w2YH35SZZECZWu
         ceywI28XI/mmK0DrP4vNBUHEzyHw7QYvLBr365QxQON+RbZCzL3dA7v0m1yTiLrDtFUX
         1tdqc2i3vK4MarvhAOQIe9bxrwQDqDynzCMrrUCZvmYqkTfcddPcN39zM2O6gg8Stls1
         T+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622872; x=1774227672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=QLn78TOj6hOxnh9OplwumfvfF1lq6wi2/FPeM0WGbH+FiZ8DaXQ88vqgtPR9Aaa3jL
         FctoGbeWA4hbTDtdapQCRVpkfFZOurc+S4BjXOS5F8rCpjzcBIxKWGz7ivc3WrMrs1yv
         Khu5VjKB2ra/Mu+hjonquYcp+Ov65gRFu+OdU5hVcW4UrkQHNRsSpxwdJGNUvAdZdbtJ
         w5v47D8Yu3/mh9syFFH9mgidXu9HyuN6SiJhzeKV88fJlR7cg0WWV0kpZEZ/k/oquDAl
         XGEBDwXIEgAfqvXNvxNRozTeVhmc8DYieBiGwuW/AbYAF2njFe/Kdb0z339UexLkUFCL
         4crw==
X-Forwarded-Encrypted: i=1; AJvYcCUFaPwn+PZ60rGyEQGmW/NmQyMuA5hoPi8Xtfmoa1PU/M1py9qAQHm8ZzUPcOhJWm1SygFi7vZCvcmkRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW5xmxW0uU8yqc2mK3nMMz+bcCSwR6NSCt94Mu/khTe4jv8+Zk
	rtdD73c1VB9zR8Za1qRkMzxPrIX9hRb9VlePQOcWMAw+9KRYChpEMlCM
X-Gm-Gg: ATEYQzysGizbP+bQ4OApIyEZO2m36M1LPH0qPSvKty+d+O8YtcNQ4RMRA7F4HbPSpIS
	2sdWqoj2Dr4kF3lVPAtvnIlUyfkZBU7rITYmwDIMVlrtPtn6041saTX8JC+IJKt1hn5g9L0RpiU
	fsePKr8f2qckvLeybVtwOJ6zpX8px2o1y5HRrT2k+CFGDOt3LGKDJaE+h0PxhGqQ+k+hTk0jri7
	KbCRgg7cU7QaiKGDthQdRNvws11YaJm+8pbNQRXi1ztXtcXd7KcTk3F3apDxncA/j1RI3Q5UiIX
	E4dI5aKxrxxxUP6u4mVAi9QmF1g5RLVGj1B4O5Hov+YNzSmfUhJtK5GvDauak/Ydwk7r4LEHCbR
	SPwY599ySGBHEc3mnx/E+St4vhbLX0joOf/0TWeePNGb7IzUslcVJw7JXFMpo4LVplg4JU6ZTjn
	IhUZT2P7v6nmcUAqLaeOk1eOwxgFAt8NISEw==
X-Received: by 2002:a05:6a00:929f:b0:81c:ce40:b29b with SMTP id d2e1a72fcca58-82a193e89a5mr9456189b3a.15.1773622872449;
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072419efsm12308166b3a.11.2026.03.15.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Mon, 16 Mar 2026 09:00:40 +0800
Message-ID: <20260316010041.164360-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180113_615653_D08C9BA8 
X-CRM114-Status: UNSURE (   8.34  )
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

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
