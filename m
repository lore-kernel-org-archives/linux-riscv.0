Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F095CD8CA8
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 04:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bgz24M4/4uPCHLuKgkst2TVJAEVFgEWpHS6FcgRLguE=; b=PIffZYpe3KlbIW
	bmCKbonJxQzkE8nC7VjIFXS+bWyNjRFtxL+OYWgIzk7HgjWuTeHUU+6NgTvHlmWHPwZVEz1EscQpK
	35W/d9vtMgcxZWPIP3x9VQ289XQXBTT7rHUciX30qWzyPakBrm4m1kHJtX63YIYPWHrXcHzzFo3T+
	oqKhmwhymZqPJBSEmwojjD1oFQooZdLhNHw2JDz/FTZ3iS1DvBId1TFfb7eHNHsIvQlZo8KFuQwN4
	EIsLonXRuORETGZzJyWzgmgZZXkfS/WVs8327/wabkWUA5vaTDG4ucp0HaWrOGk9FoCx0Tzy+HiDi
	xYe+vh/ifvU/oWEfeqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtx6-0000000AMqS-3Shq;
	Fri, 12 Jun 2026 04:57:08 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtx4-0000000AMqA-2QLE
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 04:57:07 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-30749947917so1868549eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 21:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240225; x=1781845025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z070pyGbhpULNtHjr9EHM3bFZbxAO9sEmJk4Z3XYRuA=;
        b=qiC6eE839R8jChezLRqWj8oupX/2F9IIyuRYp7cHgxeW1vFiiSh1O732hQCsfiNE6y
         o9lDTy+J7yRZUrCoaAn5XF6ZQ+f1zQ7V8Wjc3VhVERYigy5QNhBGZ8kqek4nvRGDqzZP
         PcSpWkj0EP+PTTaXAcPCzg/jQJDilBTPhQdqXyCy4fa1Lg17zd1dRKdqc/5UBoIJINz9
         Qn2M0DOUmPTGp/g6WT89t+fkMwfq8yo+ye9RBuT7VHluSG37ROKgAqfMnlYvDcay4YS4
         cPUvYn5rfyIdr8BjLqiSBjv43eNQBns+D3SXc8OxFpKEjUwiYtEBbhAzDJhnaTq4KGzJ
         sEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240225; x=1781845025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z070pyGbhpULNtHjr9EHM3bFZbxAO9sEmJk4Z3XYRuA=;
        b=kjcR6YMpHjcObW6fivUXZPgPInd+DCbA4LghD4uxGh+7BYCSPedow9Pu8gssPKgAZC
         K4UaoSVJI7hgKFPe5COkkjk4VQF4Y9UCPZvuzFWd7ZJG1Bcr5tp2ymdxFky8pItLOJx3
         Rmibn/fVHaI8idv0ZhTUBTsEcEZpvv62+EKaIbkg2Gp4T/bb/4/rD1SPGSSyfnUOehWQ
         TcVXzcoZDfu2huz4Ljx3BGnvppygxR8O+W91ByEzxpDgZu9OiR1kzZLAAtmTUXLqcelw
         BABQz0mOx8LHYs3/M3Rp6AxWJSDChdsq17OpvhWPmIvqT7rtJp2DqhuYXY+5Gb5CyTm0
         FI1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8eq/kJ1FuFWHQR8wCfyIhT8rhaOAfsxbYBbF0RG29FYtezoee+Hqf+k3ukqGykWOaDRetAf4sUS6+2pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyamnCmkkqHHfqvnI5rPyUrwJPR8FygsUrJZEBFC62zDcr0HEz1
	89RRsEtiGEb2QgQZ9W107tTcM88i4GhbxiAR1If1+2JKPf2hGyxJVBAZ
X-Gm-Gg: Acq92OF5ESHFFZx7Jwmkwrj+VYgd8/tOR2TkMMr8s/B1oNWMhbhAvssjhwWCShc7eC/
	SFF3hN1ZEZBSk4nOVhjS5YNS/yORWvGHMbnYR/MgPV0Y3GGiORE8o1FwYL5MKjZdgjyEzbaMx+s
	f6lBU/W+LpaQ4IJJRwJUpULFs28nE4yNj3izm0nnQ8ZovBrdKRI56Fk3L5BVh5y1c8S9/5GvPu3
	NdNALJ3rUBhGm7cMk7hiR383DJqPCOihlvCxzGyTC9V78kZNe1ryixw3AQ8M3bQeK0drlaiT3EM
	kw6xbtW0zL9WYACEs0A2j7MdbWb9qsJy+zWftDmV9qtuKWAMl2+HCRa9KHroSjyjNSJFAsjYMhP
	khVHULTt7aF3/CAe2AtQ9GyaNI/tKAcR/lSG4qSGPgnjBunJCHzcV+FpN+AiJzQSdibtgLeSkye
	dwPZQfLMI8TpuAo+2e7k5tsxKKDcnDVSK62+zu/a1U
X-Received: by 2002:a05:7301:1f05:b0:2f0:c8b5:3dc7 with SMTP id 5a478bee46e88-3082009acafmr774924eec.22.1781240225257;
        Thu, 11 Jun 2026 21:57:05 -0700 (PDT)
Received: from kira.gmail.com ([2601:646:9e01:94:3ce3:853:6bcc:613a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm2332110eec.28.2026.06.11.21.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:57:04 -0700 (PDT)
From: Mark Harris <mark.hsj@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mark Harris <mark.hsj@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus()
Date: Thu, 11 Jun 2026 21:55:02 -0700
Message-ID: <20260612045502.70850-1-mark.hsj@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_215706_618434_F5CA2135 
X-CRM114-Status: UNSURE (   8.08  )
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

When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
initialize its copy of the cpu mask, which could cause non-deterministic
results from the riscv_hwprobe syscall on a system with more than 8 CPUs
when the supplied cpu mask is empty.  Address this by fully initializing
the cpu mask.

Signed-off-by: Mark Harris <mark.hsj@gmail.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288..caf6762427c8 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -450,6 +450,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 	if (cpusetsize > cpumask_size())
 		cpusetsize = cpumask_size();
 
+	cpumask_clear(&cpus);
 	ret = copy_from_user(&cpus, cpus_user, cpusetsize);
 	if (ret)
 		return -EFAULT;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
