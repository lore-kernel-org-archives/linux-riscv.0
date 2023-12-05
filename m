Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9DBC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VPHvlRH2OrWpDWxMvljQTa4qeo/TEX8nQIPF+7Ag4Y=; b=cutkEPUTMooGbS
	swNf1ArsdYDazNkyIhXFwvYJWgs8G2GtuOjNW6dOKuKa+hqyTJO+rltflet8xGrQwGWi/9O9hf5QY
	g3cUnuWjAuY2UY83kULQudYo8vFdGcduV4ldgW5IGhvLmyz8q8G7JmongLwixlXsKSgbY3UD485te
	MMbTEw7oVm9iEJTxJaDPKuAtCk2HNzizXAGcP2dwQ9IQMVD978Dsn2ncOUFhWNOuCfd6Vc6PFzcKO
	ZGbkJPLrqaMX2hp0c7PVOTG+KeYVsfMIAqnF6AMR5clTrtSXWYArTCt78dfohVirnKYJ3PXxkjPBh
	8ZmxPNGfv2MevF4HTkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZUA-0083qO-0J;
	Tue, 05 Dec 2023 17:45:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZU8-0083pI-0z
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 17:45:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d048c171d6so41231545ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 09:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701798326; x=1702403126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=gvnJd6ZNWz5J3AtgKLVBQ5LOL528Z6ovGGer8rgbyfvwCoXQDr6mPO2QWzacadibCB
         29C49N+IUN1nnVjq9eL97i4UIMlhAz0dqXxcXJ6aRIjlFaFKuLmleH+SOBC1uaAg6CN4
         CgQpU+n4T+QVrq6Bgof5RpDCpGNFrjJoj6Na/pj9PNNz+8z1oRvK9itY2HiSC3kkHM50
         MW6bwzot1J9AQ2YlmJot4VAw3H4k1c+PVQTlBEFRJJkVqHnuCPJbGQd45PIcI+9zuqfR
         NDoSmsD2OUbHaPW+rlYQRtYExSBXJ/AfdqxlbDmkNjoijV9GNgZQnyYvCyA12FH1ThxG
         6cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798326; x=1702403126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=oWaYFLJFWKpIU6aLNKe6v6HGGSelOpBOIc5FHlMORVOuOmHsQuwCJ2aU97QHjzXf7+
         aGPx7xCj9XYvQQ0MNz+QCm20Buexzb/dbemVbKjutH8JV3G8hb88JHE77SFaZQnNebcj
         +nnXm3Y0KCv7XWxxwFo709RXBbv+dhpfLH0MrPMsk6h3/9Vj02u1d68CVdisbt3HCB7L
         SXBpAJXUh0brtcHw2dRSIYCjiRvPidG8W1CMOc7OhYARMfTsBj45hVj/zFDP9REY6nIp
         tDgC2DHgp/mqWiKiYGU+a37rd06AO/3PsZB6C/62104Jx5MM9XQPRSFUi1ZiasIoP5Tx
         uQNg==
X-Gm-Message-State: AOJu0YyLr9bOpnh2FD8vmcJuxFbV/ohmv/eH/8kAqz/sYSSE6pSFgZG+
	hukvM3EjGy+WonFfGF4FKzEwzA==
X-Google-Smtp-Source: AGHT+IF7Y/RolGBXnpDHkOsMt/rkm/fe03CCbMCd5KOY+xnFrO9TY+7df1EdMH6EfJJh7i6FHHqd2Q==
X-Received: by 2002:a17:902:e804:b0:1d0:98db:6fd4 with SMTP id u4-20020a170902e80400b001d098db6fd4mr4578699plg.56.1701798326243;
        Tue, 05 Dec 2023 09:45:26 -0800 (PST)
Received: from grind.. ([152.234.124.8])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b001c74df14e6fsm10465705pll.284.2023.12.05.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:45:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/3] RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
Date: Tue,  5 Dec 2023 14:45:07 -0300
Message-ID: <20231205174509.2238870-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_094528_342836_1FD906DE 
X-CRM114-Status: UNSURE (   7.21  )
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

'vlenb', added to riscv_v_ext_state by commit c35f3aa34509 ("RISC-V:
vector: export VLENB csr in __sc_riscv_v_state"), isn't being
initialized in guest_context. If we export 'vlenb' as a KVM CSR,
something we want to do in the next patch, it'll always return 0.

Set 'vlenb' to riscv_v_size/32.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index b339a2682f25..530e49c588d6 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -76,6 +76,7 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu,
 	cntx->vector.datap = kmalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!cntx->vector.datap)
 		return -ENOMEM;
+	cntx->vector.vlenb = riscv_v_vsize / 32;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!vcpu->arch.host_context.vector.datap)
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
