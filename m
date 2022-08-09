Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD4C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7E/qYTlbH3AxMxLqDCWAAPcVgrNO53vdP7p+4NA0XI=; b=rdbz/vWRlHCFwb
	doqZXI+x7Vvq2wfroG/g95+se5y3Z89yObTcnYrEOXDIV7dpDt39UHxeJWkEimVY1U82mO9e6P78X
	wkghcMFyF6XngUL/nTBzeMvP+8prlvl5cC/KFAJ93OFF84kK+G7cry3w/1KwYSSLDfcyAGU0SU+/l
	4n6X9MrOrNmkzdqWnusiUqpRVKcMmDzaodQMggdKk5u8cHAsJKVQG632PRnGMMJb0AuG15JBZgbxB
	yN9PCoUT8EjhrMt/RRa8GqNeLIWKvAz9rpZXRzVIoMoeCluxCIOw040hpUgaI1JFPcLAVlmW+sTwX
	E8qsghq1uWWrYyq1HmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQ0L-004JXG-Bs; Tue, 09 Aug 2022 14:14:45 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQ0H-004JVM-W3
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 14:14:43 +0000
Received: by mail-io1-f48.google.com with SMTP id i84so9654669ioa.6
        for <linux-riscv@lists.infradead.org>; Tue, 09 Aug 2022 07:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Qgyr+32CceGsT0l+h5ryRLscX/cbGb6A+xgqfxNnSjE=;
        b=JmzthOvi5IeA3zJPRErJiOLH/svuEhhpYxpKrwGDaV+eT974ou1PDlVT0uNSZkyI5L
         8ks3vFB6y3IDYtXv2a9TxgZZMG8OO78zJSbE1GkUdBgz0KyB10tgdTRrpCEST59Hwg4Z
         lll68oyGmNoayiQh95M4JZ3YS/TePYPVd2VU6+XxdKqgJLOb27o6OPrx2UPEc3Q7ICbU
         5ws1nkUjplEH41/nuzZKpYTl7eauZOYz1APOPOEu86U0TgITWHL8VJPhgDohiW/2UyWT
         sy+JEISi1+3St7GalvSSZYSCNXe42ImovDiOP1FhYmhlhirOeehvSCn7aOWbXcDT/TYe
         kB/A==
X-Gm-Message-State: ACgBeo1yc6wkWCcFQCKlvqT3MOWq9Ia9gnJbM7HebYS8pzglPhbkkxCt
	70u8v5PNQEFDwYNnb6FfNw==
X-Google-Smtp-Source: AA6agR4Ha6qVwthQuAETuobnGoOie1LPqRZXH3lXZnPOwMUi0rO7JQSfIeH7D7YvlZQ/DynOPNiZxw==
X-Received: by 2002:a05:6638:1386:b0:342:8d69:71c2 with SMTP id w6-20020a056638138600b003428d6971c2mr10163189jad.315.1660054479123;
        Tue, 09 Aug 2022 07:14:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c20-20020a0566022d1400b0068226bcb7aasm1151011iow.38.2022.08.09.07.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:14:38 -0700 (PDT)
Received: (nullmailer pid 1746668 invoked by uid 1000);
	Tue, 09 Aug 2022 14:14:36 -0000
Date: Tue, 9 Aug 2022 08:14:36 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: jrtc27@jrtc27.com, tglx@linutronix.de, maz@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, anup@brainfault.org, guoren@kernel.org, sagar.kadam@sifive.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <20220809141436.GA1706120-robh@kernel.org>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_071442_075805_1BC11A66 
X-CRM114-Status: GOOD (  27.76  )
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

On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
> On 08/08/2022 22:34, Jessica Clarke wrote:
> > On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The device trees produced automatically for the virt and spike machines
> >> fail dt-validate on several grounds. Some of these need to be fixed in
> >> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> >>
> >> Patches been sent that fix the QEMU issues [0], but a couple of them
> >> need to be fixed in the kernel's dt-bindings. The first patches add
> >> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> >> the auto generated QEMU dtbs.
> > 
> > IMO the correct thing is to have QEMU use a qemu,plicX rather than to
> > weaken the requirement that a non-generic compatible be used. Otherwise
> > you end up with QEMU using something that's marked as deprecated and
> > either the warning remains and annoys people still or it becomes too
> > weak and people ignore it when creating real hardware.
> 
> It's already in a driver so I figure it should be in the bindings too.
> 
> In arm's virt.c they use the generic gic compatible & I don't see any
> evidence of other archs using "qemu,foo" bindings. I suppose there's
> always the option of just removing the "riscv,plic0" from the riscv's
> virt.c

I think we're pretty much stuck with what's in use already.

I'm on the fence whether to mark it deprecated though if there is no 
plan to 'fix' it. Doesn't really matter until the tools can selectively 
remove deprecated properties from validation.

> >> The final patch adds some new ISA strings
> >> which needs scruitiny from someone with more knowledge about what ISA
> >> extension strings should be reported in a dt than I have.
> > 
> > Listing every possible ISA string supported by the Linux kernel really
> > is not going to scale...

How does the kernel scale? (No need to answer)

> Yeah, totally correct there. Case for adding a regex I suppose, but I
> am not sure how to go about handling the multi-letter extensions or
> if parsing them is required from a binding compliance point of view.
> Hoping for some input from Palmer really.

Yeah, looks like a regex pattern is needed.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
