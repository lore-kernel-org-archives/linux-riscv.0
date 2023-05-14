Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15813C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKG7AMh7o+rkijbIx1xXyWYdP7l5NS+sy6JKwIB9ow8=; b=mHfGaadKTMCqBG
	OeN5ARRDtWlgSSzio3j3/YXHR/0s5EOzTPwTRUembSKhdfoaCBe0TMUta7mrtJjDz7EdCpVLKyLxC
	F5Zvbli8rrZj39HRRBrzPhGRsHUyZYsBjZOtJ0/B0GdudtCc+9jnQZtFk75wg8DACCTppzLNbdaqy
	maLyn9AqR/eO68NPwbQmqGenMz36wOuMFoSwRBMEL8TrFzI0Ee+b4RN74yXpx+QXMvZIYOuiRgyxp
	kbfw+ccLmk4RO+Z0/l3/HUDc3UXm4wDaVpCGNWSFtTZec8JE54LSyJVrCmTHtZ6wEQhpwCwBzd0xs
	KE2z/8u06UKZTl105H9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7ep-00GnaL-1u;
	Sun, 14 May 2023 09:04:47 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7el-00GnXB-0g
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:44 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53202149ae2so510311a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VswhOVIM6N9lUQ5IbUMqB4CktfYicQQNL7zwxJA2o0=;
        b=gyDuam61cQhcYHV2PBw+v0qV4xXs/l6wEC2KCFNxFE/FegwP3dNUz5F1uZITuqHFNs
         syiVQB93aJW0sk3dLTzvIhAtFHwDUqDKv0DxfjPY2LAfiUZREKQetU0o4FtYmcZQHYIs
         SLz9bvWw+KOJZ9F58insz5q1Q/Skkb5ZBSSqQ4KzVy25ZR4TPjjpJmmxfaW5AkzGCLYU
         kyC0WR8qHm43CsElKIx+99P5bQhd5JC/WeUgHvZB+8yiE6kpC5wDiHU1qUxnNw8aFVm9
         vFQy9JA/WrL+zGvFSBJEGZp5u/gEeh+YLvR48s3C3QiNrlZmM8/gWAa2JdPSR7QH4t7v
         dtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055082; x=1686647082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VswhOVIM6N9lUQ5IbUMqB4CktfYicQQNL7zwxJA2o0=;
        b=KvX2sKHF7evPgLCJNX8lVI+3hzwNLlPtcmOO3qRQu8Y98vTomXoU/5epgok/npd9dV
         15OFuJ9Rm2XYKLhggmShLyVYIJy/tPAWEWjanNkiUCJ0T3TfPC2TajWywwMJEeHKYIrg
         m3h+rtVqJJXorOnPawfk+wPcXtAa4kE45jqW/5M1kOvCIEYM1LRZndXVSAWJyB456/Nh
         hC6xhXzOf28gToHa/zlbFWSer+Pk2wsnNdPrVrQYL+/PtCo81GrGm5kqQkxC8N1gGg5j
         a2KcWvCqvcr0F47UdhTBGfxnyYcdw22RQhIyKK67aBcm6iNw91mNeTaJcJjk+ydVaqTG
         VWyQ==
X-Gm-Message-State: AC+VfDytQBW3gdSaFi/Dj5EGxf6ZJbQx8MPb2DWFFePgWD2Rk/Yuj702
	iO2jU8tGB18vUzcEzDVSgk0=
X-Google-Smtp-Source: ACHHUZ4pzmq3hWDHq3IlCijrOGJ+N5qc/X55K3MabPDZwyQJR3SxOAkkPZxkiTNzN5IhuNLdSkgMaA==
X-Received: by 2002:a17:903:483:b0:1aa:dba2:d155 with SMTP id jj3-20020a170903048300b001aadba2d155mr29039425plb.48.1684055081786;
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id l16-20020a170902f69000b001a6d08eb054sm11043270plg.78.2023.05.14.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:41 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 2DC2B1061DC; Sun, 14 May 2023 16:04:36 +0700 (WIB)
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
	Greentime Hu <greentime.hu@sifive.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/5] Documentation: riscv: vector: Wrap control_argument struct definition in code block
Date: Sun, 14 May 2023 16:04:29 +0700
Message-Id: <20230514090432.78217-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230514090432.78217-1-bagasdotme@gmail.com>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=bagasdotme@gmail.com; h=from:subject; bh=S42igDCO53ZkCWTrexHErxJ8V8JjUUjsuLNH7WukgIk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJS+RzdR/arTB/dyeC+/VO9ajKJbfWaS/eYre5au63m 9852bandZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAi14sY/kd1vNPLvh0ZLD/5 +z3mc4mLzqh4tworRzq5Tp3pp3vu1n5Ghv7++/tYF7VvFmVYUlTw9UbKt18FpXt8xcw3v5p2QmO 6JycA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020443_296791_5273EC5D 
X-CRM114-Status: GOOD (  10.79  )
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

kernel test robot reports htmldocs warning:

Documentation/riscv/vector.rst:45: WARNING: Definition list ends without a blank line; unexpected unindent.

The warning is due to definition of control_argument struct, written
unformatted. Wrap it in code block with C syntax highlighting to fix the
warning.

Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305141409.bEBvlSY4-lkp@intel.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vector.rst | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index acc97508ccb249..178b3f3f452462 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -36,14 +36,16 @@ prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
     be interpreted as the following structure, and accessed by 3 masks
     respectively.
 
-    struct control_argument {
-        // Located by PR_RISCV_V_VSTATE_CTRL_CUR_MASK
-        int current_enablement_status : 2;
-        // Located by PR_RISCV_V_VSTATE_CTRL_NEXT_MASK
-        int next_enablement_status : 2;
-        // Located by PR_RISCV_V_VSTATE_CTRL_INHERIT
-        bool inherit_mode : 1;
-    }
+    .. code-block:: c
+
+        struct control_argument {
+            // Located by PR_RISCV_V_VSTATE_CTRL_CUR_MASK
+            int current_enablement_status : 2;
+            // Located by PR_RISCV_V_VSTATE_CTRL_NEXT_MASK
+            int next_enablement_status : 2;
+            // Located by PR_RISCV_V_VSTATE_CTRL_INHERIT
+            bool inherit_mode : 1;
+        }
 
     The 3 masks, PR_RISCV_V_VSTATE_CTRL_CUR_MASK,
     PR_RISCV_V_VSTATE_CTRL_NEXT_MASK, and PR_RISCV_V_VSTATE_CTRL_INHERIT
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
