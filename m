Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC615C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0N9b1iEf5QDlmNwigyYGfBDW0aHWWPeCHs9l49sz/BY=; b=ZMplGOgM7g0xa9
	v45awKUeNmSrSMYwv7Tu41bt78xpz430fmTu56lEYCKxMEfRriC6yB8KzFoBFmwY+yj8iVNi2xpLA
	mPre+2R/NbhDoWiHdgvyPCLqmuUPUKhYANJBvLs//dmjNKmOYO8Q+AnMvYQ/Ld1Qk39+tbVNgi6Vs
	CKea9V3iIdvxjnf5aCw3bLi2I4KAGLbfru9xvGpmEiI6StWPN5rHOHZ7Zix1I437S+UyhkGiZCbUv
	wIjhU3WfPGorkyNtjK+xPxOJRGvnun5l/cqIBmUkolls9uV+gYOCnR3FH2tcDJqHWBdcu5inQ54PL
	QzVSuZ76jMHHL5ikRzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURf-00G7I7-Ch; Fri, 27 Jan 2023 19:31:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQd-00G2aP-50
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id g23so5836844plq.12
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm221noYPDv16VavlZywICLYGigsQ3r83tHpYQ6Bets=;
        b=ZcBhDH5tOacQHuA94vrShOzYvQg6QtjBICmN2cS9lLp1eNzFB5yxsNZPBOaH2GNR6m
         M5ZLuxW0OtCybveoStp55DxKU8uE0CxX5PfGQPKUBBnGgNvfRWDLBHWWcQjmA0eZe3bS
         0gICApwRPkQqa5+iA0bzYwDiu+ARraoCbqtymSf1RtjJ56UefDcSvvHA9neCIP/RLe+L
         Kq89X4xXUrnImpbZxkgb6zSUkHEl9QULQMfmpvOi2kCMFN1Fd9u6yshUOIupfzv7+26D
         FQzOb1OxA5eOjhxcYwlwt3DoLbjMDjg9TaRwKVBqiHlJ9uZ+TfYZQI2DY6/BwGy43OOh
         EyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm221noYPDv16VavlZywICLYGigsQ3r83tHpYQ6Bets=;
        b=vBFAnmdNrfldG2GGIQQEo9ptUuoXr98NAUlInirJoGrH77YiQSiYSTfTZPAXVF0KBx
         d42fCAnetDvsxjl3gobSVd78K2z2Cq2ORwnR50jCKSwKaYDlU4uLAhZmiGYV8XdTQRsE
         PXW0H8069rUA31pTH4zCoqpJjTh3+y7Bt9mdXsauC5DfgTdgfm08PltUFvujGfWTjYXy
         Z46aAaOo4t2b3HVygU6O5bRFM3pHSBPMoXquBUS3CojU3guyhKZJWmN4E84lGgDcBU2y
         J7IdxR6ndyqVZuvl+sNs93NzubpuoMuFwCcR4psBbgRiaDf9wMN3hXY6U4F9psFa788d
         g5aQ==
X-Gm-Message-State: AO0yUKVA1shzuHHWplS1HU78RXNpJlhDYCWZzyxfcBPSS8t4aV2YwCId
	VLNtsT3yGcXxUNTYE4bJGGf1nQ==
X-Google-Smtp-Source: AK7set8xtB8ZM17fWbgG9a9Hf0U5T4cRhB4mYsKyZy5+8l5WFp0aHNt9s3X7BhTHmtZJUgE/ku0LCQ==
X-Received: by 2002:a05:6a20:8423:b0:bc:5a6:1b2a with SMTP id c35-20020a056a20842300b000bc05a61b2amr9264595pzd.49.1674843982840;
        Fri, 27 Jan 2023 10:26:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:22 -0800 (PST)
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
Subject: [PATCH v3 10/14] RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
Date: Fri, 27 Jan 2023 10:25:54 -0800
Message-Id: <20230127182558.2416400-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102623_229996_D8A1B5C1 
X-CRM114-Status: GOOD (  10.52  )
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

Any guest must not get access to any hpmcounter including cycle/instret
without any checks. We achieve that by disabling all the bits except TM
bit in hcounteren.

However, instret and cycle access for guest user space can be enabled
upon explicit request (via ONE REG) or on first trap from VU mode
to maintain ABI requirement in the future. This patch doesn't support
that as ONE REG interface is not settled yet.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 58c5489..c5d400f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
 	hideleg |= (1UL << IRQ_VS_EXT);
 	csr_write(CSR_HIDELEG, hideleg);
 
-	csr_write(CSR_HCOUNTEREN, -1UL);
+	/* VS should access only the time counter directly. Everything else should trap */
+	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
