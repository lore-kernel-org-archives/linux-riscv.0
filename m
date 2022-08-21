Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FE2C32772
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9rM52oJ2xKQszUbuRK0SYuwG366jWy19AVw9c7rPp8=; b=KK4XscuHC/Mhjx
	tiIuTynD5Kr31WuGkKIv7OkMDe9upE4yhngdJIFJkA94DyRIUrkoa8+0ieRfcJSKMshg8IxwMjN98
	1oiRfKBBvFbBHTCm7t/NCBVmG6QLVDEXN/o09SSrQ7q2Qi2CdYQLJ7HuEAMZ/pMo0xLtxfNmgf6nx
	daoZca+CVgYoMIdTbGC19uyX0+ThG73C7jzroZqUwi3reOBWDLW7R5Hg3YwcHh7UhzJlzp0PgY4Ou
	ie37xuqwqvVdGik0aB/m4D2sQCG8WG3O1apvbhLocOD5U/0V1gmxabMhA/BU/A5MPMdpINafYABN9
	divF5b4pYpDx5doDopBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFo-009mu8-EB; Sun, 21 Aug 2022 11:36:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFe-009miX-Dv
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h5so9255300wru.7
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XFcC8WCeCDvxB/v+0OTyUBSnoJfVKZTiHSkk+ggPSsY=;
        b=I9p8YQn3K62FrSJWSUFKpOt0UsIp+9bsVsD+oJfNVAcT5h+CZYJtepbN0KIrbvEqWC
         CfN+volyR9bkDOtWlZbTynhimAFp9312moQA2S0Vze0jmih9oIcwdFW38pAOKUPJseBw
         vMXObcP9ocBcIkaAz6g2imqEU6D0lOnKb5CehLfpmxYG+VEplogLacfxwfy+ksZUG/ba
         fWhm3yt3q55nHleahnjNEgTQWqs0O1LDRCrwF1Bfp0r4mcW8zfpLSVE+W3F607TvX0XO
         myClgiQ90dkmpbgSGL1SbcfaCzOiSRAATApsyLCyMyd3sSauWoR6ic4v0/7cwRhrog46
         TWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XFcC8WCeCDvxB/v+0OTyUBSnoJfVKZTiHSkk+ggPSsY=;
        b=Bjrtq9hMZbzL3MDeY19GayCMUK5Mr6haYaoTBChsjQCoVYlJ2orMjYfDtUCSLTMwrx
         INGQ1EedzKYON7JmGgjUjSXntIoe0RuuemM6h30WlIvzh+vifYfJ/8nKqiTVTJJEbTCD
         BSGx+s7PEYDx4QKmUqW2/T/iOkYq+heL33EWpl5j5yfQ9YQYscbOyIZ9mfSgFfI/OioL
         gNigKqG0AoiE3Z5YUDok/AQUjFHmatJwijkI7ORNpI8udeezmsxcy2IL2s65/z1SLVmy
         +9hW199X+B8QMUCaM+OjlqXBo1CpfBuYrMj6h8vLeiNz5UEBHOAQIvbd1kb9zBOvZ+bg
         Bjiw==
X-Gm-Message-State: ACgBeo1CA0aSKsRufR/tnFewLqdS86kAB8kXnCT6nJkXNGVuSIuLQ40J
	Qy751wsYrVGpT3tsNN1JuKJ0AQ==
X-Google-Smtp-Source: AA6agR7yQJr2EFqeBiX7zFLHOZnS6xuQZ2CSX2d2szPgHhQ8PkJnM5BxqWwAIlAcnq3r7wGuyd1j6Q==
X-Received: by 2002:a05:6000:381:b0:221:7540:b1ee with SMTP id u1-20020a056000038100b002217540b1eemr8123300wrf.307.1661081780659;
        Sun, 21 Aug 2022 04:36:20 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 2/6] microblaze: use the asm-generic version of cpuinfo_op
Date: Sun, 21 Aug 2022 12:35:09 +0100
Message-Id: <20220821113512.2056409-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043623_580613_FA49ADB5 
X-CRM114-Status: GOOD (  11.39  )
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

From: Conor Dooley <conor.dooley@microchip.com>

There's little point in duplicating the declaration of cpuinfo_op now
that there's a shared version of it, so drop it & include the generic
header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/microblaze/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/include/asm/processor.h b/arch/microblaze/include/asm/processor.h
index 7e9e92670df3..45a86692e90f 100644
--- a/arch/microblaze/include/asm/processor.h
+++ b/arch/microblaze/include/asm/processor.h
@@ -13,10 +13,10 @@
 #include <asm/registers.h>
 #include <asm/entry.h>
 #include <asm/current.h>
+#include <asm-generic/processor.h>
 
 # ifndef __ASSEMBLY__
 /* from kernel/cpu/mb.c */
-extern const struct seq_operations cpuinfo_op;
 
 # define cpu_relax()		barrier()
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
