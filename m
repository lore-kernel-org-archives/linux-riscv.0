Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A9DC44524
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 02:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvfngj40PIfL5jDpUKQ8aA8j4vwtMdP3ISVggpugLrc=; b=WSm4WmzXAldo3t
	KdYxgJDxq9PcSaeDr1n7RrgXV4RN4yvMcbUKvd1z1BRMH8XWNlnb2ZD2q4GPSqFzuh+CDoiYhuqaT
	LbBKpI1xOqbivO0HZZBiwj3Bf1xwZFOTM2RKJ2SAuY1nRal0wSVIEwrCyZbLAbxqzbJpKrhscdvF9
	jmU9N9sUtx/MlzP2zHxUDCpdRIVG8tJHev5vdtRoNJ6vgRDYrWDDyaNZfsjeyLuPf016Gry6a6Mnn
	+iMaPGUHxQcU6wR4uF7y2Il8/063enZgrG5zKclkyMwyua10QhNh7aBeBpC9AIAQkaFqPYIJ+ljOu
	yFjFr3rm29Il15OA+1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0gi-00000008HsA-49Qi;
	Tue, 21 Jul 2026 02:58:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0gh-00000008Hrt-2Syz;
	Tue, 21 Jul 2026 02:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0779D419C0;
	Tue, 21 Jul 2026 02:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB8A1F000E9;
	Tue, 21 Jul 2026 02:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784602710;
	bh=FL5CGqbLgWSEbS6kX734MNF4vL+ica3pHW37Hpl8AN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=kyERwKYTLGFrgKgWOI9Srcy0pa69D+lYq4aGOgCb+o9EepqVCmYaAvZkH2plHKIaT
	 HKX6X1FiajmP3qBoGVkcU1ZHDTq9ykYdyGObzrscFVBxKXk56t0R0kRAz0vNnhqIkH
	 2aRNjb0y8aCCXvmll4XtUQ7CwUcgNMce2pQG7Fg/CwI7Gy86IwXdu+tfnzLrbAXjEE
	 gTBepq6wImyG8lBkJrPRX+YGy+xPoANzxsymbytflXjPG/YXfeOwCZYBu13n8D6u+w
	 XMB61aLfl32u/e3uQ5OeHZcQsjF7OsFbyPHK7za4tY7Ggh227SnUV6wjtBMmQs+R4P
	 25Sqe0fQzgpRQ==
Date: Mon, 20 Jul 2026 20:58:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "Dylan.Wu" <fredwudi0305@gmail.com>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
    anup@brainfault.org, alex@ghiti.fr, atish.patra@linux.dev, 
    zhouquan@iscas.ac.cn, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
    kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: ptdump: Move pagetable definitions to common
 header
In-Reply-To: <20260701085030.124579-2-fredwudi0305@gmail.com>
Message-ID: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
References: <20260701085030.124579-1-fredwudi0305@gmail.com> <20260701085030.124579-2-fredwudi0305@gmail.com>
MIME-Version: 1.0
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

Hi Dylan,

On Wed, 1 Jul 2026, Dylan.Wu wrote:

> Move the pagetable walking state and level definitions to a new
> arch/riscv/include/asm/ptdump.h header. This allows other parts
> of the kernel (like KVM) to reuse the ptdump attribute parsing
> logic.
> 
> To support different pagetable types (like G-stage), the attribute
> parsing logic in dump_prot() is updated to use attribute bits
> defined within the pg_level structure rather than a global array.

Could you please split this into two patches: the first, to create 
ptdump.h and move the declarations there and export note_page(); and the 
second, to make the attribute parsing and structure changes?  That will 
make the changes easier to review.  


thanks 

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
