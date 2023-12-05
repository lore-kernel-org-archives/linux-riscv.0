Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457BC46CA7
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VPHvlRH2OrWpDWxMvljQTa4qeo/TEX8nQIPF+7Ag4Y=; b=bqIkOPZZLZBD2R
	Nia7nJ5ZQefE/kbbCE5p8n+tiubb5LZYHUJpjjnclnuxFxIe2JoHNf3AplseEz27gu52W7IRwhWkS
	LnhU6mOqDP8dzSeAHSFG6m1ytQL0hXo/1gdDjk6pB153MeGDI8HipuMPl12E5WJEnl44g7+nnovJX
	GaWxx5vpE6aLLWl+V4UXBMCOR90eV3FmFWUvTt+DLZJpI+TtHEtI9duSfgp8LdwE1ABmKu0DqsWa6
	zCvozh7RaATnSf+usJ+yQRawGgEBg/GuaGiguP/YGOv0NjVqoNbVuYXRjQv4C74UtSBPtRmVBaF/g
	a0v746ir2v664LBtck/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVp9-007XJ7-1e;
	Tue, 05 Dec 2023 13:50:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVp7-007XGs-0V
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:50:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ce6dd83945so584617b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701784251; x=1702389051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=VFIzyNDRNGNv6yLL5sXGz8dps6Fg9Ofv9eA0HkSUqEEmQIGw6mn5MXLO2UshmC41ok
         BVLE2a2YC4nqLOcGBNYE2e/V/OzIbY8u1ILvTZ9GmbU8oSPQ3buHydCjwlmNwQtSLxFJ
         lfLjx92rbDl70xRP9lOcl+kAwsQ/s9mtP3z3FJHmZHdQ9hqnRkPF5ehWVvGknuEfIdx7
         k9BYpxh6lAADmWlsJw6be+rMnLO3zQzZyu5TwWz5t4/ulpaRzLXei7sKMNMWUdSxoqks
         4QdqAzg7t4zqb79AsiZyWw0L+lncvAPZrsJPPoWYkSB7pDI67VGy/myYm3Alk7+SFuTJ
         0v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784251; x=1702389051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kw9lx7rfek+Fyxn9H19uerjKbw2z7hmkxzJlnytvErY=;
        b=GlOlwA+9jODu3ATs4RMvoFbOMXWFKVl4nbwjslmkJftBfgn6aqsbR6JYl3aKTnmNiy
         EEQMhGwyLUq7xvikgMsh2g885MDXXIb+AfzeYkU17Cn+HbPcy4pB2ORT21/ZMNqDNuUx
         tHN/BhU6tT5prkfGuvFUsf1lXPodMVxGKYKnNuDbDheyjcQ1QXf6+fs5uJz/LjXp4Pcr
         lLLo+O02zlhHMnY4wgcejyymTuCYc1MJ4121x0xvWP5TU6L2MqMG4EAHGDXLaKwMdKxS
         9Pr/p+J9wmwdSEn5pHskJMxTP8sxjbOXxawZJWG9vXi0jvmvEPhTP67Vl1I++ompo9Z+
         OLEg==
X-Gm-Message-State: AOJu0YweSL934HSlnCgjW7DVR44jiulGPMTH0ZPxR9KDIogM9R3+uHrL
	9D70Zqn2gqGxUUEcx1KwtzOj4g==
X-Google-Smtp-Source: AGHT+IE+MGZNocJKukR2PL4jO1pcCHJx5zeZaiZzHpSE59/id3BPfziDyZviksjyycnDyDaRfgGFtQ==
X-Received: by 2002:a05:6a00:849:b0:6ce:60d4:234b with SMTP id q9-20020a056a00084900b006ce60d4234bmr1617686pfk.52.1701784251608;
        Tue, 05 Dec 2023 05:50:51 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006ce77ffcc75sm673641pfd.165.2023.12.05.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:50:51 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/3] RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
Date: Tue,  5 Dec 2023 10:50:39 -0300
Message-ID: <20231205135041.2208004-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
References: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_055053_191444_E257D820 
X-CRM114-Status: UNSURE (   7.07  )
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
