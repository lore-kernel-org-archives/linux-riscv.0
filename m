Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6EC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQJplkVLG7wOicJNGIU0K7Z3bQjynlMq9KLS2uFm8Pc=; b=urkaeEhEDPHGHK
	I7yy5fvd90QXhzYQtKasd0N/poMI1k1JYkYG6GaGoG5EytiVDhAs9PJA5jQKAmVxFpCccuw1Rmz7o
	HavtSeeBjP+awkQKtDXU1nUEtMsoUAFG4yZp6leqsVRhdAMLFvg0fajqnic9+tBWQpnnd218ve3aG
	zVW4zHAomd+5Hcas0cM/akJdExV0tK/5g6k9ObU/39KPs11oC/fE5yt+zorTTozxtEwBp46xJzIEl
	WT7T6jJs9yFJvrV4oYTm9LgGZR7V34t3ghmBYMpTZ9hCvQUC9vUviufvQWdkybC+GZqKli8mYaPmc
	2kNx2qmG4k0oeksZ6xSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu25-00GoHa-LI; Mon, 23 Jan 2023 10:26:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtpv-00GivI-7U
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:14:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso10190961wmc.4
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzQuCSnEBk5gMM/0cxqbCinBRYL7OsazNWf1U0bm1VQ=;
        b=mObKqyJ3XaOMUCe38UnhDsG/WnSMBgcpNpgXAMV7UfbTJcrB1K3mWIIOkGfSsVtu2r
         JiM3rK/33BZaNHMFyZgOUYTUg2sEGJEMiP9YufPRxhEReJGZlu/xjxif2ZtiCxnDLRau
         1wl7blHF19tVm+3MoQba2v7hFJYZegyUnpDT0QVYpgoYG0pt/5LCN9z0QrRpxR660M+A
         DIpgXRAHwuHAbh9HZDSUFPkWpJYJd3np3uWycLeXN/O7Kh7SFsHBeIEPQZMvXXh06ai/
         3o5rSA5V1+lpycTPZ/+oFS7ubecg07stoXvCKEpgJcgLyZ9kXQSrpq1IahSAzpjFmUNh
         FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzQuCSnEBk5gMM/0cxqbCinBRYL7OsazNWf1U0bm1VQ=;
        b=bfpW7bJ5W+DAT1TZtfuU6Fl5M5J0QLeoOqBxb5uUm+GAHlu364TOAZ41UzpdtSGXAV
         FO0K4EcTUXUY2+sqynyKqe/2vHUAWXHDJFevqJ4YlfOoyy40CEHlLg65f598C/Ir89fq
         d1cmj2X3v0d/IwSgSBk0gN5+Nr+BxXVsTXh1IO9VykHXPyG2hkAujlQkePzVmVoBPDAU
         gfFRSEP+dspm02l/KbuevQled8TYIR1gPH5seTPt8vdTEwdZiNL0DfSHUlpDzUozbcy4
         /OO0FCICno4965A5FD8Mp8ESjZBRd5Z5dBhLURUzHyL8pdiR1itanoqhiQxyzEENNx04
         ZUJA==
X-Gm-Message-State: AFqh2kqeTDc1wJ529XLE0L16oTxTUFo/XVYOE1DCtJAoMkCZRTfZ+G6u
	M4TUSHT68v1ORWMrVCnYtZReIg==
X-Google-Smtp-Source: AMrXdXtTmEiKZTnB5U/TX0g91Npj+BJfrEC7JbcTiWp8/aNr0ZBIqEWCtbTa9wq/1djDZez7HYitng==
X-Received: by 2002:a05:600c:3d98:b0:3d6:ecc4:6279 with SMTP id bi24-20020a05600c3d9800b003d6ecc46279mr19967175wmb.27.1674468837652;
        Mon, 23 Jan 2023 02:13:57 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b003db1d9553e7sm11373283wmb.32.2023.01.23.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:13:57 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@alexghiti.eu.rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
Date: Mon, 23 Jan 2023 11:09:49 +0100
Message-Id: <20230123100951.810807-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123100951.810807-1-alexghiti@rivosinc.com>
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021359_300971_0F866E1C 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Alexandre Ghiti <alexghiti@alexghiti.eu.rivosinc.com>

The EFI stub must not use any KASAN instrumented code as the kernel
proper did not initialize the thread pointer and the mapping for the
KASAN shadow region.

Avoid using the generic strcmp function, instead use the one in
drivers/firmware/efi/libstub/string.c.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/image-vars.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 7e2962ef73f9..15616155008c 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,8 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub_strcmp		= strcmp;
-
 __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
