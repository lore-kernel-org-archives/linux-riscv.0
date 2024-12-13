Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13449E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWiFjcH+lkMmfM0xrtRosmpbQQbfT5FY7F+ghlYABgI=; b=hyctRyHI+ykx5n
	t701ZG8ijjW51VCEs/WwifBdd0F2TFOE/19ZsS1PzTaBVk6tn63AsIUqCaFMvKrYM3O03+PKeI0m6
	1xqZvG70p1Uc2QDLPG2gUPlsQPEfnrAxBrEVFjWrcnA+Dr7oScd9qft2Lx+HHIM4SbdDwmzU444Dg
	LwQOpZmiXFwbWPNVJ3iiJpLK1FVE6eLYZyPZzSNKt/rrNKdw7BzzRzSBY084+A5KcXQQVD8LnVSoc
	N/nhtHKDvg/AC0127dFpPprIyLJktiPbhoAUAFMcPh8Q+6LHNd/R8NQP2IS/kSv4rOFdQGPsTRuZY
	0ojyIgbk6LrVPCwHj3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44G-00000003bmF-0Xs9;
	Fri, 13 Dec 2024 11:42:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44D-00000003blN-1luk
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:42:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-728e729562fso1348365b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734090164; x=1734694964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeEQjuKWeFN2ZDkGY720uCzhuIIhCR6ezIvsDMVpnR4=;
        b=eBSau4fXiM2RhmFqPp+l8dQRPnZo4VRi/F59Ms1njEiTvNki73wUpMGrhCdlcQLje+
         n4KsdFizRe850fQ+b7ffpBVlcXFlJM2HaBOtl18DrBKihDvPA/qyx+ayxGIKDx1PSOCI
         z9k/67hzqVMSsrJNHiocYQ2FIN0VCXRHPPs9UFu6u9/0QmB8F86ZJiIT43F6HZoIl4Wk
         iaji21+RO0GazAi/Brur5PS/cU3asKvkR4iWZrmiFPta1kb3Cw2EbrUJBUesVEb7oIRW
         1iX6Wo2cbJJl5INuMlmoOCItfTPr2GzvOaFQn7v9H/5M4JLVTsHJ1zrhaAL4YD3tCR9j
         jfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090164; x=1734694964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeEQjuKWeFN2ZDkGY720uCzhuIIhCR6ezIvsDMVpnR4=;
        b=CF1e8nhFL/4J3LDfIUXKiCaohGEnWXEm/UWYhUMRQIvLlNHw12OcIJ9nIKpdibQhj0
         Y5qV00GeyS4UmZ56z/aHCw3QjeG1JVS6no/4EAVZsB+TkVDJEId+RKHcTPI1GMUMrV94
         oT7taosGtZdzAXJN/aP08AzZppOg99EsdLxFo8CF4S8FQzEuekTbiXvZVuUjXyhKjZWb
         dSmQF5ZNjFVBGUkLtkWxzEMv5TWN2Q16X7bvuqh8SgdJ+WDbqxFTGxDyubqUMX2UqUzI
         fMPiEsZ4A1ZojsZ9os3PRN4f2p66B55G1J8VimW57hGwwgjvX3Ui1+/oWUL8Ail0ppck
         AiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+mExWDsFjTMIyfDkk3zSvROkEFnl2gev3FIQzEo46MclHBZTpXGh5MFDwlQhCQwyTQE4PiBkh4H7eKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOEa0l563ftqxJfgmMGzj0a3zecby+UsAHltquslzl18iHTd6z
	lV3aCqPZ6MoBznSoQLp87XOoj9zNy+l0cwyFuDMBwHGn/Ulq3V/n4P378DExT1U=
X-Gm-Gg: ASbGnct+e7yWFcFDnstmB6chdFs1070bhKX5E+NRO7mjznylGaoBZCiuu7QK49zULL6
	4VPavMM20/EgwsIW0RGYwnLbCYCt6FSS9m1s91UwvvA4wsVodn+74L63h3cPQ/jLKVHpHTb9MI0
	1trqDeT1vxNBznyitmH+GG1RZwCkx1ZoQyvgClnkruMhtfSw6slPJm7lLg6+kQbyjvM6byPuzck
	7teB2BnhN8VRqBNPlkixiqQBaMDnJZ+gGYugCMMeBib45hJpLq9AcJgT7m9yPRvDgge+X/O8/C9
	ZC9rnDCiWc/CN1nHVfYrf0+dUx7rLvPbOKrlmXg=
X-Google-Smtp-Source: AGHT+IGeWdd36o5upIqzrwhc6coASaeu5E8HRRrsujN3Aueo0WxZt2dbtsoJCJze86+/n/dSVtetAg==
X-Received: by 2002:a05:6a20:43a0:b0:1e0:cbd1:8046 with SMTP id adf61e73a8af0-1e1dfaa0ba4mr3644498637.0.1734090164609;
        Fri, 13 Dec 2024 03:42:44 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd4b961f1asm8666340a12.30.2024.12.13.03.42.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Dec 2024 03:42:44 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 1/2] iommu/riscv: Empty iommu queue before enabling it
Date: Fri, 13 Dec 2024 19:42:32 +0800
Message-Id: <20241213114233.12388-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213114233.12388-1-luxu.kernel@bytedance.com>
References: <20241213114233.12388-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034245_458066_2D625D7B 
X-CRM114-Status: UNSURE (   8.59  )
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

Changing cqen/fqen/pqen from 0 to 1 sets the cqh/fqt/pqt registers to 0.
But the cqt/fqh/pqh registers are left unmodified. This commit resets
cqt/fqh/pqh registers to ensure corresponding queues are empty before
being enabled during initialization.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8a05def774bd..84806724f568 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -240,6 +240,12 @@ static int riscv_iommu_queue_enable(struct riscv_iommu_device *iommu,
 		return rc;
 	}
 
+	/* Empty queue before enabling it */
+	if (queue->qid == RISCV_IOMMU_INTR_CQ)
+		riscv_iommu_writel(queue->iommu, Q_TAIL(queue), 0);
+	else
+		riscv_iommu_writel(queue->iommu, Q_HEAD(queue), 0);
+
 	/*
 	 * Enable queue with interrupts, clear any memory fault if any.
 	 * Wait for the hardware to acknowledge request and activate queue
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
