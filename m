Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE14BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfhU+D5P//f93bo8mx1Z1glshReEiARbR9VWVbPlVjw=; b=Sj7akIEgEDk8dJ
	VNC5p1DZy3bhXWQgqZDuJJNBZwlCJBH9MJYXJMqSEcOO3gQNqPnMWuzOOkMgDTOmA6E4ks+fMpu0F
	8ZkXJT2VPKx8oImzlty5wNKSvSRmSjgAaFogHZb5EwHnKf2BvS90KytaupXt35WmjroYBeDHSK6Wo
	tzwa70odnT4AHE4hqkx+jvsy0/XR9sMVaF8CKef68sb3ozI+nKnETpoweb9Ub/ZsIalIj3LxEXYiW
	weYcSuhYpuMz1FfY1cqSm0/Ev1CJCCrMpaZNkB+fJKGT8eWOfWJI0hfFuvA9Lmiw6Mr5DpYTgxpne
	QvhnATsxeSVFZmo1sOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmXh-009K7Z-1P;
	Wed, 06 Dec 2023 07:42:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmXe-009K67-1a
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 07:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C386161B0E;
	Wed,  6 Dec 2023 07:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFCFC433C7;
	Wed,  6 Dec 2023 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701848517;
	bh=VWcLjdndihwJ1lairSLt4i225DLT92oa2lGQtFOVU/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCgFXbnAygRSN4e/Sboq3yK6XLi2YvAqhIvyC2sxgGurE+YAQYvh1RKaMqy1DI877
	 iwH8OMjICOXqFdhXUv81ipxjjYsrWn88nukFlHrhxY1JaXEAyLTPKfupjLetubdyca
	 8XEnRW06inNfANsX8b2ESSCGT9e6nLEdXLh9C3oqWDV3GeqSv6n+EIJ095FnD89dyo
	 Xq0sJjuq+/xU+1Dg8Ks/jMwBwrrODQIfm1fJlQDPmUMEta5qd1kY+Gdeh6PORE5+zg
	 LsdnedtLpUNW8A+XSMnD1ptTUlKLwr1NwJ+6bXKd8lBtBJeGwtRGzkSbKu1N9j2XOk
	 qmuEV3h6QSYfg==
Date: Tue, 5 Dec 2023 23:41:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, conor.dooley@microchip.com, ardb@kernel.org,
	conor@kernel.org, heiko@sntech.de, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
Message-ID: <20231206074155.GA43833@sol.localdomain>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
 <20231206004656.GC1118@sol.localdomain>
 <434A2696-7C9E-4D13-9BEE-25104D37E423@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <434A2696-7C9E-4D13-9BEE-25104D37E423@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_234158_571218_64EADFD9 
X-CRM114-Status: GOOD (  19.48  )
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

Hi Jerry,

On Wed, Dec 06, 2023 at 03:02:40PM +0800, Jerry Shih wrote:
> On Dec 6, 2023, at 08:46, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
> >> This series depend on:
> >> 2. support kernel-mode vector
> >> Link: https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
> >> 3. vector crypto extensions detection
> >> Link: https://lore.kernel.org/lkml/20231017131456.2053396-1-cleger@rivosinc.com/
> > 
> > What's the status of getting these prerequisites merged?
> > 
> > - Eric
> 
> The latest extension detection patch version is v5.
> Link: https://lore.kernel.org/lkml/20231114141256.126749-1-cleger@rivosinc.com/
> It's still under reviewing.
> But I think the checking codes used in this crypto patch series will not change.
> We could just wait and rebase when it's merged.
> 
> The latest kernel-mode vector patch version is v3.
> Link: https://lore.kernel.org/all/20231019154552.23351-1-andy.chiu@sifive.com/
> This patch doesn't work with qemu(hit kernel panic when using vector). It's not
> clear for the status. Could we still do the reviewing process for the gluing code and
> the crypto asm parts?

I'm almost ready to give my Reviewed-by for this whole series.  The problem is
that it can't be merged until its prerequisites are merged.

Andy Chiu's last patchset "riscv: support kernel-mode Vector" was 2 months ago,
but he also gave a talk at Plumbers about it more recently
(https://www.youtube.com/watch?v=eht3PccEn5o).  So I assume he's still working
on it.  It sounds like he's also going to include support for preemption, and
optimizations to memcpy, memset, memmove, and copy_{to,from}_user.

I think it would be a good idea to split out the basic support for
kernel_vector_{begin,end} so that the users of them, as well as the preemption
support, can be considered and merged separately.  Maybe patch 1 of the series
(https://lore.kernel.org/r/20231019154552.23351-2-andy.chiu@sifive.com) is all
that's needed initially?

Andy, what do you think?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
