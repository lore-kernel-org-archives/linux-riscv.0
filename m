Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846E1C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 545D260F8F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 545D260F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZweGjcpsB7yE5fZVAcFcEP1ZihbKFi+d6s1gC8NlJPU=; b=GQaII6uNgFcuXP
	8tQiSFnLu7OI03rhq0hzjKsV6xTO1ndS4ZbR8FDagLvHAoR0sQ+yHA0gbi4DZf41CfgJcNMf1gDQT
	6Xp1mOMe+qY4GtjFepZJga1ZWtSGTNJSmmYTPaRaYix+1exp1GHBr5+ukp3IZ1Aenk8Newme1X1pm
	XopaGCidVg14WtKgb24XmY8i1gW3CvNzMv/67GiSuUsiOp/I1jYEmOCLvyac+wy729lzkJJbsd7db
	leXpgPl0wMIbinE35JUJ9ViEkaOKUH71YoqNxWHN0NSbYZ8kfQWMMBxipX/rtA1Uvh0NF4TewnlW0
	pkyY2eei7aj50ACZX6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAqJ-006LC5-AW; Tue, 14 Sep 2021 15:59:31 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAqF-006L90-VW
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 15:59:29 +0000
Received: by mail-lj1-x233.google.com with SMTP id q21so24846654ljj.6
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpWi4volfcYSm2oFWphGxI70Xoc4gQDszmXfggbAPag=;
 b=bXLrDvRwiE9LUrsUdTaOb8qv3MpstEI39Z126QnyB2PTkNIRA+z5Ylw/tbECp2MHmV
 gX1JHV2JOFK1e1MJCTTlwV1kibUe3fFGD3LyBUKt18UoGfT0okDbQ+10t1fJme/j5P5U
 D2vgNrnv1RgcRafeCGUDJ8RsTcI/ITO4E3K7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpWi4volfcYSm2oFWphGxI70Xoc4gQDszmXfggbAPag=;
 b=2eNvD+BzWcaRQgdlkJKtskOJOfshVvgg0d6qfbq3UrmDXCKV4iL0SXTjzpU06X4J+w
 L1lVDlKBHH3SDefI8+bSQHnTe5YMd8qc9PePUB55YON2Wf/+eeSCfwaqYsJv0Yti9rin
 saSfwU3EGm7OSLbPT4WJDIqGtqBZDWZj11cVhvv9io3SPZ+PyaocvbDzRC8W7YxyrQ27
 PltzT8P1R1Oi6VNdafKrq3x5XNZ2NCVuGg6YGeWyP0rJjBoM7dWrv78cGroPbpSyE2O/
 CAZw1CLX9dYaYoGuLo59dFnw7R1wkiJKtm8Gp9nCWSGLz7ZYRPqLanUT0uiyGnoIv5Rz
 4d+w==
X-Gm-Message-State: AOAM532buXM3QMJ7rLCQgp2qz/0QHLl+lC4ehGWv5uTKbYzyO9PD2fFy
 Z08oCcUh5/FucoOYW6gknN4dD1kcc1Bxxabr9FQ=
X-Google-Smtp-Source: ABdhPJxFlj4qnulO+ClZ6ltYPyuY8iKH3RwLNioNyJrttdISzn/dim311l9GZJIOVD37NNMk9nYfSg==
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr15704130ljp.494.1631635165534; 
 Tue, 14 Sep 2021 08:59:25 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id s10sm968988lfc.28.2021.09.14.08.59.24
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:59:25 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id k4so29882873lfj.7
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:59:24 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr16501365ljg.68.1631635154125; 
 Tue, 14 Sep 2021 08:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
 <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:58:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
Message-ID: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_085928_050143_14445DC6 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, Sep 14, 2021 at 8:53 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> task_cpu() takes a 'const struct task_struct *', whereas
> task_thread_info() takes a 'struct task_struct *'.

Oh, annoying, but that's easily fixed. Just make that

   static inline struct thread_info *task_thread_info(struct
task_struct *task) ..

be a simple

  #define task_thread_info(tsk) (&(tsk)->thread_info)

instead. That actually then matches the !THREAD_INFO_IN_TASK case anyway.

Make the commit comment be about how that fixes the type problem.

Because while in many cases inline functions are superior to macros,
it clearly isn't the case in this case.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
