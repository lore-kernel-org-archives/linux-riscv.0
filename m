Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA2D39011
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXK33nH5jUKbo2TviavRWU5Hv3Hap9HpGRoch3scydQ=; b=XZ+RLXICnRBjg6
	4AEK9u64tipBe9em94ONCMngg73kJAxXMuiLJBhbzWWUXQSoyosh5YBpIiAkuHse9qYhyGs2sOHOm
	Mvaubm4UGwCKnJOBR87qP53kqw4hv8QXHhoImjdL2tBcaDwJNgkg0s6HtCxhdhvF8b01424Md0a7W
	DMjUmEjZw+HZiZg0dUs9iyDPH/sedBk8/KwZt3O7ldHIdJOjpgMpfyF5oizyrJo3bImCTWblZoCow
	oD7sIt768QC1/wQQBmZdlOrlAtSanufp5Q7nvUEz4bquEkNWy5Q4SFfXJMgTjUYshaElI5uKDJKWt
	7/txvTG/mo5dzN3ZnPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Rn-0000000AccO-0H4G;
	Wed, 14 Jan 2026 20:26:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Rl-0000000Acc4-3uZ6
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB9E36001D;
	Wed, 14 Jan 2026 20:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6922FC4CEF7;
	Wed, 14 Jan 2026 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768422388;
	bh=vqV4X8FhiR5xcn/VfYKZH7uJhedDHMIagvNMHSYct+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BowvJ5Lt+EveWVyK2CKuOM6zhOHt/rj8qJW3wbmmFExumGGn+L3pSZ6vRMI2Wt9R1
	 /ud9nrrtreTFJaKypzi9j/r7wGYvV0Awa10GSqZw8elT9DTgk+LD1a12ecBfRg5gHl
	 lK0PsQ3jc2moVL0/Ioxx4friGsCGt1/dM66EIsyLgJKY81WndC9jC+yr+ElqABzC/Z
	 kztZVOxYBPTjMN72eXYdsjssThesXNusNZRJLvN10d7y4g1XPZyvIudBItRScOrFV5
	 2XzuMtbEm+2pn7Xc/GvB9PjAIZ/knzTcSOuXJqoWF3yGw2QiVPZDu2yWasA5lkdiM+
	 7pSDs5jon0VxQ==
Date: Wed, 14 Jan 2026 14:26:27 -0600
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Message-ID: <20260114202627.GA3155416-robh@kernel.org>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
 <20260113002123-GYA19926@gentoo.org>
 <20260113-swarm-mama-cbd7d0546578@spud>
 <20260114021405-GYB25466@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114021405-GYB25466@gentoo.org>
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

On Wed, Jan 14, 2026 at 10:14:05AM +0800, Yixun Lan wrote:
> 
> On 22:17 Tue 13 Jan     , Conor Dooley wrote:
> > On Tue, Jan 13, 2026 at 08:21:23AM +0800, Yixun Lan wrote:
> > > Hi Conor,
> > > 
> > > On 21:45 Mon 12 Jan     , Conor Dooley wrote:
> > > > On Sat, Jan 10, 2026 at 01:18:12PM +0800, Guodong Xu wrote:
> > > > 
> > > > > Hi, Conor
> > > > > 
> > > > > For the binding riscv/extensions.ymal, here's what changed in v3 (no
> > > > > change in v4):
> > > > > 
> > > > >  1. Dropped the patch of adding "supm" into extensions.yaml. At the same
> > > > >     time, I will start another patchset which implements the strategy
> > > > >     outlined by Conor in Link [2] and by Samuel in Link [3].
> > > > 
> > > > Okay, that seems reasonable to separate out.
> > > > 
> > > > > 
> > > > >  2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
> > > > >     6 others. "sha" implies these extensions, and it should be allowed
> > > > >     to be declared independently. Like "a" implies "zaamo" and "zalrsc".
> > > > > 
> > > > >  3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
> > > > >      - added the dependency check of "ziccamoa" on "zaamo" or on "a".
> > > > >      - added the dependency check of "za64rs" on "zalrsc" or on "a".
> > > > >      - added the dependency check of "ziccrse" on "zalrsc" or "a".
> > > > >     The commit message of this patch is updated too, to better explain the
> > > > >     relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
> > > > > 
> > > > >  4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making the
> > > > >     dependency check in both directions, as discussed in [4]. Since "b"
> > > > >     was ratified much later than its component extensions (zba/zbb/zbs),
> > > > >     existing software and kernels expect these explicit strings. This
> > > > >     bidirectional check ensures cores declaring "b" remain compatible
> > > > >     with older software that only recognizes zba/zbb/zbs.
> > > > 
> > > > This I asked about in the relevant patch, I would like to know what your
> > > > plan for adding the "b"s is.
> > > > 
> > > ..
> > > > Spacemit folks, I assume you weren't planning on taking the
> > > > extensions.yaml stuff via your tree? If you weren't, I'll grab it once
> > > > the question about b is answered.
> > > 
> > > sure, please take extension stuff which are patches 6-9, for 1-5, it's
> > > all about adding support for SpacemiT K3 SoC, to avoid petential conflicts,
> > > I wouldn't mind if you also taking them? then I can handle the rest 10,11 for DT
> > 
> > Stuff for spacemit is either for you or for the relevant subsystem
> > maintainers. You're probably safe enough taking the
> > timer/interrupt-controller stuff if the maintainers don't apply it in a
> > reasonable period, it's not abnormal for those in particular to go via
> > the platform maintainer in my experience. Just be clear that you have
> > done so. I'm only interested in taking 6-9.
> Hi Conor,
>   Ok, I got, thank you!
> 
> Hi Paul Walmsley,
>   I assume you're responsible for more general riscv stuff with your
> effective maintainer hat, so do you mind if I take patches 1-5 via SpacemiT
> SoC tree? I think the potential conflicts should be low and easy to fix.
>   Or, in the other hand, just let me know which patches you would like
> to take, then I will handle the rest. Thanks

Paul would generally only ever take patch 1. You can take 1-5. The timer 
and interrupt-controller bindings tend to not get picked up by the 
subsystem unless there are driver changes too.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
