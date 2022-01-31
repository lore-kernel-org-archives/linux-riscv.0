Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41C6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5MatXltuDm/Y/DjjmSvF3Pz5j4UMU/vWSsV73s/lfo=; b=4comh1bvJBSsGe
	g/BM8MdRMBs7c7ATQialMgkLDlFWlPN5QUgcDa5qX65spO2O2ORMvdl0du3RVIBABFM15Kpu82qt6
	P6bhTEf7tp8u1bKzgkSFobUi7d8RQfhpdrqSnBZxIH7UWqGp422xBFZJyGFs/0/nnyq2Ngn6l5WIT
	v62SE/8Ei7YRgL9P5HXAW0FdzimHOfbOl0+JpfaXmH4XPSvRq14Q9+dparR5wXJcCL1ENHkCJ4sO2
	cZ5XxP93R1lB8n+3DGy52yFZJS4tItgDpKeGBV4lBQus0pwyCx/UFNvzEuxjr7UBJkXAFgqOHceX5
	Q6DeO47nBAmZ2nAeVtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEVgz-009JHB-2w; Mon, 31 Jan 2022 12:21:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVgx-009JGM-DM; Mon, 31 Jan 2022 12:21:55 +0000
Date: Mon, 31 Jan 2022 04:21:55 -0800
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
Subject: Re: [PATCH V4 04/17] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
Message-ID: <YffUY/l8ydK8+/70@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-5-guoren@kernel.org>
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

On Sat, Jan 29, 2022 at 08:17:15PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Make "uapi asm unistd.h" could be used for architectures' COMPAT
> mode. The __SYSCALL_COMPAT is first used in riscv.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
