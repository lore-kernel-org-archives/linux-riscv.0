Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20979D10C00
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZKPezOIL271EbmDvgY/wrFjzlxDRIjo4vr8x6XuhS8=; b=B54gvP8LgOyXOF
	t+4dy9izNZg2F89Rj7i6rE/HNC9rIw2ubR1lZ9YYOQ2wy8eRML+1xcPgWFr/3uOKAphxPMNVo1/Uh
	/t/++Yn8fIE0erOPOFwevL+J8p2iCIm4OP+E2/xUHGUFG18embWLRYLTEExjBH+pAwhQ+Q/La8lVJ
	/Ypxiw+H08lWDMAgSZfKUDWoIxUMEtv7Zf+GO9/o0X3ubstRkCJypqKylRGis73m7YWcH0O/Ii/ZR
	hPsRu8FFDlGqWW+HV91kmHQ5oOGM70QEAwUpi5hinngzkmAA/XdABZMgYx3LOc/fN+jPGDGzFc0uF
	1g01vFUwl2zRgEBK2mXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNH-00000006x8I-3gnb;
	Sat, 26 Oct 2024 17:14:51 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNC-00000006x6B-1ED1
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso2326608a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962885; x=1730567685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgTekunG0cQy0vjVyXRBRATW95KVtugkqgihcshjjxQ=;
        b=iidOnM+jJd+rUs9T03PtHjjrlKKmoyshMJ4Xnf9yd3lxMtflTUp5WUSf5r9UImK5Om
         xugS+t/fsizHyUGNgRde3wbwskrb9USyyoLv17WBAqiCQKbta4Gfye50SkpY92LAYN2G
         GNS+sT5Zd3E7Iw50cbB3eEzDBk8h05dW3UGR3ZYmtFqwrNn1qfM7xksR5eH745jxnjm7
         MlsPLnqxkbzGbEIOKP05H4+1DMDI9jLll5YD3K5K8R251mafUnuxwLbz7Gp0UtCkGNry
         zMdd78iy0nODtW46wTdZyI8HfxYrEPOM/wLDmjoclLaetk6tfxxURzYe4F0xMou9N+hm
         IWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962885; x=1730567685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgTekunG0cQy0vjVyXRBRATW95KVtugkqgihcshjjxQ=;
        b=vYn9VV+zSW/4oMp2uNhTquybgwudeh0b6zjMUgoewHuQul70DjzlJtztZwdqPT4O+j
         klX1DHQr2cPFZ6BSU1tSkJ2J83OfV94m2GD8vgzbA0tYmuyOOHXHtKjC4CfAt6QE6YtM
         tY//Tqh1/zuZlg2QhNsbyQRjeqniM70OQ2qSbWITNue9DpMiKCRVayShX/mixJhcV4ic
         cyHHPuwR2YJZy8Tuhq9qi//WJpg1iyEM4APuZ4jB6mQzE3RloEG3hN6zCShIZVx7PkXz
         C+OC96GKv21cJpFMQ4ZXaYPwr7DO8zw/Kck1fZorCZSu62drFf5XDMe40ZI1xzMJHSkO
         bF4A==
X-Forwarded-Encrypted: i=1; AJvYcCUiwcij7gL7p5ixLtOI9mdnIVff00lBpXpOum+PV/eoXWT3rdhPTk159N02UVodH6xhPSGgV9S2hoqQmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxahmAXo+niSCXHt300KCWv6hZaopfsQIBDyRIAVbHWLBuWru
	SGaJXxQwzBUcliMCD9LPNyIy6nq2yLLvI1ousNKZZ3yGotdrzDKlekVF9OHrhZU=
X-Google-Smtp-Source: AGHT+IHMFAwANT/EZuDl4La1BmNjmSNtM9o3wF8CMwHklFBsWwrPxYwZlipAsFiUTL+gnWOt/QYKpg==
X-Received: by 2002:a17:90a:b111:b0:2e2:d16e:8769 with SMTP id 98e67ed59e1d1-2e8f106926emr4001679a91.15.1729962885304;
        Sat, 26 Oct 2024 10:14:45 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:44 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/6] riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
Date: Sat, 26 Oct 2024 10:13:53 -0700
Message-ID: <20241026171441.3047904-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101446_480440_81D26794 
X-CRM114-Status: UNSURE (   9.11  )
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

This definition is already provided by include/generated/autoconf.h,
so it does not need to be provided on the command line.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d469db9f46f4..6ff2cbde5296 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -92,7 +92,6 @@ KBUILD_AFLAGS += -march=$(riscv-march-y)
 CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
 
 KBUILD_CFLAGS += -mno-save-restore
-KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
 	KBUILD_CFLAGS += -mcmodel=medlow
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
