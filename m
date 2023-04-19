Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD0BC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQtoLmHK/P/wqRf2ZKY1j/Xfa9RUdS4RrN/MzKMAT3A=; b=rNFB6IVD8/Fk1v
	Ydx7VuKrtLx+oE1ZQKZaJPjUpurAj/vACvb/wSJs4FbOrBZ3rfGdi0kqEcqTWnruWhOiuU7Lr8kfP
	iofQ+MI9k9XsqvnPE0aOVKKwFjuK5lKzjj+7DGyTz83J1pqh1R43JU1eJqrJjPzpetlXf4GEDE7WB
	8lxVVQZHxmKcpgP4nv98Bf8Jnf7M74JoncIIJ17Zg9uWw7P566cmA9uWCzPTsQ+XpofZOJyRF25Bv
	KrNI6oyQi3hbzZZoTuIZyrGdXhr0uEK5xPxSl+TefNF3asOK0x6YWBf3baUJxapyhwa/opqXYvP18
	THlqYTjOokZ23S12SvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGGk-006VPZ-0L;
	Wed, 19 Apr 2023 22:27:18 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGGh-006VOo-1f
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:27:16 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6a5f21a0604so274283a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943234; x=1684535234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fg2apWNkO7XMTsfLYU3rTZlWorsx4wHesUuN9ZGrN4=;
        b=ItoVYcTFBf7zsnYDoxjd87iRY341AJI6ZgLW2Lf5PDSjv8cy6mqUqNZLI1Ulr8gUJ7
         q/yAUjrCoP+vd9RPobIMZCejLwg0K3m0Fzcyh/bj/ymObZHv6H25k4zWUQ35MdBGioWB
         TKpfwDBdCh9/VPa4ozbJY5z9bitXy7OYB/DmEqISYDBPpBu2/8Ji398y2Zxv8jn/QYYE
         5aFlsJMlKDhamnuJwxLiGxMRu2NB/gZyA8P8X21MrEKFXYAq/aOX3vMIyo9buRCJQo8X
         IH54PpjgTxuyrWPAzjqy02aKjtEcSIeEKSVnMZs0ZjYFU6PJblj36f3LE6/NBmKo03Xq
         8bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943234; x=1684535234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fg2apWNkO7XMTsfLYU3rTZlWorsx4wHesUuN9ZGrN4=;
        b=LLlPD7XvC0LFOesgYc0cueoduEbsvdKUl4yFlLlSDNTlA7broM9eSfbWIGQSJOuKmu
         WOUvQa1xE9s0wnOsCEj3mf+LlEjr2s6bOn1OSh5GVGfMV5B7Fu6MMO08miT3n60D7/3u
         nt5geOSp68AfJOVHjoTaudm3A0VZC5yltvmrz7RIJCmCl4f9N6nkrwq7KdsmVufjhtb8
         7CLyzx8+j/Zhw9aBTkIf2DQVmTcaU0fVjoQbG7im8wvZ5BFf+pipQPzqAKTYG+x1u2YO
         qw0ph/CdWwXIC0o/QIvi9PunUwaXLnf8nnooRDJ/S6avrHPqhCe/klWXI5jCeqj8jYDQ
         9PXw==
X-Gm-Message-State: AAQBX9fCIbW5E3nyL4Oh1gfRi2qZrDIQ1Bd1KKFcokPGT4bzhOhlgau5
	sp5wqFZhW8TF/U8nn5EzMA3KJv3eBJQr8o+M5Ek=
X-Google-Smtp-Source: AKy350bcbgE/EJ3Ej08OUUDHS562dStL1nY59dRLyQva3UBkO8qD2X/slMFNk57ZH7aSQKcUf51qPw==
X-Received: by 2002:a17:902:a504:b0:1a1:be45:9857 with SMTP id s4-20020a170902a50400b001a1be459857mr6646673plq.1.1681942754165;
        Wed, 19 Apr 2023 15:19:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 47/48] RISC-V: Add shared bounce buffer to support DBCN for CoVE Guest.
Date: Wed, 19 Apr 2023 15:17:15 -0700
Message-Id: <20230419221716.3603068-48-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152715_552952_474EAFC9 
X-CRM114-Status: GOOD (  17.35  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Early console buffer needs to be shared with the host for CoVE Guest.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/tty/serial/earlycon-riscv-sbi.c | 51 ++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 311a4f8..9033cca 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -9,6 +9,14 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
+#include <asm/cove.h>
+#include <asm/covg_sbi.h>
+#include <linux/memblock.h>
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+#define DBCN_BOUNCE_BUF_SIZE (PAGE_SIZE)
+static char dbcn_buf[DBCN_BOUNCE_BUF_SIZE] __aligned(PAGE_SIZE);
+#endif
 
 #ifdef CONFIG_RISCV_SBI_V01
 static void sbi_putc(struct uart_port *port, unsigned char c)
@@ -24,6 +32,33 @@ static void sbi_0_1_console_write(struct console *con,
 }
 #endif
 
+#ifdef CONFIG_RISCV_COVE_GUEST
+static void sbi_dbcn_console_write_cove(struct console *con, const char *s,
+					unsigned int n)
+{
+	phys_addr_t pa = __pa(dbcn_buf);
+	unsigned int off = 0;
+
+	while (off < n) {
+		const unsigned int rem = n - off;
+		const unsigned int size =
+			rem > DBCN_BOUNCE_BUF_SIZE ? DBCN_BOUNCE_BUF_SIZE : rem;
+
+		memcpy(dbcn_buf, &s[off], size);
+
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+			  size, pa, (u64)pa >> 32,
+#else
+			  size, pa, 0,
+#endif
+			  0, 0, 0);
+
+		off += size;
+	}
+}
+#endif
+
 static void sbi_dbcn_console_write(struct console *con,
 				   const char *s, unsigned n)
 {
@@ -45,14 +80,26 @@ static int __init early_sbi_setup(struct earlycon_device *device,
 
 	/* TODO: Check for SBI debug console (DBCN) extension */
 	if ((sbi_spec_version >= sbi_mk_version(1, 0)) &&
-	    (sbi_probe_extension(SBI_EXT_DBCN) > 0))
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+#ifdef CONFIG_RISCV_COVE_GUEST
+		if (is_cove_guest()) {
+			ret = sbi_covg_share_memory(__pa(dbcn_buf),
+						    DBCN_BOUNCE_BUF_SIZE);
+			if (ret)
+				return ret;
+
+			device->con->write = sbi_dbcn_console_write_cove;
+			return 0;
+		}
+#endif
 		device->con->write = sbi_dbcn_console_write;
-	else
+	} else {
 #ifdef CONFIG_RISCV_SBI_V01
 		device->con->write = sbi_0_1_console_write;
 #else
 		ret = -ENODEV;
 #endif
+	}
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
