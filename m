Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5861DC54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cyCFi18/Vg52F4ovGDErho0FN7TiIyDpDahAu8YFTc=; b=ziDqH0nowzUNA+
	Z+7n9Ve4G7Bsg5zNwEpLw+ccIzil/c6VGBdprpb1IlvHC8eR+NgsdMpV5GZHFCrF4jgnrQb1m5Chq
	IlVGk8k64cc7ewO59LuDb2CCVwVlbjrKnXzKhhb75obC4J5h/iajSkNjiEmwIzxacwsLgwWSW/jaW
	xlOsGz4hAHTPp3IrE6hdn8opeaZb+DndUxZ6NeLCS4C8F3RcoaQZswtsGVEIgzuVEmv0WKt2ku2wZ
	FLc7+QqZwe9oqQJKLNNo51tOptARNOolLnNxIGabpW8gXegBAzZ47tD+9oSB/Nuq1NvH1zrDBCsAL
	mfX907nT5QUGKBcwCHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbAH-006QTZ-NP; Wed, 25 Jan 2023 08:29:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKbAF-006QRf-CW
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:29:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so685838wmb.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=C0wvOpQb3U0DVvjPMPgyyNT1+YP+zfNBdXYl4gQ9ZKvrIdgqPBYNBaTBSPmh43qicA
         a1LJSTPWiSwzYXEeLtvo+26GCcml0gCxNjiATpq1q00LMLOCIA62ag4FyNQ9T8VTlEme
         8oXHMAL04imiMoZZueW0GkozNOJ+G+5vIvGykPewjxnfaNXbHT5k5+4aIsETOCwDq4bD
         HwbdpXSUZsZAJTyxGPSFqn4LqWQTwxxyiRFmS4IJp5LQSi1e9zzn66VmmxEjbhyvm3yy
         yXeZCUtdp/IdHS6PN6pE9DGSoyqFGqXpCM4fiC9vTHliLM0PrTlGcJdBI5YhVXALWy+f
         y9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=ujTjx73KDtOhgs86dmzOVSIVdl/GYStDdwrlvUHw4eDwlOSkhIhPGDgzZAk6o2o/lV
         5tKaPhDOnNOHc8jf+0pHtbZ1V6/pjwzqj/ktP+6VErAgkV+MIL60xnd6VC/VFCSC6o+Z
         6UP8R3vIt6TNQrLeo3ygG+1gvQBbMYhr7yb3NH+ngdaXSq4OtQoC/NykzauP0JUGTyuO
         Y31ht6DHUTSiO8nZvnzzrzGon4tcEQTUR+fWSscH/JKkyR4DHPoaPs3DJ9cwW6C/ftWZ
         lN5erku1A2bEbORRaZqrAwKpneOt8Vs/1BoEE976wxjfC5A/S4u4SVtqRc0flcBfLBDk
         Tukw==
X-Gm-Message-State: AFqh2kq7JCoe1VkgfoIO4t+9FBVjJCvKjp9cPfmyIH2xjPvU5Dz4RiDr
	OcetRM0cfiF3s5iNRMG4Wv++cA==
X-Google-Smtp-Source: AMrXdXsuDmppa2cK6f9yHqBRO/sT58CjC7qn+D8bUDIkmfppKXnmAQCYCVk1D2pFp4XoIe6uX5V6oA==
X-Received: by 2002:a05:600c:3b9b:b0:3d2:392e:905f with SMTP id n27-20020a05600c3b9b00b003d2392e905fmr30562318wms.24.1674635389029;
        Wed, 25 Jan 2023 00:29:49 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d24-20020a05600c4c1800b003db0cab0844sm1070737wmp.40.2023.01.25.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:29:48 -0800 (PST)
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
Subject: [PATCH v3 6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Wed, 25 Jan 2023 09:23:33 +0100
Message-Id: <20230125082333.1577572-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125082333.1577572-1-alexghiti@rivosinc.com>
References: <20230125082333.1577572-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_002951_439945_73D61023 
X-CRM114-Status: UNSURE (   7.66  )
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
