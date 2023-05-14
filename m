Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC22FC77B7D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+50nZXXxylQ710cwSz1Fdp3pBvqb+03rXS251UGy/hg=; b=LtpmFiLlr7mw+H
	nWc/rcza+6VB1cMMNdca+wNnt45W2v0hVVF83R2Kw8pUHcHrYH1Xaa/ATHPaxuoySTaiDZkgjAwfP
	OI53y8fjuGysqDW6sOqOghRjp+nKVBnLMoRpDhjdeWvBCIagDJYMBx6JFpSqg/XcasbAXjVHc1RfR
	JghayBE221wcPoZ4K0RROIadhT3bkth5bF+NDiDHRODCZH33Vj9DhShX1bqGVVNTl23OnxT3O1irL
	uERo6d0QDpbN7NeXzIl1IZaMvvayj7L0ratXobNc1EpaIpXEn1AC7mCu0XG9YylxnVyM5mvEi3xm8
	C/HZ2GKxo2KBT76U5JFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7er-00Gnas-0W;
	Sun, 14 May 2023 09:04:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7em-00GnXP-0i
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ab267e3528so82473125ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055083; x=1686647083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWsNucItL3Ir8RVSxlrmAT54pJTVw6Lt+rodKw+CzPs=;
        b=FvWwMcL2+nO561GFgxSm3hIVvRbDWjclyM+XprkVWb53HMSCvWLBbQ6PJDhWTynSgt
         539bfRSH3T9xgYyZfPFiyfxmPfGmqYfdDy6RqsGwy16PcE7Qny9NesyE40zqGYBxffkh
         g2rSdN3GY7H//g+gBOEvduXkznoyHpiRX8U7JjejquImPn69mKZxY/OCU1u9zgo4rxag
         OYr2kbUB6kRu8QVgvKwCkJqMsBN+nrIIrTKV5uxHJ4A0zUzScsPlYt7Erhkm9vbAJWGP
         4K1rwJSlcClcCmSJqpyAYqK/2u6hLNklJeGwvEvGIQuNk/wH3pU9qSuOCMinEgr8/0Lv
         huoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055083; x=1686647083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWsNucItL3Ir8RVSxlrmAT54pJTVw6Lt+rodKw+CzPs=;
        b=SQD4UZhaWGrlEsOSk9iUl4RFcHlaMtf8W8hKm/tZAXTQBFc1stx8Pp2sHFHZEAP2BO
         zg8h4aQHX8wCEnhchVOTTbJj1P2XJokQYw/XbggeTs16zjMN3zw3pewvnkkHTtaG5+yW
         s4Xe7Y6AOYEUr+Lvi6IhM9U84Pr48PE8dLtGxapKNI54V9MLMwStl4YGQ31yH+JuFB0s
         MynWlwJvOoJ7tOtcYpaszbZJxmW7Gz5WN4/5h+9LgOPsVipkWnkBgT6bgctk9xjh42uj
         gP/xFytH1RHnKfdq75txNAyYJ6JInaBrkce8qc5E/BefdIvaBRIqeig0dH0CwKj5vd8z
         pm2w==
X-Gm-Message-State: AC+VfDzWl1+VY0BhuLQ+naVE49vzEGkKlqNMZYO8gWi/13XcH2ghSDPB
	7eBLleYspxlJNeN4lATJ/7I=
X-Google-Smtp-Source: ACHHUZ4h2oq0sD6DW1Jn3SJpVqz/5hks4ikFzYyfoO/TD8NhBqG3iYXTurrqa+0pLQikvgf1idsRIA==
X-Received: by 2002:a17:903:2092:b0:1ac:8e0b:282c with SMTP id d18-20020a170903209200b001ac8e0b282cmr18318011plc.1.1684055082739;
        Sun, 14 May 2023 02:04:42 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001acae973449sm9287867plt.162.2023.05.14.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 490BD1061D7; Sun, 14 May 2023 16:04:36 +0700 (WIB)
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
Subject: [PATCH 5/5] Documentation: riscv: vector: Fix bullet list usage on sysctl section
Date: Sun, 14 May 2023 16:04:32 +0700
Message-Id: <20230514090432.78217-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230514090432.78217-1-bagasdotme@gmail.com>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953; i=bagasdotme@gmail.com; h=from:subject; bh=GHK5dRGPQCAuWJZz8ukbYwsZAgNOSpPJq12ZuI55/8M=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJSxT0N3SHmsulmgt2i2dWNdX237yubfG1afKdzP3vo uclfZvSUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIlEhTEyzObe0dG9/OjsqQwy s3Pe3eVmbGUWEONcc9NrpTFrR1HdY4a/4g/fzL8wYbforvQTN69G7p6xbe3v1Z+v+Maf0z34yXK PBxcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020444_256945_ED44E52D 
X-CRM114-Status: GOOD (  13.39  )
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

Prose sentences are better written as normal paragraph instead of
using bullet lists.

Also, use bullet list for list of riscv_v_default_allow values.

Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vector.rst | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index 4624e5b9bef4cc..f752826871b0e2 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -102,25 +102,24 @@ status for the use of Vector in userspace:
 2.  System runtime configuration (sysctl)
 -----------------------------------------
 
- * To mitigate the ABI impact of expansion of the signal stack, a
-   policy mechanism is provided to the administrators, distro maintainers, and
-   developers to control the default Vector enablement status for userspace
-   processes:
+To mitigate the ABI impact of expansion of the signal stack, a
+policy mechanism is provided to the administrators, distro maintainers, and
+developers to control the default Vector enablement status for userspace
+processes in form of sysctl knob:
 
-/proc/sys/abi/riscv_v_default_allow
+* /proc/sys/abi/riscv_v_default_allow
 
     Writing the text representation of 0 or 1 to this file sets the default
-    system enablement status for new starting userspace programs. A valid value
-    should be:
+    system enablement status for new starting userspace programs. Valid values
+    are:
 
-    0: Do not allow Vector code to be executed as the default for new processes.
-
-    1: Allow Vector code to be executed as the default for new processes.
+    * 0: Do not allow Vector code to be executed as the default for new processes.
+    * 1: Allow Vector code to be executed as the default for new processes.
 
     Reading this file returns the current system default enablement status.
 
-* At every execve() call, a new enablement status of the new process is set to
-  the system default, unless:
+    At every execve() call, a new enablement status of the new process is set to
+    the system default, unless:
 
       * PR_RISCV_V_VSTATE_CTRL_INHERIT is set for the calling process, and the
         setting in PR_RISCV_V_VSTATE_CTRL_NEXT_MASK is not
@@ -129,5 +128,5 @@ status for the use of Vector in userspace:
       * The setting in PR_RISCV_V_VSTATE_CTRL_NEXT_MASK is not
         PR_RISCV_V_VSTATE_CTRL_DEFAULT.
 
-* Modifying the system default enablement status does not affect the enablement
-  status of any existing process of thread that do not make an execve() call.
+    Modifying the system default enablement status does not affect the enablement
+    status of any existing process of thread that do not make an execve() call.
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
