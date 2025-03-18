Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF6C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuOduKbjf9eDJJgPqPYW3UD9GAnmEeKn81rV2UkWKSM=; b=bubXxBdkqsPK7Z
	hRcjpDLxAYHLS3v69FZ37Gq4Xhfw1Bysyc10pwdKTfpKWZP0NSBjGB93PBhWul12nstCcAfAGBxoQ
	AIOX5F5dJP68dXRXI/Pw3yO5+0Y3537kPewvXIcDhIiKYsEqOTPBhWCUrOUGQT5pfnr115YWcxu5U
	FIBF9/Xyuv0uRsegr4aMgk3LtVJAwRj1HaoSiOueGT1X8rhRa7upZwLf5EF8LrhruVOOWT6ut9+Sk
	MQ/J/S6tzuUaOJn6Zh8q7FrPSZs8BuH0bBxDWbj6zw3pLHxrhWraiX+dDUMKNEtjMU9nG4xhNVRly
	VQyL39Pbtg4FR+lcOxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuegY-000000078xN-3PQI;
	Tue, 18 Mar 2025 21:41:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuegX-000000078x0-16io
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 21:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 978B461586;
	Tue, 18 Mar 2025 21:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868E1C4CEDD;
	Tue, 18 Mar 2025 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742334076;
	bh=BEXxbDACahqR6NIWAUeOiMICou1IfERSdqow0dpWsxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhGpH2I1ueS9/GTixrWDP38+d0Hx2m1vLtecLXyqlvMmZ1TbxwTGgilNBv94gBEUd
	 nUvjB8hoqrISm3V37ui8Dwjx1L8VGwWGhQz4M9CrP5WfkGSj11uO5DrtVWizHnqKvW
	 tBArcC+K+Uru3mSPpcWyF+3rm8tDofMbnTDqFkjPfIRKWgrLr+aKyMQHHlVLHwFPTF
	 2g2UZNRHIflzb7WaMcsRtZxraIDvE5ABhFS/hxWkZxS5Lk6sVm3ldg4mUwZczdu/jn
	 gZ6Adoear+N0OB9HGDfn5E0bWPDVq3SVsmiHwzPGVAJ5cgtGZ8WXDjObIr69DM7SYc
	 v5w6lwSzIag+g==
Date: Tue, 18 Mar 2025 22:41:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
 <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 18, 2025 at 07:04:19AM -0500, Alex Elder wrote:
> On 3/18/25 12:44 AM, Troy Mitchell wrote:
> > > I'll leave it up to the maintainer to decide whether these
> > > comments can just be ignored--my Reviewed-by is fine, even
> > > if you don't change these.
> > > =

> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -Alex
> > I know it's right what you said.
> > But I don't know if it's worth to send v8?
> > Maybe I can fix it when I add FIFO function?
> > If I'm wrong, let me know.
> =

> Unless the maintainer wants you do do v8, please just
> address these suggestions later.  Thank you.

it's easier to just send it rather than asking for a v8 :-).

What I care more is if you would give an r-b if your last
comment was addressed. If so Troy still has time to send a v8 to
get the series in this cycle, otherwise I can change things
myself before merging.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
