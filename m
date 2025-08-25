Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22DCCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSCjc+jpJmfhJS99wPbwIOJWyd58Hw/lkatyfolyevc=; b=yazbjC95SwkkWp
	D53K5Nq7pemS8VStS+On526ltik3K6y2mLfbCrFqtxzJyzHEa+RLxkbLi5OG5uNZsewSfC4MMizKg
	Ye0VZ7B5Vv+3wKsdYAW6UQSVaE+c4l8OROw/2IdOpz2TyvkIv/9UFtKEq2gwbkd/UsO4YAzpp/TGu
	WAiRSHHljdAQ80I1eI8Q79HmcvBWJqySQQCMyC5xf0eI8RRRAR9PzEyeQlpeZPZcq194Vaad7h+gW
	8yhQ8BvivpGG3yVAhN6WVDhZnerce39pPdlS5i7JTqw34v5GAOzxo8tFfkxIwALPWULbDUx6fNQ1K
	iE8T+cyvOuN82N2gA7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgI-00000008N7J-34Ue;
	Mon, 25 Aug 2025 15:00:22 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXBb-000000084di-1xTz
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 13:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1756128275; x=1787664275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bnrVDdhwgAXs9/wqHzUcqry2Br56Ejy1ctzZpmkn+/w=;
  b=KTvDMeWVQDVpXXdS9tKaTMzFfyKE2lfqz2nbNfoKctzyIVFqKSh0BccA
   o0OIRNsQwc5aiT8CsIDDs4vNcOx2Wyh7E0s9vTU6QDC75RmGyDXtYjasm
   qQ8IlGQ9ofhU0cLnDvkctGUVcVEQPbMxYAL+plsEJktIwGJCIPJQduXHy
   P5txsJKf80Sy5RGITBzKqxKWL4V9y5OnXIieCJ3dP/8hj+dJVDmkzGiAj
   zH+clvfr3HKjZRKbOHcsgxfO1ZBD795zEJZIiRIxWhOtKm3LCHYcSo3QG
   j8J7EcIApEu5mj0XrcJ+ipFN0Ky7CcoYzDRBQ9hoM8pK9WqCK/7/pLthZ
   A==;
X-CSE-ConnectionGUID: TAVgfM3iSXKbaTAOms3/IQ==
X-CSE-MsgGUID: Xu/zd4N2RPKqjp/65su9Ww==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31566538"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 25 Aug 2025 07:24:33 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 4/6] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Mon, 25 Aug 2025 18:54:25 +0530
Message-Id: <20250825132427.1618089-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Aug 2025 13:24:28.0050 (UTC) FILETIME=[95372F20:01DC15C3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_062435_560870_F47D9FCB 
X-CRM114-Status: UNSURE (   6.19  )
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

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Add compatible string for ESWIN EIC7700 PLIC.

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc24301..f683d696909b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-plic
+              - eswin,eic7700-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
