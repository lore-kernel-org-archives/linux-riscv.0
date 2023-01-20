Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B2C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kvkJPt60NWI32NmO+ghEMVbiudHBY9BZDD/b9yWvRk=; b=X212Lk86zk0Na2
	J6CS0HnhsgRzVguIU7Hc/dtQw9PIjFbwiLnX89/zz6PX4bKoKfEUe81N1DtZTMu7JruVf50ykwY08
	dfekF4mHzapDBSvjz6UNr8Pqmd29hoSIirvoG8wAS8oVkrLho6N7gUUiDvEnZLKpisJjg1rX7hXyB
	Hm/fTmkJEq3O4nVk6CZFkx5eF2tAYaGjy4l05+EiH+59l4VXH69pvZnYpLAZMF69I3s5F3vgzNxnD
	OvxDxFmRmcpM1x4NYAvnZXfLkZajNfyGmiehfPpqLE9YYAfw7kvOuATUrXfum2v4xQqTTbQ+poRVv
	FDdn8p5SbTv6ZFd5btVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqiX-00AIiH-NV; Fri, 20 Jan 2023 12:42:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqiK-00AIe6-4Q; Fri, 20 Jan 2023 12:41:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53DF861F4F;
	Fri, 20 Jan 2023 12:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FEC433EF;
	Fri, 20 Jan 2023 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674218505;
	bh=4eup2D5AsPqtmkhyvi3CB8jmNf1A4h8nb+DrUC2ehis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbB9j4tp8Y+ZtYEizb4Y448VQ+0IyXfSHJ1KWpawb1lMvFYHdB839ydE8FBBL88Sy
	 xDgp6lZPjAKV/hVfw62sSy4Ht7qEzgBONplsX+pEUw4fxsD3DUW1o7fGB+XOpE10xM
	 WGG9VyZj/No5Un0towkPENbBBjqGX1aYTfIIrakA=
Date: Fri, 20 Jan 2023 13:41:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org,
	Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [GIT PULL]  cacheinfo/arch_topology: Updates for v6.3
Message-ID: <Y8qL/INFI4CdV+rR@kroah.com>
References: <20230120121856.1407369-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230120121856.1407369-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_044148_294679_E59D4ABA 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, Jan 20, 2023 at 12:18:56PM +0000, Sudeep Holla wrote:
> Hi Greg,
> 
> Please pull !
> 
> It has been tested on RISC-V which is the main users outside of arm64.
> The ACPI the RISC-V parts are acked-by the respective maintainers. All
> the changes are in the -next for sometime and no issues reported at this
> time.
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/archtopo-cacheinfo-updates-6.3

Pulled and pushed out, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
