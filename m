Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D3C61DB3
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJjWALTWL9VyGj7t8gjK5Ellgmor2rCMXmC8EhfCoLo=; b=qu4R5v0fLy8g1f
	1ZnIMXoUb4Yh/SlXNDKeefhFmpZdwvUPgGGMVry7hQp4bodrBBhgbvCbYoEMWnVY1+rGYQUUO7N9p
	bMC+sjpFLnkoGrjthfJsq2nJsjrKBaeCaZKuE0+ep/FgB9tPzkV1loWHkG6sd3ifpOWGufEDk5Ome
	QUACguLNiVprl8Uw+3goRLgGBkwOUfIv+nBsfaoJcM3LnvM2XRvJiMGFJr9g+OUUggggyUfNg2G8M
	IxlDjnUGlqEYeqSi3O/L+f20+IfuFTNenbk+8Yskkgsurpmase7nbkJwQkgrH1giUR14dUNz2ueMx
	BMNal/QkK/H72G3eyBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURd-00G7GX-8V; Fri, 27 Jan 2023 19:31:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQa-00G2cG-AE
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so5533366pjb.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75NYeBzTa+D//nXwSO0c9cu0uNpb/RJgMmwNWXsNQ7A=;
        b=YY7c/gb7KD4BgGwCl4QuD8RpNT7TTipby8rQS1fM8ewCQdAAVE7CoiEkS36lf3TY1+
         j3OpeGdZzI/FiuYvcGelaEpd818JPNjfPw5HRXDaKrEsFrqQR+6h3u2BoRBgd9QlAccY
         HDaOvbsPh9oJjc7aXIhCOrLyevo+m6Ry6cj+mJZ8grdtEokiLxkJS3Wgb67hSnJ3ny3B
         fdGvutiKC31lsRsHB07vjTgOC5Mh7oUjuEQX5QwOVbq5DU0s+Ur+Y7Z/GcKfyw3I0xA7
         lPMsCdqnd8ySESkWIsbXcv5QzXJOfH01v3I0e1Tj1NG1M9eSLmeKg5cOtxQhNaIVEsDH
         tagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75NYeBzTa+D//nXwSO0c9cu0uNpb/RJgMmwNWXsNQ7A=;
        b=YIwKJXK5Cnfg7NI7iQHKP29f+2umKV/p/czLGeAkFRJkc/TXe1JqEOPj3KP723RZNp
         AOWXtCfu73vudY8W5rnLDt/yqsffqfEzkt3jLmYzP27yudNJiOdevRmPOWMydBfe6NWk
         qHCsC68NQpPaGUVlCZ1eYCRhxuOVOhu0IzQS1pb5/lhMXCj5HeZdUmhX6WhRsRR4jfx8
         DKdQ08eJBcg+Mj7pWC5MRYoFQhCNVdzuqi02V4iOhF0V6I7PEAhy++e7oZ9HdmXSkcbm
         Gm16Nfi2VNZeYg5l0jdFdvbFbHY0RoaZuRa0YyOU5pYrgX8X2Tj4LBrIaLwyNKMRIsJy
         1MKg==
X-Gm-Message-State: AFqh2kpI6U+Ggf6XphD9QMh/Vc+58hCrpzcVCF4sLFOYJQN/z0XwvSr4
	BLH7ZyGx0Pv2Y/x8Ai31sK892w==
X-Google-Smtp-Source: AMrXdXtpndneDdeSSBdxCsMnxxzoCdgvpXuk7zeWfLXM+d7saHZXmYD4+9nx/fhrb0dq0pShXiEOXQ==
X-Received: by 2002:a17:902:7c93:b0:194:98f0:108e with SMTP id y19-20020a1709027c9300b0019498f0108emr34153952pll.13.1674843978225;
        Fri, 27 Jan 2023 10:26:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:17 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/14] RISC-V: KVM: Return correct code for hsm stop function
Date: Fri, 27 Jan 2023 10:25:49 -0800
Message-Id: <20230127182558.2416400-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102620_422605_547B68DB 
X-CRM114-Status: GOOD (  13.84  )
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

Return an linux error code that maps to SBI_ERR_FAILED i.e doesn't map
to any other SBI error code. While EACCES is not the best error code
to describe the situation, it is close enough and will be replaced
with SBI error codes directly anyways.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 2e915ca..619ac0f 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.power_off)
-		return -EINVAL;
+		return -EACCES;
 
 	kvm_riscv_vcpu_power_off(vcpu);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
