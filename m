Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CF6C61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 23:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hKq2hBJ2G6mSq4iChoc0rzCs3L6FmdEij8rJynt3j0=; b=4IAQte5t9dvwoW
	x31NCe5IWTTp1WRgheiM5m7PFMXu3O+/glPbSM/Om2aZ8pfpnmSRJmGK92fElOlMx17Xts+2eVRDi
	Bje7dDxOujDz5G4+n5WIbq1GPBo8MQH141zWaCpSIB8KwwJlRoXATQkt6kjOjsenD22Vi7N7uHOjH
	R3wLoSZBIDdhLlsExn5vgO9htr2Em7v4IPOCF9EXl6DhnG1+/hkZC5LNVCxJ+GeYekBl8mOC1b5em
	0SPjEi2wjwrH8HX1pS+tpsQlE7Ktxe7hPsOV2M3qVdnoTwEsdtdx8USBq9iJ07uXCI4dxyZxDjvE1
	fY3T7sEKG3TWxbnZmpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1XWO-0000000DVwJ-2hx1;
	Tue, 01 Sep 2026 23:04:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1XWN-0000000DVw1-2jFt
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 23:04:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 123D260052;
	Tue,  1 Sep 2026 23:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565751F000E9;
	Tue,  1 Sep 2026 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788303840;
	bh=bErk8aUhS5uIbb+r3SBnnP++1EXPA3FWCpGPUzQH0Vo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RIZUcgGtzqzdJ9Xj3Ry6bTcSkN3xdcVu/qZRHaznO+N/DsK9V2pVOlm3EMDgfbKly
	 rqON1bbDxtDuclkDNEcmEchPlm0kgvBlxjC/ngqBZeGbaiqmeeBkSDa1kHP9pz7Bk9
	 WTHgHjesArutmc7RUx2xnowSYqGXp8+MHzqDtFH+BIBpe3uj1UQIGMeBO0Z/HwUkXN
	 au+jRMPvtwe82uADmqQU6aW3mF9FvILH96R+nCFyOjZHml+Dvq498x78YASTpYSqWy
	 T6FjbDkc7+Zj2ppkOO7K5aou84ZnVhQVNRp1iQDeCFtgoqLnte/GnD5T1zKtvVLYox
	 g5JJgdtlFw50Q==
Date: Tue, 1 Sep 2026 17:03:57 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    Anton Blanchard <antonb@tenstorrent.com>, dfustini@oss.tenstorrent.com, 
    greentime.hu@sifive.com
Subject: Re: [PATCH v1] riscv: skip software algning code for
 HAVE_EFFICIENT_UNALIGNED_ACCESS
In-Reply-To: <20260901192334.3543340-1-tchiu@tenstorrent.com>
Message-ID: <e68701c4-2e91-8bc2-77af-9092eda7189f@kernel.org>
References: <20260901192334.3543340-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
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

Hi,

On Tue, 1 Sep 2026, Andy Chiu wrote:

> We can jump straight into the copy loop if the kernel is compiled for a
> hardware that natively supports misaligned access. The user copy
> bandwidth improvement on K3 and Ascaolon is shown as below:
> 
> Misaligned user copy, size: 512B (offset: [0:15] except 0, 8)
> BW Improvement	| Write	| Read	|
> K3		| 6.19%	| 3.43%	|
> Ascalon		| 10.0%	| 11.4%	|
> 
> Aligned user copy, size: 512B (offset: 0, 8)
> BW Improvement	| Write	| Read	|
> K3		| 1.69%	| 0.90%	|
> Ascalon		| 1.25%	| 3.32%	|
> 
> Suggested-by: Anton Blanchard <antonb@tenstorrent.com>
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
> ---
>  arch/riscv/lib/uaccess.S | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 4efea1b3326c..cf8586a937de 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -76,6 +76,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
>  	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
>  	bltu	a2, a3, .Lbyte_copy_tail
>  
> +#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)

[ ... ]

So I guess this is just targeting the fallback scalar path, and only for 
nonportable kernel builds?  Is it possible to use the result of dynamic 
misaligned access speed detection here, to improve performance for 
portable kernels as well?


- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
