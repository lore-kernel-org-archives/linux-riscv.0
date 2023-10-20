Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E8C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wdMeY9cFvHnJWxQMRCA0B5r5eieNCS4YpHUxu11EMM=; b=aSS2WXtVKGnw1L
	Cu3IV30xssK2XkIAoFznymVIoLfPIUaDiH5Xhg7y+UM84LWM9VXF3ywJLI9GjFTq0hdF6OKuNEkKs
	vJe3IitEFOClirikbPMjtQR6wZtbTqQCRWg+qxzsj8jMDivfuH1F5jsO6uu4GDm9lSluvwKZ927fi
	DNdcfaup25VpIRZGll0e2lQWfE5V0kU0QWaX+qbSUSEkNzsz/Ua73xjroazlKqNq0bbnwCpveLMn4
	uQoMraYElHV5FjUWzNoVrspQVGh+LvAyyqYxLbncj4boKn/d8qvE/6nkYd+6HW3RsJHzDmPgq+8ev
	6o3V56wBbU4wlz0ADtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpv-001QKU-0V;
	Fri, 20 Oct 2023 07:22:23 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjps-001QGG-1e
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:21 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-35748b32d73so1841575ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786537; x=1698391337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwlyMPcz0zqeFoKpmeSvnyAhcAgahoPS/k2EPhyd9Ww=;
        b=LNEP+bTpC093DJS8sonX6gQ7hZBexK9o7735+S+gxR0VgCO2dhfFwHKJ7B/mWw47DN
         rkVURvaS0MwaEzahIHvZML5CEokT9pq4Bo7RZeG/12f5x6t7/bi80h7o8rlgrA5xu6BH
         4mvu7mid3YSaUbk+iQvikQtJ01HVsKVz7Tcywd2X0Ge+IUglji9wh8WpKqzAXEPrm3jh
         wnE37fgII6KrXK0XQzfyrGzeJxaqMS+dPNG+F0Izqg1EG06lQFlsMxkw7j+eMgrdBLn1
         YosolcbfmhkzY/MG4Lgsvod3aAZtbfLRoSG8/MS/uby5nut3yiFvjSkjJcCAnrbHUd2H
         UpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786537; x=1698391337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwlyMPcz0zqeFoKpmeSvnyAhcAgahoPS/k2EPhyd9Ww=;
        b=VXZ4BSatdyICfYzlmtnJVerUGyX6pbtTX+EgxdOylMkx57qorep3rL3JL3NBOBa0b3
         5zoFB/27QT3ERc+X6tnhFo6U4F9RVv1WVOArBc6yOcvj1u5SmEaMZnaoCwozbpSQUnAy
         jDn2r2Id6bAI8xq/JnuXvPMiI6CUe9tsmYINy7kHRrCIwLq3L+naryH+SgWLaKSjDL99
         xDumCmqK/EulLRPq1rtnvtUA3OZ/1SWiJ+eZHesBWZaflYltZuC0ID21awPBFAFPkBPf
         nl3WBjhTbe30/Q3bF2nPiuQVfm8wQLDnhJoYcZnjZqCz5izSCzVAKOgu+um7ajDmXjO1
         qShg==
X-Gm-Message-State: AOJu0YyhO9MYM00KE9lk6j+AmhT5JYsvoyV31aFLsPWKeaB6cxT4i21p
	nCPzDQ9MUNYggsfVUl7P+haLTA==
X-Google-Smtp-Source: AGHT+IGxC63+68DtxcLP2NLHVLlq5o7kgQhRaiJb+wOy0CTSQu3yay0cbuJzx5Z+DRUCCNZLZovnkw==
X-Received: by 2002:a05:6e02:1748:b0:34c:e16d:6793 with SMTP id y8-20020a056e02174800b0034ce16d6793mr1508711ill.14.1697786537209;
        Fri, 20 Oct 2023 00:22:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 20 Oct 2023 12:51:37 +0530
Message-Id: <20231020072140.900967-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002220_547036_51C9483B 
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

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
stub of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 12dfda6bb924..cbcefa344417 100644
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
+static inline int sbi_console_getchar(void) { return -1; }
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
