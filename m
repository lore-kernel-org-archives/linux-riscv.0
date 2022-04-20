Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28573C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 00:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LBxUi7Iu3FsKFrB/E3a5PfIO5Vy2226Ks3/SgR/5t3I=; b=lHazozKwGlq43c84r2v3ybk/Ce
	VFz09sbOyHklfBxouc/YNRohuZol7bF/96yAhvsu/+vD55VTPnlkjc3Xx/innEtzqbJW4AKYfhYgn
	G3ZhtQ3zEZd31X/9hvikcolOWaoi9EIncE75O/x58pCunxN71WYom0enp8g2PkekwIeJmT3R3HeXd
	++ypQGucKuLcVOxLe++04fzql3J8EuzP4S+PZrJh4T1Bjw6M5HtdHfhFiIX5+Au++wnLDvdoDs3k7
	UeFzYcre8Mi/KlTPeSOBXf/x2zV8w0y2jjKFM0S/p43EMC/YV3K5vYon2ElJMk8AwiqI62hbPazdg
	wxJBpzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngy3a-006gN2-Bq; Wed, 20 Apr 2022 00:18:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngy3X-006gIn-Hj
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 00:18:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id t4so29502pgc.1
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 17:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8m4sLnpIyX8zfbZGZxaNokmhKJeRbQ/UL/T2dqn4Rj8=;
 b=pAYUjQl3HCJWsKHJvSQYrl2vBnKRybBJ+y2Yzmpe4MvOmhVKXYperLQgIRLk3PIURT
 xgVQubCGf36IfmhtxuycN8I3OZVyNRRrliG4hfdxKyjV3e0EhvY84yPdh6UwnXa21pa9
 wggfK7z/v+f1ZmgViXBnVqzpso+C/MdHcsEFwWwHHB9nE6WWvwtPvpQXTXgW/UwYrKGE
 oWaHl2Ah5zVVeZy4PiBjfAjA9L7du677k8lzXbDB5L2jxvrXJ1QfKWROEzDX4//yrJWi
 qAGVxDTG15yPdbqxKjlrxHP3VvJzCqluAvCqHhwAjD0I4WzJdk1drjN6bVq4o4bNBO3d
 Gokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8m4sLnpIyX8zfbZGZxaNokmhKJeRbQ/UL/T2dqn4Rj8=;
 b=7yZOCEaoDRozzneHdIYxcJLSC8TxlOvW34/awgsZVmc5C3Buhn/vMmD0EzMndzD4NH
 /kcIJo1KRgMFr3XdszV7csxp7+mVahSUih22RJAJb9cF+Ah1e3U/MyYr/fxdWchyy57U
 7zxRXMQgdCAh+K+N8f4kpLwsfa5ejCRdpYsbOrVGcqtZe5Atl01MiyQpJPjZ5zMwaRYi
 mhAl9qVrTHor6tOFgGkK+aHuybSfIi/xgXpKCuMovWTCxvsk0VmcyI6REq7+IZSVXdGC
 BHeR+1MBKHnHfdMWV7tQ/CXiML8HiBxDj7IUEM8D9yGLHdFeJ8JmnWJANmVugQu8daE1
 Zp/A==
X-Gm-Message-State: AOAM530JOeScGBt2k2HVwQK40K7JN7T8TJsalB7l+oTSzpvB3zptwVcW
 CxM5llC9LzfYV1ALoY20gpPaTw==
X-Google-Smtp-Source: ABdhPJzY30m2JkFKvX9I7BrqiPAWeGK36jJzZMp7MhX7R9X0+P+aJW7JuRPGYNhm3Y9AWkoV3ONSYA==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id
 q16-20020a056a00089000b004f6686ea8a9mr20500588pfj.83.1650413912043; 
 Tue, 19 Apr 2022 17:18:32 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 a133-20020a621a8b000000b0050acaab7b29sm156609pfa.31.2022.04.19.17.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 17:18:31 -0700 (PDT)
Date: Tue, 19 Apr 2022 17:18:31 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Apr 2022 13:28:36 PDT (-0700)
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
In-Reply-To: <CANXhq0r15Z9NZj+xr7K_2Tt5VbK2r4+f7Fpg-f9BY98ufgKxcw@mail.gmail.com>
CC: vkoul@kernel.org, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, conor.dooley@microchip.com, geert@linux-m68k.org,
 bin.meng@windriver.com, 
 green.wan@sifive.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-75e55594-c878-4fad-9ffc-dc552111208e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_171851_613958_852DE55F 
X-CRM114-Status: GOOD (  20.51  )
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

On Mon, 11 Apr 2022 04:43:35 PDT (-0700), zong.li@sifive.com wrote:
> On Mon, Apr 11, 2022 at 6:48 PM Vinod Koul <vkoul@kernel.org> wrote:
>>
>> On 11-04-22, 10:51, Zong Li wrote:
>> > On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
>> > >
>> > > On 28-03-22, 17:52, Zong Li wrote:
>> > > > The PDMA driver currently assumes there are four channels by default, it
>> > > > might cause the error if there is actually less than four channels.
>> > > > Change that by getting number of channel dynamically from device tree.
>> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
>> > > > is no 'dma-channels' information in dts.
>> > >
>> > > Applied patch 1 & 4 to dmaengine-next, thanks
>> >
>> > Hi Vinod,
>> > Thanks for your help and review. For patch 2 and 3, does it mean that
>> > we should go through the riscv tree?
>>
>> Yes
>>
>
> Hi Palmer,
> Could you please help me to pick up the patch 2 and 3. Thanks :)

Sorry about that, I forgot about this one.  I just put them on for-next, 
there was a minor merge conflict but it looks pretty simple.

>
>> --
>> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
