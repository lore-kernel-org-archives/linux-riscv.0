Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029DAC41513
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhhuDV15nIilCwwN2A4dif+K01xG97fasWe3gn6plM0=; b=Nse0IY38Qk7ncx
	HeK5u3tQp/k1gglXVj3NvrhXmSiN7LIwArS0LmpHSGksg4c5PDQ+wN0wJAMe4kaLJzvsqHwiT45nf
	FTtNdjsPl2PSt77TQ3EtZUL80EI/lbh4F6DNxy3D+2hxpEu8swiz2WTT2lcdp1hynpkk3DLg95f4C
	NGwhMupQIF+pn9khy6g6gzpiQem3DrwHHmtocTHrDy20uPBUykxLoXV6h/eazLkI7kLz7cBRWSbKL
	40VBCCObFE0WbJUlEr6eazNJqnJPYAHkktLHtm91hfqCQzzIBX5lIvJpLfEOzU4uj7NmVL0Aua2qE
	0iIB1ZfAZd1y+q2+hyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdr-00FUoI-2L;
	Mon, 31 Jul 2023 12:04:51 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdn-00FUgK-02
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:48 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a3e1152c23so3215868b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805081; x=1691409881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/G0IwVJLR2t3toGYLVhTTy1luMUvUk5+J3HPr91WKI=;
        b=jdB0bZjCbnhEc6O9ewJ5xaBpeZCo5G3llR4i2db5ONdCF93K0gd/AL53RIoiLOkmnk
         eGo1BDBUXqQZ8ZMNU03TfIHGxQROjYL6umpAANjBWPCQmH42hrMu8G3wv1kyWpmsqNHj
         lFxfP8tJX/zCoiGO9odyKjQgNxl76izXDyROtT2yMwQYo8GlNo8ylOM0+OnLjBmZ7tt7
         g2+3DhXDbpa+7XFzE+Z/cV9l9wG/Wu9wFkqQD6blPvYpPNVseMlLE7GoTYWbfp02gjgk
         OXZlx+VesQ3/d+O+9GtGgO0mjb6fccvt2mVVSCHh6D0eBQiCN79dvOPKDB6tYlSSQKLf
         8e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805081; x=1691409881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/G0IwVJLR2t3toGYLVhTTy1luMUvUk5+J3HPr91WKI=;
        b=V4jTmHWZ/mHrz4UsmO2caPNVqLXsxBW9xWKK/DvebL2UY27Aavi+UpFCUIQjuuBPvy
         B04GHg0GtWdaOK/1gYc/wWJqd7vUl6AIrcp+AnB/XzWTEuYCgAMeCbfI3w+v/mcpDQuy
         +7OJB6/NDXRMcSO2BZf61mDLvmt45EE00ixGzgZz+8jYvvnksWPgSC/M6Uv2dQQ6YmK/
         L8HX0zPVI0h8ZZLbC3qYdgSUt0p2P35cRxI2oQMUnTm6mWPBxmiSRK+GLjty5CvFZvSj
         69Lv6azelNLQL2O8LyviSILsaag2136aY7Rdp3HGm5BfzwAjXw3fbR27ubSSI13XoMpm
         Godg==
X-Gm-Message-State: ABy/qLZLritFc1UZh+Uv4ZhF2sgJrk1Ms8EWrgZzMyl/DcJW2VIxXN9D
	tOE/tlahZwvkOl+tZ4xDC412pw==
X-Google-Smtp-Source: APBJJlHIHCqrSrjtB30WJ6r7S8ELH+xlN95Tp7EtN4g6xbD+5HemVufzJTifbbVdLravlyptBlBv9w==
X-Received: by 2002:a05:6808:20a5:b0:3a7:37ae:4a47 with SMTP id s37-20020a05680820a500b003a737ae4a47mr2710551oiw.12.1690805081564;
        Mon, 31 Jul 2023 05:04:41 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 5/6] RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
Date: Mon, 31 Jul 2023 09:04:19 -0300
Message-ID: <20230731120420.91007-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050447_065683_8764A81C 
X-CRM114-Status: GOOD (  10.60  )
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

vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
set_reg().

EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
case since its a condition/error related to the vcpu lifecycle.

Change these EOPNOTSUPP instances to EBUSY.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 42bf01ab6a8f..07ce747620f9 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -209,7 +209,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			vcpu->arch.isa[0] = reg_val;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
-			return -EOPNOTSUPP;
+			return -EBUSY;
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
@@ -477,7 +477,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		kvm_riscv_vcpu_fp_reset(vcpu);
 	} else {
-		return -EOPNOTSUPP;
+		return -EBUSY;
 	}
 
 	return 0;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
