Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AD1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtELW+uTQsVp2CT7iPxJ4K0MYEV/qwamk8IqVBvEIEU=; b=2ZyeMqfppuCHIW
	piTGVEij4+M1i7j6y5EIPMM2Ow5jhFTPItizctMo1Bnuyn5TGrSzy0jIfomyeBCJrgDluHvlnXoCZ
	LfJnJe+S0aieM1Yx2rHvvbo7oSy2W89dmnRJJ6uTBSdUmO/HE52XdjW0zwblrgcA+chZ/gky3n/Bk
	XB1f0Dkw5pX2+X27ZXQff56zHPnSBeYmvIxWw15mUHsbOC7QoN8zuuUawzzMnUP7PcdOrRggXoPuR
	OhTjDfU4+std2R3q2nE8vhyIK8bxh4cTZV/Vts7XD1oefxabn4JAgiBQfZY/KkBpoiipC5XenmP/+
	+KxCn5qscpEwFpddooOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noO4N-001ZV6-GH; Tue, 10 May 2022 11:30:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noO2O-001YRL-Jz; Tue, 10 May 2022 11:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gFshjzGdEIwMcrQcNFouQo/5FXkPewxT5zR5lvvvUfw=; b=as12JgrYuvnlzI0BEnFgYLZq95
 WXQrhpOMJbTJJ4/tfWNkK39SmIu0A2I5NdU/AJQwzSRWBNBszTqNK69Y8UxAJf2d4QkcqEIK+Xn8i
 /EJdkhiCFdzuJFgWy+B8Zn0xyluLlV6MXG2boxnuw1+Xnw4dd37NgbrCn96cr8NnXrVOPcwHzGE1C
 nPLhAZ1CJutlX8+YAm+VgKL3lbZ/1A0Wv79sw9v0LTyoR1aqIaSH6RJUCTXoO3YRZbEThKNJo7XB+
 7MiTT6D9ZeS3M0wnwqh6lNWJAo8jAfx3Ka9c0xzUTel9cA+XwAVLi4T7zJRuOp5cYo1zey3/sE//D
 BYGoxWTg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNG8-00Col6-34; Tue, 10 May 2022 10:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4FD5617A1;
 Tue, 10 May 2022 10:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE5C385C6;
 Tue, 10 May 2022 10:38:17 +0000 (UTC)
Date: Tue, 10 May 2022 11:38:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <YnpAlYUsUJAL1fFu@arm.com>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_113828_438700_7EC28AD2 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, May 05, 2022 at 06:09:45PM -0700, Josh Poimboeuf wrote:
> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
> 
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/arm64/include/asm/asm-bug.h |  4 ++--

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
