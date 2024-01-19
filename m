Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D42C47DAF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPkX4e15g4Xi/3nOhlFgw5BUoKsEKj4nJu4JQms//48=; b=LZ+rDl4NZ94OwI
	+YGjpKnnQUrK9fgXY845kP652vt9/4+m1BJICg8cxVWD/AvTcq9oFKKt8VTP6kJxDStMf2wu9JJF1
	KHrdY+gXRNGnMXDMnXbxgee+hyZjjSsE9yPDR6H7vrlU3yAZ0Dvx8SvzoUKhtY7Q6DGJFJfzDL0Pu
	SzbbnKfruxFvqnBPLZoCam7Yq2IHcPFmpFol8+C/BrWVfRgCEJfkjfaBuvbuWEiQChUFrU/rkW4F0
	9e35YmmSVMVM6IRk2tajGjpiErhMcI4GVZvBDHTM2/lY5TduCa6VudgFeUayFzmQ8/++8HtDtT5PI
	ufRgYFHoyW0xIWAt0P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9U-005Ek4-1b;
	Fri, 19 Jan 2024 11:35:12 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9S-005Eje-10
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:11 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36197b6e875so2690415ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664107; x=1706268907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k38gzzXnRwc1LG01yYkdNKX2/4JudjETsypjyCoA1oc=;
        b=GqTVCvW182LyTtuhUsBOqYf8IkGo7H9x/mx0+J/Z0Baqehj9UycEn2gsrJJnESt6yH
         TubI2yQuV9TTwhHbyTdSRwZ/fFs5ld76/iXjX7yrnPm0efflxRD1Afsq/FrvZWXAf23Q
         IKOJFyoPbsx/W0SnPmvPH8EPQmLZJZEJxFXknvt2XkLaRPcn0HDVPVDg/YYIdLVEqnOU
         BynQTgxh+GpHbIn7cujwDzjgSLz8WG4LuTaAE7qw7ghAqa+2331JrMd8QoZRZPl+0Uqb
         4cnWCR0+Pl5kjNydRVaz9hQXKDvOgD1Rl8O+ZS011UEN1+YZ4PDLMpSY2M3/8LingzA6
         F44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664107; x=1706268907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k38gzzXnRwc1LG01yYkdNKX2/4JudjETsypjyCoA1oc=;
        b=WDrMJj0uzT2qq5dAj8A9eXvjeQjR77m9ZFBCvRGhFc/HWVWqkxhf0lPfRY95KyjSmH
         gYrM9j88LXwKq94fEPoJbAOIA3sbIjd8Xpku6sGI70ejyrciPAc4iy2LXY7AoRr9O5vR
         RnlPE/m+8eSev0LauRK7l5CjH7thlJvk6sHRDptlLfPxcJT/jEBeGZoeuix5Bfi2UIr+
         5a4zOS8TvYzTLDlnWxq/AgCrEaFlfb0YlPIimAeVf7pQzDgw/4xO+DRlOfrAWNBQp8Fj
         xPHWgED3/bg9CWeB2gfxaFR9J5YSpyRRxiHciWBkRZm83viiHjr0zDYIvfLMwmQ7UbTo
         bspA==
X-Gm-Message-State: AOJu0YwyhWqAePY/GRM3zcdi8GVFDqAluK1mbE1HNPG1tlt4q4XBZ2/A
	Njzz1sLQBwX3gM4F4IMT4+zDvUFDAWBam/sUok3qs88FzDuJzuPXD/D1YfReQlY=
X-Google-Smtp-Source: AGHT+IEFgxqp4c4BSC1SH5cF+VnXZrlQYZRwfL7NLGJ+2lwsht4p33YhmsPE8cnHExWItmf7lq/Yhg==
X-Received: by 2002:a05:6e02:80a:b0:361:981f:5b32 with SMTP id u10-20020a056e02080a00b00361981f5b32mr2364278ilm.123.1705664107212;
        Fri, 19 Jan 2024 03:35:07 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 19 Jan 2024 17:04:45 +0530
Message-Id: <20240119113449.492152-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033510_349976_168E1703 
X-CRM114-Status: UNSURE (   9.14  )
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

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
stub of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6f898c56940..e0a8eca32ba5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -288,8 +288,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+#ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+#else
+static inline void sbi_console_putchar(int ch) { }
+static inline int sbi_console_getchar(void) { return -ENOENT; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
