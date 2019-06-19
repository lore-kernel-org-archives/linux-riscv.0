Return-Path: <SRS0=pesg=US=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC959C31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 07:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9625A2084A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 07:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2oxhlPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9625A2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWGXM9G5Kf7Pg5HvYHHqFU66FbpqT1PctAdp7ml9UYc=; b=L2oxhlPbQIdpid
	sePyKdo25UbPco/+1FFpnOi6CXxwx2G67vCSeNViI+zgzo2FfUK38uj/XRtNb6Ofit+iTU7Y9Azcd
	OuqCjDZkOJVU9tzF+3rxF+M13iH10ymjtG2z4HHX8SeMYuxgC8C7gm86Sr7C2JqefiF+yUomJNYLi
	x1fQLTU7guh+BJTWpBQiB9qJXOhQoUSlZYI4m61fFS7IF/wvJ5qXYWtv9B1W7d0Y9fZAtVefRFbRw
	u2v9fyn3tMJjB6QP/VFfg/T8zYvfXSrNva5B88Ez2Tto/HpzvObQFCapk5zbJwqo8bkhqSLKuzxMi
	fDKg7T4kXhYPYJ5dEIKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdV8d-0007fl-4q; Wed, 19 Jun 2019 07:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hdV8b-0007fJ-C7
 for linux-riscv@lists.infradead.org; Wed, 19 Jun 2019 07:36:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14CB6344;
 Wed, 19 Jun 2019 00:36:07 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 103953F246;
 Wed, 19 Jun 2019 00:36:05 -0700 (PDT)
Date: Wed, 19 Jun 2019 08:36:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2] RISC-V: Break load reservations during switch_to
Message-ID: <20190619073600.GA29918@lakrids.cambridge.arm.com>
References: <20190607222222.15300-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607222222.15300-1-palmer@sifive.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_003609_459846_7BBDF495 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: me@carlosedp.com, linux-kernel@vger.kernel.org, joel@sing.id.au,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 marco@decred.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 07, 2019 at 03:22:22PM -0700, Palmer Dabbelt wrote:
> The comment describes why in detail.  This was found because QEMU never
> gives up load reservations, the issue is unlikely to manifest on real
> hardware.
> 
> Thanks to Carlos Eduardo for finding the bug!

> @@ -330,6 +330,17 @@ ENTRY(__switch_to)
>  	add   a3, a0, a4
>  	add   a4, a1, a4
>  	REG_S ra,  TASK_THREAD_RA_RA(a3)
> +	/*
> +	 * The Linux ABI allows programs to depend on load reservations being
> +	 * broken on context switches, but the ISA doesn't require that the
> +	 * hardware ever breaks a load reservation.  The only way to break a
> +	 * load reservation is with a store conditional, so we emit one here.
> +	 * Since nothing ever takes a load reservation on TASK_THREAD_RA_RA we
> +	 * know this will always fail, but just to be on the safe side this
> +	 * writes the same value that was unconditionally written by the
> +	 * previous instruction.
> +	 */

I suspect that you need to do the same as 32-bit ARM, and clear this in
your exception return path, rather than in __switch_to, since handlers
for interrupts and other exceptions could leave a dangling reservation.

For ARM, the architecture permits a store-exclusive to succeed even if
the address differed from the load-exclusive. I don't know if the same
applies here, but regardless I believe the case above applies if an IRQ
is taken from kernel context, since the handler can manipulate the same
variable as the interrupted code.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
