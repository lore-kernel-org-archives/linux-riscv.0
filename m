Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5C2C4727E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:46:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1AC208C3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqF/Go+d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="m2E4KR0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1AC208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=v7loZxy/dBDkuDSDw2PyCGh8I91s1DCMTXWii+mpTDY=; b=AqF/Go+diXyna3GFtgghfKOfV
	LII0tf2ZuiOolOqmcwY5K2xpciWFdh4+pqjW6u5ZpOfU7/WJM8rhlg51NrlaBR5fwjvI+eYOBxJei
	6dAXkCx7tGqnJh0Z6/z9iWATVFZYcthIERLDPYxPq+PETFUvSI0Lp6D1uOvSGFvjcP3X/+aGyn+9q
	U8mdg4xdgFUv5ClyUCvg96rbek4mXuWF8Re72atdW3nn/Zs6olt//RoOBHezyu3QZ+QIUHripbU/M
	VXsRt1CiidmU5gaSrm/lk+rKddjJ95GP0eiq/qAZbB2YGTkHzAeU8XG/e4bTDrLOEDz+web2zXghY
	J66/wxkXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPWQo-000148-BT; Mon, 05 Oct 2020 19:45:58 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPWQl-00012w-Bs
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 19:45:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id p11so37939pld.5
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kPwILm2H0sETNXBahvwPUIdNPmK2c87ErCJPYr1DBUI=;
 b=m2E4KR0nmc7nJQL45uZ4PanuHrj5odtDbQBDOB9b+hB128UBGEFMMSZqSp5my3UeJA
 GHsHd5UHZwWED6mgBNJugsvH1Ea/rHiPQy/xjEouuwrAlG+gT/7gy3JwBDmGFzLH93CV
 Xm0PCwh54oNPtCkr0GLxjxGy2vLehqiElOI5qB1I7XaHI9tfTqMlZJ8nq4iU1rsCR/S7
 Mmao5mBGDbnzbTciPvzbnke+Yx+gdW62tHmYdDZDh9jJAGh1dfLDEcU48WcIC42RMRfT
 zXMNdOYHXkjTc9uXK0DMXgFv1Pv6FG1c84MxTpiQ1ruItd2tXUJpOif/HLfUaLrrkev6
 X44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kPwILm2H0sETNXBahvwPUIdNPmK2c87ErCJPYr1DBUI=;
 b=RTBv/9fs4zRfNCO0AVDaZpRcEhyeSFccJZETbq/REX+tGKkAiSHaHTAF0KnndyOdsP
 PgVuAUEZeMENGoPq6llrMDBupseuZdipLP+tcLTF7IL1lKoftFvIkCivJmVY8vR+RT88
 EcgwSnBQfOPG/MqFCTWT5FmGk4msLqw4Rw6q57KHuM/qIsnlGDFa5Hh5cPIjPt8c1UiF
 CM6BQ2XiabdgA06emkgcVtkd3EFHGaYTRGaVWkQsmNEe0kq3E4E/J8mIO4TR+iqAJVld
 8z7APLRKbRSmjtNEDI8X8+FUT6Ktdh6oEYDno+XzYLL/7dOaGVHdlArOJ+YKFOjv0QwL
 EQtw==
X-Gm-Message-State: AOAM532SeAg92yJ0YtYGE9CSHLDcZcYcl4QQ5DEA4o7vUrNyF8MfpdhI
 rBTwcJJP6am/9bn387jiCLZ5Uw==
X-Google-Smtp-Source: ABdhPJw3SWHhkUaAg1XjvyB5XCCd63EQ7AAIIkxuPFRbDh3KD8mHwG2uISU/uJBrT0shZwpkiz1nGw==
X-Received: by 2002:a17:90a:be05:: with SMTP id
 a5mr1071892pjs.118.1601927153154; 
 Mon, 05 Oct 2020 12:45:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 189sm470140pfw.123.2020.10.05.12.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 12:45:52 -0700 (PDT)
