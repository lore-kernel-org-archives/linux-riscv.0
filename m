Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0004CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YlBBjzyQ6yjmoXJh7VUlD8MltN3vsqV1kcV/EEN2PQ=; b=Bp9Xdep/7A9bc5
	Au8ahhQ76KmBwVvoz2oqFnt+9zvg1044irTaU7GPXYrYHYwIqWb0WJil8Yg+I4Y8tNa5pRhC2x85V
	42CCpLzilL2gUJrjHSXDUAtFx+D68JQm1MQnGSgsQQ8DElbc1JeN8aLbPIdL28S+VM4xX8/52N4Vd
	TeBSTxMreDoZ3QWk67FcKToW9XQUCTEyRnllBAQlEXD/v53DY3b/Y7pBEwAUMaN2KKBvAD9vIdmFl
	euxoWG0vCE5zkWwpfgAfYz1zBE/LfoNR7mtobCqkIeyA9TC9FYbhSmobbLkcTSYBlcAOBh70PzOoG
	toP9d4bXKQz8Jl3f85PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fj-0000000Gv0i-3MjA;
	Thu, 04 Jun 2026 14:40:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fh-0000000Gv05-21Nh
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:40:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8424b00710aso538191b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584056; x=1781188856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTP1FdYJKyClj5etDwLlPJWswFEwXeqJc5g2KUfLVbs=;
        b=mjF9n/qk42wr9Hc1iIz5Sd/UAh5FDCYHtS5vCIHa28fWosnt1jgbxBBC7hpOuP3YSv
         FKu0xGRxsa75j/0wLiC1msDMfHnnG5A1de9yz/A1VNtgRCzC+5iHkL0VoTQQ/L2zUIDh
         7BaXhuuXw5O1wN9ZF/6XoWVWH6Oqw6wqLP9az9IWBC+7JXWU5N98Kya27diHdrXPg2gm
         LHwb1E4/1r87tQRsa7q/8GEQZ8xiXKem/XvHf4h60yJgEfERqX7tR2gU4xZ66ksxY4Q2
         Bg/CUO3yZU5WrxONjamdo+NUH8LV+2ggO3bpC23Iih3DNKRQ7KlnvmW86ROGZe9WuIhZ
         Afgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584056; x=1781188856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTP1FdYJKyClj5etDwLlPJWswFEwXeqJc5g2KUfLVbs=;
        b=GP302RyMVKNBNeZI+pdktmUHSl7oGjuPNuggUH7CDVRWtEq/eAA1ztdIqyHej9djKb
         XDhWZCL7prqTzWSe1F4K1nBcylpYh1z8EdTvIjLdMIRpvHWT0AQbCb4qgncJESTuBjHE
         8f8imh84Q/hho+Gipm1tRpgCfmCvhb3pFG01QRLqrGt/NSgqR1Re4B2kfz6jBD69c7gI
         WQSGLoR46P7Oy/icefXzSJsYGJ+96F+dkjh8kvDJ0KYgZIz0kBFKb0HuX2VSKxGBknnc
         s+V1sDtKIaXw9IZkA/pfIrRN9MqicduE8YfoqQaou3UxzF9CCXlDM2M1sq2klsbXKuq6
         Yvgw==
X-Forwarded-Encrypted: i=1; AFNElJ+pKubRUClXy6Eej9i2xAEpIl5iUEUR1Qnb1ilil8SS1bIzKLs4xobf3ceoFXIELL14cwl6JA/EFXnJMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysULtidd8Y5XjbkDN6C7+43WYrs+noDjpV+a5yIgUiPVYwBhB0
	w7Uz925fMY8lNbhryQk9AzfBVVtOxPd0+RskYsw8nipNwkGI/6JVUfYi
X-Gm-Gg: Acq92OG3QCqzrkw8VFom9nJqEjj6Fk0RtInYYpQc5xTSB2KaeafmGCWscl+Nd4mCTfK
	1s1YHSa0x7Sn1zpTFRtH5z47oXS+DIXRk5YP7V7f8g8g4SvQqo8wuniO6IQB4dBB+q0OItr709x
	BElNuLX4Qp5EDs9padreVyALdJhi2D2AKZRwnFQ7x04wy4knMnTrItwfI4so+Z161sJf/s5lp/T
	UnpgLn1WqwdPHFaFN7oWK7rYpzcR9LQo6Z2Bgz2i5I0jFAqhKkDAxbOz4F4iWSpT0PhEqzlDgJI
	Qv58RHZUTqWPmWqVFDi8T0IkFqVPLH9Xuk8lmLarhfqpANPNwu2jA1kPks2I2JEDUuU/QvbJQwF
	/4vMy3CwWVvhzbtZ3oVO2V8bNLhMhmH0pj9egmOxM0oeqdyHPGbjYSRk++scb0pCcTYr/lj8Sbq
	bRHb/PsIq03qMptgMsIuouOX6BYVW5F4ccbU86SyEpT9VzJLcvw/25tYjvshT1dp32xV4DkgDX6
	D2AsHbnleG3oW2UqJt9VQsLTSmoi0HNPZWefNQzxVt3mW8/wmQUYkkvuGLsM7p2ncOVetBxWNU=
X-Received: by 2002:a05:6a00:2296:b0:842:6d95:261e with SMTP id d2e1a72fcca58-84284f490d5mr8472450b3a.41.1780584056532;
        Thu, 04 Jun 2026 07:40:56 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:40:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Fri,  5 Jun 2026 00:09:47 +0930
Message-ID: <20260604143957.668047-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074057_521517_947D4424 
X-CRM114-Status: UNSURE (   7.58  )
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
