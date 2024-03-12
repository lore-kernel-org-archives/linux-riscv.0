Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DFBC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lncCY6AG7JH7s3szEYs8yEiggzM9Su5ikNN/rWT8kbY=; b=0VoFlzGyxyCjiv
	d0axoGuiE4p/liwGI0yh9N4YLjaQ3Rl68yRMF8zGdgNK/k02gRSiR39huC8rDTCR7WCSEKRP0EF6I
	/siaC8GDzUNIsmvo+BGd2YT7mKzpVxooWpNqk0/rVIL+tkqW6y3jw/LS9hVCzL92wZjQGWb4yyfRv
	bKg/9L3KFRSg91qmGRBfT0kYXajkuN4Rh5uLKVoPG1Tw6w4G4pC3luqzUyCCJeSewNmaKenZHb51P
	xLeLQBearGZNC17h0o8tdh6ST+9Jk8YYzcQL6c8V4B8HV3fbkptbJyzjKADeDurYW1Vi+0EWRkmBz
	ZFPuOiB14RdzOsm4jY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86R-00000007LVv-09s1;
	Tue, 12 Mar 2024 19:48:01 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86N-00000007LTs-39Yl
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:47:57 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5a1fa3cf5eeso173961eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272874; x=1710877674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOqRUTnz4dMY1mDsAaQqT8RlSz6vNVMJhwSPPEU0/Tk=;
        b=ddif19UXMdqoSape6n56o/QDOpBDCGydci47Fv7Zl3Nps1D02rNgEL+6fSJCNOXkXE
         XE5Z/2cNhzWLNS8W0hn4298w/lO6hMNuyylJf/VxkFoxV6PN2t+4YWivNc3vySpN2SHo
         syT1R/j0xJJrZNTvKkynyvrk0CBzyebutSGr7EhT6LvMXu3yaL8dcInh+3bx4VzF7aRS
         aHnbxJkzyjPNOfn8d9mGDxz3b8s5SRn3jeg19t79SLfhlZ7fibNn4CMfZIE+pqK+/ePz
         wZXSb903556MWNCTWHC1RI7TMsONg1EW1tO0LS4sPadUr4W7Gzvr+9v42GZNCU9FIjPS
         8C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272874; x=1710877674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOqRUTnz4dMY1mDsAaQqT8RlSz6vNVMJhwSPPEU0/Tk=;
        b=vAMpnpVKKmAjKH011b8y+ea7jet1x9mAwT7u31PuBGKOi1k6UxzjuCm2IO+emkqeIw
         2HdRvC2kYYCPHvyW2cye67Lly/0jlSG5y0rmBMcV2glr6c9a1+1zXn6rfyaGGPBK7Tpl
         ECrBxixKZTPLetIgBPKzG5jCOPGRifqbWDALcH0b2E2NzBnT6MHS5YmWgUXMwFyVJwX1
         EtjxHI8xdcGwY869i48/03fzGcbXs95sS4n+IRY/CHZQEj1xKQgQ7dT+ONEkuisjbDKJ
         5Ji4wJm/WG3GNvFCObDX00noAnDcfl3OCqWatDyAXrugp0RjX/PA74aPB/aUli5Rm5B4
         Ki2w==
X-Gm-Message-State: AOJu0Yz3sUmetSvuIYrsy5iFJpdf7hPUCq9paI/r45pGJDnn0mKz7wQr
	hU8h1QD6onHpw9JgikgmHmlEak6+itNHJ/RrPnoe7QReS3Ojf6JSvNeVfmI4KQ0=
X-Google-Smtp-Source: AGHT+IGI3bdfpp+X8J+ZAKrqf6mS+YBT6i2j3SsCGQcUF6D9lLzGReHwzZfu7T6A9BAy8M6S+dJeAg==
X-Received: by 2002:a05:6358:3228:b0:17e:6924:e4ef with SMTP id a40-20020a056358322800b0017e6924e4efmr4693399rwe.24.1710272874205;
        Tue, 12 Mar 2024 12:47:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:51 -0700
Subject: [PATCH v12 1/4] riscv: Remove unnecessary irqflags processor.h
 include
MIME-Version: 1.0
Message-Id: <20240312-fencei-v12-1-0f340f004ce7@rivosinc.com>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
In-Reply-To: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=696;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=U1yCIqRq0duvpJX2nz5FFSagYRqS2vPnAY5Af8ygvZo=;
 b=B4BSJn3Ds/uhAQxDonyv5DKERy7Fsrbt2TvkM0fPKhogZvT+pJ7QmCDUxVLS6ckX7qedOXG0u
 KalC8LH+1ZCD46M/5bI5dIEnZ3XJ5XlRQEEBBBsLpauEY6z5ACcZhlV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_124755_857030_966736DB 
X-CRM114-Status: UNSURE (   9.01  )
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

This include is not used. Remove it to avoid a circular dependency in
the next patch in the series.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/irqflags.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_RISCV_IRQFLAGS_H
 #define _ASM_RISCV_IRQFLAGS_H
 
-#include <asm/processor.h>
 #include <asm/csr.h>
 
 /* read interrupt enabled status */

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
