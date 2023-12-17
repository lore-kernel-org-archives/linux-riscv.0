Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBA5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVDXiR/oNriQU3skgtcIZX1hyKN+/hVRSveGLa0ShOk=; b=Z+0zQmmsqCYeeE
	0E/g3ikfzU3YCJAUV6Q0HyfkY0GTKBM9fchJ7OMfgwEmcookWYdbCGQelsyjT2VGSzC6Pw2+3Lqjj
	7bZJ2fp9/YtDwbY+GY5JIASxN9mek9ooRpRLdvmf5CCa2xF3xIptNlXMXtBASBEl2O7AS0AF1T3YG
	Gp71qK4csm1+wbxKa5FZfN89zWNhs6FvVbXc1YaUpmtrzMZQ9Ub20BGv82nAkkM1uSoQVtAvs6jlH
	HUoHWBnENBBUB7AWO3FRhRc2KJLQt/IBYAw+xmYvosDGH2PhfxlewTfp54w18Df1M1Gb6SapYAdt9
	3Rgci51i4dpOsMSTARKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwC-008Pze-0S;
	Sun, 17 Dec 2023 20:40:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExw7-008Pwx-0e
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:32 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a234139b725so78769566b.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845629; x=1703450429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJEKgoCl75+B888vMMMdWTo7SEi5lRuwQ/RrT7Q47BA=;
        b=Xz5BlFw1f/fabTGbnF5hC57ddwOafGva7AjmxMnxpPmeb3LWwZwd2HJDCn/KzYIcU9
         HaZJY3xhIRunmmzNT5c5aa4Rlssw2TWhrTXMiCswj925bRGolGZ9Jwv7LQ1ogxQuuVwx
         C4pr+toXqbkG5fSK2/lI8WLlMqdSf1ydFr3/Txvks6S+75zaTZGX7EgO+XQUJ3lgrXaG
         uALCaEZQyDEX+vioPRm9YNE+zhczXzUwuqNeZkeARDKQm1fd3e2Txo+h+mgykw2K93zg
         Pd1sMFBd1HLd2jYmf40ybm+tKUtwpX+iwtjKIPofMXjUt4LrfHvq1MGbjfDJJLOi6Hi2
         KnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845629; x=1703450429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJEKgoCl75+B888vMMMdWTo7SEi5lRuwQ/RrT7Q47BA=;
        b=w9XVV+XrLYxcjv4WXCkP6btBKQY7n3deuW3AYulCEL2tfcWnzaZPC5MaJIBdjcHtg8
         s7JYMmvwkEwSg+0o6RPTIriIzBHm1xFWZd9eTjG52N3geyVnZKj5bpLstIMPrI44YTfJ
         0KRc7udae4QKbMHyNHgubo+yW5UfVDBHEZFzwPPaRB2pngHNlWFiSBUABaFrX1K0EMgP
         x9/BL6+nNu5+w37q9PUjgq4hYGBY+fheIcoiB8hgnNcBMPvawGFURYDup++ZNfPuZVli
         0W6jXBsKG21+rOZ37MnwixiVnj1Bm5XGTv9UG5UPp9rTDrUUTG+DR/Mta8vPRVO/TQQh
         ClpQ==
X-Gm-Message-State: AOJu0Yzh407DyRcV/8LImwLFnRheDKG/L4waXaFvMLu1Yesp/3GLrZM8
	9CLtBz0VHyyvp4e53C+/iYsaUQ==
X-Google-Smtp-Source: AGHT+IGmIBlpFS+9pHcXMz1NvZF5Zb3Lg/gBLV72EKrLPU5g9c/YVXCXhRKKEe6j3IvX7UWfl+4alw==
X-Received: by 2002:a17:906:4a5a:b0:a23:5332:d22b with SMTP id a26-20020a1709064a5a00b00a235332d22bmr185786ejv.244.1702845628675;
        Sun, 17 Dec 2023 12:40:28 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id fw10-20020a170906c94a00b00a2349073119sm1115090ejb.134.2023.12.17.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:28 -0800 (PST)
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
	conor.dooley@microchip.com
Subject: [PATCH v3 02/13] RISC-V: Add SBI STA extension definitions
Date: Sun, 17 Dec 2023 21:40:22 +0100
Message-ID: <20231217204019.36492-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124031_241395_F8C10C52 
X-CRM114-Status: UNSURE (   7.08  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..b6f898c56940 100644
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
