Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26192C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUQIlQf/beUCZswj3Qqa3UyyAI5f7k1oi7OiHJmTlXs=; b=Et+o2ytfXwUL5D
	zyQwxlB+1jbAIo8dYgJmsLzOrx2S+ulT0IDP0WfMoafa2YzAuDmWrLGyut1YX4f2/8GHEsR1JRkhh
	1aQZnLGMFofV8YQOwTHDTB23ra1yBP4vR/B7qO1SCFKlYV2oPfeTTtGcDUoCEUd6kIpnwGnfonoX6
	IPst6c3XS9gk6bK2Wsw5WQtOF0wKREQF6bHq156wfNW0OQ+k2stMwRKWT1TEMFpMPzfSG21Hb9IGI
	CebWw2wWjRVSqhCd4PunkHpZB5rLt3W/UGjeV9plZjcgKQvQX7YqEAtO0Vpt06IGAUMHPz2GDmny+
	fImMlWTiuizpSv9iHXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugn-0000000BA9m-0xqz;
	Thu, 10 Apr 2025 16:23:41 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmT-0000000B0RB-2mbU
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=881; q=dns/txt;
  s=NAESA-Selector1; t=1744298730; x=1775834730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hrFC8akR20pQMYn01FDGTaAf1FudakKyQp4tQR7was=;
  b=qV+M3yuZsR2xH+Hoi2JYOFuzI8oEyXUWdUW4Kn5W+oj5ZfIpi4p5fHzM
   ygbGAFYSlLHt4PHMJGYi/Kqc2Zp6L04T/1eyWbCQO/YNkTOV8OjEli4/7
   94h2tfJuSLg+kLJx17q43maWOpIzoSKp0h/ge4J/GDfJ4NtQfeZbL3sF4
   fD0iEpoGFEQ4df+Oy+yHjQxehlD94nkXF0NT8CUieMA7d68bPHM+XJ75C
   3xIp3E6u3tbGH0NUK+hOaF9HmyHBzd8pV8QGbUGvB9wji5SY4HSAOdKDJ
   va3LLEkvaZQZ107T09PVy0oidPCMgJQufPKGc8WXvkmdWN14VS3sbmYKp
   Q==;
X-CSE-ConnectionGUID: jM7wT/XRRwy1eSJLzVyGZA==
X-CSE-MsgGUID: Ul4EbNxQRnikv2lUAtVnkQ==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515090"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:28 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] cache: sifive_ccache: Add ESWIN EIC7700 support
Date: Thu, 10 Apr 2025 20:55:15 +0530
Message-Id: <20250410152519.1358964-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0939 (UTC) FILETIME=[C515E130:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082529_773656_52DA147A 
X-CRM114-Status: UNSURE (   9.39  )
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

This adds support for the ESWIN EIC7700 SoC which also features this
SiFive composable cache controller.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 6874b72ec59d..e1a283805ea7 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -118,6 +118,8 @@ static void ccache_config_read(void)
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
+	{ .compatible = "eswin,eic7700-l3-cache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
