Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B01C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig6Gs1vm4ayg9t9mOnSey9nr0dKJlnS9wt0JJbdI3uU=; b=xMTZXris89XfZ8
	WxQg5hug0R4SYMQpBMG2PWgEdbyjERDC72Fyn44RTtGdlV+Oczj82Dqz9g1tLvC5IQPCcQhFWxEky
	cfX/XrK1l1xJguF5jSdcNF0yp0Y9iq8eoKU2mVvHLdd3as2ySW3jZChycv3lWyRm0qistyPXJtOc9
	eDH4wYrewaBjy8HPyaQrvWhYPPBBU67u7svKJpw4oAtRqdJbzK5sftLwOXZRwOh57y9L0WQSqd7kh
	dBy7VMi0xfFLCeNpC+DhNcqSGd+rsIl3I+amVtKVpYsDB3dBL0L9Jd4hV+K7QrjnmG5AEQTi8qlxR
	NQmUOK+oMp5AfpE6w/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaH2-0030d1-KS; Fri, 24 Feb 2023 15:46:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGw-0030aA-Q7
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id p16so9476122wmq.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcDZ6zh50PVgWZXJT970Mbf9wG9NBFnalKpCXU14jS0=;
        b=Urp1qti8Ly6ie0YcBFV0VhTJru8zToi5K0kO7mtkYA42peINRFDL1ALntIrB0AAqT9
         SF6lDrbOlkXZFRnXVLlmVpxVCgvDbwo78TzH8aOMzRrGJDqHhcwmFGxzSr74HIo2RgCJ
         UxapFlt3yBQcz+hzHYeO2kjYUHvf6DJ4LoqTuuVc9EPC0+bZwghWMC/3Ej4QcgZCSFua
         piKISTkBi0C2HLGpRox5VLCu+hPcxoQUZq0kBMWdd5VFzFCrxLtYdxe5oygW1KMhE4V9
         2livzVlXHljCMDRgKuFa36YLeEx5LpEixn5g9g7mpz7c30McPzbG1mJdaMjvly2vihgL
         7xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcDZ6zh50PVgWZXJT970Mbf9wG9NBFnalKpCXU14jS0=;
        b=nFeUbo+K3ofxprAg6HobxDFzCRWA19T4sDvpZofUdcM3VOfpjJqbd7+7kPXe4q0pVb
         e7szRvaAjbpphwvgnoa8I0QTUie4DEfH3leAuNjtJEPSjnqL+GwczSc1vhXHrO5efrCd
         5PBLmqg/jxjuxCicw6DQvU475suh0P3yT8oMi7UCkoTfBxcijq9snFR4oD6rQnQI0zRy
         UcxyN8aU9xFpgRr06O4QLhkaE5YoWvJ3XEqvwCgmhHZIMIlWDNOi3N7VpPVwKcb6zfuU
         LC7NCjUSBZbgM962rErY1y3iqJ50Hst6k99xYu3CdTy1hms/2vBjGnPNPZ0jWCcJEOzH
         CGwQ==
X-Gm-Message-State: AO0yUKVAgEZqC27zgVG5yWzIPSw53DQcmJhV8SSD49Uaer21O8QQ8LiU
	wsiv9yrzH1SyfRYveoljSEedCvHMOXZNelNd
X-Google-Smtp-Source: AK7set/Mfnhb6NtncdM5RehxorI5GE9V1R7VcrhEJU4j3ingga9VoEangmZwJ9vGnV7q1P9fVfBdrA==
X-Received: by 2002:a05:600c:310c:b0:3ea:f6c4:3060 with SMTP id g12-20020a05600c310c00b003eaf6c43060mr2761040wmo.18.1677253564676;
        Fri, 24 Feb 2023 07:46:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t5-20020adff605000000b002c71dd1109fsm1966808wrp.47.2023.02.24.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:04 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/6] riscv: Clarify RISCV_ALTERNATIVE help text
Date: Fri, 24 Feb 2023 16:45:56 +0100
Message-Id: <20230224154601.88163-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074610_863561_D4D75CCA 
X-CRM114-Status: GOOD (  10.48  )
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

Clarify RISCV_ALTERNATIVE's help text by pointing out that code
patching is not only done at boot time, but also module load time.
Also point out that this is the minimal possible overhead.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81eb031887d2..eb087e17c91b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -380,8 +380,8 @@ config RISCV_ALTERNATIVE
 	help
 	  This Kconfig allows the kernel to automatically patch the
 	  errata required by the execution platform at run time. The
-	  code patching is performed once in the boot stages. It means
-	  that the overhead from this mechanism is just taken once.
+	  code patching overhead is minimal, as it's only done once
+	  at boot and once on each module load.
 
 config RISCV_ALTERNATIVE_EARLY
 	bool
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
