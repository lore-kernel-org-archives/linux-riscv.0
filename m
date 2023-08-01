Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C36C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rndzeg5n4kzBwGk0QqSLLjHTJZ0Um2wDIBv87Wjiqk=; b=j/TYwMHwmCDv2s
	b/0eWqk0aO01uwYz5Ar440pEsWzb5fVlYLupRphYqhad4z0LG3lQJMeWcDikvmvSvIfgY6XUwREXu
	k/R7ZUUxLVd7aBS6OwXjhO0mXaLE4eYupMmj312ZfhdZXRfGmeR/lx97qkgVvNZPapdEOdzxAswAG
	fB4W4ITQtKyQ94W2K5m3qjITGBtXG7Y5lPmU+FkicE/L6x6LUg5BRB2+0dyrU8GyHoJBt3ex1fJpl
	M8BN+QHx0+gqD9qBEUzbkqMPQPs5kpygENymp6jiDdv6gARbeynORUGy1A9ieuEedt9gdWJLo9sU5
	37oX0kSOdJ3WjbwkS/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpL-003Qvu-2W;
	Tue, 01 Aug 2023 22:26:51 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpJ-003Qr2-01
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:50 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bc93523162so3144300a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928806; x=1691533606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=di5SkeicRbmXIcOnY2hN20hVOPJQfmwRGNAJoH5+d+qNpiwhIyMqpN5ANQLK6ntmdT
         TtESBGIrvbNnSaLMcAl4oGaHHwcE4pAWpBW0p5Pvj2gOS1T4FTzKa87WPCOa3/cQyqF3
         4p9o7vX3yPG1q2tYdUrUsjgxYcvdg3tU1eSn6DOaij9S2nl0MU/bpgOhiL2yaUVyPciF
         zqv6MXwvcaXud2GbBMFMSL3+19S5+Cd27+qjGTb8C0LW/1LhNb1r8oWoT9bsZiDyJwHX
         +w8RrTx3ZlNARP707X3WpGb/+kfrh2LzBNlvpq/XV75UtV/2jD9vAcMBzlmDtOOgYg2p
         9nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928806; x=1691533606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=HReHYbhUgYiQrwj1ohYwDW0WO/mWlNN2Q1Z1DkSftDYwhtsqZ0O3DIUkhmgrPezwoR
         zfGrm6kbYhFpTopdqRy1cklfi74kNkLSRC5ABGf7xSMjJ8C8PXuPkwNvk5ko6XD/forx
         AS77rl6JX/M8aM2dcobD7XloO6IQtJumnD/ugG80APT3WkYuDP2oybx5pJyNaXOFdv/p
         CTB58BS81J+ECTqTs4ZPXWgJCq29fdbga30Cck0B7ek2VKvwPsbukOZN9vJd+jKZSjsR
         PHHsV/CepfLMjgdlflurU+k3NEjLWhoYtBfPEHFd2ZM9OW9LplTE70KVnKwNM0/h6lTQ
         qApw==
X-Gm-Message-State: ABy/qLbzsyOEA+8gF0eztLm3Wc0H/Bz+bja+TB0tToLol8f9Grnu+ApR
	hyXhkQPyNOTMBQETqOgiHJhWqw==
X-Google-Smtp-Source: APBJJlEm/6GXbm7Xxy1xuZrkRoGgwoBa808/7qLXZh26/RqiFuT1qXfEHNTzxUwP073mbwT37pr5dw==
X-Received: by 2002:a9d:7399:0:b0:6b9:b1a7:1f92 with SMTP id j25-20020a9d7399000000b006b9b1a71f92mr15220073otk.8.1690928806005;
        Tue, 01 Aug 2023 15:26:46 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 4/9] RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
Date: Tue,  1 Aug 2023 19:26:24 -0300
Message-ID: <20230801222629.210929-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152649_045046_2B22F3BC 
X-CRM114-Status: GOOD (  10.56  )
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
