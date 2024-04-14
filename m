Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB25C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCi9h+Uwo4ld3ucwJjTiBj6cHnF48XWgyck9uGBnveo=; b=PVYGC5rVL/O7Ek
	MZ2gGjjiwTLJS86OFu+4iMTKlo0MiLj1/tg/4OjaCaGnBG6JIB7XpwXJjKdJKbLqYWW8rzaO1Gy94
	ZA1wi6UexfWzUzwDirBO9/5rsZR4ZwU4gKoL9BScv84Kx2MO0azg8Npjihi4xBNjk49tjKTsnUeRB
	XCRhXHsL1GWiRI26o4BsHiHQSBhr3iz4hKCrehamRGqjyqK13+izs8TsajTuPY21LNAPWYE0aox9f
	8FhhWOOslssPPV6CVWeIv4M4M6X9OkXDVbAZSoT2ZGQNfR5BcPrDzFb3bp+9JNmrlsUYb33CnGGjs
	g/SLZAn8TJ5X1D/OdlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpFL-00000004NaU-02CL;
	Sun, 14 Apr 2024 02:05:31 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpFI-00000004NZA-1YlZ
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:05:30 +0000
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43E24vOI017915
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Apr 2024 22:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1713060302; bh=FXSMfOuJHvgzP8fvH4L0dhdvcbQaONOy8jw0JVIAXwY=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=gm3P5WlGyVoxRXP+9V0+YSIDP2kbuJVkylgPM0ppChEX+mShuq2ApJQwm4LJi6JiM
	 XAJeqmaIk2fkUcSKpL5sWI34RcX4YiBVnM2qqJzYkvx1p01d140S7MzfDGW7YQLv4u
	 b/xa4LsfcgXuHrl0IBj0V429c2XtwgobI2g5ZaW/RhJnQX/Xv9HtIJPA+ufw+oCj61
	 +DWfJqm/U35Fiq3YmCB0hMqHTg4BhpKBzLGjUVLkAG8c3iX1XTNM7TTSSfs1NqvRlN
	 QtwqUZmHuek5X6bCtWIveyFW45QyozNCugTcV7FKP8v9Z5Sw93aWz3tm0ooVa1xX5U
	 z8YFtBqJbxLAw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8F3FD15C0CB5; Sat, 13 Apr 2024 22:04:57 -0400 (EDT)
Date: Sat, 13 Apr 2024 22:04:57 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger@dilger.ca>
Cc: Nam Cao <namcao@linutronix.de>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Conor Dooley <conor@kernel.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240414020457.GI187181@mit.edu>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_190528_766078_B7DC35DB 
X-CRM114-Status: GOOD (  10.58  )
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
> This looks like a straight-forward mathematical substitution of "dlimit"
> with "search_buf + buf_size" and rearranging of the terms to make the
> while loop offset "zero based" rather than "address based" and would
> avoid overflow if "search_buf" was within one 4kB block of overflow:
> 
>    dlimit = search_buf + buf_size = 0xfffff000 + 0x1000 = 0x00000000

Umm... maybe, but does riscv32 actually have a memory map where a
kernel page would actually have an address in high memory like that?
That seems.... unusual.

If we have a reliable reproduction, can someone actually printk the
address or test to see if this theory is correct?

	   	       	       - Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
