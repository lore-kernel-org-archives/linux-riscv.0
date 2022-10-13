Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD67C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oF5lN7FOkFP0BRa3P3G9nXsGTxFuQ8u5AlTGRFR/RvQ=; b=S/hItSof3jRypc
	QLSXK9z2RUBhxV5PrVJoN8wcym6muLpq3Kj4M0Ou+gA5PkNQIl2GZzkkiA8sJfgIhSBXEBJymJ6mO
	4e7PpLAqmZL5JZMdiq9+cl3WCrCPcyTnhYzppAIhvlbHGqP50idxVPtAHwqIM2lA5zCJGkCLf2M9p
	8rtz+QBoF4GBTbcKNaOcnmM+eIMuWqFE5gZ65FnZFV/qMrZWoggCCIytia7zdYTcpW182nDWh0PEY
	SVx4zo7AQjBxsnuUSVwW47wIOPSVM07BT9VKi8yy/JGaegYwQv1q8VCdDpcf67alqyiQo6XxrRMfe
	q7hQofZ2aUw4EeKPExqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGr-00AdDn-IQ; Thu, 13 Oct 2022 04:56:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGg-00Ad6p-99
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id b5so633505pgb.6
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBUW8W9IHpm/LsPPxDUBqPLclXqN19ToVh29BLs8YZk=;
        b=OB11k6EzJwNvSCmIlAfMmIOJpHbpIOqkQWvUJ4Jvl8mr2f/Os4CyZ0nNb8BzO3KPNt
         jHdnvy5LRvpx69LLOlPGddElGnjkCzNsuXHlPtwh4t88JPdjUBbTOFEv6b0hyRkb7lwU
         2AsmsmLHTeeIxJqBIdODZ9zySeQOnkn7G8fqCaHVwL74dqt3YUWilHrxY38llh45qxUH
         e0xvAPfRMUpu/iuyKnVludvj16BPlPkL7qq0oCRyNEhlUphB3aDDWrIro4FD+4rSCPUi
         ZE6hOnFFlz1crUS3eng/zwaq8NOi+MdF+PcXGsbpDed6tJBy+UU12buSuRD3580JrY2S
         Dpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBUW8W9IHpm/LsPPxDUBqPLclXqN19ToVh29BLs8YZk=;
        b=wAJ+fGFio9dz0Z606wyVU4ecA2L3nwbTesv5Mr0uLzf5e06Ftpiu4/EcsnnQnmRv0s
         SZ4NIQcc5KjK+Ovrw8m9c5UO+1zF/HEyTGfvonjiOo9wWS1RaXcFZvt1ySt/H7njJ98l
         O6qkRMEMEV06OThHOkBGViuzeyEp0HG90FXFjlZDH6pgkcQ4uQJ7UJUR9NguqhL4mjKG
         VJ8U1i8w2Eus43Fzwrh4S/Lm+W/HaigT//2FsQJfQqEAm8rmcrncA0+PguHbWHg7eUhw
         uuRJC2O9o2Y0p8iYlwCFOMefsye0KosyRG2DM///Bk5QGzidCsFJaoeeyIri668snea/
         /jPA==
X-Gm-Message-State: ACrzQf1uYITgx9v1TkNcPUo3TE49XFwyYeUwMhms399FX1A3Ws+19tDc
	i+WJfoSWy6il3wwOw02cTIyL1A==
X-Google-Smtp-Source: AMsMyM5HNnFq81l4RdSLltMaolIOGtBC4m30BJwmTpaAXLcTYknK/lnO0ieb/Avzudz+YE3F/RUOag==
X-Received: by 2002:a05:6a00:2495:b0:562:c459:e327 with SMTP id c21-20020a056a00249500b00562c459e327mr30684563pfv.47.1665636985213;
        Wed, 12 Oct 2022 21:56:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902cf1100b00177f25f8ab3sm11484255plg.89.2022.10.12.21.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:24 -0700 (PDT)
Subject: [PATCH 4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
Date: Wed, 12 Oct 2022 21:56:19 -0700
Message-Id: <20221013045619.18906-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013045619.18906-1-palmer@rivosinc.com>
References: <20221013045619.18906-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
  Atish Patra <atishp@rivosinc.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
  Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215626_454837_1948519D 
X-CRM114-Status: GOOD (  11.17  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Implementor does appear to be a word, but it's not very common.

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 9fed6b318b49..89c7d8abd4bb 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -26,7 +26,7 @@ specifications from the RISC-V foundation this means "Frozen" or
 ECR.  (Developers may, of course, maintain their own Linux kernel trees
 that contain code for any draft extensions that they wish.)
 
-Additionally, the RISC-V specification allows implementors to create
+Additionally, the RISC-V specification allows implementers to create
 their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
@@ -38,5 +38,5 @@ RISC-V extensions, we'll only accept patches for extensions that either:
   for which a timeline for availability has been made public.
 
 Hardware that does not meet its published timelines may have support
-removed.  (Implementors, may, of course, maintain their own Linux kernel
+removed.  (Implementers, may, of course, maintain their own Linux kernel
 trees containing code for any custom extensions that they wish.)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
