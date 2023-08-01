Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD1DC04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xxAPOhqVAl0PFJm/WJZVNDcbtBcEjoTuRnBPAA9gI0=; b=SMMD/7TLaETdzm
	ZbidVzNefgcqgAIEQgPeklfR+nNsC5NTGb26lTAEB4vax8JMEV1GOZm9Ys0xL6lMg7SQmwR91hftP
	OuW/GkLVopIeNzhtojCAQQMKcsVtiriOHVUBK0k73xngRcJjIK9aDjHvqj/b7SubtWvCkeY0U5Gcz
	FcZPMe8wuJyWMXKea2VHdiDqL4+ZxYUSJ1AcqpXLEllhYp7Y/c0Wu2KvRKP+hz5NDusB+pbI+/AY0
	uSQSG3jWtGIeCXwajlIXbFc6VDz0zL+ixo/mKAI1n7EZGsGc9OFfaGdsHVZWMk0HBuKghXl0O0yQE
	aI72XeUmoEnrNnfeb9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpW-003R52-0e;
	Tue, 01 Aug 2023 22:27:02 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpS-003R1I-2m
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:27:00 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1bb69c0070dso4776525fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928817; x=1691533617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbDT0MfbRX4j7ZGvFYTA0I3dalF0+0N+r3+DHPQCNeI=;
        b=AQcHVF1WjA4okSWGpOMbqspUIJ3iEg1VDpgwCCzt4IfG46kooADzgPENm+bxk9fLBG
         6yxYIir/rHNgxKXt7Dhyl0H2g45WSO9c8jEsiOzJd6yuIn7McV2Pu3BWKaNi8tUnJIu9
         RfUqIwMWue5F8xJFo5m/JHaAS0d0qQ18ehu4zSvZ9ehRICxv4RIM25UkQosBDdZAntHO
         ijDI4c5ff+LgcNeTLD1lLg3/y/iwzn1xDj5jfvQm/zo9nhIBsqAnVkobsitFH716xS2x
         h8Wj9xLLbIQG2tY7VrUG8Fh9ZR2ZSRTBHEbPr9ewRXVJRbzn8bWBLqsx7YHld53750K/
         ltJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928817; x=1691533617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbDT0MfbRX4j7ZGvFYTA0I3dalF0+0N+r3+DHPQCNeI=;
        b=ChAVB1nCJ93Corb1JX7jnCQ/fBJ1L+dRFnUcL4JYWPi1mEaaPZsJx6tH13Z7v8dVO1
         y4fCNYg6d4nVKeJznxtqjy2Dk6omZ0vP6WlXoiRVTx8zBBBb0n00DxdmhTeRwyuKjP4K
         yDBbBrc3gpkQZrW70FgFsGNDCgppkXFmW/BQd2yBxGD9B3UeXQFHmeVRr2FVJHJmw9pm
         Bh8tgOLfk0mla22L30KdnRG2yDUFWTn7wNUBD9xsV63bcFIqKyZ9W+rA07RtMSVghPvq
         DsnAvaU1xGo6C3jTaC7lHpbO1RXZKK1YB6tpsrOvpU4NQtleaE1RGJ1SAuTqznEmRmMd
         8kMw==
X-Gm-Message-State: ABy/qLaKmiNco8NAznmHjy8Nwcok1YIzJf9C3XkxFR2lv97H2nS8o1gZ
	LmzASybrNt7L/tHkBMUYFrTDbw==
X-Google-Smtp-Source: APBJJlGpQT+OrLDl8OyEuxWQhziQS0XGOWgH6q3o9SRCpTCS5ubBiyUy9ofy1qow8+tdKf+wUM+1EQ==
X-Received: by 2002:a05:6870:784:b0:1b0:73e0:97eb with SMTP id en4-20020a056870078400b001b073e097ebmr15376248oab.30.1690928817004;
        Tue, 01 Aug 2023 15:26:57 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 8/9] RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
Date: Tue,  1 Aug 2023 19:26:28 -0300
Message-ID: <20230801222629.210929-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152658_904957_0870581C 
X-CRM114-Status: GOOD (  10.91  )
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

riscv_vcpu_set_isa_ext_single() will prevent any write of isa_ext regs
if the vcpu already started spinning.

But if there's no extension state (enabled/disabled) made by the
userspace, there's no need to -EBUSY out - we can treat the operation as
a no-op.

zicbom/zicboz_block_size, ISA config reg and mvendorid/march/mimpid
already works in a more permissive manner w.r.t userspace writes being a
no-op, so let's do the same with isa_ext writes.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1ceccc93ccdb..c88b0c7f7f01 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -475,6 +475,9 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
 		return -ENOENT;
 
+	if (reg_val == test_bit(host_isa_ext, vcpu->arch.isa))
+		return 0;
+
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
 		 * All multi-letter extension and a few single letter
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
