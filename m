Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD290CE7D1B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5aR0JCvwdVAHzXm716UuB9Rq0L8z0nYZueBV+lcTyU=; b=B+dchcl9uV0OIP
	BJif6pZikkyDWx4psA9vnGI8QnuMCZc2C+oFhH7/paULYx5z/XaQiydRGGRpb7vpOQ48BF1dAE4Qd
	x29tH+v94VLHeyP8kTvrDb+o+Aw7hrOLXSxJRtxUIGCj0TWYOCxQVhV74tMprr/oIFFPRKm9XR106
	yYvz9ZCmbyGq+3pvHM7RGUkI1W7XSRHjfHlz6YCxlIRRuqtwAohgXtqoepq4VoucV0zeU8zKTGQ+B
	t6Wj7tlQV6KaIjUw2bh6kGJRmSc7uA/fMaj8bg5j82TzVcNeUkug6hiCmyCr7WL0zgf8KR3g+2z0w
	2XeimL14lEV1tgY5D9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcGZ-00000002om7-1wf4;
	Tue, 01 Oct 2024 12:46:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcFq-00000002oZK-0pqR
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 12:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12ED9A4367B;
	Tue,  1 Oct 2024 12:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F82C4CECD;
	Tue,  1 Oct 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727786725;
	bh=rONTlDGlNdXQq4N23uXg7INy1byH9RVPf6wtNX7kOsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+9qW4Ah6RG9jaJPY69xMACkjV8odYd8avjGEF+NDBQxaecQYRr6qBUOjf3hYE/x/
	 IbCr6e9php/IMMHi5NHprwIgyRHETMTzb0RskPYOoeFTvPTPw9jEG4dpbgg4t5Q+Ix
	 chJWVPj3ToIyoCcmDllM3DavLj0L/Lzt0FyYd1mA5zfbBp4gk4AdEsSjdKBepdBDPT
	 iCgsdW3X+127UdYRvJ9df0pzbrDBbtqGhLS5e7je9MdXPR4baNnLasCe7VeiWDtc0O
	 Uz85IVdzJywFl41sMWFhs39kixW6emJVJgsqE4KgPkIwpmNZvRekuMN3uYXVSXHKP2
	 3b5AbwfrxzvIw==
Date: Tue, 1 Oct 2024 14:45:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930-uneasy-dorsal-1acda9227b0d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_054526_335452_5CD04382 
X-CRM114-Status: GOOD (  21.30  )
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

Hi Conor,

On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> At present, where repeated sends are intended to be used, the
> i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> devices must not malfunction in the face of this behaviour, because the
> driver has operated like this for years! Try to keep track of whether or
> not a repeated send is required, and suppress sending a stop in these
> cases.
> 
> Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")

I don't think the Fixes tag is needed here if everything worked
until now, unless you got some other device that requires this
change and you need to explain it.

If this is more an improvement (because it has worked), then we
shouldn't add the Fixes tag.

In any case, when patches are going to stable, we need to Cc
stable too.

Cc: <stable@vger.kernel.org> # v6.0+

(This is specified in the
Documentation/process/stable-kernel-rules.rst and I'm starting to
enforce it here).

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

...

> +	/*
> +	 * If there's been an error, the isr needs to return control
> +	 * to the "main" part of the driver, so as not to keep sending
> +	 * messages once it completes and clears the SI bit.
> +	 */
> +	if (idev->msg_err) {
> +		complete(&idev->msg_complete);
> +		return;
> +	}
> +
> +	this_msg = (idev->msg_queue)++;

do we need parenthesis here?

...

> +	/*
> +	 * The isr controls the flow of a transfer, this info needs to be saved
> +	 * to a location that it can access the queue information from.
> +	 */
> +	idev->restart_needed = false;
> +	idev->msg_queue = msgs;
> +	idev->total_num = num;
> +	idev->current_num = 0;
> +
> +	/*
> +	 * But the first entry to the isr is triggered by the start in this
> +	 * function, so the first message needs to be "dequeued".
> +	 */
> +	idev->addr = i2c_8bit_addr_from_msg(this_msg);
> +	idev->msg_len = this_msg->len;
> +	idev->buf = this_msg->buf;
> +	idev->msg_err = 0;
> +
> +	if (idev->total_num > 1) {
> +		struct i2c_msg *next_msg = msgs + 1;
> +
> +		idev->restart_needed = next_msg->flags & I2C_M_RD;
> +	}
> +
> +	idev->current_num++;
> +	idev->msg_queue++;

Can we initialize only once? This part is just adding extra code.

The rest looks good. I just need to know if Wolfram has some more
observations here.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
