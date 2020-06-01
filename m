Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE09C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 07:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18BD920734
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 07:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFv69faY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3Cmo/KD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18BD920734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJq0Q0BruD+9jMSZ5aWS96++P0G18ij05rD2PIDNDEk=; b=hFv69faYZvrS3IFoa/G9tuVZF
	xk7bRgYiuibm2jgJDAc6JBIs+Ji+YzaEWDL83PE9IixdXXMhOeZeREGT9/0DLRBPASgtd4tXFmdMg
	0LbmHa0C9UPT3tpobxtQRSly82H6xfawhQMxUtJI5SPeSmHAaq694GAOqB+jSV3Uaxg/CuhZ7kO7Y
	MNVN8oTNO55EbbO1cQ9P4aV8dGbxY112WvglmGXTkIJB41W4aZAnTSSfytUW0pTHPhPZBUCNrTN3O
	YP1iARS2t9pVIBfx6rwWfKLNCUTnDbRNaV/DFqitYjCD6ay6WVfxHBowV6AqPFBVyF0N2FWE8hxJS
	a5HFWWfDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jff4E-0003kz-AN; Mon, 01 Jun 2020 07:41:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jff4A-0003jf-PM
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 07:41:04 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CD50206E2;
 Mon,  1 Jun 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590997262;
 bh=muwNuTxdUi/iY+cPf7GSvMRN5ZcCPlstCo2RAEIWx/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C3Cmo/KDRo0ldRsH20hoFndPfJGT2HEvTwUQN7sGNPGOWNVVIjIJPCn7XzcuuyaAv
 T6yrmzALIs6aQJLNOQfCULCaEMDrX3yxke1Zn3252Pkd4A15eqjX6CtJrIqp7CcTx9
 Xxj5i1SucUGT7bNsuUJW1BZ7TwvohZ4nR0kt2Fao=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jff48-00GqVu-Jo; Mon, 01 Jun 2020 08:41:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 01 Jun 2020 08:41:00 +0100
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v6 3/6] irqchip: RISC-V per-HART local interrupt
 controller driver
In-Reply-To: <CAAhSdy3-dr1URn1mGu3n9D-h+wjsU18nbWPYMRNAtitMa58rwA@mail.gmail.com>
References: <20200530100725.265481-1-anup.patel@wdc.com>
 <20200530100725.265481-4-anup.patel@wdc.com>
 <cd4a5513197b73e3b8d335f09117bb8d@kernel.org>
 <CAAhSdy3cnZwnjpqWkixmZ5-fi=GK1cSUsjah=P3Yp5hjv382hg@mail.gmail.com>
 <a5f1346544aec6e6da69836b7a6e0a6e@kernel.org>
 <CAAhSdy2fJ1cd2OjAWODOmSbkWUBfvvr4rvsTqh4qNxZjTTKo5A@mail.gmail.com>
 <e315f76b06b7b0935ebee867c04f364e@kernel.org>
 <CAAhSdy3-dr1URn1mGu3n9D-h+wjsU18nbWPYMRNAtitMa58rwA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <ffeba9a68e72cf2cb97759c5fb496fac@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: anup@brainfault.org, anup.patel@wdc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 tglx@linutronix.de, jason@lakedaemon.net, atish.patra@wdc.com,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, palmerdabbelt@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_004103_019904_51D06A1C 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org
 List" <linux-kernel@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-06-01 05:09, Anup Patel wrote:
> On Sun, May 31, 2020 at 4:23 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-05-31 11:06, Anup Patel wrote:

[...]

> Also, the PLIC spec is now owned by RISC-V foundation (not SiFive) so
> we will have to rename the driver to "irq-riscv-plic" and will have a 
> new
> generic compatible string "riscv,plic-1.0.0". One of us (me or Palmer) 
> will
> send separate patches for this renaming. I hope you will be fine with 
> this??
> (Refer, https://github.com/riscv/riscv-plic-spec)

Do we really need the churn of a renaming? A new compatible, and maybe
a new config option should be enough, no? What does the renaming give 
us?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

