Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3419FC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 02:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yh32S0D0qzNb495GTCbhuZr1Ig7qNV7gOxOwOtbLMgo=; b=0j0AVslBpg5OSdxSS8RPTsg4Aa
	R8bIcxO7Q3I2ORYksU8ERawIPqPVTJzv5VKDYAgoQvZ854K6CtOcfTQNJrshU0fD4enRVN2zeAaow
	S2VfdFaCYi8ok3qebpsDG5AaAaRZWuLzbByDH+5iMQ7qnRCQAvgk+EVckdt+PLlMXZqQMv8wjl3mn
	p2KzA57VyiNM3TDc7Co/MnlYOTKFbJHkrb+jI3ZwyhSTa6ZlA37o2cWDvQER/vWpPTOdJPmH9AjGR
	Jg7TGB/f8XeaN8qAqLU5MozAU0oRYw5Q5m2FI+u/JyAXzJGIEsnUmw5p15CO13Nmjufubfhx33moE
	203dDRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwaFF-00159h-Gg; Thu, 02 Jun 2022 02:07:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwaFC-00158y-Bb
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 02:07:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id p8so3521462pfh.8
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=9NElvwDqQjtltn5l/jL3hoAw2ukv8yqwztD6Fj5di1M=;
        b=ts73Ty4+pWhTgyjAU4ZSp9qhVwJ7e7RAJ0vNvocMNUPqEU1M7sRJdl5stT4dLBwesy
         eVj6pHpvALHme5uNN14rjG4DX9mroKj9lkFjrXckBPYEsnAN1wFIM9oIUkhVsrzbNQle
         6rVkFZw7qsDla1y1knfjFr7MH+4Mc7m2ISTDaPMFl1cS+jhjzl1yZ6k/M3Dey0y6742t
         EKaa7KJuTsu2xz3pv8tGlws1cYCff/+4qTnXp3/nLWYBEYCO9XHLJCckuGyZ0yb9yxDZ
         eLBN56kRta4qZ8zzXfd9C3YMDhb0DaGOnwvvIppJ4Z1HSPvR1Y1s3B31Oc2BToZfrExA
         iTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=9NElvwDqQjtltn5l/jL3hoAw2ukv8yqwztD6Fj5di1M=;
        b=EMq+ZmjXa2e9nBEyvOwJ08gD5OH+hdiA1iuV/6zHD8FYdrqs29vD0LXT/2oJzxclQX
         yB0/5C99zKVLTwnue5aR8b75eaHuNhctdqDbUJjFJEfOrOKEXBDkpNmz25sBnRXw6LEK
         o6+50/+5zfVJAMoKMQOAXPuVkPRr88oR/dqf7rjY3tvDoFJuK7pCsGqh86jGVeRcQ3Yd
         JZ+XI/IuNd8qc3FnLLcXCv0SreM9vzy0DGY+j7zsRN1CowCvlSaEvaOLI0xJF6E+6DbA
         YC/u0Lw+2Z12favyqXOdjEZ69xhGXEgf+F0Ch5J/G4L7UZKJLQaZTc5uRslJaGIRmkPO
         SVqw==
X-Gm-Message-State: AOAM531oqjWC8rtHZV9kx8O9JJ/xDMrXyZZQ3VNsnX6iWYFLx31eViWs
	JdJ5+hPz3TDATD65aNbgf3SJHg==
X-Google-Smtp-Source: ABdhPJw8GekBVL89dMuO5NhjVjGxu96NDqLPBmLWMhMxDu5JU8tAny589qxOrma5vzcXx5Q+ly3sZA==
X-Received: by 2002:a05:6a00:228c:b0:518:9533:4a1e with SMTP id f12-20020a056a00228c00b0051895334a1emr2528169pfe.79.1654135643698;
        Wed, 01 Jun 2022 19:07:23 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709026f0800b0016632179ecfsm1437844plk.264.2022.06.01.19.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:07:23 -0700 (PDT)
