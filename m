Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA2CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Huut6ADoehkS3UwwwkTRM9D8lMffJxg4ayFEm5OMsn4=; b=XZ5tLmH2RzraYj
	UZyb0kKvzKU29kvJcMXhCiex3V2mSO/tbtsnm+Kfdvpz5DvKn+59mJ2TmHGWphcD7z/QEcxEB3AQ8
	sXk3B+LR8gnicN1M/WA4+H9pQ22VBDPspX7/xl/Kr0CuR2YFVVolDm1wzrXOhyEXfrkMuoUZ4xJaP
	MUOHgWelVUZLIhEsaXHpBYv8W2R69meafJhQAmfl8JjEDeOXg/XI4wFY16bZ/JKMtPWWe9Lzg2/1x
	TFTDBhdJYitaxbwqGhLJfSw01rfhoVztdOgLkATHeEmU62v4Ez2f8i16Tdhk4Juz9YOp8dlrzRmC8
	777QlOOOvBiziCpjXlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbs-0000000C5va-3I9l;
	Fri, 02 Oct 2026 16:59:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbr-0000000C5v2-2h3R
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Oct 2026 16:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZLuPtuADBRa2rGkYmsXjO56D54ZyazJQSU1TrksMpbM=; b=AgOQMzo3a4jAV9MVy937GfSRfZ
	LR3JH0K6vR8bRoj9KlmEt+IoQO4PQs/oZOqMTsDcilI7/17WmnOjiO475A8X2CvR7c+KZZ4RF70Z8
	LfGHcs4OQdcLo5NObmQLGT3To1Z2jOyCwcJb5ot/bjihKNGLqMOO79E3pNICxZbHH2kje+Vek6Lwl
	0RiKGkWSxXFiJcdsl4ke6pGLNHDaf+mgj1NQEuTUgZwE/t5Wp5vSWX5NRvDm7tkUMQSiePZFPqzjR
	gejxG7anF1JLxQJQfTq7+hzH1dseAqEt1i0fXQLyaytx74Ehu0RoAhkpj+onfp3e67SRx6VBCnaRX
	t0sE9Hzw==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCgbl-000000068qb-2LHo
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:44 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ec6188so40225125ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960379; x=1791565179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLuPtuADBRa2rGkYmsXjO56D54ZyazJQSU1TrksMpbM=;
        b=ObBq+emLouvyuzfTsZGfaKJWSp0Fzdr06Nxe+xHdgZ+uIdb8rOXejUCeAvL1Zer1xY
         t0JsetbUMCD2Emrd/n1XZZ1DmMTK/B7yIZ9fkXXUTUrY3jLOrBaR2YfltjVGbK7jp0Jg
         WEoYvUS7obQsqPxMkqieS/Fa0SWKUUAS2SrJ1ngVSAL6GTNciaT3fstsPxR7rFUAnnn3
         pPM8ygK2yCZ3cBWiKtKj52yioYB/8GXoGJCw1/6B6+CekOPkotwa7zoJMsT9GADUXNBP
         fK4DyD/+/H29e3nqkp3ObWv0c1auyKvFH2zFHk+9zpCTl1HWVrjrR2zztjkLnLyqcKGY
         /7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960379; x=1791565179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLuPtuADBRa2rGkYmsXjO56D54ZyazJQSU1TrksMpbM=;
        b=oQUdpIAyaFfREGYB7yvmj4aqZVpUfLsqbQtqbdjrR1DTf196kA4EgQ8Xzl+vrq1FaC
         rWRJlGywhoWf94PFFTGKv0wev4VCA+TpAFLbTFAOjD4mlNxa02ffeqNQVGqd/ELItv8k
         SM/bRNO2g1OC2tCE0JEQlp3OhhPUqilXXmh2p6zpT0pCeeReH6OstBsqD0RiQbS/n9VY
         RgUmCZbn97EcjV+OvFVS7JCRhvo7FQxdyBqRROlPlnoOwSViWZka7KAJdLnt8HzW30VT
         4G8D44nZC+v0bVybPAblJ/GewRC+hQGlvL82mwsoTnKYfmYib56UDvxM4kwOrvk+nfEV
         wWRA==
