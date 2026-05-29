Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3B9CD5BD1
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 03:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ou2Ehf/krwJeYU2Yr56/YZgVE16V2AhBU4z2LMT2G2Y=; b=MgDxYhzVeTDwsP
	DL8Xffq/+7WnSFf0Cb7romRmendMz8yiPOdMPgS/L2BV2bFeBtGJd+mx2Nslpsy/YsVSd0WjSAy7Q
	K8R02+rpA/eOD+OZC2YZK5p5qk5sT+7uCFG5LKYR62MbFO/zduN8+jt+iLIvYyYvUMbCSIVEQwbyg
	d9QDx/J/hE40Jx+DygC6oTfi2ugvJz3RjJiMsobFy/lzDtT6PDLYHrluwob6/+UXk0PpNL2VYTgsl
	H9+u1OQx3utIo+ovQSMisWVkZEDuDx6iH7wX5UyIQt56KFPrb1DbECrKtXtj9FNAJTKN/tRuU6v/+
	RR/KEm5C8ZdissHYqaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSo0p-00000006hfx-0Es4;
	Fri, 29 May 2026 03:35:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSo0m-00000006hfR-0M6L
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 03:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780025750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XEOXrlXIFa5puYqMTeXlt8Febheaa3WcQMFr82h5UHg=;
	b=DTTmz/vQ5siuLkMuMvA1Sq79UP/lGN6LtNOlyTeASOF8cIbFk4SuQmmeDYToVh5oo41eeS
	5JJVhsRYBs+/sLxBIJxfdKjVFpxeDHjfEIE4tVhW8fpf0zX63v+D34eHzDDXqJ/wOCodo1
	DllnVi6NQ9g2cE5M9tcKErBM3+8bWd0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-qn2yM4neMNi6X5DIZXVqgg-1; Thu, 28 May 2026 23:35:48 -0400
X-MC-Unique: qn2yM4neMNi6X5DIZXVqgg-1
X-Mimecast-MFC-AGG-ID: qn2yM4neMNi6X5DIZXVqgg_1780025748
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827bda3052so17770761a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 20:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780025748; x=1780630548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEOXrlXIFa5puYqMTeXlt8Febheaa3WcQMFr82h5UHg=;
        b=jLrtj7pv7OPtUuSg4lCE5CtugF5t2zYm3tmjLiLa0UlZNLd8xiTxrV4EYo0yLcNi4r
         +tkgl8KqQKyAnzrjBbBcADuAguFwj+8NeEhg6aMn5DEgwG+j8ITNlrmzceievITYxVAH
         J0sMS1WZIfmBUPg4lPjEfXzT8b9IWaGPGNOD1uptrTOooH3qsSdBz183KjF1bHLwKnOf
         yD0uZ6mfi8Kn0WjzMu09MtBQMD/aZ7ZaagwjUJBew0SH+ctQAYdiVgMrZZnSQDb6Kots
         qzEmx8v0Jcrw2z4ntQ+jkvebf4wEEfUCKw1MBTy4T2m8zo0WHll+4zWnwSeFia7/wlfR
         skyw==
X-Gm-Message-State: AOJu0Yyj13/ICNMBmF03aU1fxLA5LCgB/X8iDPGE68mvodloT8rJP2xR
	eAl42/nlE3yIjuShB9XlVlcYCbJvcR0IgPJpF1uxtE5ixHHcV5ePUoFoxXmg12sNK3iVG3REktv
	IB4KmICD5Qk583mY27BawQCW7RNRaMA7LOECYzRHI7r5x6rzBFejPm+0w+04t931gIkM0TQ==
X-Gm-Gg: Acq92OEswBx4hWU0NDvQBJKn8tuh4QsKBYGJYaXNDq9Ell9A+/lWAaYmMYY+C5uglLd
	Yipseqp72IlR+n2VwlLe9y60bSxJ0yjkgFoTOagI/DZUdo61piQN1NKwDagXkGIzLLY0ry62GQb
	DwR174xD5IR0/7hBskKLSZ4xpur2jyMqD2HtrrsS8yCznZ1K/V5eJdldOQIsrWl1FBitgeLkvCZ
	w5EARVFFTbXtx/xmm/+yWmA1VbVLUUB8Z0fSHtNt8fGV/HqK5atxsXJvi8mJMF2NSdDnSHtou6u
	k4qZ0qYNvCV3QuL3j2aUo9CUls61aOXwf7VT6J/3SRld+BbeN9t3fYp5yo7XMRfo3EwVKGsUpwB
	6voZIjZ1oClXVMjm4xYY2fksmRZmnpoA9OWuOFqZ1kfa9uGcUevWoPh4Vv3iJcd7yHoPAAuC9hg
	==
X-Received: by 2002:a17:903:2384:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2bf20cde0fbmr15857115ad.34.1780025747651;
        Thu, 28 May 2026 20:35:47 -0700 (PDT)
X-Received: by 2002:a17:903:2384:b0:2bf:160f:7043 with SMTP id d9443c01a7336-2bf20cde0fbmr15856795ad.34.1780025747223;
        Thu, 28 May 2026 20:35:47 -0700 (PDT)
Received: from localhost.localdomain (122-63-64-114.mobile.spark.co.nz. [122.63.64.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm2617945ad.52.2026.05.28.20.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:35:46 -0700 (PDT)
From: Tao Liu <ltao@redhat.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tao Liu <ltao@redhat.com>
Subject: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
Date: Fri, 29 May 2026 15:27:40 +1200
Message-ID: <20260529032739.13264-2-ltao@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hbLa3DhYSeNjJYR9LHfHjGpyFwk2DvA2WuZ_InOn94M_1780025748
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_203552_194727_B0465707 
X-CRM114-Status: UNSURE (   9.33  )
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

A NULL pointer reference issue is noticed in riscv's machine_kexec_prepare,
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from security/integrity/ima/ima_kexec.c:
ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
but kbuf.buffer is NULL.

Fix this by simply adding a check before copy.

Signed-off-by: Tao Liu <ltao@redhat.com>
---
 arch/riscv/kernel/machine_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..d81d576f9cb5 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -41,6 +41,9 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
+		if (image->segment[i].buf == NULL)
+			continue;
+
 		if (image->file_mode)
 			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
 		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
