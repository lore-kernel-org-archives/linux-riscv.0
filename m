Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72374C47089
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:33:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31968613AC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31968613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COmcbXhJJSL49P41zt/FnRkbIVsSD+9CmYWJos5enuA=; b=lWMB+gv+hxySAR
	LPaj+Nu797qw+Zw7BkDepRc53w8EKnUmhGt7dIYqoX/h57/v4MGnZKQN0B+8cZYNEyTGff9VF+H0+
	WXibI9fnWSXt4YF1uOwulZZNqi+rzMj0ojiiOU1yOfAIP44Gd/rUXCqaNff/XYG1sAyrCyk5J61rM
	IeEBGWBkxU5KlXzXUZnZgCijLoHqQnxLz+s2xtuipYsaeRSvTVAhNl0jsQf+s2gZJEB8ufJvE10X2
	6jlVvE8xArDJA+m/7957snr35ycaiDLF/tjirgOoc51aivvzZ5HGJ4/csWD1OQSyqDa8FA22eUIqM
	QPgx7kUXjfu6ww5DUWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmG8g-006J8M-OG; Thu, 27 May 2021 13:33:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFzu-006EV3-20
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 13:24:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id x7so4708061wrt.12
 for <linux-riscv@lists.infradead.org>; Thu, 27 May 2021 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hv41+8z8Jf426xoY6oV1fY5s92UO0dWk6VQFf20/N2I=;
 b=IUkITzDx4pymLtsSEdsKcwnrEMHVFdlnma8hxTuxEBH6EgsaB9idqC9aRjMNrSUtS/
 sh7dYBnvnhhGudzUNy0J/Kyut+BZZmrI0HSTR0xTXGysPaK+0XgS8l0OkzpPXdphX5RM
 fZpMvm2oLF/qqvE3wg9NAeMS6Z/xRR9hZLW8fadEjLDD8K9TWJRISVBk+OGlc6GNuFS4
 HYQ0q2JjZX/PNs8PB+gqPiQO6i7YaUPA3ly586S2rHawpy7i91I/EDQWHVjPTWWkVRe9
 /qQh4u18+Ofon4pFZhxtQWd7zrSRQKymbXTdAMo77JD3927YfhoIL501lbRRT/3ZPUot
 pd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hv41+8z8Jf426xoY6oV1fY5s92UO0dWk6VQFf20/N2I=;
 b=c13W11AZLCYEEaKNAJXjgfk5NzeoLmc2gayBeAYf8bcvfqGIMAsoSohah5P37hUmko
 6tYVsGayoTLatIXjtpI3w0nbi+g4dqOl7VDCD3G3kL6gRmU+MTQirgF6Sqf/8tomy/CT
 ps0hVJ9vQzj9M51QG7ts3jgEN67DHwaqur9lqqAt/carIzdYC16ZL4ue2/4AbcK+vmyq
 9nvAJqKSV9AD5BWjOYTCjjoFramm+ucYU6LfYYjp73cYSy+M4NeXPNVPSdS1TkJMn00e
 XTBf5pjYSYWe23Q7tOj5PuNewX4vwOsON6vLzOP+lzvozdS37ZNBwU+WD+rKuC1CU/U7
 //0Q==
X-Gm-Message-State: AOAM533asigEKl4m/STwD0sNeAE5rT92xKgVkQGzwJ7yrl90hxSUqoRu
 +3b6sA3N+HHyJ9iq6hfQgfRUq2IAyOnHVnO/ZCvkBrNDSRHjEQ==
X-Google-Smtp-Source: ABdhPJyRnQpi5vv7QwGekFRPizrwFJ9W3ctMWdPf5IHV9fvj1itcuQ+k0HlJRt6+MmEzOnDSyHZpI1P+XmkyCxIrDAY=
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr3422111wrq.356.1622121862329; 
 Thu, 27 May 2021 06:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210527072047.2572741-1-hch@lst.de>
 <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
 <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
 <20210527131709.GA26019@lst.de>
In-Reply-To: <20210527131709.GA26019@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 May 2021 18:54:10 +0530
Message-ID: <CAAhSdy1zYdEgAVtePY9weOvzbnZ86DupWzoUKSn3Q98FDt50Ng@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
To: Christoph Hellwig <hch@lst.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_062426_132543_AEB3FBC3 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, May 27, 2021 at 6:47 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, May 27, 2021 at 03:15:09PM +0200, Paolo Bonzini wrote:
> >>> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> >> All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.
> >>
> >
> > Why aren't all these added by the series that add the module (not talking
> > about KVM only)?
>
> Yes, that is the way to do it.

Actually SBI v0.2 RFENCE extension defines all these calls hence Atish
added it as part of SBI v0.2 patches.

All sbi_remote_hfence_xyz() are primarily for hypervisors only.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
