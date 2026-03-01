Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14FAFD0077
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UV8zCE5VKPFdxBhrH1emFLJCbqyxKzQ+IiKoorDr9s=; b=LnfGHDlDLq2mb3
	GtWqxxrcqQG37s5pjjw3Bg9CvXiZ6BH9oReTqMjSOYkHo+/AvRxSlpdDRxCGVEMeQgx9x9xQcUVKa
	GQ9rzwK401Ys3IheeeiPcvtYjh3icON+DjppJEOKdnvGagi5/IbTSF3/qm363fJF8ZJ3FTAVpI7i3
	g5lazqrIs+2nVeOkCD1uTpCmFv090MdL9DSeWTuAGCapYXGVDaa1UpJDNN5uJGwuZoMQGHACrZJVU
	P1GYoz76IG9agMlG3SDdw1V1qpu6YhyuPJhm7kQPeqloC8zWira0v5pyYL05Tamitd6g2vL203LHz
	9KTcC57sA01+q8lw1KNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmyq-0000000BqbI-2SDF;
	Sun, 01 Mar 2026 20:01:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmyn-0000000BqaD-1mY2
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 20:01:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso6118964a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 01 Mar 2026 12:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772395286; x=1773000086; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=S5Ta2FUCkN69PCnggKf0kKQJu7tJS8wNkGMXAEbiGB+xhhcVJ/XQNIRxTk5lk4+yPy
         Kyy8q2ufXtgr5DsMEWFyYf8u/0rM2S9xaB1lmFo67KH9GyBio5TjIvPL3ulXD20o22mD
         Nl4UUMlE4Rv9zH9W/rPPPC3j6RGYXejzrp0NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772395286; x=1773000086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jB/XXPWSS4Vb7E8KI5vsQ0OyjX/VbHAJPkU3Kvm8KQ=;
        b=fbCVRndXzNgceUv0IwyB8WmPLoKKxAMLofv+Rhlr723Y72boE+O7NuUlAZiGPRLbmc
         KjF3RB7UvISGQvJQ0UzrWb3x3kRRlT5pwPuhWtVDcq9LAsAUJqTA/Ds4z/ZfyRFRfER2
         0e2eMKRBFviLXwta4J5p+afLMzlYJCS2ieFlQ6KqgoTD6boem84ZMGeMtwevcftqcVR9
         R95vVvfxvjOGRJ/yy4fcpl+aDmsv2Iwr894rrLe6vjz2x4UcLLwb73+7u4CoqFRW2GTU
         eEiMLoG4MmPp3YuYJtSSIboNciLIhPlQ7GtTCl4Vc7YmZ8wnqtww14+aNoVjjAxuPsB3
         q9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeJsKMbPuGE5Dzs+d2K1eol7CBMD78xXN95Hn92fM6zqAF3G5o5OD3/8UUsSkumVUBK4PabWBXEdIYGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8SByr+61X8LPU7+Rx4Bi1TXXJQ3DVLzBWSOk+IowpwK26glI2
	QBOLQie9RtsSP5oLqqaO6ZWn2uz9aUWHQoFtmvaeq6dAkfR9xtKN1GXhQ/fPyHj+60g2E5mDqFK
	vE6N7w3UvpQ==
X-Gm-Gg: ATEYQzxBn8Xm4INPXjHWnKvACpY02wS2ODQ6ZyVvqaAIJlbr3mqtswkd8o8dtC510wG
	wh6HCBEGfg9DDlWiaj+o3RxjxIJ13S3YxJT6XyiXEJqasSo4JUOrfPQBdSwn5iuVEo3bQUZwG3y
	QHXzjzmSbcTAKLzkWSq79sXj+e0/eGA8MZK6+QSaup1a2PY3N0V45DRBD0L6ycHy5+Acg1NVlzn
	x6mnkMCHsW3nL1eSu1MzYjN7mxKYMz+n4YhRaazGYJtDuOcCb0N5g9flCjJF7IBTyXgNJpkVYHT
	AMLh05mvHPUCVTIQSam2P/yCs/+aT4TckkF924Va5PD0yyV7p3nbOw5a/jcCjYUeJWux16TkEna
	UfS+/cBkLoCcg/txLSkPZEm+/KnCnZciPWAzbkMMUWkKI8YEEcNr4WMS1gqUnlBu1dAlMAKPi5f
	Grivghj2Zn//PJEKjWaJVu4IkYmvcEq6Bsr6C29mY8Ghj/QJe4KwqqyzE43xKedjDBmEWL6PsS
X-Received: by 2002:a17:907:2d94:b0:b83:1327:920d with SMTP id a640c23a62f3a-b9376180f34mr641728666b.0.1772395286427;
        Sun, 01 Mar 2026 12:01:26 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3c97sm385851066b.63.2026.03.01.12.01.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 12:01:25 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso6118939a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 01 Mar 2026 12:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYlwHr984wAWy1SsRJndn0wNlMhARhB3LhOFNvWJU+qb9/T49KQpvoONwwiTbfFs2Id9mwNxUnFw2mLw==@lists.infradead.org
X-Received: by 2002:a17:907:3f1d:b0:b93:5405:9260 with SMTP id
 a640c23a62f3a-b937c64ef77mr572433266b.30.1772395284743; Sun, 01 Mar 2026
 12:01:24 -0800 (PST)
MIME-Version: 1.0
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
In-Reply-To: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 12:01:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Gm-Features: AaiRm51s3eNxZj_25SK_rlwxCS0TV1EUyjNISFnudmurbAezRL6om8RwkB99_8Y
Message-ID: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const pointer
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_120130_224692_061889D3 
X-CRM114-Status: GOOD (  11.38  )
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

On Sun, 1 Mar 2026 at 11:34, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> -       for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> +       for (void __user *_tmpptr = (void __user *)                                     \
> +                                   __scoped_user_access_begin(mode, uptr, size, elbl); \

Why are you casting this return value? Wouldn't it be a lot better to
just make the types be the CORRECT ones?

I didn't test this, so maybe I'm missing something, but why isn't that
just doing

        for (auto _tmpptr = __scoped_user_access_begin(mode, uptr,
size, elbl);         \

instead? No cast, just a "use the right type automatically".

That macro actually does something similar just a few lines later, in
that the innermost loop uses

         for (const typeof(uptr) uptr = _tmpptr; !done; done = true)

which picks up the type automatically from the argument (and then it
uses the argument both for the type and name, which is horrendously
confusing, but that's a separate thing).

Does that simple "auto" approach break something else?

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
