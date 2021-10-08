Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9865C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 07:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FCB160ED6
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 07:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FCB160ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qtv/Lc87vSfDZHvfD9219RzQKmr64I5HKlGEDfHXC9U=; b=oE2MAlHXQzPO5n
	f6XNkyhUVNk2Uw9EbmFOo6V/jyRGLkNqXlVoNo4xW70a7Jr3sCarzjdRex8NmN1E9wjxeIx8rt0/T
	uemfIez2fdtakDOW9wli0XF0+gsVk35BxcaTsioTF7qP8W2Y9so+nhu5NkxJZVbhgPraNLA8P8/uk
	KXYCHlUDHONrMTkZizle2LqbBWq7tXn7oj21xTITvwPGTtu4PxV0r5Ap+6NJk+8VH/wRC6FNfeTdk
	lUGnntCwUR73DNk6oA5Gph+KHg/YWRxRGcOTcOS1Nf1IXjXuSRyYVCepYledq8rwYa6nzapYfzZXe
	76Nijb/YW7XvGmAOgz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYkGT-001qww-DM; Fri, 08 Oct 2021 07:25:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYkGB-001qvo-Ag
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 07:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633677936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrRRjHrMBPuEyYQ9nABVBskOpOCiCccfhJMKB+/G8Zw=;
 b=Rbrg2MAE8Gh56SqG7CgVbecWbILF3t7z4PuCCz/buxH+zunqtVEVAZgoUy26B6JxTsXuMg
 5K7bab8TXx8pvb4Vlc3m9TrgVn6m7BtG+YixDCVIvQ4ulspse97pXTqiY/9bsAU95O+tQw
 SCNe3UVjyftDEogKPaeMlKSpfMb1s8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Pd4pccfkNL6_jQYT-42pJA-1; Fri, 08 Oct 2021 03:25:35 -0400
X-MC-Unique: Pd4pccfkNL6_jQYT-42pJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so6601680wrg.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 00:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wrRRjHrMBPuEyYQ9nABVBskOpOCiCccfhJMKB+/G8Zw=;
 b=vfRnZAy3vVxtrVkHA3Gmtuao7wR+PvbTA6f8827X92O43JuULHysjACxsuWrgaJ4BQ
 4GbwW8slff3wAwJ4XihWOzqS5W+hVZ1o4Yaf5yi926pjfjmkyHQjDjxRAEiC/BYv3cDH
 L9fT2PIGFRTrDEe5B4FY5OLHKOYNYXwvgL3PynqUSBzWjnooC8Xc4bwi5BbHN+FOR0bp
 tM6XfuWtLUmpMEa2xaJZioh6inncHaEIEIgaknFsnF19WFopBEdVF9hb85q/08olKw9t
 M8QRjG4fO6UMuXDGfRhqC7bZYFeFUwNIgbobhcDd1Bp8gK5wgeQQL7e97N4cGjEYpN1a
 aP9g==
X-Gm-Message-State: AOAM533y5nBTV1ZimUvTFu7MAnabww6N+2emlOEDWQlI3lnM7zPuw3ix
 iyRvJM0gqk/VFUP4x+BxvVH+loxvXg/VWHG5iBKPGqU97gINaLA3RwjD2ZrlIEsZV9El8C3HP8z
 thLa5kUt4MyFCP1aBcNPPN1zboTn2
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr1623950wmq.151.1633677934630; 
 Fri, 08 Oct 2021 00:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx459d2wlytshtk9NfSLWJYxGFmOB+upXoDoldpSkMwornUH6TcLSGnAaLaf9rS4XzkmXVfxw==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr1623928wmq.151.1633677934392; 
 Fri, 08 Oct 2021 00:25:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k9sm1554498wrz.22.2021.10.08.00.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 00:25:33 -0700 (PDT)
Message-ID: <1616f9d2-5530-1266-6734-b5d64cb20658@redhat.com>
Date: Fri, 8 Oct 2021 09:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/5] RISC-V: Mark the existing SBI v0.1 implementation
 as legacy
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Anup Patel <anup.patel@wdc.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-2-atish.patra@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211008032036.2201971-2-atish.patra@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_002539_610584_69C40922 
X-CRM114-Status: UNSURE (   8.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/10/21 05:20, Atish Patra wrote:
> The existing SBI specification impelementation follows v0.1 or legacy
> specification. The latest specification known as v0.2 allows more
> scalability and performance improvements.
> 
> Rename the existing implementation as legacy and provide a way to allow
> future extensions.
> 
> Signed-off-by: Atish Patra<atish.patra@wdc.com>
> ---
>   arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
>   arch/riscv/kvm/vcpu_sbi.c             | 149 ++++++++++++++++++++------
>   2 files changed, 148 insertions(+), 30 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h

It's bikeshedding I know, but still: every time somebody calls something 
"legacy", a kitten dies.  Please use kvm_sbi_ext_0_1_handler and 
vcpu_sbi_ext_0_1.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
