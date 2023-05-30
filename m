Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A6C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCTw5+XgZyJntrrNgvbt4WpGQhjMkRbZQnkxfuA2FiQ=; b=Kz1d9dJoDe9tuPxrf/qrLiInuF
	9OcO8v3qDTYh+mMjwS1vQiNhT0O02/KVncNahyh02U43vz9lYe+63z0afN7g3ASIOPl3yYbw7p7Hi
	QP6fe0eGlEWMxh5xA00frHkURGSzk28RMTamWRnFwqXUIYl6baGL4tiGDF1epwN1EMTlpvLXGtPao
	GFtYUXtJtcfqZc7FvphDA8jK5GJnuW4Uber8y3/R8yh6CaUgsycasxcVR34BRFNurGzJOwkb7sAzW
	uzOYFlQxQChLnN4J37n37vxe9q4BhLw6cOsfc/OxW0MtV04uUkuztbaqyCSdFk/JpAFPgbrddAhjZ
	Kj2s1L+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wG1-00DJC9-1o;
	Tue, 30 May 2023 10:07:13 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wFx-00DJ9K-2L
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:07:12 +0000
X-QQ-mid: bizesmtp74t1685441190tx4kv20c
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 18:06:29 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: TD6ADCIf0ML9HinHlDnN+wla+kJWeZiGgZXr7K2zL1s+nKaOjUA+mLu8YWevX
	oW+nIp2Or4iBsUmPqG7UbsXqjnN59kMfBy/O/soeeQv8ZdG6d7AWZlXI4U9MstgaW6RmWTj
	HHEJ8Nmu//iopS7nsTw1beCT2vKbo+UexM7RlCEJZXqwvD1pkkOc0etvW1d4cp5CcHuhOPo
	Xif25nTUaIoO3vQ4jkxPDd333CKNmvkc0nDnMYi0bCqRccmWO8JBJsesQFQm/x/zXpUrGLB
	AIEpyZg5TvS41A649x+/rQqimoGrJRW1Kpvcq0miBukKflxOoJ+EmNz31uPMoHtz66KEDKR
	ZlOCHkQTOgk+c772gubkRsWJFdCT5BYY9Efob4TV/Btb5oQc0SW4ldnw3NHQYbn6zbMTQ+M
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7193763827501342085
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Date: Tue, 30 May 2023 18:06:29 +0800
Message-Id: <20230530100629.383892-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529113143.GB2762@1wt.eu>
References: <20230529113143.GB2762@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_030710_068341_DBEC21BD 
X-CRM114-Status: GOOD (  25.71  )
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
Content-Type: multipart/mixed; boundary="===============5229378526307873734=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5229378526307873734==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Thomas, Willy

> Hi Thomas,
> 
> On Mon, May 29, 2023 at 10:45:40AM +0200, Thomas Weißschuh wrote:
> > <lots of implementation>
> > 
> > > usage:
> > > 
> > >     $ gcc -o nolibc-test tools/testing/selftests/nolibc/nolibc-test.c
> > >     $ ./nolibc-test
> > >     ...
> > >     35 gettimeofday_tz = 0                                           [OK]
> > >     36 gettimeofday_tv_tz = 0                                        [OK]
> > >     37 gettimeofday_bad1 = -1                                       [FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
> > >     38 gettimeofday_bad2 = -1                                       [FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
> > >     39 getpagesize = 0                                               [OK]
> > >     40 ioctl_tiocinq = 0                                             [OK]
> > >     41 ioctl_tiocinq = 0                                             [OK]
> > >     ...
> > > 
> > > It did work as expected, but for nolibc, we still need to add sigaction/siglongjump/sigsetjmp support.
> > > 
> > > Will send a patch based on Willy's latest branch, perhaps this may help us to
> > > verify the future sigaction/siglongjump/sigsetjmp for nolibc.
> > > 
> > > ref: https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/sigsetj.html
> > >      https://www.ibm.com/docs/en/zos/2.1.0?topic=functions-siglongjmp-restore-stack-environment-signal-mask
> > 
> > This seems very complicated for fairly limited gain to be honest.
> 
> I agree as well. I'm not denying the fact that one day we may want to
> support signal, longjmp and friends but I'm not convinced we want to
> go through that just to make a few uncertain tests succeed.
>

I agree too, I'm just interested in whether it is able to restore the
whole test after a user-space invalid memory access ;-) 

> > If we really want to keep the current testcase we could also ensure that
> > the pointer does not fall into the first page, as the first page is not
> > mapped under Linux:
> > 
> > 0 <= addr < PAGE_SIZE
> > 
> > Or instead of PAGE_SIZE just hardcode 4096, as that should be the
> > minimum size and and does not require a lookup.
> 
> I would not even do that. It brings nothing to the application layer and
> inflates the code. I'd rather just get rid of the EFAULT test cases that
> rely on an unreliable syscall (i.e. one that may either be a real syscall
> or an emulated one). The value brought by these tests is extremely low
> and they were implemented only because they were easy to do. If they're
> causing pain, let's just drop them.

Thanks, one of the sent v2 patches has dropped both of them.

yesterday, based on the demo code pasted in this email thread, I went
further to implement a cleaner user-space 'efault' handler, with this
handler, it is able to continue next test, and without this handler,
just skip the test, so, it can be used to add future test cases for
sigaction/sigsetjmp/siglongjmp.

besides, a multiple 'run' support is added too, will share the new code
as a new standalone patchset later but I'm not expecting it is
mergeable.

Thanks,
Zhangjin

> 
> Willy


--===============5229378526307873734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5229378526307873734==--
