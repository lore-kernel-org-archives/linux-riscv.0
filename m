Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E3C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73D764F37
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A73D764F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKQ0a6cV2FnY2QYUkFZNNxCyZuhnUoL+zi/sN7PdATo=; b=jj9dP6aK//V/IbIO+cDF5CZAdA
	GUDYymm62aanHoXTt5m7N9tMmPPFNcZUmaf1uYm7IncC2/18A6+ufrQvvDwWqR8Nj6RTBLujC09z9
	IUpeY2R/MQaJUckPBJTalBIwuOei47khqpGONwjZb4oSnPPS5RXJqv4toYbtEJREOKycTuB1e7EoG
	h4V3WprXwa558Xf+FMsNsUiuxMgwOple2OBXwOmVvRDCQvR1uk/cqemjuaUXASZrDPHReHrnv5swr
	zM2cIHooOyDRZZWBwxvKj6CySBH5JJAitRaAAyFeSOozEsLXfU7Bht5mjgHtKpsLRO33PdPWq7qDI
	mT08af2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSZ2-002rNK-AF; Wed, 17 Mar 2021 09:34:04 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSYv-002rM3-Vw
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 09:34:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id j25so705969pfe.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G2PpsO3+QYNmV2NZdoyhyVzSt8nfDVCkhTVu1JW3oOQ=;
 b=RF+A+RxVrUiIrc73j009SnbHiJ0zxssxUdQsSyDZyCdDpZgdrvWv19sfKy/LAAtCE/
 Sm0ojvSmdp1NEY5g8j3m/dZ/OtPvcbjKOEhAKlS69Ir5lQRcShH04IVBdGr+ORKmiEsu
 IWDMsvZEz6mFua8Wdd0HOZa6ognLLHc3zziBUlbrzgY2jq8ggOMO9XSpwL1SRmrT4ZpL
 Q92HCNHCNRimSBTh8cVAL3zz5ICj/D6Aei99RSDMNOoXYUWzCJcOUURNVL6VlIclj6Cq
 cY5ZSQhpVbZubzbxmcgsAa74N93kE0S+skX0mgFfd/WqbaihPghj+7bvHDVJGybxZN4X
 79tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G2PpsO3+QYNmV2NZdoyhyVzSt8nfDVCkhTVu1JW3oOQ=;
 b=iYVmt3zjRsBfwnBB8CERoxBQyc+uHqIqu8lVf0MLgwPQx+1ClHVdTZrUyCcl/4lW8q
 W7x7nM8+4cRe+7I5b6mMUJSdeZojuyh6WhtjSejwvaGjDCRoqJL5CfcUeTpvvEWxsCj+
 h7LTrHv7/tc7zLmax7sK+SYsJWF0OeyKeNdCbWEbF2vpH13PtvY7dhB+ZXP/lbH1tqu3
 n9UCqhrT6NJ2vrYdDXVoEXmIU4lnyytLqtbLrVR2dK2c/DpBRSnflg1z2QtR6/9bIMT4
 sK4Ig38W/19XC9i6/a8R5GKski6YUIuHswyD+oErpiUyUUe+nismSB7nTFpGVWGzTyY1
 7MdA==
X-Gm-Message-State: AOAM532dueU+KD++SFfX99Cp8Fxy1Wvc41xEE8aaN8xFuWSqxSBBB+iF
 OmaVxRo7Ok5bOVLoLblmKESw0/VCvgtQDwWB
X-Google-Smtp-Source: ABdhPJzFc13xg72iUoFk9LowzvqJ08+fFuraQzWM/BBeUVGPF+bIAi0uSR7mo9bi5/t1Bcj3+SGJug==
X-Received: by 2002:a63:5461:: with SMTP id e33mr1867710pgm.63.1615973636348; 
 Wed, 17 Mar 2021 02:33:56 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i14sm2149508pjh.17.2021.03.17.02.33.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:33:56 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 ruinland@andestech.com, david.abdurachmanov@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2 1/5] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
Date: Wed, 17 Mar 2021 17:33:29 +0800
Message-Id: <1615973613-22364-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_093358_137485_85500C74 
X-CRM114-Status: UNSURE (   9.25  )
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
index 99895d9c3bdd..dd2329962ceb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+long sbi_get_mvendorid(void);
+long sbi_get_marchid(void);
+long sbi_get_mimpid(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_clear_ipi(void);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f4a7db3d309e..ead7e3fec104 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
 }
 
+long sbi_get_mvendorid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+}
+
+long sbi_get_marchid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+}
+
+long sbi_get_mimpid(void)
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
