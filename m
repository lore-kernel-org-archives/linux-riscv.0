Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CDCC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 15:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4719721529
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 15:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNePIPae";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eKGcVeVI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4719721529
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BPTWtTjDa+hi1GVXJZPdTyAAE4mRVK9mEI+ZxhaolYA=; b=WNePIPaePTlohO8QvO0jh6sQh
	3/98RrLUD2pCiKEA+H6cGUq2oR4FTa5ScOnZYJUCXoyySCKfHI0TRSBuVoxt63mWNYozIL7UVJkyz
	jyBSbhOTPdmaDfBax0dsxEaQdyb+R0T52K48lTFR0nS1bf+3d00xz2FLQX/SSY3SRBevhL04rsfjs
	Ij/GwAj1/QxKloITmnH4M2i36t8swKbEdxD6kKpv5IGHuC/jSoyVRgppNA///FGFwvvukAXUty+sS
	H7xDrSlmsv0noEHIlFMa+cpcxV/pyOM7ym6alKj0mZuI3Q5qYf4APEKiu1+2cB5zKAoTPn+peZU5q
	7JAqVAqZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5CDJ-0002co-LS; Wed, 26 Sep 2018 15:58:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5BuJ-0008Nf-OT
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 15:39:21 +0000
Received: by mail-pg1-x541.google.com with SMTP id z3-v6so9149153pgv.8
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ryMq0n4NXyX3k8D/c32IFSadA4m4EEH+Y5xbYnB+Hc0=;
 b=eKGcVeVIyRSSDYdqH72gislg/jVrDS7Ln7ETE+jMIRL8MP+gLI6hMO6Agf0lBpWvNz
 Bks5wjj1woObolUKiPq6SvvcwVaDlt4H6JX2JB8D/glol8uidqiOUUvaHumrQMWynfx7
 VOz/AiYS/I6G5hhjkG76gxG2sCtBhnSNRdpd8IqV1HtgRWEV1FDtz3stmjvjTbmWxbXa
 xRQ3v0nDVRIrR1oYrNG2deJzLCreV8oMOMsLQynE29Vz7YXdcx1myKtE7gxFDdGdxCJK
 jvgU31KI67d0VZqPf7qmRzDeUVvF6F9Ip2KN2K9IFUx868b6ThhtD2DTRAbJ/tG9GrQQ
 xdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ryMq0n4NXyX3k8D/c32IFSadA4m4EEH+Y5xbYnB+Hc0=;
 b=b6Qy9VX6bQB82F9c3keMW7IyvCFaCA5Zoj/cOE3DQHaYXvQeGEElMrgweRiXDkUHNB
 SwJrnOYxnmSBTWK8fK+L2YoP2MooFQ7TPWgLNfgOSbYAD+a6LJ4qijvdtHLlgys//5EC
 Vf4Ub2yknaznJBmHYU1efG1d/f3s42gfbKxpRJHL2Uu1/C96UJnqjy5/T4Tuh3MmZ+2D
 asnEGZdyOweH9/GREdPFBWF0hF9+1FQmYbtJ2KoUcTmIBVeRuQ8/VDqsfg1G731LKgYa
 wT9INwGoO8YA8GtP07y93ZExq6d/51yJMHR5r/Ij53HWCFV8jwLBEuggVzYbfTaqvmCl
 x4Rg==
X-Gm-Message-State: ABuFfojQRhLwjL2QcK2Y0m+0+Yp+Nzqb5861ro7oIDC8hbBQxFUogCA+
 C14DzI6UXuitKuI8rzYBe3jEGg==
X-Google-Smtp-Source: ACcGV637AqhV98vrITMlEZ53kM9fM9VzELlYiskQSudBqu63ymmnGczPqNu9xvmS4nu6xx8rCDpf5g==
X-Received: by 2002:a63:2441:: with SMTP id
 k62-v6mr6329727pgk.26.1537976334660; 
 Wed, 26 Sep 2018 08:38:54 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f13-v6sm7660662pgs.92.2018.09.26.08.38.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 08:38:53 -0700 (PDT)
Date: Wed, 26 Sep 2018 08:38:53 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Sep 2018 08:19:44 PDT (-0700)
Subject: Re: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy3unGBSS9Xgozwt4so_RBOr1WSugiP-4J49q-GOub2mDQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-0d0ee718-944f-4798-a6d8-e14f6ad51c37@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_083919_849980_55C03DE6 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926153853.XCrOdCdkK8hL8cdJm4ISUDQI8JfRwdVA_iqZcJaho-U@z>

On Tue, 25 Sep 2018 22:54:48 PDT (-0700), anup@brainfault.org wrote:
> On Mon, Sep 17, 2018 at 7:58 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Sep 17, 2018 at 7:44 PM Christoph Hellwig <hch@infradead.org> wrote:
>> >
>> > On Mon, Sep 10, 2018 at 10:08:58PM +0530, Anup Patel wrote:
>> > > > They could in theory IFF someone actually get the use case through
>> > > > the riscv privileged spec working group.
>> > >
>> > > Their is no point in having each and every possible local interrupts
>> > > defined by RISC-V spec because some of these will be CPU
>> > > implementation specific in which case these local interrupts will
>> > > be described in platform specific DT passed to Linux.
>> >
>> > Again, to legally have implementation specific local interrupt types
>> > you'll first need to convice the spec to change the status for those
>> > fields from reserved to implementation specific.
>>
>> I agree, this needs to be first clarified in RISC-V spec. May be this is
>> a good topic for discussion in any upcoming RISC-V meetup.
>>
>> Until then anyone can try these patches from riscv_intc_v2 branch of
>> https://github.com/avpatel/linux
>>
>
> I released that CLIC is going to be available for both M-mode and S-mode.
> Software can choose to use HLIC or CLIC based on it's own preference.
>
> If we are going to support both HLIC and CLIC in Linux kernel for per-CPU
> local interrupts then we should definitely have irqdomain and irqchip for
> per-CPU local interrupts. The selection between HLIC and CLIC will be
> based on which driver gets probed via DT.

Yes, and note that the CLIC is actually an extension of what is currently 
available.  Thus we could produce a single driver that supports both, with 
features selected based on a DT entry.

I'm not sure if a native CLIC driver buys us anything in Linux, though, as 
IIRC there aren't that many CLIC features that will be particularly useful in 
our space.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
