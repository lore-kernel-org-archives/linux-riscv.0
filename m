Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D62CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8a4q4LJ9ioDHiHa9FKmnQbnqROmRuxnvQm+9pthkXw=; b=PyJI8sZ/FEysHJ
	bZSTReOp4T5yTaJ2ra4HQ0iecgPlRB2c3jmKSxTotq4ulCTugC519VfE+yq2hw1h+aW5fs0feF/hO
	yZ/muuE5uWNzwjiqhnS59I843wVLfGcMGFuS4OX+/Ha4GlxbqCNv0DtsStszSYkIqCJ/AkVlyjacc
	HBjtFxP7d0KC7wQFAqMr9L2Jybq9/gxZMnWBrXJ1PvkhGdO1ZPBe1111dkfYTIUvtDUYpZ6zdvqM3
	3x3Klf5SpXW/st9TktJfNlL80irbrsTZGqGty8j7pUo+WS7jqrG3KnMDec+Btt81OcK19Kx2L3OCZ
	DwxOsVEDrWir6Yo86lXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWB-0000000GcDA-1J4l;
	Thu, 27 Nov 2025 12:54:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWA-0000000GcBg-10sx
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Nov 2025 12:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=; b=BjNOpvCjnjFrGF+/nh95Cax5FA
	R8kKXIKHfnYW9hiqQUZNYQxRt7/Wg7EmJkxWGd5cezKqe2VimYrtMhu44A23DiPSNTutI9GX6NDOc
	No60hd7YB/wPQEqBCGYYk/22I0U2IwfdJp/JQBJ3+ctA0qDyvEf9L3D02GrQnZpKgVjoRoInK2ppK
	AfWgWKzFv3f5WS2JAvIIb7F0yVbhyxOQ2amfJGdkQRb3MlqIRyfHgFXr8pfLOLKWiPYZWJpTdKNLg
	93gPHfj2W00EhwR4gZDF7G5a+C2F5hX9FbtkBzrdANKX/hbFOvGpJcfgyZAm4/GF6Sjdmm6BquEIo
	SVh3G0AQ==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaeM-0000000A6OF-0Cep
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 11:59:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29845b06dd2so11245935ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248057; x=1764852857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=;
        b=PLKD+fqbTAB/pT71uz4lS3Db86JwkoVk0jvdfkv0k0URFBf3Px12vrljRyzJw6oy5b
         R9SMnIYPTrVcWC0diZF9fi5cS+5PMWFwgUQ1953YDDI6k3W5sg8Uv5k+UEQkf0WnvyQN
         pXEpOV2q5ZA5BS75qiRt2adOlU3U8+hNUBWB3/hfeT3pt7Qt+QUPu5PcpF3ArcLzLZTi
         xBrky9BdJkyNDvTJRiJ6IgZqoHlZWcDKlskDN5vxdOG6vt1HA8nnjKP644yj0H4a9Tzf
         kIbiTWsdWejlOWqBUBPN6ZnZlGXRI+Q7JoV/GfPH+cxRSIbs/puLMoWdp1o981T1oTUS
         xDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248057; x=1764852857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWkOyJ5AcV33EEWNye1AG75lZoiCez1+DCGpMn2n8h0=;
        b=Du2ZMfEQmSkxRMX+nTBWu2NnCbjuvNDGkEYSCZ+8zKho7tMluxO7RE0F71eUFnWp0+
         OY5XgTPFcgtM/OnKVYnftL2mY/Mnu5F15EgNrpJsiHyxNTmRUIZbtsPtKObSRhV2znSt
         zErAzKT5U3PdBGZCyfmuSOrqEUhExsy3WboDlSWDrUpglUYiR+yXkMv+2Ddq+JlK4lO8
         yQTUGGw6s7g5E0sVrr6TWuqyLPyCFDFOZQVsklnsAYEzASqb6JriHQ4m9HhkxDavPA7g
         Hv1gRrrVukzIid9N8t+qqta3f4BLneXuqzRO4aNiRh70gJjdaKQE/Ybo4snSbjvxm+Ud
         iInA==
X-Forwarded-Encrypted: i=1; AJvYcCUoATxzByNrt5a4PQswfuP3CDzGzOHXZ86CzeW9q5qJiyWxBC8EbDxGIExBVSJhnCumO2+OFe6MiQW5tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqT2rGmmpWvgBzbqp18Go32LHawidUtS4EEyNT1tX9FTNDQ7o5
	XMJzbFrro1BM6uA8CFJ8AMWr8VD7IGWUxS/PJ3G5q69oJbD3CctttjuXxuDXBujlT+8=
X-Gm-Gg: ASbGnctSHE8U8kvFzN+eEdofQ5ltPIHsr2r7y54XHzA7cWsKrm1AOQ0Uaaizsl7+F76
	6IWNV9WLfqqWPPCjsL5few+phI+7hl/JZBdpbNmsmf/n5B55NFxKa65c2pjd6edim/6/MrSgcc6
	lWm6IQy8aMQAUk423jsCaTa+RPR4Vjl9v6MZE4uFCsVWK9qQxdTHdey5eQTRbJUJFhAReW5hvDC
	VZr7sjCRCbKvV5ogI9uT+O/W3A1P8EaU9wMTvdMfSnnkUH/kM8FaHGi5T5Qg3OeZCOfRQDsTHs2
	2SNdj03IQ5+tgLVLyqsKS/wcKPSv28Gm5bJUp30CpJ486FQFJ2KOIbkivTGceg5N/NiT6BpgYe+
	nwyzOzG5SIVz6oWi5B182iFgixOKDkJav2kWFyTLuLPs8olokg5cmgvce31IKGCWzPMEcM8kKjm
	FAiY20RP1XQmZggQ8aIwJep4DK4U/6cv9PIgHqLTod0R4S
X-Google-Smtp-Source: AGHT+IHfDsQKz8tAmdnpj9oG+MYaFIwY7KvVCZ53LvFxGr4u9uSgj1+YFJnBx9PPYOIc/+SZwAFzqw==
X-Received: by 2002:a17:903:292:b0:298:43f4:cc4b with SMTP id d9443c01a7336-29b6c50c632mr250127435ad.26.1764248056650;
        Thu, 27 Nov 2025 04:54:16 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:16 -0800 (PST)
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
Subject: [PATCH v3 7/8] riscv: smp: kgdb: use NMI for CPU roundup
Date: Thu, 27 Nov 2025 20:53:04 +0800
Message-Id: <20251127125305.89961-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_115906_528462_0B729760 
X-CRM114-Status: UNSURE (   9.70  )
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

Use NMI for kgdb CPU roundup if RISC-V SSE NMI is available.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 5 ++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 6d9a67c2c2a6e..84436e348b6ea 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -368,7 +368,10 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		if (!nmi_support())
+			send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		else
+			send_nmi_single(cpu, LOCAL_NMI_KGDB);
 	}
 }
 #endif
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index a138d6bdbc0d1..85aa65f31943b 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
@@ -61,6 +62,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
+	NMI_HANDLE(LOCAL_NMI_KGDB, kgdb_nmicallback, cpu, regs);
 
 	atomic_andnot(type, this_cpu_ptr(&local_nmi));
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
