Return-Path: <SRS0=pesg=US=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0BDC31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 11:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F7C2084A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 11:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJvnJ0TO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmwB9jSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F7C2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9zCfI/Z614vMaJO0lNfN/M1VSrtRzVMFpqL7PPsLVs=; b=oJvnJ0TOgMWPwj
	k2VlOaK42BElJKYrMMmGZq2LbRyULyUR2ydB2jA9+U9xEntzG28AItz/IYspUSAKFD8e4fMe/5rXR
	pFboMp8jWrrqPivJ7bH7RcksRMRuzmKTIand0yJGoNeViZG8HxbftEbpYJfUTFRnY254qYUHYOt6b
	62TKNniq8eYMLgWLHG1vnuxro9qVQgY/1YDU9DpaLn4U1nH0P1F4nrBQBcqnuGgX+bWIqdWjYotvI
	EDGySad0dlhJYAVWCiUvZYm0c96DlUNW5umTTlObqcY3mRQkcXjgXBiH+TMTqWGX0ZiH6ahMmvo14
	sVGEK23U2WVeBEDiIWIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdZ7g-0003YQ-Dk; Wed, 19 Jun 2019 11:51:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdZ7V-0003NN-2i; Wed, 19 Jun 2019 11:51:18 +0000
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 228FA2166E;
 Wed, 19 Jun 2019 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560945076;
 bh=I9GUMrpXQQ4kP+XRlQm8nsuNTpCDLDeTZGuUV6StNpU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmwB9jSneP5zvx+aO02e5ajh7HUMAmZwr7xBYZDziZHiVUbMqpfSn8oGPrp0ASWB1
 sAvfxTB1iTWoia0261g0Sybv0xAczcIdmA2GuWCcWniP/g8jQtbG7aTs0gHCmOwBgQ
 YLpwwQIAR7bV4++qpk+nQNV5GnVE/J+aFsVTa1nU=
Received: by mail-wr1-f47.google.com with SMTP id k11so3092413wrl.1;
 Wed, 19 Jun 2019 04:51:16 -0700 (PDT)
X-Gm-Message-State: APjAAAUeAof8K9aNr1meOAYplsWqTCrUsgHwbtIs3jg/mYODTnO/QB3O
 /ZynSqcNxXv23oE/OKsP2s5+ycs1eakv1gM2B+Y=
X-Google-Smtp-Source: APXvYqy+0U1Ub7AMCGJu+3bTvhBYfZ23ab1bs8cRs50+HW9TdRv1m5YTdwBFzYfP6I5ojcMFW3AyuYO4S1RyjAIIWQ0=
X-Received: by 2002:adf:f28a:: with SMTP id k10mr4144332wro.343.1560945074589; 
 Wed, 19 Jun 2019 04:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190321163623.20219-1-julien.grall@arm.com>
 <20190321163623.20219-12-julien.grall@arm.com>
 <0dfe120b-066a-2ac8-13bc-3f5a29e2caa3@arm.com>
 <CAJF2gTTXHHgDboaexdHA284y6kNZVSjLis5-Q2rDnXCxr4RSmA@mail.gmail.com>
 <c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
In-Reply-To: <c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Jun 2019 19:51:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
Message-ID: <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
 separate file
To: Julien Grall <julien.grall@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_045117_140022_6B68E342 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: julien.thierry@arm.com, aou@eecs.berkeley.edu, james.morse@arm.com,
 suzuki.poulose@arm.com, Marc Zyngier <marc.zyngier@arm.com>,
 catalin.marinas@arm.com, Anup Patel <anup.Patel@wdc.com>, will.deacon@arm.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, hch@infradead.org,
 Atish.Patra@wdc.com, Palmer Dabbelt <palmer@sifive.com>, gary@garyguo.net,
 paul.walmsley@sifive.com, christoffer.dall@arm.com,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 19, 2019 at 4:54 PM Julien Grall <julien.grall@arm.com> wrote:
>
>
>
> On 6/19/19 9:07 AM, Guo Ren wrote:
> > Hi Julien,
>
> Hi,
>
> >
> > You forgot CCing C-SKY folks :P
>
> I wasn't aware you could be interested :).
>
> >
> > Move arm asid allocator code in a generic one is a agood idea, I've
> > made a patchset for C-SKY and test is on processing, See:
> > https://lore.kernel.org/linux-csky/1560930553-26502-1-git-send-email-guoren@kernel.org/
> >
> > If you plan to seperate it into generic one, I could co-work with you.
>
> Was the ASID allocator work out of box on C-Sky?
Almost done, but one question:
arm64 remove the code in switch_mm:
  cpumask_clear_cpu(cpu, mm_cpumask(prev));
  cpumask_set_cpu(cpu, mm_cpumask(next));

Why? Although arm64 cache operations could affect all harts with CTC
method of interconnect, I think we should
keep these code for primitive integrity in linux. Because cpu_bitmap
is in mm_struct instead of mm->context.

In current csky's patches I've also removed the codes the same as
arm64, but I'll add it back at next version.

> If so, I can easily move the code in a generic place (maybe lib/asid.c).
I think it's OK.

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
