Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A27C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWnAxGkoNyg1Ex5XVJS1zL1ov/p2gDnkKno3o05D660=; b=RzjcvRNKY4Oazz
	URn0yiZYUADG6owtPNqufCAJStjwP4mmv7nOhaH5jC3IpUQ88k5FJoCeiW8VA0YeQ49E6+ii7BnG8
	Lxb8SYParB0/0oF3VsXM/M5FtlkDL2wmLI5FOP6J+i/Opnu2VsQg2l0TLkCrYg6umXvaMou3QcB1q
	b7yfAK+uDAQondplzVzvLEsnUkEY1/QTHY0e8MwI/Ava3tROvveswezsW1K5tY7b2MZW0pCEg6Su+
	QXsljMvtiLbOIObLxQ7Yny1aLo29qCM2Oh0+0qvY/JQyCq8EAMriHBs+FfG8GKln1d6xeUK2hRh6a
	JlPciOfr6dVcTwjc4asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHde-000BIS-CH; Thu, 23 Feb 2023 19:52:22 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHdb-000BGN-Ox
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 19:52:21 +0000
Received: by mail-pj1-x1036.google.com with SMTP id c23so9337089pjo.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 11:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677181935;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=kNv7lyWeUqKMQdIrLNg4BGoutbqF49VEQkCAYrNA0f8=;
        b=DgX8fPy3Ouszxb4X1yPUI2udO6V/Rupx9jxLlU0AH9wphOISWqVRkRJWeQRd8Mbslp
         Eq2Gd5NyutHVia4TNM8NNV1/VUVAKWcw3qkkeSXO3hLgpp4YOt5pMJ0Kv6WHuLVDIcJs
         cPFX7otPatwS4LtoH7vwKtw1FZ9oizLoCFl18Dv3/1BlhudKf2vOsfC0DKQ26hYwuh16
         hRsxUhNS5y6eHbfheuA6avpedMVknnTXxEzyt5IieJH8ZVNefJsio0vJwVp5uT9wZc4Y
         Y+tM1AJWKDQV7E23iF1O855G3EziBxyo9weU8RLMPKTLDjOsCSJPnzIPEKKTA1z3w3VH
         WWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677181935;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNv7lyWeUqKMQdIrLNg4BGoutbqF49VEQkCAYrNA0f8=;
        b=4K8veY1DsNXy02HAoa5kNOjuzb5urMERZ7X8LFAz3qLUgDypMfUIw/IpZSA901+1em
         feJbU8Kl3p/uOu/12wzF9aFpe1vOlCPUx8QyT8DAExd45hJ0oeKnhibTWyNwn84ISQi2
         g+aNFnUklecY+eR72vsxDB2wPIEAS7uTHcIAywnj5xvN3vehPzTg440HbJrf/8GSv8BZ
         Gk5kFpCA/D1Ig9SYfjWv04xYhFnEhozFVhk8BrrfGqRYvHaMvA4pHzpwF8X6hOKIw9gp
         ww6znwvHSSBOqsAC1Lprw1aCzalljFHjF2XBeLBYO2s6Lf6zVREvxbf0fgr8IUy2riwx
         5Aqw==
X-Gm-Message-State: AO0yUKWG50YOeh2m06eQFf1r4gEoia0wNB/U1LYa2MncJ7HxVjy8Cw4z
	mJruPVbE+ssXkVjqT//7ypisMwDUr5alofEn
X-Google-Smtp-Source: AK7set95qTUQfKeO23Qxz1OcmAk98yhWB562/TI6SPqF7F+cIHGjxPuAOzcBMjX015KBzn5c0Nq19g==
X-Received: by 2002:a05:6a20:1610:b0:c7:7874:f66b with SMTP id l16-20020a056a20161000b000c77874f66bmr11883285pzj.17.1677181934545;
        Thu, 23 Feb 2023 11:52:14 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u1-20020aa78481000000b005a8512c9988sm3704445pfn.93.2023.02.23.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 11:52:14 -0800 (PST)
Subject: [PATCH] RISC-V: Stop emitting attributes
Date: Thu, 23 Feb 2023 11:51:12 -0800
Message-Id: <20230223195112.10489-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_115219_828320_6CC19F60 
X-CRM114-Status: UNSURE (   6.73  )
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

The RISC-V ELF attributes don't contain any useful information.  New
toolchains ignore them, but they frequently trip up various older/mixed
toolchains.  So just turn them off.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76989561566b..1fc504e2b85e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -81,6 +81,11 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
         KBUILD_CFLAGS += -fno-omit-frame-pointer
 endif
 
+# The RISC-V attributes frequently cause compatibility issues and provide no
+# information, so just turn them off.
+KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
+KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
