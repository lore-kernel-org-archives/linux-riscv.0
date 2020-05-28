Return-Path: <SRS0=/uwW=7K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA2CC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 06:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C12A6208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 06:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfMKFTIh";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eHAGvzKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C12A6208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=; b=kfMKFTIhRtg1uiTwhBP8t2mM0K
	wEdtJB88mgjT+GZ1H49CI1a56XI06fMtgq/b1ZmxYtUr81xFa2WlQp9LFtdoMEkntcZlODRs1edbP
	q07G8+8fYj2qOe/P31wxsj2j0Q9AaQNm8CnuDeDicPPUpM17GGHyOLcKRd9bzobDlcPQD+Bs8+jJR
	ETkjpXe9f5XmJZnIH+vFdu4LFSD4zjko3MJZOPON9cjvDOtdsZiHNXH+y+nyhtn3dozUvr8ZEkV17
	UbHz7LGWFwXa507HXGr2rEyaK1TkXXxM72TYb9Hs0OLVv0AV2/biSpx3xsJcBuQaC6VBZTK9S3dkc
	Ygu7f3OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeCEM-0003Jq-58; Thu, 28 May 2020 06:41:30 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeCED-00037E-CP
 for linux-riscv@lists.infradead.org; Thu, 28 May 2020 06:41:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id m7so11127029plt.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 May 2020 23:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=;
 b=eHAGvzKEfkhBWYR7ZCsH8Tv2QIgWzmVUGdrmWiJGdNpf9o2/WcSHdzFRXrXwoNLdjB
 GI7opFoA/tEJH+TAJ7y303pW57PSQIbj3FEDI/+KBiUKpHmFQRA5Q/94pvgoQ+zIxZOc
 Pz6fXgOtXpYdFmyVUxaI8oItfYVs0cigXLcYgBOpjLE2+fWxIvXN0dBZOESFFu4qoqOj
 pM9vXWSQGHRJEtdnxL40g4GstJOnv+/CJQ1iA4D1eSHxtgB8fGvs2UHZbQf3AXsDcYQ0
 aehZ1BIjbNF/cHFajFDl93sleF9YcpXZqD3Z+W1CCMv+D8qMp0M52rBwcYQ1pNF5qOBh
 MqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Km2JD+kQ/unmKeqzGOP9FqhZeNEC29tSKtvmTopBc0=;
 b=PpvEA6IeaVZdt6Gt4SwcMa/p1bM3av3g1IUkCrnrVSRfK2FpRId2hHF5jqlzTnNZbr
 zbUAGJcEb9h7ceurCldJRPi8c1mKfpo7EchQgXT+DqPVhFjO46f0td+ZzjZXFMqyI2wA
 lAZo1blObmJShi3UxRMFjNlsXjL1DTcOssoI5pXyVNMS7ud5Jri+O5ZaS0y49hHmXhCQ
 794DEx122+MqVPx0K3BO9wrcmiAifci6crLMCm8qs2lkziWeV/tn6EmGzPegeaZmsRHL
 bhdnyrqpVRDSnladsidg+KKQc5T9Jyjwwv5G5lFL7sDHzV1+EW1z5i073RgMYO8TpQ+U
 xbxw==
X-Gm-Message-State: AOAM532aR17SzrkKGXA29yIc949ImdOAUJi2wBs6lzsL80SLDkr14KKt
 5UZaUs/kiW83TelLtz3I0KIgYQ==
X-Google-Smtp-Source: ABdhPJwTx3wBz8DBpNQDdEJvvEatFh22MfXQ3sZ4OnC9GJJZPTzdlaBNmmev3s8MVSRcJK7mqNg5Jw==
X-Received: by 2002:a17:90a:20ae:: with SMTP id
 f43mr2292203pjg.29.1590648080155; 
 Wed, 27 May 2020 23:41:20 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id q29sm3773366pfg.79.2020.05.27.23.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 23:41:19 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmerdabbelt@google.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com
Subject: [RFC PATCH v5 06/13] riscv: Add vector feature to compile
Date: Thu, 28 May 2020 14:40:54 +0800
Message-Id: <ff4f02ebc92bef0b85769cea014e3bee42e7cd04.1590646208.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590646208.git.greentime.hu@sifive.com>
References: <cover.1590646208.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_234121_439284_11E52560 
X-CRM114-Status: UNSURE (   8.70  )
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


