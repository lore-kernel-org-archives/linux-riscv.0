Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8AAC54FCD
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NvJJw8hjjUIz+Twk7Y+CEDlkK12jgKa90N6hXe3GgE=; b=xHwcdYMiuGNVcf
	x2/QkVc+StzJ/mrSH4IwMWeMbCfslEUpI3jeeXu6igjxwoZIdukPdw3mcdbFzZeDe8+7YyXnMn92o
	8aUp2lVVxQb38lI3Ey67iUunQSJphDLoK7jK4O5+Hnl57Rbn1jA5LguP7HAxAeOBv3jzDHksu5ioc
	09q/I7deAwMNJ0L1Ni4eSGTEd+pxRvdhLug7ZTRu9EjwzuXURMqCSUk/Jg9jCCw6vwl9EA8YNzMC/
	4BkbaDVtN2hMNjwsBI9lD/xQRfTctp138VSaxytTPCrffmZbvV7zFNiQvEH94pube/YZavotU8Y0g
	GySODX1q3blbulIKRiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDes-0000000973m-1sdu;
	Wed, 29 Jul 2026 23:25:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDep-0000000971I-0b8v
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e7109321dso928602a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367550; x=1785972350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kW8oqLZffY6X0abqSuvd+PUmx3S3p3riWWcGYu4Az1s=;
        b=BxnCfS9ACJOmxqbzHEDwrFio4C2fOr7Uc5a1lzde1j8SwmbqpetGYoijaujp2h0tZm
         9GHi6C5zvA4P/YXL4Ki3RlSI0nI0+dN2ZpxOsfqhRNumx3AGcss2mvmXeVTgmWKFELZv
         +AQhMlE136+59xdmm7j1HC7pGNyRUuftXakJxhqfik/IraanfXS0TpP9/YrhnHjiiMjX
         I6yGxm9zy3XJXc+EFJrAJzgt7caKqePe4XQEh19QQMOD30wZGcmZeJA349feSE0A10VC
         jjVQf2Qcl/yCNbIMMHXB4jr8X5g/5azuKOaLMH9czR8C7u6o4BENC04708OwnFNuLcuh
         QicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367550; x=1785972350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kW8oqLZffY6X0abqSuvd+PUmx3S3p3riWWcGYu4Az1s=;
        b=oDvrtxbS8XBt/hXcpCbCnMs7GiJ5MNiTwqgRm71UFkcRt8ZlpRCnH7n+ekSwbO2V+V
         itBTe6THaDhtXbkp93IfH0a1peSti6Cgf1HLX0TiVO7wV+FnvNQEcihkUd9ioGk9Dzff
         hI73CrHLo0SFmaug9Uqu7cVj1gW/I4uGL6dD9fQWukTv7c4x7MbbssQNNSEio7AHB1Q8
         h6QL5uJqaOHf+S9rYj+CzUKEExkourvNE1hvEMC6NqTsSxvfFtJTUaFWIveFGFmB58ql
         HX4dpzN3FBEi/FVPoFOsk98KU0pDK+I3D8/ckuVK1TDJPglPLQoRymAps/K/CxqsZ3VN
         rBDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8HzzLKDlLVytlazcNRXZ6O5wmgZNhPQc5Og5RCOazCuVgcLLpxPpitBDo/4oQtBSwpdWMnR+ABU2H7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeBB2mtjDLaSHTxfBFjeidjNBik+RfGX5H3TDUHct8TJyliL3C
	SHrzwBIYoGerXhSwBxB43vEB7H+Xpjqe6ej7K8oU/fMLr0/cxMW1Ugjl
X-Gm-Gg: AR+sD108lEKGxcqgQqxmCY6K6ntNVpTq1fDDtLoKOZ2njOt6ERc/a0vvfLJOPerYb6A
	hO1JHzTnVkYUO+K874CGIBbV9OscMYs82wvgTbwhun9oWKJxnR9kuAgrCYtGNcivy5WinZeyasv
	n+0H+UeUBK6qEYvJ4BcYp8UeYrJ+NKG3vtWTTSwtBiiTcwtNMcw1/17QbxCWowTN8mvILczk0HO
	M3530xKf4nOVFKHFZ5sDxsB3gDnuYe1E0iWcqomshzZUsy3mbJi4uccXq62c/1+rXmWDCp7Z8fc
	idyE6dda2n2txuB+5vwNoF13Y+e+VO8CAsFnv+TMh1axOS21TF0SRcOENVfUryTp91J50moYawd
	2m//0x7fwYl64ohG2DY/2ZEbCk2MjJ/JPY2+o68kleJULOR3eOagpFxYqvJzX/pTvwshjzH5I/A
	3+B5+xqE3Rg+hyiay+AUyAXVgzj13Hpyn3tqPQ7XvsRC+XAjSqkoW4i32Iymk=
X-Received: by 2002:a17:90b:1b43:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f9c032891mr269925a91.34.1785367550506;
        Wed, 29 Jul 2026 16:25:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm90033a91.17.2026.07.29.16.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/4] RISC-V: KVM: Mark the reset callback of FWFT extension always dirties CSR
Date: Thu, 30 Jul 2026 07:25:25 +0800
Message-ID: <20260729232527.139183-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162551_185057_C7AB5FE6 
X-CRM114-Status: GOOD (  10.03  )
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

As the CSR is only flushed when the csr_dirty is set, always set the
csr_dirty field in kvm_sbi_ext_fwft_reset() so the CSR change can take
effect immediately. This unconditional set should be safe as all
supported FWFT features change the CSR state currently.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 56fb59afe02a..2e35e7e12327 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -601,6 +601,8 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 		if (feature->reset)
 			feature->reset(vcpu);
 	}
+
+	vcpu->arch.csr_dirty = true;
 }
 
 static void kvm_sbi_ext_fwft_validate(struct kvm_vcpu *vcpu)
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
