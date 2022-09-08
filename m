Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD7CECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=611i6SjtUVavui0nQ9Rx79VMDaY0ZYBUgMdyga8DvHc=; b=tq0Bchp56grdft
	R3ILw7sDQjK0DEIRLxDBy2HBQ7p/8enyZRzE19UdJuxHXHxRGBF2AzNeZoiba41esMFBWXiuQLScS
	OJsINM5Cp7Q3AKduKLuxiw+bTru3e2O20SKLM0x1dW+aSYvhshFu0SnAoOxR5AIf+UrIQ3EJSsowM
	AHWI2BG5WJdHnT27NjxH4MldO5rc3JctfDa18D11FVpHQDLQz0tazvjho2AZGEWIoiMk0z71WN21G
	Z4UmX6ejOETaR0kkIi50VIIYZVahiVZDt6xhyz6AsYN8QoNrOW830zgl2DTUP+x08NGvK5ZQDPgDj
	RAtmz9A5g0IG6G8aZ3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFKX-002Y0Q-GY; Thu, 08 Sep 2022 11:04:21 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFKU-002XtI-TU
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:04:20 +0000
Received: by mail-pf1-x42f.google.com with SMTP id e68so4506639pfe.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8klfUEhKxuahKM34ft6Xk1j8LdCMioEPyO0tU5Xwf4w=;
        b=L62uGedyyDHZFn9ZDdvHYjqOyQFu/sa1s3JsuW8QQYkforLV0LD7/CkAhX8py54ZH0
         eQLOIKyg9l6KZx5B8LhihYjHzjj7w/Zb4Yg6OCP5qq/1xwJkBv6xs3ekoyL4Z1OL84/9
         B7O7/rv3zqafFgTSuVzQrvmkQD3IPkwitjIkPVawgVgsIDwglna2kiPv8Jfz0BiUOiHq
         Q5h2IpeZiDNy8ZjsAEk2Gvx4lk+uSt9SCzdvRMtZnDSh0k2OEsgYgKLkLwx/z0ous1SF
         v7To0RkhKUzdW5yOj4hUuPv9YCQun777LnFrR/69/+PWKptfnY1TXBoOCqIQZq1CO30X
         R/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8klfUEhKxuahKM34ft6Xk1j8LdCMioEPyO0tU5Xwf4w=;
        b=uVJ/5+1Sisx+cgIM/jHYqU2hXS956Fq9B9KbW8xkx4WjW8X83atV4Dg6hr4b2dwLXA
         qERQQV9mL0RnnXTtRV4zEI429igD4quQPX3+lZ8yYAglnjylRC5pLZxYeOVVXRCV94IU
         g/enUMBS8V+2YBnRYj1K/3I4eOgx6zrCXi9/5IB/i7uX+DxGHRDy+hxUGsp/Rfvf6Pl+
         6KUdtaMcmGFugcpXbngU5yiCd/cn69vYQF53OQ/NOfJZlyulwxxm3bvCgpX7jZFGyAoQ
         oFpF3gR2ielAlgNpf7A0ffeBHTxA3VJCL9/lOHPK5S9XmSHi4dc1o1xZwTfdIjRlC+mA
         81uQ==
X-Gm-Message-State: ACgBeo1/xRezb0xTp2P3OMeuydeJJQxZEsuUrX3ZfkkYB4//JGx+8o3A
	lDqpmMzf1jw3lHwiusMqVuPCNA==
X-Google-Smtp-Source: AA6agR7GL343ySe4mtV74WQtqa6mVHGs3p/qeL1HRumHIMOQmDe1zHdI/6Buj2oiQb7CN5bnjikIEQ==
X-Received: by 2002:a05:6a00:b43:b0:52f:59dc:93 with SMTP id p3-20020a056a000b4300b0052f59dc0093mr8749680pfo.26.1662635056033;
        Thu, 08 Sep 2022 04:04:16 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.251])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902f64c00b001749e8eee4fsm14175191plg.226.2022.09.08.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 04:04:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Change the SBI specification version to v1.0
Date: Thu,  8 Sep 2022 16:34:04 +0530
Message-Id: <20220908110404.186725-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_040418_958804_026F189E 
X-CRM114-Status: UNSURE (   9.61  )
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

The SBI v1.0 specificaiton is functionally same as SBI v0.3
specification except that SBI v1.0 specification went through
the full RISC-V International ratification process.

Let us change the SBI specification version to v1.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 26a446a34057..d4e3e600beef 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,8 +11,8 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 0
-#define KVM_SBI_VERSION_MINOR 3
+#define KVM_SBI_VERSION_MAJOR 1
+#define KVM_SBI_VERSION_MINOR 0
 
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
