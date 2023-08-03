Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62CFEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fR03m6SGCo0b+rtWSo2iCpJ7UXj9KUQ74OUgF67faU=; b=DKV8cVisgjpIO+
	qh+T1EtVI5zzZWmS7T/D5oXzfXv2NX7l5/sRr1bpkXE/RZzb93uCe4U3JWfeXgCVl3FQv+Tou/Jfs
	TY2dy/HBKdS6oGJsPB7Xo2q9yDNqLcuzOTb9u9EG1d/7E7d5QbtJRjHkVtpH2ecfLVbGYYuo1ojuV
	CAquCiTf3x5Az5aVAXvW4TrKH34qvZ1KQ5ZUFM3Jz/CbutC6ZX6wKVlNm/eW6tdu0YL2yFq0DXCgb
	ch2I7dH6mi5DoM+25PaT+VUW6ZoVhWHTgfkBW5qfOAKWPIo/E9C2zZ/cSlDIoi+SLzbI+gk7ISojt
	jCCONKX7Ymz0ru+BGskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsp-009MIs-2L;
	Thu, 03 Aug 2023 14:00:55 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsf-009M3O-32
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:50 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1bbaa549bcbso692426fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071244; x=1691676044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tfXSWeWMPnAaIHY4KST0Dq87HeMn2MCQyiwOTRx9l0=;
        b=WP69lFjTPQZBrSl5wkrXyzdHsTpyXA2gQa0IRM5fKF/BiJJslBNKpmj/AOs0VzIEi1
         230pC7w5MsZjzMNcQDLIxq8zqZjOWkA9IEz3/H0hwfTng5PnlMtVA9PGgn6q5AcL8Zmr
         8hfkfw+x1vAS4NMP9lydmjgAewKG1iEXAiqWEf5AgOX9bdfy7KwBL+69QaZx11BOJqma
         yK6zfiBC4u0RvubTUeaNRhRXRujYEkUPQgKplcaur9kFc6JnKukD75uePnfQWwa+Uxiz
         WRJWWUXaqG8pv2b7Kit6dPWbwG+UbC6UlEYD3cgz1VR8q4S/7D4IN0T+eu/hu6exODeS
         MM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071244; x=1691676044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tfXSWeWMPnAaIHY4KST0Dq87HeMn2MCQyiwOTRx9l0=;
        b=DsahXjjlp2xb32ho526ODnPKYGINYBAcVqgxYql5R5NT7bCRLsbh442O15eda6GsKR
         yIqV/NQSqjzhcLUZTz2uJIvyu41Phw4XvmhJfNdWMBDwq1ISgGp+dnRzlyVE+oYkFBqR
         Lg6BD+6ND2gXR+MgrOE4qnYEj2dDSbBASjgYErBRv6/DscqRK+k3mkHJgyvtDWUqu7vA
         IJqf93HACHtASYL9AdWCTHyKlfuxYo2U9O3O4b8GrJtQv3CBm6iBushe3sqXl+hXlELU
         Ke8Vaj5g+UOHh2pkNkl22I9DY2q+B86yiXGmadqx1Ewxz8M1h7ZmOKCrys3D4liV7a/U
         dA9A==
X-Gm-Message-State: ABy/qLbnnJo+gl3mKyM0ekJQ7BRXLiIgk1CjrniQtKcsjnjmL+M2axf1
	D3oLwGy8Oxxv0ud1q2pZt/cG2w==
X-Google-Smtp-Source: APBJJlG7X8lZjATw94mHRd/2WLRlARX3gMV99Gf7BdNQxmyPF9slcJQDy0JY5lo4gAQ1GC8RuAzNfw==
X-Received: by 2002:a05:6870:2198:b0:1b7:3432:9ec4 with SMTP id l24-20020a056870219800b001b734329ec4mr23759556oae.10.1691071243905;
        Thu, 03 Aug 2023 07:00:43 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 05/10] RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
Date: Thu,  3 Aug 2023 11:00:17 -0300
Message-ID: <20230803140022.399333-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070046_060030_27710968 
X-CRM114-Status: GOOD (  10.98  )
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
index 49d5676928e4..0cf25c18b582 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -212,7 +212,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			vcpu->arch.isa[0] = reg_val;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
-			return -EOPNOTSUPP;
+			return -EBUSY;
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
@@ -484,7 +484,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
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
