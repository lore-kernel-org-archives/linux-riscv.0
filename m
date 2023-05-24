Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA959C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 23:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QrzB0u4/L48vE1rTAtMGP/diKwD5O+5Nt2N3gLNqXH0=; b=rsJ3iGeBxyzisMhcuNKgrjGXaX
	jQF7awoHMU5ODQs1RfoA7dVGcxJz2sNbXKj+QVaQJslcohraHTf0q4FtWBGHSbiJSjPFcXYdhevey
	giwiaZdZfg/NLnSMeJDV3uzq0PhmGFuE9Hm6lwZosJNKAMVvUcaOS9c28Py2FvZdsrTQuWKNPlxMw
	l2Ef6yGC9r5SDu0982vuHvlzx1pePUzN4KRHz8bLFTE7Wkiuuu3l6GLQw1buYZTeGXZ3O65MSsz0L
	/RqBqmd6zatQDDL1b2I/8qRhCCXe0F759j15i5pzcRFl150dlkiON9Oxj2PrS0PwPy3OaajK6NUX4
	zL83m2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xdO-00Eu1i-0y;
	Wed, 24 May 2023 23:11:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xdL-00Eu0q-11
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 23:11:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d2da69fdfso1723583b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 May 2023 16:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684969866; x=1687561866;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pe7gaA9UsfRuwKM22JT9QpzO4MPDni9Xx35THIw0/Sc=;
        b=nUdfLTJ9VXB4wv2uw4rTFXldJ6hEnnl/9n+CZ3JkG+aT0voqj3TrFZDAt2Q28c0THo
         YuTu6F0JK3xReQo9yXuLvzzkW7tNgk6prvoCONpLoYmXY1Y4ecakBH1gWCVrDJ+SQpyX
         UFtPcdm2Rg31k3hHkqztUBvjXqmUvL7y/O+HNbYDvmOixVWhoe6TzjT8bvdYVj6hn3G8
         IGV2Et1NOv62l45AiIKSRhTuWJ+3xhb5DRJpW9N1ezgZeESSLDGqmvc31ujVFbFYvM7X
         vNIHNigqhGdGFAWI5AEEFNMsBkR0bPjKtNWsj15aV3Oxz6XbI4uxvRF32GQPasV6ISns
         T0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684969866; x=1687561866;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7gaA9UsfRuwKM22JT9QpzO4MPDni9Xx35THIw0/Sc=;
        b=Cwcu/JQOu2ESRG76BQXwDVpnkM1BVP8R6l3HlXWRueRRhFZD6UMpyuIoupyPoxvakm
         DBeC/9VMEvS/Sw8lWxpfBV5vmDP7q3uynA3e35hUVr9EiqPNU2fQywRxRyBMVnQI3Dsz
         RKUR8lWksQtH6mHx5iWY7A/ITuFT7b+okUyVoZ1stCLPSzU/OdBPHt7wusuu477QW1wf
         768WC40Me0XTGyfJ+o0OUJHmb5ie5+pyUCokLUFRI1y7V6NkdbVTF+OIB/EwEc+cofwO
         kAytE64kyzVB8GUQyyB8jg8MekuC7pHpxl1KIb9E8QnvkPsE6NEnlCH8mgxy6pTa+HVC
         zVxg==
X-Gm-Message-State: AC+VfDwNV5xldFoLWqPm1YfgBaEUH+DZEymsUni4lhNMWbq4iGZ7bpn1
	29l9mZ8AM4jb0eLkQDbGELL2EA==
X-Google-Smtp-Source: ACHHUZ5obUwMpsIPazuOVWmOubniktGfHOyfscZDmvlWCHJd4LOz14T+fX5wTLTyVKpkDbu+dfUXGw==
X-Received: by 2002:a05:6a20:728c:b0:ff:da37:ae9 with SMTP id o12-20020a056a20728c00b000ffda370ae9mr22151852pzk.53.1684969865718;
        Wed, 24 May 2023 16:11:05 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v4-20020a17090a458400b00246f9725ffcsm27113pjg.33.2023.05.24.16.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:11:05 -0700 (PDT)
Date: Wed, 24 May 2023 16:11:05 -0700 (PDT)
X-Google-Original-Date: Wed, 24 May 2023 16:10:39 PDT (-0700)
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
In-Reply-To: <20230524-scalping-number-63ec10c1f7bf@spud>
CC: rdunlap@infradead.org, Arnd Bergmann <arnd@arndb.de>, alex@ghiti.fr,
  Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-29a35d51-8791-449e-96f6-a7faf77f3f36@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_161107_363262_D13184F2 
X-CRM114-Status: GOOD (  22.14  )
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

On Wed, 24 May 2023 15:49:41 PDT (-0700), Conor Dooley wrote:
> On Wed, May 24, 2023 at 03:41:15PM -0700, Randy Dunlap wrote:
>> On 5/23/23 23:23, Arnd Bergmann wrote:
>> > On Wed, May 24, 2023, at 03:29, Palmer Dabbelt wrote:
>> >> On Tue, 23 May 2023 17:22:20 PDT (-0700), rdunlap@infradead.org wrote:
>> >>> On 5/23/23 06:07, Alexandre Ghiti wrote:
>> >>>> On 23/05/2023 04:28, Randy Dunlap wrote:
>> >>>>> On 5/19/23 03:42, Alexandre Ghiti wrote:
>> >>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
>> >>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]
>> >>>>>>>
>> >>>>>>> I'll check this one too which seems to be related to kernel/pi introduction.
>> >>>>>>
>> >>>>>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have limited size, hence the overlap, so no fix for this one. Is there a way to exclude this config from randconfig?
>> >>>>> Does this mean exclude XIP_KERNEL or something else from randconfigs?
>> >>>>
>> >>>>
>> >>>> I meant excluding XIP_KERNEL from randconfigs: it has very strict constraints regarding what can/can't be enabled then it needs human intervention to make sure the error above does not happen. So I would not bother testing this in randconfigs if possible.
>> >>>
>> >>> I can exclude it from my randconfig builds, but I don't know of a way to exclude it from randconfig builds in general (i.e., for everyone).
>> >>
>> >> Arnd had suggested a trick related to menus that would result in 
>> >> randconfig never enabling some config.  It'd suggested for 
>> >> CONFIG_NONPORTABLE, but we didn't use it because it'd reduce randconfig 
>> >> coverage.
>> >>
>> >> Maybe we should add a CONFIG_VERYSPECIAL of some sort and hide things 
>> >> like XIP behind it (maybe M-mode too)?
>> > 
>> > I usually add 'depends on !COMPILE_TEST', that excludes it from most
>> > build bots.
>> 
>> XIP_KERNEL already has "depends on !COMPILE_TEST", since April of 2021.
>
> Half of me wants to say just remove XIP_KERNEL entirely. Or make it
> depend on BROKEN, since noone seems to actually test it and I don't
> think we even know if it works right now?

Ya, let's do it.  If it's broken and nobody has said anything but 
randconfig, then probably nobody's using it.  Let's mark it as broken or 
deprecated or whatever and then see if anyone complains.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
