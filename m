Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147C2CA1010
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ix74ueIQmRfu6zxhBJX61DlkOgcY64aN2QV6Qys3SYU=; b=rGO8So/t++nwzA
	72XrExuhXCNo+oFMcT9xyCmDC3ljymHUvFG7JLH5F/2SYPVst4kuSFMInl3novZTFb0aWUkhlMcC9
	kiesYrWPQ5HPcukXv3ivCv4K98HrD2rr00o0lM/03zxaDMOCaM8RKXdEK85C0UPDefHFcEpNMOaSa
	mm1XI+V4TzhslRc65X+WQPgiVuuu/lNxXUsmAM4K70wFHBqRSHZbn3/YlhlRt1zXWa9qwEKvSUOPR
	g8h5mfP/Gc7XmjKzNiyfePitfyNy0eho2fQ4sRs3HHCnMVLiwD44wnckD6S+AJ0V4SrfV8u4xjxvD
	RgFkKMlU1kK0snzn/3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwFs-00000007p2z-0zN2;
	Wed, 03 Sep 2025 22:47:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsc2-00000007Mcp-0dzX
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 18:53:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so2784845e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756925620; x=1757530420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AquE8JHU3wpKOnx9hZ4dVcOYBLYMLbey8qkeKp2ZqhQ=;
        b=AQ2fpTIg2+kSYRljeBz1ongxtNc1s0quZczBrpwAp+/bRGLcqhwmKFRurHrtAJRT+D
         5f0Dyp80eHGkh5cUi07I+z0l0HQxWxlRuwVXpk8Kg/o1mjpRviZI+nXnBPvV4m9smV/g
         O6KUo4FrDL6BPHYiVhEeNtyE9LhMVECJzsefO0lcO1FA/u/zbkArTrybsYHpQdq1zLM8
         VAhTTWiMM4eznf5irf1TBfegcaxTUL2As8+J18YnMJHMkaKCQQ0doUNQbZ3epOWEMALM
         RScsg7jYMkV9ImhwR1a8O2PeGrIKUoM6oEdttn8WNKHWaebhJP3+5oPovEBfDNsbyZph
         vBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925620; x=1757530420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AquE8JHU3wpKOnx9hZ4dVcOYBLYMLbey8qkeKp2ZqhQ=;
        b=FRzosHTYdyYIZXo4stadVDzoTLS5QSm3yQYtQCk3S8IUeXAGxop/wfwIRr9uI3FfdV
         wK93jXLDAtm+DeLd5jgG0zqwrfgLy5oLXRAzQcnXU29dZGoXa7iqNuVKor28NWlWtHuE
         QgGXJzL+H85E/eqZHdJM9rMuMNlOgRu4Rfj6gDRvkfLnjo2wgEEuWusXC1nGODx1mC6U
         KTvEjfG1A48dc+E1dUkS4/8XWke+oQiGg2eBOXFTJj0Dsuu1yoLGXRIYy2i30oaF3Rjb
         GWj5DmMbpvsy4pVf3GWJ9UqN1XGmYW7hh/b9bT72hxcA1ZyLBN1KROG1M3cdcUXl5z+H
         gc4Q==
X-Gm-Message-State: AOJu0YwC1ZC/EC6tyfmVoCDuRfv7XnuclZfZbYpIoXhM/9RrANMO0+OD
	dSFcJN65O0+UT0qQTCmIibLe20BGufzOrURbv6XxlQ16/bdAS4KHYp0MjVeYXIb90JuR5wIN43i
	+/nLA
X-Gm-Gg: ASbGncsACMfmAMlc6jkkd/9sR/GU5FxCnHiUbtMa6uKsTZsizzyuV2s5FrX4wSM0yGR
	DF0IEJJjw1OWY3B3vYc0UdpEqjEvLr940wRIicHkTFCQnieUOeHiGUvo9o3AFYa1Wlo4fE+Gk+S
	fc9eM98sPOLN/Bcx8BIbelxgIdhHnYSpvxHK+Ej7nEIJjknCtWsXYLPojer5u3G3Gkw6wZVJsl/
	3YaaMsraEFKZEcZlCuJ/e9JnA2tKWJuC3NzSiTUlsXn/t8caWcYaE4uboeEMgVUNpnufsJcX8Xb
	dnnsu5aMPS0crR4FlN7nVpGrZTB5CwUJ8bGKzGKiO8qi8h54hg/IEBlvV0ft8YH2megVvYvk8Wf
	bvENeNbFcvvvNSoLelMTvJdM8xrPXo3qy9LZQ2ZbJ9Ne0Qi5nDUTJOeHbiiZ/saxe9K0Kimd204
	a9WY+0
X-Google-Smtp-Source: AGHT+IERl6smvjSqMpuCaH/LYojC/JM0ih8kKGx0MImSuDXXr6hrLMvQiHu6Ro0U1pMEYuo7OfIbrQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45b85550704mr136866395e9.4.1756925620576;
        Wed, 03 Sep 2025 11:53:40 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2edf1sm13920647f8f.16.2025.09.03.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:53:40 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 03 Sep 2025 18:53:08 +0000
Subject: [PATCH 1/2] riscv: Fix sparse warning in __get_user_error()
MIME-Version: 1.0
Message-Id: <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
To: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=tb01GjZKeVYDMqeiQU+MbdxDJ+LoCTMzjQNhhcNJEgk=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJ29G3SnJAmn34r1vLZRsOeyyGHZpo9PH76uxIva6PxS
 96P+1d7dJSyMIhxMMiKKbIomCd0tdifrZ/959J7mDmsTCBDGLg4BWAibocZ/kcbd8yp174kdHxF
 6sf3i4o/3NqR2Hv9xkQ9ebk5od7bdN0Y/gd3lPq5tRpbKH/3+XHc/Xu55pram/3feFas3LDyk63
 JcX4A
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115342_303113_3E556B4F 
X-CRM114-Status: GOOD (  12.11  )
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

We used to assign 0 to x without an appropriate cast which results in
sparse complaining when x is a pointer:

>> block/ioctl.c:72:39: sparse: sparse: Using plain integer as NULL pointer

So fix this by casting 0 to the correct type of x.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508062321.gHv4kvuY-lkp@intel.com/
Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 22e3f52a763d1c0350e8185225e4c99aac3fc549..551e7490737effb2c238e6a4db50293ece7c9df9 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -209,7 +209,7 @@ do {									\
 		err = 0;						\
 		break;							\
 __gu_failed:								\
-		x = 0;							\
+		x = (__typeof__(x))0;					\
 		err = -EFAULT;						\
 } while (0)
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
