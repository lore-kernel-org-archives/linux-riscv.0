Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19B1FD007C
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpIzaMKxTRrTyDJ0fCMzfeJBEXpCqw3ckiTBmJp8ETQ=; b=DSSKWr0AGNdmLP
	B1VlB/RCCmRVULqnspgCCX/OVQ9bV5E4brtP5OdrETymk6Fz7jTtc1+nZTNJVquIVxPVPXub7SRTq
	xx9U0KusCRtsXvuFpunGHvBgPkd1sxqo1VCaPlBt5Ah41Q4GSYU+67amJBWWhdrOOpZoRqAUK2dsR
	9Z2qsF1HS/aCTxEhvzn5dPnW5UpbGOu6/MkTRS8F7kh7VlCLuRy/2NBO7LiguRdoExlLvjRqMg8R5
	/C+NXmsJ3/L6j3NzwafQcn6Wl2ZjZt3pGhFmgsebLY493UuBnwl9Jh8z/Gnc6O9QnLk4ccYqDFj5R
	vTZ+rKYwssJZJ/72WlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwopS-0000000BvdJ-2C1E;
	Sun, 01 Mar 2026 21:59:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwopO-0000000Bvbi-3V0e
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 21:59:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439b2965d4bso624980f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 01 Mar 2026 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402393; x=1773007193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdF90L2tMXaU2D2ZcWRZkQORWHdME4B3q+DTo4zCDx4=;
        b=EdPnui3wYQuN2eGIk/JT7s1d/ShMW/Ijjkx0VgGXnLH8OD2eIRmWd0oL/LuTkXu7+s
         j5ykwJ+I8+qNNajOpqa5v9LevM8svQHiAF3Kq2R/F1459StUjvPNDrdgjz+I+X4nL8I9
         PoQGbLR1eNAwPAvw58evARXog0axLHsd8aiZFzQabBnZDh0NowDLcMPlXgdwscGrgBeq
         2ELcb9SChwKsKKvOgMCdEDre02A5P51CtILdeTwcOXCI2AMB2GSMQWh8r5Otdj85Brwn
         GUeirCXtl4sTlW65Hm1UBQYTX5l2ZM/Jb+EWBpFhLV8l7nIKWKnXZHOBlY47kDbxWUZO
         TOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402393; x=1773007193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XdF90L2tMXaU2D2ZcWRZkQORWHdME4B3q+DTo4zCDx4=;
        b=oB5t4F7yDJh6bp9YFDtrNFq99olFvZ2piu55UuGDUWoS2P4CxMkd2Rz0XVCIhmN777
         4FkPvsgdlcf9HNIL0vWmoLDWHq63w/dFJ3jxyFteWIcfyRPYpOxLrFLQcT7U9TzmPqpq
         VFwF3uht+yLteCCsX9XE+405gkv9CpOPnxZRl8pyRrGsKEpB3CxiaqJEcSSZZFlH388r
         ajR8WRP6NrPddll2NS9OUIBEUvPRR1GD5mk43wcOojUNCIWtPKOmcWosYfdLt7vbxsbb
         RFOLQj2SJ/aVP+d30eU2CDdFm4o0zzlNpzkS+grCvy4S9tD6gf5AFzEsVNh6rtc0whUD
         n7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjWhLLZf4nOCxgM7Q7WOFr/EhizhzZ71xF8zMe0lw+pA6VEhUgrPMK3qXRHXMZjBhFDO8/7+2gH1TjtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymE/wSWdzu8C2sjEjAFq2/BWsMDuLZXC8kuF7j7xSZvOYCmiP0
	C9HgtP/c5hvStwOeFDnb/WnNIxS6er4p81Ah1M4e46mCEg7cz2SdGChP
X-Gm-Gg: ATEYQzxDikuoKP8JVYHyU3TXrMQ80EZPXGEsHVT6nBLOBHvgFiY79caC2yXXfqLwAR5
	66ix+8gG4/V4dHr5gUwYC5LM6Eih0sZUoFi1QiKLu9E4cs0o1qOtAFerJWIsumPy4pf2zO59hOW
	eMWS75A/8C+Kuj8z5+x75m68hDDkekspVmRgVMMEWeiUGTDmSvuLo1AmIyb3KzNf8auWZIPoCNx
	l5pzRAQeLtJNxO5OjgzDw7mUwfk8+TYSde5ucDNVJRvMLh/XlREWUwpiFXwdiHcAWuCr2LivaF4
	FirOFsHJb3/MOUo1HsYzHYboH151FSY7PAwgYZlR8OINiandL+QfDpO/xRTZBHnqT8lw31ujqmY
	YnislHtEz5SDobi8UMdcQYW5Q5ydGSLzGnVA2YnncBivSD36BXfp2YpPFOC2zI7yt45cCsaToJa
	tdeV93utUq08bO3w5OFnv5DdBQ1bi4Yf3DaHHLfzQhCo+yCm9INU5NQcV5oAP35+Zm
