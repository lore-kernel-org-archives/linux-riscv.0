Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A8CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anbJTsKTop43Mh7lseqEJNYb3jfWtZoIASfinFBIU6s=; b=392zXj36ByN1sg
	lAJYOzrOF5VAozHjEIZh3fr3s1ggoEAP91aBYsNJQ9+XoCb0cnfg6KfJaYHPMBEb6WQEQwikTsxLd
	Kc7EcrJZC43DGB8C91JSxLTj3aPlk+QMbgV2Vlb2tR5bOViDjqUmOEq52JY3/JJaE1rq4Uq3ugN6M
	Rn1BrXbYAiOuc+NSX6DeeJAKjFEiMLO26Lt7/+Z2ZLOWsDyKSI2V4NdXDqfdek8mBmxrVMVnmihK6
	L6I0M9S7cmKf2sIiPEUEte4Rfupuome0+a5t2rMEIqkIKsDN7oZVU9HhTxMvRboVc92B2+0O9+5bc
	KTrNuPVA0QybH/DDfTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqb9f-0004O6-24; Thu, 03 Nov 2022 14:25:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqb9a-0004LV-RP
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 14:25:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id k8so3061781wrh.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj/ZFbn3Zm8rxzcKsJGd6yFucy8YocyT0mV+oXpe7Do=;
        b=jMtJfzvsVyM2XNkO7dOnrzsj5bFsNMWPr9qRIuRvfNs1tOIvR8I1IP8JVx8tLG7Dep
         v7Un2NZW58xBtWmwuCjYH772AaiwgcpVC21xqkhn0o/tmaNi7buIljvNSAt6F+cUJUMm
         ty0TFwUWGldw91R8cET10BSTY/z5J4prX7tkwNyHo6zddMYQimrfEvNM/sLXJ4IbkhDZ
         m9cFvv72Li0sU8oIZulB0WLbKf4nulNrh7pWjefMCTf4HMlXuiYiEY3FH49w0tZgWXlu
         BN1Vbu6K5RGrqIIVUiu2VYCjwuaaGz/52VTavOGbRx053ikoFEVXHhj2bCgUlI2OBbQL
         U+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj/ZFbn3Zm8rxzcKsJGd6yFucy8YocyT0mV+oXpe7Do=;
        b=AHpLBZUbFThC4tYPK29N9cy7a9lTuDGRArWIeXdPDH/kOy61D1S8oZ0e453fpuskv9
         AjcfNBtE4S+59gPBI/UwDFlRYLP+UAETBuFTFD/tjS54NZsUU2K852W7ghaOsMv+iSdj
         pS7M0q3Ruwh3n4TrxST5RHp+K+D9WlftdWU5YvjlSl2RzsheRVRfqTKSJbZYaG217dfl
         hstBAinPRf+knpOs/Z15D7pYhu/wUwyO3uzohY8iJepVlOpMqTaKW6HhON2T45HAeBSO
         WHmobTocQ9QZK3qcEI0De1hPMOj29D5wqaYfymQ7xaFUBEScqDLPcffrn+CLhNUVLSU5
         iG9Q==
X-Gm-Message-State: ACrzQf2OSEaCS6mGeKqFqZ8NebhFORPaXFdO3npcaH/SLkIqOAVOtdF7
	6T0qsMsobUMYeITO6ZmMQ3w5rw==
X-Google-Smtp-Source: AMsMyM7Fd10uROzTNx7lsAW66oPjI1uph9DNvAe559a3qkiRN8acm3Iyt5ChbLPnm5wfe14jlQcTjQ==
X-Received: by 2002:a05:6000:170d:b0:236:6aa1:8a56 with SMTP id n13-20020a056000170d00b002366aa18a56mr18858226wrc.302.1667485507181;
        Thu, 03 Nov 2022 07:25:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c0a5300b003c21ba7d7d6sm1348138wmq.44.2022.11.03.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:25:06 -0700 (PDT)
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
Subject: [PATCH v4 1/1] x86: cpuinfo: Ensure inputs to cpumask_next are valid
Date: Thu,  3 Nov 2022 15:25:04 +0100
Message-Id: <20221103142504.278543-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103142504.278543-1-ajones@ventanamicro.com>
References: <20221103142504.278543-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_072510_903593_0CE89675 
X-CRM114-Status: GOOD (  10.26  )
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

The valid cpumask range is [0, nr_cpu_ids) and cpumask_next()
currently calls find_next_bit() with its input CPU ID number plus one
for the bit number, giving cpumask_next() the range [-1, nr_cpu_ids - 1).
seq_read_iter() and cpuinfo's start and next seq operations implement a
pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }

which will eventually result in cpumask_next() being called with
nr_cpu_ids - 1. A kernel compiled with commit 78e5a3399421 ("cpumask:
fix checking valid cpu range"), but not its revert, commit
80493877d7d0 ("Revert "cpumask: fix checking valid cpu range"."),
will generate a warning when DEBUG_PER_CPU_MAPS is enabled each time
/proc/cpuinfo is read. Future-proof cpuinfo by checking its input to
cpumask_next() is valid.

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
