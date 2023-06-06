Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B81C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvEsyL9/ZUORwKp+JrahDp5OS16O3ilSH11J/HfNp9s=; b=KFo3v6PlnMTWv8
	2uJ5XRTjst9hBw7huXxToQSyw5egcMwtBXNebo6ZdpkvJYClBAy4QzEiHo4VuB8uWB2OoqeT3Tk3R
	G3z2arfksSKgFtI4JZRbcp1ZmkQc8fWhg9jd6L/PsDSDlgUDu7j7nJXwiLoI35rAFgyogG6pCvl3S
	lr8j4ytfDyPwmmy0cdfkHutNmm1cP/lUMZJhvDW2cYUxBf1yiiULSS+7bJJ85rmQIF0u7nOcLHgQb
	3djmrE1SFS8LbSbMARmM87RsBNETfkFGUfM0Sur38sGsy867aidyMKRHRAuwgVIwgf0+3Acu2doxm
	IaN9j3gQeSFvqV5Av3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NwW-00054U-2o;
	Tue, 06 Jun 2023 04:05:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NwS-000532-1u
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 04:05:12 +0000
X-QQ-mid: bizesmtp90t1686024291togh83dg
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 12:04:50 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: BycE0arnt6Q+DiGmOoSjcqC6z29sE59MRf7cHm6kMbAvZqUe1qyvJ3e45WXlj
	4yYXcpXQWfFuthg9ilKta6hbzXqhvHEPFAA8dW+tNBRbZdY7y2g/sWo6j8StjMP5pNr47Wc
	0JrnssV0uWtql1ohfnWDQ6FgHT6OeKFLfJdpVI5E9zMfbZhMMavkU9fUr1vQsXgEVVNh753
	7f8Sn2ALmSu05e7H6+ENvQ/9eUcCNp4Ka36Zsj7OxLI18N6d1Ygp7hqWLm8aoSkrBaPrblS
	nkFPdhZcgBndjhG+L9v3dBEO6hf1bFtGObDUoTIuzojp3p0rPCJ+fSlVTuju4h6mfnWujez
	L7IPplN+Tt/SE1/064NwW51Hvj72g==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13643759654165346408
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH 0/4] selftests/nolibc: add user-space 'efault' handler
Date: Tue,  6 Jun 2023 12:04:50 +0800
Message-Id: <20230606040450.353900-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c6129c15-7e95-4f6c-b4db-c6b5daa6d3cc@t-8ch.de>
References: <c6129c15-7e95-4f6c-b4db-c6b5daa6d3cc@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_210508_944144_042575D8 
X-CRM114-Status: GOOD (  14.16  )
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

> On 2023-06-04 13:05:18+0200, Willy Tarreau wrote:
> > Hi Zhangjin,
> > 
> > On Tue, May 30, 2023 at 06:47:38PM +0800, Zhangjin Wu wrote:
> > > Hi, Willy, Thomas
> > > 
> > 
> > Just let us know if you think that's something you could be interested
> > in exploring. There might be differences between architectures, I have
> > not checked.
> 
> If the goal is to handle hard errors like segfaults more gracefully,
> would it not be easier to run each testcase in a subprocess?
> 
> Then we can just check if the child exited successfully.
>

Yeah, it is easier, it may be possible to simply pass the test case to
something like test_fork() and let the child to run it there.

I will take a try, thanks very much.

> It should also be completely architecture agnostic.

It is for we can reuse the test_fork() stuff.

Best regards,
Zhangjin

> 
> Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
