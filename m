Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C906CFA753
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9pmsKythKjajI3HU+XqyEpP32vh63yb7q9ZF3cTcWI=; b=O3nYgPOUNZXMcl
	Qzpw1urkF2ApQfE7IMkN7XH/qyLXkA9B2moexHZFriftGn4Q+Qi5slWMz3uW4jkgAeSr7BoZ0oIRN
	yHx5UBuUt90bRbjwelv+P7tYSzOgEjyDKJrv4lJb7FFKy8jj3FuqTaoK84uukqojCcT0IaO7fyNzl
	2rAAEggKI953DNVPugIESD0Y52U210YpwKdC34IwhUEhfbOkWlRJ68E1htPTaWJpyiBd++TdFz8MB
	yoSAsokVF5xM3DGMpDTVeMsqu5pAJNIo8Eqt3vjmMftU5rVyQmXI7L9Qt7hHHMJiuKzN8DFcxUuCs
	Nf73s83xAXbg80ZZ+I3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSK-0000000BMYL-1ocA;
	Fri, 04 Oct 2024 08:14:32 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdKh-0000000BKgX-1Jtl
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 08:06:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e06acff261so1363836a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728029198; x=1728633998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y73WDyKyJEYsN8PN22hVxCPugmFrQFKaxxQTk+Xrnpw=;
        b=humKKOyOHHCcmi5xNENRCiMiP+T4JD7tyqoSA873z/Icao/RtQow8wEl02FUnWaHv/
         HgOrWyOesLCcTHqFyG5iMwnuGM5GQkayTxD1eszCJaEmWAAp8amWViLWNTr4lGq7PxQx
         7BUKS0w48o2d8mi9ZX6EJn6oIplcd6LnvXyv71HVpf7+YMPgiEQuJjOz30n4lswBDPk5
         RTrGtt5w6K9z4EiY5+FOs8ofoRh72yYHkZ142NlGa4SvI13xIAP6iPAvbXlA5LzWvApn
         SqG9+mZd+I25zaR5GJTX+u1R1GVWniXUv1sTe3snGP/hG/flMPdWME1lcnvorA7Klmyw
         ddzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029198; x=1728633998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y73WDyKyJEYsN8PN22hVxCPugmFrQFKaxxQTk+Xrnpw=;
        b=O0630SQ8Hsu9TfolnHjcrVm/eF3ZqYbT5RLzPq6vi2QlZAmUR+6aQb/TxL+vRDls+t
         bGQtBlp3yZS0qv8yyBmEJ8ZU+fafhDq1Dati2Xktq9aTVwX21WH2XSB77R/uMceT6TsV
         JTIn0atZu8h31X781o2edGqLVZnW+k5ev2DglLzmUHNyFCq4DOEnd9rKWjNSLjnFThA+
         E+XgHysqm10CkSpiAmBjY5yJuLpBub6vcuKxZoulkOJxnzZMj60A/vxtXWH14/BBpRJj
         /BAQppze6lckYRH7/HZ1fqkh8JPQbHjnyQHAqucNw1of0pZTUM9BlSCw6HIBwAtfFRAq
         Evog==
X-Forwarded-Encrypted: i=1; AJvYcCVqximN8qxM9SlXiDLoteZn+qCm5KGAN3uzQCA5xJkuLLS707Nwc8Olb93HOKTGKTMrN2/987P/fA7E9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz9G17zxrL/hi8gZ6qNdVlM/wt1t2Dxw8GZuuKL0S4vOFW77+H
	autP6Gr0l/Bws4oA9DSbyA9zEwRN1RspTVJe8+zp7We6lV1yreyX
X-Google-Smtp-Source: AGHT+IF6O1aW5lW097FsX4Qpu8qZu9bKqcaxB0twSRt7bC2I6twpaDw4gXeZNQiDtRGPSVjNOqKEMA==
X-Received: by 2002:a17:90b:504:b0:2e1:dcb5:361d with SMTP id 98e67ed59e1d1-2e1e636f4a2mr2337155a91.30.1728029198222;
        Fri, 04 Oct 2024 01:06:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e83cab42sm927448a91.2.2024.10.04.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:06:37 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
Date: Fri,  4 Oct 2024 16:05:57 +0800
Message-ID: <20241004080557.2262872-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004080557.2262872-1-inochiama@gmail.com>
References: <20241004080557.2262872-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_010639_378855_80C9EF4D 
X-CRM114-Status: UNSURE (   7.99  )
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

Add support for T-HEAD C900 ACLINT SSWI irqchip.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..5b1d6325df85 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -256,6 +256,7 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
--
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
