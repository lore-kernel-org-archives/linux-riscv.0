Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvwVeIlkLYflDAu9TQun9SB9BLw9ZYtbiReZOz5TChA=; b=zC5wapZmfuqqAI
	SnTxlBW8/tYT8hi8NGl0oj0BhHkQGG+UuZlYH/nD9gKmLDoKUVBdzdLYGKl/M0PXG0HCqfGmGMOrv
	lGGdESK0yZm1d8I44FA8YXw5LEdSG8uaxHBEXg99z8HBK2Cuzb94weRukfg0jeEdGfpj5/vvrJPsE
	gPOnVhDhSymTARsuF4PqzqI4F8jD+9zUzelc81YAasjknrmeWLsBAjaY2nbGyUGjVyUWFgaumAdZH
	JMM9GlxVPkrB1hdE1HYzjva8lqUcYRFrIYeU5yDbH0f4S0ZxzvCMtDgBluykrx8AlySq74b3BHVv0
	4Alaf1OvrizP0X5YhRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0eS9-00Dogh-Ck; Fri, 24 Dec 2021 06:53:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n0eS8-00DogZ-3l; Fri, 24 Dec 2021 06:53:20 +0000
Date: Thu, 23 Dec 2021 22:53:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
Message-ID: <YcVuYEt2LQArK5iL@infradead.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221163532.2636028-4-guoren@kernel.org>
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

On Wed, Dec 22, 2021 at 12:35:22AM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Implement asm/compat.h for struct compat_xxx, RLIM_INFINITY,
> OFF_T_MAX, is_compat_task, compat_user_regset, regset convert.

Much of this really has no busines being duplicated over all the
architectures.  I have an old series to consolidate a fair amount
of compat.h cruft, I'll see if I can resurrect that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
