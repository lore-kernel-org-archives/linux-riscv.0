Return-Path: <SRS0=EgcX=7I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A891C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 May 2020 07:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E18E20899
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 May 2020 07:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxJA+js3";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fwaOu56E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E18E20899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=; b=oxJA+js3hJpYN+tALLrOvu+TyL
	0neFTKLdh9K5vo6RrcAu9cRElYXvaW709XYep1JycdfRqi3CdLMRb3D8TMcYo4WnkBrbdD5OZ7dWM
	TjtijvYuFuZjy9BU+ZKUxm0Py+ePpQ3GFXfav6SiUhkjMrsUwwkUf7pOdWgEHU2KIIVyAVZwFxHvK
	Y20JcDcMo2BmDl2Hrb3MsRKk3XlVl9NYJKeNUsr0K6qbQV97iq2Zq1wTVTNIYg4Gt+b1f3ElUabVB
	W7VROAmEc1HFet6sA1Zc8Ss0PtVBFzyS7LHSsPSQ88s2C9FC2jVtRowzUkKZiFDVGPfDbwllhlVMw
	QaxQVYVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdTcI-0007gG-Tl; Tue, 26 May 2020 07:03:14 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdTc7-0007Rn-A3
 for linux-riscv@lists.infradead.org; Tue, 26 May 2020 07:03:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id y18so9695331pfl.9
 for <linux-riscv@lists.infradead.org>; Tue, 26 May 2020 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=;
 b=fwaOu56EhTEG9FMN1o3rnteEalY/8bArnEbtZVxAabyRBu+r/nABZ7epDBo4p8MDD+
 cA2gNedzetSmiwvuO4vALFAW/vq38SF4XR+zCqJZwgup7qFTFD6R2bnKCwzXFPWUxBzG
 05rxVQ/AFibFBkSd3yp17SxnzMu2A6dSpCMPD5TwPc5r2+uanG2P6a3vz7Ywwo8eTwCD
 MOYFUQUQqj27+a7Jf7VbtqzWEA4wjN9LPmLXelUFv1HKvK8ro0WiNHELP7jWGWlzuoRX
 C3CSTaFGuxW4wljnZ3wtz5BYBewgnYxDfqkqPW2vdGQAuTNwndB3uBT4l6ZU1QQhIds6
 n6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=;
 b=hfQ/4in+XviE0ANTbP8qZkBJyy8fx0+Gv5+KsRQusRsTKcywpfNok0CiMabLaPGp+2
 Gbg+BzV7pTn+zNLj6HfCwln8ZI3lVc3HCaJmFdN27rKFxbCYMWvO6xkRd8y9PpNcsNBH
 rKA7gjIeIq8yLaU5kHYRIkXtcLbZwMd5Q8zO3KqnWj4hzkzRXQDdo30XhM6nhERCHu69
 Uc8PPmxpfkuaQCjod6tz+bBjVZeQRlihFdyLsrZPJH/SuhjTjWcEJ+iU96sMI2xfEu3b
 7nwEzZAUIb6BkbiVBjKmqIxf3nHcz6xznYV5ESS9/40/PBaO6ULoIXreeRvn239x7kfE
 jIJg==
X-Gm-Message-State: AOAM531Uk+Kkz36mpr72Y9qpmBq4gFSnLIkDWWmnIyTvd78CXrUrhpv1
 BHj69BHjpYOMbGcifxg+fnsrnQ==
X-Google-Smtp-Source: ABdhPJxjkNufIEkiK3P///fheqfCPFylQAY0wlVg55u5yq6ThiUNFXgAZMzHeSWEHAJ4K6Ub1zbPwQ==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr30156648pgp.146.1590476582354; 
 Tue, 26 May 2020 00:03:02 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id q34sm15167431pja.22.2020.05.26.00.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:03:01 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmerdabbelt@google.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com
Subject: [RFC PATCH v4 06/13] riscv: Add vector feature to compile
Date: Tue, 26 May 2020 15:02:35 +0800
Message-Id: <ee6f466ce3f12e65f6fcc686e19e7e956a88f324.1590474856.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590474856.git.greentime.hu@sifive.com>
References: <cover.1590474856.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_000303_363860_530389E8 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig  | 9 +++++++++
 arch/riscv/Makefile | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 74f82cf4f781..3b742d949a09 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -305,6 +305,15 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config VECTOR
+	bool "VECTOR support"
+	default n
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 endmenu
 
 menu "Kernel features"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 957d064bead0..7c80c95582e3 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -46,6 +46,7 @@ riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
 riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
 riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
 riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+riscv-march-aflags-$(CONFIG_VECTOR)		:= $(riscv-march-aflags-y)v
 
 KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
 KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
-- 
2.26.2


