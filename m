Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E70C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5qs9uYET8HPDWvIB3PX5SgzKIr+VyiZpfff05BtejbI=; b=AYAvfiOPQii+CpYbqffVrASI4E
	rLzqBnvLn/hEb7mG/FH6dr2Qinl9uorZnIHVTyfdW74ShwG+Ebmu1lCiOeTE2fR+Z6U1YTbqazGCS
	dlo467PM9sP4dzhFGzaLPshWDlKO8D3TCHWMH/nawTLWAPKO0ALbUVgxzkVQuA4SqtqzdAikA7RI0
	ZRYD/fAxcR8ltmkyyX1RPp6Zk5xs0o7exyg5MV62lI2BK+ZALvcuhBHJmoHrsRYb2mLVCYrH2qniw
	iOuOe59MECSH4NhnNeOGuB8gjAkm1rrVDPlg5uCgr3K89e081IqmX1V7K6Q4Bp2LzxOr700Lf8aTa
	a60HbsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09Ky-00BZsW-DN; Tue, 29 Nov 2022 22:44:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09Ku-00BZs1-OG
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:44:22 +0000
Received: by mail-pf1-x433.google.com with SMTP id 9so15115317pfx.11
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW1FokMK/uVT4wrTxg9C5QYQh4UVCAiAvCLC3qALgec=;
        b=PqxXiu/pOgKjs7JqXC+gE2l2AMjgPvMP477QodAHZZCSIrQztHoxeXg958ekT0M936
         +GLESsaGf3XurOlCavCnjAt2pmorDRq1BSD3SUK/u/BRJpiM+pptM4UmZt44ttyGI29m
         tI+siuSEw6niFc3L7Gvhyzc/Tx2UBcLj20hZvaKExr6aQvAkNaEOaVLNpsZcfFrIgnRI
         +FDv6x1KOa5DZ9Bx4soE2sbYNZO/cqmgSMYQa/70Iiqt1n2grK6Ku8FN+dZ0IYZg3Ka+
         FZvy8DvW0QhnMqOld5Y3OadRKkboxELosmPvrSmYi2qmmyn9qvJdzaruGdz2Get+BNVO
         gC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW1FokMK/uVT4wrTxg9C5QYQh4UVCAiAvCLC3qALgec=;
        b=3gtaCNwHydfHjp4YVJw/bbbDRqGI5H7QHBJUmEqLNmvNgmy+l1INNjDxISqekIK7pl
         V2/mGwOSKveDoMcfcl9XvOtWWzZQ2C12DXpZHllFXaJzXsgbe2SjYwSYQUfxhHWr6Suc
         0J2CMnMOHvVTQTRdu0M7lJF4MQH/IFMrCUcPrjNOFj8WP5lBU8WQ2mM+i3ogo0sVLbKQ
         Ahbeit2BdNfH2C5JstfTR/zKXYnn3n581x6OboS2apiBXbuiBzrgS0SNb2ntl6ORmqMW
         czJTd4AitF4z8bfPEXuC7jtQvmCd63sBE45GbtzNLA0Q8tptVGFWpKaICREgOGO8Yc7i
         2ZZQ==
X-Gm-Message-State: ANoB5pnhFNxQ8agSCvUS81ilA8XK0qfA7abMKSfpdCMMQKm/RxCUDTOU
	DcvGGbB5zfkQVQW12fW2HdTLWgko4hUqUw==
X-Google-Smtp-Source: AA0mqf4sbKR/VJKieb8/YSKYNtUTIqdHzKAFp58OVSIh8iCG2VxL09KPhntNPijH2XE3oYI3lkGjuQ==
X-Received: by 2002:a63:5408:0:b0:478:31a5:3656 with SMTP id i8-20020a635408000000b0047831a53656mr7947465pgb.273.1669761858728;
        Tue, 29 Nov 2022 14:44:18 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u185-20020a6260c2000000b0053e38ac0ff4sm10404801pfb.115.2022.11.29.14.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 14:44:18 -0800 (PST)
Date: Tue, 29 Nov 2022 14:44:18 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 14:44:09 PST (-0800)
Subject: Re: [PATCH v1 4/5] RISC-V: hwprobe: Support probing of misaligned accesss performance
In-Reply-To: <5662455.1IzOArtZ34@diego>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-48817427-657b-4830-8ca5-9529ff4e3398@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_144420_996212_BA40C511 
X-CRM114-Status: GOOD (  28.13  )
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

On Tue, 29 Nov 2022 14:10:02 PST (-0800), heiko@sntech.de wrote:
> Am Dienstag, 29. November 2022, 22:18:18 CET schrieb Palmer Dabbelt:
>> On Tue, 29 Nov 2022 13:09:49 PST (-0800), heiko@sntech.de wrote:
>> > Am Donnerstag, 13. Oktober 2022, 18:35:50 CET schrieb Palmer Dabbelt:
>> >> This allows userspace to select various routines to use based on the
>> >> performance of misaligned access on the target hardware.
>> >>
>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >
>> > [...]
>> >
>> >> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>> >> index cbda062de9bd..54bdcf9a5049 100644
>> >> --- a/arch/riscv/include/asm/cpufeature.h
>> >> +++ b/arch/riscv/include/asm/cpufeature.h
>> >> @@ -18,4 +18,6 @@ struct riscv_cpuinfo {
>> >>
>> >>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>> >>
>> >> +DECLARE_PER_CPU(long, misaligned_access_speed);
>> >
>> > just my 2ct ... wouldn't it make sense to have struct riscv_cpuinfo
>> > as the central instance for all cpu-related stuff, so
>> > misaligned_access_speed could also be part of it?
>>
>> I remember going through this one a few times and ending up here despite
>> some cleaner-looking ways of doing it.  That way does look cleaner,
>> though, so I'll give it a shot and we'll see what happens...
>>
>> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> >> index 553d755483ed..1599e40cd170 100644
>> >> --- a/arch/riscv/kernel/cpufeature.c
>> >> +++ b/arch/riscv/kernel/cpufeature.c
>> >> @@ -222,6 +226,22 @@ void __init riscv_fill_hwcap(void)
>> >>  			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> >>  		else
>> >>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> >> +
>> >> +		/*
>> >> +		 * Check for the performance of misaligned accesses.
>> >> +		 */
>> >> +		cpu = hartid_to_cpuid_map(hartid);
>> >> +		if (cpu < 0)
>> >> +			continue;
>> >> +
>> >> +		if (of_property_read_string(node, "riscv,misaligned-access-performance", &misaligned)) {
>> >
>> > I think this wants a "!" in front :-) .
>> >
>> > of_property_read_string() returns 0 on success, so running this
>> > results in a nullptr right now.
>>
>> Thanks.  I'd not gotten around to actually running this so I bet it's
>> broken in a bunch of ways.  Did you try it out?  I was really hoping to
>> find some time to get at least the simple stuff in for this cycle, but
>> too many things keep coming up.
>
> I ran the code today, so bumped into the "!" issue.
> I'm not yet "using" it, but that will come in the next days.
>
> And no worries about that time-thingy, your series already provides
> a nice pointer for the general direction to with things, so that is helpful
> in its own right.

I'm still worried about the release, as it's the last one before the 
glibc release and we'll need hooks there too.

> I will simply report any brokeness I find when it happens ;-) .

Awesome, thanks!

>
>
> Heiko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
