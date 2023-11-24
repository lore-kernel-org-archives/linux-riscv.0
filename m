Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F892C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDloM5+RoI7kxllJF7OSixWzPYPLsf4xDuelEQvQA7Y=; b=sI3GculH5qY7MN
	HqEI9hTv+KITYgi/YufEacfJpwGiFGnxQCJd8gggrTD1s5jw09ehSsIz/hiBxEhCUIEplUbNcdObM
	8AG+34TEoTR9Et7vOP0FwtbukphldXNjVe8+J6f9NkmTzEQFfGeKHsddATmtiY9wld4+O/E6U29Rp
	KbzfvNa5VBPh2WwqB23mZ3twvUhKoGiCrWe60BrBajzVLyR4rXeMpI3rrlCpZvKN9loyl3WNdguNv
	rBYUtddbNh5EN+wgHjaHAujkVmE/nsDn/o/gSI3qvT5wRR4OwAsgfoe3WBeLtIPVdnwcUVyl05CO4
	4/VM4EnX0qj1q0qbu5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TgF-006u7g-0S;
	Fri, 24 Nov 2023 10:45:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TgC-006u6Y-0k;
	Fri, 24 Nov 2023 10:45:00 +0000
Date: Fri, 24 Nov 2023 02:45:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
Message-ID: <ZWB+rPU4nm+Zxd7d@infradead.org>
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
 <ZWA9HwUNHDFIw0wP@infradead.org>
 <7232f08e-dfe3-43d6-a4f7-abf8360bbfc1@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7232f08e-dfe3-43d6-a4f7-abf8360bbfc1@rivosinc.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 24, 2023 at 11:28:08AM +0100, Cl=E9ment L=E9ger wrote:
> I sent a similar patch two days ago with the same modification. I'm not
> sure to get it. Why is it better to pass the "unsigned long" type from
> the caller ? I mean, the resulting code would look like this right ?

Because you're legimitizing casting between address_space, which is a
horrible idea.  By casting either from the unsigned long you make it
very clear that deep magic is coming in and you make an informed
decisions based on the user_mode() predicate.  Witht a blind cast
to add/remove a __user you don't.

I'm actually surprised sparse even allows __user casts without __force.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
