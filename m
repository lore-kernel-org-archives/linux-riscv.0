Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3118BC282C2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTtFido2xkwcgvgEf9uYeOS10GU5KvRKv/X2IQBnGd0=; b=Awtnh40BNqIlTs
	PsfPHLs8SxqIJW62E0fhZAba1h1tCETlTYSBNOD1BYeCotRUthzF2kl3dUbVfxBAi+o1oCXvJiMHs
	I3AuwvRvKaQSOzBUE2CAne2Gdkre+FagnprEn59zEhc7HdNQfpUigZhmoNtjRlrRzErUlQTW9UfdV
	TXz3VVXKZTj7ZPtNxy3eLWbvaJmgkDwalNxGso3dqi30XSqMnCHFnnQqrpVlFBxOiBmrX9+P4XXeD
	5oJHFaoU/7ELywNLQhQ2LH7umgozrjhCADbZ5pmxZkTAP7qjGJ6DGphnoGKUUaeomr85Ugm/3Tu5H
	Dvh5RDymJGPEcE8l1xpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndok-00000007V9v-3Toc;
	Thu, 27 Feb 2025 13:20:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8T-00000007O5J-1ylg
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22355618fd9so8426805ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659824; x=1741264624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtQ05xO+EnCCpS3XXknTi9mJFSuRz+8Y7aZxhDwaUdc=;
        b=Jk2hftqHcvAmI0ZeET0yoFPN/QqvN46RQLqypPdMhMYXaSMUnZJgF4KLAG0ojVyP2h
         HzGcKh+aLgpcsVNVjgH1+exuS2y8WrutlhN5CxM20aMUy7KMkOZel4MISrQLL+Zl1A8c
         KPv2Ye72C5dNl8z2XxEv55IERUislTz0l/+Q6giJcML+JKuWtvx13R9uD/7mCHO5Z+ke
         DnyVeeMorAQF/3otY6On8EsaHGWyivJZGB+GRtUJSiWXJE546ChGFi2m7v2Rzz+D0QKs
         ji1vVRiUy2QmkHNzHRl47Di7t+2e5dAsadfQeIal/wIAUAT8MX9AVryD4kKky1NTQmkA
         bhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659824; x=1741264624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtQ05xO+EnCCpS3XXknTi9mJFSuRz+8Y7aZxhDwaUdc=;
        b=tU65Z80KL0ikB/3zhIqlJG3HDtUuZ9npxR89L2heNaMdl10aP9lyIohYw8BMfeCeMa
         Aa6+b+HOzyxjjVGQNwanP1JGVcoAGdrZoXZ+/d85r7vvGgFjli9eFzEUs1SJm0FsaPDK
         x7aO+PBef7g6D2pfWw/pkhptYwygiwC4g0khDAoexeUESbJIN7w/50ubgwIo6xUSbyw9
         /SgkkADSNTMXeKB8OmsK74LLX9xczQInOOJjYt0yRlSfveN7v8md+pTpWC3a+JuZz4jC
         p8ppVUgUmjfItFzbVnbN3sHN3bw4VlUUHHWLJ+4h5QH8bH4PYBWPwItxRQ6IxQsVbX4J
         g4cA==
X-Gm-Message-State: AOJu0YyofjGIKYZi/6MaeoXk3jewMKpMqlzn43kS0ohUJVF+zrC9f8KB
	L9B10REVOqHnOXXptgX2R0sPlbnI6IV3GE9UQn6YKTNIwdipaPRP3AM/n9WEXSvoPBgrcsl/Rwc
	hmwg=
X-Gm-Gg: ASbGncuqb481IU01OY6v0Zy4ahwXVj0ioYh3jtZmUWyGuv9VEE0VRjehzSXw+Gy5gbQ
	BHbIsyFydwjlpkohiuXeNqScoSTaoFD4u1C1cFc4M7IX9K2nOr6vzab/8EDaedelLMsa5luz9Kf
	AAhh/pcgnYA3FTWaCem2fmVSf3sH6r547HF9YeBRulhQ13Z2dz+lJIFp47MdW0f5tOGhmauVmvM
	I1tXkymg74XSVjDThviYMQP6um0ZmJ589+kF1L/OQibJq1aWqt5mmr8+P1ofx9j/5Oh7N+Fkq/q
	JeKXbZgAmhlCyhFbuN2mTC0UXkULoP0ziLeq
X-Google-Smtp-Source: AGHT+IFkP7CS9xqANnPn4d9Sz+3RrDXTk1H1Jji56UTUSX5o72PLQQPlMQJClQVJhKn4XxMTw6Hpiw==
X-Received: by 2002:a17:903:2288:b0:221:331:1d46 with SMTP id d9443c01a7336-2219ff8278fmr376544635ad.2.1740659824356;
        Thu, 27 Feb 2025 04:37:04 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:04 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 05/10] riscv: conditionally compile GHES NMI spool function
Date: Thu, 27 Feb 2025 18:06:23 +0530
Message-ID: <20250227123628.2931490-6-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043705_506465_AB7C2702 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Compile ghes_in_nmi_spool_from_list only when NMI and SEA
is enabled. Otherwise compilation fails with "defined but
not used" error.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/acpi/apei/ghes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index b72772494655..8a1029163799 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1231,6 +1231,7 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
+#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA)
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 				       enum fixed_addresses fixmap_idx)
 {
@@ -1249,6 +1250,7 @@ static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 
 	return ret;
 }
+#endif
 
 #ifdef CONFIG_ACPI_APEI_SEA
 static LIST_HEAD(ghes_sea);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
