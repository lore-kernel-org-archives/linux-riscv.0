Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F13BC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSK5M/s94K+kqdzQMl9PFtFJRETO02nYKkP+CVEWvZg=; b=FjWOCJu7Ti/yqI
	3IFVS5FkcN31WKFz38x4zIF4lEV2hzgVFlBU1ckFgrgUThZXrWvDkyygcoZ3TU8SO3Y+Py4hnqAP3
	6bUQNeWyhTWLshV+3NVhpBblY++Y1DMjmtsyCfFgQHS11bjxM5Oj8WoiCbrBWLdb+w6GOBbZkofKE
	PXoNcnx+IPa9Z79DeQ+oWzlMZO4L7x0HYdG3AA2SA98mSp7nl95vMkuKOVFC4hOz4cKbCB9ePhQY3
	sZuK1KmvJ5fewEWiNHrIE+BvZVx5V6o8mKU6dDuCtm0kcZa35pMWyjGpBLCxvX9wnVgzsHj3T2mtp
	/aZ9QmY8elf1EP4JrqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqy-004yUF-6W; Mon, 30 Jan 2023 18:26:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoW-004x7B-Ap
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 88so11871621pjo.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V4bEO8aGCUnvICkvYFTtflr32JlbC6lkp0g+wowtbM=;
        b=lk2FS4bi5tXkC1KwlB7IR9frYJNCQB46zRuLBebN5lBJ8cN3scRheCqCzNq02LquDZ
         T7s0yo1+o/et+QSWknYJCYgYVrAhIpx0Q9RFeIJULyKKzgmtGBS8BkeM/vl6wKvrBMjp
         mUvQzp6EXvFNRLO9+5Kiu1elg30zaPMBmDpWZO2NqlSDLjfGA8M/9cZI0DQaxiOgClDj
         0kOWsS7nvZZg3rIfS/7ZgCLiyEXy42cw6D20wqCpo9xvkn4YN9s2Y8p41QXLbbX33pYG
         yt0yEkzirf4so3ujS3owGMIcP4HQ2+eRccoCcxPRQaOr8cvUU/UP8Tzs1QvpGKrSAhji
         ekYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V4bEO8aGCUnvICkvYFTtflr32JlbC6lkp0g+wowtbM=;
        b=MuE/rXXORTYeF0HiUThUdM15rufWjipnbQOgRb7kUBubY0N6PUFTTj1xEKo4qTJuLn
         C83wlnyZvr9A+XmK6ZFl1IsY0g6xiibUOF97ZDSGS1KldqiQREjZ/QnedRObZtZ5Jz52
         kr8TbI7K+J833rBqj5yXCeyRIY+JHMM0SkZHPDXQHna2fZazi5/DOypPrwUZM6366Wx1
         XISXAptT6MmXXJ2b5XCAhN+eOr0kaFN7xImfwFA4Fd8xePWVBB1l9vfFDSQPxGLK2A9v
         IvFyf4HW0ZBJCt6bWuQYyHqYpQiPFxyEEvyEBrxxvjfnp8I728Yoh+yh3oHeK2mKFL7d
         OZrw==
X-Gm-Message-State: AO0yUKUIPM1gLDdEJML8r5URj9X12gy6V59sFBCT0zda5ltPxsXh4yb5
	DaAhqi07WNA1aL3tlbOv8OicnQ==
X-Google-Smtp-Source: AK7set/tX5Xt8agYBu/KLyJy+OnSgmLrgEYtXB6QpcbJp9X24yqEp94vp4kVKhN3pU5/ZWvnJCibGA==
X-Received: by 2002:a05:6a20:8e19:b0:bc:db54:27d7 with SMTP id y25-20020a056a208e1900b000bcdb5427d7mr5597928pzj.59.1675103009111;
        Mon, 30 Jan 2023 10:23:29 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:28 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 12/24] RISC-V: ACPI: smpboot: Create wrapper smp_setup()
Date: Mon, 30 Jan 2023 23:52:13 +0530
Message-Id: <20230130182225.2471414-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102332_422854_899BE0F4 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

smp_setup() currently assumes DT based platforms. To enable ACPI,
first make this as a wrapper function and move existing code to
a separate DT specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00b53913d4c6..26214ddefaa4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
