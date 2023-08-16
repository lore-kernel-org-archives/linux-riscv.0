Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF4C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DStvZ8BQz+Pthpo3RmmaxakDHPWVlZP/ta7v79Eptdw=; b=CgcQeyufUK49Qt
	iniE28AwZCMQUquaA1zC+lzB74yqnvGe3Bb9Ie2I+T4b7bnDze8eZsKkrqE+kyXuVjC8poejEjdqD
	SNqnYkwsBV5ANgfck6RyyYSTIP/yU7HzxrwwZc1MrLRM6tmn/pEIpmEVTyfdmcvjo5icxjycGoSKF
	HOz6SFQgqcXUhB5gqJirwZ3ZYFq27P4beB5BN6W/o4R1HLtelA7WiR5FOIMOaFDZ5NXxQwPiKRR7g
	vFw8mEOcGNVXFEVEwcfKvfqdQVZRr30A38RyOrb3mNfnEBKW7e5gaUX249nnSRA6QDRgfuxduVvRp
	qrT91m5j/77Nzq97fdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrj-004Xtm-01;
	Wed, 16 Aug 2023 15:55:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrg-004Xss-01
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:55:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6887918ed20so1167808b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692201316; x=1692806116;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKI9tOr+S+qytXhiqmK8AnhMIwT5HAmAc/rR5sKFl/8=;
        b=GyZ7aQnxIk49Hn8SgmQtBqgqcI8wleNXJLvimr43FHSn86PherScvWmourLdb/ZVGI
         G0adyKt+K8lRlqlwDDReURj65wdhqQVpMUpAHwj4AZRFONAbQh6+APMjQ7WNhwz65LIf
         ubX5H0qJKcdXO4PcS+H08jqtiwgAnwSly7ksO4RMChS7yYeDh4WFixnKXSJ6gdn0/WdF
         L+bA7G8jCEnLTixlDHkgGOmD1cF1UynzSgrjRkswfnklrpcOAqLBuGmuOrENLLnzMzyT
         6xJBGj8SSRzwrQ3E7Ra/yGG4i7UiEY1Z4og2d76SHOBqcLJL8o7UuHRM21QO/IWxF+/2
         oeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201316; x=1692806116;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKI9tOr+S+qytXhiqmK8AnhMIwT5HAmAc/rR5sKFl/8=;
        b=gwTKhVAqbMu2ufeH9eEyiu8jg/AfN4cjLw+XbiDKK+CnhW6VlHF485lQLdoBJ9VA8n
         Nao1h3wlqKGZnIAzzFJ4tl0c1HmIGMNyv+yT7AtP2jffRqam2gvs7nNiHnBkAW4bBIpD
         Xo8QuVONftt6oOSNmr6KgKGDiqBNUQIZ5yMvMwkNyaOAqK1USUEDrGZOwDBTecOueXkk
         EjdZ1Fy06qvsfcpIWB0cLpKgClGryzUdJb331R8SSxXOfCh4VDneg0hVKcCV5y8JYnu6
         Lp1uWpkbUWKlwe53oVKxaQeqx+kMYa8gRILb7mdg3g30LgisgsLLWM/yUc7lUgDChQBP
         2H2A==
X-Gm-Message-State: AOJu0YyKAoD6DdfM286DSn7/gjRy0TI7pmzlZtLZ28cmfXBH1R+GDqFk
	TP/eO9xgjZVL8aGvTT+SzttUiUwv1IEiZ9ZqLn255CIxeUWB0c+2Cyyaji0IP9TK0GsAPGnam7w
	OoIzjLP80gYvUhj4w5oFIENpSCPDxjGRYItc0X2W+SrFraoAxEUP9IHAWdXnIFui7CtD5sy18DM
	TXcqtdpl9Xlbmf
X-Google-Smtp-Source: AGHT+IHzDrEhkpMK6dyno3wRL/tgJW3PMJi+/H4pZrVSWMrX2wVQrbkNFur/lV1J4V7f8oCVJPNxmw==
X-Received: by 2002:a05:6a21:7906:b0:13f:a69c:53af with SMTP id bg6-20020a056a21790600b0013fa69c53afmr2364000pzc.61.1692201316434;
        Wed, 16 Aug 2023 08:55:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b00565dd935938sm3025891pgo.85.2023.08.16.08.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:55:15 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [v1, 2/3] RISC-V: vector: export VLENB csr in __sc_riscv_v_state
Date: Wed, 16 Aug 2023 15:54:49 +0000
Message-Id: <20230816155450.26200-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
References: <20230816155450.26200-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085520_045240_484A23FA 
X-CRM114-Status: UNSURE (   9.94  )
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

VLENB is critical for callers of ptrace to reconstruct Vector register
files from the register dump of NT_RISCV_VECTOR. Also, future systems
may will have a writable VLENB, so add it now to potentially save future
compatibility issue.

Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h      | 3 ++-
 arch/riscv/include/uapi/asm/ptrace.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3d78930cab51..c5ee07b3df07 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -70,8 +70,9 @@ static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
 		"csrr	%2, " __stringify(CSR_VL) "\n\t"
 		"csrr	%3, " __stringify(CSR_VCSR) "\n\t"
+		"csrr	%4, " __stringify(CSR_VLENB) "\n\t"
 		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
-		  "=r" (dest->vcsr) : :);
+		  "=r" (dest->vcsr), "=r" (dest->vlenb) : :);
 }
 
 static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src)
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index e17c550986a6..283800130614 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -97,6 +97,7 @@ struct __riscv_v_ext_state {
 	unsigned long vl;
 	unsigned long vtype;
 	unsigned long vcsr;
+	unsigned long vlenb;
 	void *datap;
 	/*
 	 * In signal handler, datap will be set a correct user stack offset
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
