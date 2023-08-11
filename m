Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B62C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SNZ9RVemrg41uvKjPSv1gZSP5Nd0aSRrq+nW8g7VC0=; b=kT5RRApYGpA0OL
	yRpb0ytPZcAzZEibDIPbAWNl9p4QdH+BJksb0pUGcmdFHjZckBkhPaWT+WC0LGKUtoUp26x7r9MzM
	mTh5L/BWF77OGQW3zuIKjb0bpcUFpPS8QDgLi3gNftk4wNycI7tdaw0t+U/WHDUQPxMTCGzCM2InA
	opy/G+9xLWlwegP++wSRc8ksygQwafK1CgExMC++/ySDEhuty8xVjmzs3ynRhzDEbg+6zIcBSJjRF
	OUamO3Ymjk9TJEZMTVXY+cBPcXX1cg7GuY04P6zcyKS9IM3mEM9krJPPI6I82AxVWqsmMYu4IM29W
	ZSxzaA5sSp+aEObQp36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTEp-00AqYj-2d;
	Fri, 11 Aug 2023 14:35:39 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTEm-00AqXD-0m
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 14:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Xd+TgXFtpWK8JUp/buH0ZdNAaimnoDNIO7zEmS6bZ9c=; b=Qh6Yinvx23/8VlytZgJZE4vMcY
	zpVO0I0SturxAaHA9CzDIvKg33IMiBOTu4odRO0ragaHMU7cWSxAjmWKSuDRlyq4P9uEYmEmkLTUr
	BmHpgrl8lu21Be+jkMKAcQDtl6ehhdaEkIYzQhG3zK6sdjiSDnAnd/+cPnPzsTlOsIZ+7DqJ/vnCZ
	Hf/FtpsUHjJ416aYMFX6O4Mnh7CUeNxDeXuhaQQK1aw+3JNL136K1hPH5WyN8mJi1XtIWdWNWWmCR
	GQ5rc1F3UIpL7TImvHhyu1zeYLE1hcFcTF4aSoEKXWdkoWZ4DkNUMXPfRsyFdm+HmYyoGzG8XPuEc
	rJEiZyiA==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2])
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qUTEV-008IKO-JZ; Fri, 11 Aug 2023 16:35:19 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qUTER-00HJuM-1m;
	Fri, 11 Aug 2023 16:35:15 +0200
Date: Fri, 11 Aug 2023 16:35:15 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bo YU <tsu.yubo@gmail.com>
Subject: Re: [PATCH -fixes] riscv: uaccess: Return the number of bytes
 effectively copied
Message-ID: <ZNZHI+5hkhYDhdxF@aurel32.net>
Mail-Followup-To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bo YU <tsu.yubo@gmail.com>
References: <20230811110304.1613032-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811110304.1613032-1-alexghiti@rivosinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_073536_279609_10A3E516 
X-CRM114-Status: GOOD (  21.09  )
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

Hi Alexandre,

On 2023-08-11 13:03, Alexandre Ghiti wrote:
> It was reported that the riscv kernel hangs while executing the test
> in [1].
> 
> Indeed, the test hangs when trying to write a buffer to a file. The
> problem is that the riscv implementation of raw_copy_from_user() does not
> return the number of bytes written when an exception happens and is fixed
> up.
> 
> generic_perform_write() pre-faults the user pages and bails out if nothing
> can be written, otherwise it will access the userspace buffer: here the
> riscv implementation keeps returning it was not able to copy any byte
> though the pre-faulting indicates otherwise. So generic_perform_write()
> keeps retrying to access the user memory and ends up in an infinite
> loop.
> 
> Note that before the commit mentioned in [1] that introduced this
> regression, it worked because generic_perform_write() would bail out if
> only one byte could not be written.
> 
> So fix this by returning the number of bytes effectively written in
> __asm_copy_[to|from]_user() and __clear_user(), as it is expected.
> 
> [1] https://lore.kernel.org/linux-riscv/20230309151841.bomov6hq3ybyp42a@debian/
> 
> Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")
> Reported-by: Bo YU <tsu.yubo@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/20230309151841.bomov6hq3ybyp42a@debian/#t
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Closes: https://lore.kernel.org/linux-riscv/ZNOnCakhwIeue3yr@aurel32.net/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/lib/uaccess.S | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Thanks for providing a patch so fast. I confirm that the issue I
reported is fixed, but also that the full strace testsuite now passes
successfully.

The code looks all good to me, so:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
