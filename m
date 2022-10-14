Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB60C4321E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CedvyqJmktZ5wfTkENQYdmle4yaOfWFKXFiUdb0qJWY=; b=v+nGQFRhTz2ddy
	037QzI/VhMI9qabA/teK7gvrIv9lub9YTNYDUeKHDlJA0i2PEwFoiD3piVEbgymBndvXEGrv2kE5V
	hkdS5rRKAh5POnhDX3fHZ2waWzVZJTTsMMA4a34JCPCP6VYI/sI5I5KObCjrqO/42imgSdHqKXW1O
	5gaFsr2AFgic8sfMuSEG32nEVvTAAyUqcI7KtBxh4iZImOs5+DRY2ZOpWg6oCBcAFrj4b7OA0oA4F
	75P36gLpY55tQYvXvmvYkBVqzw+t6nBcXqxeOt89cWjjzBuTs2rfy5FF3xeI8Ek3AcLEb4tQoJ+uD
	HUz24QpkPqoZ38gT8D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5N-00FFVa-B3; Fri, 14 Oct 2022 15:58:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5J-00FFSl-9S
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 15:58:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a13so7520458edj.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBIOqGjmdzThiZsnnbTdUiYSPQXS/qp/QRUJHndogxY=;
        b=de2qcklml8jKYdhJlyXqmJXoz8FYGzMVRLfN9JcOUqf4UOLuKCrWZr59qwP/CI15i8
         9ZEYt9iqHJUORqeLDasCpf2TvKXJ2eNiOMML8Fk+bz7YKFJbV57Ez3yS2OMYxbifi8aU
         80V2z5mOPzJ5j+SPiaK/ExtA7pvzSXkVFgQy9BgPDzmgfE18Klp1ebv/IKnNb6TVl3x7
         K0gO3P8T9E6LTR2oS1WZnI3pbS2vkD6iCSFlqd/rinFyB9u6Ftb/GsYDL097UX4vn1na
         X5w9kGup7pabQp9pwZ84Krxhofd+fyywuWkx0d61FPGLmHqmWuc2PbVNpdjodZPMfLJV
         6NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBIOqGjmdzThiZsnnbTdUiYSPQXS/qp/QRUJHndogxY=;
        b=hpO+sDbkjMeFfWgdr+L+Wo7caVsamwSvkGa7TcCk1DgDh2bO8/PVQu0tIGQk+fEmMU
         m7GAJyw44SgW9HBt8G6HgddEpUm0vC1hJ14JSeVEXfBSr1WMvJVWZBwg93gQHxjybV/C
         fJcrXHgB2Agxp+gqDJBGoS4L19IkTOTfSkI97+8PY9DDD/mSvFHLIjEVv3BDrdejsn2C
         6eYL5xyQ0ZBJg5wa/1/Nd5YtSnRK5AD2UnegjvZFNOctz327crw3402g7EoXk6ZaIqwq
         Lvx4nsopjurkntSkicUAhB6rU5tkwMWPA8jkompn9tth+m12o7bXm2b16Q2/0RjcnB9g
         eYTQ==
X-Gm-Message-State: ACrzQf0T+t5F0t6vlZq0xMFsgRXJnf/w1JwJn89HpQn4YuX+9Dh7Tsg5
	9d5IyvUzeE4urhVUVhbnbm30mQ==
X-Google-Smtp-Source: AMsMyM7AeOygOXkM1z/GTKaGU+3a1Uh1fQyGWBmDx0oj1luEK/7mcX83iQG4d2XLgbn9xXhJP10WDg==
X-Received: by 2002:a05:6402:3485:b0:45c:d688:6848 with SMTP id v5-20020a056402348500b0045cd6886848mr4672473edc.279.1665763129826;
        Fri, 14 Oct 2022 08:58:49 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906300c00b0077a1dd3e7b7sm1746796ejz.102.2022.10.14.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:49 -0700 (PDT)
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
	linux-s390@vger.kernel.org
Subject: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:45 +0200
Message-Id: <20221014155845.1986223-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_085853_352517_C1B743E9 
X-CRM114-Status: GOOD (  10.58  )
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
---
 arch/x86/kernel/cpu/proc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
index 099b6f0d96bd..de3f93ac6e49 100644
--- a/arch/x86/kernel/cpu/proc.c
+++ b/arch/x86/kernel/cpu/proc.c
@@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
+	if (*pos == nr_cpu_ids)
+		return NULL;
+
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
 	if ((*pos) < nr_cpu_ids)
 		return &cpu_data(*pos);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
