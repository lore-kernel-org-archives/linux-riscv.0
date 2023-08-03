Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96CEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rndzeg5n4kzBwGk0QqSLLjHTJZ0Um2wDIBv87Wjiqk=; b=vrp3kzmz0YMToP
	hYLkBCSobUPsaI54/anziUBizLp851SyzgZ4IT9MnZvxLv+VXj8jY2ognkzPgiFRJWQGmTKkAcHD5
	rlgb0CgtFOD3FtrMdyrSM9y2Ead74QmDzF0mKVtd1lkV8AKYEBH/7tMaqqWZ8PJPHgBNfFsJCv7aS
	6wjrqu8aXSE+jYKG41cnWMqavlWwfeIqILegN2nYkHHIPlzEt3FRN+vWXiBC+fYY+F9H+67nfWIi/
	TgKXXCytBawn/kiK5UCuSQ4N4Zh9zFyho9UKP0/QyVGexnHA+2luj6StQOrNBg2oynracLfU4eSON
	uEWxUyO8aq6hqiBecWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGP-00AKcB-2w;
	Thu, 03 Aug 2023 16:33:25 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGM-00AKWO-18
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:24 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bb231f1817so928098a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080399; x=1691685199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=layCgJMKTMdCi6CUwpGdosiF30u+gDMVAdsZicD45LuGPmu3PhVeuMEJrwDZikHCtY
         EtTtmqb7C2PaHl1fI73JUHKLNRChtqT12pdd82mW5dNPh/3mKpRlTKZ2/livS7Q6LaG4
         LNh1FJ911hXWY+2HRLipzSeGe+ljI/mHCIltzEsUGGlDMY+QPdq/dXsKlN0kTezY6xVk
         tigGCb/4o2r4pQJo2q+eRLeEqmJeh2Zzxsjsam74y7Gm+ssjSi/wKl1BoAwkMGu7fcfk
         f9U1nYn2rPLB/TurCeF8Fit9kMuuLkpon/D/6/YmFiskWAeAXANYohA2ypdHxieUG9XT
         KOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080399; x=1691685199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=AuMnQZxgwqKDMPvFFsPAHjFW0BUapL3U5af9BdrQQTmkMcTh5nFhuAe2z03wNCWOVg
         RQeHIrRsaPTpVnd+KL3A1xhT95oy6tuSrFkykxlLJx/wO5SRrVzYuColVBInC/eu+cjL
         Jx950Yrm1hpFDXzaMg97BJxPe2mSc3bi5hY+P4c0pnH5qIhz4McV0e6/zb4bBNSkUu51
         k08jMXA0v28K3KJDRgO57IHJpT0rkh4cPM7INzJNOnvGWFHuC7GCqZfgEYY0JQCvnK8s
         LRDdgtHJ9htnc5gdse4x6x0o9nKj+yWZfV7ELI9EjTk8tCL1mNQCK80zBs2GBAarhWe+
         HA+Q==
X-Gm-Message-State: ABy/qLYYkxcShCPlpjrlCxJ3BtIQtruPg0Dhe/wuO4E3Wo6lws1wqnus
	HlrhQNUa74cxvlQ1aKha30hMMg==
X-Google-Smtp-Source: APBJJlG0rs3nKhuYYR5c82UKA4Dk+/x0du7zwqROz1SCshYkrDRGHKOreX+5liY/Az2sNnl2PH+VLg==
X-Received: by 2002:a05:6870:a90b:b0:1be:f721:db04 with SMTP id eq11-20020a056870a90b00b001bef721db04mr11116042oab.4.1691080399322;
        Thu, 03 Aug 2023 09:33:19 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 04/10] RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
Date: Thu,  3 Aug 2023 13:32:56 -0300
Message-ID: <20230803163302.445167-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093322_451852_35C50850 
X-CRM114-Status: GOOD (  10.11  )
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

The KVM_REG_RISCV_TIMER_REG can be read via get_one_reg(). But trying to
write anything in this reg via set_one_reg() results in an EOPNOTSUPP.

Change the API to behave like cbom_block_size: instead of always
erroring out with EOPNOTSUPP, allow userspace to write the same value
(riscv_timebase) back, throwing an EINVAL if a different value is
attempted.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 527d269cafff..75486b25ac45 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -218,7 +218,8 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_TIMER_REG(frequency):
-		ret = -EOPNOTSUPP;
+		if (reg_val != riscv_timebase)
+			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(time):
 		gt->time_delta = reg_val - get_cycles64();
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
