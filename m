Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE4FC77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JujyVHkHgvg0zVuXeQTOHXRC/t/ZpbuqVO8hoCR/ElA=; b=wlbX44BdSp+w5a
	Yv+1YtHWDWzNhut/NTcUFgM/16/X+al+bVy/SOOvstgW4tbX6bqCHnqO1qQEGBfSUKl3MGeTJaPwH
	ivWZIEmhN21OSnD0w/EXiUWvmDLMUK8mA51DC9JqtYCVdgOXS00NubY9gmKyRuJ2N7yD4K9EGvUpx
	EkTfdnElEyvdLRPqQys/EP81mnJkylKM33ZsTQZ0GrooPxLUr7Zy0iod0nCQJqq9+cqCtXNXjTPxJ
	VWCxJVIeeVtQkwrh61lnlAvelhoj8Vs07SJfo1nc4chJGV76iKPXwSgBaucLtmb9DEV9m2OvWxlsX
	QjJIwHgpAwfMvWMS2YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIM-00G1Je-0x;
	Mon, 17 Apr 2023 11:45:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBb-00FkjU-2E
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso3189518a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727654; x=1684319654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OjRYTSNkHEyY186mhAXDBY6d07pgIeGaMetjd7Mr60=;
        b=G9qENwuXdGA03tkgc+oMPLCXGnAgOsNokz5+/rbKGX7LLeWTv5MAUKYevmVUOBljht
         NmiD8Iz4vJBV+bqw6jgjJHma3PLtzZF7FBqizc12FxpudHy85BLj3hqxMjthgPSJ0mqR
         mCPAHvcnj6oTBnC6aV9F6RV9vVvk7IHw8RMVPhubyWNLmZxT4GrfVhAgHu7wWvc4N3sO
         Jkh/Md5o7u2QR3ht9zCEtAeohoyNoSKmC4Wd0Ku0daggEUBB3vAxXYNx14G/0Wb5vgJ2
         ktLuHQ4yzKtnMj+0gpyfMH04Vb+2YcmqxTrYo7lb5jZTj9tq9nmvYb3MeEVgRbxARqsp
         9tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727654; x=1684319654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OjRYTSNkHEyY186mhAXDBY6d07pgIeGaMetjd7Mr60=;
        b=EGctxYCP+TrKy2N1niHjnPc/TYwd8QvBtSOjW/8ZpM8mEf6nN9qpD53WPhDnCqWR/b
         epyh9QmDDBcv0lXWbv6cAkwCSqoxOH9LOEgTf6Htq22cd520vB6VJ5/XfxXTtrKOqpuU
         JNHMefay2JfUI2qSk4T1O2R+lLyWdckwwhjLwVUBufrqARQH1FY9qWx4WHFy2iyYh5o/
         LwEJeIYik/h2mK3eiLO03Fpku7kbfQ2ESZfZGPz5nZP80qkw1v/VJKyHpX+rhVOlOEhb
         eQbI2kgZ983oL/eoeTACTXwDfvXrXeXhuCaY8bvW6xwKfnkq+vT/ZBdTWvoVOgQCmnWJ
         tthg==
X-Gm-Message-State: AAQBX9dVDZXBnWLh13pxpULVQSNfPDkOu31CrxUvJfbS75RK+It5e8gk
	YNVrXx+Kf1qo+KBwZpdIp+bYMw==
X-Google-Smtp-Source: AKy350bchrDyJZ1OFaeWOUccf7HUDHGV/vcTeb0Fz7iiWPlc3mEGShh2rzs8R5sNWXxb8WSFlzumyA==
X-Received: by 2002:a50:ed0f:0:b0:504:aeb5:89c3 with SMTP id j15-20020a50ed0f000000b00504aeb589c3mr15779213eds.5.1681727654510;
        Mon, 17 Apr 2023 03:34:14 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j19-20020a508a93000000b00501c2a9e16dsm5835394edj.74.2023.04.17.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:14 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 04/14] RISC-V: paravirt: Add kconfigs
Date: Mon, 17 Apr 2023 12:33:52 +0200
Message-Id: <20230417103402.798596-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033415_739121_23CB11C9 
X-CRM114-Status: UNSURE (   8.33  )
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

Now that we can support steal-time accounting, add the kconfig
knobs allowing it to be enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb7f29a412f8..76dc5821e470 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -583,6 +583,25 @@ config COMPAT
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config PARAVIRT
+	bool "Enable paravirtualization code"
+	depends on RISCV_SBI
+	help
+	  This changes the kernel so it can modify itself when it is run
+	  under a hypervisor, potentially improving performance significantly
+	  over full virtualization.
+
+config PARAVIRT_TIME_ACCOUNTING
+	bool "Paravirtual steal time accounting"
+	depends on PARAVIRT
+	help
+	  Select this option to enable fine granularity task steal time
+	  accounting. Time spent executing other tasks in parallel with
+	  the current vCPU is discounted from the vCPU power. To account for
+	  that, there can be a small performance impact.
+
+	  If in doubt, say N here.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
