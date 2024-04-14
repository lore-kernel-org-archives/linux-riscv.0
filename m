Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4350C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpFRxuzJpAEnkdbR+CP4b1Nljg2f6HPsNIoGQbYst8w=; b=PNnmzbE29O0dS+
	kpEnfndhtU7KVvOmyeK90pgVyOfb9cafNhIiVxxhzvCG0Ihx48J5WjGJRWT1pFh/lm+xYFLlb1kjW
	K1aEAfaSy3fSQsqTNxpKvSUYKkNeicrP12tFVgrewPJJCYCWGBFCZdViAMZCqdzECWv3oI4wQA+gG
	91OA3lqW2vI48eojN0rPMf/KJQZMjur01kYtrrvoLKxsoeiaIGDK8neww185ahEzQCqL7qiycCFJM
	yK7455CwxM5YXRhHgtT1ZqsuM1UySR+EBspuoRVXZF4NxOrIMklaESPhI8o7vhJkjINvQjvKFLEHL
	L0Y7ZRh6OokitngdIdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpS4-00000004OqB-1vK7;
	Sun, 14 Apr 2024 02:18:40 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpS2-00000004Opl-0lyf
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VtmRWnTbSF8zyylcv2eQAlIdRqRLmriocN3/YMLG42Y=; b=ZAuWqp0SSfSLdc0ZxyFILpkcjC
	/DrlmN/lPTqj1wnrvNYcnxq0l2uyVWZOKh6rTLuLAv6YYwWQJONgLYqEwNsgdZh1W+LiX48gmpXpd
	aXO2fYJen7+XAIaS2Xvt2bxljoWIFURSkuW+MCfVcYH042puYbMSDXv1XV10UH/Sheaxc4VVdHfGf
	67D0liqroLTEN8CVGbFs9j/RUQwjvEoz/e39UbHWx9DOpt4PzjAzDzrWN52CL2RbPyG46SpQaKbM1
	JaFq+5mCrdW6ByOcnKg7k35958mA0qUH9edFuI/FgHUzvsJuHlxjXh1d/mAhFdjttzMGnHF2Orvwr
	aiO+3oNw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rvpRu-00BsJU-2c;
	Sun, 14 Apr 2024 02:18:31 +0000
Date: Sun, 14 Apr 2024 03:18:30 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger@dilger.ca>, Nam Cao <namcao@linutronix.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240414021830.GR2118490@ZenIV>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
 <20240414020457.GI187181@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240414020457.GI187181@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_191838_250534_BA087571 
X-CRM114-Status: GOOD (  10.54  )
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

On Sat, Apr 13, 2024 at 10:04:57PM -0400, Theodore Ts'o wrote:
> On Sat, Apr 13, 2024 at 07:46:03PM -0600, Andreas Dilger wrote:
> > This looks like a straight-forward mathematical substitution of "dlimit"
> > with "search_buf + buf_size" and rearranging of the terms to make the
> > while loop offset "zero based" rather than "address based" and would
> > avoid overflow if "search_buf" was within one 4kB block of overflow:
> > 
> >    dlimit = search_buf + buf_size = 0xfffff000 + 0x1000 = 0x00000000
> 
> Umm... maybe, but does riscv32 actually have a memory map where a
> kernel page would actually have an address in high memory like that?
> That seems.... unusual.

Would instanty break IS_ERR() and friends.  And those are arch-independent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
