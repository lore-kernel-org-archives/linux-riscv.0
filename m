Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0219EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPZzVi9IoqWiTDX6/NlJLxOh2xJtr7TvhVHNlpzTDf8=; b=FEbZkvPAhV+tpK
	g97b4iCzGp0ggIz4tLGEiCBaROtFcTIY+ImdcP2xMrQ78AOhvY1m7dkFAUQWYK5k1dpVE0iVprQiQ
	jEPbq8lMKjWGOJA0ASAEyjdhp/T8rY2ZVMKmX4vwjrvfthgnOOmye6GxKqfqL0ATbBA488ifv3mhE
	DxNp9lbhBYuClp1rq6jFx1sK0ef5TnCZqe46BpoGR0gLcRfnbBnXhJHgmW47bmA3QRHWESCnise5j
	kL1YbkQxjdRZO97H79h4X1ds+BnD7TXpPAZvj/mPnrx0sFoopauKl+/mgACd+KLQEsQ4KTlqb+B65
	I55s1GqN2t6OFzK19K0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7af-007RHe-IT; Thu, 14 Apr 2022 22:05:25 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7aZ-007RCM-FD
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id q12so5910600pgj.13
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=4yj8GNYwMFBt5S0TCYDexDsiDgZ+CphToZcr69BGb+YO1dX8XzN0DW+MGc/xCJDeXb
 Hcz0uIdoJnuNbkWJiV2+Fo3CA8vLW0C1IgS1CVVzH9aUg5j68NMCEbjwNgdXnkv7fEqz
 F6CZHlw5j34X9Ls84Zrx86UjvsRc7ZpFw0TYHUhHn1yyKX3+gl4msFSRvBIaTAhSTZdL
 2YApeozR+Yfgpu19kZ4rinoHRC5MkmRhG0bqlbbT5bTMnVca/5C3iwU5CORogN7li9gJ
 eSftO1vHZa891P1ksAqxpAa0QJfvz+pd7dN+ERBzaFvvo1jYWPruym4OXs80BdrcFNBg
 2lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=XzoEZkm0YaM5K3Jen7Rjo6jYY5Mjq2TF8E3Q2lQUNHODq6rm+bvuB3xXdSyw56lyuX
 ldWuf8cGmw45pIwSvKOPneCuRGXVek97LX0AJRb7hATc/HzOdWgxczynMtnVyzy7mlRA
 O+PdIs+y3sSGYWZvO3ij89NzKEm/PHZR2JZZUc7jDn35cQ9RcYkaYkpZnuVZuvlsfbmd
 IdsHtGfc+FEELNAdA3fnl4k1xN9x7RuX55jYvUG1Uzf5XaMABaR8cZ/yJnxCfhxOv639
 H02V/1PhfiN6z9YUWVXaA9rvhhe2IEmllr3AYQhYISHdFHCXcggWwTyiO5wfiKl0Tq4Y
 rm5A==
X-Gm-Message-State: AOAM532OkWXbx4iso+8jVt4QucEHeWtrU8qOQXjaC07KjfEDP7f4HOH/
 t3P7GLBFsy1ArNIsCne+chCk9w==
X-Google-Smtp-Source: ABdhPJy61GZpC7zZcOHBW9CQYGCxUgM5MW1Ir+LhmYjjwp3P+2wGDB1OrlzNEu7uootqzIZd255ezw==
X-Received: by 2002:a05:6a00:1a06:b0:4fc:d6c5:f3d7 with SMTP id
 g6-20020a056a001a0600b004fcd6c5f3d7mr5841959pfv.53.1649973916890; 
 Thu, 14 Apr 2022 15:05:16 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 n19-20020a635c53000000b0039dc2ea9876sm2697213pgm.49.2022.04.14.15.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:16 -0700 (PDT)
Subject: [PATCH v3 2/7] asm-generic: qspinlock: Indicate the use of mixed-size
 atomics
Date: Thu, 14 Apr 2022 15:02:09 -0700
Message-Id: <20220414220214.24556-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150519_555999_103C18BB 
X-CRM114-Status: GOOD (  12.66  )
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

From: Peter Zijlstra <peterz@infradead.org>

The qspinlock implementation depends on having well behaved mixed-size
atomics.  This is true on the more widely-used platforms, but these
requirements are somewhat subtle and may not be satisfied by all the
platforms that qspinlock is used on.

Document these requirements, so ports that use qspinlock can more easily
determine if they meet these requirements.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Waiman Long <longman@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/qspinlock.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index d74b13825501..95be3f3c28b5 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -2,6 +2,37 @@
 /*
  * Queued spinlock
  *
+ * A 'generic' spinlock implementation that is based on MCS locks. An
+ * architecture that's looking for a 'generic' spinlock, please first consider
+ * ticket-lock.h and only come looking here when you've considered all the
+ * constraints below and can show your hardware does actually perform better
+ * with qspinlock.
+ *
+ *
+ * It relies on atomic_*_release()/atomic_*_acquire() to be RCsc (or no weaker
+ * than RCtso if you're power), where regular code only expects atomic_t to be
+ * RCpc.
+ *
+ * It relies on a far greater (compared to asm-generic/spinlock.h) set of
+ * atomic operations to behave well together, please audit them carefully to
+ * ensure they all have forward progress. Many atomic operations may default to
+ * cmpxchg() loops which will not have good forward progress properties on
+ * LL/SC architectures.
+ *
+ * One notable example is atomic_fetch_or_acquire(), which x86 cannot (cheaply)
+ * do. Carefully read the patches that introduced
+ * queued_fetch_set_pending_acquire().
+ *
+ * It also heavily relies on mixed size atomic operations, in specific it
+ * requires architectures to have xchg16; something which many LL/SC
+ * architectures need to implement as a 32bit and+or in order to satisfy the
+ * forward progress guarantees mentioned above.
+ *
+ * Further reading on mixed size atomics that might be relevant:
+ *
+ *   http://www.cl.cam.ac.uk/~pes20/popl17/mixed-size.pdf
+ *
+ *
  * (C) Copyright 2013-2015 Hewlett-Packard Development Company, L.P.
  * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
  *
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
