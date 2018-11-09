Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C369CC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 17:16:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BA320818
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 17:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OVm4yyL4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SOgAbX8P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ee7zLiK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BA320818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+icvbrzhTTRrtN6CNGHojf6555XMuGQXtiVcH5rUmko=; b=OVm4yyL4+6a10X
	Pcz3qwCl1LjpC0x08/Hbl8kzkqxEfXcEkh2GJSdkHFE1BFV7E7PJK1o7FaQ+55rmGBieyoniT4Os8
	+peaObO5sCxPMrFHFy/s2fTBgElMe9+1U+NE1+MOvrnco+Rd1gj2VuJydg16BQQFXny5TcVwPYPKn
	qwhOh2mV0cHJSPJuCrA4IxEL96nITynEWJBjy/SkcNU4C96ckc19VAXTpwlvg1Ips6SCEHACaHpR0
	64bl+htyh53XqZfhcE22NuURdeIDWV92yAVJ/q9W5uQwQCVNewlOgZjvzAzOO1mCC322zpj+rR7M6
	gn70KQJGxTqrihrrymog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLAO2-0006ZM-CD; Fri, 09 Nov 2018 17:16:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLANu-0006KZ-Uf
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 17:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vX5FfiFHDQVUgypMAnH1zu6hXs2jc8mFA92Vm7X3gXQ=; b=SOgAbX8PO4CM/gzmEo/+e6ODw
 9R4eF1FzdPD1oY9/u4ZKO0AYn9vOUgY313IKymIHOgZorH8fKs8v23lqlvzXNJG6jxkJs6Ys1Caz1
 rhMX/EMTuYQOKRdH2HHoJpqdNuwNIrtjWIHX/OrktqpgwRabvd9DxT7kLvlWs6r5j6O6yg2twPHFy
 c13HsZOfPk8W1TKftaRStc+ullaCQQckJuQDGl+/vAwwut+dmEIx5lkD1YR2B/d7emJCgfJp8AbPM
 XeBJJo0fy/wBxbqoq+9vcifomHvEE0TDfUlprx6dT2/4khrn84tAghdzUV/tI91tlMzK7MuK69Xlq
 vi+OTSzFA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLA8a-0001b4-Rj
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 17:00:07 +0000
Received: from localhost (71-6-98-120.static-ip.telepacific.net [71.6.98.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9593520855;
 Fri,  9 Nov 2018 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541782791;
 bh=YhiIDbd003o4esGEeQavk+vPolG/JlP/TkQ0hS8yozI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ee7zLiK0YX7LfLfFFd43P3cpyNI1Z4kfjE09Urptwt2ozHhwAKpIuTqqJlVW5suNa
 iYOP22hzZjzi+G547QDqNOTwboTy8ZMUxf4hsYYOYTvssQ0Id9GFMuNk8QIhgTfAWr
 ambtAU1FwzBZ+HBUkZui7eeFRGHNx3UObaJ8JS/A=
Date: Fri, 9 Nov 2018 08:59:51 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] tty: serial: add driver for the SiFive UART
Message-ID: <20181109165951.GA13927@kroah.com>
References: <20181018234352.26788-1-paul.walmsley@sifive.com>
 <20181018234352.26788-3-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181018234352.26788-3-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_170005_019098_44D0362C 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109165951.Pmdf49yWnO6GVBNbAyKzu1FtjnIvR1GhlUXT6fGeE48@z>

On Thu, Oct 18, 2018 at 04:43:54PM -0700, Paul Walmsley wrote:
> Add a serial driver for the SiFive UART, found on SiFive FU540 devices
> (among others).
> 
> The underlying serial IP block is relatively basic, and currently does
> not support serial break detection.  Further information on the IP
> block can be found in the documentation and Chisel sources:
> 
> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
> 
> This driver was written in collaboration with Wesley Terpstra
> <wesley@sifive.com>.
> 
> Boot-tested on a SiFive HiFive Unleashed A00 board.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: linux-serial@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  drivers/tty/serial/Kconfig       |   24 +
>  drivers/tty/serial/Makefile      |    1 +
>  drivers/tty/serial/sifive.c      | 1070 ++++++++++++++++++++++++++++++
>  include/uapi/linux/serial_core.h |    3 +
>  4 files changed, 1098 insertions(+)
>  create mode 100644 drivers/tty/serial/sifive.c

Seems like the 0-day bot did not like this driver, can you fix up those
build errors and resend?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
