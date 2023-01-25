Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D7AC54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8f8FA8GU0eQvwJL7IBaEpAC4IV34hOutOfEzBhAOKM=; b=ZDdhTA2duCypZE
	+Ya5u40BA43q8BoSjqINeGKLgPA3RINKTXnZpjx18vWsG+9BrPyQuoxjG+hTGxCB+PGurvXU3e3vm
	o2Gj5Dabf0sHJ6ZSMjI2wqVnOk5i56+SnmEv+9k8P/bnI+mFmWhU8zQyR8MM1+cOx0j+AARRQrPQG
	R4pDhGMIeft1mTSksflx9UUjpuZun0IO1Hs17JJvfHW1OjzsLG75Aw6CCzhY3GVL/fBGDtLEY6Zzg
	Ss4fvklbN29Tb1CJcFeFfHTE/AomebGMQgMWgiuqyF3Ey1CnyDezr1A6t7V7QqQRlx/ZAHBD/lRa2
	gT4fuG39KpGgfm/aTwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb8J-006Pi8-Cn; Wed, 25 Jan 2023 08:27:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKb8G-006PgT-Hs
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:27:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id d14so12534267wrr.9
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xmv+QSgbqVHZO5FLG2f26KzmGjk1zWdaRkSSaCJJ9A=;
        b=cbBspW8qJ+TGXotE39Oa2GtMgqgvEaxRYhO5hoiVi0ud4rsKGjyyMhGeWSEbTliuQu
         PeUr4O1lu088PVCipbmpjO0xJw9wvuZk+/4okqKqdh86qOXFy7I5tUzhr/fPkah8VI3a
         9N8G72tSz7j4xyTYwDhoG+P/goUThd3U9eirP7gIklgIcTl0A/rU6mHILG/9h52wlabF
         1Ao2ehXEQ8ebqT3m6/yspOli05h+eIaKYOnjR9zEF/UBqi25rdpavoWW3Hzs5BPZcD3x
         NAQpK+CWPziWqOfXXs5R8Uj+rOL3fy3Pte2cQP3RFwlo2s4mYjCSeqjPQTRuWy0k8e1q
         WlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xmv+QSgbqVHZO5FLG2f26KzmGjk1zWdaRkSSaCJJ9A=;
        b=DxRVUqcUxZHh7Z2Rx8EFq7ovW5/k4cq2EjZ0L1WUoOgfPthT489Dw66qZe3Mw9iaKV
         F2JWSIoQCHtajiG+itLGTGfOEYRdUd6njqaQwfdpF7tIYMPbPlvpDHNaIGZPryvSLtY4
         uPZH2iNgA1sjzOTXGdX0Ohwd6+giZu8JacEqCJMWqNnmi3BpNP1HuuzQTH9RaAhwdpeZ
         RFjXaInnOonTMkDGrWSlqTClR5cI/IapASzq2lx4OZQJIOuvxWpCS/51kToWRUGpc6x6
         U9vK1OxjiGPxsIrBdefdCsGekZAnwphFET5qaB631I2mJgMkh8fZ7emuos9VnIvL/TQM
         RiVw==
X-Gm-Message-State: AFqh2koU/EfDWOY5SFB71sxZ1KfmdAhnPqgoR738cmsuH2K+H2QXko3a
	mWiRE6Az4+TKaNWjCQ3AAqYPbA==
X-Google-Smtp-Source: AMrXdXu8PoPu+NFgqgrtB5cmrqLEb9a4CDisajsgtj/VZ1j268QbuemGFUZLIa8Y7cOSokqHZPwRQA==
X-Received: by 2002:a05:6000:1c0e:b0:26f:6bf:348f with SMTP id ba14-20020a0560001c0e00b0026f06bf348fmr24106837wrb.6.1674635266981;
        Wed, 25 Jan 2023 00:27:46 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id g9-20020adfa489000000b002b065272da2sm3863367wrb.13.2023.01.25.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:27:46 -0800 (PST)
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
Subject: [PATCH v3 4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
Date: Wed, 25 Jan 2023 09:23:31 +0100
Message-Id: <20230125082333.1577572-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125082333.1577572-1-alexghiti@rivosinc.com>
References: <20230125082333.1577572-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_002748_610577_372D013B 
X-CRM114-Status: UNSURE (   9.07  )
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
