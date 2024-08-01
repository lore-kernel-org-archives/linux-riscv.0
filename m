Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC66DC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GLipCKHo6URJVwW3IMyp/bdmYuaqCssY++AG6KXo9r4=; b=kmQ1uGFGMKGblV
	yA2zxWPNi6aLSJP1TLubBJltj5QzHaggY+E/q8viMGgUG163LmGVegm5Tff+mFPMubwN81N7n7r5T
	0FTtmsnaJtR5eRmF+xDzuXr84Grzcdlshs+EejpkWyfBE7b9duTOA/+2dLmS7HySyDCtiIWAThZP0
	X8umV+J6g+Tbh+xjHbRqgiQdvIL0Qq4j4/a2qrsxMt01SUDnIQ1B3ywnZ/UKWlSnLxnS3UosXRY8K
	+3K2BPZ6Kjmjnw2uvAst0bVqWFUlsdHK3n3l81fLI1mdZUpWAgckjnJqYwukKuoZuGNDdMbr9b1i5
	ArQtXn6LOWyDh+Dxb6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZbFg-00000006VF6-1TCP;
	Thu, 01 Aug 2024 19:14:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZbFc-00000006VER-3bXN
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 19:14:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7ad02501c3so48391466b.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722539649; x=1723144449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5W/erGbpS/c/dCYxji+flg5DFVPLeWzz/dF8Zch7oc=;
        b=3Jsb7L2oIy23WVgFaYlJ2IHwNNJeBO7reZ+i30WCl5mH+2uhvYin72soU0lEepCusH
         GEJBjyO3xZoXyKDEAEP6xhr3QXD5NoWyQgiIWI/Jkh4swu57gvLkWZHfRrX87nlH/J4E
         pFpG/iBw+Kbgp0mMSglRGiuAG8alqy/EvQ/AiCgsOUTSw4QFqZIkvO0YNrK5twV2QBAG
         HHzrQBYqZP8qieTd7XcL+H8g5gYeNZYwO5wG2+lqSVySBoJA5/jiyCEL+aQhTtiApJB4
         IwjLAF9ZJ8xdspcDInUKhThQkFD0KUPD//a7f7c9XXmi62C5e4DN1lQqnwUxkhySgzmu
         6ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722539649; x=1723144449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5W/erGbpS/c/dCYxji+flg5DFVPLeWzz/dF8Zch7oc=;
        b=n7jU/3Rj1z84i1T/gYqR7HDmytbr88yxMobMqgaeidni9HR1JW/spTtTWWPDbEzTIO
         Xm/hiEq+HroU8wkLv6cGo0E48ZJpqM4XNmnkJ3rMXjELKi2UuRYRCooJcjyWe3wCiDLI
         ztuMFK2B2Bl1zld+LU9kFi+oDUKCe+jMB1HjxHZScsBAWk+SJ+F25F2yz8OJtc0pSMeL
         gEnY0tdkQ2AuoLtafZ9zduFGw/99WKLAszwvaxhrMuw6b9tpSWnqFjBCILOUDwCZ2soo
         cjB3Nxbj8bRCf9KUvticqVZuDPDp7Ket1LTBWAH4AVEU9gVcViq2ok/lRC1vT+nK5eDD
         eWYw==
X-Forwarded-Encrypted: i=1; AJvYcCXoBmQhOFnMy6icF//l556bf9nqyBvAUXfRJALyK92fd+LD7GDNJkLwJt7L9wUHHBX7qb1gg28JIf+AGH7OB6pX2SQcX7t4dxw3akyjQG/b
X-Gm-Message-State: AOJu0Yzq1nXkfgKFh5nXW9sAVhyOI0HL8Ge3bHbb6F9L3EUynQjY3uFo
	vYRZ4A0aO6wnlam+t3wFzxyBnBJVxT20rnP2V/VxDAgxilGP3aQZ/+8CEXQ1OFo=
X-Google-Smtp-Source: AGHT+IG8O3kQpR7r7WjhGrPvYxFCXhMe0ennTGPr3kqsOdEaQ/t/mw+lODrb+tGcnkgB2Hb9Zd4gYA==
X-Received: by 2002:a17:907:7204:b0:a7a:b070:92d1 with SMTP id a640c23a62f3a-a7dc517b48dmr80884366b.46.1722539648600;
        Thu, 01 Aug 2024 12:14:08 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (2a02-8440-5341-1d05-87a7-5395-756f-4b41.rev.sfr.net. [2a02:8440:5341:1d05:87a7:5395:756f:4b41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0cc4fsm12991366b.77.2024.08.01.12.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:14:08 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes v2] riscv: Re-introduce global icache flush in patch_text_XXX()
Date: Thu,  1 Aug 2024 21:14:04 +0200
Message-Id: <20240801191404.55181-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_121412_920784_7395734C 
X-CRM114-Status: UNSURE (   7.82  )
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

commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
patching to avoid illegal insns") mistakenly removed the global icache
flush in patch_text_nosync() and patch_text_set_nosync() functions, so
reintroduce them.

Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
Reported-by: Samuel Holland <samuel.holland@sifive.com>
Closes: https://lore.kernel.org/linux-riscv/a28ddc26-d77a-470a-a33f-88144f717e86@sifive.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/patch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 69e5796fc51f..34ef522f07a8 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -205,6 +205,8 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
 	int ret;
 
 	ret = patch_insn_set(addr, c, len);
+	if (!ret)
+		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 
 	return ret;
 }
@@ -239,6 +241,8 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 	int ret;
 
 	ret = patch_insn_write(addr, insns, len);
+	if (!ret)
+		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 
 	return ret;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
