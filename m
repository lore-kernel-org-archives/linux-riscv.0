Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A831C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 16:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8IDVFdtTjvO+iDGpyqffj0JzE5ASVnlrknj3CrKmB0=; b=OVALSwbMjbz89+
	VcCp4eRa+xzQr1aW335Qo+LNmVrY9w8reydr8nWyjLQOSrhbOWUR4N3khsPHCjH0orJUjmYgQQm/o
	7gRStfvTJX7uAnuqcaBfryF4ME5EKuZWA4pco0rU1O5t7eKG+FR1vANeX0lA4Vnc80M6r6PSSJ0jz
	LIIk8fvucXmv71lwQZ3pm3sJaK8wIfNVfhhnzMLRMZMyIqxhL7wy/93G89B2JqlnpEsyVXA1zt3Wt
	QZftrsVwyHbrBl4KMGDusRpC/wAKR5QkY+zU027GH+r5VY06vnLR8zfydIpWyLY+3VjoDlfqAEMVt
	2bw/NdGNTrVjrOsYS0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onjdR-00AE17-Hd; Wed, 26 Oct 2022 16:52:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onjdP-00AE0G-2X
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 16:52:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71AF761FB9;
	Wed, 26 Oct 2022 16:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C790C433D6;
	Wed, 26 Oct 2022 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666803123;
	bh=28DDrSEJ5f+i4DOtzEKESJVKi7mor0LeaIw0+zUUyJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAXDYcLWZ9PW7EylF6jqjf+/xEb461VvPj7qt5XG8KA3kF8uVV+v4uvbtErJvLucX
	 1/Huq2ygJSMZgDJfjwrGQQSQKkSFk/1xmXBJw7TNJTmUDnAQk8gStYR9gRYh2B94xI
	 vJ0lbMWkCzUkqE8/wz2aoAHchcO1djhQpuSiT9k1W8+XmL9PbvweEx4SNEfcYFSRxc
	 8lKZpxMgKVMaCO7ghrBtNI6XEFWNVBX/eMjnFcNbz3AztwmIUJsAAZJmd0vmc3KrVZ
	 Vbnvg4p4xjSu6CWLJr21XQSaP29DCRtkYhNYUsB0JRZkTTwWfWpK1BuxpO64rGEJSO
	 1r1TuKf5bWDtA==
Date: Wed, 26 Oct 2022 17:52:00 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: RISC-V Patchwork
Message-ID: <Y1llsMww5DVy3Qot@spud>
References: <20221011160744.2167025-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221011160744.2167025-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_095207_215680_0E0DBD01 
X-CRM114-Status: GOOD (  22.59  )
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

On Tue, Oct 11, 2022 at 05:07:45PM +0100, Conor Dooley wrote:
> Hey,
> 
> As one or two people have already noticed, we've resurrected the
> patchwork for the RISC-V list @
> https://patchwork.kernel.org/project/linux-riscv/list/
> 
> The patchwork bot should let people know when their patches have been
> applied. Hopefully it'll help people track what the status of their
> patches are a little better and try to prevent stuff falling through
> the cracks in Palmer's inbox.
> 
> As an FYI, the statuses that are intended to be used are:
> - New: No action has been taken yet
> - Under Review: The maintainer is waiting for review comments from others

We had the first patchwork sync meeting thing today & one of the things
that came up was the lack of granularity of the "Under Review" status.
Currently, things that Palmer needs to look at were marked as "Under
Review" & delegated to him. There's no way with that "strategy" to
determine at a glance which patches were low-hanging fruit or important
fixes etc, versus things that need his input to progress but are not
applicable yet.

Since the number of statuses that mean a patch shows up in the "Action
Required" state is rather limited, we're going to try modifying the use
of "New" and "Under Review". What we will give a go is:

- New & no delegate: No action has been taken yet & the patch is not
  likely to land for the upcoming release nor is a fix.

- New & delegated to Palmer: The patch is not likely to land for the
  upcoming release nor is a fix, but Palmer's input on it is required to
  make progress.

- Under Review & delegated to Palmer: Trivial changes, urgent fixes for
 this release & content that is likely ready to be merged for this window.

- Under Review & no delegate: Fixes or content that is likely to be ready
  for this window, but is waiting for review comments from others.

Hopefully I've accurately captured what was said, scream if I have not.

A new status was also adopted:

- Needs Ack: The patch is not intended for the RISC-V tree, but an Ack
  from Palmer is needed.

If anyone wants to come along to the patchwork sync calls, check out
Palmer's invite email:
https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/

> - Changes Requested: Either the maintainer or a reviewer requested
>   changes in the patch. The patch author is expected to submit a new
>   version
> - Superseded: There's a new version of the patch available
> - Not Applicable: The patch is not intended for the RISC-V tree
> - Accepted: The patch has been applied
> - Rejected: The patch has been rejected, with reasons stated in an
>   email




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
