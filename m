Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A689C77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qqmkYtbkN011q031CM4JMOQpaP6YIduxBPqjsddt4yQ=; b=dvqmqOeEH9MxPS
	pIsopeYg7OUs6Nb9ne61QZVwRpDUPRju+56SgvBa07CgKaN5cApl+O2TFAxLBsUmL+c1A9b6oBGtW
	hVcFx8YLCMamFCOLtd9k8F1UkS0s7V3EO9ZjH/Mu+oE3Ix8DYUvinjUMIjP2+fkO85bjOAQMZ2WKp
	/anEv2sMKTgtFIKEUvx4ha/VS7ilDiNQEu3RfBBkbp7DwfvpVFRW2IG+nntosQ/w7ZLZ3iTfZt4bn
	8bZBuINOA7SycoqwGbxx2M49oIoLt3fmxubkgMiGV5ZY3qEGf6RIADNHpu1aJxsEvF+ClTyOHiL4V
	rB3BQSunRNNubcG//aiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7eq-00Gnal-2A;
	Sun, 14 May 2023 09:04:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7el-00GnX7-0x
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ab05018381so107121075ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055081; x=1686647081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sr7He/pCNojPfEjyfoxTnVv2pnOmIOyhXbpqNpYspU=;
        b=pU95jA9oIE1XSndkuY4s8vJgdRJJfI0HZkVmmBo5BOdwDhCA/RuhEsNJdPjXcHvNOr
         6x3nsKHgsva2nibluFKpYw0ScZ5MClmNtKpWYUTbMylQuMwkQxQAa5MoJFC3uOEhSzS1
         TkmgM8YB/3mNslhO8KqH7LCnRDH8vHy5dQY2AZ8m83IpPd/QvdkED9Cv0SzhvxI5fXPD
         R7NVz3tws8acj78GzdyXRjDKsrEWVoeH8Q4UQY39FfX24WhUE1r6ShA5+0Fr8pn/+AhU
         2my/8FY11x27Hy6RwaQ2SlUfsSqrk3TykCpbB8bbnVCxwK3RQSvRwzu82ptZcttyeCWT
         IpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055081; x=1686647081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sr7He/pCNojPfEjyfoxTnVv2pnOmIOyhXbpqNpYspU=;
        b=DOiuAO3NzA5OUD6qrrm8VppZtU7IhU6BlKUjlUHHpePnfPuLZhhG1EYWFDQF0N9FX6
         Lkl1ufeFmb/G3Xhuw48ljLJvt+fSIJSfxQMihzbcOvoYMe+Ae2gELa+0tKMNwffB8lSm
         kwmUbJNmPtjlJYectaKIXWT7zXdlO9YB8YYcfJCsikLnvgr0H0gJP3k7qzKm/ZbHhv5m
         oKJeggsyfO47i6mYhnryvHmBvmA69NOfrRTx5Ag1zaS3uS+BnyZm3il6rGS7+EKyFwWl
         RgstYWkI8Pk72Wal1LyJCoT8mrdqriypSnK05XkZMNPRBtPFo1E9UrAMsS6L3R82CdmN
         tvFA==
X-Gm-Message-State: AC+VfDyrzhHxyqOvfGcFI3m7ty1fjISB3nwgUr1K24ewR4rHyIhsvv1K
	H4HmZLs8LfHVKJHzs5WXioDOUC+14lU=
X-Google-Smtp-Source: ACHHUZ7hQdIgm7/AWlnFtJBuPivBY+vCFVmAsf7EHDdFk+J5nlxqit/d6Tr2NaJ3D3VaTaQYaEMRJw==
X-Received: by 2002:a17:902:ec8a:b0:1aa:f3c4:7582 with SMTP id x10-20020a170902ec8a00b001aaf3c47582mr41892841plg.31.1684055081545;
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id z6-20020a1709028f8600b001ac5b0a959bsm2786455plo.24.2023.05.14.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6E5091061DB; Sun, 14 May 2023 16:04:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 0/5] riscv: Fixes for vector extension documentation
Date: Sun, 14 May 2023 16:04:27 +0700
Message-Id: <20230514090432.78217-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=bagasdotme@gmail.com; h=from:subject; bh=awthxNyEGnmTtC0cZTI98tjXN2G3v5UMQlRNSz4sBY4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJSyQeZ8QJO847+NKqMcv795Lqp9eM+I+Xr+m9d+jof mGHw2tzO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCR4kuMDJftfgarqTyaaXx0 qlhWZITC5SeH1fk4YpJDy+17Jsn7zGNkeHkhbZLg+51rH3f6fV4Z9+j6bI/jz130dvyWXfRQfnb rSVYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020443_333465_42BCC08A 
X-CRM114-Status: UNSURE (   6.98  )
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

Here are documentation fixes for vector extension support. The first
two fixes kernel test robot report [1], while the rest is bullet lists
fixup.

[1]: https://lore.kernel.org/linux-doc/202305141409.bEBvlSY4-lkp@intel.com/

Bagas Sanjaya (5):
  Documentation: riscv: vector: Separate SPDX license identifier and
    page title
  Documentation: riscv: vector: Wrap control_argument struct definition
    in code block
  Documentation: riscv: vector: Use bullet lists for prctl list
  Documentation: riscv: vector: Use bullet lists for prctl() return
    values
  Documentation: riscv: vector: Fix bullet list usage on sysctl section

 Documentation/riscv/vector.rst | 66 ++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 31 deletions(-)


base-commit: aab772f330541c3876484bcff439bb39b2784cf7
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
