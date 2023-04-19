Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D1C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0BZx3fEP3BAfbeNiUGLnc4C8B5RTfktBzxSozP9yb4=; b=ZZb+JZuHPqxaaK
	fAV6cltcl0ueNiH8Z/D/9NmD+Ls2hrox9BapySDzGCwNGEIIFgy51++0Mw1TJfpe1fmfGNALlAjek
	tKdkwSoof/urf5BBRV2L/6ZD7hFWkl0e4DI1ICIqTPf21EMvxh5jKFGXtMfmuBaJ6KrRL693RZSWU
	2fdA2p1hG8a0wPFS4TW0CFbFi+vWuXoKb6PuVedd6NysWFP+0AfLhXxq3NvLJL5a+vg101/9tVwBY
	7Xw/OMSy7ypskSAX9ShWxJO5FOb4Ji/wo5p+53gm3U3SR6VPNbYpN03NoRoZzCvgDmkXyloLCRd/B
	X+wuZNcPjVkTaA+dOgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDk-006Ui7-0n;
	Wed, 19 Apr 2023 22:24:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDg-006UcW-0w
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-51efefe7814so276549a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943046; x=1684535046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDYPek2GW62ZjpMwmsxfE9d0xDPaKHdBMm+cEZKc8s8=;
        b=gbm655ZKGYsSplRJThxaUIliJsDtxxCNHAd8Jsh9rquTj5wgjudHgZwJA550iZsQk9
         VB0SQu2x2QDE7zie14SgvIe7dnOfITMaMnMjD/onrUT0al1gT1sDadgULueeivhnEmTD
         JNLdLb2hMXSDd97f9GLtgcoOoiKtiFWFueifxdMTSbyKE0Z6Gv5tcQoRd/Nk8sLhR8hd
         DGNAlG+7Czxou3KoS1S39Pu0wydKlsp73goQ0cZbb90x0/1svTeMdjxcJ4JUnBS4z1ue
         xceJZmumlSVFCncTt6FuOgv+xYSVDvprfYgxAUggRJ/YOlKDghslSrOk6KKM64ujkV1m
         0exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943046; x=1684535046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDYPek2GW62ZjpMwmsxfE9d0xDPaKHdBMm+cEZKc8s8=;
        b=WV1htk3JIH7rfc9e5iSiB6907oV5kOiWzRKKUIcHVtZbdSIbfcXS/PpCGOHA1YXFcY
         qXbVsLNuxqdYeO404O69Fyt2+wHOUFsPv6Iq+rdpsCaOMOwz0c7RuBo5nEoTwhUF8/6l
         M6SzEFMO2bE9TLtEAFVWQpsuSLld6vC4st/cO0WbXWa/9ZXx0FoAUcRxK7bA02m+u/Ha
         cHJsZsOCndR2D8ljuf1naqNOed7+Sla8oxgPwuhAD4ID/UlKRK3VEGw2xLpZxwTrKigW
         l+pZEB7JEt03oycIIV0OIgyBWavl4TY0wJRCRG1p21wkqO/VaWYHPIe7dFc5keIn4lVg
         BBMw==
X-Gm-Message-State: AAQBX9cPswExy/ohQ2C8THWBH403kf/UlAFqUuChadpjsMrsoRxyP2Ol
	sghN32eaA/1zirNSQYXoF6IV4g==
X-Google-Smtp-Source: AKy350ZvU/B8LPyorDIQytWlfNOBgumMg9x+NGoZu6TjngTCY2lrTTdfxOrkdp5JkE0zcFgeJL83hQ==
X-Received: by 2002:a17:903:120e:b0:1a6:c12d:9020 with SMTP id l14-20020a170903120e00b001a6c12d9020mr7842484plh.24.1681943046020;
        Wed, 19 Apr 2023 15:24:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:05 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 02/10] riscv: Define a command line option for CoVE VM
Date: Wed, 19 Apr 2023 15:23:42 -0700
Message-Id: <20230419222350.3604274-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152408_336999_1802065E 
X-CRM114-Status: GOOD (  11.65  )
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

The user should be able configure the VMM to instantiate a CoVE VM via
a command line. Add the new option cove-vm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index aed4fbf..01276ea 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -10,6 +10,7 @@ struct kvm_config_arch {
 	u64		custom_mimpid;
 	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
 	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
+	bool		cove_vm;
 };
 
 #define OPT_ARCH_RUN(pfx, cfg)						\
@@ -66,6 +67,7 @@ struct kvm_config_arch {
 		    "Disable SBI Experimental Extensions"),		\
 	OPT_BOOLEAN('\0', "disable-sbi-vendor",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_VENDOR],	\
-		    "Disable SBI Vendor Extensions"),
+		    "Disable SBI Vendor Extensions"),			\
+	OPT_BOOLEAN('\0', "cove-vm", &(cfg)->cove_vm, "CoVE VM"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
