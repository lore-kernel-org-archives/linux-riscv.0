Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDFCC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Txfse87Zw9Fr7eIvUJ3jmHX9hf+NC67qpcChXsZ92hA=; b=iSMlYyvd84g6G3
	anOzyKhK31Wgnj49wfT70u2voANlI39BQPKGJSFhCqq6YIieGtGmkzzLzBJQ6qzhWZS0kBqxkyUxT
	bXYjvcqyu7qXBO88tJzQydcL6/I09rFcf5eUgC2gcWvG54bqB2iCt7GWMThpxkRhQKujeiep9VJrm
	AK1HI/vILmtthhWAOkiHe/nmK3WFtlJJuhU0lqbDiBq7ZAHyyVXqKEhFrEINyrU5q5zA86wwOJgd7
	YPeH8Kk3E566i807D+9TTbsnu0TL478+NG/cnLPDYfEYi9eMIPPsDTe7sBwHShMBo3S9BRk5iyQt/
	9lh24mUNFp4YcPCFYD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48z-00HBmd-2J;
	Wed, 22 Mar 2023 19:29:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48v-00HBj1-0e
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 19:29:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cy23so77267018edb.12
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679513342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c95xbZWaAIRYhTksuHZZaulfBNlGiZOzsEUakUKba/M=;
        b=AZHh2e3RvEPuqPAFDFKi7mBkEnoIrq51pXGuITaIwJd6UnSscPWy4pFNM6+2/UYERP
         rALcASdTEIl5V9dL2JfqB1CSo/7zPtLmZZtisfxQu4eIoyjKbVz04dzC3wkx/4xN3Xci
         3b8j29Nv5eD2MSbgVVziJYXkKFP4LSEkG/+80Ll8im0OqCV+n8VxSi44NcUjNkhqQ0Rm
         yK2733VBr6773tEEpfv4lk9McpTWQxiO+8hczlVcUZg/HStT2seBgg4Akk98qTbiLGT8
         t2NnHVB3UCMcry4o01BxIFLhYisT+8f3JBpWpH6aGOQOyLTkqOaGCIEpKxSxPJzcyoxJ
         LTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c95xbZWaAIRYhTksuHZZaulfBNlGiZOzsEUakUKba/M=;
        b=cXdQEzloLRm/H9Tx+rKbzUYEZKyrYvS9SjMskMsiv6R039VEKgtKciztxN4T4ktDAs
         pL8l6q4JHSSqMZ8gVSAquFTyOmXmikWwmbqZD//7v9uTo5JxnquG6wjPT/wP4ErFioGF
         yC0pN+A0WhACk76/ODaF5qeWf64gsIpIuBxSaLx+x6FmXd1oqOqGzctkTc+kL9zTzw/D
         UBfClRrw5chM9fvWp2t7ra9TXvGyfbi2f7tZYQoOc9CUuaEdT0wMUbG7SFGgNipLTrM5
         arBKxmQQrKRskbJ3748zHJWKPhzekJgbRYb5/Fhr8wjmoEpx6Z/X8V4zVSGfdk7gPOmi
         6tUQ==
X-Gm-Message-State: AO0yUKVtV+Y/o5/+LYp75MyU6OSsk94VL3cEGmIHT+wl8bVAD1Pc2hfg
	kel3fhCyrqwxShU7yi4vvDRfh2dFWNMW6A97byI=
X-Google-Smtp-Source: AK7set+o+WNwer6VEh0RVsbmHe4pBkl4pxTm6q4d2d6btmLOsMwbz1CaqASHdB5l8nt3WiZ2suX+hQ==
X-Received: by 2002:a17:906:8a7b:b0:92a:3709:e872 with SMTP id hy27-20020a1709068a7b00b0092a3709e872mr9989187ejc.19.1679513342604;
        Wed, 22 Mar 2023 12:29:02 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bv1-20020a170906b1c100b00939e76a0cabsm2657647ejb.111.2023.03.22.12.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:29:02 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 2/2] RISC-V: KVM: Require alternatives
Date: Wed, 22 Mar 2023 20:28:58 +0100
Message-Id: <20230322192858.1189272-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322192858.1189272-1-ajones@ventanamicro.com>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_122905_254126_FEF97727 
X-CRM114-Status: UNSURE (   7.36  )
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

KVM makes use of riscv_has_extension_unlikely() to check for the
svinval extension. riscv_has_extension_unlikely() is built on
alternatives, which means KVM should ensure alternatives support
is available. Select RISCV_ALTERNATIVE from KVM.

Fixes: e8ad17d2b5f3 ("riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5bcb2d519b95..9dd61db0acc5 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,6 +28,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
+	select RISCV_ALTERNATIVE
 	select SRCU
 	help
 	  Support hosting virtualized guest machines.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
