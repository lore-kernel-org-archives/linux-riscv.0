Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 23:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3BveWqhYo/+kmlES4y408sMG0mYWY3v06WHMyr26gw=; b=MKgOF6muyOElsP
	4WkV/JZG2CnlUypB5xG/sjfJrQFUHKun5Cc2FdQwHISET4qRw5eN2qg1gpq9sbuC/oEq58odOZuOI
	E2k1LZoSZQ1HW0O6njE/DEatVY+YeS1gztxMqqYHw8rT42jISQ4SSI/6eoApIIW/XgOT//V1gSoEc
	QcQy6jVwN39yZuAg7RNOokBk9PNwrjoH2MuE+eMSNDi4f6e20LzOYxVimPmjSVL7ZHH19XejSHsEo
	6aN9qz7Orh2MXJUH21VFF2V7COzZWLkUq0OkuRqbYWx77wxMyudcpiWrXDhPD1QP3Q39JWCYI+Bg4
	A1zWb7GqYqi8d5XYzwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUd4B-00EUAM-1V; Wed, 16 Mar 2022 23:28:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUd46-00EU6h-DG
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 23:28:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id l8so5421685pfu.1
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ofUFlPn1fFr6Pz05IWJLvQM8LyheEnwZgHIcbcC4aPw=;
 b=S5EoqvKolpNViVFVC6Nzsj4aBgAWTlxXUWEEMY7p3wEb0057ehZpzaUnP8f4GDTFJs
 zse0vx0vaol845GXW+EPh58H5hafan3CLwS2NebIMBjef8U0HNWEx3yRz3jPiV3uJlEC
 YXWJrMiwVe+oiaYZPhnxkOPG0gNmZ72sB2JgKC7u3KkkHP6Mrza8LqpBn+wgIhU0+wXO
 eiGMxzeY0dkF1fMYunyzzQlM6whMlxgT8yXppR7Shy3VF4INxmMTGDdTecXUZiBbWpJi
 KxadBRMOObu8VavJ+IpQtZPAu2dQ5o1nwyDfes8oJeqdvEAFgSJuP+TqCD4jDajWtIKl
 w7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ofUFlPn1fFr6Pz05IWJLvQM8LyheEnwZgHIcbcC4aPw=;
 b=eYaTmHkFH45dsld3Ndgev9Ut1tvbJu88uEOYYwCGsxRLh9ZTeSq/t/B+y1oV/5fpIU
 GR8tdIghuWyLOxYP7f5SqebNGWJJ7edWyL6oeIiKna13h7YVBJeUgYp4unAN8te1utwW
 vHXmzXD5vD5MEIMHWMEO/qP16NCqHJwLCCDyhY/Mx2PI2+cmhbRiGlVBps+SlXUnPvAs
 m1umVNuupN9XZPpZd4svS2txzTo5ahCGFY8fRBuV4hGPTRMzNwwd8qliYtA33h2diQWM
 M4XKTJoY7VT70ly0CMJb45oWnhqh/t2pfmWMmxLpCRQ+GWyP2SL4q/A7dkfJzhkeNvGP
 jMMg==
X-Gm-Message-State: AOAM532h21nQQE8eut/JY9iQ6r0hG5KpoWlSr+x7jZjymc08bWr9dmdN
 ZectRqjowRNLPhyivgofJJPRHw==
X-Google-Smtp-Source: ABdhPJxYRrhM5pW5WVasmxAVWyXeEsoX5VSiHkFO1pWtO6NNC1CxKjdOixv6tMKvEgnHK4ZptvG9zQ==
X-Received: by 2002:a63:5855:0:b0:380:a9f7:e373 with SMTP id
 i21-20020a635855000000b00380a9f7e373mr1418979pgm.557.1647473305604; 
 Wed, 16 Mar 2022 16:28:25 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l186-20020a633ec3000000b003820485172asm145763pga.65.2022.03.16.16.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:25 -0700 (PDT)
Subject: [PATCH 1/5] asm-generic: qspinlock: Indicate the use of mixed-size
 atomics
Date: Wed, 16 Mar 2022 16:25:56 -0700
Message-Id: <20220316232600.20419-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_162826_475781_5B3BA3EC 
X-CRM114-Status: GOOD (  12.77  )
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

I have specifically not included Peter's SOB on this, as he sent his
original patch
<https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
without one.
---
 include/asm-generic/qspinlock.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index d74b13825501..a7a1296b0b4d 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -2,6 +2,36 @@
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
+ * It relies on a far greater (compared to ticket-lock.h) set of atomic
+ * operations to behave well together, please audit them carefully to ensure
+ * they all have forward progress. Many atomic operations may default to
+ * cmpxchg() loops which will not have good forward progress properties on
+ * LL/SC architectures.
+ *
+ * One notable example is atomic_fetch_or_acquire(), which x86 cannot (cheaply)
+ * do. Carefully read the patches that introduced queued_fetch_set_pending_acquire().
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
