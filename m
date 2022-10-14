Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C143C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoYmT/uZMcon72OrlTzrrfYiYPSW5g04YI2mD3K6gCE=; b=0JYMWF68C/2dJu
	7ShcFk1USQ0dHFhjboeMUFp26RqVumlM1KRxHP4RKBClPCfI57H1WMI4dWrG50H4aw2DWwpdVJNtC
	p8VYGS0vPT0cB/9HPqtB5OemSbMiLKdEptXrWq/ec/FSyWYqNkEAsHM2+XYrsgtRWbbnSqxQLlaIZ
	4hdONT+6e3pmIEIZoTubK/JOFyTYf8kLo2aYM5zYJ2/Uc7Q6Nx7oDXiJdqsl7xesTk2pxJQAqc60G
	LnhAqq77Y98Fk786djPolxLe1qKFcRaN3V3+zyq1OAqi7s3aDZWTUhKXK+ZT+2fL33NuYDhlRqluU
	eqwQK5bF7RbWe9HQZN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5K-00FFUE-Vb; Fri, 14 Oct 2022 15:58:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5H-00FFSh-TW
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 15:58:53 +0000
Received: by mail-ej1-x631.google.com with SMTP id d26so11422863eje.10
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFKG/UoJdjvjZL4a++TyBLwRn5J9ab/1o+9LeC1+Wdk=;
        b=TWAL9EKRVGNsLjKjhYh/mC6I8/1d/oatjVnsDN9OWuvFem7UzU02ZKqRzzv3m+6WNJ
         XpbFkMRKHd8kMuyJPFPJ2O4coxdaDl4faAyVqhStpaSUGYq7BHI1TWK1CROOsrCSLceS
         oCa0J4Fufc1QFYIqSNT7YYCBkHCuQagy+1h8ytDYHkttIN15LC4NsO9AFDHEPqj1jTqO
         4aCSqLM2Nu3stjaVcqAwPtMDAHgS/shNxwcrymDs9yg/ism0dyRjPiNJywK3a2Ao/iyX
         qrOsHJe4Ab8pwfjJp7mLQWu47/wJG/qQKDv8bTBXEBTHUkrCbt724EXqhc5mXve0RXVF
         Q5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFKG/UoJdjvjZL4a++TyBLwRn5J9ab/1o+9LeC1+Wdk=;
        b=Q09lsk0sATbgpxASYgVrgA6P2EMxk+ymYC/Z9+XkOWnWKGG5hxWqABNnyHm1DgL+Nx
         3PxVj1yYZG5WnoSz2QgwqLHqHISAENwa6d+Wmwm70yeQ3cy1P8KCQb5Rips4+ZfrUotN
         gl015vSVy6jO0EjkS8VvE6FiFv9eQlnEPdgWnVaTL83t7Hp3l1YPQ2/UPMofm7ujKceL
         a66PwmbJ0kWjmyZWPjflfbs1BLQU68vF5S08QRcUeqoi87mhp720epxa/CTeDdlGhFn/
         SRi9OApfEqgY+OydV99itetE9OkGAu3nVSewXQLE+aWwrM+VXiMx2yXAhuqi3HyfB9u7
         Z5DA==
X-Gm-Message-State: ACrzQf3itq2Xg7a5Nv05Ey5O5RHH9BVq1l5JhmkBfSasExqYasjDBOxk
	steCSzwR5qwsW2nbg/HVA6O5eA==
X-Google-Smtp-Source: AMsMyM7/e9vDSoMxdhGGaaPUCS7n6lh8z7ltnxJPYvupdtdDP7MiBbMySEaXciThld3Qry9um9n4rA==
X-Received: by 2002:a17:906:4783:b0:780:5be5:c81b with SMTP id cw3-20020a170906478300b007805be5c81bmr4152627ejc.76.1665763128360;
        Fri, 14 Oct 2022 08:58:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906434f00b007806c1474e1sm1686070ejm.127.2022.10.14.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] RISC-V: Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:44 +0200
Message-Id: <20221014155845.1986223-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_085851_969008_5DB54840 
X-CRM114-Status: GOOD (  10.47  )
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

Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
start and next seq operations implement a pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }

which will issue the warning when reading /proc/cpuinfo. Ensure no
warning is generated by validating the cpu index before calling
cpumask_next().

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4d0dece5996c..5aa0ae8dd115 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
+	if (*pos == nr_cpu_ids)
+		return NULL;
+
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
 	if ((*pos) < nr_cpu_ids)
 		return (void *)(uintptr_t)(1 + *pos);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
