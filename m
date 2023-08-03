Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E41C04A94
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rndzeg5n4kzBwGk0QqSLLjHTJZ0Um2wDIBv87Wjiqk=; b=N2qGyK749Vvmc7
	VBxXwW0yIvFW6UXwnTgsDolWHpPp0JxHkch0Wlc3YqCau2qBYswpYWjUh5mcTXYV+fNyn7+K6YnOw
	pjICIIdAhzZO1iMyDvzyx18Z4g+/MxZTwB2rzLMndoUsDJS9Q7rEdl2aJKnHyxjp+rQ9UHJKDXtdn
	DoU7okXdgZLCZGHhBT4NrQKu+X35+A9THJnHGZb6jY+z9ldTJUVGptixmDosJdblrValC0Oky0SjB
	GraA3dwoZOJeQNpX51qu+A17bdZxvBQrLTGDWvAl+4XkyunSAh4IS3rsn2Qd5kz7cjs5kjAkQ4KrS
	HUm2GqXZtU2NXINg8ASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsr-009MLH-25;
	Thu, 03 Aug 2023 14:00:57 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYse-009M0Z-0o
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:50 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-56cc3453e31so624421eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071241; x=1691676041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=VkKL4SWpN8H1S05U44mEkQoz7D8we329L1z3V6OpzGmXL1JOMTWJV7E6MIvheGbmbu
         O3TT6cc8d89JSEl8/0y+hznZ2P6tP+P1yWupO4nBDfe3Q+FWN3uj7OwowwOiClEj7ZuA
         kFbJ5TEcNngQKU+P1pRhEyv3kE8YYUaPYYmVOSySImOEXEx9lNpTLYGZX8sGMs9LCsv1
         b/LjWUsKKqdGBdWFeSJncHoi/JqicC0TBqqO765/0PYMyCDUhND/b9Wxm36UtNh1Yonr
         2Zu24pcCNb9kmPJY7xGNO6KB+977IRc6w+6KnpsMHJXUL45sL1Ju6s8Pkk0XVczXIbmf
         5Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071241; x=1691676041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=lEwdrNpLi023TrqWqlBwvvDQcSn9orHC1ssd0XKdVTWHzAwaaLbY9SAvyxOWvBitdu
         F6O2SoltrRPouACMe/TWMijKjA81rlR0obm06jOcwTVOhVDANSzn4Ajm3XEKvM0xqkR/
         zdKGY21+bNTwjp0BnWhICzSmutgimInHpBjzrwoIgtcKTz/sRR2dwxDX4FFiOWYFC7cr
         S7xo5iiTS5NA/soZsUhLX2foQ2rP9BRB+JGNLKGfLCrl6cPyUTbv6YZyWAaIYaKiP1+E
         dTto5OakSn9W71tTI8VDUizLv3wk0o2GjSO1YHngrRd0SvzSkOuvBkvOBxg6REqUOBam
         6BeA==
X-Gm-Message-State: ABy/qLa0XIGbtQEj9KaLmdQMtX7BagVudNYh0pI6c0MTMlgbQTo5bCEc
	MW2aCtYL5tnOlMeuy4E5mYs+CQ==
X-Google-Smtp-Source: APBJJlFd2x74atNXWpMe8rkpTEAS1KERwXNHpEJ0ZOg6dDJ2zjyuV432rhbjey0HbZ+Rghnf3NT3UA==
X-Received: by 2002:a05:6870:d251:b0:1ba:66c1:da53 with SMTP id h17-20020a056870d25100b001ba66c1da53mr20590605oac.22.1691071240842;
        Thu, 03 Aug 2023 07:00:40 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 04/10] RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
Date: Thu,  3 Aug 2023 11:00:16 -0300
Message-ID: <20230803140022.399333-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070044_353650_AE8A3AF8 
X-CRM114-Status: GOOD (  10.22  )
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