Date: Wed, 01 Jun 2022 19:07:23 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 19:07:17 PDT (-0700)
Subject: Re: [PATCH v5 00/10] PolarFire SoC dt for 5.19
In-Reply-To: <3cf58174-1ddd-219f-9f14-4d0015f697e7@microchip.com>
CC: robh+dt@kernel.org, krzk+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Daire.McNamara@microchip.com, Cyril.Jean@microchip.com,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, heiko@sntech.de,
  Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-2bb14a91-66b8-4e35-b58e-4b29bf2c5558@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_190726_635618_9A586FFF 
X-CRM114-Status: GOOD (  25.88  )
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

On Mon, 23 May 2022 04:47:55 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 09/05/2022 15:26, Conor Dooley wrote:
>> Hey all,
>> Got a few PolarFire SoC device tree related changes here for 5.19.
> 
> Hey Palmer,
> I know you're busy etc but I had been hoping you'd take this for
> 5.19. I know it's late, so nw if it's too late.

It wasn't too late for me, this is on for-next.  Thanks!

> Thanks,
> Conor.
> 
>> 
>> Firstly, patches 1 & 2 of this series supersede [0] & are unchanged
>> compared to that submission, figured it would just be easier to keep
>> all the changes in one series.
>> 
>> As discussed on irc, patch 3 removes the duplicated "microchip" from
>> the device tree files so that they follow a soc-board.dts & a
>> soc{,-fabric}.dtsi format.
>> 
>> Patch 5 makes the fabric dtsi board specific by renaming the file to
>> mpfs-icicle-kit-fabric.dtsi & including it in the dts rather than
>> mpfs.dtsi. Additionally this will allow other boards to define their
>> own reference fabric design. A revision specific compatible, added in
>> patch 4, is added to the dt also.
>> 
>> The remainder of the series adds a bare minimum devicetree for the
>> Sundance Polarberry.
>> 
>> Thanks,
>> Conor.
>> 
>> Changes since v4:
>> - Whitespace and status ordering changes in the polarberry dt pointed
>>    out by Heiko
>> - A new patch for same whitspace and status order changes, but applied
>>    to the icicle dt
>> - A reordering of the icicle dt alphabetically to match the formatting
>>    of the polarberry dt
>> 
>> Changes since v3:
>> - remove an extra line of wshitespace added to dt-binding
>> - remove unneeded "okay" status & sort status to node end
>> - sort polarberry dts entries in ~alphabetical order
>> - add a comment explaining why the second mac (mac0) is disabled on
>>    polarberry
>> 
>> Changes since v2:
>> - make ,icicle-reference compatible with ,mpfs & put it inside the enum
>> 
>> Changes since v1:
>> - fixed whitespace problems in the polarberry dts
>> - disabled mac0 for the polarberry as its port is on the optional
>>    carrier board
>> 
>> Conor Dooley (10):
>>    riscv: dts: microchip: remove icicle memory clocks
>>    riscv: dts: microchip: move sysctrlr out of soc bus
>>    riscv: dts: microchip: remove soc vendor from filenames
>>    dt-bindings: riscv: microchip: document icicle reference design
>>    riscv: dts: microchip: make the fabric dtsi board specific
>>    dt-bindings: vendor-prefixes: add Sundance DSP
>>    dt-bindings: riscv: microchip: add polarberry compatible string
>>    riscv: dts: microchip: add the sundance polarberry
>>    riscv: microchip: icicle: readability fixes
>>    riscv: dts: icicle: sort nodes alphabetically
>> 
>>   .../devicetree/bindings/riscv/microchip.yaml  |   2 +
>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>   arch/riscv/boot/dts/microchip/Makefile        |   3 +-
>>   ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |   2 +
>>   ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} | 105 +++++++++---------
>>   .../dts/microchip/mpfs-polarberry-fabric.dtsi |  16 +++
>>   .../boot/dts/microchip/mpfs-polarberry.dts    |  99 +++++++++++++++++
>>   .../{microchip-mpfs.dtsi => mpfs.dtsi}        |  11 +-
>>   8 files changed, 181 insertions(+), 59 deletions(-)
>>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
>>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
>>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
>>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
>>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)
>> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
