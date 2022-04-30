Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74EC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPZzVi9IoqWiTDX6/NlJLxOh2xJtr7TvhVHNlpzTDf8=; b=qXYAv96BzN2Ocu
	VBLzmMJUGz2TbU7zF3tW+wcZ8gn7na30NLpJbrSeYuztaeAoJKZxg+OfqcrBfEAHD7/ONNFVsFOqu
	Jo4aTRV0rlyD3Mi+jB18y4ktOVNk3UyxZJ+OKmsij9oyqgIUHqZpwWCTcTcNOfJSotcmYO7T0/bMg
	gJW4QjbrGK23ZxAd9oPjbt2azUmL9mM3J5VtxcR0+aT3vcQ4Ptkba7und6XOJmEkwuQHOkaZz3X8E
	RQQlHKsG+X2LF8Y9VN89boDXcNlELdv/jtYEj4RflMm7drcnHUyC8D4qYi0ws9qCwP+4CZu9WCnv7
	myEt9IncGXBeZqLlhasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpAY-00EZBy-DE; Sat, 30 Apr 2022 15:38:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpAS-00EZ6N-T5
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 15:37:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so938440pjv.4
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=FFgRoVbZwMv/agjgfBQeiD4RduxnvL5RXSepip5M3kO2MagsWbSqQqxN8cL5qUbeSF
 BYxou0ljjXmk//t8pH9P0AP/HLxtAE0BLwIcoy+Ou0Lpi2MlCzGQ6f682gOG6CuxBpM2
 nwCLJBaCh5RV2r+qT1H5KRlCTIZUXo7CJ4l12KZINBErQtyavfgirI9l4JGBZus3gpLe
 R/LbIsa9B1VFw3791kqpL2EF7PWqMzHmRevq+xETQxk+DF6ipj782xSdFBUvyauIwqQ5
 aCr8I9PL5iINM/w5oq+qM/NT//BBL45/kvYgK8Ddw1j+NpxzLAepCkGEW3FID5OiPVqO
 qAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z18FUB9s7KBEskqVTf7aP0q/WSmapl+AGV7tm/Rzx+w=;
 b=lUQa8nEN88PbJIbLac4C3YwK9lY1sltTRay7j2ZOJ5IKhvg02SZXlVj2jNTxnk5N/D
 fM29JPY78rUixefp5JFv5Hwu2YfZuWTuEw5FyRLqKBwsuk5vs2DoXrrb8qhr282+uoCp
 GrIJsfAFqXFqfPbZC0Ntg+cNUk2AeXu+Z/taWo8k7Yrrb6PMhaAsOuLCugG3eYW62P8y
 MpcwqbVgpa+WbPd8EflDNvDvp/Fl04eQ/JGH+ePfBWdNp5m+toDr5/ay1GSn8gTQ7Zy5
 Xtoh98ifMwiKGUylEN0wnpeR7DCbjmtWy+UWOvZR+2PeU9nHl6n4CGTGk4JETqGuFaAL
 cmAw==
X-Gm-Message-State: AOAM532KYUu5kmHnyk/AQ5EQQYwJqmp2r8Ur+3Dh0M0pkLD3go9MMXWT
 x7wxpszBj9M1N6hTijeON5qvAg==
X-Google-Smtp-Source: ABdhPJzOcQtcQr8kDnX5vfoKXrEejVF7HXmixwlBQw/BjGtWP2W5ppTBL/zygWmxy79MN6V3JkKj7Q==
X-Received: by 2002:a17:90b:688:b0:1d9:9ddd:1f71 with SMTP id
 m8-20020a17090b068800b001d99ddd1f71mr9480283pjz.207.1651333075503; 
 Sat, 30 Apr 2022 08:37:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 y14-20020a62b50e000000b0050dc7628165sm1669724pfe.63.2022.04.30.08.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:55 -0700 (PDT)
Subject: [PATCH v4 2/7] asm-generic: qspinlock: Indicate the use of mixed-size
 atomics
Date: Sat, 30 Apr 2022 08:36:21 -0700
Message-Id: <20220430153626.30660-3-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20220430_083757_062065_E77E0ACC 
X-CRM114-Status: GOOD (  13.29  )
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
