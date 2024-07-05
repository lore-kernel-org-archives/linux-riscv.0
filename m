Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367CBC30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdDeQVnOqOH2fIOo/4yqJvIfn9IbvAl5GiGrzrYdor4=; b=GrFR5VhsiQTqr/
	xR+R3EbF4cRyY8JT7TYEw0LgkksmIzFMI7m67J+7f51R96mMac7M8bqJBP4zNyrc+z1cuFot1tx+x
	eNkKiFnRzlITEaQLJFMXOOJGAcHQXLn/pbXwAM4NaJR7m7yoXxVy89xXXQanH/p2UgPM2g22McIix
	8VJmXgINbsBNBZMNNhz0Iz6UFJLfJUYHKTWOQiZDK2J6Zx9Sb96ip3FrOSgf3Z1cnITAjqzNr8UMq
	l5U7Zfrtq+oC+rii0T6wj57srXvYIdCav7GPDTmQJJtEb4GwriQweWgnIVwAGYggi6NWBUHxyHi86
	VsmOkbZQWUgodx9IG1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPcA4-0000000F0sm-2ms4;
	Fri, 05 Jul 2024 06:11:12 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPcA1-0000000F0ry-0nl9
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 06:11:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so891243e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720159867; x=1720764667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QeNckosVxjolkEFvOsh5sX+5l80S9ypJGm7bOhl6bY=;
        b=J50cf7FE/IpSazWYiIlGK+bF7RyATQdBK+5Gnn/Da61rCA1fFycibsx7bUytV67hDZ
         iv9obV58yBS08+vsAfr5bqJATscdrJLYKlrcNRZ9XweWpaO++TvzzQYw5dUg4ElasTda
         juOT5PL+6xAXhG8rgOjK44CjPdP4vQHjikOoh146jfNeVhZZeZQGGUvAqY1COkKia/bU
         ZkM4jIR1xEF0SRCw4KNgrXZq6xlRIzLg1BzzPUFRoU+Pl+63JoGXJNU9kTxnY/3YGaWv
         W+QfStv9E7GVVGMvQNbqu2DJm8+VX9h9rqC2ZlRJUesgztMwhkw+pZQiKU4uP6eeFY1B
         hZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720159867; x=1720764667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QeNckosVxjolkEFvOsh5sX+5l80S9ypJGm7bOhl6bY=;
        b=SvmfI7Mrul9HyzboZ7YbMRScixZfx+eF8p84N/B38VHu3zwdrpMk5zLRq4kUmkCbrg
         MP66gcCB8Fi2L3nY3GkBixwIoqfvFRDW7F3KuBAjRt7C9Xf4jbfmY8+iHdL5UgvQkLP9
         kwjyZjIVAoLqBcg4rjKjoYMj+DVCo92UKurbLJ8ZAbY7qc1rnNb9zeJkAoL8Vl8R403d
         EnEIjXnuHltIHgV7dN72RQXmPObqikpENZi1ftMWNlI87jvYSIpy2ZIMRJjQIJKsJKfa
         l13MJcqI8gBM4j15KY+nQ/HvTLbjl6XE9jFSm9S/pRpjjdnXBYRx9JX+R4PZe0mcfP8h
         cnYw==
X-Forwarded-Encrypted: i=1; AJvYcCXEHkggsLfIOkuJuvi/2tEggXmFyoTl6/i3go3Q8D1wdKFMMBvJsoQM0SqDSQmIOB2brAKHiqrigaeImnnrLxOo31ftrNrMctzKEybXw9be
X-Gm-Message-State: AOJu0YwzHxSb2wUTrFJlhb0qGUoEGPXSlWTtgosmCs4P7IOd5H8jIPZT
	xxTn0nV6f3SYC+l1qUos7+IUyoRa5p/1F1JJlemsTGIkq5K+mUI6QO/edLy0OKE=
X-Google-Smtp-Source: AGHT+IHjkb8qjpcNsRKkVyx2hr2qJJKQ78xjRcgB3qu4zXgwtDuMcYcJHWND0BLXH2C/nnodAxjlzQ==
X-Received: by 2002:a19:8c48:0:b0:52c:e180:4eba with SMTP id 2adb3069b0e04-52ea06f7cbbmr2294130e87.62.1720159867137;
        Thu, 04 Jul 2024 23:11:07 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm47050405e9.7.2024.07.04.23.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 23:11:06 -0700 (PDT)
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
Subject: [PATCH v2 2/2] riscv: Check that vdso does not contain any dynamic relocations
Date: Fri,  5 Jul 2024 08:09:02 +0200
Message-Id: <20240705060902.113294-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705060902.113294-1-alexghiti@rivosinc.com>
References: <20240705060902.113294-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_231109_256569_BEE90165 
X-CRM114-Status: UNSURE (   9.00  )
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

Like other architectures, use the common cmd_vdso_check to make sure of
that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vdso/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c7e40bf36371..b5c73084e554 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -45,7 +45,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
-	$(call if_changed,vdsold)
+	$(call if_changed,vdsold_and_check)
 LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
@@ -65,7 +65,8 @@ include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 # actual build commands
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __vdso_xxx symbol offsets.
-quiet_cmd_vdsold = VDSOLD  $@
-      cmd_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
+quiet_cmd_vdsold_and_check = VDSOLD  $@
+      cmd_vdsold_and_check = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
                    $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
-                   rm $@.tmp
+                   rm $@.tmp && \
+                   $(cmd_vdso_check)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
