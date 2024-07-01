Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8888FC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 07:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nUGFDLGGIB0PpmB3obRzydtlOgvQkm9oKNc27EXDSAE=; b=JelnGtWi2OcEla
	3k4+OvpjWAkhh7pKptMqWuzUhuU2Td1zdWJLC+CjRTgq1HCdn7rqFlfbsgc4rSYWiYCmDigmucP7Q
	tz2lgzA7jTVk+kYCvaPK5GrHyNGk42vyEESO5M+pBwqGCnNScutWf+vMC5u9j8c1xCpJMqeBMLUfa
	hhH0R3jyStY8ibbcNzbxCXfinQEQbP7Lv/+MmlWBC5VIE2d8aLc1RyxtPgq7F9Hd0lSGJ6R18+u+D
	ghz3xDT7ty9CXqyuxsSd81bPrT4oIhKU3Q0ET6dLJDBgGbgKdlwswSvVEP+NC9LZ1SO2R0oBR/+BW
	iSZzNlhvjBdmct5XTA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBTb-0000000224O-2c7K;
	Mon, 01 Jul 2024 07:29:27 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBTX-0000000221B-4BhX
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 07:29:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-706680d3a25so1588280b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719818958; x=1720423758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGhqSiLMzxESl6q2TXeHQ+QtaRhhPlHzzW1Ik7jwLak=;
        b=KIvZD2CEH/k9pqxvKw2+/TaF1KWSV4bsxmES7Gc+4PJVn6AJPQjug53iJYC4I8dws5
         b53hVYkmT18C8lqM6ACwSwzTGBAbxiPGso7aN8yeUbPIyHufPJ1AB+y+gHfUMYUf5hbv
         yME9ag72sPLdcRDGo3s1yFh23AOmubfRJgvnSbZSYPWTQ7SA46H22Ieh7H2+xbTqP7Jc
         mY9mlswVj1qe26OTwDa0S3jKARgnQRPGBOTRmHgabq8KKAUosVRasfwxqgWKRP73+oma
         x0IWLJMOIOIU475XphvBFIN//mqS/+01lhjXYJCiQ+r3PV88LBH4DBYD7lYTphd5JDgr
         0mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719818958; x=1720423758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGhqSiLMzxESl6q2TXeHQ+QtaRhhPlHzzW1Ik7jwLak=;
        b=lFNx+J6acLy0y1fLVCeeTy40VnVp+OeJz7qVzz++wX3eAgqQ67W7kg8BHbX2RhYDbY
         yGDy0T3KxM8srwneVjy/KnQtxZbi0F7Pz6SC6IG3YCRlnkRReFtRFVqr0aEUcfnI+HEk
         GXQ8ROXOZalI807TbbUFzkKVm7RaLu4mVi6ReVvoaafquOdk7MzoZj6cTyhLjt2SNlkK
         W6PxpNVtTRi/24PRVz5SflVR5tNxdoUdee2AUBE7AGVf0PP1P9d+f7c/UqeVecIq6WIZ
         dXOBKRYNKzT8JqBSbrrtRe8qOQOATQ39qTALHDeyXY3p9JJtOvYrtXu661rzzWbjXX2z
         h3cw==
X-Forwarded-Encrypted: i=1; AJvYcCV+WzaHPqsjcUm9GcGrF6qPm3Pw8lYOz1vlELk7k45DwZnctAbyHqimzo1pOT/GKTQbK5dWK7fZyjW0CRSqzRcKA3ocIbCtmIw5Bksn4po2
X-Gm-Message-State: AOJu0Yzbh004jSeVzGQpxr4++64aRSYTqT7+pq1BWq0ke2nMvDNsXRll
	f7DgpPFkDfu2lpQQt+aias3u7XioBC8/rLeqn5ABPycEIgF1HkMqgFPDJr6eLEU=
X-Google-Smtp-Source: AGHT+IGMGQElpf9p3wHiQ0XgC52tuI2eBaue5vhEMaYrPXb1lA2D7IhLm40/sZqFmLeQyKwdlN8PBw==
X-Received: by 2002:a05:6a00:1909:b0:704:31ae:4fe5 with SMTP id d2e1a72fcca58-70aaaf25245mr3686034b3a.25.1719818958046;
        Mon, 01 Jul 2024 00:29:18 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf757sm5779337b3a.104.2024.07.01.00.29.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jul 2024 00:29:17 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com
Subject: [PATCH 0/1] iommu/riscv: Support sharing irq lines between iommu queues
Date: Mon,  1 Jul 2024 15:29:07 +0800
Message-Id: <20240701072908.25503-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_002924_226077_059E2C1D 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, linux-kernel@vger.kernel.org, Xu Lu <luxu.kernel@bytedance.com>, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an additional patch for Tomasz Jeznach's riscv iommu driver
patch series[1].

It seems that when the number of wired irq lines is less than the number
of iommu queues, iommu platform driver does not assign virtual irqs for
iommu queues whose id exceeds the total number of irq lines.

If it is a problem worth fixing, please feel free to merge this patch
into existing commits. And please ignore this patch if we don't think
it is a problem.

[1] link: https://lore.kernel.org/all/cover.1718388908.git.tjeznach@rivosinc.com/

Xu Lu (1):
  iommu/riscv: Support sharing irq lines between iommu queues

 drivers/iommu/riscv/iommu-platform.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
