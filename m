Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70858C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Oct 2022 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdyQuaN0aAaMZXnTS+xbOLAmlqS250uJLEGTk1X8Hd4=; b=wKXyoV26FNImKR
	z9FSXr7MiSypVXj5KqeYO2jCbxRY2RuwXAKizLA0XJoMSxxtSeURNyiV5EBluNbYWVZE6Eepz6AAD
	YmUBBBR9MWJubBAZM1pWgqtANf7w+/XAcSx4bqxuLyeUNi77g717PwkJkATw0BeoStEK1qQp4cfR6
	t3ku5wUN5ztfsUA7T1bXUfYrurqkzwi6+J4V4Kwg2lNCXX6Pe930F6pvzVUih0L0sEDCPvLEYJvNU
	VXH3BCZDXD8m4qJBPQ72KF35TAyLOr+as1Z2++izffm/ZCnLBI44H1wW9EPCbYVIi3fnALqTXfR0x
	ZsQeNwDwnfSklzeosn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omAbk-00BwgV-Da; Sat, 22 Oct 2022 09:15:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omAbg-00BwfB-6Q
	for linux-riscv@lists.infradead.org; Sat, 22 Oct 2022 09:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666430151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZpbY5Z1kZrFHi8g1jxQJWEEPWxLnhzcOFeK0LBPOXA=;
	b=TIRh+p5P9tbxk6ro9nM/UVa7QIhLpZidJ+lDqFwoXVSt+2qx2BetT+ebG3ieNVH7f+/3NM
	4kVZsNCBCfOqX8tJ2sc62aHwXcWY/1UyLedrc1//DgeDMF3mJFB9BGtfZz0dYzRKcpl1UQ
	iMYjTBTU2wPMeOlLfTrfPCkXp8ZlPHI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-V3uVxIZpPjqXzLeRS7FwIA-1; Sat, 22 Oct 2022 05:15:49 -0400
X-MC-Unique: V3uVxIZpPjqXzLeRS7FwIA-1
Received: by mail-ed1-f72.google.com with SMTP id h9-20020a05640250c900b0045cfb639f56so4900860edb.13
        for <linux-riscv@lists.infradead.org>; Sat, 22 Oct 2022 02:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZpbY5Z1kZrFHi8g1jxQJWEEPWxLnhzcOFeK0LBPOXA=;
        b=Qy92pH6hnCqbbg0nPXVXNVnTEVGg5C4IhUS9lfrmyUdvCt6+h/8T2t11NyA+MOvCTb
         DOZwRAT2AfTEj32mgeHi42xmQHtc0cakFe5ZnNVe7zKLynuUf+M2geUPuZOq7H3S2Izf
         uI0yy1WQ8Md+AMgSmGfI9pc9/mmAJR88M4mnwvAd/YDaZ3pRk//R4WFje8nubTSOWX8W
         KIPO5k0u47mf+cG4WbKkAB/XQmE9hEfqfPZhUrGpoPJCB/0zbEcaVWyL7HeZrZH8Exa0
         SkI9Uo7enFbBx1rN98LI3BFjhGp7ofivYkD9fLvYEwpc48+AVDik7QQN0WkRoy+C5jsv
         WF6w==
X-Gm-Message-State: ACrzQf0hT8yYr3V7Fv8Fe/xlFA2jq9iGDr9Sk+i7mrZD1gWS5DxU8uED
	2DuKEBjndK+PFTGsoLuTl7JgixUyXXr9RAbBdKMix+fZpg2zRJF7JrBGShR2d+QJnHxGysjX3SA
	wRgnTCv8Z6skV38TRCbAUBb30Ec2L
X-Received: by 2002:a17:907:96a6:b0:78d:b6f6:3886 with SMTP id hd38-20020a17090796a600b0078db6f63886mr19986808ejc.106.1666430148755;
        Sat, 22 Oct 2022 02:15:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6aFw8TKdb0qW0brrUGxzPkNiKHAEEnGBYfMNPi4mTnGj4VcVAX5ZHSTCqA5EX4AttXcnBfsQ==
X-Received: by 2002:a17:907:96a6:b0:78d:b6f6:3886 with SMTP id hd38-20020a17090796a600b0078db6f63886mr19986797ejc.106.1666430148543;
        Sat, 22 Oct 2022 02:15:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:2f4b:62da:3159:e077? ([2001:b07:6468:f312:2f4b:62da:3159:e077])
        by smtp.googlemail.com with ESMTPSA id fe7-20020a056402390700b004587c2b5048sm14782686edb.52.2022.10.22.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 02:15:48 -0700 (PDT)
Message-ID: <0851c9e1-c63d-fca5-7a9f-10c8f8bae289@redhat.com>
Date: Sat, 22 Oct 2022 11:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.1, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy30JYf3SjDaAm6LHTU-yD36Nb8=FYaPpECm68O8XFdBDg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy30JYf3SjDaAm6LHTU-yD36Nb8=FYaPpECm68O8XFdBDg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_021552_344595_9C70F145 
X-CRM114-Status: GOOD (  14.28  )
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

On 10/21/22 09:56, Anup Patel wrote:
> Hi Paolo,
> 
> We have two fixes for 6.1:
> 1) Fix for compile error seen when RISCV_ISA_ZICBOM
>      is disabled. This fix touches code outside KVM RISC-V
>      but I am including this here since it was affecting KVM
>      compilation.
> 2) Fix for checking pending timer interrupt when RISC-V
>      Sstc extension is available.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>    Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.1-1
> 
> for you to fetch changes up to cea8896bd936135559253e9b23340cfa1cdf0caf:
> 
>    RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc (2022-10-21
> 11:52:45 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv fixes for 6.1, take #1
> 
> - Fix compilation without RISCV_ISA_ZICBOM
> - Fix kvm_riscv_vcpu_timer_pending() for Sstc
> 
> ----------------------------------------------------------------
> Andrew Jones (1):
>        RISC-V: Fix compilation without RISCV_ISA_ZICBOM
> 
> Anup Patel (1):
>        RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
> 
>   arch/riscv/include/asm/cacheflush.h     |  8 -------
>   arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
>   arch/riscv/kvm/vcpu.c                   |  3 +++
>   arch/riscv/kvm/vcpu_timer.c             | 17 ++++++++++++--
>   arch/riscv/mm/cacheflush.c              | 38 ++++++++++++++++++++++++++++++
>   arch/riscv/mm/dma-noncoherent.c         | 41 ---------------------------------
>   6 files changed, 57 insertions(+), 51 deletions(-)

Pulled, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
