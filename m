Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A5C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OV3mgPheh56kY3lrYmgCEdsi7qVXNysWlLe9yodKkAg=; b=nL3OzsITP8teYD
	K1LKxxhJahKkPfUYZAQurTHQ0sU+HdtlGNUPiTgv3UtV7NIyvz5ibuWRFmzPmzU2i70smyFht6UnE
	nSeoRII0ctNcvLiJwdWhpS5xjwI5pgaSHXNWJDxWGzcgBOvvnhAs7Joh/txe4w/lskiLAuJVCiOoG
	/MpaxymoJLn3n20gCLDNuJ/Evn/C6+VkPxXwiDEUIP0yCFnalKNDn0OUvt/XJ4mvTxEe8+kMseATO
	STQs2Awcif+PSwMAviy5cC2iw9hGtMMnymqoLUrl3Gw5a4x/YYQdhvt6psNdvyRH72qkgOVGCwN6b
	0s9ETKCHfOxVgI+EurxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sk-005Pyo-1D; Tue, 13 Sep 2022 09:44:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sf-005PrX-96
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id m3so10727218pjo.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F/AYZ2GNWx1g7Ofq3EOTYIAjDVVybb+46m8xnxGi4Ck=;
        b=SqdCFmnRG2C999/Gcs2nSulnGY7XwF9OVD5tvbdoQDe7+qfqYsB4fORHG9557wPfWZ
         SAFm8gbEa5U1spFw4KG/TkbdeFd2QUZgSZcu/1LtzgQ3Tki/uNKAOvp4Pkb422ASmlSD
         GoM5fgwQVNqyu6j6lTN/lrwpXJ+K7K9rM1gau9m2cEcCD882f4ersdjy83+zNo4K47Bb
         JT1Uo9LcnFkOXAL2QDupCatkgsFk7PkzSB8XCIgs4FmvYT0ZZM3NfQOyTT9M1lfes3Lg
         J1RNA05HwjGYjL1rcuPHGl1hW6+TXYG3HQu30EXUnpnhP9ABJ7fetjORE/oEOUVZJ1lr
         qxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F/AYZ2GNWx1g7Ofq3EOTYIAjDVVybb+46m8xnxGi4Ck=;
        b=c+h0NCe18oUh6vNTT9UwfjhecMOs1our1ArNfa87AIFfZfemnEIXnsvUnFX2r4WGch
         XSJJkA4gP93f6uRiyYoptyKi9Pg5GEGpu8h6WHr8RSv2jbl7fe0RX3tC0G6DCJ93hLmr
         78cGDjZD5Uc7SpAQY3/rxPB9wh9G7iGh2hO8UiJT+b3jaepbgMnYMFIf/KVhdRXY+J1d
         KM/CFmn9dvhSVJ9YPsHdK9kEEpQOkMJJg9uE4MMux8ZzQH+j6cGGThkBPTglu6/ELNVg
         IAygSjgwCSuFV8JXafy0HCfC/iZsALNWw699ATBRIZJ6qLgvl9OZ5s4MgQM4Skqd6Vzw
         f9ug==
X-Gm-Message-State: ACgBeo2kT7ki/Hi0opBO1AM9FJ01MDiewxf+6gU2X+WhVx1dVCATuEia
	tbJoFDE8pqKR+A5/R3G+R/zTbQ==
X-Google-Smtp-Source: AA6agR56R/QgVfSXUtCz5664kUiearKsgHC3WJ6A3sJ/MlW0jvqooVbviwluZ5+MESSW0A7UdXKLBA==
X-Received: by 2002:a17:902:f612:b0:172:cbb0:9b4f with SMTP id n18-20020a170902f61200b00172cbb09b4fmr30140742plg.142.1663062246503;
        Tue, 13 Sep 2022 02:44:06 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:44:06 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH RFC v2 riscv/for-next 2/5] riscv: export patch_insn_write
Date: Tue, 13 Sep 2022 17:42:49 +0800
Message-Id: <20220913094252.3555240-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024409_361106_9D1C0DAB 
X-CRM114-Status: GOOD (  10.29  )
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

So that we may patch code without issuing fence.i

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/patch.h | 1 +
 arch/riscv/kernel/patch.c      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..327e99114d67 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_PATCH_H
 #define _ASM_RISCV_PATCH_H
 
+int patch_insn_write(void *addr, const void *insn, size_t len);
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text(void *addr, u32 insn);
 
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..6f7757ce50dc 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -49,7 +49,7 @@ static void patch_unmap(int fixmap)
 }
 NOKPROBE_SYMBOL(patch_unmap);
 
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
@@ -78,7 +78,7 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 }
 NOKPROBE_SYMBOL(patch_insn_write);
 #else
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	return copy_to_kernel_nofault(addr, insn, len);
 }
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
