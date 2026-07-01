Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF3DC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKnhZVH6692TKDT1BZ1wy3jp9+OaQYgI5hawxX5Vcu4=; b=xD4qf6O0KXEKrf
	enr/Ca+5k2bcT6NVeMCN2uWxuyY92h4JU3bx08IKdZA7nn3UElkBfg+buqLff/XXxTT6uHfnBaGMx
	/uskm5Z42u69ler/C5QoYZz7M0mYpncGFybCqGNVmQrlSoSD/skQSRxE1CBkOJntOfU/b6X+FQ/2d
	wcBlFKW7xYjPYpNbKfsenToxZP/7kFZCzfIm71qIZYmM4wZt8awoh6dO7trDcpMeH1Qop5YUnWGfr
	Z6K9zHJ11CXUimUpOLf0GRM13oMFHGkx1KsicusStkjFeYBXvofyL1W2LbAaJxDeVKWsj/ol2kFaK
	XEHWkax/cC4/N2zIZOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenZo-00000000gMY-1jVs;
	Wed, 01 Jul 2026 05:33:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenZm-00000000gMS-1siZ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 05:33:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95F2940353;
	Wed,  1 Jul 2026 05:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E1E1F000E9;
	Wed,  1 Jul 2026 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782884013;
	bh=e8x0DVh72346v4T65zlhFNs55tqSgEr6iUQN+gRodPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AWvtcZHzIS2f1Cz8Ls7N77oIWgF5XOElmjHIPsbBdQ+CcyM6UdcSEgScBL2T3WKJt
	 7pdbEd4uS1oottAlHKYpp/Ncu2yOp401whXb0V9YucSMlbtqjfSJ8L0LZh7ln4rDuR
	 VYxjA2ytOJPJfb1yvIxjwv0lew/fcm3IkGp1kM6M=
Date: Tue, 30 Jun 2026 22:33:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
Message-Id: <20260630223332.534218a41b2f574de327e4db@linux-foundation.org>
In-Reply-To: <cd8cd425-7615-49a2-b26e-81a9aff0af28@iscas.ac.cn>
References: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
	<20260630211100.5c8f09c607595fbb5bca0a74@linux-foundation.org>
	<cd8cd425-7615-49a2-b26e-81a9aff0af28@iscas.ac.cn>
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

On Wed, 1 Jul 2026 13:01:15 +0800 Vivian Wang <wangruikang@iscas.ac.cn> wro=
te:

> On 7/1/26 12:11, Andrew Morton wrote:
> > [...]
> >
> > btw, AI review suggests that there's a missing barrier in there (a
> > pre-existing thing)
> >
> > 	https://sashiko.dev/#/patchset/20260630-mark-after-vmemmap-populate-v4=
-1-febbc15da028@iscas.ac.cn
> =

> Interestingly, whatever thingy that is sending patches into AI review
> seems to completely strip the message below the "---",

Hey, what do you expect for $2,000,000,000,000?

> which made it miss:
> =

>     Changes in v4:
>     - Rebase on v7.2-rc1, drop dependencies
>     - (No code changes otherwise)
>     - (A concurrency fix for mark_new_valid_map was sent independently)
>     =A0 https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-valid-m=
ap-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
>       ^--- this

Cool, I grabbed that.  Same caveats: riscv maintainers, please?

> I've reported "being able to read below the cut" as a feature request to
> Sashiko: https://github.com/sashiko-dev/sashiko/issues/306

I'm not sure that Sashiko would grok (heh) this if it was above the
cut.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
