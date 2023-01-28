Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C8DC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgCd+2jvNSKnLrA5ShDLj7YdoaOjY7hmrD/7FK0rVAU=; b=u1ouhBCwBQ7kTG
	pjV7WlYZK48y8TVs4N4O3soXYy7ESYZx5xSOYTCQy7hA5EGhWqiGNvlVXHEX/PSouqBhiIuhXebnE
	aAD7l+5RyxyK9sMau16lm/s/uTceAPMfrFifQPj59ll6fD6EHXHFW1hT5DTQePYcUYOpLfk49P6nw
	yAO8vrDCyrznw1akgH40b5KQGtECmorOUvxiBTJrTZFm7mkLk808YPEcc1sCbKNausNhbJWOsfi56
	ts5E2vbM4RvDMy74BGhPZw0Ywyklcah92cr3yG/dE3SFfogPcKLIHmE5NDcKgAuUTIkgi50Kmp7hu
	eGfS+1GsfN7NwfHY1fDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfd3-00HLYe-BB; Sat, 28 Jan 2023 07:28:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfd0-00HLWa-86
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 07:27:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d3so7035490plr.10
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Uu0XcOi0YfgGBrdwbE6Fd5anHlLU0kgUQvAvy8N3SY=;
        b=iQufTxafHvT+YxmPupDGUBtEEbJkIH9hmfsJNRto9WJxjIRW8Pg5woDtIMI1wkg3DS
         R+I/hByys5ZOJx6yEf73FsszEm0uiQCIwXAuKdbxLqxQ5V5uY4v4TICEYqjHQVdLNSS6
         DPrLTtCrNK57h6NLhUbj72BYOABBqdEmznHPJ3tkx5aguszWitl8QF2OlngExBMCU3uJ
         pbJjUWVuk7DMVdbQzor/c/kcLTWQ4T94vs2l9R124muqq+zjICjnTzxlvuid0cBvqPrv
         ZVm7VaPqwJoD4OxQLRFUzdwJuHCixFVxvE0LCvLeKF8VcKaUPs36PUoIC3h8ATfJXPOf
         dA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Uu0XcOi0YfgGBrdwbE6Fd5anHlLU0kgUQvAvy8N3SY=;
        b=YHw8rP8nSjA305UeRW/wY88wlI+ua8LwzVB+y5fImAyUhvkTb2ieiuTC2Bq2g3uQ1Y
         fSvAA6E4ACAQuMdFA5LfKBrPMLrL6XgJhBy+QboBzV9PJxPrbFpNZI9U4NnkenH1cfpo
         ZTZtXRSw7WrB/NgVRbluK5PT8wwWYnNl44fw1CN/kfdPWZ5c84RoiKWHZCAzEMhvQpYz
         KbGMeSJTiqHO7sKFnjknRfLOqJmrc5t12hXaUyLOcQhRjqrYMSKPDiB1K5JdwmdB4XMn
         9Kip+l1suvtOaJIHXvp4YfUUxPgo1NTf2pktm/t6/lMR/S/vkLj6W8ujfWV0/4T51KG8
         mbnA==
X-Gm-Message-State: AO0yUKVAhLYgD6QUMdpndFAyERPJzSVp9i4+x59NUBbUY9Z9tQ9cj1AA
	5Trvf2id3anIRs+EfFsXD1kPZQ==
X-Google-Smtp-Source: AK7set8elKufdTa2dQJy/JujoNR9s6RimlLWJMQHkwmFUsxhc/iYyt2WN/V9fwrCUXZJF8pidXkQrQ==
X-Received: by 2002:a17:902:f202:b0:189:340c:20d2 with SMTP id m2-20020a170902f20200b00189340c20d2mr962841plc.23.1674890876510;
        Fri, 27 Jan 2023 23:27:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b00194ac38bc86sm753132plb.131.2023.01.27.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 23:27:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Date: Sat, 28 Jan 2023 12:57:32 +0530
Message-Id: <20230128072737.2995881-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128072737.2995881-1-apatel@ventanamicro.com>
References: <20230128072737.2995881-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_232758_317208_3073962C 
X-CRM114-Status: UNSURE (   8.19  )
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..341ef30a3718 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_SMAIA,
+	RISCV_ISA_EXT_SSAIA,
 	RISCV_ISA_EXT_ID_MAX
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..a215ec929160 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
  *    extensions by an underscore.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..3c5b51f519d5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
