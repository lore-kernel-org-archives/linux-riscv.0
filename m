Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D42C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOby5AKatMHXVEv5WhHPlHmxYjNldHn0umzV07W6lX4=; b=vssIECgxTPA/pd
	7klDH/rkD7QhkN81vz8sCgp5ppDqzIHC26XhLlfnJje9abg+bkCL4cAJvB2Ir6CUYo7oI6H8HOacm
	09ZR/K7V8h5YEp8pFm1RMmmx6Dxlvaw5trZdinlNyhJ0v2F7E2jRm9FEE5OiHiFHAIwNwt2oYMmgq
	CchUsVagoewbvd7Adncg51kUpQ2XQkFFbEiitMQr0nUvq6YBaY1U6wSk8aqGw+ateMVYPB3RzYgrp
	/Sq9JZjuTzqtttWEqwSTwUAx75EeEUjT9VTjdEHIccxAfEDBBS75F3b4ZzrAgyad8fYPbPo1kSGR0
	iJBXT9oi2L7IxUDvFTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDTb-00000006NZS-2d2R;
	Tue, 26 Mar 2024 20:32:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDTO-00000006NU1-0HEa
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 20:32:53 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56c29599e0cso1545852a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711485158; x=1712089958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwoTWlECTszcl/qxdYVc4t6fpZ8kE/2UkB07bRVsSm8=;
        b=vHQPR0E5BqJK2/QxKOySsYLQBK9Fk1/ZE/HFT6Fw20Td4wepBGJ1eLwnx64DOoXp/u
         6O8Ko2C4Nbelm1SuS20kqPix8mKezU7yyMKaf/RZ8LvOV9LxN9urWiRQUqEgsOYzuqWz
         xmpSJUSMCBayr7Y3RI7Do0gSfM14poSqV0luqLFtj07GTRTzkxN6SksnO0CWMgyBxlTS
         VGtmkpuAto89EeH9rAQL9Sl6fq6eTTPeWdyomxoAptsc5XwPUtJmBw86x1Ev5BDoaum3
         7QJyvtsal1cQRDIGOq2PLBVpN2FmiG/q/WyVjUx4KFqZDz4oRSc3kEpOr9uotSS0ujhB
         NW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485158; x=1712089958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwoTWlECTszcl/qxdYVc4t6fpZ8kE/2UkB07bRVsSm8=;
        b=ODt4dEZ3qFgZALOWZE1/xLUr14c8E2qn46rfEBWqT27VbkaMvzIQxyoS1lZj921SGC
         UrG0FzzOCYHlNkQ0h2YBf2bggMt1q689W+SC0nJAEkhokxzseqRNWyjnWD7uLvF7Dk9O
         qpL73q++8THRadC5CStp6w5pD/bkaubSTbpZFi3fes0mbFhEExif8cCLsAHh8SNJ92qx
         GhSRYb2ZofHcRAMXSyNMR+XYMvrRixvwr3+099CwlHQXZY8oQyQKkr6ft62AvehK1VoT
         nEIVLw3SvDZ65dp6nfWRYrIVrI3z/mjdHC8zz/7Wi+O8bgwGi2BG+lC9XXRgmvla/ZVI
         oJKA==
X-Forwarded-Encrypted: i=1; AJvYcCV+GV6Km0RpIgHty/6at5RH1Bl2Ucxcz5RAFywYuUJWRBhBsXIcLnna5bm3zFXc5rnZJdH4ao9bCPg8+PYitEwUGDx7ZejUWT/KivsH7cER
X-Gm-Message-State: AOJu0YwGp+Ku3USbjsY6aKZQCL79FssHPoS4X2B9tffcm153U3aNHwk+
	rLXo7+JrH5qp8HEdfaqGZTuU2jY58r+hlBqfwrULRJgUapOERVJdOLLVsQkVjsQ=
X-Google-Smtp-Source: AGHT+IENt7YBLnNtoUOQOQp272wkaUn+XI5a9KNpsaZCh2RNyyuvnhB+Bx/GceA3IeXjeVnoNmMyRA==
X-Received: by 2002:a50:8e12:0:b0:565:bb25:bb7a with SMTP id 18-20020a508e12000000b00565bb25bb7amr3175538edw.24.1711485157973;
        Tue, 26 Mar 2024 13:32:37 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:5240:d2b3:9657:7432:d88d:84a9])
        by smtp.gmail.com with ESMTPSA id da12-20020a056402176c00b0056b816e253esm4525782edb.13.2024.03.26.13.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:32:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <andrea@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH 2/2] riscv: Disable preemption when using patch_map()
Date: Tue, 26 Mar 2024 21:30:17 +0100
Message-Id: <20240326203017.310422-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240326203017.310422-1-alexghiti@rivosinc.com>
References: <20240326203017.310422-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_133249_254884_950189A1 
X-CRM114-Status: GOOD (  11.62  )
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

patch_map() uses fixmap mappings to circumvent the non-writability of
the kernel text mapping.

The __set_fixmap() function only flushes the current cpu tlb, it does
not emit an IPI so we must make sure that while we use a fixmap mapping,
the current task is not migrated on another cpu which could miss the
newly introduced fixmap mapping.

So in order to avoid any task migration, disable the preemption.

Reported-by: Andrea Parri <andrea@rivosinc.com>
Closes: https://lore.kernel.org/all/ZcS+GAaM25LXsBOl@andrea/
Reported-by: Andy Chiu <andy.chiu@sifive.com>
Closes: https://lore.kernel.org/linux-riscv/CABgGipUMz3Sffu-CkmeUB1dKVwVQ73+7=sgC45-m0AE9RCjOZg@mail.gmail.com/
Fixes: cad539baa48f ("riscv: implement a memset like function for text")
Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/patch.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 37e87fdcf6a0..30e12b310cab 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -80,6 +80,8 @@ static int __patch_insn_set(void *addr, u8 c, size_t len)
 	 */
 	lockdep_assert_held(&text_mutex);
 
+	preempt_disable();
+
 	if (across_pages)
 		patch_map(addr + PAGE_SIZE, FIX_TEXT_POKE1);
 
@@ -92,6 +94,8 @@ static int __patch_insn_set(void *addr, u8 c, size_t len)
 	if (across_pages)
 		patch_unmap(FIX_TEXT_POKE1);
 
+	preempt_enable();
+
 	return 0;
 }
 NOKPROBE_SYMBOL(__patch_insn_set);
@@ -122,6 +126,8 @@ static int __patch_insn_write(void *addr, const void *insn, size_t len)
 	if (!riscv_patch_in_stop_machine)
 		lockdep_assert_held(&text_mutex);
 
+	preempt_disable();
+
 	if (across_pages)
 		patch_map(addr + PAGE_SIZE, FIX_TEXT_POKE1);
 
@@ -134,6 +140,8 @@ static int __patch_insn_write(void *addr, const void *insn, size_t len)
 	if (across_pages)
 		patch_unmap(FIX_TEXT_POKE1);
 
+	preempt_enable();
+
 	return ret;
 }
 NOKPROBE_SYMBOL(__patch_insn_write);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
