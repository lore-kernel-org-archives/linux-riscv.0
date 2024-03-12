Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20EC54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 23:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0MkP8fu+AYHg+Sha4Z5OAsFRpRGY5yAkSD09f55BlU=; b=GPKEPbVljfCOl+
	ndnoj+XrdywLcSsvaDklE4thR+ScXZPdAf3ZsQLsX5mhnM4AqZdH+DX/UOiYHygkDL79bEjMhxcZJ
	QQFYtyNMkYDzSBcND3e94hIWwpDVCo8b3GF5dG6kEN6OhuKs6NvDyzrhlbpICR1LYuwWSI/UCy1DZ
	EboAuIT0rnx0lv7O/gY9OsOZbDKohPXfhzV+gqhcE1rxe9uqEDXjP9r5MxfwUN1AvcAU7BAnMU/ab
	z0uAnLjVRRoKwFqmUvlM2hUHAtEYjiI3jPVPQdWxg7dZCWQ8tcADLnARvsU8qjanMkIj+jJi2m3oD
	Vift7VUiOUW5jOjLdG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwQ-000000081il-2a0O;
	Tue, 12 Mar 2024 23:53:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwK-000000081fu-3BfJ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 23:53:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dc09556599so50468155ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 16:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287628; x=1710892428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WqC9EYNMp24I0Ah4fci0KUqmT8EqoN79+NZmIklXBM=;
        b=UFf8vB/BBz6mdWuNjiJqW7Fh2E7pYoMbYwZxTEQB4BOHnCVW6Zekc/M4WI8sJuEDlK
         cBt99RxVg9tLTwoXKCMoqmjrLJbv/Ctctp+bTXyJmUyJAVLbT7uG/WahXThkgA5Xq4st
         4+1bmI0JxPC30mWbemUXJca7E5KTQKdvNQp+pu+rgScT24IWqt+ihQzxnFbsBYV+w3oT
         vi9xqEnPhA1K6R//iSj8zZHZKVGvTnQY/s0PJyQcWxzRTqqwV8Fn36MW2pLa5/bg2rvs
         6tq/WYFk++3kivKC/5ySQufw0jgwGiHPJi7vupC3v/4ZPtTZ/6C9ehT0AGejlAHMdoUX
         T0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287628; x=1710892428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WqC9EYNMp24I0Ah4fci0KUqmT8EqoN79+NZmIklXBM=;
        b=AFqTRmSFNdjc6WuKygFk8KqmjrJysY6plCdVjOEHbZZlHG6Urwdms8AaQkGgcYs3G/
         w/pu9lHbxAMtoWXewnEfxoYH8/ukAcDty32gpQCiftbQz5C8E2/u2aj0E5EUjcuUIBbv
         cJjk5PFxKCUjMl1U6lNGzQ1geTdBLwdliETEtMexeJ3+VFWJBegAjufeOZkpKeChdfC/
         3q6kIZgT/W4/UeXauX9vzDs0ETjGljkVs166n1GZSkrS98+VxA0rdOEg82l293vvpM0n
         OVlpwFpDXdm86WQRs/xmx7jI3DhsXryr7e8kUO+0k5RwvyBtcRXJ88pljw9IcPZNd66p
         YaXQ==
X-Gm-Message-State: AOJu0Yz+5hAptbdlD8jIwrOCNXOlPjZn+0m6nYBjr86XsgkerZYY1EhO
	hqgWzXBfsJFAr3Nn5a+U7xIZOk6qaUxpauSy1MackqAoKZQIG6R6eWp0ErqDXVM=
X-Google-Smtp-Source: AGHT+IFRA+vdCvsszXe61z0lN9iAK9Z/ra0D6gklHZ2jxM8IZjGafc+k8Vt3GmhS14d8pl67aEwWWg==
X-Received: by 2002:a17:902:ea0e:b0:1dc:ce6e:bf06 with SMTP id s14-20020a170902ea0e00b001dcce6ebf06mr13980467plg.0.1710287628171;
        Tue, 12 Mar 2024 16:53:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 16:53:43 -0700
Subject: [PATCH v13 4/4] cpumask: Add assign cpu
MIME-Version: 1.0
Message-Id: <20240312-fencei-v13-4-4b6bdc2bbf32@rivosinc.com>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=1674;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=6GJ6p7yMdN+ouzHCZ+tS6sWbsz3sQSlgY1DwzMvWuUA=;
 b=VgSJhrp/XA7/5Nj4l4UWBqCdsrn4rRXnIv9+QzM7vEeIgZHPzHCs2KUaHtvu93Hal0LPGPw1M
 73ATSwpKcf4AF3ewBvQne6ZnvAPUXPu0x9vXxZvQMNWILesdQgSr+Or
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_165348_963469_2DA6EC83 
X-CRM114-Status: GOOD (  10.09  )
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
index 9b74861000ae..0927df96c0e9 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -169,7 +169,7 @@ static void set_icache_stale_mask(void)
 	stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 	cpumask_setall(mask);
-	assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 }
 
 /**
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
