Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00AD68B35
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jODMrcLKqc7FmpfEjAWJd5wWxoJdPIoFhCnafgTVH1s=; b=1dkOXhYC4UB91l
	Orao9bt7F3MSgRHC6t1ZXPOTcJn1F5ox3mR4/BgFQHMtp6r4aQcU6bu8IYT8zSxBn+g3lvhuIwEai
	QsXqvvTX14qDno/AwclJwIW2QzuVEGEQh31laBEl3UOyKLY0FMhmUpCAlUQYHsXLys2EROs3PAJ+y
	aXTg2vi7N72SYAsrf3BCAd44Q891l1XDBjXuhkhDjaLBUWJbz/1QgCZejiVAr832zkhOLHHof11BD
	fxhJNbPKJTo2SFnMhDilKNPYFkuuHwyztIIwUTcWLPg9rh64bQh0oY0ooHjuJvvDFdEgkaAkFUq/A
	j8S7m0PRLfS6tmANACUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYZ-000000004sP-0WQf;
	Thu, 14 Nov 2024 16:18:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYV-000000004nT-2eFC
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso6033235e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601130; x=1732205930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sV1q1LQk/q83S2J2BpeMk7gg4mJdAxo4Zufy5rZGAM=;
        b=hjuM3tjDXnRRTFOHuqyytMJkNqoCyGbz/jj20wlh2OBQ3/zQzGCwO+KtqSpATC/Es1
         a66ceADmXmhv2M6s5gTymizi8Sn7P1hfGFqKd3W6iiybgvgKDRulvG22YwUNnZETfb+m
         gFP4ytRy4/lqGJ6ODvXNQAUFq6vGk/We4hvqlbanM07KGTYRwZeYtWol6hNKEq3QSSF7
         TBTnyv+9cNaAu0NDQnuzi2Lw45VSolfhafzK5IYl3SBs6OE7NcrM3LLTlGXA3h0xVM87
         Yzqy7f5p3PfUazpLBkaOiC3obz22OO+KRYGxXMHVNY+tvqWY6FfArP7DZkNhlBwrI7Eb
         NJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601130; x=1732205930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sV1q1LQk/q83S2J2BpeMk7gg4mJdAxo4Zufy5rZGAM=;
        b=dzhulGM2cs/w9s1Ass6EIMrGj7qQ9d/mXogy3SvSLyxvlMSZ7mGehF9K/yxN+YATg8
         tSHT6+5uq8NXh2UAZwHCpUqVVqKCS6UYCQWbJia5wlpEWhjwN+5Ma05cI4LgXr8MhViU
         oDI8fY4CoOCTALLYkCi5VMYA4LMZUYwgeBnRGipaefWFOvDJcxZRy049Vtc/wIDQWuqV
         5oIZKKRnKHV0Qp8tVoJDaswRg+96w1SkhZoA/LxSeW8fQ+UEI9j3oyx6UDywN6VMm/GX
         go2JxRtlBkcxSvu31q0yCNI2cRa5yAUXyipaZBexX13rNB2F2o/bPqpQHNIbugDzGLu1
         YjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrVaK+dDumx3ITYIavKEO4aAyUfE0nyJb+c2KqNd4ZcUmcLjrrZGJcDSYNBYZPECr9ltOTjsCwBK0njg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUhE08x05Jw8qvpaEjkt9+9blpYjMS4HsEOLBJJMcOeoXty1oJ
	7sGU71X71FF+ltuOKYEQHkuB4ObCvFwCcBOBJ6FGJbp7M1xHnayM/oFCzYy4GiU=
X-Google-Smtp-Source: AGHT+IG+PIdlvaNPVTcrNev34iOeURvR6kwzzOllPVjWxdCbuE/GqDAX+WoRpo6pTqFd8njujj53Ow==
X-Received: by 2002:a05:6000:2a10:b0:382:2084:19b3 with SMTP id ffacd0b85a97d-38220844ac9mr1324585f8f.22.1731601129621;
        Thu, 14 Nov 2024 08:18:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265c45sm28633555e9.11.2024.11.14.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:49 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 02/15] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Thu, 14 Nov 2024 17:18:47 +0100
Message-ID: <20241114161845.502027-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081851_677087_4A68FB26 
X-CRM114-Status: UNSURE (   8.71  )
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

Provide a domain bus token for the upcoming support for the RISC-V
IOMMU interrupt remapping domain, which needs to be distinguished
from NEXUS domains. The new token name is generic, as the only
information that needs to be conveyed is that the IRQ domain will
remap MSIs, i.e. there's nothing RISC-V specific to convey.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/linux/irqdomain_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 36653e2ee1c9..676eca8147ae 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -27,6 +27,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
