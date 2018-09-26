Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9FDC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C447A204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMbJ2Ofz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+lLjpdw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C447A204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0Fwo3lVeQ+0jnfI55DN0tgATz7pbf+8itW6eL3Mxk4s=; b=BMbJ2Ofz083ix3c1Hi47Q3P7v4
	k2JYuPBuJDheSD49cSWwE9SPsqndymwwflfQPBpINxjqvXUvyf8yXHEbDWf/B7ppC8Hf7h7JheyWh
	J6/DqWYuLcdKvXupC4TQt5tbZJ9sc/XOCsRW2KN7s+fVLuROE2+bCYFI39qWstoZ/w1O7/Tim5VEW
	VD/c72RV6UtWWUbu5PrvIomEP5f9XwH59V3GT5MmArdSF8GP6rhUcbfWIerlY8cWD/FuRHCJlZ5Q3
	o7/eIvShP5spu5tQeJpY6hx7kusd6jXcPGgvxipt5BVezgbf6sRZgFVdbqULHHK23WmW7zkF5BRZh
	AkYv6bcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55I1-0004sY-6q; Wed, 26 Sep 2018 08:35:21 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GE-0004Os-Ce
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:34 +0000
Received: by mail-pl1-x643.google.com with SMTP id s17-v6so9584134plp.7
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KwSJ/ddsrLXBKVax3TPyV5fU4fUUHvzkXBSHRSHeQgk=;
 b=j+lLjpdwiyxfa245manTZRXRQ1kMi/7QyKlaqYcEd7ZlCwqZ814wUnEDycsMKaNWXD
 fAe6gm3TUsabDHiVV+swr/KqKYNgD5HP3iYpaF/LOs4j86wyXd56jAZD8hUAPP5Bc4NT
 29FVfSSvTPDGrA0DkBdTd1pgsgSnIOBPU9CU3rCzUb7I+TFle881t+uC5NW+V/95/k4q
 nyfhoTKHtTn+ZFfmOm/Ae0rG4iMQmyzMFWMwIIO7C2oUKqAoRI+p/I1GK4TyDHHDc3i1
 mdcsfKjSO9yV/DzLnby986fvefkHekbzscYnLdybJlI3dH+QKjZ/ntR1SQin+ur2Mr/I
 4FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KwSJ/ddsrLXBKVax3TPyV5fU4fUUHvzkXBSHRSHeQgk=;
 b=gg/Nd3H+Lm/d34vtP1G9bIVjDGA0BoW/25XjWH2RakBJvpJjnOTNc1O8pyio8Pfpe6
 kA/LfJ/mA+jeSMnK6ePYTiPBNJZHYqPPPKKDaZCpk4fqyZVuEB8U9/EjgbAYjSmKZbBv
 GbzbM9Mb7n36CrgcP1/E3UhkGmK1yXFMk/LG5xuAxZ52EHHxVeZ+pUwPhBNqOvyK6bZ1
 SRNWCngUJR3k3/qQxqRwiH0Zn5j5vuq/g+DmLs31FREWuJcvtB8nBJT5mTTrfALYyy2d
 ldo1hnYymya052vu7nBndyUGEHpn9p72icdJn0P7UXC3hKIVLf0t5nV/J+4CsYkEJC8F
 KuMg==
X-Gm-Message-State: ABuFfogTiR4SCRn/i2I4hEDlxcofQHFv2nK+qBs9csn+cWiB2j+XUb++
 CXcwW3WXhLIDEOyqTQSOcN4=
X-Google-Smtp-Source: ACcGV63LwVQVqcZR4OgBItA6zz5VxtSpnnPGKn7Ajj31mpJEQhr4iPHhd3gnCtNtnv2Cx+x0R2O+BQ==
X-Received: by 2002:a17:902:8f93:: with SMTP id
 z19-v6mr4879438plo.263.1537950785140; 
 Wed, 26 Sep 2018 01:33:05 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:33:04 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
Date: Wed, 26 Sep 2018 16:31:13 +0800
Message-Id:
 <8dd79f009f4a8a4785fd88ddbe94d0a114d5bc36.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013330_460666_B153D414 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083113.SFFxY-aesbnKq5hKlCH6elZCy_IFiQzAZ2G6eH9hmZs@z>

On 32-bit, it need to use __umoddi3 by some drivers.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..dc262fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -108,6 +108,7 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
