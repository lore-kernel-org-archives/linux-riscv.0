Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681D2C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RDrYUaN827x0VBY3hWAjGnLKnNqkt/QAV838K6g/h4o=; b=vny3hC4/hqca+UqHltq87+76sf
	tJMBWNzouWfhPl/sJGjsX0UaNKye2k3HgiVOFPZzAqjZ7Gr3E/5DOWpwIirihd3qm2esg+gIxeOB3
	i7LbkMe9Td+vviRunnDsS6iPt2PJZxgfIzaaQHyy38JnhlehzDRMTry1HvUTy/qEbbV8ZYiVXmtJk
	BGlGH0Qq4KgkgUbhrsuSDceiW1p8/3BMnlxSh1q1jlNq/bDUHe666calyuFkH6xfyLflv2hxQBDI2
	HkOaiw1WwNtGLtLZCf6MfmDtD8Mc8VMWukyuePWP88Rhsdq6lSOEDxiVl/zFq8UhCDyUHjCJhQOds
	L0w6wMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7Q-0000000Ejsr-3y0O;
	Thu, 12 Jun 2025 22:09:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPn7G-0000000E9wB-21SU
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 18:57:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234bfe37cccso18131155ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749754653; x=1750359453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=IrVQI6o6eyFt5288vADLRUtySmOdou1LWpK8baO1QWgCDKrjTlZ9lIOBP9jWuhj9Li
         qntDCQwZE/3Yd8J+8zs0VJiAEGZFVIxDR6ZQh9jT9Hh314LrT8+hE4Q7gil/uzWSR3eH
         jul8SSexpXpWwix+SD0JXzcHNB/5OSmobaNTOLPJ8I9SvQpdX/nZSLGPh3gngxS6LNWW
         CFKQGz5XtnlzbUzDxUIoBbvj8xzYzKUF/cOHpK0TkY6rr/CChc2mWVPlhSs+k5mq63kq
         Hvm0VUDE7nyCx0wjenpJV1Htr0TXcSAKJyg8Nfv7lxMly8ICE6Gw3d25ZPa8qngFDVSH
         w+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754653; x=1750359453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=Yt1SPyBdZ7ZwTHbFseV/236SgT3fBiJKAesAusB3bzOwsL02iAHKNca7D3kyAisQCa
         XVwPaUIeNhi+Gky95g2igrFSZDDd5MJ4LXLOdSabEIwB1GMRLD/+7r/BYn5JDIgxKFAc
         +zknzTFnqIBhYqmkL1605/9C3pK8AO0h3q+WgVoRBvlffKQchXn+5MNL5rqNIalux/CB
         Aqpjgy3S2XT5OU21520bpBvNOi0wz/kLGp6euqYMNrzT6QpjOCabE7ouo6eOk1ovujau
         mvagyx1HGffFDHct8OaywdCInmW44Zi+2HJnzNkXKYSrL314Dhwzf7QVz9YeQ2rh+ViD
         d98g==
X-Forwarded-Encrypted: i=1; AJvYcCVBo/5QuIsVSbTuCjJo2y6+gCnoZyVeV9m8494CV7XkwelUPh0Xx0+cqGt0EI5ZHDNaqSpiSa0E/NzQ9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLPlgSm9P6zC2QOZKvLBM1DSmoVkGLbz8JwexrnVRECX+NfI/
	fa3HlBOuCkCMN9vKZRAbtlU81iNWW0Yebnv7fTAEs8WZUnyeuxgYMvjvxA1YhEdMZgNyEIHMTJg
	ilN0K
X-Gm-Gg: ASbGnctIhEgrG4caxleE3tpCH2et5b2G5SIuCLM3tN55WBkzIvsXu/gvfk1EArLhjs2
	OUeLPfhrB4NSEcbWXXCwPs91cdtOqR75CT9isrPyqX/8I79wjD8C4QFcAE8q1XHGvAcCZJnMJU4
	jZAh4Sy30jQynBgu5Iv2h466468cIVDbMFYqATi01rgsJ8sV5PDVUU6E/FWc80OHd+1FgwMUGp9
	xIZHcxdwzDlf+EL7npbAv60sy1UXiBaCHmnBo5l6YMz+5/vnIPd7FxnG+i3HX9y/3q7U6NIYW83
	4oFobn0p4UH1AuARU+afaZ/Uc96upghVeJBZjyc0wduEeda5WC065a8isTWJ
X-Google-Smtp-Source: AGHT+IHb1WoqMR2DTGzMl28JEVGljgw7Pu+7yw8Q/cYEW3M+CVBNmCMmaIsDvjDf9/pnPWIpZxZksQ==
X-Received: by 2002:a17:903:2305:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-2365da06422mr2349555ad.25.1749754653208;
        Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a4278sm625105ad.78.2025.06.12.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 11:56:53 PDT (-0700)
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
In-Reply-To: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr>
CC: dlan@gentoo.org, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guodong@riscstar.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_115734_651757_AB041C6E 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Jun 2025 06:12:09 PDT (-0700), Alexandre Ghiti wrote:
> On 6/12/25 11:32, Yixun Lan wrote:
>> Hi Alexandre,
>>
>> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
>>> Hi Yixun,
>>>
>>> On 6/11/25 16:56, Yixun Lan wrote:
>>>> Changes to defconfig should be always updated via 'make
>>>> savedefconfig', run this command to make it aligned again.
>>>>
>>>> This will ease the effort of reviewing changes of defconfig
>>>> in the future.
>>>>
>>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>>> ---
>>>> Update PDMA config bring in unnecessary changes[1], let's fix
>>>> it by run savedefconfig first.
>>>
>>> It would be easier if this patch was part of the PDMA series since the
>>> last patch will depend on it: @Guodong can you integrate this patch to
>>> your next revision of your patchset?
>>>
>> I'd rather make this patch independent, as nothing strongly ralated with PDMA,
>> and it probably would take several rounds for PDMA patch to be settled down..

Ya, I agree.

>> Besides, there is no problem for PDMA patch to depend on this patch if
>> needed (easy to use b4 to handle this..)

Yep, something like "b4 shazam -lts --merge --merge-base 958097bdf88"
should do it on the merge side -- and maybe you don't even need the 
merge base, if all the b4 send side stuff picks it up right.

>> The idea here is to get this patch merged as early as possible, as it's
>> quite straightforward, and other people may have similar problem instead
>> of PDMA here
>
>
> Ok makes sense, so let's Guodong deal with that then.

(for some reason this isn't showing up in patchwork)

I'm going to merge it as a single patch into for-next.  It'll loop 
through the tester, but things look in good shape so it shouldn't take 
too long.  This way there's a stable hash people can base stuff off, 
rather than waiting for some other patch set.

>
> Thanks,
>
> Alex
>
>
>>
>>> Thanks,
>>>
>>> Alex
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
