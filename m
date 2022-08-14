Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1DC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+f3eGDFeoh1UKZD+K/TOMVSIAtMpAB9XGVKO2MbnaI=; b=SOdDWGqI6rGdqS
	pI3l59IsH2CvtOVi2zhWpJQgwRtoE+0LU56/wZQDd+FG6YBe5ZqI4mALlAJtnIKXfzy5s5IYRykgD
	0+HqhsoXONjaBYTVfXgrVCLKuSyzHYdtxkUl7Kp9BICg7fmb92V9kyuDJYOAveRf/SMH1aw1PC+Zq
	XdBI8LyK8zBDSk7Kr+vQKPfQ3cd/RW9M6CF5nJxPwy/5lDreVaF5zYarbKE19q59Zh10VkRmFBF2u
	TZdrxOoAmdHDJLTMpHNyDPF/Q3pWQ0j2RiBN7z1mo+3hwiOJn2bcd1JECabjpxNynB2fCJ3V0eUfO
	x4hsw28fzka4+mnXAroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMU-0070bQ-LS; Sun, 14 Aug 2022 14:13:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMJ-0070SW-KB
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 14:12:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so1021323wmk.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qMUpNbdJFHkt8LehO+vj4FoNVMjMZ3b4RSV8Kbu/byM=;
        b=VU4X7ETrUmw6SeHfZ8AdO5lxQKOQF2HqiEeNSOaEO67IQgUu4al0l7Lp3vRJzsv8Ft
         148XhPJaK+g8F+K2pFvw/ibH2zC/GW6G3TP/Sub0QP9WkIpbzxC521jv+uLO/jzmgdCC
         diUBrwCfWZAKEoAmALJ7bywyWKZDHeo5iPTbotwxY1F/O5oI4I5Ic4VuSvMYwZdFUQh/
         ZEEUY4gc60LRUCvGwVdTLyUl+apOZQtsCzBQlH0d/e91I9A9waemfuZBe86cO8GtLRDm
         XrQDdAFcRZvf/GQyqSv1qssDXttkUmbTxG0amI78ugyDHn2eEBwwRt3ahtZMIU5vgAfm
         +YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qMUpNbdJFHkt8LehO+vj4FoNVMjMZ3b4RSV8Kbu/byM=;
        b=ifmtprwpZRefe1pWm6EIv393r1Zuh/cBQCFnHB/7e2SiC/h3XRuWgmasyefmvOEjgB
         4elJUlPhaBXQeZGNyNKeRwflhyLOS2EmhGOo2s96Tw3+fD9YSq9p1+jVYsi3Ccy2MQbZ
         3YiMWCYTo1Me1mmoI18pJL7ZLhYx2Bsbf+pKeIjaaK+CDRikV7YkJlTeVzN1P9R3b65E
         sCi5eM715WgAc6eP/tLL6DNYGmkguhLcIjUxm3BsG7Q7AXjKd9tGcZvuhO9/1ePS+/Q2
         zAWeYOKlgAjdjKQLVgdbpp1vqJT5NdWCNox233HJCuxiZM28Idrq+g+oJ7FYeGvEPNO4
         Tnlg==
X-Gm-Message-State: ACgBeo0tr/yHq7cN7Z6a/z/tYtFVeUxkW6iFmS0Qa8EBKifgBvJfInre
	ug5By2zX9BQWtIbJ8JbHAuiW6A==
X-Google-Smtp-Source: AA6agR4TZ6OGzcxxznTc5xN2jS1X/dAKB1yFSxHRG1y13P0Di1gIIk68PUhQuEwPcdtEnEPKe4wd+Q==
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id c12-20020a05600c0a4c00b0039c34d0fd25mr7924157wmq.172.1660486373101;
        Sun, 14 Aug 2022 07:12:53 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id b8-20020adfde08000000b0021db7b0162esm4625419wrm.105.2022.08.14.07.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 07:12:52 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv: kvm: move extern sbi_ext declarations to a header
Date: Sun, 14 Aug 2022 15:12:36 +0100
Message-Id: <20220814141237.493457-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_071255_667398_3E08349A 
X-CRM114-Status: GOOD (  10.15  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Sparse complains about missing statics in the declarations of several
variables:
arch/riscv/kvm/vcpu_sbi_replace.c:38:37: warning: symbol 'vcpu_sbi_ext_time' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:73:37: warning: symbol 'vcpu_sbi_ext_ipi' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:126:37: warning: symbol 'vcpu_sbi_ext_rfence' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:170:37: warning: symbol 'vcpu_sbi_ext_srst' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:69:37: warning: symbol 'vcpu_sbi_ext_base' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:90:37: warning: symbol 'vcpu_sbi_ext_experimental' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:96:37: warning: symbol 'vcpu_sbi_ext_vendor' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_hsm.c:115:37: warning: symbol 'vcpu_sbi_ext_hsm' was not declared. Should it be static?

These variables are however used in vcpu_sbi.c where they are declared
as extern. Move them to kvm_vcpu_sbi.h which is handily already
included by the three other files.

Fixes: a046c2d8578c ("RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file")
Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
Fixes: 3e1d86569c21 ("RISC-V: KVM: Add SBI HSM extension in KVM")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 83d6d4d2b1df..26a446a34057 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -33,4 +33,16 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     u32 type, u64 flags);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
 
+#ifdef CONFIG_RISCV_SBI_V01
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
+#endif
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
+
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d45e7da3f0d3..f96991d230bf 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -32,23 +32,13 @@ static int kvm_linux_err_map_sbi(int err)
 	};
 }
 
-#ifdef CONFIG_RISCV_SBI_V01
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
-#else
+#ifndef CONFIG_RISCV_SBI_V01
 static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 	.extid_start = -1UL,
 	.extid_end = -1UL,
 	.handler = NULL,
 };
 #endif
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
