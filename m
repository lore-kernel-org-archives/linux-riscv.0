Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328D3C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 16:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0035E6044F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 16:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0035E6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afhsEAIiroLG3qFH+9qndqEeVDcqf5vB/ZNdQzeYrdU=; b=FeC+ncaQBaAmdX
	ikpLJnqnatP2hueDbh7naZ2EkGn9ocuR2ovBVfJkkkrEhGRZ5b9LEmEs0bhyGjUWURvCW/ay9QBc2
	hVb0A9NVcTaAZUIU+fC7zfr+L94/KOaNbGoQ+X5mu5y/2u1zcCmfv2ipR+BR8IdSmv6XQVamBRAtM
	qiIphtNFLU6siqex9A6TnwX4SILnLolySPTRP5iznEDtf8g+FtI/ASXraT+/9vkOSxmJ0XG0VKf8F
	/0rG/OdQXfSclRBzu9CTIgvgnHP8Yk/YSF6Irf37/T2U0ix5iCS4bsKzbHlhpbwwg6/jhWd7HBig8
	NGurAgB8PfnOpTaLfWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQB1c-006Py8-0T; Tue, 14 Sep 2021 16:11:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQB1M-006Psa-I0; Tue, 14 Sep 2021 16:10:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F174610FB;
 Tue, 14 Sep 2021 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631635856;
 bh=EG2I9oaRHQ+gf10Ljpq+PHD1qpxygSWw9ESK9c5OiTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XIrYfLC8M1u8fqmn+EkYBkKiqzSzTO7EhMYSXJH82xQ02ADEiaOMHnSEH2Bp37Gn4
 I6kpkmbkiRSWbZdGan1zl7NTN4LATYpvHs2kJk2GQUUYoIK/WUeFC6wM3mJzLiP/N3
 P2AGwpufRp4H/QVU193YwkV5PYWtJlzAuyH6G2WI2MWMCbDJutN3zhL4XsJFWgGW8e
 OPp9tDBi88cUWRPe7QUbUd6MSCWw+Jylu/H4lSxC95EbbqJSS2JWs6+cuuBwyVM0Lf
 aPdzd6vCFX6OAHlkXWtXZNknZNNYDSO9RtCzqL//TbOcBAH5mYbJcxImTfKKTkl3yv
 bxJCfoHGV0FQg==
Received: by mail-yb1-f174.google.com with SMTP id r4so29441615ybp.4;
 Tue, 14 Sep 2021 09:10:56 -0700 (PDT)
X-Gm-Message-State: AOAM533RumpLC3XV9N3JqRyI26QB3gcnn6xDwBmskceWkp6yvi3uTEuZ
 57TM7YCj+CiS6oPnS0ho1/cjxPkX79sKfkvsj50=
X-Google-Smtp-Source: ABdhPJy/NGgZ1IROAgHU5psXnjNt0DbcmbCt3vJiiC8iJFGuRSAXr6SftyZ8/TdDx/41hvt3tr6orITFhHtqOeCjlZU=
X-Received: by 2002:a9d:200b:: with SMTP id n11mr15316897ota.30.1631635845243; 
 Tue, 14 Sep 2021 09:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
 <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
 <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
In-Reply-To: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 18:10:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHKn+RLQf1Nc_7Vs1qVoFZd6RL4=WX8AwoLst18i7n+LA@mail.gmail.com>
Message-ID: <CAMj1kXHKn+RLQf1Nc_7Vs1qVoFZd6RL4=WX8AwoLst18i7n+LA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Linus Torvalds <torvalds@linux-foundation.org>
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
X-CRM114-CacheID: sfid-20210914_091056_645698_A25B5AB8 
X-CRM114-Status: GOOD (  13.81  )
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

On Tue, 14 Sept 2021 at 17:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 8:53 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > task_cpu() takes a 'const struct task_struct *', whereas
> > task_thread_info() takes a 'struct task_struct *'.
>
> Oh, annoying, but that's easily fixed. Just make that
>
>    static inline struct thread_info *task_thread_info(struct
> task_struct *task) ..
>
> be a simple
>
>   #define task_thread_info(tsk) (&(tsk)->thread_info)
>
> instead. That actually then matches the !THREAD_INFO_IN_TASK case anyway.
>
> Make the commit comment be about how that fixes the type problem.
>
> Because while in many cases inline functions are superior to macros,
> it clearly isn't the case in this case.
>

Works for me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
