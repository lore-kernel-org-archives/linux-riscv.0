Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A622C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cyCFi18/Vg52F4ovGDErho0FN7TiIyDpDahAu8YFTc=; b=wE469LMMeU1FvM
	Lio6lQJ9XYd0JZqWIsyAVXOhkgpyveEl9EjfoVhmq7VSW5YwabIHK17pOYk6GCKIvOv2Ei00x9eVW
	ZSsGlhgpoYLGYKaz15D9RwOb92LrV8xUV3XXdoEUWG7QomXsekuhdhzgEvRjfesWTzVBjp/moY2Kx
	mPiwKlcmUZoGeZj8QSGKQuq/UBt6DtVGOJ5z2+A4OIr1VLosHXa5HTCRPNu5COjGWWAgq7L11qQyt
	QR+lGYld/+sqI1O9DZmpJ4iyf6yWAvnTw+MNsXxSNWEPmPr9c8o7j+5KxqdBL0mpEwhcCjNJi7lAU
	DrWzVgA8mXWTSGNySpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqy8-000tgF-4h; Fri, 03 Feb 2023 07:58:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqy3-000teR-RS
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:58:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so5420284wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=zxo+RmsRYbmTV2GBrpNufXdujUjhcH0oMw9j5vw4ZRalgJ4I1cOhlV1C6t1CiPO9Zp
         YaaGRnQszq9GGZq6WxD+7C92ArWV6pidfP5FKA4avWgqAagZ8rjf7xji+cN7YukH2I2k
         wqeisO5oGVk9dgLC2pqP54eE8M51d7EXmkXxarn7ku5SQQFhvuV/8ywSMfkz1OVsFhgf
         ThAyJzUtj/rTZAGZuYcsw9bAQX3egZJxoPAtCYO5ube6UuxkJZhv47CZFl6S62yZ44KL
         lliwcfw3Mt5NrBTeSEwXw5eT/gLhpc1gtyvk/S+vfw1G6F450VMIo2gYYaYTT7VcIZbN
         CZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=xDAvnwJaaRcaV+skh2AygCTEj4G18NLoDkpOPj5obQrIQjseOZ3vzgdfJqYoi6aIzi
         sdUfYTxz/CBlZi4QVH+elK4r8rLYYg43OQl/JKnzmN1+kAoZkf1IoeEbrXpsFvNO9AhC
         j7UwypySkNYVeDQDAcfaz5IngG7xyga9iRA61bUNKFlRsiXII7xLfNu9MKXdTLUhQ9Gh
         Y/Z63jLm08gO0Nh4xx99uH6oo1oNmQ2VvwKMuZkSgpTKMEjoAJRkWNdkLDlrVsaGta5D
         mwXfsWJdTXu4PFrX0I9kwl5jVnq8qSVRN7QJ1v8IKPBGsQLwg88W+c5tawNhsNc87c7u
         8BvA==
X-Gm-Message-State: AO0yUKU/0V5yQfoJN1cAYKoFZEqEc41Co8BS+PWmzvQ6VAIek4ZK+TK2
	RhJ7243LAJg0foIZ7w96giPvoA==
X-Google-Smtp-Source: AK7set/fcrczUSS6O74y0FBZWDMhE3+GRJrRdbPuvTZ/5CyO7Dk5VOPCkEvL96gQxIUxMHi1viU1eA==
X-Received: by 2002:a05:600c:cca:b0:3db:1919:41b5 with SMTP id fk10-20020a05600c0cca00b003db191941b5mr8877209wmb.21.1675411121802;
        Thu, 02 Feb 2023 23:58:41 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003dc433355aasm2034857wmn.18.2023.02.02.23.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:58:41 -0800 (PST)
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
Subject: [PATCH v4 6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Fri,  3 Feb 2023 08:52:32 +0100
Message-Id: <20230203075232.274282-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235843_902804_1A999EFA 
X-CRM114-Status: UNSURE (   7.50  )
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

If KASAN is enabled, VMAP_STACK depends on KASAN_VMALLOC so enable
KASAN_VMALLOC with KASAN so that we can enable VMAP_STACK by default.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..0f226d3261ca 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -117,6 +117,7 @@ config RISCV
 	select HAVE_RSEQ
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
+	select KASAN_VMALLOC if KASAN
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
