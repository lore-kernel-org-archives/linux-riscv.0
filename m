Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F527C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 09:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44352082B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 09:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdhUpDUK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44352082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjKhG0yEJ5ZrET7u4RWPessn05v6lYK+dhFpDVK7HOk=; b=NdhUpDUKnE9Gx0
	qbUhyNdwirD/h5WWIdl1FVzOq2Z6ljpyqJYNc0kpYJww0HRWarTOLgPYHNZPsoVv9v39SAQ9EKHL+
	anMvc3GZXU9GCyBISOkpSl0EGmPmE0PHWdpJIz5XQ0UfP4uu3lzTcLa5ujGTixW9qqXdp+WKkTeOG
	VvF+g8mCQvsvgMMhV74GGvwzZH1ckXD26vLk2ocN3O5i/HmZvS5raaH92zEIAULIjKvC3JnGsU+nW
	YsU8JoV+dWdeHKcww/9feR/FNVFjls/AUwAT7rzvmM9FLJWouMd3bcIi/3K3K0HLRJtUFaf+6GjhX
	9PcoHwR4/iTPrk+VBi5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gU7M6-0005za-To; Tue, 04 Dec 2018 09:51:02 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU7M3-0005y7-Kg
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 09:51:01 +0000
Received: by mail-wr1-f65.google.com with SMTP id x10so15191766wrs.8
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 01:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZKVbcR4IStGL63pS+Wn8KIAgvCjxvVnFnBrE1QELbR0=;
 b=nxNMcgfMVX+2DM0AxIhzVJSunkUHJLo2BUlnvp97GMere9f8Bf+Fn5ABacIFGgROcG
 ZL1kAHq8U1gQ4iUSLvF2VSLorN0z0f5Gnk1dDHomu6M32Z4LGh6z6mxgbx7rHu/B92bb
 ZoQdE5p0PvS2WaO9uO/DtA47dwWLyyI7O5nJbGUInQ3tWR2ohEaqMf7zA/bgQBinWO1+
 yq0z0RF1a50PnOoUw4GtgR+GgGEyENbG7a9O7m/piUOQpoOwUtQqVKbFNrkqtLCpNq86
 ecsg1H65/LNtT3Qh3CjdhZ2DEupBvt4FlXJElShqRJGDzpI28IzYpZgTOnb3ayuU9yjk
 EG2g==
X-Gm-Message-State: AA+aEWaX0eCUY6sDxSYtsLToGJfC0nPaBq9aimjYE88YgyPd+GOysbuL
 o4DATgG/hSqLxFHzv6bRD5lXZg==
X-Google-Smtp-Source: AFSGD/XBNLYa2pvbHEB2Jl2yc78WIOzB7EbaXim1lqSLlGmhd5G5sYpAVmrr/9Ip/zXOzRo0izD5RQ==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr16819820wrs.290.1543917047226; 
 Tue, 04 Dec 2018 01:50:47 -0800 (PST)
Received: from localhost.localdomain (conf.hotelmediterraneo.com.
 [2.228.78.71])
 by smtp.gmail.com with ESMTPSA id l202sm4698646wma.33.2018.12.04.01.50.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 01:50:46 -0800 (PST)
Date: Tue, 4 Dec 2018 10:50:43 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v1 3/4] cpu-topology: Move cpu topology code to
 common code.
Message-ID: <20181204095043.GD23553@localhost.localdomain>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-4-git-send-email-atish.patra@wdc.com>
 <20181203165833.GA27796@arm.com>
 <20181203171223.GD17883@e107155-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181203171223.GD17883@e107155-lin>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_015059_678687_6D45DE61 
X-CRM114-Status: GOOD (  19.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Atish Patra <atish.patra@wdc.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 03/12/18 17:12, Sudeep Holla wrote:
> (Fixed Juri Lelli's email)
> 
> On Mon, Dec 03, 2018 at 04:58:34PM +0000, Will Deacon wrote:
> > On Thu, Nov 29, 2018 at 03:28:19PM -0800, Atish Patra wrote:
> > > Both RISC-V & ARM64 are using cpu-map device tree to describe
> > > their cpu topology. It's better to move the relevant code to
> > > a common place instead of duplicate code.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/arm64/include/asm/topology.h |  22 ---
> > >  arch/arm64/kernel/topology.c      | 303 +-------------------------------------
> > >  drivers/base/arch_topology.c      | 294 ++++++++++++++++++++++++++++++++++++
> >
> > Whilst I'm happy seeing this code moved out, I'd like to have an entry in
> > MAINTAINERS so that somebody can review changes from the arm64 side without
> > having to poll a load of different lists. I assume patches would still go
> > via Rafael and Greg, but if we could have Sudeep added as Reviewer for this
> > file, then I'd really appreciate it.
> >
> 
> Thanks Will for pointing this. I agree with you and like to be added as
> reviewer for this.
> 
> Since arch_topology.c was mostly added for ARM/ARM64 and by Juri Lelli 
> (who is no longer with ARM) and I did review the initial version, I would
> like to assume maintenance for this file if both Juri and Greg are OK
> with it so that I can keep an eye on this as we expect more changes to
> this both for ARM and RISC-V.

Sure, this is OK with me. Thanks for keeping an eye on this.

Best,

- Juri

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
