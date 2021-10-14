Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DF1C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B5161167
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0B5161167
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETnmRE/QKIx3EUvar9TNe3Cn1jvFtGovx7LPpLE7KYk=; b=UJ3YQ9SJAmbZSQ
	R0wwKDtha82mHC1GANH96+1gt5qL+6fZsngLONmAY/SBIvr8WMiE97/GDG4ukV4LPQTxGttymSAlb
	MTOmiOOvILEeHgqNCVUK9YMimzGo4GWe3HrkSV1c41uRn2yFjAz2/B/DUEVXF29fFED2ueGrPVNoP
	ZZUSgPrTt41srbCMt0/a2CMOpStwVIvIEYFtEcdoIVd3CQWr2J74BY0SOqRUHKw4oxchj0ZRV8YNn
	565ulXLlpVryRmyABw1YKDlapQTk/WZckUAjMSkxxnclqu51O8RiT2x1EXovG8obHsD5FpjYOMXkz
	wycWIRj6SGw4W+tmSfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1gP-003Qz7-PV; Thu, 14 Oct 2021 14:26:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1gM-003QwS-1S
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 14:26:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id m22so20263092wrb.0
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+uJr5hp/PrwImyhLww643udSk+FgvtkOnzEH/iiMXA=;
 b=x2fzdmMSRhyCU3dbpcXq3f4TOFHCtRAG3Q2rGhe2H5ELOT1CpqVXnBWY1E3z6p5u6C
 W2kl7W/6+YTDBSd7Xj3o7MEX3e1NCRMRa4TPCQ3Ns9C12d4kU5pd2phJhneXg8LJ0J4r
 8Q8mXJ3vykXbQQ4lxkMZBGAQL7gL65H60WsU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+uJr5hp/PrwImyhLww643udSk+FgvtkOnzEH/iiMXA=;
 b=wOw0NTMat17wUjeyAgYRPVVjKjoTQN5vvE+YR/J+ih4Cr6rAk4c1Yawe76hd8s33+p
 SSDzjP+/KAwq6w72CCQcOR8Mam2dU8irhsTbh2XbHlOkTC6WqeF6hhJFAw0rsoNSANoY
 hNXl9sRuuCfIEYl5RRsyHUCoO4lUMy6ochL6PHO7Y9tpmUf+G966jKQxna3ajNf4hy19
 cVpuAawODY5M99bfw4wAXWDdX3mj9VHXE4Gdikp2VJ/XZCD0pNTHdGYOa7+6gLYWX0f5
 IzWq5VdHfusN1PVksDALVwC9xF0ECfupqB1kSlj/B8owqlNBRkTYc5aLXavnbFfEUbna
 AAJg==
X-Gm-Message-State: AOAM5314o7UTPTWtOayUVMxqRFIWXdZpAkqsbKtKxNjzyApUWBqAMF14
 uSGpz20n62KMzlokVJPPqY7n1w==
X-Google-Smtp-Source: ABdhPJxSreZiUluGclCO7ih/fTRXwuaw9OMXuN55jnTqByIvdDxPXk6++hqqara4PlR/5NHW91bnrg==
X-Received: by 2002:adf:aadc:: with SMTP id i28mr7004852wrc.320.1634221564751; 
 Thu, 14 Oct 2021 07:26:04 -0700 (PDT)
Received: from antares..
 (4.4.a.7.5.8.b.d.d.b.6.7.4.d.a.6.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:6ad4:76bd:db85:7a44])
 by smtp.gmail.com with ESMTPSA id e8sm3731111wrg.48.2021.10.14.07.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 07:26:04 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: nicolas.dichtel@6wind.com, luke.r.nels@gmail.com,
 Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] bpf: define bpf_jit_alloc_exec_limit for riscv JIT
Date: Thu, 14 Oct 2021 15:25:51 +0100
Message-Id: <20211014142554.53120-2-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014142554.53120-1-lmb@cloudflare.com>
References: <20211014142554.53120-1-lmb@cloudflare.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_072606_113103_5A768EBD 
X-CRM114-Status: UNSURE (   8.65  )
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

Expose the maximum amount of useable memory from the riscv JIT.

Signed-off-by: Lorenz Bauer <lmb@cloudflare.com>
Acked-by: Luke Nelson <luke.r.nels@gmail.com>
---
 arch/riscv/net/bpf_jit_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index fed86f42dfbe..0fee2cbaaf53 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -166,6 +166,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	return prog;
 }
 
+u64 bpf_jit_alloc_exec_limit(void)
+{
+	return BPF_JIT_REGION_SIZE;
+}
+
 void *bpf_jit_alloc_exec(unsigned long size)
 {
 	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
