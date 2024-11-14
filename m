Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF6D68B34
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVEyhBTNHcMAQXZs6TGePcO8JqAk5vBLSa9WOHLp0Mg=; b=TJrGMkQj4Z4laV
	DWDLFwddlg2wdVDPXdVSDIZICXFdKmihsSICn8t3OvwlZmdhPv9DaWoBsKf7XfC5xlh6LdnuCcZzA
	R3O8gI4EdU9iM/QTWEgtOO9SmZZ3VTj0TzgkvdGz4lqJpaxSqggOUH9yw+YPCGfGXPoXi+0qODazM
	d6349WFGQPENXvgemq95g+XYp78noU+YDeBPBxOSEDbyl3jwLGoHav5lsfRiI30hCP5umKh2f6NpS
	WMK7c3TlaflsV1C2zo7SKiO80Z74vuirhAj4sVmhheowvky6FusWa6FxZu9MSYF36FRqsussqWVtq
	ICDiRNHX76G+JTadFTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYx-000000005Yn-0wVq;
	Thu, 14 Nov 2024 16:19:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYq-000000005Jh-2QpV
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so7603335e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601150; x=1732205950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmqNGe/T2iE9PlV9lB2/3K3MC1TQA7fI1NussKF1DE0=;
        b=n+EdAlLW3TmUhfnweGgRuCitKpOyzkU0eU3KKXfDp+SDhmaATLxnURQoZQiRiXLr44
         rGbqFwsg9A4DG/U8B+PDAwovOKmWaY1+Y8Sy0OxnvueXX6dnB8CfWdsYOeu2WubtDBQ2
         IkcUnhKGgFtM2wtL7tBQ19cctsL8LszpNsflA4avxKioI/1Y2XUoEovrm12p89+iGyTJ
         cHBlPMXam3FOy67Dpvk3gHnjqWJ5T//r2Rdp6V2ET3+lesy6oQHJyf5PjxhbYi10AO7o
         6H3O/hWl3rr6TIAkJn/yol7xLxHChYAynswrEiScBSX3/VzDP+Qsi1Wur3coJnjikR8h
         tdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601150; x=1732205950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmqNGe/T2iE9PlV9lB2/3K3MC1TQA7fI1NussKF1DE0=;
        b=YVQ6A+c8EqerIC6F9Jw7FdpMNc3GrYDlSovmHY9TRughX0L2+RudtOE4RAscxEs9j4
         vJuMfw2bwdwQnwzeNRtcwBIzu2c3fCIuDI/CdA+Qfj6tQztZ5wkinkbElfdrzqMG8V4G
         DhYsBIrPv+ObcD58Gypn+aLkL1/XZeCBMt/a7iENXMKe4J2xpdWI7FFIfU/d9vix0a80
         IcOmZdE+ETVAinCPDcATcXvK0e6QGeQaNP44LrgaZbVPfT+DTxcp5ULbuXoAAzuF3cII
         +NSVKkZOmCSSUHS/GHxe9isay2vT4WY+bpTCQPwXAd1WojcBms8EDCLtGIzo51zKDcSs
         th7g==
X-Forwarded-Encrypted: i=1; AJvYcCXU+1UmdUnF4ev56FS7jFbt/tWuF2rsTdMzB8CbQcNSBQS4fSyTYuG6v9OW4E4luUPaXYiQujqXW7hQQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3jcODtgrIXn1ON/Habqh1IhjmI672uLgW9NrkQv5tRx54kSon
	EYKnJpJzmU0iFhIRISAovh/37b+P2KS/3Ly0gkv5lXCPWGHzR6sFjxOlD1qEb/g=
X-Google-Smtp-Source: AGHT+IGMbtDDWmvKWsj/Ybdc9TgUB55aFH3ajhr0ZnMlCbsRayCj2n5LaLaeoDlbaJzuEn6VOd9B/g==
X-Received: by 2002:a05:600c:8715:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-432b751bcc2mr209410385e9.27.1731601150428;
        Thu, 14 Nov 2024 08:19:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbe779sm1834550f8f.60.2024.11.14.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 14/15] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Thu, 14 Nov 2024 17:18:59 +0100
Message-ID: <20241114161845.502027-31-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081912_643276_D3E56B0D 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
