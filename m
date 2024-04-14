Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E5DC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CF0e6mcZeYyILfQ8uw0YTp3jlkbFgC6LoVir5/fq5/8=; b=3fJRcs8iFjJM9p
	aQaJHqiLyvMFfhhck2/gWfoQ1OgJVT6NnmcpJxuDpg8w2Ps1AfTGT3+SRLvi8ybywJC+ME0jM+bE6
	kkYjfQbfba7cZfVyJyWY7xY4exsdc+kAq3H00XO69/0us0xA37RuZUpXxPMaCYXfj9w8ZH7hno1MB
	VzbvLU4L7d28Kp9cGzqYjr7BPK4xfdsTDzvVA603rMMnWqLsVU/qys34qOSBFbMWG3vDBN/KEk0EQ
	IJREA0qE4V3zS8E+eAtdys31CEuzHe8rnysOJ/UMQbBWvkCf3ONXN2R9v0j+0w5UqJDv/D/u3CHJo
	qXMhcscwE+65bR2tCKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpPj-00000004OXZ-48oE;
	Sun, 14 Apr 2024 02:16:15 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpPg-00000004OWP-3TqU
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5V6xLcv+SsxTZP7oJclkFu6nQWt0ZpiIb5AqX82jvD8=; b=ARI3Q+SvOz6qC0vz7y43WZP8uU
	RNYEQPok23aMqE1n9XOIj6Dr5tMt4lfz4oQOoLXAlLYRTrqB52NJNs1Gkx4NLrjr8w5mrpVxzIpVx
	opoZFDLoGieAzjpayVi3Vki5mwyafXKzSb8xGXKiUNCH65n9LMWhwq1e4+PeyCGw1WBb1uEwh1AeX
	LZOg0mszXMxVLyuyTITFh4Xx23W2LpVPxyEt2gqJbUSLYNRQKZ5+F6XoNTAWX3Dm0WHDWcuLm4aou
	rQDRNQrZQgQhDi4byyeJ1PAXjoSAGkYmPMbCERWj48IB44PaDGnk4BJMy6LZ687QJ6/j3eJP9uvUO
	aeWH9f7g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rvpPP-00BsG6-0B;
	Sun, 14 Apr 2024 02:15:55 +0000
Date: Sun, 14 Apr 2024 03:15:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Dilger <adilger@dilger.ca>
Cc: Nam Cao <namcao@linutronix.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240414021555.GQ2118490@ZenIV>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_191612_892926_AC4EAF2E 
X-CRM114-Status: UNSURE (   9.30  )
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

On Sat, Apr 13, 2024 at 07:46:03PM -0600, Andreas Dilger wrote:

> As to whether the 0xfffff000 address itself is valid for riscv32 is
> outside my realm, but given that RAM is cheap it doesn't seem unlikely
> to have 4GB+ of RAM and want to use it all.  The riscv32 might consider
> reserving this page address from allocation to avoid similar issues in
> other parts of the code, as is done with the NULL/0 page address.

Not a chance.  *Any* page mapped there is a serious bug on any 32bit
box.  Recall what ERR_PTR() is...

On any architecture the virtual addresses in range (unsigned long)-512..
(unsigned long)-1 must never resolve to valid kernel objects.
In other words, any kind of wraparound here is asking for an oops on
attempts to access the elements of buffer - kernel dereference of
(char *)0xfffff000 on a 32bit box is already a bug.

It might be getting an invalid pointer, but arithmetical overflows
are irrelevant.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