Date: Mon, 05 Oct 2020 12:45:52 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Oct 2020 12:45:44 PDT (-0700)
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
In-Reply-To: <87362stt1l.fsf@igel.home>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-b2aa7eab-cb69-4113-8c32-b5fcbd7e9150@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_154555_401965_010509C0 
X-CRM114-Status: GOOD (  20.38  )
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
Cc: tycho@tycho.ws, aou@eecs.berkeley.edu, nickhu@andestech.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 guoren@linux.alibaba.com, guoren@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 11:40:54 PDT (-0700), schwab@linux-m68k.org wrote:
> On Okt 05 2020, Palmer Dabbelt wrote:
>
>> On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
>>> On Sep 14 2020, Aurelien Jarno wrote:
>>>
>>>> How should we proceed to get that fixed in time for 5.9? For the older
>>>> branches where it has been backported (so far 5.7 and 5.8), should we
>>>> just get that commit reverted instead?
>>>
>>> Why is this still broken?
>>
>> Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
>> CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
>> that's relevant here).
>
> I don't see a boot failure either, but eventually you will get crashes
> like this, and resources are not properly released:
>
> [ 4560.936645] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 241626, size 16)!
> [ 4560.945324] ------------[ cut here ]------------
> [ 4560.949954] kernel BUG at mm/usercopy.c:99!
> [ 4560.954030] Kernel BUG [#1]
> [ 4560.956805] Modules linked in: nfsv3 nfs_acl rfkill mmc_block sf_pdma i2c_ocores virt_dma spi_sifive uio_pdrv_genirq uio loop drm drm_panel_orientation_quirks rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache af_packet mscc macsec macb ptp pps_core phylink of_mdio fixed_phy libphy pwm_sifive mmc_spi crc_itu_t crc7 of_mmc_spi mmc_core spi_bitbang sunrpc sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
> [ 4560.995103] CPU: 2 PID: 23806 Comm: nis Not tainted 5.8.10-1-default #1 openSUSE Tumbleweed (unreleased)
> [ 4561.004563] epc: ffffffe00036140e ra : ffffffe00036140e sp : ffffffe004bc7d60
> [ 4561.011679]  gp : ffffffe00127ee60 tp : ffffffe1b05d0000 t0 : ffffffe001297ca0
> [ 4561.018886]  t1 : ffffffe001297c30 t2 : 0000000000000000 s0 : ffffffe004bc7d80
> [ 4561.026093]  s1 : ffffffe00003afda a0 : 000000000000005b a1 : ffffffe1f7d67588
> [ 4561.033298]  a2 : ffffffe1f7d6c108 a3 : 0000000000000000 a4 : ffffffe000043e80
> [ 4561.040506]  a5 : ffffffe1f7d6be80 a6 : 0000000000000144 a7 : 0000000000000000
> [ 4561.047712]  s2 : 0000000000000010 s3 : 0000000000000000 s4 : ffffffe00003afea
> [ 4561.054918]  s5 : ffffffe1f7e00e80 s6 : 0000002af4a2c2e0 s7 : fffffffffffff000
> [ 4561.062124]  s8 : 0000003ffffff000 s9 : ffffffe19f985400 s10: 0000000000000010
> [ 4561.069329]  s11: ffffffe1f7e00e80 t3 : 0000000000038fa8 t4 : 0000000000038fa8
> [ 4561.076533]  t5 : 0000000000000001 t6 : ffffffe00128e062
> [ 4561.081832] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
> [ 4561.089821] ---[ end trace a7c93e7595e9c2cc ]---
> [ 4561.095589] BUG: Bad rss-counter state mm:00000000c54f4c29 type:MM_ANONPAGES val:1

Ah, I must have misunderstood.  I guess I just assumed "init crashes" meant on
boot, not just at some time later.  I just sent out a patch reverting this, LMK
if it fixes the issue.  I have some work stuff to do, but I'll try to find some
time tonight to look into fixing both of the bugs -- otherwise I'll just take
the revert (assuming it does actually fix the issue for you and passes the
tests).

I saw Atish post after I started writing this: I agree we need to sort of the
kernel's memory map, I just think it's too late for 5.9.

> Andreas.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
