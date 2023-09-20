Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2B3C05025
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeEo/HJ3DqiKOaE+7y+H4iQa6Xg42lUSlYOArB48wpY=; b=am36kzOKMRFmRB
	JoFzAD0CJu8wiR93of+1TMrGSGSgVM6hv2NKXCuNOxcjTkBIP5+30JrkqK8806HRxm/ChWMOgBysN
	k0Xq2LtSpCFoJtvONeJTVt+l4kWaE9/OMSQPVXCBGKafp4lj90ONN8jdFQbnGk7x+hmV73xf3E6Zv
	PXMGQXvVdB5ma5c8pxoKFpG2Znddlwo4aun693g1DeFXZSzwjfh/e8H85kyfg+YTH8CqLZy5s3+Nu
	QCQI2tjVF5eKOeojxISoom/NM7HzDvhKQNGL5VdAyhhgJ+Ymlr47Hhk/0+GYgi5yDaPxrByPUAGJI
	wH+FsO1z8MiC2PAs6YEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4Jo-004CZ2-2D;
	Wed, 20 Sep 2023 21:01:08 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4Jj-004CX6-2H;
	Wed, 20 Sep 2023 21:01:04 +0000
Date: Wed, 20 Sep 2023 14:01:03 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: j.granados@samsung.com
Cc: willy@infradead.org, josh@joshtriplett.org,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Guo Ren <guoren@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 0/8] sysctl: Remove sentinel elements from arch
Message-ID: <ZQtdj211q5PekVRc@bombadil.infradead.org>
References: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
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

On Wed, Sep 13, 2023 at 11:10:54AM +0200, Joel Granados via B4 Relay wrote:
> V2:
> * Added clarification both in the commit messages and the coverletter as
>   to why this patch is safe to apply.
> * Added {Acked,Reviewed,Tested}-by from list
> * Link to v1: https://lore.kernel.org/r/20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com

Thanks! I've merged this onto sysctl-next.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
