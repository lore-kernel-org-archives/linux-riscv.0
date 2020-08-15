Return-Path: <SRS0=8FDR=BZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3AFC433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 11:58:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C9823118
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 11:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xcLeGeG3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcfdA6dC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C9823118
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYLfXXtHLi7Et64cYgnZQPw8Y6Zt5VWuf2SymqySzo4=; b=xcLeGeG3Ey09oc7cz6jva973je
	7Dn3iXNEhT9eQ+gbl3W6CaGyhj154kcT+W2fRSbIp/jQqpN341Slgu4Q+3/tbumzQ08/SiM5kiTXQ
	s6uVyPFoOMgZm4QjOOAuSE1AfDtBI6dHoJvLQ+FLKkznBgz6vtn4KAfAvM+pBy6aPvCqZMBklVIq0
	6DwBX5N1AUrFMglXncsLJq2MU0r0hkAteWTGJXoC1a6NNt4CTZloBVUl7hCW4V+YOTtg3L9eF3UK9
	jrtjIAAuYIL2gL11RPwWEfZpVbwDezyqSeT1yC5aXAzQXr8dkgFYSEFr2W++pc5HVARp0EuSPNyp4
	zVO92KNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6uoi-0006Q5-JR; Sat, 15 Aug 2020 11:57:44 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6uof-0006Pg-EB
 for linux-riscv@lists.infradead.org; Sat, 15 Aug 2020 11:57:42 +0000
Received: by mail-ed1-x541.google.com with SMTP id c10so8731399edk.6
 for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2020 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e5WFLhWdFvLwcJo4KJClLZEF3HzHgvxjJKIXosYGPF4=;
 b=PcfdA6dCXp/NZfoSZ2qnOycj1qJUi1htbO1eEEq90NaS1ZBNtqKKvp1yvvCT6cR1PI
 b1AyVQY7O8k4eEUHuydvkugG0tJUjhwA2fvz5I9l6Lx++TMWojg2bObnsk5CR0wP9FiX
 63gXciEy2Il0KmD4LFadcrKozWgYmQsQkEMWhWPX69t3mZKVxM33h3KAbNMYJEC4h5DC
 BYe+jTdevJIvd1kD+Pfq3i8+gV9w2fbrYIVGWU6HZy8uYn2OaJ1xhDfFMVENqtOO7KEx
 idE//vhd2D03izVfJla8QsRJsDuR0yb3IWaKmztSqs4ijrmlYeATzNHgbiQnXG8jlBLA
 gnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e5WFLhWdFvLwcJo4KJClLZEF3HzHgvxjJKIXosYGPF4=;
 b=QcUv8r8hw0Kd07GX2JzDtj1tqnCDT+ETSJP4lw5g7K/JwTgPcuAdpH829+B6Jr13Ts
 KehnmuTDFZVLVdA5BuFMPAjSR3dss/+Ks7CMGRFa2OkZ1N3rrFThjQVo1ksg1N7owko3
 G3bRQLV379glaqSHyIIfwDxorxaOotS1+UGj6fJ1kHg+eCXL15C7IN7YbfHEbw/ukHP3
 okIwgJtEgV9ATZZmGf/sqBoGbNtqKvflLMr72X5JYd3qhAmn6Cw40ODQy7/z4SeSGBfM
 +aGtB+Gkle3pzzyggLU0v5iwKfLRysAP2Tfhb8vomyRHbRe4rsv/+TF+h/qLAs91z4Q7
 86EA==
X-Gm-Message-State: AOAM533WOR6glSe+NCu8l3jNUEWgOThx6Os5Sut6j8biHPpgXSEiiAag
 RrpBTBbdiYURnab5CUPJtZE=
X-Google-Smtp-Source: ABdhPJx3wb69o+9Gns8Ea5rU+G4bqnaPXWRFFoT1SHfqA0FUCsdviXL44mSynODzetlPyjAiXO2OyQ==
X-Received: by 2002:a50:b701:: with SMTP id g1mr6878915ede.197.1597492657686; 
 Sat, 15 Aug 2020 04:57:37 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d69:b900:61e5:2d94:8d77:6e0f])
 by smtp.gmail.com with ESMTPSA id v13sm9184110ejq.59.2020.08.15.04.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 04:57:37 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] Documentation: add riscv entry in list of existing profiles
Date: Sat, 15 Aug 2020 13:57:28 +0200
Message-Id: <20200815115728.15128-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_075741_536596_EE88BDCF 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As long as there are only a few maintainer entry profiles, i.e., three
in v5.8, continue to maintain a complete a list of entries in the
maintainer handbook.

Complete the list by adding the RISC-V ARCHITECTURE maintainer entry
profile found in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on docs-next

Dan, please ack.
Jonathan, please pick this patch.

 Documentation/maintainer/maintainer-entry-profile.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 227f427118e8..b7a627d6c97d 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -101,3 +101,4 @@ to do something different in the near future.
 
    ../doc-guide/maintainer-profile
    ../nvdimm/maintainer-entry-profile
+   ../riscv/patch-acceptance
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
