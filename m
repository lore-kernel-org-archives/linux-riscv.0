Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34FDC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQMugdXAOiNI51YKGCjsrgGhZBZltdOFnumMU/Z+SVU=; b=cSCSIsICRYEDAY
	6UVn7sjKspAQvajHAo7wo7/NdR1xe64qrhFNfMzUak6PqeXmKIMnT1D0Mxwsy980zGDDEztN5T+zY
	5mCMrPngLiMsIf6obojy/nfTdVfc2vRI9CG7F5jvkMMEx9yDkbfhqIqRIS/B70H2SK2S9AWxsP2lz
	ROp9L2aW/L/hECnOK5R/j40s8H5bHiHV0mx4iHYW5IHSzdpaoRBl8Osa1EJ8mZBXMikGckDjQvAk8
	ZI3PHRf19tOHelqI0HL8Jan900HhLBTLb2z4IzZxJu6RdsgUmuPGk70gKZnE1ujo/i9V2iL+lKn7u
	zED4AQ/wzHrFDeHf9hzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlit-0000000D1q3-2LuN;
	Tue, 16 Apr 2024 16:31:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlir-0000000D1pt-3YHi
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 16:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zrxy/XX7+JuExrNVQ3X4tsqs9uLcDU9DwQc0CqefZDs=; b=TpE9WHNujzzZA/S3V2p4urVEPj
	R7bkoCWwWxSe7r+t8li4lsQD8ZzZItB+Zkbqc/dsdOTG8bYRwUatjQskVdkNgGcu4IhKO5oWVGOd1
	Urh4V8W4fbVs0l6AFTLU9BEeGCPP6pGVjM8TGPWH+tCzQGiGXPhh+U7FWm+980jhrd/JT2yAK5oHq
	pwFJaEmv8V6zxGBk/MLFWt56H8SOyBGsdAVFnXY7M4sbJyL732ZLrQtV6JKgaFlSPtxW70/EqOkGG
	TXaLlkKZzVWIbrQWTfQ+oXJRRmzbvNVk9PIUUbnFcYxo1v/8uqgD8NGr0x5ojmcoCfySBR9yZVdT5
	xXWOBcow==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlip-00000000w58-1RyL;
	Tue, 16 Apr 2024 16:31:51 +0000
Date: Tue, 16 Apr 2024 17:31:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <Zh6n952Y7qKRMnMj@casper.infradead.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <Zh6lD8d7cUZdkZJb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh6lD8d7cUZdkZJb@kernel.org>
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

On Tue, Apr 16, 2024 at 07:19:27PM +0300, Mike Rapoport wrote:
> > "last page of the first gigabyte" - why first gigabyte? Do you mean
> > last page of *last* gigabyte?
>  
> With 3G-1G split linear map can map only 1G from 0xc0000000 to 0xffffffff
> (or 0x00000000 with 32-bit overflow):
> 
> [    0.000000]       lowmem : 0xc0000000 - 0x00000000   (1024 MB)

... but you can't map that much.  You need to reserve space for (may not
be exhaustive):

 - PCI BARs (or other MMIO)
 - vmap
 - kmap
 - percpu
 - ioremap
 - modules
 - fixmap
 - Maybe EFI runtime services?

You'll be lucky to get 800MB of ZONE_NORMAL.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
