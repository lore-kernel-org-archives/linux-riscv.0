Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B156C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cyCFi18/Vg52F4ovGDErho0FN7TiIyDpDahAu8YFTc=; b=0B+584JiB02X2O
	wtnlfvG4Bg4XruVOXv1K8lHcsB61PDhgYRwbAkEievN//CxLTkeKEgiJXFKTDnwJfqEAvjsmcr00g
	oV+D/kIR1g8xfnB7ZPudtcU7tC0NGWN19M9W/9sM3b07vljtNPfcXBs+NqSmlDtQM0Yi2mnSAS4UU
	kW+XCSJPkJHeWoBywzmQHmaQ+CG9t0sX26fRYoLyuyU8O0wmal9rFbHW6dfkR2JmT6XGo8ZmR2Ysl
	LD1CUyrsYEiRm76gXiIG5BoL0IS4SaVoMnQz9OwCCfpiWo9VubxPN/WEaajGtLmOm8x47J8jdIi7K
	I2ECaSH/TvuyupfykeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu2x-00Gohz-OR; Mon, 23 Jan 2023 10:27:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtrt-00Gjkh-RM
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:16:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id e3so10248481wru.13
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=rf0Qwpy9jDLACwBRHW/pTe733yWNS+5GkCJ3lpbac4R9t/4KBOcFFjNESynWlogYEv
         9s0FYx5LWv8VL7FOSfYeSx3l22EX3kJWzeMTlokBJXt6akEzTeA2NvaOsvqSim3qmxjP
         54HUEk8Du1+/WKUV2WaMInIbK4kof75WjqBAMFrHOcNQsY7EksIiR8/oe/DoVgr8dzG1
         Vz9soIjhqWGyCoC7S9+0D+RzHQm5Y691IbRZeCPWjDoVYOKo7vrAvSfqEJyk7wAv0HQ9
         cSjRuwf2YIXbfUMaNt5jpvFm7aNORGx1/Fc0MWxNMsou5kxweWshuY9cfu0GqESCgsHB
         EGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=871OGCI0aHwZZE6OKggKudWipUlPKXToB5Kn7OlT7Ew=;
        b=VXZ/TQEWHmjJ3kVZSGh1Y6Ir/yrmNpzCLLT129pvH8nuVTZHHAvFkh2BnHYJik4+Qb
         UaQOvw0U9mFxf9kh8mqEO2RljwgJcQO9SkUJ3PbBsNJJrnzgiyU+wUXUjaNOHePWeK07
         Le4hDa7ppaB76bwtBrgLUPGyRKlwId1XYVbSlvrYAM9M3E/0Pfhy2Q/uVQTfzsdnTvc9
         LS9RGkrDiIkZk4vQf3hSlM15FvtSNatYDoOwJMGrPwto3FQ2NNSnee81oeFwaStGiHGv
         WFoAw0/q5LeWclGHQV4BldwXdY8KvSTnEQijBMVs8whW/TxjBEbNqh5F0ovlCanpsKpw
         bv5g==
X-Gm-Message-State: AFqh2kqE/WAKKyPzdfMEOBpNsPwsST62CcxMwbdWYeOqziIgpN97I4lq
	eNgUS98JSX0Hbxdn2xxWCS0/1w==
X-Google-Smtp-Source: AMrXdXt+aB9WiXogOYH5qYIrSd/PSwMpNfUk6C0swXWoMoe+Z0T2xAC7vLxeSBPcQHinVaV3Qwdfxg==
X-Received: by 2002:a5d:4f90:0:b0:2bd:d542:e01e with SMTP id d16-20020a5d4f90000000b002bdd542e01emr21625059wru.10.1674468959652;
        Mon, 23 Jan 2023 02:15:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000100a00b00297dcfdc90fsm4296040wrx.24.2023.01.23.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:15:59 -0800 (PST)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Mon, 23 Jan 2023 11:09:51 +0100
Message-Id: <20230123100951.810807-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123100951.810807-1-alexghiti@rivosinc.com>
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021601_957568_0DD13141 
X-CRM114-Status: UNSURE (   7.39  )
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
