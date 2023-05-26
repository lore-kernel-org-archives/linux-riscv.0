Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FC8C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nu9AxGs131HfSrqBzEh/fFCSqM1/vHNpX9dJvsJv9aw=; b=KX3zkOlximA5KT
	MfA6jemcXV5DvYPvU1NCRFcHTxoM94lOX/D4FaQ6pEvWIP3inphP23I+oROrASG9QT52sFuO1IZNX
	5aeAAjBAog+FsDYUr8KTJACgZNphKXHt8btqH15pg+59MyeeoOOgQD1SxDOtYM5b+CtQ7qJXbIHzL
	TuOI6TNJY/ivKCGEpgPB11YyERTWJZQ218/2EQbCw7jNzMU1NSOEmDQKlYkJqz/4F97xIPsBxNIWF
	Zc/dfK3vODS3c7lZCs8tneZRZwfJYqE71R9crzy+bnSzA7w/7weZUIQSBCsOJA1xC+ZNPaXjVtpQB
	OTBeOtAo+2Zlhy2LzXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2UQb-001y5Q-0K;
	Fri, 26 May 2023 10:12:09 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2UQY-001y4Q-0U
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:12:07 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34QA6Oum011800;
	Fri, 26 May 2023 12:06:24 +0200
Date: Fri, 26 May 2023 12:06:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, thomas@t-8ch.de
Subject: Re: [PATCH 04/13] selftests/nolibc: syscall_args: use __NR_statx for
 rv32
Message-ID: <ZHCEoKXHSDlDvI5u@1wt.eu>
References: <cover.1684949267.git.falcon@tinylab.org>
 <b306ae7b53d67acad6d1e2f63d43505d79f81241.1684949267.git.falcon@tinylab.org>
 <ee8b1f02-ded1-488b-a3a5-68774f0349b5@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee8b1f02-ded1-488b-a3a5-68774f0349b5@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_031206_791650_8E83AB75 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Arnd,

On Fri, May 26, 2023 at 11:21:02AM +0200, Arnd Bergmann wrote:
> On Wed, May 24, 2023, at 19:48, Zhangjin Wu wrote:
> 
> > 
> > +static int test_syscall_args(void)
> > +{
> > +#ifdef __NR_fstat
> > +	return syscall(__NR_fstat, 0, NULL);
> > +#elif defined(__NR_statx)
> > +	return syscall(__NR_statx, 0, NULL, 0, 0, NULL);
> > +#else
> > +#error Neither __NR_fstat nor __NR_statx defined, cannot implement 
> > syscall_args test
> > +#endif
> > +}
> 
> Does this need to work on old kernels? My impression was that
> this is only intended to be used with the kernel that ships the
> copy, so you can just rely on statx to be defined and drop
> the old fallbacks (same as for pselect6_time64 as I commented).

Yes, as much as possible this is desirable because the purpose is
clearly to simplify the build of applications. The reason is that
some applications might want to run as well on older kernels, but
may miss some syscalls on the nolibc shipped with these older ones.
Since the project is quite young, it lags a lot behind what each
kernel supports, so it's expected that users will take the most
recent nolibc version to benefit from support of syscalls that were
already present in older ones.

The alternative would be to take the project out of the kernel as it
was before but this would likely complicate contributions.

However the selftest code is clearly specific to a kernel IMHO, since
its goal is to be used to check that the shipped version of nolibc works
on this kernel.

As such, my view on this is that as long as it doesn't require
unreasonable efforts to support older kernels for the userland code,
we should try. If sometimes it's a big pain, we should not insist too
much, but at least making sure that only the feature in question will
not work would be desirable.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
