Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E589606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szfjb03Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTeKY5G+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n0IVd+/+PnjJvpObmtlZ4BrQgYkBSB7rNJpquLZTa2Q=; b=szfjb03ZCoCfLnzNwF9TNaAD18
	AN9ULIudcXmqamonWWAx5jCUntNDCfQEDabjLTAGb7w/aCuMZuQf/YfvuC4qnGiSFNqsLp3LbRqg/
	EBZAMzIcADkEWdUMJ56qspxhs4HPtzKETZPodQI4NXTgXxu9wZwxE2mb4itBdE13L00hM3HLUCWtX
	TVhi3PRmHWB7pmfCY85PKNV6bo4mZdlIi2UO/ra2XdsUu5JnjeUJiLzxTnZeQz7AseU/Zb9Okv1gz
	zJqFF1SN+3kbpq0K1EUyhFr/TL+ERHgCgHwAfDQSNdm6TAzDqcYGAmXpdx5czxSHLfKirL/Dv0EGv
	YcAwaVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJmx-00000002VQF-11JS;
	Mon, 26 Oct 2026 12:26:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJmu-00000002VPh-2YrC
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 12:26:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1706229f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017610; x=1793622410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gL3nVuT0zGnPNm3LgLYm/ivg3jkt+ECKsIhuLzMhEdI=;
        b=cTeKY5G+vIvIn31HSuwU6fMV/BO+nP56ZIathO/ViB7WKHWsBA/BHr0Z7Lnq5Lo1Di
         azIlf+V+942JJGtzzmMZmbz3NZbiK2yMD5oRhvJSpuIDia1RBg0xUal2po4Ic/3YrETG
         c/fa3RttQKtyGTgX2XBkkbaLxs3/LIr0T3wuD4L4XZsC0QVKYFITY6rXO38I06D1A7B2
         hEeyE5rOycOQDV3c+oHFV4ynJECdP8jrvyL7VzLNT2tE3IUnakcX7vtdAzv7oQ4AEm0H
         OC4sqMft4G6n7aHkr4JwSxe/RhxiiRDQ7YxIMqL9nJeU/ELLMhlBTsjU3Ip4524qkomc
         ISUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017610; x=1793622410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gL3nVuT0zGnPNm3LgLYm/ivg3jkt+ECKsIhuLzMhEdI=;
        b=X8IwBE1D3iwERPcdX9lVqTKuyOvttKCSCpUH5UJaKRDjqSe2RpJZuo7Qbu75AfhHEe
         3sH8rFgAUpIbGluqI6TK941jIq92XKy5pu5CXNGRucgsgYCE8mJMHm/1wElgH70fCfNP
         //Ws2jBvZD7JtNK/7RXe4T8O/jvKt0hdql4jyREgZdkx/eukicPn+PYnqmPXE08qgwo4
         HswA1WYnlD3Rw70chpNPhi50jtkMIuJqzGpLHthd19fvuNhoMOwKejqwCvdKrYFeuXE3
         obfRbVpyFo/AQSU85t/UF9U48RfYUMfajdCCJmtuQbSPw5ElbhtkHRrEENo4QRQhhRMF
         2xcg==
X-Forwarded-Encrypted: i=1; AKwUvByiGSvVWm7bzZql10gFWgBNwV7C1DgEnDtrQ912zLmze/NQRjIfbXJ3yUDgTEyAGuvFwaSMThJwkMKfqA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEUXvvmU0BJ359WyBM0FBvrWqo58OTgQEGCFyLrhUUIYfvl3v1
	rwgmRYM1AjND4W7kaqn3XVdsKQBlpD6yYdB7RPa1TeAJNFfEQnoNdY/f508z2Ef8Ipk=
X-Gm-Gg: AYBFou0I3cWKeGdlspjnj5KhrM3lELlrghsaXvbRLZqMqBJyIbFuWmyEnuFOsBwxGX2
	Mer27dy+ynPeaskdaqJRI/R/CMssfcdUrWO5bFGrhIVEdfA0VCsc2AhkmB8e8iHphNPUQe2Z1Of
	CZWiKEKTi+lmPTM398DFIaj+Unbhm9msadeQiTHEUxi+ZBj6INwPmRkQU+lPM3rGz2SHpVS02cc
	2I12xk+ocP2VZFIoApaWu7r84Og7X98wFoCLbopNzybOetPhed2TMuGuTMP2VkO20+vh0IQ9xyg
	C3kEI0uIG8bNoE2cR4DOXb9Ig/QcofskUNdQvQynsyTLvlTiKxkgoYw22dZf4+xid+c7LjKSavl
	HoO9hfD7ZoTEm/AA57WKq9d3+gVLrOQ3Vs02MUvxPwEOkzXqTyevGNXiWuVK5vqqH1STLqEmOPs
	gQPxgdf/BwgeapRR+vNTjXk7SghsHIxdnm9vdRDOhurMiV08TPTX2//tT1p6w7Sp9ZAL0YkCLJ2
	2oQwtQe/jgX496Juk0GN+0B6LweHV5K7N5OCeLGZUf6Ud214Fu233KaOfo48dusJkhvR6w9
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e3eb859dcmr12177313f8f.16.1793017609862;
        Mon, 26 Oct 2026 05:26:49 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4409:7786:c809:2fc3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm15792342f8f.2.2026.10.26.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:26:49 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bjorn Topel <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
Date: Mon, 26 Oct 2026 14:26:42 +0200
Message-ID: <20261026122641.3292904-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052652_654271_B3086359 
X-CRM114-Status: GOOD (  11.21  )
X-Spam-Score: 0.4 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imsic_irq_retrigger() writes to the IMSIC MSI register to retrigger
an interrupt, but returns 0. The IRQ core treats zero as failure and
may schedule a software resend despite the hardware retrigger.

Return 1 after the MSI write to report successful hardware
retriggering and prevent the unnecessary software resend.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 95ff76e63a69..5f72b2a80887 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -61,7 +61,7 @@ static int imsic_irq_retrigger(struct irq_data *d)
 
 	local = per_cpu_ptr(imsic->global.local, vec->cpu);
 	writel_relaxed(vec->local_id, local->msi_va);
-	return 0;
+	return 1;
 }
 
 static void imsic_irq_ack(struct irq_data *d)

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
