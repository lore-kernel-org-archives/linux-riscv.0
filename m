Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498C4C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFthp9kMxHb60vDMxfhgOSnd5+uYhShdXSIo+a/wnME=; b=fI0pcfxXwguodF
	L+k8qn+YHH/2HRGbraA8ggQn68PPJGpejLOdw8LbXh7O7ul9/5RVU4gykUC8isFsWGZ4JILFcBvom
	7WY5tCIV4XSQxnNrvCSbjzeBsg76Up9ORmSIi74B6Sw8NQUmSQtYB5Sh8VEKm4rxkpZlWjpr+R7u2
	3tEd8ThkR97rU4l+wqT293Z3tEoCL+XSYYE/Dz4a41kWCauWpxGAW6lj5+KvFqWeIOKPjhXzMO2XN
	NV/MSHkoWQS8qM77oa404FexUxTxdffhxa/ouGXUbOJk1rkFpMoIPclKR+ZKVv/FHeExTwZr2Z/4l
	SIqIYwul4ahMCozpcJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwo-000000039ZL-2o0f;
	Tue, 22 Jul 2025 17:38:38 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwm-000000039XV-2eig
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:38:37 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fafb6899c2so1666836d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753205915; x=1753810715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0zO9q5RHjrpTuBAsZGCPwDy4LSegspYm+5gaPuuIvs=;
        b=V6UDraixw24UA05kwnQltRpdjcoPcBDFE+B6NWoBj3a9Hty2MLRPmGl57y/sceSUzM
         mYch2Bh/ljt6KTSGI57wQRCARH05v/0SVsjjwZXRFTkbGPBrmM3J8nv/tX2Vj8JAOKjq
         g//OEZ4tZk9SjdhGPsMKuQcComJYnU+2g592AfDYxTKllExrRTaKGqxM+GkdNr7hXcvE
         rJeL81etwC4FspU+FMPEomFVl2iEU+l+DdcmrG/ZeVUlFYR03Arp4qSoCdTFv17h1TSr
         pmfN95Won6mEwCnB4Ve5aV77YafV+q8N24ql+p5LxS/TG6uRbavkrtCHZv4OOj8t95rq
         5GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205915; x=1753810715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0zO9q5RHjrpTuBAsZGCPwDy4LSegspYm+5gaPuuIvs=;
        b=AI66cYGzaQfYPDXA//xzXqUMC8GtALvN7V4MlQK3cBfSC/v/kCNaQdZjNJwNzvSc4U
         AZj/hCcDlwFoOMeVQk2ohmGXPnmkjB3GZp5gnoQ/OmebEJakTUduHqGk8F3NvuwxP77e
         GpYTZnRi6VyvSwU/Z7J6aO3fpmQiBqby4m9wlnUWVt0m1HFo8LYBka/zECIgTH6pCza4
         YyMYepfcRNMIrHXUP2usIoaXViDZjYsj50+N2vu+2ID+6bF6o843oL+NtiSVOvJoDjvr
         d44CUiJdKbQWAsRT8GAIt+C5zCj4PTiLeTw7AR9yY1KZeucWgT7E/v/8M9bntSXL8GZW
         50Gg==
X-Gm-Message-State: AOJu0YxBLcSt7nX9eITXDe+2LtHhUYi0Eik2H1qzXK5Ge4fPP2nJhQuw
	tomnTNUy4yh/MQhmxZlEZNbdbISJgUo5e55b0ZuvvyhZTzHnElL0Ja5jiFhMySzeFAgQbOAhw5t
	iqIpj
X-Gm-Gg: ASbGncstwmmNSTnsrvMDPDU4Kxk1I+0WPYshXEk/I1d6fMkrs/DsbxM+FdZTkUUX0bh
	Vx+uu4ZhwvuXs6kcHz8LSXTR1cnhcfL5lThnYvQ/Up0lnv9K9VJRa2lxlwn2EBIen98aJlo372M
	/lRtiWve1ZHiFaGN+hCc7ND7gsTH3hmFBl14y7O6ffJD1kmZsAScV1O4sCSP29EtLoRBT69cm4X
	0xn7q2tDHyHoMvl5i+N+P2HTK/AaSt6/PuT9/ZN/EsZ07n+wqJKlEAXpiUT7iGibMIU76JOZKQo
	Xgs+WdxyJSqmpWg5zppLt+rrlgbnUDEQ0MYljKWVkqJEaOql3tma8NTilEQR3+xy6Sbleoyf6fY
	nZ0HnVqZ3EsAwPkb0n2rZK/+DxvmbdJc7liZSVW4PQI8Dampii9B/kWr+V3dbdvfHiOHW8upIvO
	vy0iWdt7wiPGc=
X-Google-Smtp-Source: AGHT+IHCokx4YHdCLRfoDwTLrDfS3sucjtTIvZ9hf2c8wFkhh0tDPdS/VDHIEe87OwXUJyu9QNOD4A==
X-Received: by 2002:ad4:5d6f:0:b0:704:7dfa:3fd with SMTP id 6a1803df08f44-706eb692e9cmr53112496d6.4.1753205915406;
        Tue, 22 Jul 2025 10:38:35 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b783sm54184536d6.73.2025.07.22.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:38:35 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [RFC PATCH 3/6] riscv: insn: __read_insn use copy_from_X_nofault
Date: Tue, 22 Jul 2025 10:38:26 -0700
Message-ID: <20250722173829.984082-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722173829.984082-1-jesse@rivosinc.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_103836_670213_2CEDCC0C 
X-CRM114-Status: GOOD (  12.01  )
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

__read_insn was using get_user for user space reads and direct
dereferencing for kernel space reads.
Update to use copy_from_user_nofault, copy_from_kernel_nofault for this
as get_user is user context only and may sleep.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
Squash with previous commit as it's breaks bisectability.
Separated as i'm unsure if copy_from_user_nofault is an acceptable
replacement.
---
 arch/riscv/kernel/insn.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/insn.c b/arch/riscv/kernel/insn.c
index dd2a6ef9fd25..b8e5202ddced 100644
--- a/arch/riscv/kernel/insn.c
+++ b/arch/riscv/kernel/insn.c
@@ -2,6 +2,9 @@
 /*
  * Copyright 2025 Rivos, Inc
  */
+
+#include <linux/uaccess.h>
+
 #include <asm/insn.h>
 #include <asm/ptrace.h>
 #include <asm/uaccess.h>
@@ -11,10 +14,9 @@
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = get_user(insn, (type __user *) insn_addr); \
+		__ret = copy_from_user_nofault(&insn, (const type __user *) insn_addr, sizeof(type)); \
 	} else {					\
-		insn = *(type *)insn_addr;		\
-		__ret = 0;				\
+		__ret = copy_from_kernel_nofault(&insn, (const type *) insn_addr, sizeof(type)); \
 	}						\
 							\
 	__ret;						\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
