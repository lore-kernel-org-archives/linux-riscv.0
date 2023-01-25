Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A0C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW4zhFaWKW/AlcKqvKr0nfnSo/RlERFj8utT1Lbap6Y=; b=rrs2NGJMkdOAAa
	94BeyJgA/QVjtUNBqO5K4VGnTt9qdHKieIwOC8QE7v6ceukRyL3zf8y83nAGx6V4vVeXbeV0Xi7x6
	FwQekeSgVY5OPmbvSJd2/APA/hF2hpCQhrR5Dz3iGufYT9SLvdHv09cS2tE4XfPZevUf6YhKZCV16
	0ScKGdAWEe5lhv6LltR+avbGSgRGPxJf9wWjKw/1L8dIP3/p9YXvkBiQ4vRajAdiIZnCyQAHQw618
	/XKzlXXc0hm84MPFoMa2GLGueieYAxus8G4JdQWWlRXqplJOHMy0ow17WKadTBNn3uImSwIjqZQe7
	M74S20iVypK3eJsXEI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeW-007VDw-4c; Wed, 25 Jan 2023 14:21:28 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeR-007VBJ-JE
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so2225782pjq.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZztKbPQsLzt8BkZToULMHP7RLL5DOETtnFda6rXDBW4=;
        b=M7PSBAfL8lCg3IRJvriABmVXzdDB71pqt9wWeH2ealTRhCqcrIQAxsf7UmVzo7B1af
         FJKBZy0vdojJZAhG0yBCMreHoLAiZ5ATs3aF3gfHL7OuhKKti9eOobO171tUV2iT8Xq7
         SpdnikTCRhcz8qpTFVRkSylA/1gC4hqn6SRsRFDVs+GOc211gEGE5jOhmt4U3Fic9f6P
         GpffgRhKmX+zqhMnrGIQuXTGR6F5oteCVDqHj9I4Austv0BxLJAE5/94FherJmmz4adN
         K98oLTMvnmxwPhBPSCeikuo/gTvVUiOYr+VIkRRoyic8AODJrozfVIXtRqTTHisJ/ayY
         4NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZztKbPQsLzt8BkZToULMHP7RLL5DOETtnFda6rXDBW4=;
        b=Fgv+Cax3Zmxfg6BMJQeG0hMoNGPTEO1qrWeb+uj/gkZAGAe9TxaIRAVtLIrBQM6cCx
         FO7hEJONdffd7q76lxa/j+fV96lUvY8hGqUDZgn1/C0GX5QlBkDHzMQYN0Frfq3Nzbuv
         O+XHBFPtRNpt3t0I++0GWcjfRxbozwucZMmh2KpLtvLSSxSmlzzDuaxggJY61RPLaY7C
         6bI1eFGyhJCrYZOtO8TzofBQpXiQL0UTuUTRg7jI98tYdHX1hlup2QmPCpmiqBOASX7D
         27mOJBqF+JbrRY7pddmsd9enCrM0ahJxH2Xp4+FFyMqFahMB6nGKaxnkB9pvKU0dHTg7
         xPdg==
X-Gm-Message-State: AO0yUKUuPTR+G74uOZtCT4YCvQJXj8RlxIALp/OOvKRaKwXiB4T9p3fk
	LfqogD79JVVHY+GCxbPYPXsVnoaLxBQjG5zoit3B0f4SH43Yi/Su2Ms0RAo60KYrHElG8HquH8W
	Zjihjuppk4sL121wNf2BOgmxc99szCoDv3SNnrGo3kA8Fb1iLi+JQ8YuR98oZ1XArpevwowYyzw
	5Wb4Re0BznKA==
X-Google-Smtp-Source: AK7set9tpkQRtlrOMLyRqnjIVr9Ee7HeqGlPTKuGN9mYVi5OySYyrzx7sPHwHNVKlDUUqSuRhWtJ3A==
X-Received: by 2002:a17:90b:4b05:b0:22b:e0f7:5aaf with SMTP id lx5-20020a17090b4b0500b0022be0f75aafmr8610060pjb.34.1674656482940;
        Wed, 25 Jan 2023 06:21:22 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:22 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
Date: Wed, 25 Jan 2023 14:20:41 +0000
Message-Id: <20230125142056.18356-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062123_637104_F19E50A7 
X-CRM114-Status: UNSURE (   8.64  )
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

clear vector registers on boot if kernel supports V.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: broke this out to a seperate patch]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/head.S | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..ea803c96eeff 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -431,6 +431,29 @@ ENTRY(reset_regs)
 	csrw	fcsr, 0
 	/* note that the caller must clear SR_FS */
 #endif /* CONFIG_FPU */
+
+#ifdef CONFIG_RISCV_ISA_V
+	csrr	t0, CSR_MISA
+	li	t1, COMPAT_HWCAP_ISA_V
+	and	t0, t0, t1
+	beqz	t0, .Lreset_regs_done
+
+	/*
+	 * Clear vector registers and reset vcsr
+	 * VLMAX has a defined value, VLEN is a constant,
+	 * and this form of vsetvli is defined to set vl to VLMAX.
+	 */
+	li	t1, SR_VS
+	csrs	CSR_STATUS, t1
+	csrs	CSR_VCSR, x0
+	vsetvli t1, x0, e8, m8, ta, ma
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	/* note that the caller must clear SR_VS */
+#endif /* CONFIG_RISCV_ISA_V */
+
 .Lreset_regs_done:
 	ret
 END(reset_regs)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
