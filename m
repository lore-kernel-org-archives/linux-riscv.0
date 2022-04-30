Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9083C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fD1nQ5SMLD6CQ+hoKhM8sLPWcOpAJNVUxZYGNsMmHDs=; b=OPyyw+o0vyn1wR
	RachbA7D/gLWP/iLIy7AOi5EtlpMYVKC4Ssjo+WbatYMZ/081/5kFmCbKVL+StvKDtwXo5dZdRsng
	9Dms8mXCAKvzPXolio7tOL4++lVzXj6tEsn2BGiu4ZxNmOpcqe218Pf77O/HnCxO8LcozrGxWra/q
	4RZlESaJiceiJCZ3iViLHP2Ho3xkJoCNVztAsqj3ikyOpnk2pkiU7qdOU7R6YKl5ZeI37fDYBtQsF
	cynuO26uROt/UzCW2D72rlkNyLCM0vP8q8U59VbDg/6T804CeIN3uCcHiSCekzET7zRsPDsgu+fQx
	mPc8ZEdZOQUynqNrLVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpAa-00EZDC-In; Sat, 30 Apr 2022 15:38:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpAT-00EZ6y-V4
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 15:37:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id s14so9448425plk.8
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=kF7TN9WBue7gogtLcWCSwM/BfmlmiiSeL5p6P+r9TFf7mJTPo7V03Vb2pERNLvb7OE
 aRiiolMYojHxd4x5cQCGpG9H2wT2LX9AGbU77WuAKd7VD9xTc7yVRQuxr9CmreoFTg1r
 PvNjg/njaujbrqAe+WzlaHXAa3YGjcCyPClqxCArzRUK1f4wnu8wIGOKQzuuPux3fanL
 dNudXAVOCI0w1bdRz0Bat3QH8ewK8iAbnP04kEkDwytD4R2TvR69JqSwtluXppkeLWp+
 iJKg4ylgLJ4xSXkYkJB/5TkTjMKtqArr+XkBvDHr/ZIlgr8RD4A5+MLPtRKEzg0pyefW
 MJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=nBY/LTP5plYaSk7AXI4VENXnuXkWz8rnZOCKel2GQ6FZTjaKQJwETn6BtGqT8LP1+/
 K7YqqDjLHhnwr+afcwZ/6Zk1jEKiXeMNc2SZHmrflV60JhxWlmav7Te5xWyY1Ybi9LTa
 IydJhIzDqP1GOvi19sLlPiT2dz+dk7hYXlbrPHV7FQYkekSiGzXnwLuuBVAugEHe1gpZ
 Y4YT18tRwSmBXnEJs+FdvjNLKnTAWXr29cXsQJRhxLNCu29q9nrnhP/xyN3FrOwSl+Ou
 0WbG2rOSHtHK1J4hRdFQOx822r7Jmb8oVelfrDNcJgkyIx6fmZ6WAJDtRY9QzVQooKMR
 OTnw==
X-Gm-Message-State: AOAM533e7juFsctuGz2dLQzTleo6hZdgV6uOs7KVAq+sRhlTwpB2Bylz
 XjrF0xwYWxzW0B/IzODXlysWAQ==
X-Google-Smtp-Source: ABdhPJzNtj8d/a+lfHQeb2reqO0YCZeJo7LPF+70BVvrDTXjKfwmfYC5tWlm1kzXph5Ui9RlcPxgHQ==
X-Received: by 2002:a17:902:8d8e:b0:159:4f6:c4aa with SMTP id
 v14-20020a1709028d8e00b0015904f6c4aamr4142558plo.115.1651333076544; 
 Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090a2c0200b001d7761ee6fcsm12923373pjd.3.2022.04.30.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
Subject: [PATCH v4 3/7] asm-generic: qrwlock: Document the spinlock fairness
 requirements
Date: Sat, 30 Apr 2022 08:36:22 -0700
Message-Id: <20220430153626.30660-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, 
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_083758_034274_FAFC9CB0 
X-CRM114-Status: GOOD (  10.35  )
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

I could only find the fairness requirements documented as the C code,
this calls them out in a comment just to be a bit more explicit.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/qrwlock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 7ae0ece07b4e..24ae09c1db9f 100644
--- a/include/asm-generic/qrwlock.h
+++ b/include/asm-generic/qrwlock.h
@@ -2,6 +2,10 @@
 /*
  * Queue read/write lock
  *
+ * These use generic atomic and locking routines, but depend on a fair spinlock
+ * implementation in order to be fair themselves.  The implementation in
+ * asm-generic/spinlock.h meets these requirements.
+ *
  * (C) Copyright 2013-2014 Hewlett-Packard Development Company, L.P.
  *
  * Authors: Waiman Long <waiman.long@hp.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
