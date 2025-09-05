Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D34CA1013
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whlPXKzEGeXsfIVzbfCQsd/r3T+KAGP5PS1N6abJgKg=; b=TOPwO2XXT31Xia
	9viQrJnsq7mEmEBOiLjY4YuS3yyVX76WSwp2tQoftIIdY9uHIocivZKT/CBgzLk2axtuGg5iDBcoQ
	i0rTJ75erXOiYtSt5sX7KVNK+vV4AFU6ddq4DeTNasBm1ZY61F8zai8t44uWRgDemoHXmGNLIJ9SN
	Fesvz6ldt6tMH4sy3EtTKE6oBXV/5jPyxbuCSVjAWpnwj5DRKMG6OROV1HrgvlCNc4Id6JOj7+seX
	cRXfBMNQa0o5zTObQNu5skyPxx+Lh+/yqKJ0V3KpAxh5BpH+/KH0EfYgDXDDN4C6OkpLslCQlvq7w
	zXD4VxVG/4AJehxkOwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugYy-00000005Xmm-1dEp;
	Sat, 06 Sep 2025 00:13:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuei7-00000004x7j-2xd4
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 22:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A13144FDE;
	Fri,  5 Sep 2025 22:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F515C4CEF1;
	Fri,  5 Sep 2025 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757110509;
	bh=NTs7ekQEkNeZdhqJMnGSHZiWoHIQxzE/1U1C7GUFp3w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hSvIujslLpaZzfOg+xBZ/eTxP3WSmdyB/mUN4AUyM8t5Pq9coYjpMA5SbkSqijhsG
	 gpm0Kk9uQtxgNi04OsMFmFLBUHAySIXk8VIZOFoVrbctACitdmFkVmNmWH7wLU41MS
	 NdnDYwIBcOoslsOB0gpXRlhVhvO2q9nFC6TDqK3zZuDEK2bP7NTnrsBlxEc4Jt6kPD
	 1BHr3FaHRBDObyr9smz/2kHa4J1h4C8grEtzHXwUsxAsFSXDxQRFHrdwACFwz2gsoI
	 w0aHVQe7W13OCqh2cxqCJPQWoCgNcIBKOfn6YfLNQw/rgcg1YjFIXrLytgq3fQoFTf
	 89AML4ntI8D5A==
Date: Fri, 5 Sep 2025 16:15:06 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
    Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Fix sparse warning about different address
 spaces
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
Message-ID: <4381e8fc-67eb-c7f8-d4ad-17a1fe0a5bfa@kernel.org>
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com> <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_151511_773428_A9C60C1A 
X-CRM114-Status: UNSURE (   9.49  )
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

On Wed, 3 Sep 2025, Alexandre Ghiti wrote:

> We did not propagate the __user attribute of the pointers in
> __get_kernel_nofault() and __put_kernel_nofault(), which results in
> sparse complaining:
> 
> >> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
>    mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
>    mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *
> 
> So fix this by correctly casting those pointers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161713.RWu30Lv1-lkp@intel.com/
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, queued for v6.17-rc fixes.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
