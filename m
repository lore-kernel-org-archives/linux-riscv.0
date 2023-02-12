Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F141DC636D4
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4g8orp6EfIcjgrc3vd6//q6YKZwc6Ui6+I08Gb/VLo=; b=tfcp8n9GHHU+bf
	o+KawLAsL7uyLez1WW3S0DuRThCkPTqw+9S1W9bf/6pLmROYMl1jJo9v/ovtgrvHK1WRyujxwvJMv
	3oxD4TCH7ZzaceH7C9HD6GjVBu7MAw7HharwKCggvCtAseJ6l5OKQjy/2WhrzJ4tr7YHGTP9yvWa5
	hCKPUGnWuN16QOH91TH9jgxoAnK27ZYNMCnEXEQy79KupEttc4E1GCuZ6f6lJcrY/mD7NsoghZJQt
	wiv05aP0a52sULGXGX+JEu/4BtKs1B1QO3I4JzqH1s7QbmDG+egtrVqK2A6jBi48mXmMEMwq74bte
	vS/f8wLrx6seRapHdcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNZ-00CJWN-8t; Sun, 12 Feb 2023 20:55:21 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNP-00CJSr-9L
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 20:55:13 +0000
Received: by mail-qt1-x829.google.com with SMTP id c2so11944473qtw.5
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 12:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Au6CyYPAK9MMu54GU8ZYr6dkPuGof5usEwyOLzycXk=;
        b=R5iDCdhKZDRcDyk6JEWeTsc3H3qiETZQnTUJtmJ7rVJMEcsUsSBA5yhUDN63euSzlh
         HHlW6D1ZkGAtKB3FEcWCEi7AeUU6SqXYGwnNkAOyEdoCu4NuZqU/NleRYmQ9CmXSTlv5
         Zc017d0fbYZ8dQhPYHvX/d1QKIOmQwQXeOZyDrhwdqhIXy6BMfSoUeFEQWTCMtCa3fa0
         9IC0+uNjJ+ZGv/dj/WgYIGF4thtFPnjmZRmg8B9kUhM5VinzObUMmmVq5IJ9yhE9JYLS
         bsu4EPDygZjMu2XYYpjt7zIJzhweyCR/XB3PCYvwFT/+6E7BZMRNHJNG+3cr5OzTpt+C
         mepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Au6CyYPAK9MMu54GU8ZYr6dkPuGof5usEwyOLzycXk=;
        b=lYch+EIqqMCHj98ojrdQ1HFUlJ8Nc4vZI8fI4iwk/kJvSAEkfpzzBkXiZfm/mNJdE1
         zMMxvAygc1+eAd0fJCPk5UQQ7GFsJfZaroelZsygz38nmkJHAIqc/uxJpal3LnFRPJ8p
         AElYdvZUlUUmcOlXWqGbas13K+VNvlsgdLK0WEdT0pvpVvVdvSmnHnumB1WMEJ4XbxAo
         6bA8BzfcJd6Ye11LmJilOFDM3cvxOyFSJbKWZ6t1MYvu5Ob6HiO1eQL4ryk3zwC92Bru
         5eyRQSqz+aB7V5qwg0+/gl+zrtu/rn4eeVBwXDRhOnYl8IKxMwObShjq9pYHe8nZt3+5
         S1+g==
X-Gm-Message-State: AO0yUKVjrSjz2rmt5ugaHw+L2RF0JF4qUZBmWEz0FHxWKCe9tgwE4syU
	csDUrznHEV9RaJstFZA4Co2Qf+r1cupC+Q==
X-Google-Smtp-Source: AK7set+mdFGsW7vWxO83UMH+FHZxLgRCvHWUm7dPLycj8dlzQiwvTE/P6DPhram2BQe/Le8dmLYBvQ==
X-Received: by 2002:ac8:5e92:0:b0:3b9:bc8c:c20a with SMTP id r18-20020ac85e92000000b003b9bc8cc20amr17289416qtx.21.1676235309701;
        Sun, 12 Feb 2023 12:55:09 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id o62-20020a374141000000b0072ad54e36b2sm8289233qka.93.2023.02.12.12.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:55:09 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 2/3] riscv: Kconfig: Allow RV32 to build with no MMU
Date: Sun, 12 Feb 2023 15:55:05 -0500
Message-Id: <20230212205506.1992714-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_125511_386067_FDB5A318 
X-CRM114-Status: GOOD (  10.06  )
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

From: Yimin Gu <ustcymgu@gmail.com>

Some RISC-V 32bit cores do not have an MMU, and the kernel should be
able to build for them. This patch enables the RV32 to be built with
no MMU support.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
CC: Jesse Taube <Mr.Bossman075@gmail.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/riscv/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 59d18881f35b..49759dbe6a8f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,8 +163,8 @@ config MMU
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT
-	default 0x80000000 if 64BIT && !MMU
+	default 0xC0000000 if 32BIT && MMU
+	default 0x80000000 if !MMU
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
@@ -262,7 +262,6 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
-	select MMU
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
