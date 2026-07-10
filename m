Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E352CC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 02:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EA8v/QxkUQhoBO85OpODJKmQz4TKiD3ouyFKSVh1sPo=; b=xxnZ7mlN8iCUoD
	18DnBQVhlEIWEqZ3jUeBLAZIV2V+oJDC30/lK2K2Iabggzkbd5v1uH8zWlKTSe1f2wP0qdHEWVGSI
	CIFIRndQ4k8g6WuIzM2Hb/l9etJXeqJd7RgGeLthDPCzVlnb8aV/vJULO1/x96rSbaGKUtyEAkMKW
	RulPGgvTHxTpg6yb8AAUERlOFHDCgBil52u/EL7MqBgAeN+q+GXUQeI2LbcjqRQBdV2QnMmVWHOkI
	2hjXPRwCNLTEgmYocOYVXwtD4hOF+YsJzvUMcToZGijHbYQw3qxM2GCn67sz88aMDYN75ns+Rw/9H
	cSEpadVChNWVXHNt2sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi14a-00000003yC7-3FLm;
	Fri, 10 Jul 2026 02:34:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi14Z-00000003yBy-21bO
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 02:34:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A7EE6001A;
	Fri, 10 Jul 2026 02:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4071F000E9;
	Fri, 10 Jul 2026 02:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783650877;
	bh=h8BzesiviP7RD/FCfwHOrakN0QE3cmxepvmeCHk4/Lw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WnY3ZLCzuC5g/aI0wvLMojKDbgDgHUyL2g5iVtSbwLyvf+E1cydeTAaWtt9JG+HIg
	 RDYNOgQ6QmWVd42SPoY8zjQvZdfO89MTkDn1vydyVB1VCdwJAUuKxEeBLeguSrojcX
	 W6oV0NXaFvaugatsLbkCqKEqX6iIZMNtHW9q3/mM=
Date: Thu, 9 Jul 2026 19:34:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
Message-Id: <20260709193437.701fac04e878b34d75ab101b@linux-foundation.org>
In-Reply-To: <b7ab255d-8d0a-24f7-2953-4f5decf11432@kernel.org>
References: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
	<20260630211100.5c8f09c607595fbb5bca0a74@linux-foundation.org>
	<cd8cd425-7615-49a2-b26e-81a9aff0af28@iscas.ac.cn>
	<20260630223332.534218a41b2f574de327e4db@linux-foundation.org>
	<b7ab255d-8d0a-24f7-2953-4f5decf11432@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Thu, 9 Jul 2026 20:00:08 -0600 (MDT) Paul Walmsley <pjw@kernel.org> wrot=
e:

> Hi Andrew,
> =

> On Tue, 30 Jun 2026, Andrew Morton wrote:
> =

> > On Wed, 1 Jul 2026 13:01:15 +0800 Vivian Wang <wangruikang@iscas.ac.cn>=
 wrote:
> > =

> > > which made it miss:
> > > =

> > >     Changes in v4:
> > >     - Rebase on v7.2-rc1, drop dependencies
> > >     - (No code changes otherwise)
> > >     - (A concurrency fix for mark_new_valid_map was sent independentl=
y)
> > >     =A0 https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-val=
id-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
> > >       ^--- this
> > =

> > Cool, I grabbed that.  Same caveats: riscv maintainers, please?
> =

> I just responded to Vivian's v5.  I guess he'll probably do a v6, at whic=
h =

> point, will plan to queue it for v7.2-rc here, unless you have any =

> objections?

Go for it, thanks.

When I see a version of this pop up in linux-next I'll drop the mm.git
copy.  This is my standard procedure.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
