Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E305CDD1B1
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vaIwSZHmV4SDdvIsNZipQhsIQdN7HbDvxhYQU4ihOY=; b=M7FVCrzsjn40VY
	+HXawZjoh54kGlIRYEsZi9nYmsH87I+lbNZhHpKcXLOTkhjNrE0ZQ9nfPN2RPdvRIrz8WZ8zDdimh
	1VbaepDndwK7BirfkTGyWq+FnqmNndoDwUR2Iujk+Nmt2HZDh1OXPdVnQAt9GvJyWxwlwVkBl+1we
	WdS3JY/zHUsyWYKBzlLpwKGtlXUpEi7C5k9YUR8fsb2bGcE7XQDTeryEe9+1ANHSJCHbOjIWqyLDb
	ewrOvgKDWXd/uVsUI2d2aEGParLNT0axAcp4rkacbUfNx9eIabKLbm8QLbtbjb6uHtjz8iQMmBiR9
	90BQagv/dLtO2+yzKE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEW-0000000BKXe-15sy;
	Fri, 27 Sep 2024 13:42:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBER-0000000BKTS-44uQ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:42:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d8abac30ddso1973972a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727444523; x=1728049323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56knnfie3gn40U1586qIcyfLVXwVK5l1OK1pmMi2fA0=;
        b=HThVBhEpd2wDxTRLfnjVOK0M7s7eCMCH/R/8vFTF927bJYJX5+IM2X9R/4VqirrwoE
         p9ul7eaekYFkBLmkSOnkCEI2PqBxcknMfrGy7r5+AdzkDuaE/EOd8O0PmD1LT7QQyReM
         c+DWqmAHWcryUIjnPzm58VuQBSwJBwcF6xnA46uMy+/gl1fi3xqdty74vtyG84eM4Eps
         TN54d2hmZocO8J8DEDV+pscfRCEioCYhD15b8njM0fFeTUJRbmwg/KfeAkpp20zOS3pB
         fD+R2wCSVFEWliCGmS6BJAHSmgwKWCjNOKqLYbrBgK6lc4wIhNqHfji1+QM8ij0Tds9Z
         PnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444523; x=1728049323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56knnfie3gn40U1586qIcyfLVXwVK5l1OK1pmMi2fA0=;
        b=b+waG4d8b0/2u1mbfMHZt/cT7YoD/t/XWK7E2kQ7g51F22DkztVcVLdxaTEKieOkt6
         66I9+kL4aClOvHk83G8/ahhlYOawkqjIFC7kn7sPQ+Do8dbpuxiqlGWwIufYjGOpHo8/
         tQzFogRtJ825nYSZg6hl3Ema8MFopfbRe9Cg3P4cR8GGkZE2C8V0zVDbRHB/ASxKAOzI
         9uOLKdmx+RyYalchYBJAqkGVlVr4ObDomPvYWgSPgASpbjKYdHvUEUHP+iT2Uxz8tmj8
         GFRE0A3JV8iXP8tBNPVue/ct+xt7JepDuE27Q5B7PGoVkTRfM7muyFQFvIYeDcDxeK8V
         RyWg==
X-Forwarded-Encrypted: i=1; AJvYcCUHA4OlQOXx3KIyPhA0vrUE3LzXBc6pkcIiyA8nklYgaB2+1do/afM28knea0UUT4/tf/8uv2Ga85bsqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNOo6sMseCnIcUlv5ReCZLQc9t+n+7jA99KkWtOrVmvV0Kgg9S
	lam73Vn524z67XGHCxjpUZ+b/u8CWt3B/ep9h105UM1YvMY9wgGiatJ8X3eDu6g=
X-Google-Smtp-Source: AGHT+IFAiXTjj4TZ3kp+6fPZNVMd2h0GQFQYj+mo8f4vBV/6UxIuO5XyJQRkw50Ed8t2tppm8wUAmQ==
X-Received: by 2002:a17:90b:108d:b0:2d8:a744:a820 with SMTP id 98e67ed59e1d1-2e0b8ed0deamr3681576a91.36.1727444522814;
        Fri, 27 Sep 2024 06:42:02 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16d6d2sm5671744a91.2.2024.09.27.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:42:02 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 27 Sep 2024 21:41:45 +0800
Subject: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for
 Guest/VM
MIME-Version: 1.0
Message-Id: <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=H2dmJr8hpjnnkdgnm3AAwF3pNuKwnFfGeFFtmmrBeZo=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm9rYes4sJwaW1iTmWxKG3SLRJr5Z3fDOKp/nPP
 r1gPAYhIkqJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZva2HgAKCRDSA/2dB3lA
 vZKLDACjqALjcui0yixfAk8cbQoV1qFAyPq+nTRdcdPTXxLhILdaqfUlPv9CLYgqa7eAaH552UC
 NiUQhYWFy8tMiCIXlrWxyd0Iqb6MA0pWfK4theLS387K53ksc+zOqyi6CTn577rOnPSQwj8fyQp
 R7ZHBbhrmhVX/5utgfHYq5/fBZidQZ1TQ3IpZAHhnvZnPyIU+UK6VmYWvX6nV07vWdrKav38cdE
 KhFePJCjH8+PlBFcZ0MiT+aNLuuDXR/XThWVMmKYFWbHsNid8CpsT3RiLQ0L2xts5+CNcCj5RYR
 ghY8YIOYAo0G1DnOFuHzScYZJR3o8kDOyjN8IC1MoC8Ij1Jr3lssqox+LO6DpcW1AntxX6MBxdv
 eRYh5zaGEUxNPyM/02zDRaeWP7ALiEW/0AQDcE8nftpjJW9HHTTxYrlqa4r8ZanX1BDbf+tRdvc
 X1j6INMFoYcTVCW0n07gCVQbEQsERGTori81rVtD3yyrzMZwJypmrcXisQIa2KzG/NN+I=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_064204_068961_BB251AF5 
X-CRM114-Status: UNSURE (   8.95  )
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

Add KVM ISA extension ONE_REG interface to allow VMM tools to
detect and enable Svukte extension for Guest/VM.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456e19f79ca02e4c4f70ae1b4abb48b..41b466b7ffaec421e8389d3f5b178580091a2c98 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -175,6 +175,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_ZAWRS,
+	KVM_RISCV_ISA_EXT_SVUKTE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b319c4c13c54ce22d2a7552f4c9f256a0c50780e..67237d6e53882a9fcd2cf265aa1704f25cc4a701 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -41,6 +41,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(SVUKTE),
 	KVM_ISA_EXT_ARR(ZACAS),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
