Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF0EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cxcbgy6eONWwJeVqC/mJxHr0WBX8b3aWXhBUL0FPr6o=; b=qhuV3YAuo9H+eO
	z7irxQdXtkhvXoGxExVLpLnu8wH0Y+nOri/istRAdMyQTRaDs6wdjpN5gWysDydoe7ekw8Su21uQX
	+bxM7Offvj5vS1pNLuRO6HHcSSMT9QpNg5UXGE33jPz8IgwbEBTiLhmhPPKXua+lGroxb0+h0cKmC
	urAUtj3D7GExdyEbYxnw4HN1XkmHT3cnSeouCYiodKsv5RxYqmrTnX5unbAoABOL1MvGDqqXnWRsS
	v9rgNwozs7Ou2LSVHlbIYz0BQwu11fVZxyOldv7GpVcumhWyIonGzMGRftn0g5mDMqg0JQ4ft2zLi
	yMb/wZfyU6Okqv2XXTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIweS-00CZXy-2O;
	Mon, 10 Jul 2023 19:34:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIweP-00CZXL-2l
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 19:34:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b9e9765f2cso5922265ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689017664; x=1691609664;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=X4CI5+SmtveArFRq79zdeBAZUIe4gvMt0iRwnhpBO+M=;
        b=O6OqaAAANi7fc6p016B8JcM8A4oTjbmBOcLJ18LWH7Ur+1YH4r3uQOvtPDwBv5c5Ve
         bhRMQo1LxCQTDbf3WXDKXxgdDn+hvmPpDvzcVIzxSbePdddl0sjfwbRfkLHyC6278ySz
         uWZVNrkq/0pjZEOTp4rGGfR/OO5dbH3NheQmO4G6aIf9KdYQFPisYzLgXIIEL1d98w9M
         xu/r68NDudVA5qEIPpmM0AHG6utlBJKdpxgVX5SeT7CxN/JpEhphL0uxQuu1Ecjtza9p
         VpWs06f8OHxl1eWuqueYzrJUGRXHMDHJLDuym0WBDPdiu3gPo4bE7Yc0kcjlDWDQ4L8u
         ppQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017664; x=1691609664;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4CI5+SmtveArFRq79zdeBAZUIe4gvMt0iRwnhpBO+M=;
        b=BOy+8NaSwr3Ozhu0WRcpe659aOiF6/2wOWmEktW96O+0uAVzNmJuVa1yThFi3rTq0l
         XBcXq8VY5/tUnFn4ot6gGIELe79cQUJpMKgAxyy57eKfZfIqglBz9I6o4w56ABQ3QO66
         Oyt0h8hPTb4ODneZm+Ar7pPvyeTx2VA2SmA+eYffudiptSbbBLb0g4G+jHGlJexa7BhS
         eeKieQDqyQPYsyyDWRQojLPuHH7zk2hXhSj5VvB2b0qZDh76lbip/eLXK+HtCSHm6LbF
         NsYPAbFp08rkq8AOurFZ5PW3pmCkHCSWkVPfwAcvDck4u5n+g2xODpGdDQ3EINPf+t4T
         GGJg==
X-Gm-Message-State: ABy/qLZd4QAUcsT2p7sD6TJF+OcU6SyWmfxwdJsycpKuYy/tuhy+vCQE
	YY4qHIXSqAua7f6G5Ww7cDD/mWjRFEXpa38AdEs=
X-Google-Smtp-Source: APBJJlGZJoofWbuCDQO4c7uLwyw5Yl/UFAKfGuF0ww5KD7pI79rJwkvqu+sjqOGXfBR/I4jWcXqlzw==
X-Received: by 2002:a17:902:eac4:b0:1b8:9002:c9ee with SMTP id p4-20020a170902eac400b001b89002c9eemr10551533pld.1.1689017664209;
        Mon, 10 Jul 2023 12:34:24 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902e74f00b001b39ffff838sm276606plf.25.2023.07.10.12.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:34:23 -0700 (PDT)
Subject: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
Date: Mon, 10 Jul 2023 12:33:30 -0700
Message-Id: <20230710193329.2742-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
  Evan Green <evan@rivosinc.com>, heiko@sntech.de, andy.chiu@sifive.com, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux@rivosinc.com,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_123425_897646_B6FF6CB7 
X-CRM114-Status: GOOD (  14.53  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I'm not sure what I was trying to do with the ':'s, but they're just
rendered to HTML which looks odd.   This makes "fence.i" look like
"mvendorid" and such, which is seems reasonable to me.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..933c715065d6 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -49,7 +49,7 @@ The following keys are defined:
     privileged ISA, with the following known exceptions (more exceptions may be
     added, but only if it can be demonstrated that the user ABI is not broken):
 
-    * The :fence.i: instruction cannot be directly executed by userspace
+    * The ``fence.i`` instruction cannot be directly executed by userspace
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
