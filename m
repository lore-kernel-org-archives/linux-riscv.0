Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BAC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8f8FA8GU0eQvwJL7IBaEpAC4IV34hOutOfEzBhAOKM=; b=WYlxRKfMoQ38U9
	s3Dqoim4rSpbyF85PKX5MwAOxl2fuLmuYoIafoWmOYSV8c3y2NxStuXOj4NGuJ/d8/Yn2l1O3nqI0
	bJcJxrkBO5jef0ipkcjiCrvbSEPnYJmw/vPf+f3wWLzY5OFdV/J53dsssg9CgXemtqDhySXlGC89f
	RGoAxKk1GumTZIahVNgMiw/GXPXpS8aoUGWqd6Q25kMTiiPnPhq4a5m3QISBZUzG7E6aplYoIi3Bp
	xVP7V55dKVlkbB7wjLEMPpylHeobwIG4Fy5sKquUHEtngKM2xouki0qChJFFohT641ZSGiFINhoTN
	aJ29ZkcVrDkK1lhsUJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqw9-000szk-KC; Fri, 03 Feb 2023 07:56:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqw6-000sxz-Qr
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:56:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d14so3851539wrr.9
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xmv+QSgbqVHZO5FLG2f26KzmGjk1zWdaRkSSaCJJ9A=;
        b=XuczLvagK7WsmiMD0NIH4cDz5zkpFSMaym/36WPwX6Y205bCcVSOQ92VH3FAKncIMI
         GbXhfd9wrEiD+c1UoE4uqBW8mp498tNU19ZMIQCkKUHPpdLUUD7bk4/PsnvaebVbyQeM
         stPD6wgdggxOckDKgZTizPhbUrJt7rPQjY6fKDeeP5eObV93YXpzZu0w7AdXZjK2mdAH
         sKDG8P1JeJyUm7nbbx35mn4OGRYRWHBN+DtJCFObe2AQL7GHvytWacR6JAFyY3yJxG1X
         Pz9j2ebIXJ6CZ9C6sfjRmQU9Lr2ZsTcw0whG/YLYnhEQz854eMuFWFqVWxQMu89W5kED
         Lvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xmv+QSgbqVHZO5FLG2f26KzmGjk1zWdaRkSSaCJJ9A=;
        b=ejr4R2fRcxwJ+ol8Dwu2sFIV76Gxt8WF448XXumXbn/g7DeOZSU2r6m5hvslJMbhAF
         +Mx1QXipZbctLzDP1oUZMWJgf9EK2u+Y2SozD5+YIn+81qQykbK79UK8objhEmKdweDW
         WKhbWSv6J9orAF63VvlSyD/3jv6b+ilnFN059jYCeOIQkCjPthodzhLKlzGSd0MF+HWH
         Iz/se85GVmCv6EoXyHZ5+6oNvsAIU+VIOvpC59zFet0k5o+wN+mI46JrQgVEgk137QzY
         BMnLytKmiecWjFgxvjiI5FvsS8+MTM/ea/AhJ5+9ShWVaeDjQH/tCLjcDkt/EowJVKjE
         gNBQ==
X-Gm-Message-State: AO0yUKXh0WediSP5VE/3TrJKystJfUPZz0riHnpgAkrGOFBGwBIgzSdD
	637KB1yTe+TADGC8ZMtHjKBNEQ==
X-Google-Smtp-Source: AK7set+5ZcYdlWkhKGsm8zg96baZB6eeAMJhwNaXjKnWKBcJQ1mmrPVa3PkvzJHu/WLFkCS58redgQ==
X-Received: by 2002:a5d:684d:0:b0:2bf:81eb:dc26 with SMTP id o13-20020a5d684d000000b002bf81ebdc26mr8135682wrw.37.1675410999759;
        Thu, 02 Feb 2023 23:56:39 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id j6-20020adfb306000000b002c3d29d83d2sm878564wrd.63.2023.02.02.23.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:56:39 -0800 (PST)
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
Subject: [PATCH v4 4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
Date: Fri,  3 Feb 2023 08:52:30 +0100
Message-Id: <20230203075232.274282-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235642_895310_8BA55600 
X-CRM114-Status: UNSURE (   8.90  )
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

The EFI stub must not use any KASAN instrumented code as the kernel
proper did not initialize the thread pointer and the mapping for the
KASAN shadow region.

Avoid using the generic strcmp function, instead use the one in
drivers/firmware/efi/libstub/string.c.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
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
