Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBA4D68B33
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyMCzNRP9G5Cgwisaobpyb9kpkQlqvMrskZeEm4mJMg=; b=txEnU3USD1onJo
	ol5a+FV4ksV8si0bfpC3hlygPPMug3jW3unggVq6j9EFysGQmSa1dYfuOrsWns6xpa++IOKY2bdmQ
	HN+7i/T+c/RE99hxXd3ECC7ojg4yDYNQkHoyQT46lxVB7F3lpAMmJEcgtGNmaBWBiWF2iNTH7EuRo
	xThp48aGsPaWQFrUIp86Ff7QwesH4VN+6YHnxwJSJ7IyE2qkqlqPWyxVb7JJZGcpjgaT9FtqnilkL
	p2PL2CDZ5UIX4KHtr5BdrqGAYq8OUbkpqgWlmR1kA92oUTsYUeSY5dzF0TecZtrsjonkDY0ja/EH7
	PIWZZ3rr72EMb+qj6FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYz-000000005d0-0zKE;
	Thu, 14 Nov 2024 16:19:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYs-000000005Mg-10Sa
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so7301135e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601152; x=1732205952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLyjPEUjYy3GGHllbim/73zpVvmemz3R8H3vfZF+LqU=;
        b=cvm6aO2dSgJV0zx5euWCE6fjcKMMPz1jU7oJjdYzUUBQtOC/X48aG2oZtYhb1hNq27
         jrETBWSnOWg2LabmDtc4+tZ+VNgji/GQcFjTvEV7bd+LvBecQaCKTTKcoXj+VZvKtkCP
         MxEHhEMkMtzBQDP1pWx+QxnZGq93DF2CEXNkpNNZ5QQY/gsgXLcXRglIDzZs6YcKMKZD
         y5Z+Pfuf1nIkJvfuTeMY6/NOP77UcN3Izv16SgAr9GofdvJo2gt3canv/8TlbYmlRn5r
         QmiRVf3TLVQ31diKW+OpDxb80Z7seAKSTpf6x8esT2JV1zsUgxGKGr8L3qYtxJXzQbC3
         3K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601152; x=1732205952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLyjPEUjYy3GGHllbim/73zpVvmemz3R8H3vfZF+LqU=;
        b=i0HWEGF7wPPrIfqLxzMpkUnMaRENB56RK3C6TA0Y3OtY+RBHnj3nZqXWPK4CpQIh9p
         n3huA1anSsCrAUh6j6MckfZ5OADeuBY0Hlp+h9nFycKk0mkBqUPJM1iqJNZapBxhtI+U
         80o5DRmoxDnnkFA9mYsdw5OsuiQXOWHlBCZZj43u+aeZyZK2/xxYfrxVMNVsOp8WtdO4
         ZeCvb1i+ybQ73NclH+ikq5HYeKnt0UEW388Nira0RVAPsPa17/ZL5PJNVpQg8VqaoWGr
         f5sDgYtbBl/0PluTFnGUIwNWKwjKpyngTfEEv/QuxL0hx8mSU7m8cr0y7LgjfD19Iy3f
         D/hg==
X-Forwarded-Encrypted: i=1; AJvYcCVeGAp8NdXvSxPYsDIvjbvBGyUKk0vuwwzrkHcv5+ehi8tBbqGD83NSZQc8B8q0IuMzpmXZhe5WJZlTSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGy/NPFGf4jz914D1wlvMf9BPS80hFJFujyKLGMrSQTLJqrOEU
	E7gYNbPYoyVc8Nt0veH/ak2Cr1UbWbcPOVbzIWSCRE9Cb9k/KOL02ivhekS/bUE=
X-Google-Smtp-Source: AGHT+IHKQidNVhwcm1UkvoSFM0iFKvguMA4Koj+yRoQBZD+zU91sO767fbB1E85gsh6vbgzv0SLQ3g==
X-Received: by 2002:a05:600c:c08:b0:42c:bd27:4c12 with SMTP id 5b1f17b1804b1-432d4aae6b7mr76573235e9.10.1731601152220;
        Thu, 14 Nov 2024 08:19:12 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298a41sm29066525e9.38.2024.11.14.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:11 -0800 (PST)
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
Subject: [RFC PATCH 15/15] RISC-V: defconfig: Add VFIO modules
Date: Thu, 14 Nov 2024 17:19:00 +0100
Message-ID: <20241114161845.502027-32-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081914_288831_FF04F023 
X-CRM114-Status: UNSURE (   7.47  )
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

Add the VFIO modules to the defconfig to complement KVM now
that there is IOMMU support.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703e..10fc9d84a28c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -242,6 +242,8 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
