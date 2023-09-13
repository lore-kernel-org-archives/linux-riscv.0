Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D99EDEC72
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHIQDEpQqtTRfnmciOXZ7t9BHP02Q0rSEdtK8WbNF4A=; b=btdckpPBg+yw25
	9QbTXJjUwemqpE8cko9n4HXINcP33Lpf8FjPlmbSEefFS3dr6bl3mwtcEDWs77OJx4QeOLK9sBzJC
	O6AO1k9LOL4r9uyAMSFl6DRCHzE8/HUTfzJn9G64NE03xilDUJbWKy26CYy5CpKy7j5nYgJOrJLo3
	D1BVtBnGRSLTDswlgcflVoMf8IbGVXh81AN6+GLMl2Cx2i9xeAhcQjgeoMSdqPRH6lSLy+55V8Mzj
	A9XzStjFCsduulq0trrQx5OI7AoKdlT9RkU49EYislcUBI5AgPQ6naxrB0ZqP+HUYrIvZ7IJssiJO
	7GtJOaRcTlAFRyTaVJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRhy-006DN3-1Q;
	Wed, 13 Sep 2023 15:23:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRhv-006DMe-1F
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 15:23:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9F006198B;
	Wed, 13 Sep 2023 15:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31579C433C7;
	Wed, 13 Sep 2023 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694618590;
	bh=rTDubEPSO7C5OrRvCZeEBuvDLS4ZQYVWd1nR0QwCEY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvyGPH4CUv34d3uDhsPsYHmOJJ4k1LnrN0Pgav5X0EP8OrcjaNYoMz71n1IeN6TCY
	 x4ZmQnJcGUdu1wSPqp7Rp9VfnyCjxF3WmoiPwLH7NsLnE4A0liJZy923VBDvNM8Hjk
	 eq3WPjT/5bjpmJ9N/TIGbMsqb8A3erEP4+EKfdbQKRYiPWXcpRSLMKvQaaGJJ3ChEV
	 i8wCpNjQo2mIdfn1QMdU8yQt6S2s9pF1J8XhHFQgHntRpdTlm4buZ+L5HLT+GXM8DM
	 8o5iUfIajdpNDdebuXi+7jlFFBASjxNXoDSF0p7wneCb3/JoUiquF7qWomqvwWrXzH
	 LKrGwDsSbPq6Q==
Date: Wed, 13 Sep 2023 23:11:12 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, PalmerDabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>
Subject: Re: boot time regressed a lot due to misaligned access probe
Message-ID: <ZQHREHx4XCN70iUq@xhacker>
References: <ZQD+0BWNU8wlnC9d@xhacker>
 <17d351c6-e6c3-43ce-a466-691778ba05c3@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17d351c6-e6c3-43ce-a466-691778ba05c3@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_082311_467661_FA2FD483 
X-CRM114-Status: GOOD (  18.94  )
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

On Wed, Sep 13, 2023 at 11:46:28AM +0100, Ben Dooks wrote:
> On 13/09/2023 01:14, Jisheng Zhang wrote:
> > Hi all,
> > 
> > Probing one cpu for misaligned access cost about 0.06s, so it will cost
> > about 3.8s on platforms with 64 CPUs, for example, milkv pioneer which
> > is powered by sg2042.
> > 
> > I'm not sure the reason of probing misaligned access for all CPUs. If
> > the HW doesn't behave as SMP from misalligned access side, then unless
> > userspace processes force cpu affinity, they always suffer from this
> > non-SMP pain.
> > 
> > So, can we only probe the boot cpu?
> 
> So a couple of ideas:
> 
> #1 is it worth adding a device-tree property to explicitly to say if
> the unaligned access has been measured and known
> 
> #2 only probe one cpu in a cluster if there are multiple clusters of
> cpus?

and #3 Could userspace who cares about misaligned access probe the
speed itself? And this reminds me the arm case: old armv5te VS armv7,
there's no such probe in arm yet.

> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
