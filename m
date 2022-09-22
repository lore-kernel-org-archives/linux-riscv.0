Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F9C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CAyjJghQ4Fb509JVAHCP/HEYcnp+fzUbHEYxoxrctw=; b=kVQpIU6XkrlegN
	mkiTmV9fFBVZOMcYmzo5KfvquvOunGUajPCDSpRAUREzfsa3QqTfGvKVkq0oTpbkeEiwYiYX+ISGA
	f6e2qb00styxX8BVt0pgFm/NLpTB2QVdY7x+FoAOJMlnAoSKIZCk9E065mRDNz/eivKgqFwb2lrHH
	8BoaFUR30Tirw37hf2mhGI/Z2f/E2aw3XjbLmNrrGuD+gIBMAudBvj9CkYznH0zZ37Ji5uxFZzip1
	BGxuMgaEUksnjAGsJmHTDSpujuC+H8qTiQiV6Y+4KSiIwr4ORAKKelRVb7dEE8vz2+RLOqjFJKix9
	F+WuN+4Al4SBK0xZ1rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKAj-00F6lp-OT; Thu, 22 Sep 2022 11:15:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKAg-00F6i7-OQ
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 11:15:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DCC88B835DE;
	Thu, 22 Sep 2022 11:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DB1C4347C;
	Thu, 22 Sep 2022 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663845305;
	bh=HJLF0sxaaK0zibNfx1kSIE8o0oMxLWdBFj2lY98C4Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meHPgX7O07DcuZq2IoD9HWIbHP7eoS5UilZv6q9TrjGj1n19t3QGF1ETE3tU1X1/A
	 m4YpNcgt4ydOBvSoaHoFAWTSFN09F5NpXe1V9W+noau3MsiJJcutaXiIcWy/YZsbSn
	 UnREWAMsskqMqYNyVlpxpyx8JKCshTQpXl9uXIII=
Date: Thu, 22 Sep 2022 13:15:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Gow <davidgow@google.com>
Cc: cgel.zte@gmail.com, Brendan Higgins <brendan.higgins@linux.dev>,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Latypov <dlatypov@google.com>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	KUnit Development <kunit-dev@googlegroups.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] kunit: tool: use absolute path for wget
Message-ID: <YyxDtgfeFt4QYVNN@kroah.com>
References: <20220922083610.235936-1-xu.panda@zte.com.cn>
 <CABVgOSkjmuWDVwOW5PQRAtDYJGjHjcc_8Gg4JjhiT41Kez1rcw@mail.gmail.com>
 <Yyw24J7YFVtxsnJ7@kroah.com>
 <CABVgOSmDn8aVz=LEE6HnLTH8FJ0Civ7gsqejVfhnizFiAWF6jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSmDn8aVz=LEE6HnLTH8FJ0Civ7gsqejVfhnizFiAWF6jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_041510_967912_848C6D27 
X-CRM114-Status: GOOD (  21.30  )
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

On Thu, Sep 22, 2022 at 06:50:59PM +0800, David Gow wrote:
> On Thu, Sep 22, 2022 at 6:20 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Sep 22, 2022 at 06:09:28PM +0800, David Gow wrote:
> > > On Thu, Sep 22, 2022 at 4:36 PM <cgel.zte@gmail.com> wrote:
> > > >
> > > > From: Xu Panda <xu.panda@zte.com.cn>
> > > >
> > > > Not using absolute path when invoking wget can lead to serious
> > > > security issues.
> > > >
> > > > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > > > Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> > > > ---
> > >
> > > This seems mostly okay to me -- we'd be abandoning people who have
> > > wget in an unusual location, but I don't think there are many people
> > > who want to run KUnit under RISC-V, have wget in a non-standard
> > > location, and can't acquire the bios file themselves.
> > >
> > > So this is:
> > > Reviewed-by: David Gow <davidgow@google.com>
> >
> > Please no, at this point in time, submissions from this gmail "alias"
> > are going to have to be rejected from the kernel.
> >
> 
> Good to know, thanks.
> 
> This isn't queued anyway, as I think that getting rid of the code to
> download the BIOS (and instead relying on the user's distro to provide
> it) is probably a better solution.s

That's a much better solution, we have authenticated firmware download
paths for BIOS images on Linux now integrated into distros.  Let's use
that infrastructure that is set up for that for this type of thing.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
