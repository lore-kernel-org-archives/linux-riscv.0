Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5143C0015E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y64TVKZ0ScuBNjKTyYcNIhU45Sa+ObUhxC6Q1+0PHwA=; b=pTX63P9q1oAZQL
	6CDjb9b4cM7C02c3J/ujj4FPPbWV1dgAQB5uK91nacTv4eyDFwGctcZF00D02EJUgi3A6VGb9omPm
	XVpVKjAOKLbM1UsHdXqTCZDYaNzE5MhUFkn4HLqPsHWooHHdmS+YAna2TuQKcLbSu92tEZ6uUJP8i
	Ho6/8YfwBQHbsEhCm3B9ta514ENh1uHyTWTyDVDB11F1HqTq2ztPXlXYHrXuahiF5A9QMt5TvtjHX
	xq8E5xOYik4NQmR066ghVbluNAPLvZWiZvf3QGAzBNC5Vjf+zRXkvvvaUN0ECO13sKPP1ZhZDCgYk
	C+8uO3vhAEH/BYbCoydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDQJ-009VnJ-02;
	Mon, 03 Jul 2023 06:52:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDQF-009Vlj-2M
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 06:52:33 +0000
X-QQ-mid: bizesmtp66t1688367129tk205027
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 14:52:07 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: q+EIYT+FhZovwwQ9UtCz+ef53Vic49SM1+XSIjkCcfjVyWFrS101WFtxEKffb
	A3IUDUUOTFUS7K4LUBvprOtoQpRcC/msnLgZ2eMhYT598GJOpJchy834gX2GQV2NxcivxsA
	akniKYjig6hlzE5Z3hY5YC98sY+hUurws6OvbvfN6eawIq7IbYMcYJ/IY81vradFLc6bDg+
	2TpQEAu6Apeft6s8t+Ia2Qqz1sr/tqLz73zWOXS0ltgg/ksglkxbTBfpY0uEA46SSlLHGhX
	dk1B8FneAS9DC3fxhwFoGsd4Gs4qiPUAxZqdzinmL0aLPzpkvZGTxIvERfXrp00x2/3IWju
	RRc3uHso9snGMZAQKW+d1xR/rN73DJmjtnDtwjBaDs+c+v5cVg=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3575837727353389164
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v5 11/14] tools/nolibc: clean up mmap() support
Date: Mon,  3 Jul 2023 14:51:52 +0800
Message-Id: <20230703065152.488142-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230702192347.GJ16233@1wt.eu>
References: <20230702192347.GJ16233@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_235232_085566_54677511 
X-CRM114-Status: GOOD (  14.27  )
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

> On Wed, Jun 28, 2023 at 09:41:13PM +0800, Zhangjin Wu wrote:
> >  static __attribute__((unused))
> >  void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
> >  {
> > -	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
> > -
> > -	if ((unsigned long)ret >= -4095UL) {
> > -		SET_ERRNO(-(long)ret);
> > -		ret = MAP_FAILED;
> > -	}
> > -	return ret;
> > +	return (void *)__sysret((unsigned long)sys_mmap(addr, length, prot, flags, fd, offset));
> >  }
> 
> One point regarding this one. By doing so, we're hard-coding the fact
> that we consider that MAP_FAILED is always -1. I'm not necessarily
> against it, but this implication can be confusing for those searching
> where it's being set. I would suggest putting a comment before the
> mmap() function saying:
> 
>  /* Note that on Linux MAP_FAILED is -1 so we can use the generic __sysret()
>   * which returns -1 upon error and still satisfy user land that checks for
>   * MAP_FAILED.
>   */
> 
> Since it's an assumed choice that theoretically could affect portability,
> it should be reflected in the commit message as well (and we all know it
> does not have any impact).
>

Yeah, we do need such a comment and commit message note, thanks.

Best regards,
Zhangjin

> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
