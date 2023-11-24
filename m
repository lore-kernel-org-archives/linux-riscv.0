Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E79C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNT3Uew8vqLSfI+na+xDLS94CsMeZ/C35pUybSyykFA=; b=0m3CJy/UOsJAvw
	aT08yHNF8hE6wGLZEYHr1RlHnqlZJ50465qMolW7nZP64enu12+DEdZJ0KogiXzR1BbIlYDufk+46
	C41FRpLnCtmBIfHXVYQ6LqHvMr2Sv0phsmIFvLXjRPr9F47V8P0jYeTUdFwIG7TznzNKF/p2XkZgj
	6w5oKZxO59dE8PDHNQ6FRuA9zxo/ptgQlDBk82PtycehQUs7U6WZlP5AxcZOCB3Pw3yZOHlKNiItM
	HpOGbgem2/OsRDRVcyUwFinFY3KzI42+fpOtUzeJFvS+GbhPU9DVyo6sT+d/mb8WUiwKGsLl+Zp7+
	ty42d8nMm/TJ+4nFdXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKe-006LYn-0j;
	Fri, 24 Nov 2023 07:10:32 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKb-006LYK-35
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:31 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6ce2ea3a944so1010367a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809829; x=1701414629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=SKwhaER7g4X8e3j+46EhlzyYAkZRaaP5d29FBNzB7a5Tk8V/8WFIKeA/5kHuWH2GTn
         z4S1BUxVwS07HMB48YU6isTJx/4R7WpWChqO1iDUi0+M6tWIFrtWqvAuRxWt2s8xS06X
         TkEWOPbrHUrmLjuxc4uvkFRcLKd6TcPxmQ46PBA0+fXmoQmXD/50cvQ3z34keg2BfadD
         Vm7j4wpFI0edSGA53/DAEg5ErUw/e+Bomi/80HJ9um+WaiE/TQtVqKeIeVtZWEU9Hm1T
         CcERwl4ermPChcv4si2vXfWv8Ti2/BVLS3JngFyg66MeU0ssyRaopLGPlPojwo+bQPXK
         +vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809829; x=1701414629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=ftRb6a4nc+YMtx8iM6eUV7JW78v6Rbw1UL3ZewzeoqDVu1oDl88YMUvid2X/3AopBN
         1VnEEJp1Pc6k+L72PtY+yragMRi2Iat5ZPe53ubdE0Se8paVKA1wLaI/eD7Fw8pmLIX2
         wAZ0UFZTKJFksk9UVueMQiJ0WTT+nPwJ2L5sSLJ0wPpU60xvpUYshdzlESVxpCoW6IAh
         rUrI45cj0uBScvcLQm1IpXsDFY0HS6VjAv1rTBZC3pgvcn8ZrjLEQy17vMQqzbkSr0L7
         uQYN6Y2ITnlfLfYnlvEQuRoKhd8r7Aumb4D0H6390Y8zMVx6DMvUBc0S++afFeLsjqb5
         E5kQ==
X-Gm-Message-State: AOJu0YwBHrONrzjXGYaIukjzOC2Zh5tUzee8DwCbUrzCkDZU3EhQYDTt
	F6QjBDY9ct5bFWqZMxKvowPBbA==
X-Google-Smtp-Source: AGHT+IFcPdJe1/+ZUHL4jSznxzi4QTW1Nct7Qxw/93cKKbEqCPdbOrdVTAgRyzDakbY8JJUSxK2OJg==
X-Received: by 2002:a05:6870:d8cb:b0:1e1:3ac9:bc14 with SMTP id of11-20020a056870d8cb00b001e13ac9bc14mr2262118oac.30.1700809828736;
        Thu, 23 Nov 2023 23:10:28 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:28 -0800 (PST)
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
Subject: [PATCH v5 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 24 Nov 2023 12:39:01 +0530
Message-Id: <20231124070905.1043092-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231029_990062_AE4C39A5 
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
