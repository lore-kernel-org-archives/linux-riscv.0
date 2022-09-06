Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323D7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/B/fkXWrF47KNZx8yS4Bvmr67UKzfYHgxsG6QeMy7s=; b=TQwS7G5Y8O+53N
	t6ibepLtOurcdf0/9O3ZIFH4tMHke5yDPEwFRqADo0yUd4W4/dpOJ+boYvH48qwLQO1wItcU3SuNr
	pXUcR5wrPCpBCc31UVE/x+AA4UCKYpFWgupSx7pqRpVdBrnzbN/wIV3SEe2DduqfLHZFRNdO+5Qei
	PH6c7RqeG8/cmrFVV2FLb5Jj8oNzU+0E7b2aOtWGVv7tSxovCBchsCNADUNvcPGGbpFyGajKEXpyg
	4REzm8jXdE9iyITYd1Kg7dO7A/FwwomYx8/OCmOF0nSO9Wogwf+//HrNulJXNd8i44Xv/7wrZ4bwi
	coWHV7ogGZTOrr0gH4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaoh-00Ezys-5N; Tue, 06 Sep 2022 15:48:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVa2L-00EVjP-Br
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 14:58:52 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kk26so23888362ejc.11
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v9Dltr1NA5jo0S5D/7flOBJAnmzMvouzYLQcEFtmSec=;
        b=cz4Isl67+O5p/oxYZF5LcljEj2J9XKd2ASvdrmrvygUE88Ali8QgK1HveCV/ORoJmp
         h7otzLyS0nJuz8SMHNkFZdZPGSpCfvpgKuwxWr+PK7XVXPN9hNPYwIPJ+oxjJPct5r+4
         F8sU/TINiXBfVLZEIU4j0ooju+0zJ1MbU+ulC4DBhITryPngprqTlroEpk6UTMfacntf
         M25Fak/CiITm+NGN/3jegPYLP9OzQp01GWYaRRy1WBL5a2GgGTFkUXgYzGCwlL6KYw91
         nwYWKKCh2o17+rfIH11YH1pABclpGepxntTTsJN/KlQQJr/uAtHjcCsJ/aiueA4eLQIo
         IQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v9Dltr1NA5jo0S5D/7flOBJAnmzMvouzYLQcEFtmSec=;
        b=IwvnLyRJYuk6sDi+JdbYWiCO8c2f64HEzDxz+Jsq4FXWCcuHaILbYWJrAsM0C3Bgas
         TSA5uGZKpauKAOOnYQj6N+VOx3kZTi0TyUhaH1Mm2C6QuYflZSXSvb08SY7kyY4XHuXU
         k7T6amKWUBe4vi7Zdv+fLcOIAOJtZReBloyrL3o6I5Xua7EL9p+Molix6qQ4XoqHXl6M
         e5IdcQ3O9hWnaGPuhlYVE0xOPbN/cWaxwkpl1NYMFbVSWAJ8Oc8V1IcDb5apxMqz5e6I
         yq0dNFKCBgQoj6onw2Ysls0Jf6z53iXWlpYfKz1n12TOXnx0BtNgvEP+SAlZkaI/doad
         q/Ig==
X-Gm-Message-State: ACgBeo1/EBo36MIpNHCJL6LQvZfMOkISm7e2domrNCPj3h8zzfJylPu8
	EEghNxTfG6Plg7PNNiJE5HV60Oopp/60yA==
X-Google-Smtp-Source: AA6agR7IVJuhEjcTWrtsHcIax2WCHx6NKpWAecnS7Wl3TivprXhQ8jGOWwxH2u00bjQZxCb4p2Npsg==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr41459885ejy.385.1662476325679;
        Tue, 06 Sep 2022 07:58:45 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906b00600b007306a4bc9b4sm6763427ejy.38.2022.09.06.07.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:58:45 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v2 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
Date: Tue,  6 Sep 2022 16:58:41 +0200
Message-Id: <20220906145842.965488-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906145842.965488-1-ajones@ventanamicro.com>
References: <20220906145842.965488-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_075849_467961_07A1258F 
X-CRM114-Status: GOOD (  13.49  )
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

We're about to allow guests to use the Zicbom extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/mm/cacheflush.c        | 1 +
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b9a4cf36be4b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -48,6 +48,7 @@ struct kvm_sregs {
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
 	unsigned long isa;
+	unsigned long zicbom_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..3f36e79876e7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 #include <asm/hwcap.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
@@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		reg_val = riscv_cbom_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -311,6 +315,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EOPNOTSUPP;
 		}
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index e5b087be1577..f318b2553612 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
 #endif /* CONFIG_MMU */
 
 unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
