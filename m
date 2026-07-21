Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31458C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 03:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfFhb9F+0mey13uT1urXnfEEklErICjVQqpPJoH7/ys=; b=KA4uV9eYJgWHX1ZUeFY5f2CIjH
	rUTGs3I1gGjBPX824ot9iq3z/NgiEijsU4hZtqFPuCPJu72B2Xy6SBtpIMYbTdvZiDjjJ0cIFgSNA
	dQ7tsn+exuvAIl+pYKgpzbKuBtplvDEOXQ3zHWJbUHV6BQWUK4r7imlF9v10wINtwTqhuyNZvMpC6
	vDiBlK7VUjXm0tOgVTLweoHy8ia05EyRSXeu2+tljqNtFZWdF8NfFqmlNHu4s38aL9La/kJwZ/RIK
	gagpqhXU+jFuOa2988KkUHTfXbtEaQyfgBxPs29EKNNIW9WAdBsac/xlIPAXuT8w1/GF89hIKBArt
	W2Fe7DuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0wX-00000008J5D-0FvQ;
	Tue, 21 Jul 2026 03:14:53 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0wU-00000008J4U-1C79
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 03:14:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784603685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ws6R9xlrB7HNBXGvEpjJ8lMU2yDFgA7S9WmBKoyu3SY=;
	b=Z5Jq8GZdaU0lp4+7nNlRIbjM1ov6T6A8+vX0dZa/fJ26ilDRLEZ4/oizLpnwbIJP7bWF+e
	gVy11x7WObXjfnva+NjWYY5oakOYyb0OfcuC2ZlyU+r3q1/CuUhpAYBqeDebGGcp3e4OAJ
	unlz+0o0lKG24ovFgTCBlAHrLSho+yQ=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: andy.shevchenko@gmail.com
Cc: alan@linux.intel.com,
	asrinivasan@oss.tenstorrent.com,
	fushuai.wang@linux.dev,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	jackzxcui1989@163.com,
	jirislaby@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	osama.abdelkader@gmail.com,
	sean@mess.org,
	wangfushuai@baidu.com
Subject: [PATCH v3] serial: 8250: Clear CON_PRINTBUFFER on port re-registration
Date: Tue, 21 Jul 2026 11:14:27 +0800
Message-Id: <20260721031427.53396-1-fushuai.wang@linux.dev>
In-Reply-To: <CAHp75VcTs2Vro3vg8dqmYfRebk6bBfmJCZFBgD2KMHpTKY6jvQ@mail.gmail.com>
References: <CAHp75VcTs2Vro3vg8dqmYfRebk6bBfmJCZFBgD2KMHpTKY6jvQ@mail.gmail.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_201450_529663_1425BA7A 
X-CRM114-Status: GOOD (  21.10  )
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
Content-Type: multipart/mixed; boundary="===============5946875944806748110=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5946875944806748110==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

> > On Fri, May 22, 2026 at 06:10:42PM +0800, Fushuai Wang wrote:
>
> > Seems like this patch was added in next-20261717.
>
> 0717
>
> > I'm noticing that this patch is causing no serial output to be visible
> > on riscv boards till the uart device is registered. Normally while
> > booting, we expect for all the prints made before this to be
> > buffered and appear post serial device initialization.
> >
> > => booti 0x11000000 0x21000000:${initrd_size} 0x31000000
> > Moving Image from 0x11000000 to 0x200000, end=1ca6000
> > [ 161.301] ## Flattened Device Tree blob at 31000000
> > [ 161.302]    Booting using the fdt blob at 0x31000000
> > [ 161.307]    Loading Ramdisk to 7653e000, end 7dd81853 ... OK
> > [ 161.366]    Loading Device Tree to 0000000076532000, end 000000007653d25d ... OK
> >
> > Starting kernel ...
> >
> > [    0.235159] printk: legacy console [ttyS0] enabled
> > [    0.238787] /soc/i2c@d401d800/pmic@41: Fixed dependency cycle(s) with /soc/i2c@d401d800/pmic@41/regulators/buck5
> >
> > Most devs who are debugging might be booting with the earlycon boot
> > parameter. If earlycon is present, serial output is present, but
> > with earlycon missing (which is what most distros use), I don't get
> > any serial output till this point.
>
> Perhaps it's inconvenient. Logically I support using earlycon (I have
> noticed a few times in the past double printing of the kernel buffer
> to the serial console). So I tend more towards that this patch
> actually gives a better experience. However, I haven't given any tag
> to it, nor do I object to any improvements or reverting to the old
> behaviour — your inconvenience will become mine :-)
>
> Just my 2c.
>
> -- 
> With Best Regards,
> Andy Shevchenko

Hi, Andy and Anirudh

Thanks for the report. I only tested this on x86 and don't have a
RISC-V environment.

I think this patch should be reverted in -next. Since I haven't done
this before, could you let me know the proper way to handle this?
I'll also explore a better approach later.

-- 
Regards,
Fushuai


--===============5946875944806748110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5946875944806748110==--
