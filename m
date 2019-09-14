Return-Path: <SRS0=/1wY=XJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3C2C4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2019 14:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E419B20717
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2019 14:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XF0ExkML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E419B20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=N+qpecLLaXUgtWV2VWZg3jt1i8OQFgz8SABAxyVHLcU=; b=XF0ExkMLtnD3xKjOrdHjHVYdB
	fCZdn+y/6XDZmlbofin3GMIYVBoumQ3G+zi1mwD7SP+5yo9qCguxJ1uT2rcapwEBtqpOII0ovnZd9
	LcIklKeTyTjomem4jSo/ZudlrHYpTLYEHzRksRUA3dFJuzOXHpIl/n/QwvJ3dOA2x9bJUxBeNnp0A
	rp8JImHeDw0ByWsuTPdp7iIMMVQ3RJ/47Rnhjzg4+FNA+plgCSdG8khkMPswOGTRn6ofFe0d4Ym23
	o9vmuu16tzJF4odKFglxYrCCg8jYYayB/Bp4wA35o2MqEC7+ITHwuWdDUuu1H9ozEXcNLWKrSO75E
	YebQViGzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i98cI-00036A-HU; Sat, 14 Sep 2019 14:01:34 +0000
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i98cF-00035K-Q8
 for linux-riscv@lists.infradead.org; Sat, 14 Sep 2019 14:01:33 +0000
Received: by mail-pl1-f194.google.com with SMTP id e5so3489405pls.9
 for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2019 07:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SXwC5T6wCRhaSBRQu04uBARGF1aDUDc2HyVfMMcCfp8=;
 b=i4KPYR0krzkbJdb5mCcQgKgPSlonUAtqX06rwwLNcfJcMQGhab96bRmdve6gVlr5MW
 qnM0NoInTtBwd6CO8Ldgy7OTzw3vJQPVFIJrpqixYxZDq6TUZ1tvPaammhEySqqlx/2G
 whw4884A+Yx7vV9myxl7hC2JKPWPJ1R9uMNoNk7EyH8bBL10Pl6jF+0x4frT9C7SoNuo
 ry5BKget5+U9V/EaP0+RFbvZBZsj5+nKkrhvYUs27usl2ZzhikaIGkuEOR8B7/8hbleX
 8G4PPXoKktn66ljW8twA1Z4drwViCL1LGqoIOM0kE+udijoL/rS8XvZozj1+O9o2NhCW
 JN7Q==
X-Gm-Message-State: APjAAAXXSdkTgcQyac4/SAEnfJ8g52FLEitpbYNrpKxDzqlldFpSb9nj
 e7O6KALNmEA5TpdprO5meBlG/w==
X-Google-Smtp-Source: APXvYqwLzMQI8pZxkVqd8/Fy8A16315KeB9n6NzIBBSxCASBhPGKSRyvm9h7GHG8COZItU0wdTcuOQ==
X-Received: by 2002:a17:902:d685:: with SMTP id
 v5mr16361073ply.15.1568469690307; 
 Sat, 14 Sep 2019 07:01:30 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id u17sm6671227pgf.8.2019.09.14.07.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 07:01:29 -0700 (PDT)
Date: Sat, 14 Sep 2019 07:01:29 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 07:00:16 PDT (-0700)
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
 separate file
In-Reply-To: <20190912140256.fwbutgmadpjbjnab@willie-the-truck>
From: Palmer Dabbelt <palmer@sifive.com>
To: will@kernel.org
Message-ID: <mhng-166dcd4f-9483-4aab-a83a-914d70ddb5a4@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190914_070131_881761_F182979C 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: julien.thierry@arm.com, catalin.marinas@arm.com,
 Will Deacon <will.deacon@arm.com>, christoffer.dall@arm.com,
 Atish Patra <Atish.Patra@wdc.com>, julien.grall@arm.com, guoren@kernel.org,
 gary@garyguo.net, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com, marc.zyngier@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, james.morse@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Sep 2019 07:02:56 PDT (-0700), will@kernel.org wrote:
> On Sun, Sep 08, 2019 at 07:52:55AM +0800, Guo Ren wrote:
>> On Mon, Jun 24, 2019 at 6:40 PM Will Deacon <will@kernel.org> wrote:
>> > > I'll keep my system use the same ASID for SMP + IOMMU :P
>> >
>> > You will want a separate allocator for that:
>> >
>> > https://lkml.kernel.org/r/20190610184714.6786-2-jean-philippe.brucker@arm.com
>>
>> Yes, it is hard to maintain ASID between IOMMU and CPUMMU or different
>> system, because it's difficult to synchronize the IO_ASID when the CPU
>> ASID is rollover.
>> But we could still use hardware broadcast TLB invalidation instruction
>> to uniformly manage the ASID and IO_ASID, or OTHER_ASID in our IOMMU.
>
> That's probably a bad idea, because you'll likely stall execution on the
> CPU until the IOTLB has completed invalidation. In the case of ATS, I think
> an endpoint ATC is permitted to take over a minute to respond. In reality, I
> suspect the worst you'll ever see would be in the msec range, but that's
> still an unacceptable period of time to hold a CPU.
>
>> Welcome to join our disscusion:
>> "Introduce an implementation of IOMMU in linux-riscv"
>> 9 Sep 2019, 10:45 Jade-room-I&II (Corinthia Hotel Lisbon) RISC-V MC
>
> I attended this session, but it unfortunately raised many more questions
> than it answered.

Ya, we're a long way from figuring this out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
