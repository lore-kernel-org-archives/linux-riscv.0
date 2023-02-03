Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F30C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RtriPOaHwev1X9RT/YsOQzIwmTohgG2/MixUGSd4mU=; b=F+XeFyaqFrqaAw
	sOso6vSt6oH27qo+YrDh3Dkhy2fxILxXCc/fjCKM/QIOlVJ0RL1Kq2h89CxHTCZWDgd34B4f6SRor
	nfBQliO15MFtXiXkIQI0tCa1iwvy2zc8W9cxWfAAXd9G6HNRQrnldOE/0MQRLPLkPiobwp+7PC7uY
	zKoa0/lhNCsPTctPvMpmU3zN/yALt1v9dneM42NXQfiNApQcr5Pm8DY+H+O1el6VantTkz/fbdpVz
	d2Xjy4jnn5n7BirnZSbovhYw1gP6au73To9oqxVjStYOwe2miS1trI2IG8QGPfyZDjPiK4+S8XaEN
	nukfToe0Clny8D9XGYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqvB-000siX-2Z; Fri, 03 Feb 2023 07:55:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqv8-000shh-CL
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:55:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1716697wms.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=RNbsXzhKVKZxHcgsFaAKcfD9UisdA54thxQEMptVrQU50TCPpIrIoDoH5Mrs7FLXcC
         TvIDeuAwtQfvPqHlkhztQSpgHOhD+ZBeX/Yj0qNU2lDiIltrMSKOAH0/xJ/bSe6VJnpp
         UAk0ZYxoTsPGOaXgrPrBVoXkmbk16GogJR/EKsHE/HFgkcbjNPfJimSuJgqHiMoQqaA7
         GjpWmzJ0KuF6Pcc1+xYmELaKCHCT3o9guF4QNy2wCQGpsrFYCnnGNJxS2vT11IFzEIqG
         D0/RB2ZTFAcLMwPojzCsn2VX8d4VL1jnYSnZ/7a/uHAmHEXoFShAAwCWIr7bev0YulQ4
         zgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzLCWkEIOjhYvr7p7s7uKUj96vyQiWAZD9+xORl+Fd4=;
        b=glJUISmPA1JNPcxl1fD3jpczoiRlabqUeLUZC9wCzdg+JqT2ZHk9AirMuuljKovnyB
         Hsoe6E9f4WVc92UDiUEs3AzYEcaRGEAnhqzN2xhw9JxDLymASQDDADflbech2aOFtaIx
         CS7fMKT20bn5bIRK5ReLZK2G1rK8WOFHl4+SqBCU75dXyfgd9FXLU1O1Fxh1pJ6a9TIT
         eWiv+dhHSFTItZuBkEHMYy3BW/sPA6AVvkXSsCF5ubu0Ma0b1KcCDYNkh3ydFEaowv4u
         8mDasrb+2ZPfUQc/kAHvpqeWgRmYT5Wft6DGp72ZhkqM5HVw2VVs58+U61ykU7H4dk15
         0MiQ==
X-Gm-Message-State: AO0yUKVJgoD6U50HpRQUoWHXJ6kguVXvA01ZU4YGWOGcwXH8SEpHGpyv
	j+qAUmsvaKUT+LKJOwNB++eHEw==
X-Google-Smtp-Source: AK7set8Ng4rWQLKejgMNowdItupEL7W3ghbSkoK2CGvBB2irYgdK4IKmwO7aKmqD1n06vvjIFgC7Rg==
X-Received: by 2002:a1c:6a01:0:b0:3df:de28:f819 with SMTP id f1-20020a1c6a01000000b003dfde28f819mr4504287wmc.15.1675410938775;
        Thu, 02 Feb 2023 23:55:38 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003dc34edacf8sm6820254wmc.31.2023.02.02.23.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:55:38 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
Date: Fri,  3 Feb 2023 08:52:29 +0100
Message-Id: <20230203075232.274282-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235542_444142_3BDE9EA0 
X-CRM114-Status: GOOD (  10.95  )
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

The early virtual address should lie in the kernel address space for
inline kasan instrumentation to succeed, otherwise kasan tries to
dereference an address that does not exist in the address space (since
kasan only maps *kernel* address space, not the userspace).

Simply use the very first address of the kernel address space for the
early fdt mapping.

It allowed an Ubuntu kernel to boot successfully with inline
instrumentation.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..87f6a5d475a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -57,7 +57,7 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-#define DTB_EARLY_BASE_VA      PGDIR_SIZE
+#define DTB_EARLY_BASE_VA      (ADDRESS_SPACE_END - (PTRS_PER_PGD / 2 * PGDIR_SIZE) + 1)
 void *_dtb_early_va __initdata;
 uintptr_t _dtb_early_pa __initdata;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
