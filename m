Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F75C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 21:18:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05DB2078E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 21:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8XT2cP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XzxTTE1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A05DB2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wB/9eQrrwzC9e+pzo/N2Tsewtm5snUOzxxMCGHsepXM=; b=a8XT2cP4Ijq1iJ6N+1qLe4bHs
	OhgWIa2XlRQ0JZnHauPrlu+tDkY0eJHDQp4Zo/+8cFqUttuAxHsOELqZqIVdy2+7pAqOJYfJ4Yo82
	e+t72ZeNDjjqJsl5rUGz5XK7p0etsJuYER6WiVb8bURrfLQiqMYF60b0z4cu7Eej2nHxCOBqXY72R
	QC/WNjpAzvSlm75Cjyr7GXj+Vw4jS/q2V+BIjpwKNw64S091wHtVx0nWamPWmBebE23NldrPLgWG2
	QZ/uGwjdrfF1/FOZP1jAJUwHhSMU3DJORy9WoDeeDx2/iNIlpLrU/CgbBNc6kRMX3ZWJ68VdsFJi+
	p1+xtjZVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXrh-0004bT-Jw; Mon, 05 Oct 2020 21:17:49 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXre-0004aO-TJ
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 21:17:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id n14so7768539pff.6
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=R3FoEKph5/Q3zh1qrp1x58plkH4C/W9lj4keUROU3cc=;
 b=XzxTTE1wtNhw53A9/iFePIvAcbbSu+HVKVR5DHAVb9SRuPyIMeDNJJScDfbo3YBGzA
 neGayHxBTB8hPKq4ntKqfnA5r0RiDBgbN/QJzQMXDX6w+Cf8fTxBScRHxmjqNRkQdIJk
 BglxRAWtRA5v57pTecb/nTSengAobRq0GKBoFAHdWubYO9rel24WYpfOU+3Pmgy3Y59i
 jTj4bp85fm6bTpzYRNr5MdT5TL3iBzZBgT3AF5NTgLihovbkYMXvoC7uAfMcZ34D3xwD
 8pvELZ+XB+Li7mbQrkEPQkV9b/kDKBGR4YQ/LuyR2ocxCwkwEGfQjGDgmOz7wd6W3qBh
 d8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=R3FoEKph5/Q3zh1qrp1x58plkH4C/W9lj4keUROU3cc=;
 b=hUP/H9hhoTvWHlqPMfmJQsSLGszxfRh2RtlHV0QdNA6EYdNY55Ck0uyLZRKN4Hnlgi
 qAgq81JE/EHNPEZhX3t1R9nxKv3jVKh9Y9A1kCkxv1DDYa0CgLw5X7/l6rSAVTkkPMsK
 klnORxm2gzLZLug+RLTvgOza/1mKv+1Wfo6+6buiNo4udC/B1N4P5VbnsP5t+845NhRu
 NiiatdmnztrdSa+xGvcvT3XcleHBxPXT5/NZvPpM9SesAlq4WTigg0wLM+5wE3RF4QnT
 QGdcMmuAHtH6QPvojk73DQMoB3/zz0rOBiiimwPIoNgZCK/0HDx4DF29iEERqgShCqzu
 xbZA==
X-Gm-Message-State: AOAM532WB6GKPj6LyPWM2UmP4srrqooFUUKr3Pgh6b2UG9HzkpCz5Xv3
 3LhkkC2q0zORODgNzFxD79gnag==
X-Google-Smtp-Source: ABdhPJzqPxSu7Lo6DsMZ31HZZm4hY6RkD+7hfHkT7Ug0G/Ht4dwCV2BFR+3u9B+7D24nzWgpj4MoNQ==
X-Received: by 2002:a05:6a00:2d5:b029:13c:1611:653b with SMTP id
 b21-20020a056a0002d5b029013c1611653bmr1494841pft.13.1601932664202; 
 Mon, 05 Oct 2020 14:17:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t9sm559534pgp.90.2020.10.05.14.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 14:17:43 -0700 (PDT)
Date: Mon, 05 Oct 2020 14:17:43 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Oct 2020 14:17:41 PDT (-0700)
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
In-Reply-To: <CAOnJCUKa82Faf0DLfhR10i3dSJrQ6JZWwmCiLWTaAQf173CYwQ@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: atishp@atishpatra.org
Message-ID: <mhng-e2ceb9e5-81ae-41b8-96c5-72112854f475@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_171746_973718_2BF0810F 
X-CRM114-Status: GOOD (  25.75  )
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
Cc: linux-riscv@lists.infradead.org, tycho@tycho.ws, aou@eecs.berkeley.edu,
 nickhu@andestech.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, guoren@linux.alibaba.com, schwab@linux-m68k.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 guoren@kernel.org, tglx@linutronix.de, greentime.hu@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 14:12:44 PDT (-0700), atishp@atishpatra.org wrote:
