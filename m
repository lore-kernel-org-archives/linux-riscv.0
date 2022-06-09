Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF6C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne5P9w0mOQeO0uYbIULCd/T+V3asRlFqJcKYw9f8smI=; b=DAR4lzHhwazLhG
	wG2gb+VQ8il7HZxPiCJSNgkNDtPuZYwWxWMdA1Ob5eaqbnLU110vf94hiPXI5Q6GdngMGv/lIqCL7
	KJEtNrGLw5vlP/eE5jzcCuovCXIrfSpYSRlOxMDjzexCcn4sfBzCL9WhNk7sTQStj6h+cRzXBN6R8
	NR9TPeKtbHW+FD7Y/Emx0dUe/pFUsRHsfR7gv1t+Re1W7g0yMb/fX7jbiSh9wLPDV08CN7CZmaO0n
	jTaNu4aGSB5M0wAhBsPZUJkDGoU8MoBLMaBnn0An5tFMQtgAzvIoadvqEJrKHOKLm0ydIrYdDCQ/D
	qjPKJEehxfNKUe1OcTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUX-00HLLJ-6L; Thu, 09 Jun 2022 07:22:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUJ-00HLCN-DH
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 07:21:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so25966497pjo.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxyKsT0S2CXArzygWpy+IKxYG48XzjnfAbAK1OYWpZs=;
        b=hefINMpE8rgX51wiQVG/SMF2MOBLog+35XYs1ZWVUj0lk9INgvs2j3XaEHX8HgFpe/
         +Ju4n8bkvHzsVzj8UtWsUfjcj1fyTxRRVv8mDNLD4S296BGGGpe78q3qQSqjn91gwY1O
         Wm/dZEmj/fuRFQHR8Npcntz7coBhA2CFGiEwKQvTMMqFEgADe1uOpCw6OEuVI+T6SlLc
         UITvLwOloVwUirsRziXHmNVFFE8XIhQDj6mB7NiTliQtUCcUP18c44hm1bqmv0fZCwZX
         fACmpsVowEZQKq0r6ZqsH/NAwt87IbxEcTL+lyopZgOcB0yWBAA/rJwFQTmgtU7h2+tz
         fhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxyKsT0S2CXArzygWpy+IKxYG48XzjnfAbAK1OYWpZs=;
        b=BPISIjEcHOYL1aY5TSzsLwolRZLXEs7kT7N5a+H5J0kRFSq2fB5OlcXt9HC6XR9sde
         90f7rxG3C1swbygjW3v4mQES6PRLF1UofQxt09jbFsxNFgmcTvkFBCjDh59l9klzRagL
         YDh47WGEC8+rT4otu+MPkvNsF2rDNHDtbQv91Ks8YpHzD1WkBOIn+f8TRy90KYWriFjY
         IJdL4suMWbtZ15fRCOIWvnN9dbENfcLETF/ovkiN/sekN9y5k6/7v3r3yShkns4udekI
         S4jTUIKm/DCtkzG9OZdvCD1qWZA0tRWHAze86PIBWec/NnP8OmROl9158/C/+xwueDAM
         Xw7A==
X-Gm-Message-State: AOAM531QGdSRozELmlRkpuon7b1qcaz8Lq87nWogwFi2mU31ep5OB4Ql
	Td2dbHFFd06jQ50dkeYhb8TV1w==
X-Google-Smtp-Source: ABdhPJyeuxgjqMWT8Brq/IeJGQCrPu8XQ/D9SQHSk8S0sumxin+O7bjFUUh0Bnq5++Js34ennGkdcQ==
X-Received: by 2002:a17:90b:1894:b0:1e8:d377:4993 with SMTP id mn20-20020a17090b189400b001e8d3774993mr2067705pjb.180.1654759308520;
        Thu, 09 Jun 2022 00:21:48 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b0051bd9981cacsm12952572pff.123.2022.06.09.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 00:21:48 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rostedt@goodmis.org,
	mingo@redhat.com,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com
Subject: [PATCH riscv/for-next 1/4] riscv: align ftrace to 4 Byte boundary and increase ftrace prologue size
Date: Thu,  9 Jun 2022 15:18:30 +0800
Message-Id: <20220609071833.1051941-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220609071833.1051941-1-andy.chiu@sifive.com>
References: <20220609071833.1051941-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002151_534540_13BC53C1 
X-CRM114-Status: GOOD (  10.40  )
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

We are introducing a new ftrace mechanism in order to phase out
stop_machine() and enable kernel preemption. The new mechanism requires
ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
boundaries.

Before applying this patch, the size of the kernel code, with 43432 of
ftrace entries, was at 12.31 MB. Under the same configuration, the size
has increased to 12.68 MB after applying this patch set.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..d0b922c04e1e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4
 endif
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
