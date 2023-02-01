Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB2DC636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLrAQD3GMBst3GuHHSEoXPMg3suqnxBrGbOVTqcPazU=; b=e52Gd0+VQuNljS
	HojHoYd2Ku24zz4/S4Fpw3zSwev7sV+O+uhjkQoK3BNjNIDxLV595IqDwBuJDmbPNahZUd7DduJZD
	KMZ1duMP27jgmTcAG3SgU7fxKZxTlV3NVK4fEyz5fDSb0j8MgMLnjA97bTYERQVNGutSO+iUodEN1
	o2ufOkk9v4mF+xwjmkGwz7ci3bVjPQfY8pO35tlwEla8z9VX7EpnPEvfrrP/O06rIuficVbCMoCB/
	/Buri+Mk1k7o3PMmdIzqbkreHLePn7rozzV3tN6bLr9IOeOqZJ4310k7DK5XD9NSvmF3tq3NpnDGA
	VBDZP8f3uUxLn16rq94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGj-00Dwks-ON; Thu, 02 Feb 2023 00:16:01 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrLG-Fd
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 88so246361pjo.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl7UMnqTD5QWwSQtcMHkzcnwz8kfWWwFumdLwjzGjWU=;
        b=AYyDHKJWglbSzJEBLsLPFIGYX8v9aHwYKVczL2pHtwC5N22rJfU9y9NSfKlgOdh0fv
         w2W+uyo3DAMX5HmdfdUMCHzWsJeZy1A6LGouRSP4Txaz+2I7rPOOhzpZdOqOYLabMum9
         RF8gaSlxNxAsjzgxjAIujsLqXF61EP5lrlmVFpApJJZtwve5f+cIe5OLH86MvYz6CW6T
         rHOlw5+PXp3yiMoz5DPxDc/XfO3kd0E/hj3ETsWis1HuVlSY2A3/7kI9Z2n6DIWw17X5
         3lvZfhscfxSjPXVvpZspLtv8cxhpBq6IEqz3LxbptRZntG5zYI7hXpPp+IU58crDpYAG
         e7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl7UMnqTD5QWwSQtcMHkzcnwz8kfWWwFumdLwjzGjWU=;
        b=nItcTiJIIybA1xH0orkVe2bUyYGyd8y5ytaa2e6z8q2nmhi2qcKpk261LHKxRfRQI7
         Tkz07JFszuULy8MZdQUwCgFLuV5Bu7tAjq2wxZ9rpFfa93YTXLiYz5Z0TO+9A21A2Gte
         O1B2uDQhQw6TK2gqwgY59Rn5NMr9qEPKrCNYrsT9F59FQg8siEIlcVXFKGKj53nk6V8l
         pHYYU756DnGBjgzN8jRqyThM3SN1j5Q3bdiGGl84fm3zr6bJci0rMMhcoOs5sxAbVnIt
         EsUaPSYoqW28z7puhnhHK1sPtGD7UkV54yI73ilEQ+bwmszIszocWNPwmhJ+sQUhyQYf
         Ct9A==
X-Gm-Message-State: AO0yUKVad0hzq/yrQ/7Mki25SH9i8wTAax5lltI2/zpMcACJ6eXU5X85
	tjljt4qhHhHWEOD/xw6DWvWV7w==
X-Google-Smtp-Source: AK7set+Zn3MRswtmIYIu62T6jZNygP14u2L1nwSLIM7HoaQCKkcqy33BWtvgX2o1OqydHiDIklFHUw==
X-Received: by 2002:a17:90b:3148:b0:22c:5f97:f6b4 with SMTP id ip8-20020a17090b314800b0022c5f97f6b4mr4143148pjb.44.1675293177450;
        Wed, 01 Feb 2023 15:12:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 05/14] RISC-V: KVM: Return correct code for hsm stop function
Date: Wed,  1 Feb 2023 15:12:41 -0800
Message-Id: <20230201231250.3806412-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_611586_9F35526C 
X-CRM114-Status: GOOD (  14.08  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
