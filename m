Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20037ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OruuZ2iEJRsPf5lmC0dLlqYfQLt8SxEXEtZrUu4hu8w=; b=Oq/5mznRM9PFOm
	+zRKgE8vcqhsfqFOYA5E6pWOxxbMMGDxDbpYsp8ws2Vlh4bDDt3N86RqGhDN8aWDbUGoprHH9b9CC
	UE0FWzXfGphiAt3+/9VW/JPX2uB7dkZZplZvvva/DdYqeEJQ23D999JO32sl+a/IbJ5MBeAh9aFuC
	HUPX3vq2pazS9L0PcgqSZcQRScZCRg8jMwWs0fECLAX7u6gmzXuY04ouJXJieCiViczBPLctzGmaQ
	P7k6x21MDSTiIld3/WHnfXMLxEMl1+MrvMHRlobxhUyHgUEPEQ6SGTSCQeYXnrRxHjadgns/lGKar
	0N+nWwvBDR2bGRy1vppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2Yk-00DJmZ-NK; Thu, 27 Oct 2022 13:04:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XF-00DJ3i-OQ
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so1161279wmb.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkY7EBDKO6YXvCwJ11XvLx5xkQ3Vf2bmYTCjXFGfgfc=;
        b=H4XTc9NBsb1BqLLz0pUlmU/ySHHap0gfu+qxRtuEL5bQF46sXwrWOz175WuqXLTSQU
         PfMNR7VkOWUGUjBHSNjORgsc9Lr8keFONx226QSxAqIHyEWIoZWyx1f1FIz/i4o6lUNC
         6H1+0P/Zi8l63M018gcJrZQ156tcT2+o47YZaqZ/fu8ooGUFPj1Zlnaq94W6HRJxYm6x
         dp9BZNNfbmb8R0l4C3L++278AM2NmDI8PKgMaPkh4cczt0hpoMVkH00zxcwFvzehinRf
         ubE+sR8pPtEMLgZjvEfjOhS+2OAhlttoC7NzbotarQicPzKuR3MhR1XKBhQqxN1f9Gm4
         ee2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkY7EBDKO6YXvCwJ11XvLx5xkQ3Vf2bmYTCjXFGfgfc=;
        b=l9WacjOftf4mqE4/44MfYe3C4ke/oP3v79euD0uwur0J5xoNFq+L3SvKR/7kKcYjt0
         0D9HljpqZdYexfYxp/lYo3csvxdiPlj3zAlcl2Dqq8x61soKKlOtSOzLJgCzLDfy/J5M
         8nttQA/RJiUZUBTjGoE28KbSZ8XQE9reG0yeFyf+nK+doXmLYlTOPPHws5GIPiK9XWpW
         YZ9DiZs5mefXtHtsQ7dcoizQGq+02Odb0WZb5MnkZFyJG1+lD00GtUO5BJgTacxmB8rh
         pNg/Gbq4pH8rD03xN2HC4LL74ETnzFbeGB7gvU9kDZ6kw60orZA+az/e+H6vSRqNR30q
         mkcw==
X-Gm-Message-State: ACrzQf1IAuqxRarBTzB3wgbP8Gcdbvebgm+SwncSzhcc5Yq22Ki+y+P7
	Yv+g4aacq1s/MuQNUYI2+s2ZzzC1jKfjCw==
X-Google-Smtp-Source: AMsMyM6aeY8K5XUzA/BRxMJmVWftTkQvbYq+9rPyWVzasbJtRk3cWmZ6gkszvKIpjuPdqTcabm00VQ==
X-Received: by 2002:a05:600c:21c5:b0:3c6:ec59:5180 with SMTP id x5-20020a05600c21c500b003c6ec595180mr5738306wmj.130.1666875778776;
        Thu, 27 Oct 2022 06:02:58 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d62d1000000b0023672104c24sm1112864wrv.74.2022.10.27.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:58 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 5/9] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Thu, 27 Oct 2022 15:02:43 +0200
Message-Id: <20221027130247.31634-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060301_830831_600B9921 
X-CRM114-Status: GOOD (  11.85  )
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

We're about to allow guests to use the Zicboz extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 8985ff234c01..4bbf55cb2b70 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -49,6 +49,7 @@ struct kvm_sregs {
 struct kvm_riscv_config {
 	unsigned long isa;
 	unsigned long zicbom_block_size;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 71ebbc4821f0..18a739070b51 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -270,6 +270,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -EINVAL;
+		reg_val = riscv_cboz_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -329,6 +334,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
