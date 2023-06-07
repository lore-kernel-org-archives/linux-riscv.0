Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75103C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vORVYI/iKEbH7bReeA/3pmcprKQJ+SZEzLo/hqN/YmQ=; b=VWn/LKFFsc/lm0
	MC2QA18xw+bbszvVYnWZBbXRC2wL0yKdHj7/fLxq4ZfI+TPhsJfZ+TBH/BBvCZqXQzuP2GaPIzjrC
	3ycQ3Wknk+XLDn7zPQePfxt3s7usX4rkRYsVTuvg1ALgB5IgOGX9w7iY+flOWjwmbRBGAwckosag3
	HpPya7BKAluJKqrwZSdxud/VNdygQOgR/K5fc/m5Tp9zxHnk8nWpKVAips/R7F2c7x6DAo669pMPN
	jrFqq7ZTYyNOa7bZcMCdy8yiNW3YEJnA3+2afT6QUmtyZg6InHS4Fo28Lx25HW/iElh2wR2+ee/5A
	dAWxyeKmHWF76Wot5Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mom-004aiQ-0Y;
	Wed, 07 Jun 2023 06:38:52 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6moj-004agU-2j
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 06:38:51 +0000
X-QQ-mid: bizesmtp83t1686119915tg8q219l
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 14:38:34 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: iDzLjIm7mlarxQ37HSKAlRkd6wcQobjGCjiAbDfTqoqi3jOnoDZE+XK6RTrbj
	ObGHhN42g8PUfzZBPuXUpkjvQbCXiokReJGKITQvmx9NFIHzBMiof7y51esDkWycvc0Wx6T
	qycIvqDxO8q+UvKHl1YuFjunWlujYL/1EGYBB3cE6/qAn+4KwLtPfgGfWyhhtxQBwIl4GHn
	0A9k2ZhUxjBZqf8/TVPgga22YCZ1oxV/4ZrFqA5N20iLvuZYloklbV6AJj8eOKQwFjlPoLf
	cadevjho7qWVHw12tmGvDk8YOw+IKwM7L3BNBvttDMrp2vf/W3SZjiUk+87UN4Lf2De2E/D
	/Nd+gcq5qKYyOF4d4ShWPYRcBSwdYGx0vzm1n80Iel2wuQJDeMQfVIQzQgofg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5675149324483682908
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Date: Wed,  7 Jun 2023 14:38:34 +0800
Message-Id: <20230607063834.671562-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <793fc122-1409-4092-b39c-ea348de8ba14@t-8ch.de>
References: <793fc122-1409-4092-b39c-ea348de8ba14@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_233850_206587_DC4BD28A 
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

> Hi Zhangjin,
> 
> On 2023-06-07 13:39:20+0800, Zhangjin Wu wrote:
> > 
> > As a summary, will use 'sysret()' and something like:
> > 
> >    static __attribute__((unused))
> >    int chdir(const char *path)
> >    {
> >    	return sysret(chdir(path));
> >    }
> > 
> > to renew the syscall helper patchset, Thanks you very much.
> 
> But please to use the "__" prefix.
> Otherwise it could conflict with user code.
>

Ok, not yet to modify the code, will reserve the '__sysret()' and convert the
left parts to this style: '__sysret(chdir(path))', a simple sed script may help
to do so.

Thanks a lot.
Zhangjin

> Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
