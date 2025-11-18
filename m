Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1BBCED242
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JS9Swdo4249f4BFeLrHW49smzmVSlReJSKF1qGhsVYc=; b=viaCXTpXATawiL
	OhJByp6j6ePKVkOnXmgqu2Gc0z+4Ji3WPpAWEw+7KEhIAczVBeUPzv8ioWtyZlxA0KN1fLGKEbvio
	Xjak4xOpzxCyN+fNmXXSX5GIGyBrWm/Z+vFmetgdn1zuMWHt9qGs2UJKdAf2hoghKG1qhnhAmfA/X
	nEKxYOui+ctCmzbmSRHUNyL7udQaXoCSrEQlpiDI6YZYMKZhVcLRv1/ItqvkKHcBPqdfa9KTNqVj4
	ruuTKKz299dxi7TBw6Hiv3u+HK4VRIECVYJuh6aU7i5mAcGqahByEKZEhklVA4/CT5+mgZW1t1KVF
	hC2R8VZcAaTF8YseNT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBot-0000000HGAB-0L2O;
	Tue, 18 Nov 2025 02:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBor-0000000HG7W-1iHO
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Nov 2025 02:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=; b=gSq3UuR9cqG+lakB3NXRSi67zC
	IgkKAyo0psQExr8ZFIZeSR1DaF3R+n68Nzz2NmOU4zixd993Sv1BhByE/4Knx0R9kbxlGf2t70yKD
	/sfhzWu7cCh/5QQYwwpfQ8hzxxgrhg4FJ+EhT3fZWu0o9hPPlGAPNTgp/5NjzSGSJx5x/c6Yn0VkR
	NLOUl+4VMj6m4AFKpVNk5jN+/cefbjtNa9L7mXjpRxcz1zFs0TdnMsBJ7a+jESG+H239EI5ifbfjn
	IFEHPLxcby1d0zQ2DhpDEzbjJYQT1xXLOIWVZzY6rvMTMP6ErDFXyqebLDqWo8yTYin7a7iUXzID1
	Q0Ry8r2Q==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAxA-00000008eBG-1Xag
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 01:56:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297e982506fso60249265ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434299; x=1764039099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=;
        b=CudhNXUveBhvV70yuOCi5gj7cLzASangLpmMMDGK1ueNNZGu3XKD686tT/yW5gWvEA
         G0X+KSIcm2bfzPgtum1vP2T8u0Mthc410mUA5nckHk43Qj7yGzIuB+w9S2RLX1tXG1oi
         8ZIIXRpW0MMnJvuWip/ApfCPiDNXPzPuNrenhUeNJsnl5Qc0rD7Lvuzuo8kK7+xUreli
         nmzL9CmW4y2v1Pz0bIzO4tqY5p1XWBm6Z4ZALI2NpeR2qAHukoyczTnyG6PvgX5feKAd
         xmUUvXzB3l1EKwsHIE8zyaNw9G3vzEnrVuVMBIO/tWPCDsz556ptGWILRzBS5IZHyEEB
         VT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434299; x=1764039099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=;
        b=Z7W+C+4DO9rDRLndUl+QK4eTBnmF28dMXU76X6jb0z51A1WSwjP9mZZDMtn0tJNmml
         53o86k4nCv5eMTMorZW+FefAS0nD98Bjy7THrn05K+0RNqd9TWwDiFREWBxSGe6WA5f3
         VuTPPBq93MY4AmzEfm/x+gaeecPhxtLa2qefwHicytEghUOHgHo4iIuW/ABrgrgPkoC9
         AtfbmknCbiv/qhCcjBb+GAj+cEHaQQSkXEOcEH8zzY61UqE4TJ9OumRmfDH7quiLEvca
         1JOSwC3yo+F2QShgk7EAX6RIWe+MCHBAIzpu+Zju+Vjzy069ygUD34D6kCIjYdTYKTkv
         UqCg==
X-Forwarded-Encrypted: i=1; AJvYcCXbXyNt4Ifim4Ikv4Km1UvyAMTZfIY5BsDSkhgw2bVwode777n+gJXIJj+CVJnHfnj8U3sXVK+/USZXNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRvO3QJqjCtuN70z6xfoT/kIy2/v8BqDHG4jEwU8prswyxspBS
	c8qXsuzZJRnMFnlhlhjxY+Jks35+fuUE6LaM+yNrutVCxmhcMxJNCi8KerQ4d+ML55A=
