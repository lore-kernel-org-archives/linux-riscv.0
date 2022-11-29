Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2258C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bd+Rhz6b/4c2UDLYrNohMMB0/cvttyK3LNGDE5z5nVU=; b=fY+X77c9karqbVNquSBUSaBou4
	gAaDGU4LJLLmrd3mbhEvfqNFViZGDMEWBxO5yvx5BkMcpRcZPira8pgTXrRXtCY70Yc+8hk/HbW+d
	Lh8mZoQp0Z9j3whBPnx2IqYZfymSshsMY9ru7WCix4gOavm3e7v3GMKym7EqqQhbLRdGh9kkNumRz
	VFCklyFrFIqQVi3imTr8v3KEX7VJjP/uXJ7r0Bkyv3T50K/kqQbo6xqsUb8refpAw7CG0LHZQv8ha
	oZRPpNEliPdtBr5uQDI+VNvtwWrA1l5GQM5qb+CnuQO8HUk80cFLcQ96ywkT7c5ZsIUEplwuwbhXC
	u/n58K8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Sw-00BSS9-LY; Tue, 29 Nov 2022 21:48:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08St-00BSRF-3x
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:48:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 140so15014723pfz.6
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2rEg8wxwZnb/RRq7pydD8EKo9UGN5bO2dwnxJzhk+U=;
        b=LXBh6nGdCgtU4Egsi00JARodzE08336wEPuKzG2JcjzN+EPT86KCedKKKpjLPOWoZL
         HcW/9NfmdEZXQmKUBYW7W1t943rkv0ecjqrNMNEif1heZGw6oZOqMEtxYdFD3lXg64rG
         rKcyvcXLdiUJTVhJSizEHKSNHUdgJwCgJnQ5EHX3RYg+7sb6CIunWFYN/ORMRNOwATrm
         KU59OInZ9eoj6p+4Ww3jkoWRb6Qrrav7RqF454WKocyqJ00o2wvES0LDw8nHgiYpRfAl
         Zqfmp0IS0feOYc9O7FsTvuwOedKV/5RmsoiMRGaOK6Rr71MYBgQRrdVDXJQcDxki5Ztk
         KN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2rEg8wxwZnb/RRq7pydD8EKo9UGN5bO2dwnxJzhk+U=;
        b=aiv9IpHE2ycxbCUieoMGYKjswRvT0SsD6WCBiCQKcm7nUuol5IoR0SLJ5Mj9bsf+us
         rfpGtVpAKilZVL1Gmum6V73LOKtcJpkzfQe+nnc+PYs3YZ93aZV/FpeNzNfNbmEiUPu1
         IeiLGBvxIgTghyd9sGR1W19AFPKn3QVqG9hXjxsw5SLQjTII96apo/0HeTHSBAiI49JY
         3G4vGQd+NTcQ7qbx/g4V283J/eQlWz0Cqp95fdAj3xwHGy6fJGRZivf20yzJ1p4fL/DR
         ccbonRD1M9qP7zEfs2t7Epu5jRCneL9m4ali+0gQMEDgce+L0jYnhVM+B62gwluzgUvq
         e9ww==
X-Gm-Message-State: ANoB5pnglaE8ZoApexw0WapaFGnEckqK7jed8U9K9z6U2EIuuZjgpXGd
	6S1bdplw7N/QrdES9amj6/USqmJYwuyUlg==
X-Google-Smtp-Source: AA0mqf6ezXKSZSDCNjiUNak+A7iRax5Qm3OqF6iVsJ7b68ITGWiBAiFdJs4QH7AGxS7xbuemML1YVw==
X-Received: by 2002:a63:ea15:0:b0:457:7285:fd2d with SMTP id c21-20020a63ea15000000b004577285fd2dmr34863299pgi.580.1669758507125;
        Tue, 29 Nov 2022 13:48:27 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j8-20020a170903024800b00186abb95bfdsm11349116plh.25.2022.11.29.13.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 13:48:26 -0800 (PST)
Date: Tue, 29 Nov 2022 13:48:26 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 13:48:17 PST (-0800)
Subject: Re: [PATCH] RISC-V: enable sparsemem by default for defconfig
In-Reply-To: <Y4Z7Qcfglxv6EuZz@spud>
CC: linux-riscv@lists.infradead.org, daire.mcnamara@microchip.com,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-4cbfead3-e199-4075-9e45-68d91947f723@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_134831_174991_3C27A38F 
X-CRM114-Status: GOOD (  25.39  )
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

On Tue, 29 Nov 2022 13:36:01 PST (-0800), Conor Dooley wrote:
> On Tue, Nov 29, 2022 at 01:21:11PM -0800, Palmer Dabbelt wrote:
>> On Fri, 21 Oct 2022 17:00:30 +0100, Conor Dooley wrote:
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> >
>> > on an arch level, RISC-V defaults to FLATMEM. On PolarFire SoC, the
>> > memory layout is almost always sparse, with a maximum of 1 GiB at
>> > 0x8000_0000 & a possible 16 GiB range at 0x10_0000_0000. The Icicle kit,
>> > for example, has 2 GiB of DDR - so there's a big hole in the memory map
>> > between the two gigs. Prior to v6.1-rc1, boot times from defconfig
>> > builds were pretty bad on Icicle but enabling sparsemem would fix those
>> > issues. As of v6.1-rc1, the Icicle kit no longer boots from defconfig
>> > builds with the in-kernel devicetree. A change to the memory map
>> > resulted in a futher "sparse-ification", producing a splat on boot:
>> >
>> > [...]
>>
>> Applied, thanks!
>>
>> [1/1] RISC-V: enable sparsemem by default for defconfig
>>       https://git.kernel.org/palmer/c/41555cc9e2e9
>>
>> I put this one on for-next under the argument it's not actually fixing a
>> regression: if flatmem is now broken then that's a regression, but just turning
>> it off isn't really the fix (even if it's still a reasonable thing to do).
>
> flatmem is not broken, or at least - I haven't seen any evidence of it.
> It's just that to support multiplatform stuff properly we should not be
> assuming flatmem since systems may not fit the bill. The above oops is
> because the memory map is too sparse for flatmem to keep papering over
> the cracks any more after some DT changes I made for v6.1
>
>> Maybe that's kind of pedantic, but it's late in the cycle.
>
> No, that's perfectly reasonable to me. I'll just add an exception in our
> CI for testing v6.1 when it becomes a stable kernel to not build
> defconfig as-is ;)

OK, sounds good.

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
