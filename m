Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723C7C4829F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLaGKEnMS428tArkQ7Es2mdtkF09MI9Ttqy7QPx7Q/0=; b=b0Su/qHU1V0qex
	FNdm9kK36Xy/onNqU+01LiVLj5Ryc0o1VITsCZhJtTTobFwbWNLwQv8fpPLMx571YXripaME9HiqR
	h5NN9ovmMDxK8HdgxypJ7RZoAJxmgJ6VSX15j8YwPAes82dvBoAMyeN1zRvuuu5V4jrHKdlqaHgcS
	RB+z2kIdEK3EZ3PK3BZNssi/zqK1WFx0XP0stzRhaNOUW7Kku9d51UbynbpgLdk2imGK3vyjBIyLb
	wAo2CBbgbmYsMILGYHQGg3DYWqI09W1EuGPDWEw6PCnwDGjy4oenrWmXq8G8KVARYBCGPUsMv+vpq
	EMVXCMoYG0DpjsjpzhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqs-00000007IcC-0NOb;
	Mon, 12 Feb 2024 23:36:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqn-00000007IZ1-1zem
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 23:36:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d7881b1843so34242885ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780996; x=1708385796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqFsnYbayaROauH/yeBk3F9rNPdoEfeRLt6dO0Xr65g=;
        b=BUe+b04E9xhC6Zu/iFsBW6l+PTF858M9dF1/L6UMwf44jTnBVfxc26YeaitI5JP4C3
         yIcd7mefXSo3b8+MuVCHArFog4Zm0kKXN8k5G2Zn2yFO9l9LdDXkqMNarPLi0rsdfVmN
         MRoZSliwc5hiUDuOIpaVcz3jGEbSDCoW0DAaRubmRBwAOs3b9Zzhyug8XioRdXbBBd8O
         /YvYxIuhwqQd6p1cod9Z/4iVLh1owKxFRPwGhGxdfHYR8wlVtisHOTBuyq4BgDlxvAUl
         z3EX0GsfBuhz+HEUXbJ/3k1OLqy7NIaupb749AHz92deAkCj5YIDowb7s7FZUimDcuii
         p9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780996; x=1708385796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqFsnYbayaROauH/yeBk3F9rNPdoEfeRLt6dO0Xr65g=;
        b=e06g3s92PwIqxX7jU/Sv1r1QSMpzGDnIoOLKHTONwBkwrLdxdYN5aF3DBZjUW9zX+j
         bBGj4sCRkkbVCpuMLm5LKwCX8W1EGbtsmR8AGEu7qWWHNXqnP/BR4ZsF2XYjFtfg1zoK
         vDv6a+7Qv80z2FTjTdoF8JaZgrYVj7K4RNhVe+F12QpteNSrRHN+ktl0uVz6R0AKw0ke
         8jDFNNtSpsk3VzeynaX1jmlzLq4ivwo/ORmnNO1/flyVz+hvynuw/QOLdB6ac28vIdRH
         NcI+Maaxrqr2jrNOUT5cI7FxfgXR41zs8Ui8IPBkiicmleWCZViImHgTlHa1hvOo7VXb
         IZ8w==
X-Gm-Message-State: AOJu0YzUtd/cxr5g0/0TaNL9sI81rdpKHGdshQSCQsVnzrdS9nlsLQpP
	SXAAU1HJLDFE14exu0g4XhTac73m7+RA9nQ7xxyh3XzM8eY1YiXo7ZhtFXSj+BI=
X-Google-Smtp-Source: AGHT+IEtzelG1aBj8MhHUkWpgbenml+rvNSXi4YOjQkaIXkajpKLpyf9eRWHPskzRMV/SZLXbDR4ug==
X-Received: by 2002:a17:902:ecc1:b0:1d7:b1f:be9e with SMTP id a1-20020a170902ecc100b001d70b1fbe9emr9547643plh.66.1707780996763;
        Mon, 12 Feb 2024 15:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmhahLkBycaRs+zzoTPL0pP1/Wbhljlk09mGvZl2U3BYlRz5afgzfA4K6oqUcu0CEflM4zj5+TqIePAEv1u9fURwIXrlf9AzC8VlXIv3fVP2DyI2ElWKkAeanWCs3jfOGB55CzBhMOKNK7t91AFuCyfpr4hG54nAJds3f4sSV/prcfAWmcrnbBMVlm49hPtTlMiLw3bu4G8rxu4OuobxGyLSqhOg50X9uwZDi/69PwQrtG4GAJTMhS1bmhY8NjeEdYt7zKMUFhPBN5NmfRWbF3Ci7F2uELrXj92QbZKRN/KTacsTyfNLYjc/k9bL7lSTdk+FXPauBA/9p9ZxViYmvh+WCSf4bb33CHZnad4402Ud3kDU2e9RlKDluUzWsPPLzK4MwXbl4=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:36 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 12 Feb 2024 15:36:29 -0800
Subject: [PATCH v11 4/4] cpumask: Add assign cpu
MIME-Version: 1.0
Message-Id: <20240212-fencei-v11-4-e1327f25fe10@rivosinc.com>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=1797;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=teNltxEe5ATnvQPKeLgPp6b3k0t1rOkLmnDUUB6OJdA=;
 b=EiKlcL1ulk4DvUiCSUgvbFtR389U08UGs9J+Mx1NjicMNyA7ytjbg4bgirWaWZZtdE5HGgwHU
 EVUxZnpx4C/A+JHiRo45OTnP3oYSGtoMtT2ZFchA7WKDMysLkz7sWPx
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_153637_652394_615919FB 
X-CRM114-Status: UNSURE (   9.74  )
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

Standardize an assign_cpu function for cpumasks.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6513a0ab8655..d10c2cba8aff 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -234,7 +234,7 @@ int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
 			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 			cpumask_setall(mask);
-			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+			cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 			break;
 		case PR_RISCV_SCOPE_PER_THREAD:
 			current->thread.force_icache_flush = false;
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index cfb545841a2c..1b85e09c4ba5 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -492,6 +492,22 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
 }
 
+/**
+ * cpumask_assign_cpu - assign a cpu in a cpumask
+ * @cpu: cpu number (< nr_cpu_ids)
+ * @dstp: the cpumask pointer
+ * @bool: the value to assign
+ */
+static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
+static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
 /**
  * cpumask_test_cpu - test for a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
