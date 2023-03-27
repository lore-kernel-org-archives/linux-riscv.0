Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CC3C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spjRfcLsUKpq5098hPyIUo6LGBpxaS3NiQVWaR9VxiY=; b=NeQuePDvSPhASQ
	MMkNgQvn+sapfzK9ADK9GVsNS+Uc3KGlvHoYDdgTjMAuEdNli5BXRngotWjlea2fKZodSn2wX0/5F
	bEAqnpDZqmwyvtDkjzV6bJ56GhoZmMN8SaPReEpS1bT8PmvowNMJIrWcG9CcJ8fpgAkmNhfkkYRUk
	wTQqcQYANDpvagxHIiN3SakfDMu08zlxRzr66GUQFhPzFZD5enErCDpqUoBvoadXGGcmhEjql4Vwc
	+cY2LHl9CF4LQrpJNowL44vzmzpS4+/vIfxeUn9afpdal7RBvgCkzT/K1o4I/68ydjv6qW+OQZrHd
	WHfj7ukr4+7macwqFttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq44-00BluH-2k;
	Mon, 27 Mar 2023 16:51:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq42-00Blrz-1w
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id k2so8999657pll.8
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935881;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbAQf53FAokWQnx9Hl1GNT2kMHatESLZYwwPAnVmB08=;
        b=BWDccv2nRJoHZr9MsLWYDDRsOQ7r3Wn0UVHdJlNNFUYXGwtCwrMQViCD6PlPtTg2Oe
         wermLMINocauElbnI4HGE4dnhPmtYLHt6Kxl+mpSWJpUhZn+x8HccOFH2hpXrGlJZjZA
         G+JqH1yMA5zSOPyC5XGj42FvGvlZyzrV2VtpZJcE9ZnyZZuJaeueiK65Bq6npEc/negG
         uv8dTwHge5xvQVkyhoZUqpYOffNNB2WuF9aUpT/v9YV1Nuwbzjh2/yI/ODG1AVL5KHHC
         9mQkC1w8sc5eaFuQxRRRSNdnxVUbAh1yLLba+R5TYFzCVfR/MwdOwyUczFmG/rtUkS8g
         dN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935881;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbAQf53FAokWQnx9Hl1GNT2kMHatESLZYwwPAnVmB08=;
        b=xl9WMyGa+QU1WFxFke0RYzlGkkVKsq4EL+4/TsTw0RbP9FAQNIswUuz0tDM0LHA6un
         D8ock/Z6ncOdsQImqo+rS/4aQ3ZxP99qUULeOPFrqUEKQgPnoR3iezy+RA0h9m27vkl8
         KEUfAYHWVUF/yeTmHHPzG84m1wrM7Y8j4j3b4czzkfStzToeb69M5nrm2nBKEZOQrBnw
         lE411F+zHnQBu2LBHYnjlz8DxiYkv87/WVjSZSxZoVvOeDs/T4B1zIuzL1HhiMoQgvFR
         CAXH4uqqxhHDj+HPH271rtNuK7FcRq18EK/Ld7K81BRo7fTgb0snMn2W7AEHkTarZOut
         UlyA==
X-Gm-Message-State: AO0yUKV3TqTy2WKnRM59iDTqieWPI0LZt3A1N3JomZyvZ4eK/rFrTZlv
	hhOIaig3XYATtN5k7sPDekq3iRv2Owt6xzzR8CqsvRbBPHv7sp4jgWDlax597/EWWXDCVFqh9Pq
	/hQ7AhMBvWXp+xjJn8JBcx9aqo6kW0eCYbLu73QcksTnX0UMiem1jRiYfxKPgVFqNZphtGKhN8O
	hJIbvZIZFbl1y3
X-Google-Smtp-Source: AK7set+S9h69zKt68G0ddcaputyDZLQS/VFJmLWV3zg37fQviXsmrFpo1rlOaWyul6KYYImLB3755A==
X-Received: by 2002:a05:6a20:24a7:b0:da:a1c9:aa0f with SMTP id m39-20020a056a2024a700b000daa1c9aa0fmr10541584pzd.14.1679935881624;
        Mon, 27 Mar 2023 09:51:21 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:21 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v17 15/20] riscv: signal: validate altstack to reflect Vector
Date: Mon, 27 Mar 2023 16:49:35 +0000
Message-Id: <20230327164941.20491-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095122_659177_B0D5F7F8 
X-CRM114-Status: GOOD (  10.25  )
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

Some extensions, such as Vector, dynamically change footprint on a
signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
signal frame with the upcoming support. And processes that do not
execute any vector instructions do not need to reserve the extra
sigframe. So we need a way to guard the allocation size of the sigframe
at process runtime according to current status of V.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 40f740183768..11411e113f0e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -469,3 +469,10 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = get_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > get_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
