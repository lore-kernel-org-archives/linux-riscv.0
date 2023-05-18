Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CA5C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5LqxxpFVCjPfNdoxB3TWHJj9h54K0yGxDCMBztb/JQ=; b=PZTI7X00TZW+Rr
	wVsLiCR44H3Vn0Ma82YPRQFZeQn2yGkqBGBx/pOlllgyPjdsKuU80nViRmPbxvpQQdqATccj1rAQw
	L2+y+wNj9IEMqYn4e0QRVmGbVBYPngVVmh9LpLV7JF5rgNRIWcbKaqkhEpQ4LEwb2WLEcptzDePjp
	oWTW5qa3D85YfjV1aUVgYB9cFb1Dt63Z9wBoNYSc5Uh4n5hZUZmPbRTTOMCMYQKWSN+i3HtIfgKbF
	3R0mPuJG0S4DAbyLGL6gzrREyc20pBCUv7V3fQCtJ8QqM+XQjhBp+7Gy3hwRhV0iZ3FL5Fmvgp7bV
	YDFQRAre78k0kx85oKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSi-00De2J-0Q;
	Thu, 18 May 2023 17:30:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgO2-00DRYe-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2981e3abso287719b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426913; x=1687018913;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=fXXOF4/Pv9vy548q3wB5i638VAiAI5RYEsTrUBc+Lb3gM4Hwm4KD7C22YFD2UYd0ML
         EIj0bIxGhmH+aHUWUB9gwOOaPmFfXe5AqyUqObzTgtiqqDzj5Q4VW4HNpdCjTrhZLV9j
         9oqEDZAwj/wvOqjtp1dRpunkjC/CHuxw0voOQEY7kBVb2SRDde19L3W5bAC8TptVZFqK
         6LZe3vGGTBKDzTJrE62LgcbN2Ok7fJT2iGeFx69qUBMnA8AkjWLkOU4j/UqY74sTYCP0
         OiVpmvYhYne29PDTYzXxEAv6pis1jBjDNnuC79vttpOziIMEnRmCcYdyb61Vi7lRumPc
         kgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426913; x=1687018913;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=IUocdO/yp/qdR0t/lCMBQVE2zM7OxgM2zZvnjjHX0XOcFKEq4Rj+KDROqj25658JbZ
         ek6jPdT4gn7AN1bkaNX3vv+00P6D4c2jTxn+V80Inu3pJdNFR6dqrt6rc4bKYOpc+PRp
         UfJwBiC1CgxcetxQYow38L2VFdJuRj3VLQAmdlzWM2hKT3LMAqot8qo80Pl84PM2eHMo
         aCe/fGiYsfFZH742oCifI01zPJ3/3mQN3/it+C4yorI+LrJytHMxgCqvka2B76hmLlXf
         31NRwOEbM0GrTkRO/jsUeLfayEnxYPU1QvlhzWg4hbyX7ZginC4UhiFcDrF1RpStJwNJ
         QNIw==
X-Gm-Message-State: AC+VfDwP7Th0N0oHKlt0QZoBYdz9y3S0TaP8+YZhGn3oHzLxAcNG6Qjg
	nzBLwcYvQktXV6gwq2V24l3UHjfPJIrIoINwMqM1KoR57MGx7gDTRFWVIIPPNdN7Zdle1YvvulY
	bObVZO/QyqFZVOAKbfPnT90ITHNtJbDXZDr/v/s8bcAv1wrYJj1etS59H5w1XpW7fVT4VSEHbGy
	y8cn95xxHRTQOZDgg=
X-Google-Smtp-Source: ACHHUZ5zF66YmJviWU3jMsRmaNPWP5h2OCQhUdkxpbsBNEDtT+ng2Q1VyqjENFKM+MPelZ+ItaoLOA==
X-Received: by 2002:a05:6a00:17a0:b0:643:ba77:f265 with SMTP id s32-20020a056a0017a000b00643ba77f265mr6240882pfg.25.1684426913165;
        Thu, 18 May 2023 09:21:53 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:52 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v20 16/26] riscv: signal: validate altstack to reflect Vector
Date: Thu, 18 May 2023 16:19:39 +0000
Message-Id: <20230518161949.11203-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092154_169712_7E4F77DC 
X-CRM114-Status: GOOD (  10.77  )
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
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index f117641c1c49..180d951d3624 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -476,3 +476,10 @@ void __init init_rt_signal_env(void)
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
