Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E620CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8y1VCs46UgE7uVgW0UPXvsj+yeTtY5DAI30QHKq7lrw=; b=hr4yHb4JuWVdBb
	VkVhlzzMSYXC4XkBigsumgJ1KC9TUhDHUxkKQCgUSkHoowHjR8w67VTOjaByI0mr/0eXBy13ohWbP
	b1A5T+5617+9Z2Vw3ZRtYGGErXmiiB79NZELGwTryknVSwV20aRqGKAEBkROes7RvKY64XU841SkO
	iEvkeUzuY/083+CeDihITgDS/eWm750gnLIlxIjm76KkxRNeBxg7+tSTARfOpbnt/lGIraNK19YZd
	jWw0qMeGc7XuOVLvoL8X/0Fd2hn4E9HSvIaJhM3/x4YcwC69S+5xZDYZMYweDnVR9gKdGkyQCzjEK
	q1z85zUqg04kNgastypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6auf-00000004e7v-0N1H;
	Wed, 08 Oct 2025 20:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6auc-00000004e7Z-2yEm
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 20:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5471543A6A;
	Wed,  8 Oct 2025 20:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABBEC4CEE7;
	Wed,  8 Oct 2025 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759955846;
	bh=XXqi5wxOOkul2F2T5znn83YyVWjS0g4JydBYsqfGoBc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qwcdgFFHbfCdAPIXcMM/a3eT1QCszydsYTBd8ZvVL0GTGQEXnHf759lu2NITEiymA
	 De0lF7qFiP1EsUOfveKouGDh6Lz/mMCcUxdvy3kB5CC8Z4ozURRqXuTc3Fn5g9kZv5
	 Q6NlB6PYDiu3/vwytqgSI8yZ1uKPZ4x8CnS8T7igdRa7xm6ummorfLgA1h5LtHTsZF
	 HacIdyejO2H53QcKrb6uPmmiCjcs2mO29/GppXHXxH8vGDYWsHSCafxvRViOucw+kV
	 AAQ6s/88STBODTI50K9k2tFQOB+GVA/Wn8NfnaHU814RCO3o6MiDqi668oGeUULJo1
	 9EUmPKolLEMtA==
Date: Wed, 8 Oct 2025 14:37:22 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
cc: Paul Walmsley <pjw@kernel.org>, 
    BillXiang <xiangwencheng@lanxincomputing.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
In-Reply-To: <20251008-a966ea0e3d8bb6dbd85f6c6a@orel>
Message-ID: <d9720a12-5efc-1be6-b4a7-7a8888b959a0@kernel.org>
References: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com> <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org> <20251008-a966ea0e3d8bb6dbd85f6c6a@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_133726_786180_66F99108 
X-CRM114-Status: GOOD (  11.90  )
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

Hi Drew,

On Wed, 8 Oct 2025, Andrew Jones wrote:

> On Wed, Oct 08, 2025 at 12:17:01PM -0600, Paul Walmsley wrote:
> ...
> > I do have some broader questions: is this patch really needed?  Is it 
> > fixing anything that's broken?  These SBI constants aren't defined by the 
> > kernel; they come from RISC-V standards.
> 
> Hi Paul,
> 
> You're right that we don't want this patch. I hadn't noticed that the same
> patch was posted more than once or I would have nacked it here too. I
> replied to the other posting[1] a couple weeks ago.
> 
> [1] https://lore.kernel.org/all/20250924-7e9764acec6722b5ef29ce7d@orel/

Thanks for the heads up and for the early review.  Patchwork didn't pick 
up the thread for whatever reason beyond the initial patch, and I didn't 
bother to check the mail archive...


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
