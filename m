Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045B9C43460
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:25:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDAD6108B
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDAD6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsUmRpskqX6cO2m9hdwPYrNLhdLMA7tETWnmX7Z58sI=; b=iCdavRWfEhrSgwaaC9jDXwotz
	W19O3bbis117DqmsA85gykRoPkZLJMhMYJGnDiI5WgT9CnMxSwnO0ULD5mJkhAuESE9vO9Ip+GI5h
	2BHhqyHEhGwsyQ8i8ApDNDa6XOXFWyHzcG82P8JYSBVl2T6JVudA5vFSE/jBS29eXOpawXRlAvo83
	Eq8vdQGmEiV2zw4elYMIkB4E/tFrku8d/uk43E4JPVQBGAfVeWOEAHniTUdF+p5HItaYmd1mLy4E4
	tP2gxvicR43F5g6evxsKpG2hwvlev9C8UpABuZCAkevsdgmEiMgUSEvHfE0qa5uZylF8FbrsCDD5a
	ociA9ADaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRxJh-009fxp-TW; Thu, 01 Apr 2021 13:24:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRxJc-009fwm-Sh
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 13:24:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id g8so2780335lfv.12
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 06:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SyQ6YHSJTCocB3NQ9p3k0kjyZQfF3RDBbodDQ3PiFKs=;
 b=oQFWDPezRXYmSljEhNK7vaDXbjEFYI3M+O8S34WNrUrWwpDr9Eul/RvlVe1HvgIqPc
 01XZyOIs8c4iAPmWSD0G57GbjL2ynXk1cXt4UvDcZN9tFIaN11MqUJQSCqNKjfa3p8Dj
 6LpONXmzBHadDKBXbzTSzYt1Fzw+9oOjkGRrDXQ/Gn9lFFpw2GREW/xm5BUI2Kv7PHTJ
 +aya6FCR/Q6VJ1J+wY9iJAzOm/lfgOZ9CQoWhconGgF5Y6jMoppHv/bySIQF20+Kgenu
 m93cbVf9tVLijon6yyONxVw4eE++Ra5803A5KtmiixIqIm/6VI5I2H1DRHenhM5n+y0Y
 EYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyQ6YHSJTCocB3NQ9p3k0kjyZQfF3RDBbodDQ3PiFKs=;
 b=lAfTqfyUO0A/CnWIxxwppFZiM8y1kSSNCuiqNBW+T/bMfmGBpe0N9MPaN4HlNMm0mJ
 dAGHahOmp6p7RUenITP3CEoz0xPZtNBu+PHmUCZjimJG8+IUXwXB5cXb0t9v0KK85sA6
 w1idJNql2G5W/qcNyGmYBbtaMJdwQxGG5rzrFnWtOx2KqSakKLm1g5BzX3jbuR6k52Ft
 k/Nsxa+1lf2t+R/TP36/3zyK6nMDRutj7L+KeU/2tiiFi+PAeLo12JALZwhMhsdYFhPA
 ydewWLgVMiHNLi2+2evkhcacp78Tcewf8oUFt9Hq4/U0GOtVnfy6TIBO9xWgGazeflC7
 zSRQ==
X-Gm-Message-State: AOAM5324EGyXQw/FAY+4Jo0GxzPyXu91tROTYFgq3N1OiwsXygbg6+M6
 94g2Msr73yxGlheRwL9BbgTF2BmkKEjuvXd61wHZYQ==
X-Google-Smtp-Source: ABdhPJw6yu1Dk/jHqd4pPD6Ij4l08dS0fzTdrC9xpai4ps/1uls7JvYLd2Y5+el37EX3LSF6TDnqQ5nKgLNuQLh6svU=
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr5587707lfm.25.1617283491330; 
 Thu, 01 Apr 2021 06:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210115121846.114528-1-anup.patel@wdc.com>
 <mhng-a4e92a0a-085d-4be0-863e-6af99dc27c18@palmerdabbelt-glaptop>
 <CAAhSdy0F7gisk=FZXN7jmqFLVB3456WunwVXhkrnvNuWtrhWWA@mail.gmail.com>
 <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
In-Reply-To: <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Apr 2021 18:54:04 +0530
Message-ID: <CAAhSdy1Lt1NSD7pKmm+Xqqz2b7A6r4KgAO7kRhdy-jwAHucVOg@mail.gmail.com>
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_142453_100793_94BE164A 
X-CRM114-Status: GOOD (  16.01  )
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

On Wed, Mar 31, 2021 at 2:52 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 30/03/21 07:48, Anup Patel wrote:
> >
> > It seems Andrew does not want to freeze H-extension until we have virtualization
> > aware interrupt controller (such as RISC-V AIA specification) and IOMMU. Lot
> > of us feel that these things can be done independently because RISC-V
> > H-extension already has provisions for external interrupt controller with
> > virtualization support.
>
> Yes, frankly that's pretty ridiculous as it's perfectly possible to
> emulate the interrupt controller in software (and an IOMMU is not needed
> at all if you are okay with emulated or paravirtualized devices---which
> is almost always the case except for partitioning hypervisors).
>
> Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> drivers/staging/riscv/kvm?
>
> Either way, the best way to do it would be like this:
>
> 1) you apply patch 1 in a topic branch
>
> 2) you merge the topic branch in the risc-v tree
>
> 3) Anup merges the topic branch too and sends me a pull request.

In any case, I will send v17 based on Linux-5.12-rc5 so that people
can at least try KVM RISC-V based on latest kernel.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
