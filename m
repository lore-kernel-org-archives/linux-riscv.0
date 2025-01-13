Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744ADC02184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqwB0MoexoqMIJXnxO1am/C+dETuUHAHtTxZrSNleYE=; b=C+306xjuS3tTq+
	9NAETpAmb1McxFuw1BwqcJZRiFYDvfMJXwa3KWjhxorBcr6lV/ChzHMsUV8P5ZBJzHwPfOKf9od2L
	/MhH7nfK/mR05yiASZlNFKFXQ/V3c5cUZjgn+rUYxqmoV+EdcNVnyZ1ocJSKiRd/+9/ypIK7cdCYS
	aApuJzwdTy5AH4Qp/DSWgnD9OaGw+xPSVEW0RvkKv4N6+Ncg45pzDpGrhIYjbhwQirv8CLGbvXNlm
	us213KaT6R68rUs03tFVYi8BJW+HBxYnFPwXqPG5MFfOkQ1aQRoKndAwf8Lfzo4+tNFaSWsv9U/qh
	iFdnMVD/8Dj4TOBQZpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkL-00000005jPi-16mT;
	Mon, 13 Jan 2025 15:52:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4p-00000005Z2J-2oD0
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:10:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso5919213a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736781003; x=1737385803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Hsw5nY2VV2swe5Pr1Kenx+oHMy+b5WI2UUJkVXiSM=;
        b=JIe0lo3amwUPr6J2eTW05pOoCqNk0B+MmGfh6DuMAZBe4kLbjJsqhTB6qckC528r+x
         L0zxG37M2JbGbVEe1EKkpSCgrK3qv0JnXxewGJBWBXyBM3nGTRvnw4h5MB8PLb2JerRT
         zHu4wBJ8U1imtx4hY2rSdI1eoX9+vHnG+5J1CZk+OzqC+pIf1aQ78tZD/1Nz5325D7or
         5DPW20WfB+liggAfZ26p2PYSW+t5iuQsvChjZHhOAkWVtPX8T1VUsKBBOkabFhjZj11b
         8zq+26uQ71lRYV95aVMxuyZ9mS4kaIcd5wpDkNHmZ9JSsLwqLJSoVZnQkSknwkRAEQL6
         OYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736781003; x=1737385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0Hsw5nY2VV2swe5Pr1Kenx+oHMy+b5WI2UUJkVXiSM=;
        b=Hg1J3ocwGMarWVcW5PCsRBwAz71GFGu4xGQWDdMd77BeO+Eea/SxWBzv7zjmrMMNzL
         elF0QM/rsXAYH0rz2yocakcIw7e7sfj7e7PBmqmEOv1Bp+GoxQS4BVph4P5LxF6Jq9ZE
         aFThqBVvq3XU83FxLo84TG8LhyOzOQeGsQtSF/bPUlR5P/5I8WUoetDtlpX4s81TCvdn
         Hpfv4X3H54VNZ309iHeqF9kSY4hOIzBB5YRRAUT5O9+sVIQJKE/TGCvA2nzExYEVdpmg
         CeMKwamq1K+HY1FayypzyGkTXZzqyLwaHqTB2WlE93w+xeMIRerkOYae5iba3TT7gG4N
         ZC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVb2IMUiT1/aeRjIKmuZ5n/KtUq8/l+OMqRlZ1Xaap77jVzn4zhD079BruA1XOsN2e3PA7mMubOYQynlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwspQocu3zyrDxO0+5vCILIZaWC0GJ8RSl8Ec8g2e2doFMJ8bkL
	G7IzTTLEN82Pl5Snql3hYie6MEyfwfAUuzuBNEdpI/Lvv1k2D+KRBZ6A/TyAk2s=
X-Gm-Gg: ASbGncv3nArNS6SxAvwmHfcCJKk2HA8VT/RS+hguBcMZDu2oWVXrJB+WcRHs9fwVViC
	FQ+N02oImaG+G8L/zIUM5zX7N3LRWUdRRJQvnk++ySfcjV14tphR9ZlnrY3J86rso9xtFSbEcaE
	S0HxLcyKZa6sAfe2fdvS3g/WnmQeX2pfLj/0mUsqggRO3PTsFY8M5wvFsTurpjrba9jcoDi11qy
	GoxPKSkLK3Rf37BzmamI9i4DYj2htX7UJn0zG+0Em+0q6x8BSid4sU16VD2uW3EZD+SaLpaGxME
	u9uDRqRTaCllEl2ysK6e8WjRR8TmiHfJXjCkQaw=
X-Google-Smtp-Source: AGHT+IGTnCgi7VgxBHIj1Ps3sJHzHWXt+qnVac4HjO5mzuAuy0JYaQ9XPt91HOydRcRqdJvTiBXHUw==
X-Received: by 2002:a17:90b:5448:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2f548f1c430mr29417268a91.27.1736781003060;
        Mon, 13 Jan 2025 07:10:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:10:02 -0800 (PST)
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
Subject: [PATCH 5/5] irqchip/aclint-sswi: Use wmb() to order normal writes and IPI writes
Date: Mon, 13 Jan 2025 23:09:33 +0800
Message-Id: <20250113150933.65121-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113150933.65121-1-luxu.kernel@bytedance.com>
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_071003_710456_096FDBD9 
X-CRM114-Status: UNSURE (   7.68  )
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
to ensure this as ACLINT SSWI issues IPI via mmio writes.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
index b0e366ade427..7246a008a0f0 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -31,6 +31,12 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
 static void thead_aclint_sswi_ipi_send(unsigned int cpu)
 {
+	/*
+	 * Ensure that stores to normal memory are visible to the other CPUs
+	 * before issuing IPI.
+	 */
+	wmb();
+
 	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
