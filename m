Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99175C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ENyo+gubrXnB+HIAn9h00igCIfMiJIRxuvtUtEATJw=; b=W4luQ/DQGj4QvK
	qHZqjZw+UnlQ84Nwi4HNhpm1lRv8vulev3i/DFFhWGL6AyK5fjUTjJORrn34lyjc/gKbo/D//UHGn
	A0Oxi35a9DYQkFqueZrbk7wTOSr0h1VLUMWGEbGAUauoYdBWgo47e4POL4tR0MoZRtd8rFaSDZ0sR
	Tp9gmhE0Rs/AJMo77TP2BW2zzqR1uO5fOfLa8VCMMgP0sEpuYf5fq0FV38Q8U5bYWViNS98cnm/QT
	rFj8iDARXGpfkp9xAXjSdUfSlUs/jjRnqkPcwcvU3vNy6CVhzgWFmut3dse0Wj1UsPF5K+0u5zQRy
	FjhRRV73xI+z+k3K0osg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkJ-00000005jOn-4AET;
	Mon, 13 Jan 2025 15:52:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4h-00000005YzR-3RBp
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:09:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so7379832a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736780995; x=1737385795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIiPPBeekRqOc2QhM+9hoY1BatS99yweNfycJQ5OTwE=;
        b=GfpH/g7IcMOuAGqaS+tIYgHuuPVRC8WxcxMDgZARytIT4Qn48qCRFeLq+D22cUngD/
         L+rpJilfWNXg0UgjpfnfKz6WtZRf80cJQxOUI/jjDCdy5KmtzPXrqyRxTT8A/cNhQNFN
         TxfzSO467Tc8pRunfOOAk0wrmGL2GxCzOuBg8qfttDCNITDpM8oN7UQrZjphnXHFIsAC
         8/S9LogO4rqCAl3PJv/8KJKb3qcK+BSIRGdtdXq6U9qyZPCgM62kwF6tJr3VHERM/sab
         093+RgeKWx1ZJIa21eQc2JIf1yeFMGGShKOYiEpc7iErsijBnnD7TU4S0CsCF0yIoowT
         OLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780995; x=1737385795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIiPPBeekRqOc2QhM+9hoY1BatS99yweNfycJQ5OTwE=;
        b=PWjkumUJ28DLTdXemi7j7cHfWCz+zyXo7XUJEmGryxSY5h67ZdZqwbt9DP+YScDKpj
         MM0ge7kl0ujO1HAh1NgRfSFDYmmiX0I2P+IdMliLJ9vL54/ckknSqvE+JIKj025/EkW8
         PvEN4awOXqvV26SnI/1p5WTDeRXVDctV/r8aCIz7EDXVHWP+aOw6UPNIFjYIT0VbJrj8
         ChEGDm7sLCt4Y5D433+k3J6KYoNU9HOvFvWHeps26I3GktyYeS4nbnVVqIBFsBAdZ1pu
         wnpRMHWzAZLJprXc73UgkpYeGYeVLB7ECGpOCRRMIJTo4Vze29GatagyLOJnFuQRDPAw
         f9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGAybAAwCPNgoLVFiVuQ2ojVB3oujfTwsJqFob3ZMUCK86GXyxe5AkwxN2t+k7TiS0GQKmsgMwadN7Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8dqGiXTq+Z13oTqLxJXDxNOuZYTyr62VzHHhDIyUUI2/7gqau
	2wEkD10JTtUeb8jZuzXfiXbcmqi21tVv7YhqndsldaBNEw9oM9NLdH0mtlXdbd0=
X-Gm-Gg: ASbGnctJDnEQyvcm/ebo7wGF/xrRBQCxOghJYeYeyId4HLZrXZ6TDtcH7iEnwEy9Zd6
	23uBQfTVnm6jUtGUdFlmvmnVBL+wwgjchxWDDrZaeYJZXxIDLE78z1yR1tBMH+EkAj1UIog8pnO
	xYGIjnnv3j7zFCh1LMRfn45ivQ2KSrcpHKFeWoOKAp1+0MvZUDblD6QXaDE18SnRaj3h7oFdWYy
	gWiDfbh504oYKps778j6kKmqXB5mWK/VecvWU/3guNQ5nvHk+DC2YKjZ3oH01rhFZPqpXCtMbZS
	ICKHjFTycmzShh9vs5W0hNHRO4pkUFaDYrJ6UQA=
X-Google-Smtp-Source: AGHT+IGwqAU+RazQwQZ4ObAHTF1lghFEYQ7OECgOK3uVk6YUXijH2S/i+ipHWDd9Jv5Ntsb3FLbl6g==
X-Received: by 2002:a17:90b:2f0c:b0:2ee:7411:ca99 with SMTP id 98e67ed59e1d1-2f548f09f6cmr27569201a91.1.1736780994908;
        Mon, 13 Jan 2025 07:09:54 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:09:54 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 3/5] irqchip/riscv-imsic: Use wmb() to order normal writes and IPI writes
Date: Mon, 13 Jan 2025 23:09:31 +0800
Message-Id: <20250113150933.65121-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113150933.65121-1-luxu.kernel@bytedance.com>
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070955_854185_AF25BB29 
X-CRM114-Status: UNSURE (   8.15  )
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

During an IPI procedure, we need to ensure all previous write operations
are visible to other CPUs before sending a real IPI. We use wmb() barrier
to ensure this as IMSIC issues IPI via mmio writes.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 63097f2bbadf..c6317cb557fb 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -29,6 +29,12 @@ static void imsic_ipi_send(unsigned int cpu)
 {
 	struct imsic_local_config *local = per_cpu_ptr(imsic->global.local, cpu);
 
+	/*
+	 * Ensure that stores to normal memory are visible to the other CPUs
+	 * before issuing IPI.
+	 */
+	wmb();
+
 	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
