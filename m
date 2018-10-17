Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40FFECDE30
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 12:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C18B2150D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 12:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TWlH2Yuy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwwuuJrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C18B2150D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2aqaKXUyIDN8kjAoxhqYDwZ2t6gxksQ3XCUfhoPLEM=; b=TWlH2Yuylp+4I4
	sfVnF3PKGQcEw1E076gNLN52vS+izcSuPMkRyvoDWrOHpDUcOLbHlH/HK/aDN/LqS3OCmvPR5BAov
	iSBCpCJW9l5bAbA3LofAQSGjQZ9CRQIJhEW1XG+AJoM91fDq2bOqqcLyhCxSYmr0dlRWN3r5CaFvt
	CLL17+5LHikeyi4zkOb9ITAVJH5ks6RQQFH6YE/D3gPU74HjnyeOzNlIYbvCTb1I5nzak1svcggHS
	R2/RKKKfFeJzeW9TShJBPZztRuh5lYluPGUUWpLzk4PBjUosLe0Ehae1XmfBfEglrwlKpzkGJheqf
	Azwzjna2ap+XriZ7UeFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCkYW-000702-FF; Wed, 17 Oct 2018 12:04:04 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCkYS-0006z5-7f
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 12:04:02 +0000
Received: by mail-ua1-x942.google.com with SMTP id c10so4643369uao.12
 for <linux-riscv@lists.infradead.org>; Wed, 17 Oct 2018 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r8LZNzgZpMhxuFBJU11XyLK+4+kwXYSjL0emL+f+Co8=;
 b=dwwuuJrT6hhWTtyngTswGT/2kQ6mCuFpw2khsKhTivoJsKTTx0TiUxYLzwhGGSsUHW
 11p0vRpdHbi0wqx3PWWMg+gJlgZkXa5ttPUXmnG935fgSiPa4JNaAcsPSkiVDT61Rs4Y
 IAHt3Rm++f8KA0EWLVuZUqJrCFv4oM2C7O6Al/OslSbGkJRPAcZchBNQ7RsLA5gsWbfg
 1vLb3JACpCO3IiA7/6Zk9USVAbj/tVOpady63Yz8UtrI0ttUe/l+Y8HWzsIuKxiIQZh9
 NVZmQh/i5zn5N0CmECVN5i0gMJaYlq88thnVrbNfbYHMh0lzISZLYBxktZJvQ9N4zlo+
 e51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8LZNzgZpMhxuFBJU11XyLK+4+kwXYSjL0emL+f+Co8=;
 b=Lr75zbgzaQEOoS0Xl2Kajovkg8xhguIvAszVbg59yqR5ph8KIPUD9fbBtWxfjWae8I
 u+2zt2MO1p4SN7m27lvsKYlnBN7w6vYvOEmMpNLZUAX7uoyTnX2oE0sk2g6jPyzKh7JJ
 Q0MWes1wq1JGr3l1s3/IgIuZfFpPknJEs7lBiIfTPSla4Tggdpo4rvziRIWPFOvD6zNT
 ZIL4HxQ3z7ErTMK9tafkiOEM2S7IyqgEoL+Zp4XGDxWog3o7uEMLQIl2zbxI89xVfgdH
 lhdRVXlsj9M+QeFc461ljLvKawY6k612ht8RM2gBs4aOGMqTJIkrz6n8iT8DIIAOktyk
 AhhQ==
X-Gm-Message-State: ABuFfoj7XUT0Sn9Uc38uwnnc0iHg6zPxziLYhByw4YxNnHyfWOstPmsh
 fmWZnAs8kqOabikIDHIAjr59JNR/64Si6fbIJOE=
X-Google-Smtp-Source: ACcGV63opZNYJgniTrvVd92rgPBxeUYuoczi0qfPc2x8dVaZFq/Sst0ahFyKr8rkg9lc6l3Y7OC09iCj3r2d9aEdus4=
X-Received: by 2002:ab0:4543:: with SMTP id r61mr2798476uar.107.1539777827580; 
 Wed, 17 Oct 2018 05:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
In-Reply-To: <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 17 Oct 2018 17:33:36 +0530
Message-ID:
 <CAOuPNLifWA0rihQp0PjhhzDcKy9BHYDr966tEqejWaMrLu2K4g@mail.gmail.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_050400_331565_FDD42EF9 
X-CRM114-Status: GOOD (  27.49  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org, rjones@redhat.com,
 Michael Clark <michaeljclark@mac.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017120336.8HH4RYTecwmWfM1SLP5jsOww5YPF-1-cUQB4_-fJfTY@z>

On Wed, Oct 17, 2018 at 12:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 16 Oct 2018 06:12:11 PDT (-0700), pintu.ping@gmail.com wrote:
> > On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones@redhat.com wrote:
> >
> >> >
> >> >> > virtio_blk: probe of virtio0 failed with error -22
> >> >
> >> > ... I saw this exact error when I was using the upstream kernel
> >> > instead of the one which supported interrupt handling.  Interrupt
> >> > handling for RISC-V was added upstream after 4.18 so wouldn't be
> >> > included in upstream 4.18.0-rc6.
> >>
> >> Your best bet today is to run 4.19-rc8, which should be pretty stable.
> >
> > Yes, I checked with mainline linux-kernel 4.19.
> > Now I am able to boot successfully and login into qemu-riscv shell.
> > Thank you so much :)
> >
> > But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
> > Which is the exact patch in mainline, that fixes this issue?
> > Because at times during the development, it will be difficult to
> > simply upgrade the kernel version.
>
> Yes, that's expected.  RISC-V Linux is still pretty bleeding edge, you just
> happened to catch it between when master started working and when there was a
> proper release that contained your patches.  Since master is very calm right
> now (there was an rc8 before release, but it's very close to a release) it's OK
> to use, but you best bet going forward is to use the release tarballs just like
> normal.
>
> > So, I wanted to stick to 4.18 itself, however I can back port the
> > patches from 4.19 to fix the issue.
>
> We have a backports branch, it's called "riscv-linux-4.18".  I'll continue to
> produce a backports branch for the latest upstream release until things get
> pretty stable.
>
> > So, if you can point me to the exact patch, it will be of great help.
>
> Here's the PLIC driver, but it depends on a bunch of other patches.  Like I
> said, that's what the backports branch is for :)
>
> $ git log drivers/irqchip/irq-sifive-plic.c | cat
> commit 8237f8bc4f6eb7e5ce2a19276079cfd3a7c6314a
> gpg: Signature made Mon 13 Aug 2018 08:31:32 AM PDT
> gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
> gpg:                issuer "palmer@dabbelt.com"
> gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
> gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Jul 26 16:27:00 2018 +0200
>
>     irqchip: add a SiFive PLIC driver
>
>     Add a driver for the SiFive implementation of the RISC-V Platform Level
>     Interrupt Controller (PLIC).  The PLIC connects global interrupt sources
>     to the local interrupt controller on each hart.
>
>     This driver is based on the driver in the RISC-V tree from Palmer Dabbelt,
>     but has been almost entirely rewritten since, and includes many fixes
>     from Atish Patra.
>

Ok thank you so much for the detailed explanation.
I roughly understood the changes.
I will continue to use 4.19 mainline kernel.
Yes I think it's petty stable :)
Hopefully, I will try to contribute few items for riscv linux kernel.

Thanks

>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Acked-by: Thomas Gleixner <tglx@linutronix.de>
>     Reviewed-by: Atish Patra <atish.patra@wdc.com>
>     [Binding update by Palmer]
>     Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> >
> > Thanks,
> > Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
