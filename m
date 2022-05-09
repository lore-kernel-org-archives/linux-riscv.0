Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF812C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKg4tnPDJMFeGRmuvT1ya8CZFJgb+ooiJOR2yueWGJw=; b=5GNtm7yZ8PP04s
	66/flJ5ytCgEPzq2A7hBMNHwFiKXSlceWHX6+7bqqM1eJg2aPzVNNuTyL6i6b6jJZuNnRxbsreoyh
	BIYu8yIGaAhWrV9Z9GsfeD9cDqhnUU6Lh5eqT+BDwJxeEHGu38AYswnve7iINHTqcKDCm+w3GVhXU
	ddbjF/hy6CtgMP1Utk+Mq/n3GI43PWfUF7osnjSzCZLYmJ1q5y4dJ6e6XdVNUJ0D9R44xt9ZUnLkA
	t3RLZk6WTjRiFokY6dYlhmtcQFSFB2cjVM0MSGeBAfYV++Y7y/8Mwl2kzwWL0Y8tPHHsnadwxNV6f
	ZW1qsyS+mBX1Dm/IME0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvh-00GZCC-Pz; Mon, 09 May 2022 22:32:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvZ-00GZ4r-Qg
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id c9so14481414plh.2
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=08o9m5Hkc1DwgHXwEhIgYa1O84W5gO7UU5kFrcD0IRY=;
 b=Ivfni2BR3drjv+XoR/hBXUrgG62qyubSK3Ofq7nGB2uI3j7DeKiw7jRrhjYIPRgbiL
 fX9foK05Y7Jog/gVmvwsgPmkiISwecG0vWlaNbZPsib7PJe/U0FrjNlpjZeqJTMnA4Ud
 xD2a5Ri7G1reYFJHWM8J0ABchfZtYYpFEJm7EacP6oMYWcpyn/f0Z1zDck1YxAxeMMcF
 un3MVzMWYPTLkAP7W6QyxETK9WwzzVdbB+7M0G8w56mYUpSu+iAgFJ/e7C0edwi86i0F
 9CtnFPdWIKaX25L03L6TPjghHJhiIfuQAKj24e211/mTSajbwfjFHu6V4QDWxV3ozgp7
 ADmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=08o9m5Hkc1DwgHXwEhIgYa1O84W5gO7UU5kFrcD0IRY=;
 b=WSOW759guBgBe8gYHztum7973x7eNnte3YE3v5YpuF+HqSsVVQZIDzjjeoMMuD2bkS
 XjYGMZ4hY3PEf+xadWtF4Y+Eg1hwVMqjqxurw7VCMYv9SNPfSxRd5nv67LG1a7WBKET2
 f+A34MgDsR3LpACC1rM9wA7SzIj/hY7N9lLdIzIAhaluQ0vcCnj7MCIEyaLqK6/2CgL9
 /jpInkYHLGlw8/hAzQQXRzJpFVZYBhqAiGwrbMXgQOs4mmLtLnOSRkfTWX2xkRCzM+B5
 +FZlVRafRj0vSSd83vFDMb4daAYnYB6MUorR4u0ac5kX0P4qpDo3bCqSr1qG86aoG1SV
 fT1g==
X-Gm-Message-State: AOAM533WTxqKqS7vEC858IRTcwaiSBixEn2sYX9g6aXNGjLUswJDoyw8
 OmPC7P2XUzN/ZEXezFjLfcvMVQ==
X-Google-Smtp-Source: ABdhPJwfKDrkaUHJSNgn6XFJOuCcJbR4otch9RHfl10t4H02hdxl8ivFVYd6BH4xCpPZNyXowDk67w==
X-Received: by 2002:a17:903:1205:b0:15e:804c:fab4 with SMTP id
 l5-20020a170903120500b0015e804cfab4mr18051563plh.112.1652135545965; 
 Mon, 09 May 2022 15:32:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 oa7-20020a17090b1bc700b001dcc0cb262asm224098pjb.17.2022.05.09.15.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:25 -0700 (PDT)
Subject: [PATCH v5 2/7] asm-generic: qspinlock: Indicate the use of mixed-size
 atomics
Date: Mon,  9 May 2022 15:29:51 -0700
Message-Id: <20220509222956.2886-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509222956.2886-1-palmer@rivosinc.com>
References: <20220509222956.2886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153229_971782_E0AE6171 
X-CRM114-Status: GOOD (  13.16  )
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/qspinlock.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index d74b13825501..995513fa2690 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -2,6 +2,35 @@
 /*
  * Queued spinlock
  *
+ * A 'generic' spinlock implementation that is based on MCS locks. For an
+ * architecture that's looking for a 'generic' spinlock, please first consider
+ * ticket-lock.h and only come looking here when you've considered all the
+ * constraints below and can show your hardware does actually perform better
+ * with qspinlock.
+ *
+ * qspinlock relies on atomic_*_release()/atomic_*_acquire() to be RCsc (or no
+ * weaker than RCtso if you're power), where regular code only expects atomic_t
+ * to be RCpc.
+ *
+ * qspinlock relies on a far greater (compared to asm-generic/spinlock.h) set
+ * of atomic operations to behave well together, please audit them carefully to
+ * ensure they all have forward progress. Many atomic operations may default to
+ * cmpxchg() loops which will not have good forward progress properties on
+ * LL/SC architectures.
+ *
+ * One notable example is atomic_fetch_or_acquire(), which x86 cannot (cheaply)
+ * do. Carefully read the patches that introduced
+ * queued_fetch_set_pending_acquire().
+ *
+ * qspinlock also heavily relies on mixed size atomic operations, in specific
+ * it requires architectures to have xchg16; something which many LL/SC
+ * architectures need to implement as a 32bit and+or in order to satisfy the
+ * forward progress guarantees mentioned above.
+ *
+ * Further reading on mixed size atomics that might be relevant:
+ *
+ *   http://www.cl.cam.ac.uk/~pes20/popl17/mixed-size.pdf
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
