Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547A0FD0079
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cU2vciXNGU8tCrpwMvVo7eU6/myhWi41Om8tHDr4nh4=; b=GELwlRxSNsbgBu
	2cTCpcbLdaZ03FHUVLbyEdpAw8gyt6p1HMBVq76t0hmNOPQdadUlukVMdHBRTaI6ZKPVCsttemwjS
	L78lw+FVWO5nidNUyqbzwp/oZ7cqCMVbhv+0rz1twy5T2LU3G5OfceQIGTTRlHI5r9CHEd7r661mX
	uFDsQqsK/q7DHnJ93WtQv7GBtIyA1fc244NCvMpBMiFvwY+sq3Ubm4G3R91214cX86b9SS1OkcHHA
	8MAuXfU4btsvjcUiy/JNKuDd3g72yat0iZXmJlz9GAo4qM68nBQQlOB7NXJ7ZFZkma1GWv7URLd4e
	iSwgtDXYfgUWB7G22U9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwp5g-0000000BwSH-0hEx;
	Sun, 01 Mar 2026 22:16:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwp5c-0000000BwRU-1c5S
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 22:16:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439b611274bso258306f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 01 Mar 2026 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772403398; x=1773008198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIl/dHV642tMqRZscE3Zjz5R/EkJp5KZJrPHqY8MUl4=;
        b=ZOH7wUn0pFwWlqsmDXVsiZ/GoPolA+rT/2rZ66ZEn3GNseDE9syJuTVo3R2bPrWQ7K
         qIl00/HnrP5FxDZmKxfFMkVea5rv1/HgDY2PgVdahcpgC++8gEdSmD6Lj1mYOs594br5
         WCjNm1WyqXkneut/BrR+NKVTn6SZy7IukMsPiHpJgSX3lBHcumYE4nepCqIUb/tYD0vG
         1t6DjKJxqXgj/V8n2/j16r+PBOaBGzRhG6viI+oC+nHv4SYchCrQEreO5poj93K4ZyEF
         zGC1bvBYfCrv7BwSGExO7aeIh9gEhTFbx+5TFVqwuN2iQtFG6DvgdOtHRYyEPfAkwWI4
         utYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772403398; x=1773008198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIl/dHV642tMqRZscE3Zjz5R/EkJp5KZJrPHqY8MUl4=;
        b=FHuRrhsPvYKKL42uK7zBcxLDJ1H/CWvZJa15qCXfrKAUCRUrLuzU8l/DHSzn+uWfpL
         D1o0+5xFWQGIeNXRCugYmWd6rb/yhsyLqFZY34pOQQOGHAnxIwYvdnBAt1J6Jk4doav6
         HIdlZyn9dSkzkNyik9To4sWhvYAMkUCs91cvt5MPl1E3A58wSZ/obJK45DaaUbjGJOXd
         EcZPD7ha0LkkqcGdExmrT9NX3jWyWM6ABAEAJg29mQanShrixCXuwgSHWQ1vUUBi7l4P
         OPHuXLQPhTf3N1Rd5QlV3CjE0g6WatHvqmSVGHDONM7BTSFGBuL5olUEwK5hY20E8SV3
         DXwA==
X-Forwarded-Encrypted: i=1; AJvYcCUpp8MJ8hOSYf1IlNl20k49zbTTw+gCcvJphYj+DcpogUyWHFQCKK1FP0jhMPem67XKVNH0SgN6DFucnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLXCX/AqbR6ND5Bzzn/M7oArpEt+OrjnDwhLsmWIAu1k35W5zt
	sSGRq8m7dcr4k2ER0aKOWv+CgT7khOxC+9sEEYN+nOXZehawjaRqryGz
X-Gm-Gg: ATEYQzw/lHLYo7LkKH5ML002Ns/Kkgxlv6JLmMNu+xCgllACiL5/Hi9IN9npS91t8Hn
	C3o1drNes2nRaR077Ok/zMgmhBTLGei91NrGszvFDN1RfTv19JXdMU3JkQaYcAPxtB9D6vAvRev
	PEr3NwoS85DETlSNtEzgovvVtMhXElFGLtuRhPVo9ZJ7oo7mxzzzulkYMsspdfBVlW0tW73vbvL
	oIEfoke9MxMLw1TFN1eEFvphUNQuPlZnN46TbAitT+aAF5sjaP/3taIvAzsplM/2kNs6oWhrC+Q
	NNGNixCiN30tM4MTx7MtiYU8exJTR1UDyQBFZ3sV7dpDGGNc9xEnOP+IJwS3dj+HI0msle6eRII
	PGLzy/rtp+aT6+OCbibdVgqWDjsVlpRMrOeBpRl1rA0Hh3wbg/WxTJFywsj2eFR+Gj7vHCUgKPL
	qDn2bLtKE91mQVqngwzQBVdHcuUV8FSxtr266cj+WNAI+iwHsUNmL1ua1PZSWbW26G
X-Received: by 2002:a05:600c:4444:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483c9c323d8mr157846385e9.34.1772403398069;
        Sun, 01 Mar 2026 14:16:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm6649234f8f.2.2026.03.01.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:16:37 -0800 (PST)
Date: Sun, 1 Mar 2026 22:16:36 +0000
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
Message-ID: <20260301221636.0efa722c@pumpkin>
In-Reply-To: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
	<CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_141640_580397_6F603F36 
X-CRM114-Status: GOOD (  12.33  )
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

I also added to compiler.h :

+/*
+ * Sometimes a #define needs to declare a variable that is scoped
+ * to the statement that follows without having mismatched {}.
+ *	with (int x = expression) {
+ *		statements
+ *	}
+ * is the same as:
+ *	{
+ *		int x = expression;
+ *		statements
+ *	}
+ * but lets it all be hidden from the call site, eg:
+ *	frobnicate(args) {
+ *		statements
+ *	} 
+ * Only a single variable can be defined, and_with() allows extra ones
+ * without adding an additional outer loop.
+ *
+ * The controlled scope can be terminated using break, continue or goto.
+ */
+#define with(declaration) \
+	for (bool _with_done = false; !_with_done; _with_done = true)	\
+		and_with (declaration)
+#define and_with(declaration) \
+	for (declaration; !_with_done; _with_done = true)
+

So that you get:
#define __scoped_user_access(mode, uptr, size, elbl)					\
	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl)) \
		and_with (CLASS(user_##mode##_access, scope)(_tmpptr))			\
		/* Force modified pointer usage within the scope */			\
		and_with (const auto uptr = _tmpptr)

The next patch did:
-		and_with (const typeof(uptr) uptr = _tmpptr)
+		__diag_push() __diag_ignore_all("-Wshadow", "uptr is readonly copy")	\
+		and_with (const typeof(uptr) uptr = _tmpptr)				\
+		__diag_pop()

I'll update (to use auto as above) and resend.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
