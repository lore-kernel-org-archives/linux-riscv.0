Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2119C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szvUTiXtwLqO7vBXoVDXtcLmkXI0v8/egNKkiGcyLRo=; b=DwwXm3QxUWLieC
	pfHrgyhvvLClzRagwPhMX0sAdRX93/XX0HNZR3F10I2/q6HvwIfnHDZX2VxPxGYCPaEMqx6EDd3MU
	tGDRFwTDUfO4sauc6KTCnsDZDWMg/a7lUoog1TqeBWr0E7L39aqz1xrkWv9mKxgx5kkWxlsQ71Xts
	QdSdLueP922nmHxzAVrb6rE1TBJT9hjpdSDqgZ6b3TyvlC/1opXKS1V+GbEXNiXWWr23KyS1SaSFb
	fD0hhcsg5z4Vf0VT27SuF1sPt3gLYrMuHzZpJjHQlhyXf+lk4ZFs3kT4A8+fLkJzFWTpbRTEndz58
	mRHPAwegdpfGiArp1g2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PF-0025hq-1r;
	Fri, 17 Mar 2023 11:37:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PD-0025eN-1K
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:56 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so4854459pjp.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053073;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+aD01a07TD9YiAyArNVpoWUMoGh41bK5OsvLALwwGTk=;
        b=kgz33J1KTriakXGsceNyZdDcVQmgksAsmhVAl/JM3kI+JZxyb7q9TueRxzUxqrnVL2
         kZ1EPX+wNxy+z5TjRoyR5BMjusEV+Jg6LxJHWmM63Elm3em3Y7vFS720jxtTKOgj1k/H
         gY3ZfvYcvi0ErSlRIpNvm3Xq2umG0E47PJJA/9gNsWMMG/XMpB3fb5I3vZ/akzgBmYlj
         8GVJxiSl+BAdndoDCsSv3H8mfB4HiU/jlGF7zHOhoSiIsVueDXlJ6O9iOZDKvhUADYpe
         IdiqrLUuq/jRHt6/pLTAwAVDHf4fGULXgYZKDH0z3U7JduJGGKkW9HGS3vD3G9S6pHjm
         sVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053073;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aD01a07TD9YiAyArNVpoWUMoGh41bK5OsvLALwwGTk=;
        b=g40vfXGaBLvdH/hq936w1Apjb7zWjYbl0pwTkMJJF8k2WqpxIfo0iTLkhwVie4PnmO
         C5Eqaz2bN0ICIs9bxBamNZk2m8r1/D7xtblPFtweKKQAhJWxYR4omcHycDqnocasCMA8
         vAob29wNMRljgd4UbqOvCgN9kuc1Hs3QVzPIFr+e0Sj3oJH+JK5+SIvlyQzQ3GdS7joW
         OHPcBO10C/G6XUqWHraJ5KTH5iuFDog3/9a/PKLMk/xas5C1SSvLusdP+PU4PKFdQ7xc
         89rB8aUhOaqh2jgy49IhtC3t1TrYw3X4BPulh82CnuwHB/xROhnQqGoxnVio2/zPpuoE
         brLQ==
X-Gm-Message-State: AO0yUKUzMx8JErkZ49wUqzvMF55Ky6/43sCEYnm1aAX8bsePn4Y7P6E3
	S7NujvBLHLABCjfBZ7FioNIGgJiZ7oIY4bGGc2vKu3bufWWCQI9B54JgBd3uO5KK72WJm6SG/4I
	C/EHe/WOHsb8aSF31gMLA/BmASD757YXi9x8+EMhrJAxLflxDoCCY7zwpN+VguvkXek5r+PjBPP
	m5i8Hz8sDoGD/P
X-Google-Smtp-Source: AK7set+QG1o+yUDrVrmWTPRkmTPPW7OcS7fKYgXunBMDI70R12mYh+xc8Szb1J7aY+sAETv+D8BIqA==
X-Received: by 2002:a17:90b:1d87:b0:23b:53d3:b537 with SMTP id pf7-20020a17090b1d8700b0023b53d3b537mr2943778pjb.1.1679053072800;
        Fri, 17 Mar 2023 04:37:52 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:52 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v15 15/19] riscv: signal: validate altstack to reflect Vector
Date: Fri, 17 Mar 2023 11:35:34 +0000
Message-Id: <20230317113538.10878-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043755_446618_C4F5563E 
X-CRM114-Status: GOOD (  10.32  )
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
---
 arch/riscv/kernel/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index d2d9232498ca..b8ad9a7fc0ad 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
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
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
