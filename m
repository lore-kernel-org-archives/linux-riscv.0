Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B220C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CX9venyRqy0rymfU5/p7f3MHN0S+eqw2UApdW7yKpo=; b=XxZ5lpfKX1y2ff
	U9pfu5A/I1o4MJY5oPpO4XvwU4BfEQIdbsNCibHv+EKncxTsmcLYNc5Tig9WBVuXjcomAo8xW+A0h
	k8mSQXZTC92BHco6uCDUnBzK9706hYj/1spzvV/q8Fu3h/DzWN+p8iOwAH9rf9Jjh1+JLSQLKRZ2f
	9bISzLQT7HyqN17IJjLD9yVkQCW3jLn5zp9QLyq3wDBy4SpWq7tXOvRpRNBC3RH3dnb70YqWnPmyl
	Y41gln372Cskfo99qhlJXOy9WbmuinLWA8eDrwmhcQMhgP/Az1WLB2RWup6j5zjsjm5NtlPwhaXaJ
	iwUraGTUMZ4lQz5yr7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtInw-00HIEA-Lz; Sat, 04 Dec 2021 00:21:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtInR-00HHp5-24
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:20:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id y8so3204223plg.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBJUfZj1wOLSVbBSkze1u45jeYNaXdZ7voja6F8BPxk=;
 b=p2r/pP0QZDSxluIfw2jt799S/+VgyRVLdx3WV+GERapGrlIcVgOkSk0dUDwWJP9h1H
 UO6FfQ1+QKKYBZUXZPjA6pAKEuO9tOF3E2D0n6vfMYIm5drHEBhTAzhKgf4wysPdBMr+
 B/ERMzv31xD1YajQfY7wIN89kDe85NtUmBjrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBJUfZj1wOLSVbBSkze1u45jeYNaXdZ7voja6F8BPxk=;
 b=P2EwC5PbtViwsJvlc2k7q7Pk+YFGQHZH5ACqFk1FtdjdyrY9ccalw5miVLupkJqBoP
 lY7TWAKFQX0Kmjd/hptvQv0PXUc4r+B9kZrTw6x3t1BjPBuOSeIKDFUG2H33VfVovr4G
 LYH7X7uwAxIfFEOzvDd2m3+2XS1EyrmldDzYnjFBQjvRZmykQlyLezbxbKv2u7UbQrdp
 7crHYX4+ERx9uML2H94zxgvfdVBxs1X7hrIMG2snr5dzBj4awKLkggGCQmXWojzIiKge
 WBXN5/IsAFuxYptp5Dgt/of0K8r7aUrisuU7GbNNzXA87ORL22XKfdWOQRFPQz4TVfq4
 1W6A==
X-Gm-Message-State: AOAM533Ii08JJg6ArLW3bylQYHMYezOVo5EIkBI0ka86s+V2sn8G3xii
 6e27RZrM2GJ3xJ28MiSzJZPA
X-Google-Smtp-Source: ABdhPJwL2dTXRbTqrAbLQlne0B8GUO7mMgF5IuhtC50RnOgCmjq7nrz9bO1uLafGpEG2VMcuai3/jA==
X-Received: by 2002:a17:902:d488:b0:141:f3a3:d2f4 with SMTP id
 c8-20020a170902d48800b00141f3a3d2f4mr26461980plg.86.1638577256302; 
 Fri, 03 Dec 2021 16:20:56 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id r6sm3272402pjg.21.2021.12.03.16.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:20:56 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [RFC 4/6] RISC-V: Move the entire hart selection via lottery to SMP
Date: Fri,  3 Dec 2021 16:20:36 -0800
Message-Id: <20211204002038.113653-5-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_162057_162417_3BEEBF5F 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Atish Patra <atishp@rivosinc.com>

The booting hart selection via lottery is only useful for SMP systems.
Moreover, the lottery selection is only necessary for systems using
spinwait booting method. It is better to keep the entire lottery
selection together so that it can be disabled in future.

Move the lottery selection code to under CONFIG_SMP.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/head.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 6f8e99eac6a1..9f16bfe9307e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -264,8 +264,8 @@ pmp_done:
 	blt a0, t0, .Lgood_cores
 	tail .Lsecondary_park
 .Lgood_cores:
-#endif
 
+	/* The lottery system is only required for spinwait booting method */
 #ifndef CONFIG_XIP_KERNEL
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
@@ -284,6 +284,10 @@ pmp_done:
 	/* first time here if hart_lottery in RAM is not set */
 	beq t0, t1, .Lsecondary_start
 
+#endif /* CONFIG_XIP */
+#endif /* CONFIG_SMP */
+
+#ifdef CONFIG_XIP_KERNEL
 	la sp, _end + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 	mv s0, a0
@@ -340,8 +344,8 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-.Lsecondary_start:
 #ifdef CONFIG_SMP
+.Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
 	csrw CSR_TVEC, a3
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
