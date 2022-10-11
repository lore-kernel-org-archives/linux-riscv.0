Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B821C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhBz3bkePYl7w2YBcmCuibWCZx3Vj9qiKSMhhT0OTH4=; b=z6/rSs/OIJk9bH
	GjTeZrcQyTz9OC+6M8G4QPykpwQGty7fuK36ZXA40+DgubGbBkfG68Kbua0+H51gPux4qk/AoLftu
	ZpwARXYiQ+6VolqK9vXBL9LMdIccIqf9p/I7lHVGwolKt7xd7korUNEVMbuHVG1L++hhGRHkaLpCu
	wFSLGmq3isyixynFyfa6YzoayzKVzU9WHiQmIuMgYWtK0ZJokcrFo0C761XGOi4PDO4MB4jLn+P0L
	YXiGtfRnxOjvY6sBHtJJE1T4VF5dpfVCaARnZA9JM3iVQMR28qBgVGCTwtTvS0oCB5uCcvgvknavh
	xX8XXwcMvxnLoUH8AKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiI3S-005Cho-Nu; Tue, 11 Oct 2022 16:24:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiI2k-005CQg-7V
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 16:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665505422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gv22bmoTax0J0zhnmYTJUdzNvY/rZYRIc0hd8rouMg=;
	b=LRY6MDkL1FSVWQVxuAJnTx6sM89Z2if2LaB1RiWbHBIYRj7Mj97W6hfxISk0sngoJjkUUw
	GnXQTJukvlIaJ2wWg2PxGQBmBr3hudt0Jz/x818R345uAZe5cB+0ar0V7e8vsKdsSY4bAo
	zvwzhBObKjWCB9PLl3RC99A5zqOE+nI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-3AV-dLqCN56sjnKJpDHqxA-1; Tue, 11 Oct 2022 12:22:07 -0400
X-MC-Unique: 3AV-dLqCN56sjnKJpDHqxA-1
Received: by mail-ed1-f71.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso11771850edc.21
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 09:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gv22bmoTax0J0zhnmYTJUdzNvY/rZYRIc0hd8rouMg=;
        b=yWL09AI16E4ndTMg0fpiee+PEBEhPXGLnMb8n8QoN2IXEkI4uTVFnntw2u0GewldMs
         KAZnSa1rIj1vKA+SEWf6qfYd/8e6KiWut1Ylj8Pclwj8LO/rssOiSbaYLzASAzl323bR
         d0U6mzq9efmKnkEwYZfu0g3vQJQwNrmUwtwO2GLGFPUB5xdnUZk9owW+78DFGbRIIE0r
         c5eZ0HWw3KQoYc3Fy2z9QyIsKiyeKuow2ZXzoQPizE8BxFeRl/F7/ErU/nTrQgRFJyTM
         RlZutIkH1pTBAdLvanwcVlyOihLkAVjEoqrz21r3BWrTFv/69//T3+NpFdsZkrD1a93G
         l8MA==
X-Gm-Message-State: ACrzQf3X+TWvcRp+YIpd2c+78StfLWng0wT1djxnwzDvWA6BQVLBJY/H
	Bwm4aYtsVogFkOonXnAZ65j0Wib2GQF3ZHe74unRhIT7cjhs3vXujUuuVdw2S0oZk/QFgfNDDe1
	r2rhNlc83r1tQS3Oo2UDiamiqJ/fI
X-Received: by 2002:a17:907:2712:b0:78d:a223:729b with SMTP id w18-20020a170907271200b0078da223729bmr11697143ejk.443.1665505325963;
        Tue, 11 Oct 2022 09:22:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5z3+5ecaWwqYPDE234CAcuf3hKc1qLTNOp8VUNiMDwybT1F6EbMEGGKCCgL+v4lylioGXOig==
X-Received: by 2002:a17:907:2712:b0:78d:a223:729b with SMTP id w18-20020a170907271200b0078da223729bmr11697097ejk.443.1665505325743;
        Tue, 11 Oct 2022 09:22:05 -0700 (PDT)
Received: from [192.168.0.198] (host-79-47-205-133.retail.telecomitalia.it. [79.47.205.133])
        by smtp.gmail.com with ESMTPSA id xf13-20020a17090731cd00b00730b3bdd8d7sm7273113ejb.179.2022.10.11.09.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 09:22:05 -0700 (PDT)
Message-ID: <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
Date: Tue, 11 Oct 2022 18:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Guo Ren <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Douglas RAILLARD <douglas.raillard@arm.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet> <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_092346_428191_6628B357 
X-CRM114-Status: GOOD (  12.52  )
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

On 10/11/22 18:17, Valentin Schneider wrote:
> Thinking out loud, it makes way more sense to record a cpumask in the
> tracepoint, but perhaps we could have a postprocessing step to transform
> those into N events each targeting a single CPU?

My approach on the tracers/rtla is to make the simple things in kernel, and beautify
things in user-space.

You could keep the tracepoint as a mask, and then make it pretty, like cpus=3-5,8
in user-space. For example with a trace-cmd/perf loadable plugin, libtracefs helper.

For rtla I was thinking to make a new tool to parse them. and make it pretty there.

-- Daniel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
