Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96DAC38A2D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJP1aSuXx9Nuq9vnmcUoXjdOs3RP0Nmgr7QqoVfuF9Q=; b=YgQ9TMc0Dun90L
	Rkc/4vTfHC4XXpUETr3OaYsVhRQTlQlQBgrx1ulymVaD6Zsb+NGqyULMNiaU3fniosHAtRfBoNWoc
	2US/vAgebCB7Svi/TrADcpTe+0RLRUqbPvjsHMls1wwWULkP+goZP0r4nLrzz/qkxSZDlAGUAoo51
	xQRhsLYHoPzSsa4lzBW+axkotvv4xUWzaqdtMzSP4d1me/dCGHOFBKc0pp9NciV7u0Nz5Q4ntwj1h
	WtW7Ou7I6V4P6umSNK1/NuHi0bMRviEAPCc7l8oYHeKBB0HRcMVrp2YEIh7EhCzZnJ8wmC5LeQPWD
	HgPHlf1MJBo0VMC/3vDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzzi-00Cogc-Q3; Thu, 27 Oct 2022 10:20:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzzM-00CoYF-4I; Thu, 27 Oct 2022 10:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33D2E6227B;
	Thu, 27 Oct 2022 10:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821EAC433C1;
	Thu, 27 Oct 2022 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666865991;
	bh=NqMrmdJW4/CFJyAsbuJvEyN1j+Q4SJytBhbMA3wApjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onYFzYorCHVobqFga8odCiCw3zhyp2dljGm5m00ISE9Ji1zG1HZbyuE8FIZ5MPmq2
	 FI4hP9uT9L82dsUXFtdYxpJbuGtVgTWYmuID+/8DL32wJOSmtFg3D9jylLtvz+jEF5
	 rekz017okoXEAjA2vyv7p9c6XiBmC8HbgOiH93NI=
Date: Thu, 27 Oct 2022 12:19:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: stable@vger.kernel.org, Brice.Goglin@inria.fr, atishp@atishpatra.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, sudeep.holla@arm.com, will@kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 5.10 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <Y1pbRCQbgMw8Upvz@kroah.com>
References: <20221019125303.2845522-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019125303.2845522-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_031952_244789_16BC2F29 
X-CRM114-Status: UNSURE (   6.40  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 19, 2022 at 01:53:02PM +0100, Conor Dooley wrote:
> commit 456797da792fa7cbf6698febf275fe9b36691f78 upstream.

All now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
