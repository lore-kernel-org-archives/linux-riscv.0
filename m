Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D1CCA47B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrmhroIqC5/BO9i36/MCDxZ3pNOWiRut63YuF6uES9Y=; b=slkuLEhHfSTnQt
	Dd4ZDZ4jDYTQS6YFOiQgCFujuU5NtlvkswHQ6pj2hr38d1t4/sOOBZMM67CsEATlkoCb3n+reBI7w
	H8lwk7rJEV+bQojAQ/THUWJsHeIVcfMXvJIKjeZobSbBHqBAWnL5RudkB0qPwj+wBaWZRaHOaMQsJ
	vFir9kjbowXD9uL6Rs0MGbmaqhyY6QkKqmvClO5lCd9wpjj1v+RZxDQN1yWGEgiHoKZgyTI8bWihW
	7JneSlmLTURSrhTNaOS5bT5uWMxGCnuX0U3vHL13g2JFgkQXvmRszyD6cE4rBkeqqnwQ/V/EleeiF
	CzNvAXgzl3X1XWhfArgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oAf-003wyA-8S; Fri, 08 Jul 2022 13:37:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oAN-003wrW-FV; Fri, 08 Jul 2022 13:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB5EDB824C0;
	Fri,  8 Jul 2022 13:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4598DC341C0;
	Fri,  8 Jul 2022 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657287424;
	bh=OlZu7gVrofXn6LBnwtPOUaIyp47CqBBEG0OqSHQgl+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABzcsTwY5coKKCabZEAuxPv9yu/aB86eLqyGH8jheo28b7qaQaplgcm4znGQGKHAZ
	 2SjJpUrzuiYkyuulv5cSpzhB0trMeUiglI8wnNHsALxteIsi/cdDB43C6ocArUXM7s
	 uPpu21bSu6bI5G81bCKy7h2Lex6IUJt//8OsT770=
Date: Fri, 8 Jul 2022 15:36:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v5.20
Message-ID: <Ysgy0Fdww3dIe2zL@kroah.com>
References: <20220706124644.2276077-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706124644.2276077-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_063707_709746_D9BF7C96 
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

On Wed, Jul 06, 2022 at 01:46:44PM +0100, Sudeep Holla wrote:
> Hi Greg,
> 
> This is my first pull request to you, not sure if you are open to
> pull request or prefer pulling the patch series directly. I am fine
> either way. You can ignore this and pull the patches from[1] if you
> prefer.
> 
> Most of these changes are in -next for almost 2 weeks with small update
> to fix issue reported on RISC-V last week. The small changes in ACPI
> and arm64 are acked-by Rafael and Catalin.

This worked great, thanks!

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
