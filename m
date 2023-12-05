Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A23C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLye2b+k+7JjecunyI2fW5vNYe8kq3Cn+mbWSDUCtHM=; b=d6QazA6ndntEL8
	b3mmzUG6g18RxuWHefaohW2ihyhBCN9rrwaqbSHg+UTqDx6s1sMpQZ9Oq7TThIWDl/fLg4AhVrRy0
	fEvdFwiIIjwLPdqC1c23921fsBKOlXwPgw4GJN1zQ9LN6weDuMM8JhU89YaHA1yaKX3H8t8NnIxVt
	MWuhb7Zoq/MAdxBUtB8fJRkcUGOcGuZG5rJlA8B6VTb2gUswCDNLE7fk1aIeYTkleIOczhaIE8Di7
	D9mL5MJNIExdVdE4JG8/12+0QlQ2BIoUlq5DRbeExn2pcgedSPjypGoayfayaytDcN/T1iwQcdZtN
	R66RSGTLfwYusVtQQ9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtJ-0086jg-0I;
	Tue, 05 Dec 2023 18:11:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtG-0086h4-1d
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54cfb03f1a8so1976924a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799884; x=1702404684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRw0KXpWF3PD2YzUN9JvnW9Ep67nDr8wRq9WIR/MR38=;
        b=FmRjm7pbNhmRWs6Daf/dNn4zI0ZpzrQ2llEjB8pM+pala4b1V/4oIRBQYQsuPKeABh
         +7EOmOCZ+yGhVYCrhiUG+3UfxXzF4Z81p3V487tByUU1bP7IVxSkBcx2iFiRKwuBBSV/
         lBI5HsoZ/rGr4iVQh+eGwrz1+XGCamaz/Vs1z79/H6oQYnydmN2o+UWjQfBCHTvgA/iD
         GCrPOpDPAwPjWEeqPZXGYjfU+/6zQmDl7blbcBIkignPoSOVOGWlR69E/EKgA97xwjdS
         Wide5Hja7ooumhfFqg1/zFPtFxucg0d7xoNRH6SOQG15tJCs2H8DqBM1r2hsgZlq6XAM
         8GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799884; x=1702404684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRw0KXpWF3PD2YzUN9JvnW9Ep67nDr8wRq9WIR/MR38=;
        b=VOf8DcrQ9KH2fsWq5voPFJpwVqjyOmKy/9Ev31nGnoOvddYL/JKbXxiVFQGn1RuZvK
         jrxQn8KetrG203ME1fmy5eGF8QMp0mLeBzUBduaxBjTakw4Zp1e+gofM8QxxfuurSdjk
         s7qmG1vYHvwe9cR1qJDxeFXP8HiXLuH8sEIujEnubZ1I0dbXHkEJS7DZklxWz/5NLLe9
         UHQ2+ZZADtMWKW3iJBess9N/4cuSEBxpklxDzSUJRUdd57+YsHj6SvrQPZnJSzlf+M5U
         dJ6he5qlSH2Cfhp+q5x4jC6Fnrn3/W+TU7xUE2Nw+uK2ECImABtwiTguc2uy4GX/wQ+k
         cb1A==
X-Gm-Message-State: AOJu0YxKcbrAK+mVnw5VUrtkrobORdJzD0TQ+fYM5v1vliAGjqlXjNWr
	NYArcggjHqaqEJ+UdNPvpl4uxg==
X-Google-Smtp-Source: AGHT+IHdRdiNB1/9lM/3ljpOvu3WCzaBOIiET8u87nHacNp7Cvi++zT4Z0+YHsCVKgXDNtECj1I7hg==
X-Received: by 2002:a50:9b0c:0:b0:54b:24d6:de03 with SMTP id o12-20020a509b0c000000b0054b24d6de03mr4556108edi.6.1701799883799;
        Tue, 05 Dec 2023 10:11:23 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n26-20020aa7c79a000000b0054cea9f91e9sm1386978eds.20.2023.12.05.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:23 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 02/14] RISC-V: Add SBI STA extension definitions
Date: Tue,  5 Dec 2023 19:11:22 +0100
Message-ID: <20231205181119.207204-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101126_572485_6D405F01 
X-CRM114-Status: UNSURE (   7.11  )
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

The SBI STA extension enables steal-time accounting. Add the
definitions it specifies.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 9eef25308d53..d88d4e8f517e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -31,6 +31,7 @@ enum sbi_ext_id {
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
+	SBI_EXT_STA = 0x535441,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -243,6 +244,22 @@ enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
 };
 
+/* SBI STA (steal-time accounting) extension */
+enum sbi_ext_sta_fid {
+	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
+};
+
+struct sbi_sta_struct {
+	__le32 sequence;
+	__le32 flags;
+	__le64 steal;
+	u8 preempted;
+	u8 pad[47];
+} __packed;
+
+#define SBI_STA_SHMEM_DISABLE		-1
+
+/* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
