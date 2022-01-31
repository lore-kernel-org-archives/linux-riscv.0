Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7BAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEGnwWyiNUKTrvSZZa3W5D9WcAdT3Rh66s0wozinB08=; b=ehhG7quWIgGpVE
	XiqAt4YPFtmbaLbfoIzp2d7HDiGedgWwxq+gL/+fpETMdPOqMxemTm93pIzGaL/xDcxXRh7ero/Lf
	KF0qzK7HR8Jv48Y1z/UIyj4Tze6Z1MziY1OnJ/y4vfSwNUWtKmJ7HmZmRyyjWPNxwkplcDHXq+sb8
	aXy7p5yZl4Ds858HAy48bRNN1/Yj95cVbK4JqdSHpIc0XYpdksCqHa81THWQOomIV48IihD15ogXZ
	/3I9T2lm+e1NHjS8VAJZNrrWc0YQBMCFGtnRjrtR43+0OeP/tQlrtaqZ0hdJy3ddWZaECepIjm1Jh
	Xc5Z1z0NwjDY5xQeGgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVgW-009J7B-HG; Mon, 31 Jan 2022 12:21:28 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVgU-009J6Z-4J; Mon, 31 Jan 2022 12:21:26 +0000
Date: Mon, 31 Jan 2022 04:21:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Message-ID: <YffURrqD0pfXnEkV@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-4-guoren@kernel.org>
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

On Sat, Jan 29, 2022 at 08:17:14PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
> 	  compat_msqid64_ds, compat_shmid64_ds
> 
> Cleanup duplicate definitions and merge them into asm-generic.

The flock part seems to clash with the general compat_flock
consolidation.  Otherwise this looks like a good idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