X-Gm-Message-State: AFq9FYLau2IUcxbPlHUXHKiq0qcWunctmS+LW51MBYYri0tyWmgSZW6a
	cyp8D8mg0+ZQB5iPLp7TiwX6/yqqukM9IvqHFNtx/fs/Irv6/26Mf/qNIR2UX7kErwfd60cfzoY
	FE9wbXMpggg==
X-Gm-Gg: AYBFou25v7edse7gYx6mEAgXPC6jWIucXwf3kG3nE1Ua2LwhYqMdz+qrYKrEX4x/39Y
	ymmXbOrf5cRzjGeSQ5VIuWcCzQs2M/bE6AIh4x+lbnsqYXgF55Gv9GbbeVSz6zM+nBMkuSp+bYv
	TsaW9Mo+S1H+PzM+SwR7dHS1BKv5+BW8lr9Q1MFWo0TdWogLgl/J49MJpM6I+soYA7dtqo8kynI
	mxXkAyXKN7U5KEDxQp3m+CxL6nlFXPi/d9ZY+RrJYI33ybI2W/hDCyX4Vaz2q5L0R16ZeK+LsjD
	xP5IEjTGGjYjL97zuaQ3mOrDjEdmZT8WHNa7A08j+KHALUtLFfdOxLww7x1eWuKq8Pn8E3DuBGk
	aZk/4G/Rq+tjkphJ8EnD/oHDxg7um6bNsNvLHzm9c6oLp4bMJfy2VUWHuq+bTA7wwZn8PBQUXO0
	cblxEHu8mVVjXuI2fVjVIUjwsOtT0U1Qg00BJEu0qwXrn5cMfrkco1h79VObnEzZ3216sEsNr3K
	U/MRqPDPrW83hm+rgwmd4CnHi0gRA==
X-Received: by 2002:a17:90b:2e4b:b0:3a4:b076:f0e7 with SMTP id 98e67ed59e1d1-3a6ce59f8eemr2982621a91.6.1790960379019;
        Fri, 02 Oct 2026 09:59:39 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:38 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 3/5] riscv: Optimize smp_cond_load_acquire() with Zalasr
Date: Sat,  3 Oct 2026 00:59:08 +0800
Message-Id: <20261002165910.3818940-4-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_175942_378042_6EB8624E 
X-CRM114-Status: GOOD (  12.22  )
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

From: Yunhui Cui <cuiyunhui@bytedance.com>

The generic smp_cond_load_acquire() implementation spins with relaxed
loads and applies acquire ordering after the condition is satisfied.
With Zalasr, each iteration can use an acquire load instead. The final
satisfying load then provides the required ordering.

Use the Zalasr path only when the extension is available. Keep the
generic relaxed loop followed by smp_acquire__after_ctrl_dep() as the
fallback, and retain Zawrs waiting when configured. Evaluate the
original pointer once and avoid shadowing the helper's private variable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index d2200e826ec00..b37ae9544d08e 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -142,6 +142,29 @@ do {									\
 	}								\
 	(typeof(*ptr))VAL;						\
 })
+#define __smp_cond_load_wait(ptr, val)	__cmpwait_relaxed(ptr, val)
+#else
+#define __smp_cond_load_wait(...)	cpu_relax()
+#endif
+
+#ifdef CONFIG_SMP
+#define smp_cond_load_acquire(ptr, cond_expr) ({			\
+	__auto_type __zalasr_ptr = (ptr);				\
+	__unqual_scalar_typeof(*__zalasr_ptr) VAL;			\
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZALASR)) {	\
+		for (;;) {						\
+			/* The satisfying load provides acquire ordering. */ \
+			VAL = smp_load_acquire(__zalasr_ptr);		\
+			if (cond_expr)					\
+				break;					\
+			__smp_cond_load_wait(__zalasr_ptr, VAL);		\
+		}							\
+	} else {							\
+		VAL = smp_cond_load_relaxed(__zalasr_ptr, cond_expr);	\
+		smp_acquire__after_ctrl_dep();				\
+	}								\
+	(typeof(*__zalasr_ptr))VAL;					\
+})
 #endif
 
 #include <asm-generic/barrier.h>
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
