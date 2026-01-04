Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C97C2A062
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF9ydBprulHxyvuG8VMkOVGLzcIYbvGUm1RRzsxeWJk=; b=QLmP8aTAva4jcq
	pisK8CZPD7KdxRSZgCEeQ6AvJf50LKoY7rlin82GIm98vB743PQ4ly6tYC5oZ1bSvo2a3ULK+r76l
	ODbqHym9y0jfeGqKgDQyxa09AGGHE3KlY/aAMv/vITAXfTWPOu0oLXw7OUKsRGeMIX9xLqamBz0Vj
	OUsRNp/rWEqjPD3losNLrtCEj1AK1aHwDUbSkmMXknATtQfL2+d/QlNljdeTYLNleAx575uX9VMqe
	e/gMRC4gSZRSdpGoEyAtbOQoPZ900dFZtw71zniYOduKXIpMTtEhzu0xC7D7rI4pxxqazgZVR3uf7
	WLC+WYj2ZdmYmxd8WO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeV-0000000AH6J-3loP;
	Sun, 04 Jan 2026 14:00:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeS-0000000AH4c-3Uh4
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29f2676bb21so185171595ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535212; x=1768140012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKC0H97nVlNsmqfTcj9M3djnqsg1WIKTEJ/Ie/Lsi00=;
        b=U//YoWGyanXT8HJR+PI/odvAw/GMcDZ8DulxddnHBd5fwI5AN2/NGeU1RJqivxi8hm
         ol2fhK9/P2Mu3NJI2PxueGTWP8D/rtb4EIIxI3zh7DtIE8QnVR4QzpJDaVGTOFMfDNM0
         d4PbYpjyrmUDd/TD48ojDPyGR7wHGNwwUqO97T6iA/2aBvOxeR95plZ4EdBB+CdJemwT
         JW1q1B97BuE1L16v+sgxBtxBNSz4aDGoN+nonTr69QuMVyk217UR8M8fMoT7CWPPSDOs
         LkdaUg6FslQWvz3WonvgzY1oF9a/rlPWK6Dc9NGtctbIA7C+yv3msCF+TnfZEYIHDT/Q
         /52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535212; x=1768140012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKC0H97nVlNsmqfTcj9M3djnqsg1WIKTEJ/Ie/Lsi00=;
        b=HL4B18oMi0HgUSrcUZXrMYmd0yT1eDwAJJIKguimSou8I/DctTvM07BBOsLzYholy8
         feTf7owjts43It0vVm0tyWFOujEW5yAGzeyuN3vXwERgqO2zDB1LWT0AdSNuiIUzGBH7
         oF/s7LQrdg2GpMJbvSSKo+9gtdxYNoTQGlJ4ikoCPofZxpYUvf+3Xk30x89qw44BcEKh
         F3WmU1FMxh9wZ3TYw1vyq5fYumCzwB28u6hbZsfbjKjCZfmVC9UAnoanmAMuGhMuu1Ww
         AuQmUekoA8rESS9v6D4u5f/DvAlVetxfBOOYcxIU9iBfhLPwJxGQwZ6H7QPr7WL1Ctcl
         JO7A==
X-Forwarded-Encrypted: i=1; AJvYcCUCPe32hDNl0/8zh+zwKtgniXi5r/clbHPvLm9NEH7p8kwx8PQS1W261H7DvC6ey4cy3OLtJm7zsrOpnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz431zTzrYVA23sRAhV7crMQbTLa/Qu20TZ9ejkoVCZPomDp/U7
	vtqzCtDAY0T9QK8qmnTs0+NwBarZNEdSCNstqfcbY2tIvzp36CiAlqPo
X-Gm-Gg: AY/fxX7oCDa18vtoqhssT70HYB4PJwYjdsd7mEYHfSzuAq5nVpInlZgVj7HjJ+CF6P3
	uYLgCznoZcU4Zls9xB6WGSzo5jJ+bn1lwsnIWijyQfqZUq8O0C0iwNnjGH4ElL6MVHGBFEBgSmM
	AuVPbQnUcBdZxSOrX5CaqmiwUIxjvDAnKH1k0vguouc5Va+pQieliyjhelKUuvFHEzc+LJCDSuh
	wKqLDuqoLnU1fUNb5Zq3J48ANrBka+vG/Hf6ETEg5cfy77efiX9Yw2VgYZFC18Cd1/jN/oZh9SQ
	Fl5erAgs1Z3Y73mvFxYjf4jILdkKppUiAxWtM8JpgZAptNDhhoiGw2VYBNFgwiFLmwQo6+A4S+Q
	jzByCkRKZnYNL5lA+jhcyoSS8abYwrdnGwxfqqASBo+zBKyFbWGY3ie5Ra979WB7O8jtV6v9iha
	aY6HTU3PBBVDFNN+U8nO4eWh312UvnXhvRTOXPdulMBB3p/JOrO7xW1cRgdJ2hOVwD
X-Google-Smtp-Source: AGHT+IFWhEWVgZjHasmxigK04Dcv536ZNizp8RTdkFnv5HseXa6ZLIKf5NEo+F1Jf/zNHtSMHWTSZw==
X-Received: by 2002:a17:903:2345:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a2f220cebfmr462612735ad.3.1767535211800;
        Sun, 04 Jan 2026 06:00:11 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:11 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 22:59:36 +0900
Message-Id: <20260104135938.524-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060012_918747_23894558 
X-CRM114-Status: GOOD (  11.16  )
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

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.

Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
