Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD05C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gObDPfyAlAC2UUWHk6+kbshYvXd/lkVcmhzAUxNQFzE=; b=J1Z0WQiLWJGUU3
	vP1y0b0agvYuVzseswzIncPYmPlNkPS+5xLK88JUJzvs+BsOdiGNLihgJ7tN8unaYyJknFHZLwAJq
	/Ys9RU4x+3HKL1v4FXdL92beVt0FAxIEVDWr8+D1dXd1uF+kFU1BCnMAWdHw2CE6goTeggrNRUTJm
	g+963gcQuWx54fKQW1Fjt+AREknchsWvN8Ux29zvxgwtoKcZRBDbwBxwDnPy19Ako84cNon0YR4eu
	J82iUfp1r/w20Cu1VGGJp1tGz94XWGoK0Qw4l22YsjzkOhUBs9E3E5b0yjFSrVIMq3rsC0x4fqebF
	g6fgdQs2Eb7JtZ8eGhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc94-0000000F0gb-0ghK;
	Fri, 05 Jul 2024 06:10:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc92-0000000F0fs-03kj
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 06:10:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-424acf3226fso9257155e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 23:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720159806; x=1720764606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOD2jtdAtfNII56GP5rqsRV5KAthLbsUXOQKU9980nY=;
        b=ZStAAKiPSSiY6eAY0F4eZB6pOAsXyypvCwj6EASuPoC0XyDhYDZcP1z5OA4xZv7GiR
         op4EgmoVZEiNB6rnRCH6yDyFnUFFXIUo1gWI0w5Tp3cBVZOU9HoP0lXVKk6ncAnX//FN
         lLAGDtDXFyta5i/Nl8PVJLiX8E5Y1UIQQRuUDxeeNLFPz2GsBqH1kRfozzkRlGCNFlTd
         abMircuKHmP6aYPcUfn2tc1SYg/IGJ57Qvjolw4yGoi/ZFvE/yoc3HAqgApYt2nWqXzN
         NggxyS2bT8UQhY0fEiSoBPlDmdeqjR/AVhh23VObtmOP6qbgFy49aMcLHclAO1+18LRS
         TjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720159806; x=1720764606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOD2jtdAtfNII56GP5rqsRV5KAthLbsUXOQKU9980nY=;
        b=OZazkseG0EmWmu3sSjLbujR57pggLvaSzJx2U1vHWaaokw0DrGsdi/h008w2imCAa1
         P9mrs6tbBdSlimzqNq3Q51dNhA5vHGYe3OPjc0sQ7fXIVgpqJmIwcz8SVJVle4oLtQu4
         e1gYpNTdB0AFizWguddJyEOXIBguhjW1YV+8wbG2ocKORLgb58s2r0NRjyqM56F5HpHo
         wRmGO5WfFRW0Df6CDlbbngFoc/HBPbio3fVmWqaOmw4YkaKTlK1dok6dO9EkW7uzqdWM
         xiseE262al/pXetN8WZH+zZbnmCHG7kg7OJoiw3HMalt7HyeETY+8MhRh6kmZvPYS8ww
         tj0g==
X-Forwarded-Encrypted: i=1; AJvYcCWaEiXiqwZ+dxWOhU9VUnJGRsKCXZp4yBiD7eXhFueu3vRZ4aKJeE1FDrjHt/5vE8N7uylT8oNRJA8hDBpQmXKfhA/wYarho4hb40r2UOJl
X-Gm-Message-State: AOJu0Yy50bCBqxrUptMrrwEZi5YIWf1XlqthKECZflPOBdqgC3HVIzJZ
	yWdi14vDvlOglq7SBIqPueic7ZtONC8BN48f4SEMfL7SPy6wksAT011MmT4taCs=
X-Google-Smtp-Source: AGHT+IGSC+YguDLIlW5OOjetUrmmUspzykknqUgbL5edv3k5thftEFlmWv4eaRYhBjzCWN1bS4fzfQ==
X-Received: by 2002:a5d:410b:0:b0:367:89a7:da5e with SMTP id ffacd0b85a97d-3679dd2997amr2862491f8f.19.1720159806299;
        Thu, 04 Jul 2024 23:10:06 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a40a6d4bsm1709446f8f.51.2024.07.04.23.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 23:10:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to memset()
Date: Fri,  5 Jul 2024 08:09:01 +0200
Message-Id: <20240705060902.113294-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705060902.113294-1-alexghiti@rivosinc.com>
References: <20240705060902.113294-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_231008_081159_3D6A572C 
X-CRM114-Status: UNSURE (   8.72  )
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

gcc is smart enough to insert a call to memset() in
riscv_vdso_get_cpus(), which generates a dynamic relocation.

So prevent gcc from doing that by using the
-fno-tree-loop-distribute-patterns option.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f7ef8ad9b550..c7e40bf36371 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -18,6 +18,7 @@ obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -fno-tree-loop-distribute-patterns
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