X-Received: by 2002:a05:6000:18a6:b0:439:b886:20cd with SMTP id ffacd0b85a97d-439b886219amr989086f8f.16.1772402392592;
        Sun, 01 Mar 2026 13:59:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a523sm22434797f8f.19.2026.03.01.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:59:52 -0800 (PST)
Date: Sun, 1 Mar 2026 21:59:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Andre Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const
 pointer
Message-ID: <20260301215950.2fef5722@pumpkin>
In-Reply-To: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
	<CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_135955_326763_CC869B86 
X-CRM114-Status: GOOD (  24.32  )
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

On Sun, 1 Mar 2026 12:01:08 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 1 Mar 2026 at 11:34, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > -       for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> > +       for (void __user *_tmpptr = (void __user *)                                     \
> > +                                   __scoped_user_access_begin(mode, uptr, size, elbl); \  
> 
> Why are you casting this return value? Wouldn't it be a lot better to
> just make the types be the CORRECT ones?
> 
> I didn't test this, so maybe I'm missing something, but why isn't that
> just doing
> 
>         for (auto _tmpptr = __scoped_user_access_begin(mode, uptr,
> size, elbl);         \
> 
> instead? No cast, just a "use the right type automatically".
> 
> That macro actually does something similar just a few lines later, in
> that the innermost loop uses
> 
>          for (const typeof(uptr) uptr = _tmpptr; !done; done = true)
> 
> which picks up the type automatically from the argument (and then it
> uses the argument both for the type and name, which is horrendously
> confusing, but that's a separate thing).
> 
> Does that simple "auto" approach break something else?

This is what I needed to do:
(Note that is pre-dates 'auto', but it should work.)
Send at 21:56 on dec 20.

If a 'const struct foo __user *ptr' is used for the address passed
to scoped_user_read_access() then you get a warning/error
uaccess.h:691:1: error: initialization discards 'const' qualifier
    from pointer target type [-Werror=discarded-qualifiers]
for the
    void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl)
assignment.

Fix by using typeof(uptr) in that assignment and changing the 'read' functions
to use 'const void __user *ptr' rather than 'void __user *ptr'.

Fixes: e497310b4ffb "(uaccess: Provide scoped user access regions)"
Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1f3804245c06..c5d5f2d395bc 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -650,32 +650,32 @@ static inline void user_access_restore(unsigned long flags) { }
 #define user_rw_access_end()		user_access_end()
 
 /* Scoped user access */
-#define USER_ACCESS_GUARD(_mode)				\
-static __always_inline void __user *				\
-class_user_##_mode##_begin(void __user *ptr)			\
+#define USER_ACCESS_GUARD(_mode, type)				\
+static __always_inline type __user *				\
+class_user_##_mode##_begin(type __user *ptr)			\
 {								\
 	return ptr;						\
 }								\
 								\
 static __always_inline void					\
-class_user_##_mode##_end(void __user *ptr)			\
+class_user_##_mode##_end(type __user *ptr)			\
 {								\
 	user_##_mode##_access_end();				\
 }								\
 								\
-DEFINE_CLASS(user_ ##_mode## _access, void __user *,		\
+DEFINE_CLASS(user_ ##_mode## _access, type __user *,		\
 	     class_user_##_mode##_end(_T),			\
-	     class_user_##_mode##_begin(ptr), void __user *ptr)	\
+	     class_user_##_mode##_begin(ptr), type __user *ptr)	\
 								\
 static __always_inline class_user_##_mode##_access_t		\
-class_user_##_mode##_access_ptr(void __user *scope)		\
+class_user_##_mode##_access_ptr(type __user *scope)		\
 {								\
 	return scope;						\
 }
 
-USER_ACCESS_GUARD(read)
-USER_ACCESS_GUARD(write)
-USER_ACCESS_GUARD(rw)
+USER_ACCESS_GUARD(read, const void)
+USER_ACCESS_GUARD(write, void)
+USER_ACCESS_GUARD(rw, void)
 #undef USER_ACCESS_GUARD
 
 /**
@@ -752,7 +752,7 @@ USER_ACCESS_GUARD(rw)
  */
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 for (bool done = false; !done; done = true)						\
-	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
+	for (typeof(uptr) _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
 	     !done; done = true)							\
 		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
 			/* Force modified pointer usage within the scope */		\
-- 
2.39.5

	David

> 
>                    Linus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