> On Mon, Oct 5, 2020 at 12:46 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Mon, 05 Oct 2020 11:40:54 PDT (-0700), schwab@linux-m68k.org wrote:
>> > On Okt 05 2020, Palmer Dabbelt wrote:
>> >
>> >> On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
>> >>> On Sep 14 2020, Aurelien Jarno wrote:
>> >>>
>> >>>> How should we proceed to get that fixed in time for 5.9? For the older
>> >>>> branches where it has been backported (so far 5.7 and 5.8), should we
>> >>>> just get that commit reverted instead?
>> >>>
>> >>> Why is this still broken?
>> >>
>> >> Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
>> >> CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
>> >> that's relevant here).
>> >
>> > I don't see a boot failure either, but eventually you will get crashes
>> > like this, and resources are not properly released:
>> >
>> > [ 4560.936645] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 241626, size 16)!
>> > [ 4560.945324] ------------[ cut here ]------------
>> > [ 4560.949954] kernel BUG at mm/usercopy.c:99!
>> > [ 4560.954030] Kernel BUG [#1]
>> > [ 4560.956805] Modules linked in: nfsv3 nfs_acl rfkill mmc_block sf_pdma i2c_ocores virt_dma spi_sifive uio_pdrv_genirq uio loop drm drm_panel_orientation_quirks rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache af_packet mscc macsec macb ptp pps_core phylink of_mdio fixed_phy libphy pwm_sifive mmc_spi crc_itu_t crc7 of_mmc_spi mmc_core spi_bitbang sunrpc sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
>> > [ 4560.995103] CPU: 2 PID: 23806 Comm: nis Not tainted 5.8.10-1-default #1 openSUSE Tumbleweed (unreleased)
>> > [ 4561.004563] epc: ffffffe00036140e ra : ffffffe00036140e sp : ffffffe004bc7d60
>> > [ 4561.011679]  gp : ffffffe00127ee60 tp : ffffffe1b05d0000 t0 : ffffffe001297ca0
>> > [ 4561.018886]  t1 : ffffffe001297c30 t2 : 0000000000000000 s0 : ffffffe004bc7d80
>> > [ 4561.026093]  s1 : ffffffe00003afda a0 : 000000000000005b a1 : ffffffe1f7d67588
>> > [ 4561.033298]  a2 : ffffffe1f7d6c108 a3 : 0000000000000000 a4 : ffffffe000043e80
>> > [ 4561.040506]  a5 : ffffffe1f7d6be80 a6 : 0000000000000144 a7 : 0000000000000000
>> > [ 4561.047712]  s2 : 0000000000000010 s3 : 0000000000000000 s4 : ffffffe00003afea
>> > [ 4561.054918]  s5 : ffffffe1f7e00e80 s6 : 0000002af4a2c2e0 s7 : fffffffffffff000
>> > [ 4561.062124]  s8 : 0000003ffffff000 s9 : ffffffe19f985400 s10: 0000000000000010
>> > [ 4561.069329]  s11: ffffffe1f7e00e80 t3 : 0000000000038fa8 t4 : 0000000000038fa8
>> > [ 4561.076533]  t5 : 0000000000000001 t6 : ffffffe00128e062
>> > [ 4561.081832] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
>> > [ 4561.089821] ---[ end trace a7c93e7595e9c2cc ]---
>> > [ 4561.095589] BUG: Bad rss-counter state mm:00000000c54f4c29 type:MM_ANONPAGES val:1
>>
>> Ah, I must have misunderstood.  I guess I just assumed "init crashes" meant on
>> boot, not just at some time later.  I just sent out a patch reverting this, LMK
>> if it fixes the issue.  I have some work stuff to do, but I'll try to find some
>> time tonight to look into fixing both of the bugs -- otherwise I'll just take
>> the revert (assuming it does actually fix the issue for you and passes the
>> tests).
>>
>> I saw Atish post after I started writing this: I agree we need to sort of the
>> kernel's memory map, I just think it's too late for 5.9.
>>
>
> Yes. It is definitely a for-next material. I will try to take a stab
> at this if nobody else has an objection.

WFM.  Thanks!

>
>> > Andreas.
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
