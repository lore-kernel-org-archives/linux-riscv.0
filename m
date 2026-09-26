Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC0C9831E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 05:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0lrtrY3GyDT4DwhZm2V7wn0ZU/eFX8PkLTU45V6bq4=; b=eAAYZRZeJJv1uc
	8W13jwZJnNq3LcpE0V3yIdrNKzyBLnBNokecb1JhxdcA0z7IkcWFxdoAuxR4G7GsT53LkNnSfJnPg
	/w7yQyZViN+pvY/x2Cx3iRtML4UVqY4v03Sd5uWUyhS99bfRPXUvDcp4cuXBBt/ujDhwjbZII6WNM
	/B5YLxoGQFLQHjnknBg0Jr96tV1B9i1hPcBZczH71fOUlc1EFOepaDwDVJJwJBelSKP5QSw1sa73u
	PaXmTzGXvNCKyvCrUBPyIiC7FkYiMh6DtSH0wCdix8fWigBTQdsjwTU3kg94aD6FG0y+1I/y0hKwU
	IhhsZBw5MwaCJ4hM6B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALKu-0000000F3HT-3N3O;
	Sat, 26 Sep 2026 05:52:36 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALKs-0000000F3Gt-1eU8
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 05:52:35 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso1160086a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401953; x=1791006753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Q+AEMs+1c3HlByet+UhGr0L4v7ZQfIIBKxcOD9TNJ4=;
        b=YXi2//VcCEO1gYapsybMDp4bdqQgGvgOi/dV5St3b6kgb2jGin8QPWtxb9DX7gDSy2
         OGRFO68SK6pms7WeYa9sFDHFDGieWBkar464eyOi1sw/vOdNDQzPJ47G/lfyNFIoZaKe
         hd5nyoFtfRn11lPiPcrk9ZhVOHWm73nWCWpqXMquz4NkcUOdG3Vm/1LlxsJbzUkaVcyS
         xKBriUbML+yJ5dguD+WRhmqk73Xo5PesQpvK1tdhm23S0s6qS3TdqgnaqPnfMpbW8ckv
         LJknKkpH6tXBu64U0AEGPweDYb7a+2O4gxWd9gixzdG2Xvl/aJhXiD/rHnCSmuBT9v+0
         Q57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401953; x=1791006753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Q+AEMs+1c3HlByet+UhGr0L4v7ZQfIIBKxcOD9TNJ4=;
        b=x9IAVd5w7PWCzaptU7ZbjX+0sUw0+uCpoHPQObowrCAqZdhcSoyCPMoD1cBAM8JkX3
         nBgjMmI32Rq9TVs1tbHfAUp039imv2kKNivBlwelbI/1v3Dfe58I69aqR2qWyuUl78mT
         L0GN22bgH2CygQkM/X9GXAn1upoXvJ8r/KGFSRteqg+8io1lpYUsPM0SOVKAyn8k7qFg
         td20ElixisM56M/xd4q4+tuIhDeM5lylqJxRJKbE/vHLjNZMllXwWNt6bE+PnvOplb0H
         2iugQHuZX1UBxSFrcpGc82uTwIM50S1OEPHkUcVpKLK8Wfo6vMYripKvhL2Tj3RfQ+zv
         FXPw==
X-Forwarded-Encrypted: i=1; AKwUvBy0loXTDiDcg0m0Cq4m2WIP3kza5GxEjvsM3Sucm+sRyQXGoiadNjtLJDxXK1WuUv5pRH8OQbt+OrTfKA==@lists.infradead.org
X-Gm-Message-State: AFuF++k/F84hIYrepZj+mQ0Fgb00T93xn2J8GO/OpO+U1SEMsOc8/oeT
	07Xucib6mIkKKESYFDN25/ZhODdh9vbp2QcvTpSleSItpoIw+GYAblEI
X-Gm-Gg: AYBFou2IO8YxtBfJ4meFgtdAHw4qtM2nRi5nrtcZ0lFcJc7ZHYJ8Z/GALWqi/xyVOMw
	wyvro9pJeM+Niq87XKh9pRbNPj5CocHkSSfmy15U9DzKVae8Mk+zJz8ZRdEI5C94xI503oz6kps
	A3+sLjcX4if8kBYkoWzwu2KVAPfvc4uOeQfnQCtu3DG5D8rCCzqCAHnOxXsiiGEaoAhzo8vd8pt
	JTrm10ZafhwlDXE8WsF9B6N1/vVWeqJY67GU0LoQ9jADFnJpYobiK9HstvASArkFr23TAsIuZxQ
	3ZHjCv3xQR50MbRv1FFeq1foRMkJ2t13A0y3MqLB82GLa9T/AnUnm2IN5rEf1MCtF4hRhZX4pN2
	6rR8npZ4cs0Cu4RCZuocOqLWyAC/65PRCL28ygvUowWQh3g19hxW0J2XqAb5of7vQ1jBYTnW1Qc
	cQhivc8Sd78+U5v8sT1TSrmO/3dFKHMDU3sFYy5DevtzIOvPkERwSjjnDRRCJ8C6PPhB2QWVLrq
	6kledaLyRCmMoDgizvt3gKacrsfyGZvfjizJZw5AvaXFBJAN1jO/kOo4mcQv60ml5/ggj9lQlZt
	g0WhxjLo29t55oQ7NoKE/l2tu4siISNFB2J8hOoOI/yQ24ToT5JdhU0GmXM=
X-Received: by 2002:a17:90b:570e:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a0bb662a35mr2868982a91.67.1790401950853;
        Fri, 25 Sep 2026 22:52:30 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm7897504a91.14.2026.09.25.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:52:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch
Date: Sat, 26 Sep 2026 13:52:27 +0800
Message-ID: <20260926055227.3678332-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_225234_427818_610B4AD0 
X-CRM114-Status: UNSURE (   9.75  )
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

The T: entry for KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv) names
github.com/kvm-riscv/linux without a branch.  The repository's HEAD
points to branch master, which mainline already contains.  linux-next
merges the riscv_kvm_next branch of this repository (Next/Trees).  Name
that branch in the entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..16f6b306adf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14357,7 +14357,7 @@ L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-T:	git https://github.com/kvm-riscv/linux.git
+T:	git https://github.com/kvm-riscv/linux.git riscv_kvm_next
 F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
