Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F64C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tK5yZuZGxPMwIR+4hn/Rj4KFwvD4IGQjNGqBW34d42o=; b=rO0QmOW/VU2q0y
	XHBhbnOnK4j4kHFCq3z4cq+HfHvp5Rf9LfilazxdU1rON5NAeQD6wSHKHHTa3hMpBE6DmMtBj3YdC
	G4UElNwu/qeFh8JVUMxvIpsfB6Uw5qtOx7Q26fKXa0bOUkqbh9pwiZtYLJtO1/qxSe1W7c2VldaLq
	pwOqmPSERjQ8ISUVgzhNiID+YMl+1lFiLu3QARIxc1FkcluiG1iPDtr6bBGbAjHGBLveybJGQysky
	ZcwCFVh3vGjwnwSEzy0tWcPiAV2Kw7UvVlU+vwkZcXiMzVjkYNd1tLNubKTuPJIP1LAhFFN5BmddX
	tUm55HhK1wa825sfHgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWpe-0000000AYSM-04cf;
	Wed, 10 Jul 2024 12:54:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWpa-0000000AYRK-2yOa
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 12:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0F96CE16BF
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 12:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B824C32781;
	Wed, 10 Jul 2024 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720616035;
	bh=bJytAGwJkb5+HzIS7Gvp673v6K6DW4WaBn/JLdIV3KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Den/WGY0sejh17n67j3SEyKdZmX0zrIIMri8BnUZnE82L/yTsFi+prcUy4YBfeRM
	 FG9pK6w8RlwwOj13V1yduyuqG3VCkI2vDFxpHKmqqJ6RR7MyIsWWbosRJtGx/M+WRp
	 ILCy9eq20OwMQ5Ku6UIlLkJaKRAt6jFcXBHJu+ls=
Date: Wed, 10 Jul 2024 14:53:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] serial: 8250: move mmp|pxa uart earlycon code and add
 xscale earlycon
Message-ID: <2024071028-deskbound-crisping-7f69@gregkh>
References: <20240706101856.3077-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706101856.3077-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_055358_947417_02D19559 
X-CRM114-Status: GOOD (  11.00  )
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

On Sat, Jul 06, 2024 at 06:18:56PM +0800, Jisheng Zhang wrote:
> There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
> and the 8250_pxa. The previous one is generic and the latter is binded
> to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
> HW to support, making use of the generic 8250_of seems a good idea.
> However, there's no earlycon support if we go with this solution. So
> move the mmp|pxa-uart earlycon code to core 8250_early.c.
> 
> At the same, add xscale earlycon support too, only build test since
> I have no xscale machine any more.

When you have an "and" in the changelog, that means it should be 2
patches.  Please split this up into one that does the move, and one that
adds the new entry.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
