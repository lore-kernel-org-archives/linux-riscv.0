Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA57CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMTgk/3NCG2Apw/fjfB/mmDWemGEDaognBlFE4dxqZ0=; b=CYgcDZ6Q7HSvr3
	AgpVeNpTjWw2pdirf35qtIM5LhScFmXlhvi1IuXMjSGYN2KML79zExK/VhcvqwvjCXf7oSu8Ho7LE
	EhitzvVs5CMbCUBpz2NFjDoDdQbyFu8AUhYGmOimENgEK3W4LkYx8viYiNJUWOQVftfkGPBAb4zka
	3VlMS8C3W8GGkdYXv3SxH55WkhZHEOeOnP8qZoEfdLlNb9fBktKDZLCQAB+Fqt4M/q7kGW4lIyduv
	QvyWPzT+yAejQfL7w2sp70d1SksNOoc7n7EEgTbw0+1MdThjbyBujxORua+n5K7690K2fNEmIrk5T
	5WaB128XvbE+B007zsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MQ-00000005tZK-3sDc;
	Sat, 20 Sep 2025 20:39:10 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MM-00000005tSH-1djv
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:07 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-4248b3204d4so5002905ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400745; x=1759005545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfEiik7U1UfCLLRy1SfBX6A4ZldZkp0tuNOLkoczFfo=;
        b=eMr5Sru0i9dZePcOhNe+UE04Ur6aQCNNStNL75AMAr1bpDcln1de/jkWVUULbWDa94
         iUeWEifv/ArpylQVcKdBzxbRS0uTtE/IuPUYYtTP87uEdnRixZq+jHWMNhMVP77FsVtC
         1xl2YQFxWLzqq8He/JUxEx2aamxkF86P0Z0v0Tc1COKhOGjH98K8y5QB1BZOreIlXc6M
         aYJuxQ+T+CM4gsl63aN3VP6mkFFH5YV+xv7Rr3Ixm8PXE+fDJEMFWfIfH+Q1aOUsnzcK
         lmDZhbFUV+vSXz9ZywM3RZHx0xckXSgya8jkrEdQnygZLlqZEycBiCGj9OrDWx9vrIXn
         EUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400745; x=1759005545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfEiik7U1UfCLLRy1SfBX6A4ZldZkp0tuNOLkoczFfo=;
        b=kGcyotAxudAhdXMIKTMZk3na89cYXAQvc/uEF02dQgfnR5wEUxeXX7BaTE4/TXASei
         UwQkf+eqMz/zrqDfywH8/Lz3M9Z+WOnEK7lfEklHcdoBslw4bxRGr4scI5plDi3jqZyd
         c3cPWIjbqkb18B4Zxm1pHHpk0ZdFDlCoOi7IZDuFCELYMuAX4StKhRhHa0rre+FjrlQn
         9s6WC++1G6xdpdHQ4Tugns0G43royJtQfAd51mUlI2mDm2vj/v2lMkHfIp2HT9Zrol7J
         fDGJuPTAhVcuLUoPo9HIueFHHeJdT9OUAOLWNjZVfG5HHHvHpoDIx5Kbi7OLyJhYHoq/
         YQNw==
X-Forwarded-Encrypted: i=1; AJvYcCUgoL9JVuuDs6rhWNfmX/0xD9w11SQEy538iQH7D0OXSd2uwqOa9oZyhc5PT2V7QiB1pU9mUn5Xbb27xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC4XDZlIfLrYeqzooszCJ+VGD4tz/PLquz6+FsagbyrVKHssSx
	KAO/QulMFs3XKy4zLk0d+krUexbJl18E8ch5ND8588cS7zKifuqpMKfo8tOCZuwJ8AM=
X-Gm-Gg: ASbGncsOhIgwsTsvrErnpdd/OIN6c9BtGl+hOXb5dbXiorZPzQsXB34iTNCP7GvnXd4
	69KyRnLSMqHsX8RorBbnpSDrGETX2eyRbxveT80TLAOgBHD7AOjzq2gEYsFACB/2SIESrrGnH6N
	5VmnbPznR5SzMX1U9kEy5tc44ar2FSIipdNkTmxmmMywn027T1yi4GWUWuSoyzR3BOyzYwtE2mr
	+n8MaCJGJOgeIKxgPxoh5vjfx+y68mS/fN8bBVlTuFMqIIE3dtjziqgnNuKKJL5QvXMhoei0lB8
	dQDaasfhX9PRAJsb1iQrEZeYREp+4IbJ/mwf8Cwy+18vL5AlIuk0Y9va/bLkQmVjjtsWKjMpzTy
	hjwEs+sj+hD1G6BerEoW/D6YH
X-Google-Smtp-Source: AGHT+IE581P0AkyphXbszugWZqZNJhwWmOr5TRI9ATozw6M+qkg0V/7BRnonU41e1GD3hHsR2JSR+w==
X-Received: by 2002:a05:6e02:1b09:b0:424:69b:e8bb with SMTP id e9e14a558f8ab-42481936b23mr116504325ab.9.1758400745560;
        Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3a590fcfsm3682210173.11.2025.09.20.13.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 10/18] RISC-V: Define irqbypass vcpu_info
Date: Sat, 20 Sep 2025 15:39:00 -0500
Message-ID: <20250920203851.2205115-30-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133906_457043_A06C9FED 
X-CRM114-Status: UNSURE (   7.43  )
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

The vcpu_info parameter to irq_set_vcpu_affinity() effectively
defines an arch specific IOMMU <=> hypervisor protocol. Provide
a definition for the RISCV IOMMU.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 59c975f750c9..27ff169d1b77 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -25,6 +25,15 @@ struct fwnode_handle *riscv_get_intc_hwnode(void);
 int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
 			 u32 *hart_index);
 
+struct riscv_iommu_ir_vcpu_info {
+	u64 gpa;
+	u64 hpa;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+	u32 group_index_bits;
+	u32 group_index_shift;
+};
+
 #ifdef CONFIG_ACPI
 
 enum riscv_irqchip_type {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
