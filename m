Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B306C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRW1q5LASPmwKyoy/3aTuxaYgMyhhc+B1+EqLTxUOmQ=; b=zEEIUlA0VcyrJ0
	qDBIdpdhrMY1KDJSYm8iedGUouCHi94PiP+y3EblYvQLgpT4R2TycLQntL+1LlzJWjqsb1i7V10nr
	hfQyq756s6crF+eicr1Wqxwn2e2ScdhSgWnSgti7SmGMw+PnzFV1RbXqjHBe0CyLguRmYhtykULPx
	XZzyqUD6Sgfz7CxlHDnR7kefYqrNCeEBvIKWhHU0A5ZnrqldH1KhVxXTJWfVqCnprjUXRbexkiRFe
	itfEKfKYeDiB/LqX9MuBkfJdDfgsLBO0zsa6qaStoWtnMJSd19dqDHJAzC7QiiWTJqMv0Lo9SuUaD
	xbWg/OTE0qcp8jI5B7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xMk-00DbeT-1v;
	Tue, 30 May 2023 11:18:14 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xMe-00DbcR-2N
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:18:13 +0000
X-QQ-mid: bizesmtp69t1685445474t3vd91jk
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 19:17:53 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: rZJGTgY0+YO42EliYbWrQYWGNgKZOfXEKsGvnSlMHd2cAkAzcp4YFeJPsIZBU
	71DWcf1qi8lHwUTiAzzmiaNRz90Js9jdIUW2B36Eoq42HFPUGr061h7dPSa+Jl7S56WJdAH
	+z4B/uI2ZzRfOD16kuuVqj0hsqe82IGm+RrDlxmqkxMqUtRAZ2Cbp/IgyzkvrG4n2aw/Le3
	F/zy85a1qsGhtmxmqSCkR5aWR2nXWH4DRT88MmhT3Pwe/VF2JhpUn/j0g7GEbggdo5ufWbo
	FwPrxKcuWH1rBNaxmX2viRu9MHD4VmpLcXj+KoSXXr/qbcy8fOopse8ujCD1ZwHAXE2QIhe
	DHVkHCdyiGc3EwBTeV3H+8BAaIoCsjGYcaqBvlxYjP2WxvTnBnSIBL00YHNrJ6KjLEJSytk
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1363702751823665213
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH 2/2] selftests/nolibc: add sizeof test for the new 64bit data types
Date: Tue, 30 May 2023 19:17:53 +0800
Message-Id: <20230530111753.403722-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c68a6f60-0906-408a-9454-419085df695e@t-8ch.de>
References: <c68a6f60-0906-408a-9454-419085df695e@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_041809_074774_BAD8B418 
X-CRM114-Status: GOOD (  14.17  )
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

> On 2023-05-30 14:42:56+0800, Zhangjin Wu wrote:
> > These test cases are required to make sure the new added data types are
> > really 64bit based.
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > index 20d184da9a2b..43ce4d34b596 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > @@ -721,6 +721,14 @@ int run_stdlib(int min, int max)
> >  #else
> >  # warning "__SIZEOF_LONG__ is undefined"
> >  #endif /* __SIZEOF_LONG__ */
> > +		CASE_TEST(sizeof_time_t);           EXPECT_EQ(1, 8,                sizeof(time_t)); break;
> > +		CASE_TEST(sizeof_timespec);         EXPECT_EQ(1, 16,               sizeof(struct timespec)); break;
> > +#ifdef NOLIBC
> > +		CASE_TEST(sizeof_itimerspec);       EXPECT_EQ(1, 32,               sizeof(struct itimerspec)); break;
> > +#endif
> > +		CASE_TEST(sizeof_timeval);          EXPECT_EQ(1, 16,               sizeof(struct timeval)); break;
> > +		CASE_TEST(sizeof_itimerval);        EXPECT_EQ(1, 32,               sizeof(struct itimerval)); break;
> > +		CASE_TEST(sizeof_off_t);            EXPECT_EQ(1, 8,                sizeof(off_t)); break;
> 
> These will break on 32bit glibc configurations.
> (At least on x86)

Yes, I added a big #ifdef at first, but narrowed it down after a default
x86_64 gcc+glibc test, 32bit has been ignored from my mind ;-(

Will add the big #ifdef back.

Thanks,
Zhangjin

> 
> >  		case __LINE__:
> >  			return ret; /* must be last */
> >  		/* note: do not set any defaults so as to permit holes above */
> > -- 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
