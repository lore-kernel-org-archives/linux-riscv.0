Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9129C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV1JSS8mMdKHtcQhYuDh1mE6N49Ts+/BGZ76vENlM/M=; b=sKjxz1L+AZnlHd
	kCcaZ0m42MS1JPTcSE7ArpdbuOpbNHhocrmjSlC02xqCYK80nxEjCrVM8xZ10zd0KkvruwbAJNiRA
	EGT12+3Fcw2hET488SYoARCXJX0o69fPbIQO0vE8NTqKFTJtrDj04zrrUSBF+WORiw1K5yqqznWj5
	FjrPGLns+R3DXksU53DroVG5JPFQw0rN4XpLtm6h6glBas1L+A8mdDNCW5NBsyjpagSWrTeYZLdbI
	TCqTXq4ILyie8CVsAEXbn2uufCMQTwnEamJeOy0UlwEnKqAFCj7PsFKu7smrNiBN+3q/lcdIrj31W
	ZTf93ub034PJJHgNiqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7aF-005U5G-16;
	Wed, 19 Apr 2023 13:10:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7aB-005U3J-1I;
	Wed, 19 Apr 2023 13:10:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BDC2613E9;
	Wed, 19 Apr 2023 13:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A4C433D2;
	Wed, 19 Apr 2023 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681909845;
	bh=k4YCObGJ+C+Vyl3QuUc3sk/QjpCB5IvZqqIEZKCTk50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBSZOADtYp9S+zb5r0V8tgRyWQWdNAEGnt3eGx5es+PWCZRcEH9RKNt4C+CjmW4Mi
	 b69ixsv6Hyp7CibfrWdxo/pw7lcO4pxbqAXqC15B0aE8XPegB11eNIAXLyaFqUa0+f
	 gs/rr8qZuhK3E++mSDjxjVp60HG/QiWT2ykV29Ww=
Date: Wed, 19 Apr 2023 15:10:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Pierre Gondois <pierre.gondois@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org, Radu Rendec <rrendec@redhat.com>
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v6.4
Message-ID: <2023041935-undrilled-french-b251@gregkh>
References: <20230417181540.1926349-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417181540.1926349-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_061047_474772_913C82E4 
X-CRM114-Status: GOOD (  13.21  )
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

On Mon, Apr 17, 2023 at 07:15:40PM +0100, Sudeep Holla wrote:
> Hi Greg,
> 
> Couple of the patches are fixes but I wanted them to be in the next for some
> time to get better testing. Few others are addressing issues in RT kernel.
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/cacheinfo-updates-6.4

Pulled and pushed out, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
