Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB94C7EE2F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JbgRPtNLynSwRkGDC+xVVkFLlEzq4yLbz3lfqTYF7I=; b=mtdohg7UN5uhsu
	VtlAF5ZCKTwbLmc/KJquc7TBUZ/vCa6jvhShGb0ByqH3aBe928Ux1/2fCXnxHHCjxy/CMW2oUtF5M
	l47oOr/58RnLoF5vVH87Tr0rRM5yVidFhy1pfZGq1s+GzsWZlPPGoWPRWtsrALDGRbSxZyjuxdFOG
	vjoIIRtIX2OOWkdPtFNZ1dYrFoDpnE+aPHkXBzOScyEfx4BGXa6LECAc2z7gnfJjWut3z1Xl29qVS
	HKVv1DfRnwCxVQ6zSRVlkFadjNjpn09B9iQ6G4tOYnrX/nXyU9Dpi6NkHesCnFNi9nKEUymArPbes
	tCP5fbSY+I8dF4YjI/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7en-00GnZ6-2n;
	Sun, 14 May 2023 09:04:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7el-00GnXF-0g
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-528cdc9576cso7926500a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIanyhJS88Q7RfVNqljO8EtKKIvGna+18p2AMpDpX+U=;
        b=CgLdpdVKhiQqsKr2AyMNHWm3uR3kk6DMFszCy7EQcABgt28gkiZ1AafbMGbW86JTx+
         LnizcfPOhbNBU8/9RIfbvviAVLKL1ApA166UNnezr4YyshFLSs+QU908wo51TG06sFUn
         6vwOI3CzVmcFf9Rtmw2XNfDisol0wwtMnYLSalk8sHyygzfj7RXU2E0S5A3rVNLe39cR
         P9B3/gSUsU9KGsf+To00d+xpUeEBLJy8bzbwQhFkSQSDjJkM8eLN3QknKrQRTgN3aOg1
         LLg2u3AUAQJQG1iOcSi9qA9U4jCzF82jq5Jb8ACLvSevx4NBSVdYaSwjhoKG0QHfQPWI
         C1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIanyhJS88Q7RfVNqljO8EtKKIvGna+18p2AMpDpX+U=;
        b=dZbLHKgBMFY7SsmHrcIPUEF1ZU3fubiZwZQSrVXx+YLbsULOzaVdrN7FdzatdCK0X2
         BtoJN10Pu1SSGq1OaJGUiQ3MsHJCgOCJ6cUKLxtjvf4ISt7CYPF3UQ5VpmnT3v/tVcpj
         qFovyCzGJeX5PrgRBUI9YrqfMrCdd3YCFdbH6i9jAjJNG+rAsBVaqqKRQLnvCy7JgrgV
         aZgoG0Mcnv9ShOSI1QBQ0XwVOMSvvKKJru+dvzb/+H+6RrAYNk458F+/CAHvTY7P6gV7
         2H+nftTrHJ3ShtY1FcCUitmPoX/gSbsUM4NWRLwhqNFxhtizN38MB4hvf8Kr8iPmLjDz
         ZgKQ==
X-Gm-Message-State: AC+VfDwc+5nS4Y+pdNGphD/9eYFjE+Rj5fzJlhu0qRf5NPrwT3l6e6gN
	q/GgvfZK1d5k3kt3hFSKqnU=
X-Google-Smtp-Source: ACHHUZ4V5wgMt2YCt4Gb1ub46b4Vak78d55bkX0cYjQkPO8T8Qiv0fPcs8d2tc7YVgqJPIXodP5WAQ==
X-Received: by 2002:a17:903:22cb:b0:1ac:6e1f:d19c with SMTP id y11-20020a17090322cb00b001ac6e1fd19cmr30176048plg.41.1684055081976;
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170903048300b001a9666376a9sm11029564plb.226.2023.05.14.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6CA011061DE; Sun, 14 May 2023 16:04:36 +0700 (WIB)
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
Subject: [PATCH 3/5] Documentation: riscv: vector: Use bullet lists for prctl list
Date: Sun, 14 May 2023 16:04:30 +0700
Message-Id: <20230514090432.78217-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230514090432.78217-1-bagasdotme@gmail.com>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=bagasdotme@gmail.com; h=from:subject; bh=cZzclkM/zLfkcp8yZSx1IGcKkEsU6t+56HAynF/Kr40=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJS+R/RJzdLfV0aWb3xHVc1QXO9/n0mb18FBjuz246V HJDISSxo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABNZl8HIsCvPbkujH3+x3hJt oyKnX5v2sJq/UmgWD6lSrFV/6MfPysiw6g130FSu6xuc+hdWP3zTcr5Vwe9Jyox87rIcya02b6S 4AQ==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020443_297182_3799B9E1 
X-CRM114-Status: GOOD (  12.55  )
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

The documentation lists two userspace prctl() calls. Use bullet
lists for the listing.

Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vector.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index 178b3f3f452462..c7bd701c7963b6 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -13,7 +13,7 @@ order to support the use of the RISC-V Vector Extension.
 Two new prctl() calls are added to allow programs to manage the enablement
 status for the use of Vector in userspace:
 
-prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
+* prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
 
     Sets the Vector enablement status of the calling thread, where the control
     argument consists of two 2-bit enablement statuses and a bit for inheritance
@@ -89,7 +89,7 @@ prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
         * Every successful call overwrites a previous setting for the calling
           thread.
 
-prctl(PR_RISCV_V_SET_CONTROL)
+* prctl(PR_RISCV_V_SET_CONTROL)
 
     Gets the same Vector enablement status for the calling thread. Setting for
     next execve() call and the inheritance bit are all OR-ed together.
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
