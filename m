Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E84C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 12:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F51261212
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 12:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F51261212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vB/jB4uG5R0N+nHIHv9krV7sT3n2ckCjmXO7C54GBcw=; b=iX7QBTtUJwd14n
	jvKNL1hS1F7jnvI4ArwWvQsZkBVRYeEOYM0SQFNAQQWXH2MqRT2up/7j3FGuNLNNHvUoJheGLuxeP
	bF+MoMuumWaE1pVW/Z9S13MfdzoYko2zZkRuPfR7PxqLugZfI6yAztCS6OxBOJ4odu3MosKYDWT6z
	49pkkbCY8C8+gcnfNkIpUminlSWjC/xwFbPw6Bt12FMwnUM1CWWTXIoFCsSDeeBaLjRrWit7bDCk7
	FEWN6EvQ+RfGrf7Ib37if59nU7hQTD6qUT99rl9J7/dwHhqpqEDjMroldrmn7c5EWGAfIIVuEM87F
	bVGzUWVgMBxiBvqgWHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcRLs-00FYWy-2R; Mon, 18 Oct 2021 12:02:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcRLo-00FYUb-NS
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 12:02:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3F8561212
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634558563;
 bh=RhHPIX0Z+xg7kqXRMeJLbAlYk80ZUNDoBDg7wJ0kQjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CdtmhAK4faHuxSROeCvN05ix2TlfcF3YSXd854Xuj93aUmvGImqnDs2KFKOeALSYX
 I1QZMQ8lCxuISCZCRtXqQDwzve1XbqFTlzPzTfuuGLzbup0IESnCjUMYcx3WtP38oZ
 KueGA9wnot3F1AiDBlNpp0IQ4ihYOO5YtxUhTe0WWZFWjGqnZcNyzKt2+CbKqTl5qo
 Hq/t8/jawegvTLOhCi9SYmbxaLBRtkPiJtzbVe6RX3rG0cZFOfTPnpiIJYtDvCSWao
 exkNFatAkv6zhpfNgih7dIlE++g9BOMa2ZRxS3lJ1Y2WKpnpiIx9PGoYPJeuD2iCtK
 PqYjUS5741zEQ==
Received: by mail-ed1-f43.google.com with SMTP id d3so69952632edp.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 05:02:43 -0700 (PDT)
X-Gm-Message-State: AOAM532zqXtghYTXo9Glv4zjBtYszYaCDPCY1hvCZKdANX5JiHcuSCaB
 aBgnSqlr0zQsi3B6qKKDeUZIlEYvhUyj5KmHKg==
X-Google-Smtp-Source: ABdhPJyTVojjZSVx1tOOZXPoaIiK+leRXXmuEIBk5SwNOhlQESxuVhdC/rOnY3qX4Uo9iSyYPs7eHRtNesysghWobOo=
X-Received: by 2002:a50:da06:: with SMTP id z6mr45094962edj.355.1634558546647; 
 Mon, 18 Oct 2021 05:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-3-guoren@kernel.org>
In-Reply-To: <20211016032200.2869998-3-guoren@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Oct 2021 07:02:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+NM=jvYfvyNVsJCrizHzqaDMPe05hkBhnOWHc+JwBNig@mail.gmail.com>
Message-ID: <CAL_Jsq+NM=jvYfvyNVsJCrizHzqaDMPe05hkBhnOWHc+JwBNig@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, "heiko@sntech.de" <heiko@sntech.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_050244_815032_5DB46475 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 15, 2021 at 10:22 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add the compatible string "thead,c900-plic" to the riscv plic
> bindings to support allwinner d1 SOC which contains c906 core.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>

Please send to the DT list so that checks run and it's in my review
queue (IOW, use get_maintainers.pl). And run 'make dt_binding_check'
so reviewers don't have to find your typos and other errors for you.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
