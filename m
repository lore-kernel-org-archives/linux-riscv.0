Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4090C77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cq6gzMm6aV8jzvnLHhgEP3F2MvQhOfWgCpT/h3GNDuM=; b=M3thR1Q1I4XR4n
	drPxAHA/hsitG3ddCa8TlFmtZHHtRWa1U8d5QDN5Zw4BhWUikY6CkhHM3pKMMtikuJ+U1eRioFgS2
	tL5BISiCdCg8Sgj7ULEykk3qb4vPTGsP899cfU/N0yw5c3ZDkYEDjSAcpG4NgaTZ5UN2y+v0fWsU7
	6zii0DLyu8llaoEaBP8WPWNwKrbsBE3bPWA3lUDIhnj7gOSXEaeFMWoZcJjNjnlY/QgbqFV9JEiyG
	CPpqPXGC4Uutvmi1Cb/oDtRykq4gPFL0/WlFNyqgPY0FMLHsd9X2UD2jr77PnX1f7Fj/PtShj2dvH
	iSkzKsb5yHrVmugC40uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7eq-00Gnac-0Q;
	Sun, 14 May 2023 09:04:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7el-00GnXL-2N
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaea3909d1so108452125ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlYIG+wyBwHIZ6Ig5rNTc1U+7HEnxpjzPz2HnP+gqKM=;
        b=sxfLoTD0NF/Oidjt/30xAfQe77E+2H/A1Bt6TqxQY2/6VNOFb0Uyd85NQjRvs0Gag5
         ejrvn5D290RidtfydaauoUKGO4geu0N0v4EPBJVBS/2JCC7s9OlM++hFr2teuavzTW21
         ZV38a4rRNxUSnzdANrgTy8cb43irt2nrXWTxTXA1cnSswvilFYTNiRQWaUC9O94aAmVC
         lsnuAyuWfstUpgoGlSOIE7RjKzp/q39GNYDFqSYH/lHiWVVtzTldV8FA1qIHmtitgb/Z
         H1jO8rmhRdfuzZAEtY0XTyuQtKvXr1GkSahDS2V2F5V30jwmZRixBETwojLYSyVRTjYu
         EPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlYIG+wyBwHIZ6Ig5rNTc1U+7HEnxpjzPz2HnP+gqKM=;
        b=cBScXy1SbKAVpqKb3m+whh1PCv8j/GVu/Y2KYraV8xbZwOpLOmtUMr9zKCxlJmz3eo
         gZyZk3sgjF1rtSR8/8GCBn721sLsZxhRb0MqoItFXvoYP3LLN3szbw3SFVHRAwuBju0/
         rqweUDjwVGnbFKge/dApUBL6LDRgywT6reXi9+x2xKVQVWJo1sVkfCsA3vRHDlmsMrjK
         kkBTibUxOZlj4WapiS1pOIkS7DOb3oCYce2HmY3h5VWanW6kWN9XMYRh607D4e5iVRrH
         0y5pJbKbfM8cNq2B/7L999ZRBYga5wKc0YYY69ylloALrjim0bKD+0oj7xfTBuozajvt
         WYQA==
X-Gm-Message-State: AC+VfDzKkMmFmyTGT+/vFPP6Exx59OngEzGEAp8lYWwwaCyCqtpfULGr
	2upKMXhg9lFuKZtJNBp/MBUopwKfk4w=
X-Google-Smtp-Source: ACHHUZ6wCkJuuI/JM0p/RqMI5Szf/kAYaz3iNpFxdIUUUIOPWbcgZwStiNGZBZC7kIqG3LZRUx/3VQ==
X-Received: by 2002:a17:903:41d0:b0:1ac:4412:bd9 with SMTP id u16-20020a17090341d000b001ac44120bd9mr37163799ple.3.1684055082288;
        Sun, 14 May 2023 02:04:42 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902fe8b00b001ac45598b59sm11060546plm.163.2023.05.14.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id F099710363C; Sun, 14 May 2023 16:04:36 +0700 (WIB)
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
Subject: [PATCH 4/5] Documentation: riscv: vector: Use bullet lists for prctl() return values
Date: Sun, 14 May 2023 16:04:31 +0700
Message-Id: <20230514090432.78217-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230514090432.78217-1-bagasdotme@gmail.com>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108; i=bagasdotme@gmail.com; h=from:subject; bh=BIcautUtnBxQsDL0RzYa8VBmwL4oBx+HTCFWbrbAgPA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJSxQcJVJWzP9edXyJjjEvl+urG8yqOQaHWeu6mpPXT Yh+YGbWUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIu8YvhffPhVyo3d3M3LJhep XqwySe3xXazE+X990PRcvvXXl6vcZPinqrjPJvfnzrcnWx+vfqM8q/P7tacJkhIyZemTP3yYKnC dBQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020443_771636_C96699BB 
X-CRM114-Status: GOOD (  11.53  )
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

Use bullet lists on return values of prctl() calls to follow other
listings (bit lists and enablement status). This should convey purposes
of listing things.

Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vector.rst | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index c7bd701c7963b6..4624e5b9bef4cc 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -74,11 +74,12 @@ status for the use of Vector in userspace:
           PR_RISCV_V_VSTATE_CTRL_NEXT_MASK and PR_RISCV_V_VSTATE_CTRL_INHERIT.
           This setting persists across changes in the system-wide default value.
 
-    Return value: return 0 on success, or a negative error value:
-        EINVAL: Vector not supported, invalid enablement status for current or
-                next mask
-        EPERM: Turning off Vector in PR_RISCV_V_VSTATE_CTRL_CUR_MASK if Vector
-                was enabled for the calling thread.
+    Return value:
+        * 0 on success;
+        * EINVAL: Vector not supported, invalid enablement status for current or
+          next mask;
+        * EPERM: Turning off Vector in PR_RISCV_V_VSTATE_CTRL_CUR_MASK if Vector
+          was enabled for the calling thread.
 
     On success:
         * A valid setting for PR_RISCV_V_VSTATE_CTRL_CUR_MASK takes place
@@ -94,8 +95,9 @@ status for the use of Vector in userspace:
     Gets the same Vector enablement status for the calling thread. Setting for
     next execve() call and the inheritance bit are all OR-ed together.
 
-    Return value: a nonnegative value on success, or a negative error value:
-        EINVAL: Vector not supported.
+    Return value:
+        * a nonnegative value on success;
+        * EINVAL: Vector not supported.
 
 2.  System runtime configuration (sysctl)
 -----------------------------------------
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
