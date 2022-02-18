Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E63C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DCi218bxNGXAuVkDD7maSOyplSXWzUsA24moLc9HZxs=; b=yCU
	S5Vj+yM7Rrx29/A9nmM4lwZWRCwvViwxkxS3SM1yfDEvTWawYBfXfafnbvQkBiK7BJINGHu0XD7jh
	Vs+esjgoeJPVTu/avoV5Xx3pW58vpfKBsn0b+dZ2O/iVFKR72lrChatmi5q56slHdoWYD5VuP61sb
	WyqvjSlI4DUm0xBgzcGI9k8diBP5jlDHzzPO1fPrvofFxVf8DJE2CoovmS+hs42d60TBlgdaN7kXZ
	fODt1+3nk9avN8/7HnZziMEsnWe95q80ejw4fbVVZuttrrm6mDJYo73IHx/UxdvuscSdys5R6rQ96
	za/hv7AMHcsN51STy5axqhD+rcmv3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKyaq-00DKEa-Cz; Fri, 18 Feb 2022 08:26:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKyan-00DKDk-5X
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 08:26:18 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 i205-20020a2522d6000000b00622c778ac7cso12814110ybi.3
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 00:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=RZAu1RopNW0ZnAhNX12nSJphTGjmyvccd/3qHZblYXY=;
 b=rCB+yv0t3K2artQviTbyk/s1ERydB/bk4ZSc8CtHBGWDb960G5TEmbF7KVd59dToSl
 fbSTCa3ux/7+xckpeHEGWrupiuQ26paV6JUm7AiZ695TBD8MwKRpOXr1aAyblZxp4f5z
 wI6qmLnLkEgVobo9GzyV8cgaoN+kiaMeSqzgzciQz0swVMXroFwjHuW8iSJsYMwGUJ7T
 QwFy6SnNz0o9fQrZopD2msec3ba4QSNiuewF7551R5Uc+CXwz/pBlVURbYaCatjKNFW+
 bVQIrlRO0drjc0DgrBs7NvA4cOLJLuyjnwhsN0Xe0nzTTlWeeZ/5uVnQvZsO1Ej2Aijn
 1ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=RZAu1RopNW0ZnAhNX12nSJphTGjmyvccd/3qHZblYXY=;
 b=Z0AnCd7KfOvMQmKjSlscJwWqRDRQlB+w4p8x0DsOVKo6A8e0bqcmwTAXUFwChL4vKE
 V/LYt1lSfaxQW2iN/7iJP9kdLKR1Q4yF1njMXAOag+C0ffu5lzG5L+mYlwc4d5IFiued
 bld8iVXS+yjCcw6HT6U6mLTRRmSv63q8TGYAhDF2FP9gBHPODL220/sONB3v+Kw7q39y
 Yf1WRe1ZWvVxpSQDX3YLZw2UUl2V931koukYIQzJoPyUygdLUrdlScl9gL/imWXN6OWL
 oVIcJOM6RcPa68YQFnJUw8wEhYQq6OV5HGdAv1kavci5ONCHb8FhGpL6xIyK0l8aexOr
 LQHw==
X-Gm-Message-State: AOAM533uhwLIp+SlZrRSl5Ddr+wUwBMirkQSe1umhSxOwhCN7Uv1D2Z3
 wYS3u+mCcTecwhy22xYz6UPrkJsBOon3
X-Google-Smtp-Source: ABdhPJxrlB+xqNTDUqw0l54UMAh7wnOLcJJX8wTR1FqNzyU2jkIXBNFKEJYtk1JqNQPyLFtrWMgHYrCO8QR6
X-Received: from maskray1.svl.corp.google.com
 ([2620:15c:2ce:200:bdb7:3728:9760:87c])
 (user=maskray job=sendgmr) by 2002:a25:d6d3:0:b0:61d:aa5c:7e82 with SMTP id
 n202-20020a25d6d3000000b0061daa5c7e82mr6379447ybg.404.1645172775391; Fri, 18
 Feb 2022 00:26:15 -0800 (PST)
Date: Fri, 18 Feb 2022 00:26:11 -0800
Message-Id: <20220218082611.396353-1-maskray@google.com>
Mime-Version: 1.0
Subject: [PATCH] riscv module: remove (NOLOAD)
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_002617_238824_158D745B 
X-CRM114-Status: UNSURE (   9.50  )
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

On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
inappropriate for .plt, .got, and .got.plt sections which are always
SHT_PROGBITS.

In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
and (NOLOAD) will be essentially ignored. In ld.lld, since
https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
customize the output section type"), ld.lld will report a `section type
mismatch` error. Just remove (NOLOAD) to fix the error.

[1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
section should be marked as not loadable" on
https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
outdated for ELF.
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 4254ff2ff049..1075beae1ac6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt (NOLOAD) : { BYTE(0) }
-	.got (NOLOAD) : { BYTE(0) }
-	.got.plt (NOLOAD) : { BYTE(0) }
+	.plt : { BYTE(0) }
+	.got : { BYTE(0) }
+	.got.plt : { BYTE(0) }
 }
 #endif
-- 
2.35.1.265.g69c8d7142f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
