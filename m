Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F747C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPyrStXq8vYj/yJSRrk/O48Pz1DGMxuaSMOTM6DJres=; b=n12rD3qs1O3LPl
	XnSBdjciXCc4CMPkzRtUruC8zZI3GpHgg5pqRKTgHg+WsPuiL10GbBi6EcnuQjBzTAIAjPEe5mXCp
	h7i+fnfsvhROfwPSxlWZ3SvaWkZvG3YXdXn0NBherc47UJay+AA7atrVflW1PGZ3brQ3jK4eFye48
	JWYdYKCbtLZgKToWp+s8YR7+dayCj/Dg8BW7yUHnKbOAVJMZ+90KMy5LCCsTYH+GYRDOdUhp3RXIw
	usHBqzly1cbxdqAVK7CZA1vUuzUxRXG7t0ZvZZAfaqls+6IbvR15RroDlrmwf1PwXid2F28j61sJo
	tSk0QDwe+6QocCK2Jjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMW1W-0041ZE-LB; Mon, 30 Jan 2023 15:24:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMW1V-0041YU-Az
	for linux-riscv@bombadil.infradead.org; Mon, 30 Jan 2023 15:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l/UE1BohSbsYPSjuqli4vf8tirXZJGoVCmdHLEf4q2s=; b=f8aP+RFjS52Fxxq6I01TNC2w1E
	5jN4u+I+N01Ci4f09xlt4KIJ9tHTmfAO94SuJcbvTn+zcMt2w1+YFr6fZ95HwKKK+UOcnIW3lR/Na
	avmtpoKYS12t4vAMr2NH+kvHUs67h2uIgoj8frrP7vZpAyZvX1vYVex+XFUw+cOybgPPhpLGFmIoi
	R66WcpMp9bytp0uBRp0STXT1B7yS5ICYN4CF/lpMzQVF+sphmviMwklrlVNOWmGNKZth8+B40kAHR
	exuq2dSOhDPlMNBzcyDKhLQ4SOxDXHlREa2CnYup1aWTuoimj2nDXOXIs5hkOeRNUxBuJuqYIgBd3
	Gp0Gi63Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMW1Q-00ASYH-IK; Mon, 30 Jan 2023 15:24:40 +0000
Date: Mon, 30 Jan 2023 15:24:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linux-MM <linux-mm@kvack.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Message-ID: <Y9fhOFEV0kS9U06/@casper.infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
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

On Mon, Jan 30, 2023 at 10:53:28AM +0000, Lad, Prabhakar wrote:
> > > To avoid this the ILM/DLM memory regions are now added to the root
> > > domain region of the PMPU with permissions set to 0x0 for S/U modes so
> > > that any access to these regions gets blocked and for M-mode we grant
> > > full access (R/W/X). This prevents any users from accessing these
> > > regions by triggering an unhandled signal 11 in S/U modes.
> >
> > I have no idea what any of this means.
> >
> Basically we are making use of the memory protection unit (MPU) so
> that only M-mode is allowed to access this region and S/U modes are
> blocked.

This sounds like RISC-V terminology.  I have no idea what M, S or U
modes are (Supervisor and User, I'd guess for the last two?)

> > > This works as expected but for applications say for example when doing
> > > mmap to this region would still succeed and later down the path when
> > > doing a read/write to this location would cause unhandled signal 11.
> > > To handle this case gracefully we might want mmap() itself to fail if
> > > the addr/offset falls in this local memory region.
> >
> > No, that's not what you want.  You want mmap to avoid allocating address
> > space in that virtual address range.  I don't know if we have a good
> > way to do that at the moment; like I said I've never seen such broken
> > hardware before.
> >
> > I'd say the right way to solve this is to add a new special kind of VMA
> > to the address space that covers this range.
> Do you have any pointers where I can look further into this?

Before we go too deeply into it, how much would it cost to buy all of
these parts and feed them into a shredder?  I'm not entirely joking;
if it's less than the software engineering time it'd take to develop
and support this feature, we should do it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
