Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF91EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExwLwCPnclxMUBHGQBejk/poW2rXPXn1Gh1Y4lwNSdw=; b=fKZx+Mvz4FuZZ0
	4MqrS6DJwa0uH09XrSFvFNCUZHYW3mYFxmp8aS61it3/i9vfuO8uUoNpq26yFyEGznpht11PdawJj
	g5eDRivAbOjMPbR+Z+Rh2x29iN68Mtd4RtSGsj3sBTJ1oh+lcIKiD5J3rqzTnEwBwZtEqloQEvrvC
	K45in7DTJVnxIEL7DYPei7wQB747cGL0pDhs2j1sey7qF631yrL0+es2Nuswl3U/yB/0+5fi/ILEL
	BdV2WRvoHStl1EFpWAIsj2AdOgGIAXlIAuSNrg8ch/wFAwKiyZorG+82Bovj3BuRjsDshBTzFQRTt
	JE77OEAvJH9ByNEGt4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYt3-009MZd-1X;
	Thu, 03 Aug 2023 14:01:09 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYso-009MGV-0s
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:56 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bc9811558cso886293a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071253; x=1691676053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UgQi9LDUX4k3lR2Q2FdA6BSSL1gShj19us97XhXguU=;
        b=ICE7tPcGWwrSBFFCkEwRFCKGrJiitZ33RQSEP5SXsq0rz8HNeps+M1nXALn5mGkx3l
         /UY9H1rMQnfL7Oc5HKzi3UzSHuecUctTdD/ZSj+yVL5Kk/zozy8v7AXHFDe788wB2tUz
         py0+oElvUGjWFK3eTk35tQ/Vb2cyINuCsbUhFPEzNNKZ8QQXuSnljxngNwzPqc3rNBy/
         udiBb7jEkf3cFj8/N7LPZ1G0huwxtfAazsq2f/PbTJmRNbtPhK61Z/iygXBpthX7idAu
         aHj2l//XFR59okmzmOZDQxvhJZK6aa4HjH/kS5AYfOfT+SSoMJi+9Hs9vUynsJ8dXjuf
         JGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071253; x=1691676053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UgQi9LDUX4k3lR2Q2FdA6BSSL1gShj19us97XhXguU=;
        b=QVTljqyAyAEGLWCHb1H8rHeghYgqLxB+J6rD/jHg3n+nd3bES7XX6sIevfjZvRkQIc
         N5pbz0yqfpSA3BMH9/9XSNOj1CyFKJCL7QNNI+RTqIiIE03BCZAYiR4S0ju19UQqWEss
         v6+ZysOXfE0bB/hals5EUcsMcyBNswhJTHwe4ripyq8OBVMXG0WSZy7L/LuayZ5QWX1j
         XTq24sKQLrj8ODkawnA4/UdoIRps1ps/1hFk2riunCBj4lM5U0/LHlSeSFfx167T5lVY
         JpppK3sGhdUVI7QtJ8P4qJdOH4JFAu5iHYXWPz1iG/Cq2wIdK4ki6K7UvnUfw3+OPeFY
         OEIg==
X-Gm-Message-State: ABy/qLbvodNY5/o4WjH58EoPif7qS2QsKHsjtSiK6KMPNKKfedNukxju
	c3YunKxAc3AoeX+PxNMyTC5xaA==
X-Google-Smtp-Source: APBJJlEJ7XVge9+sqybuLluuJAUuShjWkmg3bWllK2pZ8dTvF2tT43lRWqnDUx8VRtN4MazF30GSvA==
X-Received: by 2002:a05:6830:12c1:b0:6b8:6a83:2b17 with SMTP id a1-20020a05683012c100b006b86a832b17mr18904714otq.33.1691071253133;
        Thu, 03 Aug 2023 07:00:53 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 08/10] RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
Date: Thu,  3 Aug 2023 11:00:20 -0300
Message-ID: <20230803140022.399333-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070054_443068_E87BF674 
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
index 818900f30859..fcfe2049effd 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -482,6 +482,9 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
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