X-Gm-Gg: ASbGncs+ivThC97HLKU9nJtqQgbzHtGwqkqlPsGmpOyGsr5E1O+trykGATKtRGV4wbR
	ymvPjqOxex9ECeDZLC0zHDS+213xBfAvL/OT4lwzSSSCzkoyTBg0S9P70JxWyDhOg+gTE5FPT0x
	L+vA4H/m4BLExTlpP2T+ZSpXpH++Y0xUt0zgCFZPpTz5RlwqetKukdalOIeA/rQdz/OgJZKlSNh
	hnzm83IVTOBmHrLxTL95mtb547tiU9Ho27IgPnHXISrSRfjL7aWVC+NzNRiO4bOBUt6KC0g5Qzq
	+btfBgMl0+Yps/bN0hg/vufqnfLokVrdi4Yq6LN9YCiegjGTe11syYaCIEickIFGaI4Ks9c+2rp
	mdhjz/vSH3g/sHYKJfJPybnlwD0NxyoDAIHt56etPdHYDS17auRifY5oB0hBfrwZBEEPuiFEjWS
	tXsJCII6XX3bp/AnHxHHw+HofkGRTVjBoMcA==
X-Google-Smtp-Source: AGHT+IEujdRH33fbMDGe6RC7S5YBADf9LCNf5v+zfV1QKs6M5jHT8KuwmXDEm96Zsr0CQ6aCRzvaPg==
X-Received: by 2002:a17:903:3b8e:b0:295:19e:487b with SMTP id d9443c01a7336-2986a6bd1f7mr197186615ad.5.1763434299069;
        Mon, 17 Nov 2025 18:51:39 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:38 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 8/8] drivers: firmware: riscv: add unknown nmi support
Date: Tue, 18 Nov 2025 10:50:15 +0800
Message-Id: <20251118025015.42491-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_015620_712665_11E1C099 
X-CRM114-Status: GOOD (  14.13  )
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

Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
event. When the system becomes unresponsive, unknown_nmi_handler()
can be manually triggered, which in turn invokes nmi_panic() to
collect vmcore for root cause analysis.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/sbi.h           |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 68 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 874cc1d7603a5..52d3fdf2d4cc1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -486,6 +486,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
 #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
 
 #define SBI_SSE_EVENT_PLATFORM		BIT(14)
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 5035d4ec485f6..e895abf583bd5 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -7,6 +7,7 @@
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
+#include <linux/sysctl.h>
 
 #include <asm/irq_regs.h>
 #include <asm/sbi.h>
@@ -16,7 +17,10 @@
 	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
 
 bool nmi_available;
+static int unknown_nmi_panic;
 static struct sse_event *local_nmi_evt;
+static struct sse_event *unknown_nmi_evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
 static atomic_t local_nmi_arg = ATOMIC_INIT(LOCAL_NMI_NONE);
 
 bool nmi_support(void)
@@ -51,6 +55,35 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 		send_nmi_single(cpu, type);
 }
 
+static int __init setup_unknown_nmi_panic(char *str)
+{
+	unknown_nmi_panic = 1;
+	return 1;
+}
+__setup("unknown_nmi_panic", setup_unknown_nmi_panic);
+
+static const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname       = "unknown_nmi_panic",
+		.data           = &unknown_nmi_panic,
+		.maxlen         = sizeof(bool),
+		.mode           = 0644,
+		.proc_handler   = proc_dobool,
+	},
+};
+
+static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
+
+	if (unknown_nmi_panic)
+		nmi_panic(regs, "NMI: Not continuing");
+
+	pr_emerg("Dazed and confused, but trying to continue\n");
+
+	return 0;
+}
+
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
 	enum local_nmi_type type = atomic_read((atomic_t *)arg);
@@ -66,6 +99,35 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	return 0;
 }
 
+static int unknown_nmi_init(void)
+{
+	int ret;
+
+	unknown_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI, 0,
+					     unknown_nmi_handler, NULL);
+	if (IS_ERR(unknown_nmi_evt))
+		return PTR_ERR(unknown_nmi_evt);
+
+	ret = sse_event_enable(unknown_nmi_evt);
+	if (ret)
+		goto err_unregister;
+
+	unknown_nmi_sysctl_header = register_sysctl("kernel", unknown_nmi_table);
+	if (!unknown_nmi_sysctl_header) {
+		ret = -ENOMEM;
+		goto err_disable;
+	}
+
+	pr_info("Using SSE for unknown NMI event delivery\n");
+	return 0;
+
+err_disable:
+	sse_event_disable(unknown_nmi_evt);
+err_unregister:
+	sse_event_unregister(unknown_nmi_evt);
+	return ret;
+}
+
 static int __init local_nmi_init(void)
 {
 	int ret;
@@ -98,6 +160,12 @@ static int __init sse_nmi_init(void)
 
 	WRITE_ONCE(nmi_available, true);
 
+	ret = unknown_nmi_init();
+	if (ret) {
+		pr_err("Unknown_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
