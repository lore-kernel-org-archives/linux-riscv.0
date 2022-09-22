Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C194AC6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knGzUZ3LgFwfuj7Gjba/Gj1P3uJ7MtL4AEpHVzKmnuM=; b=1xvhjWAEerS8MW
	Q0fbwP8WgAs0qdWqcEN5y9SXK+z1D6NSyrOwlUF1rvt/NhgM6ayPjXZmIyXQO6Iq/kaHcl4e7f8Y3
	HMgS7scGaMHY24Yn7Vv4qa2EpvlxQOc0+DhS0K/k01uqVPnphHifbwmDOtSAJ3bt6zrCevYXsYP1v
	Vm1y1R600gvR34V9MxAQpqugnnuBV+PZmUnQLlWGNapC3SNK/RRlNzva2L9S7wpqPlz03e7E3gaYw
	mdqELyIYeiPYY7wmA4ABke7laJW5nVLtZXkM5GLdMkpHC5QUY4KnmxC0DfYnXjWQ11+jrqMMN0BZU
	pyrbtPqKnBiZcxSaOibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJK9-00EuP4-9c; Thu, 22 Sep 2022 10:20:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJJl-00EuKw-4H
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 10:20:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7443962A03;
	Thu, 22 Sep 2022 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480A8C433C1;
	Thu, 22 Sep 2022 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663842026;
	bh=Tc3FJ+kvPCra3uvSRT0MqM78GUuFNuRgTyRBDiLAt2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC19bm7yDjv6Fv4q7W2qd50dSl5fONXIiqQ7aLs5DKICZZL/WOedMxdWyY4QdNKA6
	 edSWtEYH63uYGoX2MqtJroCZ96MfTte2rEwLJ21lVT6PvBqAIBc+kpTUBQV457oMMK
	 ufpc07/tEAsgyMGHiuNbe5VjMb8Zfx00XxDnuZXc=
Date: Thu, 22 Sep 2022 12:20:16 +0200
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
Message-ID: <Yyw24J7YFVtxsnJ7@kroah.com>
References: <20220922083610.235936-1-xu.panda@zte.com.cn>
 <CABVgOSkjmuWDVwOW5PQRAtDYJGjHjcc_8Gg4JjhiT41Kez1rcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSkjmuWDVwOW5PQRAtDYJGjHjcc_8Gg4JjhiT41Kez1rcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_032032_605973_61D9283E 
X-CRM114-Status: GOOD (  14.67  )
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

On Thu, Sep 22, 2022 at 06:09:28PM +0800, David Gow wrote:
> On Thu, Sep 22, 2022 at 4:36 PM <cgel.zte@gmail.com> wrote:
> >
> > From: Xu Panda <xu.panda@zte.com.cn>
> >
> > Not using absolute path when invoking wget can lead to serious
> > security issues.
> >
> > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> > ---
> 
> This seems mostly okay to me -- we'd be abandoning people who have
> wget in an unusual location, but I don't think there are many people
> who want to run KUnit under RISC-V, have wget in a non-standard
> location, and can't acquire the bios file themselves.
> 
> So this is:
> Reviewed-by: David Gow <davidgow@google.com>

Please no, at this point in time, submissions from this gmail "alias"
are going to have to be rejected from the kernel.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
