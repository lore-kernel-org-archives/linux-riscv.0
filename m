Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0C0C79FB9
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9sT6SmOLrEzt4Ev6dGLQaNEhLSE7dt/oIUz1THhyOM=; b=LeY+qY+qpPEP0Q
	M+iNT3POdCLjlCaT2hpjQdc1RsIVvWLkeq8FK9CUFPoBeo+lFutIkRK8TnvS2wofQDIRXrd64c6gt
	Ayr7t5CtnPpUgllRLemvX/gDK1S/dH1/zPnRfhYHcBiKnBq3NDw7nBNJK4snVUKhSy7/9FcX57Ol/
	Reirut1PBcPnwxW/aCNnIlpr8HYbE92IjZvRWE3XipiA6EQhZw/LXXMKVYl1vA/skY/1eiKEP4jC6
	Ro9jFkhYrml+ZOZ44utNAUKePVz13ocREWrALFGAIBO2xO5ndPPi2+TAmJkfkEiF7ljzQ2jdmcG+s
	sGKp+x5liw8X72SxGSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu2-0000000ChPf-1uNb;
	Wed, 09 Sep 2026 19:24:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu0-0000000ChNQ-0JuO
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 19:24:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so86582005e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981850; x=1789586650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=RULvgQS8sYKvGkHQ8dnqFDwKIODYLjxBuSu501g1Oclnf84nxlxW7WPZ+nMofXvqCh
         2VHE2g7E6c5QeSjwZ5tdoUfL/VNF6FqyJzxc/pCrux8P0eDbrMF9iLoOfmsw+dW2/xqm
         cGpljCR43ff64RQ9tY7PDuw1l6zCDHnWM20eIjhB3oa8luJbFZAWyY937Uwf0LspY1p2
         6IZaVLwLhn6+Fhw/tFrhHPPiu6hCyryGqkupxg5hBfNJ7TSkoozGPYTaAVinH0uAPgCH
         ZkiuMCc1NGqzsOye2PBZe8pnX8KcnDec16X/fSCO7LH2YbOURWKk/WDTyBmXLodbNDnw
         N2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981850; x=1789586650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=P5VXJMVpuZPblIsjlOpqA+gGCn6xHGLxJOBUTMcqaUB2YxG/1Pmz24LsfLKdvW1j+t
         HvDPNKUOGa8ICBkY5wqV0Q19Sxg4gjTnK7ZsWVRq+aLGfJXCLhLkCxS+DYC5UwWcYqh6
         Z1YKnXgbgoJ+6+ypCOlNjp5JCBfF8hUxakbKdOKJjT8BOHQVBM3mmK4lX7lcrAyREEkK
         pQVmozxnWehS6C+um0ckC3pal2LkmDgn0dQN1ustkVll1rIk36SCrhMXLF6t+QpfR3Q0
         aLCKLmMG5ymU07KiFFIMRIEjIyCnpq7euLfuIPnQXoaF0Taj2WQmf7EXmpwsMbRPl+UF
         RF/w==
X-Forwarded-Encrypted: i=1; AKwUvBxsCyFGzXVL+ea2bjewIfaL3qyx9c3atzPs+CZj3lixXPhDi+yToqE0cwnplRCaC9sJzCVnwMud9EJwyA==@lists.infradead.org
X-Gm-Message-State: AFuF++n8ddmOLL+kl4dIKOM1acon9VjMmT4U3MPwtfISI8u4tgXWb/mM
	bhfKjgM/u6+atO7YapSSRREKTMqn+0/woZJk9xyx8QAj7iOVJ5rB0Vr2
X-Gm-Gg: AYBFou3cqVCDdNpA/qGfO7bKXn5Nf0xoMKVbowTNLY+QnEUUsLK1fUsivola/w3KdZo
	iwIoA4/xaLeg2vJ8Hdr7HIzLQLMJrM/kJNwCLyvIkpepwW3C7BBUdYxENTm91XxlV69KPdfRg/k
	W5f0gaQnDsgSdeF98roBnZ3GVyuLr7Glj5tEVO2f+AEUIZgpFLN9L+GBJXEa7Y5QprIyfvcmlF9
	A+/vqUuyfi4wDquro2iv3XKvpQxP3KNR+whGdR6JP7osWCVmEyOPqhI2kZdGoSEv+PHvugrQRXg
	BaQNhs2AzXhpsKQhvv54HuljDAZ2NQWF+21/dY3qz/oFlTDyJiZCB4BvCXQA48tU7LjkiB1wOro
	mi6Uf4XsMisbi7QIuLvk/ak064Ua2+tUE6km8ALGuxd9RQYsfUYVpMf19APGX9k6Cp0TxFV3akQ
	8wN2SxkbbQaPJPXIMYg8yvcn6G/RkWt+A3ScZtvE6mzc1SQcYM7TXjTrxEZGz186rVEvDJXiTMe
	o9SeSPZLJX4gF5CxOq+Rm3vAHYte47qzXWS3RuJVDo=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr282755995e9.10.1788981849957;
        Wed, 09 Sep 2026 12:24:09 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:07 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:50 +0200
Message-ID: <20260909192351.33910-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909192351.33910-1-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_122412_130241_49EFA0D6 
X-CRM114-Status: GOOD (  12.67  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
