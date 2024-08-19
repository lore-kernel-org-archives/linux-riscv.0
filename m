Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090ABC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 00:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KoJknBWLp3IS4/6az2Q//HMGpCBxNRuJ9SwP9FBtJ24=; b=17aBi4fQSAL+nz
	O65GNUfhkNdemW29KafNGrsHRFFqwxMED/jPThCj2K40CjjfAwYGu/LK3bHuSpCKDKh+jqUm5FZue
	+D81dX+hdZ+CBkHXV0mAgfOnPU3jOvaHo+ztv4TNa9GGzrbdJpJnz9Y7chtIGBD5d7v/PLZRvWpJL
	ChxhI+rhO/qMdLzH+0642LPDV/XnEVtYXCq5hoHrPyFKowM3UQ9QQX8q7ro8TDd5QAat2LheMN5j6
	JsNnmy8JQx7usOmOVQsgxY1Wa+/vuXMHbJl2ZckL0oeHVE79z/B4extmt2iansdeoYKBkAtDorOL9
	krJEp50Giz9p4S14Erjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfq0M-0000000Ha37-0DXN;
	Mon, 19 Aug 2024 00:12:14 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfq0J-0000000Ha2h-42tH
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 00:12:13 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-49297ff2594so1349123137.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Aug 2024 17:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1724026330; x=1724631130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkS98moYkgQs8n0Vsl0Kteo3XEop/tJMuQlKicdiPAI=;
        b=M22PHKS43QeSCQyVYW88gitroFOfT4G3l6VAUtNdbe1kO3tDnJypBXs7DbMWolF9+q
         GIH7yiz+HAp3Ex25i+w9/Qc6ZFJVEi7dpEiwCJF6WJqc6x5jZYb2zmrjtlVal9gBXnzq
         JYbiD+98lJEFg08HTl/sQkf2yQ1limbkYDqfopDuj8QpuLFIXgjVIrXrBZO5iSeNztqO
         BXwGUEO+EFOsv/ImZ6IaxldsoqUB9gompUR2m3F5BxdEzIMZGeM1A2bKikl6IZ64zJ7A
         iB6Q1HzyCwOExQHNNxVClgKYU1xl4r7IXMVaeQK9KOYyDVS+hST8BCCJF4Xf2nlZAjOt
         a8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724026330; x=1724631130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkS98moYkgQs8n0Vsl0Kteo3XEop/tJMuQlKicdiPAI=;
        b=cdbUp+F31FbjsrZjc4HlCUpQqFX9/Og3Ade4jNkuGUT+wA0kMIaFQRaUffNHH+Rkh8
         LM9f+c3JqAYMJE/OTMkvuvI91IKyNZz+2BR7OSsatKxJp8pNxLPTvK/cWwB7Q6SEkFzM
         D3XW8lS3JJ4XxnpozCIW75dCnOP1ed3zXOq6kYELZvg1l+J9nYJ/qtvgSqfyqpbjdn6S
         9OWz279B4scSy0s41E5WQ7FYkx15TQ9KgFEaP5kVO7HnEfEdBQr3uCHHYeSORij5NVev
         SGmIgSyw2Wlkb0JYEej3ZQWXrO6tH/Qpna1OxiA/C+qLSBbOQLIQThayAS4ni5PdEZ1D
         ZnKw==
X-Gm-Message-State: AOJu0YwDvb0Poj3aSHPFSWgUJRKyMCuGi2rJYsJqNx0ZIDXVkHkIfXto
	J5g8xxut/p0BU1Y+JxbN7SUMmm+v9voFqP7Li+lcA7Itq3/xG3LbJ0gBYmtRPNEv0RWH2cAzZR0
	BYLI=
X-Google-Smtp-Source: AGHT+IFNwqE0FRDwqV4ZC/3rm2t54kHlJ65+y7J2QjdvQY70UkSDeWgraa6RRshDx6EHOAFF4wlMfA==
X-Received: by 2002:a05:6102:dce:b0:48f:95aa:ae2b with SMTP id ada2fe7eead31-4978859e54cmr8133396137.28.1724026329844;
        Sun, 18 Aug 2024 17:12:09 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff02c888sm387055685a.20.2024.08.18.17.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 17:12:09 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: Fix toolchain vector detection
Date: Mon, 19 Aug 2024 00:11:31 +0000
Message-Id: <20240819001131.1738806-1-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_171212_034770_9C93AC1D 
X-CRM114-Status: UNSURE (   9.40  )
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

A recent change to gcc flags rv64iv as no longer valid:

   cc1: sorry, unimplemented: Currently the 'V' implementation
   requires the 'M' extension

and as a result vector support is disabled. Fix this by adding m
to our toolchain vector detection code.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..939ea7f6a228 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -552,8 +552,8 @@ config RISCV_ISA_SVPBMT
 config TOOLCHAIN_HAS_V
 	bool
 	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
