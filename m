Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D8C54E76
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNT3Uew8vqLSfI+na+xDLS94CsMeZ/C35pUybSyykFA=; b=B3CPjCmSxOdxL5
	H44Z00qPxx3LHRDW+DOhyqPkkHe4ICIEflYlMejfGZ5pjcw1NC/T6APOzxfpYJ9hTmofKzpnZiBza
	Puc6RslwA/ei2npGUS81IvkSOP5Y89PM2FC/jiyzwhlS7humAsGGO4x1SLMbbUWDrq4/RC3mWJeo/
	nMm7KRaOWXo9TbhhUbU8c/T4Q8vnLdn8V9NcrEkGhWR83KLf6mDlwX+9O09Oi5RXFCF7/1JGvunue
	5YBUSUjVN7xlXm66izhd6zAjua1FHxVIG3N3xeFIX98VK+aU7RF963Gq/RSEp/uMeDm/K464gwmjb
	blmeDDUxMQW2F6RHwlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBG-007n2q-2d;
	Sat, 18 Nov 2023 03:39:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBD-007n1q-2W
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2802d218242so2299002a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278775; x=1700883575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=jaHELDqubaPNWLbPxgvxbTUOTY3/dOA1zC0JzuF5FrT9wTfsDmMbv3cU3mMD9/pJ6g
         nwRL8vcRIiAiK/+5g0TGWq/AC2IqOQs5AE6MMjQmnewUS7Cd6hFCEacAKbvmdzTm4cEG
         rE6i8mH58OgGP1UvozRpbRfle33bY78U8AH3tuSVPTjGeSz5p/mMsW04n5SobqUGeg4S
         7bjcJYSkwLXQximS/9T2fguBnxHCtU/14O0xFjK6J1roUAnqiSyYTWI1XKoPYNa0CbqF
         Avuh3BW3QKRJFZqqyGu3Rd+CXcleUhVTBBou+ApIpP6ny9xLTr0Cno1GEDYTELrtnA2m
         fvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278775; x=1700883575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=H+tXs4PbcFsHfutJTvSF7zhi6x4KbqUfxIdrgURGxkhCWDZToazlh4xh/PdsL5CuG1
         NRMJyLy98nBfba/3VvpBJddJI0yKIe6sjiCyUH4tORU1T9jXBTO2IavLmDuvHtuM4g5y
         AtuefHZ1pzN4pHHQxmFaOpB7EjUZcvLf2/alduy6uaJMzTVSFIiNb6tXyFo/ChoSWqeY
         67+HOX724Ih/jFgqLotHFv08rMsDUGMLhOB1gqrws4+coORTdM100R3jmiHoLLsOn0Lw
         wKOHZDVOCGokoPj+++t8yB7FIzKghMrXHOTTJ00ZIZyq7cK07mEBCU5IY3tGgrATcTv8
         KQcQ==
X-Gm-Message-State: AOJu0YwNi8Djq6tiLRUI7Dq5egT8AS00pYBCCHlpp8cIggE3UoqCIL6F
	OSL2RVi6zCO7JkWFQEtw38KlkuUDKUaBL1ecm8k=
X-Google-Smtp-Source: AGHT+IFL/vhOEv9SFr5vahVonbYDfe/rMF/KgPJfyv64wzi2WyOjQ+a4xtQ3OlsfO5O9XMpJ2UxSgA==
X-Received: by 2002:a17:90b:3b45:b0:280:29cd:4802 with SMTP id ot5-20020a17090b3b4500b0028029cd4802mr1636773pjb.3.1700278774537;
        Fri, 17 Nov 2023 19:39:34 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:33 -0800 (PST)
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
Subject: [PATCH v4 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Sat, 18 Nov 2023 09:08:55 +0530
Message-Id: <20231118033859.726692-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193935_816112_371A19AA 
X-CRM114-Status: UNSURE (   8.75  )
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
index 0892f4421bc4..66f3933c14f6 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
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
