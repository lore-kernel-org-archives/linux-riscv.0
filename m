Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3828C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JNiydr9uMy31R1oMJh9yfb4mVlcP7dyhT2WyLta08k=; b=RphKBhv9VUOh2e
	8zt6FbZzTavTKG0uG0BIMOIj8kwQq3heTgWPu8y4MdMD+dKkCkSEnysWPRcVD2vghoY44PRZfNwLm
	yC9VFNdotqS0WZD7+iJoorhVF4F2Tosy/Ght20Jv9xhnC4oFZyT852qPnKAlYAh+JZR82QqzMSGwT
	sgTPvygyEyeAS4nMfzH51GxMPDa5BXrk8HVLy7BMg6agkmeLdDRedETqUS1Wwuv+EvEiXEJvLQZku
	KjPNSlpKfgXMfOTnb7LrzBxcG9SqiimFLnnvSBUjZ/4Lzyz3lhsYj5rHyenlJDYVqrLL3tKW062xL
	augkIPt3q0KfbYEIT1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdr-00FUnf-0O;
	Mon, 31 Jul 2023 12:04:51 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdk-00FUio-2T
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:46 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a5a7ebdd9fso3229990b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805084; x=1691409884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g6ezAcbcDbpiKHj+AEdPKnGvpfWwAjfnv3+ZuFJ5r4=;
        b=gbBcnmgdij70CZuNsemzv6OiZ62y/nqSLVfJuBjt56UG8eTsfqEcQ5H0O9hvulUTuo
         TsBmBA4snnIblsOueHwJ7KEk7XORWZrMUGtCktF0b+7KUcf51BqSn4m8k9vNb6mh7Z3X
         EA1rhX1hmSNpoylzN1u1mEmHfCxw4s1XQ9Us3ezPorKU6ypgsv3NRQm2GABUBULG1U+S
         skX4nx28Jzb2VXpL/Ct1+0cRdC6Y7uTW1Jxcpt3V4Bk2AK8CMUFj28tlg0nThapDHaJm
         TD7kANuoyXYCm2XPQczXHTiGigNBNZI9OX7IXipnIKjJwuixKYEQFV6VjoFdq6GEvKdL
         PAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805084; x=1691409884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g6ezAcbcDbpiKHj+AEdPKnGvpfWwAjfnv3+ZuFJ5r4=;
        b=j4hz7mArbydK4AxgwladkiGXmn8ZavRjygF3iAMNqv3CTiupzqkcyEJij/4RB27lf6
         9uVViUcnbdbpJ+TxX1BAlAYwm65+IjgrnfTex8xNRFNWEVaIUA51L16ReunHNtaEj3Az
         YZgnU15K9v7oMJRnY5C8GX4ZmJvrXDa9KBWXtYDtuztARkLUCJanZIqlaDNJsN+6Yb7b
         OHPP1Sy0gC9h2ltvvLH6R+5MTaj4crCwMWcyPl2FVxRxb5kX+fe0sCfeFeABQu5LMXx8
         h1oJyCOGCjAY6XHPPq/65MzqZhDBNUwufh9paC0VhML2kVkpjLPhSRtXWz2IfxOulOdQ
         nyiA==
X-Gm-Message-State: ABy/qLZTqEg+cVo8iRC/EoSej/nsp9Us/Lbs5bqOg/omNFxZnvCKMnfz
	9JbZKPLqksv8NEH7KMGykiETqg==
X-Google-Smtp-Source: APBJJlEK140Sqf3PZqEO+ojsGo00HTDQQSk+USiO73L/HrwOAD+v54PVGva7arYeyJ8WWOtMWFVgxQ==
X-Received: by 2002:a54:4714:0:b0:3a7:4f8:eb76 with SMTP id k20-20020a544714000000b003a704f8eb76mr7414240oik.24.1690805084090;
        Mon, 31 Jul 2023 05:04:44 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/6] docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
Date: Mon, 31 Jul 2023 09:04:20 -0300
Message-ID: <20230731120420.91007-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050444_812212_962F2D41 
X-CRM114-Status: UNSURE (   7.89  )
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

The EBUSY errno is being used for KVM_SET_ONE_REG as a way to tell
userspace that a given reg can't be written after the vcpu started.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..229e7cc091c8 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2259,6 +2259,8 @@ Errors:
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
   EPERM    (arm64) register access not allowed before vcpu finalization
+  EBUSY    (riscv) register access not allowed after the vcpu has run
+           at least once
   ======   ============================================================
 
 (These error codes are indicative only: do not rely on a specific error
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
