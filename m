Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A53C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 09:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D73260200
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 09:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D73260200
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/BPwZhjCcALc+rH0iqqHWh9rxwBvWZHAZyJFBJXrKA=; b=M4eihjFw8HMJcQ
	W8vLv47jN2aERmHeDpUNynqCMBu7n6fpWtT0D4xQ4U0bjX1glKIhd95K0J15XRmFCsJ0b0zNv0wXf
	Fe8sq5+8BMCuKQyy2zXLzXonk0VcY5ntTUZb1KOxWQu7KNVy96gEtovVtnxWfABf+YIlyQfo39NmW
	ZkF3ceiKeJdhYmvTgz0b6VDo3PJbXa7iNac+QT4k/2tgjVeP1mtPobCs01Vc1uu/HhSV26AXKzJQ/
	Wps8z54GOL7uD/5SgxhDUkPzuyv7a9iDU20VoqbEL9o8ooqMJ/ZQd0g9COcuau7yu2dQfOTT08QQN
	f2pHYShTlCx0M+71vhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThwj-00E0r8-Da; Fri, 24 Sep 2021 09:56:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThwI-00E0mR-Pz
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 09:56:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id i23so25735640wrb.2
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h7c0XVFr6N3jiF/U6QxDBsNOiGNhPsYCa4Km18D0Hc=;
 b=vKOH360OkdUSeBBmWUFXZK8VGjn3L5JmXcL6+bqa2xj579UoV2NU1xzoSlFrm708mm
 h5Jt8GHJe3mtqjujsS/u/O/LAfckAQvQGenJ/qLfLVMgl12xKd1MKcLBy/7EFiXXmBoL
 69vXNFZ3z7kgjYILbRfdlOFB2Q/ewIENfeeLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3h7c0XVFr6N3jiF/U6QxDBsNOiGNhPsYCa4Km18D0Hc=;
 b=yhCaSFOsdENYMLSKKzVQ8zFTn3G36BmRKMcf74ldn9wCpqsq7qPW738hVvba49liHd
 AO6Ekd+XcWT2+H/oLx9w6fX0UZiFXREgquDjMH/gqjiz8ZVzjiFFpRZFGNqfCJ+yYEkN
 q+djZZQL6e9Dk1QX3jxB1syTltg05KZ4Pafk0zC2JCsaMmWvTl1U8Z5kiOXabZbIBlYu
 MH1VGsFziEKSyGPlF2FPUsYuuELq73YS+cay4cQP9CR2hQbk/+4EaK9CWrQf+Vfhwi1h
 XidmeRdZKfcOKG1DnYDBtJ5hLLdQPH0ocaQrioTK440YE0GY3Erzl+BZA6uvp5mVWpTI
 rkoA==
X-Gm-Message-State: AOAM532d1h9MseBVyNIDcSeWQ20lyivt+0TZSmEthN5nSn+OqGQpJXwF
 Zbtf74oQuHKpacEx44VRoZSCiA==
X-Google-Smtp-Source: ABdhPJxtHe+PjtTgQIuOLwSiU1zls++8SImNRIUOHlY0ZtTilLz8T0M+r62uqddhxQXzeoDR4eMiBA==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr10131509wrz.280.1632477376986; 
 Fri, 24 Sep 2021 02:56:16 -0700 (PDT)
Received: from antares..
 (1.8.8.f.e.b.b.b.5.6.9.e.c.8.5.0.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:58c:e965:bbbe:f881])
 by smtp.gmail.com with ESMTPSA id v20sm7871106wra.73.2021.09.24.02.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:56:16 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/4] bpf: define bpf_jit_alloc_exec_limit for riscv
 JIT
Date: Fri, 24 Sep 2021 10:55:39 +0100
Message-Id: <20210924095542.33697-2-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924095542.33697-1-lmb@cloudflare.com>
References: <20210924095542.33697-1-lmb@cloudflare.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_025618_860983_44C3BD9B 
X-CRM114-Status: UNSURE (   8.36  )
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

Expose the maximum amount of useable memory from the sparcv JIT.

Signed-off-by: Lorenz Bauer <lmb@cloudflare.com>
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
