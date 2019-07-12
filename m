Return-Path: <SRS0=eLsP=VJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53272C742D1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 17:16:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26FC02080A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 17:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQTIWJMf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YT2j/iU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26FC02080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7z2yPu+egQkWkfg7VYYf092DoOlteLRmgAKE0oPAxt4=; b=WQTIWJMfj8Wc8j
	NxB81Ya2lJC1mefu5uxFx4qQbqaPknoEOZx4P2FtdSqVvNz/Ze9jq866kxVxJPYGYjRNmvew+/t63
	f0HVH7OpcPQdCqueMKcVlyxrLSeWC4afGSPMBq5YArEXZTRm6DZpUXp84eJw3Rng+naF0wWdEuhBd
	tKtuVVJxms5DnNvxhnQy6al6i7o3yOdLT0qBgnurAXzozLObMqFQIWIcDy7jmiiFi/KKqAAOsZ8OE
	uYnAw3t2VJpqDRhwNcPFavYoY5ayfbf/BDiUr/457e8tbB4ovxnyix1psDXL6hYFkjKmm/8FgizSp
	xdch9fPg3USa22tjNkIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlzA8-0003VA-O7; Fri, 12 Jul 2019 17:16:48 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlzA5-0003Tm-4X
 for linux-riscv@lists.infradead.org; Fri, 12 Jul 2019 17:16:46 +0000
Received: by mail-io1-xd43.google.com with SMTP id i10so21854683iol.13
 for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2019 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iXtdpQd8nnhs4LGXKgAYAQvupi8/WOX4e9Rzt2Cr9CU=;
 b=YT2j/iU40MxuBBXO9lb5IQbBE5jrkfnrRY9xLOdGAaikbSdl2YU6uISPilY0ddfipw
 SPtU62qkG3Z5Z3Ogc2azK7ti8QpOISRgUsmIIABxcIsT1X+rWxrTo6IzUEhlO1bsVrAX
 IveXj25vZsg7hNSxNfVrqRhQ0scEmYofrPVcosq7oaf1o1lzV41Pxc/GvnY5xxtmwY2K
 fevC+u/BdbIWXOzlfkUy2QZuiBwhUm4UUuihyenGCKdHe92z/Ub/e3biIlISfJPE1eXI
 plfC/5M62ssyRlos7GBsgbXMMsn21QEaFARhtqdvHLFp5TTp0Ko2bKH5YUaAl4pEeEEd
 ub5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iXtdpQd8nnhs4LGXKgAYAQvupi8/WOX4e9Rzt2Cr9CU=;
 b=aUTuD4wB3UzMfOVXNrvoBFLmgK9p/bwJn4ay2l8actcYcUAC1wsD/v1tEH6Re87eW4
 oY9PGpgu1TYHZ61IqnzayOa7+AHo/wn0k4kGrAqvZua/xJ3O9mHjSgRv4otuJDtaXO9G
 etRJxCe09hCy0JAAo9EgQ8ZKrKXTklF3BtYhCCoBMIz7xwspCV/BNs8zcHdRNy6Cynwt
 nLYbCPb3uiOTL/+l1Vjpew0ybr3ga6s0GbKLlsNDh4eXycGwLiQcBmAKddd1l17wRKBp
 IiNL8oJlKFOOvyqUxFFeSiyND0eKaCmirfvMy3BfAEGyquCtTjtTcgfJBFO7v2b5oCVu
 9vGQ==
X-Gm-Message-State: APjAAAVQbQ8yY3MeAsW8hBizAD9NFKQdoYHSfPNl2c4vfjGveDcUnalU
 3jwop/1wRSXVl5vBgThusts8SQ==
X-Google-Smtp-Source: APXvYqxp30Df9fi24c2tRwl/AdFAuK1PmmHMpS9VUIm5CnVMt7nYgcOw7iNzakTGt5JdeoZaczA5TQ==
X-Received: by 2002:a6b:7d49:: with SMTP id d9mr12058493ioq.50.1562951801913; 
 Fri, 12 Jul 2019 10:16:41 -0700 (PDT)
Received: from localhost (67-0-62-24.albq.qwest.net. [67.0.62.24])
 by smtp.gmail.com with ESMTPSA id c81sm13381678iof.28.2019.07.12.10.16.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 10:16:41 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:16:40 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v8 0/7] Unify CPU topology across ARM & RISC-V 
In-Reply-To: <20190627195302.28300-1-atish.patra@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1907121012050.2267@viisi.sifive.com>
References: <20190627195302.28300-1-atish.patra@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_101645_194445_68C710DA 
X-CRM114-Status: GOOD (  17.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Anup Patel <anup@brainfault.org>,
 Russell King <linux@armlinux.org.uk>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Folks,

On Thu, 27 Jun 2019, Atish Patra wrote:

> The cpu-map DT entry in ARM can describe the CPU topology in much better
> way compared to other existing approaches. RISC-V can easily adopt this
> binding to represent its own CPU topology. Thus, both cpu-map DT
> binding and topology parsing code can be moved to a common location so
> that RISC-V or any other architecture can leverage that.
> 
> The relevant discussion regarding unifying cpu topology can be found in
> [1].
> 
> arch_topology seems to be a perfect place to move the common code. I
> have not introduced any significant functional changes in the moved code.
> The only downside in this approach is that the capacity code will be
> executed for RISC-V as well. But, it will exit immediately after not
> able to find the appropriate DT node. If the overhead is considered too
> much, we can always compile out capacity related functions under a
> different config for the architectures that do not support them.
> 
> There was an opportunity to unify topology data structure for ARM32 done
> by patch 3/4. But, I refrained from making any other changes as I am not
> very well versed with original intention for some functions that
> are present in arch_topology.c. I hope this patch series can be served
> as a baseline for such changes in the future.
> 
> The patches have been tested for RISC-V, ARM64, ARM32 & compile tested for
> x86.

Since these patches touch files across several different architectures, 
and thus really should sit in -next for a while; and because it's late in 
the merge window, I'm planning to postpone sending these patches upstream 
until after v5.3-rc1 is released.

Once v5.3-rc1 is released, let's plan to get these patches rebased and 
reposted and into linux-next as soon as possible.


Sorry for the delay here,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
