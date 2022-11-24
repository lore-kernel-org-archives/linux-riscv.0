Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEF7C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTduddAjWlSW1Hu9r+dIH0q6XZZcOqDjt/aAEB7Vmgo=; b=xvjh/ceooilPW+
	0xCkSN8NNZWUgY8jlljeM93netrFBsd5HOU8xZZK0Q5M2brBhsBo+wWHAfBuKn86cApLR+JCUEdqn
	vXh1JmZEneeqe4ciULtaaP5vUFNcGNqbPc2x4XMmGJUa1EnVP4k6cS1P6uStMHaHx+04EGBEekx8Z
	4wBljBlpha6ScVtHvYPQj0Dg99fpSr5HDAnnVMCqhy6YZHJkaPRARxqHfobydx1+bRhJ9mhn01Ivn
	unGTspRjD6ioSz5QnqZD6pukTKlioj44WvGTVXi3WZG6j6uQqhJKSNW8ZUEk0+nDNJsuvVTMyYtSJ
	GPedzdqL9qQULWMLWM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFwE-00AQry-GS; Thu, 24 Nov 2022 17:23:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvv-00AQgT-TB
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:22:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so4406066wmb.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utYHq/Eub/BXbR5vrvSJsruIG0O9SmYPcZyptCx8AhU=;
        b=Npx+EPqniIEdw0EGXuCVh/54/X2bN/m9Ko8XV6byM7vi6TFjX6rxSlG+IXu1nwxbN9
         u3oQhCq9Xyr/SS9lUJAvnbNJ8++PpWAvj4DYNW0ypn0RC8fi+mPwpcDd8dNRRGIulcFC
         Qbisx1RteagjzWBSAoE649Y/WYFrfKcLVeGkhB49mTkiLyf26sh5bwDIhsFtQbfX7Li6
         N4uaVDVzLkz7kfsoU/giseFXlLTk0qHHl+/3MVqXy3jDpVigxfQEWMu2AEh9ij/5M4Ye
         nbrVlTqQnLLIYETbjzD8HtUduC8AYGf0Uzr7Tui1nE9uu8BvCOtwpsq7kVqKRCau2f8G
         VYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utYHq/Eub/BXbR5vrvSJsruIG0O9SmYPcZyptCx8AhU=;
        b=LdKZF5VDSK7bc5D6ds9fdXep/p1B88TQHpDjUMNVi+D8D2RfqNIL6eyJtVXf/YAdRB
         HfTCTZtPM951WgEERIiaoyZJxU97BqRr63ZMuI9m6UZeU5r5YYge9+OnswJHd3OetwYe
         djbYF2CFQ4rf3tNZI/u7Q69ngTr5EafXOa5A4pMefz7dRKHlGuwPJaKV4zaKY73fuu6n
         t8cxe/7wk6saM+OHkwx63ZCYBOZ4wiTXD9nD0C/Pq7xzqmS30jITOuMsbl0YHyxhzoa2
         ziYPLgXLK9t7dP3p+XI1v30i4Rf9OS86kGKBx1LS8TFSnxpmU8HqyndJj2ic4AiisbMS
         gVgw==
X-Gm-Message-State: ANoB5plrcUdgnwtjCcG+yNkC6FjzeS40KmIn+3zyqwo0jgY2bFP2u7Em
	/mQMy/XoKMDQyiVosS1y6Oc=
X-Google-Smtp-Source: AA0mqf7zKWGNZV2S6uoeTnYAAunHGD4Gcv0UaFe1QxECQqw2HOvWZNeKoOOsjFHF9DXN8XqFA8XrbQ==
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id y18-20020a1c4b12000000b003cf90de7724mr28080170wma.18.1669310560602;
        Thu, 24 Nov 2022 09:22:40 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:89ee:3f5d:1c99:35d8])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003c64c186206sm2698086wmn.16.2022.11.24.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:22:39 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/7] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Thu, 24 Nov 2022 17:22:02 +0000
Message-Id: <20221124172207.153718-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092244_031825_ACE0D882 
X-CRM114-Status: UNSURE (   8.47  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
