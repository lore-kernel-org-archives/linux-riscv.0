Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD16EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgfaL+LPwNuAdITqogjAFawYBCjTqpE0+qNjM6vsCV8=; b=ghaVXykYwI6IUp
	6ulkc6Gx5aj/MVBD1J879QNV2wk/or0QxJO/tl/ELy1Rnpu+nXKuo31kgcBIG6VccoZJBxX3qUGj+
	9ePkaVB5pIt4mkT67QGcjEBNw67xvT7a0BarTQCfY7kDE+d0c7IEiqviSIHwVru+X5TVKZCcDEkeK
	AuMiAfolmz0lwAYRz4dpXtuIKoUiZy0ySVpfhlM0yrWpjLnzJQj5zDmptGTxrwWae89AGcG1NwyWb
	3y+NJtqTkzVd8u8WsnjWBeXuic1eSHxpzYuJMEg7Y3DVCMOqRVNSjP7GDYnEGewKhkuEiqVWbXW6I
	6dIvU1PKNXBbJexMXEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbw-00ARc1-Sx; Thu, 15 Dec 2022 17:01:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbh-00ARRj-1v
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d15so7504055pls.6
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmOKelhxXQczHTID3SM97kUHKPqlhsoeVDKTVsi4pDE=;
        b=M/x6Webfdw2/xEVgUjm/3euBweIF6ONa/tPWCh85rYYCknuNs2Zud5/f8I3G/wZU5b
         rrrNYegH6IFVTS4KlbBgDjZgb+iuoJwEWJLqoKvZxFEsIOb52j4dO9L0o1AGK8fb7O81
         BI2fI848yBcMDT1j0MPDQaKV/1/PBvWFrsQ/L4wDih29c1+VHAfsfSAqGJ9fO/pVZcmj
         mHbTjQjK0medb6WIp2rZ9joI3XtSc5NJvFlRKREO2F/6e/kQx21y933t1IJtMEkSdW+l
         Np3flGCnWtOpAO8HZbH34eX36OLMgW8MmER1SLfSfqID6dgu/xV/SA4vGF4yTHmHPuVZ
         3+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmOKelhxXQczHTID3SM97kUHKPqlhsoeVDKTVsi4pDE=;
        b=qTX369bwKt2aFYwfe9S5gjQywoYvp45AC/exZVs01MtBW2kqjFKORVF0t222t0jtMl
         /wD1hmqlsW4tgYAViv616l8QDYGmVTacujw0LOcC1Oq2Ga3gzikk/J6TlYHNCoE7vTGj
         FpbIxqiVmOrxJnVbNAZ5vVHnUXWq68zmB9iV3bsfC3jR+1HsCbmjgxvxjYsFE5SiNQ0s
         EbzDmayBb1V8H5BcYPbw4CP/TAErb0fqwz4HQUmbtlnamBOnQxqw/3jxoRuwHqSbrDmy
         olG2D3Yy8elBFeNDmmV9lq0Et+FJBzslfnDYmXWAR5t4UJSVGNMXZ0ZBqawuMOmSsWYy
         VSog==
X-Gm-Message-State: ANoB5plz0dzwgWxxP66rqIPFoW21nk7y03wom7rIf4NhhIpFame6fDo8
	T5wIfj7FWvE94sit7fMYbRkHVQ==
X-Google-Smtp-Source: AA0mqf4TLCt2teX6XTB8t7vev1QAhHcvWBHIfgCgZ8onADiiluFB6jj7/tzzvBe40YjGUu2C1tDaRg==
X-Received: by 2002:a17:902:7005:b0:189:dc47:fe40 with SMTP id y5-20020a170902700500b00189dc47fe40mr28685531plk.15.1671123675948;
        Thu, 15 Dec 2022 09:01:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:15 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop function
Date: Thu, 15 Dec 2022 09:00:38 -0800
Message-Id: <20221215170046.2010255-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090117_109129_9320C683 
X-CRM114-Status: GOOD (  10.81  )
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

According to the SBI specification, the stop function can only
return error code SBI_ERR_FAILED. However, currently it returns
-EINVAL which will be mapped SBI_ERR_INVALID_PARAM.

Return the appropriate linux error code.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 2e915ca..0f8d9fe 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.power_off)
-		return -EINVAL;
+		return -EPERM;
 
 	kvm_riscv_vcpu_power_off(vcpu);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
