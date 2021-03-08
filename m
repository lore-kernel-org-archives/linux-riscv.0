Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FCCC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:59:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D143764FB7
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D143764FB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6B+T0edBKn/UHcI0u2jU+kDeWb5udMMde/t0U0luj4=; b=Sh8IXxnZUSfExCrypBrqQOg9ul
	x60M+xhHcENcTVHDLd9Dpn1plg18POmrxzDFqzwVTKnlfkTqPhj8TeC9qYmjY3W8d9d48Kbqaa7bM
	DqxrvlLyiQlLCsV6zWvwtQgkMRkxIfknEJyn9LRk8XdeAKJZjRhuILQBm5sR0hIPS9yxnF5Twrtw6
	VFdcvrIpcPALKVyCYNxKaAD89ap5V1AaCY2f1/CNchP8FPDl0tJllIU4AGZiFFHnS7GeisYhRpVnV
	Xe4HBDJMwH9epYQqfuRmXD3CDDVZq0ByeCLKoNy5o9JlOxmcbhQnLx3/qJIsSUCDBx9c+Y6aYeuH8
	bkJ96QfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ72d-00EyjS-7D; Mon, 08 Mar 2021 03:58:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ72P-00EygO-1f
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 03:58:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id t29so6187535pfg.11
 for <linux-riscv@lists.infradead.org>; Sun, 07 Mar 2021 19:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=99eTKgz/n/sdOZ+gNbbaAvrr/ds56SwMbMyqYHzhBxU=;
 b=PHk76T8egbvDTuUGn1QEQ4qA4U8m7nSC7KwGAo7dxj2QzcDTm/Bx5hXJlcir1vsThg
 nknT0mcLr+TeP21jDTSqGWHX/dyhmQDukwwzG6FHhkDlKcjwuPIbf/7lOd7j1tBwN1+1
 iNkqNN8XJe1luI0jwJtlfkhlLJrCMGkJncnu+pD+eINx5q9Sv3K8mTQ9U3nrt19A7DGa
 LcoA3MfVpzDUj9eUq7tgdmULkGyOP8+YriJUjMLCtnTKg+bOulKptKTgnFTu7vfa0C8y
 J+uqkh6zRN/vaiTYyyMFF7dHWVZ9QvLhHhrTH+Bvz2BGglMnBbW6/S9svZL1PiYH0ruJ
 ygWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=99eTKgz/n/sdOZ+gNbbaAvrr/ds56SwMbMyqYHzhBxU=;
 b=fYc6Ff1fd7rOBVPAAANiUgHFU7mWHiySP2ExYlvcPZWZ8DXv/7MhbtbDGcwipbxjyr
 aIKauHHZlTBb9KK6XQR0dSxI04dD6MyQieccozSMW0kXMXgowCz9KtoTERI0LlLfe3GR
 VZK4H1uxPT34DgL2bXUKrItOfFlnKI8aNCiLz/HfCrznHbfr5gmcEvctmZD4YHuUA8bk
 LbXmv9lznMevf/ATxjivVXV0Dwum49mzjAp2oYHfB4CQDXJyk5r664vyzh0O7UGX4GNG
 gq9AlBKo50up29OGliQokhwwUfYuJ7C8QbKbMC3r5es1393InV58iaCfZVuDpB5Gptma
 s5nQ==
X-Gm-Message-State: AOAM533pokHbiB0D8Jg8Yz/WTh7dlEA92zwjtolE/MQZoMFSSD80CW+v
 ABVc7shfPMgLdJDm9TliMP7PGGGOGqxw6eHV
X-Google-Smtp-Source: ABdhPJxHAID2iZskDJa6ozwmMp5+vVXr9zKpAGq2zASlBdwv2mMOIs9DUZx22hHG7di2h7gWCn5neA==
X-Received: by 2002:a63:dd15:: with SMTP id t21mr5738567pgg.23.1615175911473; 
 Sun, 07 Mar 2021 19:58:31 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v3sm8394307pff.217.2021.03.07.19.58.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 19:58:31 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, atish.patra@wdc.com, anup.patel@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC patch 1/4] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
Date: Mon,  8 Mar 2021 11:58:14 +0800
Message-Id: <1615175897-23509-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_035833_527875_FD32D4E4 
X-CRM114-Status: UNSURE (   9.47  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add 3 wrapper functions to get vendor id, architecture id and implement id
from M-mode

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/sbi.h |  3 +++
 arch/riscv/kernel/sbi.c      | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 99895d9c3bdd..94a7f664caf4 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+long sbi_get_vendorid(void);
+long sbi_get_archid(void);
+long sbi_get_impid(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_clear_ipi(void);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f4a7db3d309e..33e3a9d6efab 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
 }
 
+long sbi_get_vendorid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+}
+
+long sbi_get_archid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+}
+
+long sbi_get_impid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
+}
+
 static void sbi_send_cpumask_ipi(const struct cpumask *target)
 {
 	struct cpumask hartid_mask;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
