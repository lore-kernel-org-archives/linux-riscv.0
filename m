Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B95C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JUkN7ZbwM9KK7HSVSI/Ec2u2qMrGeKjWXV++UNpJuw=; b=Iz9fQ6Tt2IvRfm
	eJlnZcUgWCL+2MoeH2I7E8FrIyoaAdXqRgS+LrPgGLaHHw7fLcEhRvsrGf6C22Zef33teA4KcBA1B
	+dWMLIsjP9gKoNiN/bixyXyYdH9cs0gZG4zs6IQYbFHCDhfGAud6KNH0UXA6JACda/tOI+2FXfaVA
	c0Ju/cVBtbojyGod7tBCxsqNfpvMgaZENmiTH5T4a1P3XS8rK54C9SMDpiR+aSscMuhX39yFRh+QB
	uwX1LDfUj0CQAA0qpAXrmoo8+KOI172zRlwO1HjgjCJWlk/2pUQMicPP9wejMVP5MCQUsHehtpTzP
	vNuFVGd69w0DAqWzGmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYh8-008ljg-Us; Mon, 27 Feb 2023 08:17:15 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYh6-008lht-CE
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 08:17:13 +0000
Received: by mail-qt1-x82f.google.com with SMTP id ay9so5717551qtb.9
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7xaHTTjjwPzcROeiG6rMkbFuYzhGubT8ddT/2NI1II=;
        b=jrFhqOO/Q7AL0OwbKB0kyzg9htz8UY7+m3HXQ6tGkqK1jIntlMSScnfX4DR28XHlMi
         v5HLkZD46RcG6E4ZIMQ61ksYHPpNGljTObwzcA4fHWEnpexqnXvEqrnZQxphVms4lhBc
         ysOEmGFy5XvptLB89hF1uWe4rgyq5y6WA4eHbs71R24nD6YP6aIMpo3WEvmSmymuStO1
         Qet9yxTjo6T9XSMfb05UsIXw3h3vzJ9reXyDq8ICVgPZJK47g1lMtggh8hNbbBpiVNG3
         o8c0vihZUe51E2M5wZUeJrMpWw99QkG+/2feq0VWeW/U8mi6E4vDGmOt4sDiDv2E8Tbz
         JJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7xaHTTjjwPzcROeiG6rMkbFuYzhGubT8ddT/2NI1II=;
        b=hPDDe8gXBnyC3a7GAejjrerO6uDyBHK5CShnSfoKNF25s71Rjzr7Hvq5f7Brc4tJT6
         gwTeWINya4NUDi3QiYhsE4JrOZT0I6s5aT+UB09ovnAyavM7NQhRpmffZ1XEo3ALM7Al
         46LEx4UtYbs5IUQDSg2HICHfHpqiBOhrHRWrScmxFJNSi3XvlUBEMsr90HrmI6IzHge6
         HkJnScXTy9Sj0arpzm/U3+nOAcaJiHqoNgMszDFlds/Nzro4rVux1HvZfogGvpwYaKLU
         I+4nyOd1AchfD0yN6VUICmUzIqmrentvQrcT2E+KxOLphZBaVq+FD0pSLpHccFjKW4ck
         UuLQ==
X-Gm-Message-State: AO0yUKUfinGgIsMNu0Bj+MAU9OpDl+hOhs21gWyjKmFuSz8NhSIfl1G8
	suecVzeqlto6V+qzb0fcO4I=
X-Google-Smtp-Source: AK7set8LoBbOD6ZI28Zmw94NaEhIRWVBbo7qG03ZYN1OeZi/+GsZ+e6Kl904eQgKDmz1M9LZwgiTzg==
X-Received: by 2002:a05:622a:1002:b0:3bf:c7f4:24b with SMTP id d2-20020a05622a100200b003bfc7f4024bmr10372066qte.42.1677485829173;
        Mon, 27 Feb 2023 00:17:09 -0800 (PST)
Received: from localhost.localdomain ([154.16.192.130])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm4265387qts.30.2023.02.27.00.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 00:17:08 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	unixbhaskar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: hch@lst.de,
	acme@redhat.com,
	jpoimboe@redhat.com,
	namhyung@kernel.org,
	jolsa@kernel.org
Subject: [PATCH] tools: scripts: Remove SH architecture build entry
Date: Mon, 27 Feb 2023 13:42:53 +0530
Message-Id: <20230227081253.15909-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001712_435014_C0637656 
X-CRM114-Status: UNSURE (   8.51  )
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

As per Christoph's effort to remove the defunct architecture,which you can
see it here :

https://lore.kernel.org/all/20230113062339.1909087-4-hch@lst.de/

I have remove the sh related build option.

cc: hch@lst.de
cc: acme@redhat.com
cc: jpoimboe@redhat.com
cc: namhyung@kernel.org
cc: jolsa@kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 tools/scripts/Makefile.arch | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/scripts/Makefile.arch b/tools/scripts/Makefile.arch
index 0c6c7f456887..43bc1c4bf301 100644
--- a/tools/scripts/Makefile.arch
+++ b/tools/scripts/Makefile.arch
@@ -4,7 +4,7 @@ HOSTARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
                                   -e /arm64/!s/arm.*/arm/ -e s/sa110/arm/ \
                                   -e s/s390x/s390/ -e s/parisc64/parisc/ \
                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-                                  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
+                                   -e s/aarch64.*/arm64/ \
                                   -e s/riscv.*/riscv/)

 ifndef ARCH
@@ -29,11 +29,6 @@ ifeq ($(ARCH),sparc64)
        SRCARCH := sparc
 endif

-# Additional ARCH settings for sh
-ifeq ($(ARCH),sh64)
-       SRCARCH := sh
-endif
-
 LP64 := $(shell echo __LP64__ | ${CC} ${CFLAGS} -E -x c - | tail -n 1)
 ifeq ($(LP64), 1)
   IS_64_BIT := 1
--
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
