Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VPHvlRH2OrWpDWxMvljQTa4qeo/TEX8nQIPF+7Ag4Y=; b=xYrEx9H8z1DqIb
	zKOUrbriOaiOSf0C46VqaVIal1R8a6ym7uz5h/lhUv4xNoMD0Hs6eIBQEaZeMlb9DxMI1o6h5kYPb
	uL8zE7WQW0RRe2Hwymr5JFnXFTWVsakJbVvIy/z2/JivPlZmiShWIJom8+EP90RVAFPOmsd/cClFp
	KFLTAKxJpctAo1+A0/6yFqK1OzCH6jSVcsnylnlGQdxlAw/WlU348saXAZtiyLoxQDfakAuhIZ1Tr
	ljJkLqqzb7hPR6LFD/aGUm2I6eNUSRkWIuNBXxa3IFLNriNWMlgeIb1YZD+nPw3WS5M54TLn9W8nO
	NTJUzumub0jY7UCpqI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADh0-005JMz-0e;
	Mon, 04 Dec 2023 18:29:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADgw-005JLV-1u
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:29:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5be30d543c4so1580320a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701714553; x=1702319353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=J5z1/nK+IZsn50nQV4NUWp93rXJtUh/NxQyek3nk5YfizDScu+nesAgStA99nMhV6b
         9HqH3nEFDFcnvzOjtVv+zTv2rYyb5Ob6W5Yhf6JJYpQEbzdKYnFp3LO574uLyDfYpuZ/
         xgEQhXLFjBNC6rJ7IDeLQWn5tODWMftcP6gxk6aIJcPUOwaR2WJffBGZxmvfYnacIW/G
         NmWj0RTtSv+4CJZn6OxEnUReT4CCZCdoH/5FciWH7bJPpHc5hACuRmUyexXfn/RbREZx
         jpnT9u1WpLSwr7AFqG9rfpWUbz+SzXA0RAu9ZqdslL0NL1lZWH3se2O7tdtRV9Vi5P5o
         zDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701714553; x=1702319353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=hmoZkRPeuc+zbF0EIwVX+z7SvrGVUYx37PLuw6AAeheQYYm84zTo1vSvoWthtb2tVV
         N9NlcWuBd+kyF346Q1Jns2JFSkcPCdym3QKP5G2QNoCVmwkKRWKR+NIwgPmkwLHNpFYO
         BL1AJ5ifLkcoPuw+PzN5RfuMojGPyy6UGe5RsGkfa64D5REErKcGS7GWDUtBa4bO3J6Z
         O1yL0Q9ax113+Gk4rYhaBusinaOBhsXbRyVDCWNv8QJDsPieacOfEY31lfJ7iHnST/cb
         3ZCo0yRWYjhTwGJrmkeZGW128stD7rXl61zNNEBJOYtc9StjlnVHHZXqjpkw1Uf7L9/N
         w8Cg==
X-Gm-Message-State: AOJu0YwRcy8ZNnFu5D+t4VJKWcsla03yXiipYTSP+BdWj3R6U+O0uVDF
	cPAOOXKkwlPXxWDIKoKbfkkayQ==
X-Google-Smtp-Source: AGHT+IE7Ek+QAO98xYFQUhE2+KsLzefRKGzxvQR6MjetLHTqt5mcn71POBm0SK15aUZ0cAx/t3xcWg==
X-Received: by 2002:a05:6a20:e123:b0:18b:fde7:71ac with SMTP id kr35-20020a056a20e12300b0018bfde771acmr3150854pzb.60.1701714553529;
        Mon, 04 Dec 2023 10:29:13 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b006cdce7c69d9sm1806224pfb.91.2023.12.04.10.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:29:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/3] RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
Date: Mon,  4 Dec 2023 15:29:02 -0300
Message-ID: <20231204182905.2163676-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
References: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_102914_628006_596DB8F1 
X-CRM114-Status: UNSURE (   7.38  )
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
