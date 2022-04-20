Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X3f+IMuS+g3zcQgFl46sg8zUrTS87TZgdbjz6kpYmo=; b=rtNlugmyXbfNEt
	OgKvaC2NKiE8jRMASCe7orydp4DvuZsRraKQuseHlTQOnTtINW6qxDtXxzSHYO4rtZV2bqpdIs0cJ
	Uav14pGFLysZvNGFx9Ltk5559V7xxkXRJ7DeMd4WtrFfH3ZOcgZmgQepI9QUExptQKEeLPFXikqPh
	fRg6vvpJY2yHsuTJln3gn291/y7A+VxsArX7LdG9LzbnhdBhcfaecFJN7WY6wxcsvHIRbGkNdBODQ
	+CWTRp4ZrfXaa0EeLr5FkHKF+WWhyOgDYxcKHbzfvDtp52KqIOtE+eQwL9p0jnwTf6GyIHhlM/nZU
	2zRxck1s6orF3kjWaX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8SV-008kg8-A2; Wed, 20 Apr 2022 11:25:19 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8SS-008kcy-0E
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:25:17 +0000
Received: by mail-pf1-x433.google.com with SMTP id p8so1644469pfh.8
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aKqoFa3PS3ofFsonmsRpILD1LHcN5f7ZDBzSGfsEbM=;
 b=XQt2qNB5u6pQxEF1HwDnEhc6NcPf+VkZSZq4w0mIY/jogwXW+sK8aZ+cXC1l/ZoHHU
 YGJJ0QjeSA8J/aP2zERHCpNEU3ZfqCQbGxKungKtD9r+4XedTyeDSfRcUxooSnaWKFZL
 gmBkBO0EgiRISNHALM9twlHmgO13HJIMrXTzGyTt3t9Zq1+0HHINUA5lb9iti/692dK7
 XNwIASZYWRnzfxyd35UsIcbXGhLyRkWH9A1fSsA4t0pkykVdUL5pNqHyfrVPlWjtkNB0
 2AxqTk60EGXEazaomUtuNqeeov959Q79Wt+MaAJB+BqYakQk9AYKGFLtAo09qwlMu30z
 /cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aKqoFa3PS3ofFsonmsRpILD1LHcN5f7ZDBzSGfsEbM=;
 b=lFP2igWfab8tjGJp7fvI3w25g4/dcgxTiCazUpeQLp2wSzsiYIKKGwyWF61fAgDFx1
 EuASNE9fJNupZSQb8g/6acURdOwVNzyWKhVoVUPxqoHDFIxoIYEmBLQtOOhPEVHCLaEZ
 aBsrjFar9EcYwsWBa4wd5kGoW3aHxIrdNUpanIgXGq0GBdjnF5hjfsNu8IwB7Ij06rrl
 c+oo6SxIYQ/gla6a2ttj3KY2ZpLj5bovQ978yzKbP7dNOeRXW6hfPI3Yg7AIxCi/yzlA
 G4ennVKMvdMJvvLqBMxzxOGdBNapweJMDJkxHSESA7E7E8XxqAfXuOkoZOEYc+sC7IwJ
 Velg==
X-Gm-Message-State: AOAM531HPrKgFKqU9d4Rb3xl0RskuXWzlxbEFit9pvWt3wTIXz1V7K9S
 yTJLi9cMEtvPL619L+PTMSY2PA==
X-Google-Smtp-Source: ABdhPJxvck0UJetQTLnRjK9sgifn28nUcX1A1ECsvY4RrQIudiYMG8WNofzA4+8hhV4Kj+KU6N0HvQ==
X-Received: by 2002:a05:6a00:16c5:b0:505:c572:7c2a with SMTP id
 l5-20020a056a0016c500b00505c5727c2amr22726073pfc.46.1650453915154; 
 Wed, 20 Apr 2022 04:25:15 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm22529274pjn.14.2022.04.20.04.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:25:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 3/7] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
Date: Wed, 20 Apr 2022 16:54:46 +0530
Message-Id: <20220420112450.155624-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042516_059452_21E5BD7D 
X-CRM114-Status: GOOD (  10.13  )
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

We should treat SBI HFENCE calls as NOPs until nested virtualization
is supported by KVM RISC-V. This will help us test booting a hypervisor
under KVM RISC-V.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 0f217365c287..3c1dcd38358e 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
-	/* TODO: implement for nested hypervisor case */
+		/*
+		 * Until nested virtualization is implemented, the
+		 * SBI HFENCE calls should be treated as NOPs
+		 */
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
