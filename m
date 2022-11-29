Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C8CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qRpPYkhi1PTrtywY/z8iCsgwpNOL2hA2+/YqqBt6xE=; b=VzrXonAr5ThZIp
	pTl/6hfnPk54CT6L5869s2V/sopyFuwAScqBo3pqQAEUkjPjzepGhUpsSX8bGgOkVZ6zGGKtTDXgO
	o6Gpuo0BGwm2pdkHeQR3Bdtg7qbmBiKjgaTeRZKB3rb7kWWOXNtSamhC7vxVEBjtcPln9Cl7Pi5aS
	1bg6ghK/M8PvAMIZ4+ifDzAmHhKNbZRdvaNYcm6HoJ8JkTgvEFVCzSgwcjQ+q07kZqS9uIWy08naJ
	568QN5ezlj6+ECF+lkSGYn/sZI+HMTYlVJq2lHqzAmq0bWAlQisxjSKr0TRIbBGUbORwsah3Z6p93
	14PfJ1cl7C9ysR9g3sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03pX-00AH4J-Ns; Tue, 29 Nov 2022 16:51:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03ou-00AGiY-Pl
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:50:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 275C161811;
	Tue, 29 Nov 2022 16:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7C9C433D6;
	Tue, 29 Nov 2022 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669740655;
	bh=IdahP6huwuOhsZoNDIagIDmphdiN6quvNOXg01Cv/cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hpx8xwdEWqaVdWOJ8DwK5GqrwKyqe0pEZNF3ZGIGp5HZFg/v1O+Nh5BG4/hUCN+Sy
	 dmvbPcDYnH2TBYv0ZaKF35sHry+e5JpnLZT/wr3hyy/3a53Fx0EfifbDuZxtizzOqR
	 9Fp0F9xJz7+B1qKs0KczQFNV3PqzQ1C9DHDDQH2f3+MyENRzSfy2i5Yz0Wr62k1EA1
	 bkwpf1MgcouUi1QEJaFqMU7p0CsN/VQoSiSxRmjGaQNR5mbqsyJmwiWR6zev4DaB7D
	 jXxaCcZaR0LyriqoDq6RULZ7//uyMBAkzvNahTEtzcbwXXesSyUG+bP3TohU7zvTqc
	 rHQjF6WONHZPw==
Date: Tue, 29 Nov 2022 16:50:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, guoren@kernel.org, heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Subject: Re: [RFC 0/2] Putting some basic order on isa extension stuff
Message-ID: <Y4Y4aZUEhCch1Sg+@spud>
References: <Y4XvnHIPw8ZuBZEk@wendy>
 <20221129144742.2935581-1-conor.dooley@microchip.com>
 <20221129154832.27or3ywsx7npuqzq@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129154832.27or3ywsx7npuqzq@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_085056_911571_1154D048 
X-CRM114-Status: GOOD (  26.95  )
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

On Tue, Nov 29, 2022 at 04:48:32PM +0100, Andrew Jones wrote:
> On Tue, Nov 29, 2022 at 02:47:41PM +0000, Conor Dooley wrote:
> > RFC:
> > - I have not even tested this, I just did an allmodconfig
> > - I don't know if I re-ordered something that is sacrosanct
> > - I don't know if I changed all of the instances
> > - I didn't write a proper commit message for "patch" 2/2
> > 
> > With those caveats out of the way - all I did here was try to make
> > things consistent so that it'd be easier to point patch submitters at a
> > "do this order please".
> > 
> > I never know which of these can be moved without breaking stuff - but
> > they all seem to be internal use stuff since they're not in uapi?
> > 
> > @drew, I didn't touch the KVM ones - are they re-sortable too? My base
> > here is rc7 so if you did a reorder at any point there I'd not see it ;)
> 
> Right, we can't touch enum KVM_RISCV_ISA_EXT_ID as that's UAPI. All new
> extensions must be added at the bottom. We originally also had to keep
> kvm_isa_ext_arr[] in that order, but commit 1b5cbb8733f9 ("RISC-V: KVM:

Right, I knew that something had been changed in KVM land. It's probably
a good idea to say sort them all alphabetically apart from whichever
ones must be in other orders & explicitly note the reasons in-place.

> Make ISA ext mappings explicit") allows us to list its elements in any
> order, which means we could sort them in canonical order, if we wanted
> to. I think I'd rather have them in alphabetical order, though (they
> nearly are at the moment, except for the bottom two...) The only other
> place we have ISA extensions listed in KVM is in a switch statement,
> which of course doesn't matter, and it's currently in alphabetical order.

I did see the one in uAPI for KVM. Your idea in 2/2 of doing
alphabetical unless otherwise stated works for me as I just want
something concrete! If it works for the chief too, I'll resubmit and
drop the RFC...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
