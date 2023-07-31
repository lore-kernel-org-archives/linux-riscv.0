Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC7C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rndzeg5n4kzBwGk0QqSLLjHTJZ0Um2wDIBv87Wjiqk=; b=g9Ru8LAERMHD74
	28Tc0FD6wwIBGqYEAgI+uVwp8LquTxa7SX9nb3LmulxmJgPD5mdOtZNBk0QG++wnHebtMJPVRaUgE
	MSisMuEZAoO+yd9XQWedyha+tAQ0L38Av2BxswB+czLCvyEfMbyuFw5xhIN4pSAPTg0DSFpbmOe8w
	rcUWhGbv/SkPGr+7BPBAc7sjIdeGZkX7DfuXDEE8zM2wclgWpdgKaStMc/Y4cRnTNBMz+Ty8WvwA0
	N4q+VKn7wTdSX8SuP2Rgl1vp0nnLs5IPqXpPybcqYNp17LSZTnv7daiJkE5YaEbJZW+6DnycUZ/Y2
	ukEeGEUQGWGTfYRR++8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdj-00FUiF-3B;
	Mon, 31 Jul 2023 12:04:43 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdf-00FUfI-1f
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:40 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a4875e65a3so3005221b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805079; x=1691409879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=g4gInOMTxn59VtKRdWRuCB+Fh+tnWH+7LdkxQpWmTylm7nz17XQSSKvmEY5WRaWl8H
         I4GSHiXpC4fy3IBYqPSf43xr0NNUoYm6s47jI5hBYpTCzHQb7WZofiBBo/ehpMOPtRaX
         gw8JqpC5PAy35MOXYZsXG7Mqh0Mc/y1rKu0X1779bCw86L57Oxw+mmL+UhYRavs0CPW6
         nqTGsDt5gPWj/l31RS0Hauweum49LharASB0dmKGX9xp578CTTnzw5gogNOQfQHxsO8L
         /xNDfaUpLKdVvKFkAjZLKcHdTnytpg+iCCq6wy2nlVVaFDBoDP4h+X65gXmukM39k5wW
         1zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805079; x=1691409879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgDQfKgZT9Ai5Y6MxDXe+dFoAViK+yC0G5UtB2DQuPI=;
        b=QhYICZRlKiObUcK9GjFMdX2hMpjZ2ZCFSxl9aQP6S45c69d0KaRALV3jEQo8j/s6Ay
         Mg1eMiaC6M9uOVe1jFfKt0MSqL/kWuXZIdoO7W7h7p/LlBBRRQJIkIAAWGOQiPRXkj7y
         Z5OnuYQDkKrFGaIRgNTldqBpl055LowHXtL7DXpBz3pK8bDVE28vsP0PiyO8hdJBlpvt
         KlmjqTT7S1D3eF2QBgq0hLqFdPx+nyeWC94gyxof3Idx3fScFLZjzHxKPNQW85LS6NAR
         52dGfT01DDIERwd6BWCm1GAEVy6mI5iYBTC3BbCFsPIJwKrrcqKleEhBF//14rQL2tOI
         r/fQ==
X-Gm-Message-State: ABy/qLZ0dnSLMcYgsBhZ95RUdwe1e9aVcO7q+Oj6uPx8uHfJFnc/ZuqA
	Jgm3CUPtLNePU/GIR7MkC2H/hA==
X-Google-Smtp-Source: APBJJlEQkjl0l6suCrkTFYT7TTJL9N41YjLsPcoLRfAZ7n+fD7jS7ThVU6PP2ELRqXqEQrDWGzNkdA==
X-Received: by 2002:a05:6808:428c:b0:3a3:6364:2b73 with SMTP id dq12-20020a056808428c00b003a363642b73mr9202732oib.52.1690805078937;
        Mon, 31 Jul 2023 05:04:38 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/6] RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
Date: Mon, 31 Jul 2023 09:04:18 -0300
Message-ID: <20230731120420.91007-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050439_554719_65852CDD 
X-CRM114-Status: UNSURE (   9.63  )
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
