Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713B8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C6F2083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5eD5oLC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Y8n3YjHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C6F2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LBQtA+zWBuogXGOu/Bwyz6SOZcu96Sd4YzP2hJlqpE4=; b=e5eD5oLC77k9gqCFyZQJpPip+
	t9H8IsU8gcyF8/ZM0VoLUTSI+Us/eFmsDlFkmTpZQo9tYDQfhsSLbhjfx3rR9ujQgnut1LR3CU8d/
	IUBh9Ya3rJ380/KvTpUHep7Z4d4lkeEh0qTVsqieCsMpoRcAJeeuW7lcOrLe5BNPUDUov9Ictvd2V
	ZZfRWtJHI7dEpRcfXDV9JNapTgmvUNHFHPwLpU8m82N6bZrucJa3Taf95ErpuVNWs5SR93Lc7tGtc
	9r9JXgCo5sRwQG4o4pwvuD5Hucs64lCiUHG2boURlpiiyw9DUQ3OmImhGAJAwPwrN1QrIXPk0VX9G
	ptZXzy5QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu52K-0005J1-7t; Thu, 14 Feb 2019 00:37:56 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu52G-0005Ga-0v
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 00:37:53 +0000
Received: by mail-pf1-x441.google.com with SMTP id b7so2061570pfi.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 16:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uT75a19FaF87yjESbhIfkIe22b6AasUHkjMarqW5BsM=;
 b=Y8n3YjHTl49N3znm/rfydQpsP+i4dhNF+yLiTVb68qUi+tqEh7qNfIYu7j3s+Z54Qb
 ls3lh+BDhGxtxQzFHmJVUg6AOUbdqabyo/U9DYx3GzmmZYBHfFOAQ8XK07xT+Re2ZeLY
 G38Cns+n7+uqmC2jq4mvH/4ogqmf+9pC/jqygUHJHlHfOcUe1SoRQpw8FCsQrTOZYx93
 ru/Rnm//RTemMMNmDJxMn3ft8mA28ENLQLxu47aBQ3yWZZJmP3DFP+deQ/+e3kbTAdZo
 3E895dFSabqwv9tKzC/laTzC9nya64c/ZI3Lo/1/vVJF24jkvMiHuDseopRKHqZNxq7s
 r35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uT75a19FaF87yjESbhIfkIe22b6AasUHkjMarqW5BsM=;
 b=a0HV1P3XoSRygH3elKb6Qw6SY8c0SM2hJqEsqTmbMcXpHN221nJOdqpmF/ZN55YH1D
 ZXzhboLvNHpeoSXt/8sk2yxqW4r+dHEQce6QHIIRIwHgGIGmY9awHfSd0gDx9lYA1Al/
 Az/G4+eFFSrBayfb0DBGp9oOsVmP/QSaE88+CSwYaWp4J93f3NgIinP9DxjtzeafHBBC
 KIrRodYUHQU+27qmUXyS7TBd9Yw+IjoXAlObMqmKMZh5es+8aJJb1j2EWeGGhXvAnFIs
 a98Z5rVvnjdeH3euA/Q54RPjR3uNwKCZc4jS5cn+9/kUicxO79VfuMPVfja6sfXvRxTK
 NC+w==
X-Gm-Message-State: AHQUAuYN5IF6TvkJtxiuX2HJBrCMujDH+1W7cHItILz8OzDGZ9S/pKos
 wb8FXn3pyZJGsULlNSi0GgTeuA==
X-Google-Smtp-Source: AHgI3IYuAK6VrAw16TgxnA4ZfOcmKNYt9kIIDRM0Kb+5DQxV80IYsIXJey6nuMq7RejD1KAW2EQYsA==
X-Received: by 2002:a65:424c:: with SMTP id d12mr1000124pgq.126.1550104671315; 
 Wed, 13 Feb 2019 16:37:51 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e128sm643789pfe.67.2019.02.13.16.37.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 16:37:50 -0800 (PST)
Date: Wed, 13 Feb 2019 16:37:50 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 16:30:21 PST (-0800)
Subject: Re: [v4 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
In-Reply-To: <20190213084442.GD28278@localhost>
From: Palmer Dabbelt <palmer@sifive.com>
To: johan@kernel.org
Message-ID: <mhng-d7d9894c-d6f6-485b-95e8-962c4ab0f3f1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_163752_061584_734DC049 
X-CRM114-Status: GOOD (  22.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net,
 alankao@andestech.com, dmitriy@oss-tech.org, schwab@suse.de,
 anup@brainfault.org, daniel.lezcano@linaro.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, marc.zyngier@arm.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 00:44:42 PST (-0800), johan@kernel.org wrote:
> On Tue, Feb 12, 2019 at 11:58:10AM -0800, Atish Patra wrote:
>> On 2/12/19 3:25 AM, Johan Hovold wrote:
>> > On Tue, Feb 12, 2019 at 03:10:12AM -0800, Atish Patra wrote:
>> >> Currently, we set hwcap based on first valid hart from DT. This may not
>> >> be correct always as that hart might not be current booting cpu or may
>> >> have a different capability.
>> >>
>> >> Set hwcap as the capabilities supported by all possible harts with "okay"
>> >> status.
>> >>
>> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> >> ---
>> >>   arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
>> >>   1 file changed, 22 insertions(+), 19 deletions(-)
>> >>
>> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> >> index e7a4701f..a1e4fb34 100644
>> >> --- a/arch/riscv/kernel/cpufeature.c
>> >> +++ b/arch/riscv/kernel/cpufeature.c
>> >> @@ -20,6 +20,7 @@
>> >>   #include <linux/of.h>
>> >>   #include <asm/processor.h>
>> >>   #include <asm/hwcap.h>
>> >> +#include <asm/smp.h>
>> >>
>> >>   unsigned long elf_hwcap __read_mostly;
>> >>   #ifdef CONFIG_FPU
>> >> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
>> >>
>> >>   	elf_hwcap = 0;
>> >>
>> >> -	/*
>> >> -	 * We don't support running Linux on hertergenous ISA systems.  For
>> >> -	 * now, we just check the ISA of the first "okay" processor.
>> >> -	 */
>> >>   	for_each_of_cpu_node(node) {
>> >> -		if (riscv_of_processor_hartid(node) >= 0)
>> >> -			break;
>> >> -	}
>> >> -	if (!node) {
>> >> -		pr_warn("Unable to find \"cpu\" devicetree entry\n");
>> >> -		return;
>> >> -	}
>> >> +		unsigned long this_hwcap = 0;
>> >>
>> >> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
>> >> -		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>> >> -		of_node_put(node);
>> >> -		return;
>> >> -	}
>> >> -	of_node_put(node);
>> >> +		if (riscv_of_processor_hartid(node) < 0)
>> >> +			continue;
>> >>
>>
>> >> -	for (i = 0; i < strlen(isa); ++i)
>> >> -		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
>> >> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
>> >> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>> >> +			return;
>> >
>> > Did you want "continue" here to continue processing the other harts?
>>
>> Hmm. If a cpu node doesn't have isa in DT, that means DT is wrong. A
>> "continue" here will let user space use other harts just with a warning
>> message?
>>
>> Returning here will not set elf_hwcap which forces the user to fix the
>> DT. I am not sure what should be the defined behavior in this case.
>>
>> Any thoughts ?
>
> The problem is that the proposed code might still set elf_hwcap -- it
> all depends on the order of the hart nodes in dt (i.e. it will only be
> left unset if the first node is malformed).
>
> For that reason, I'd say it's better to either bail out (hard or at
> least with elf_hwcap unset) or to continue processing the other nodes.
>
> The former might break current systems with malformed dt, though.
>
> And since the harts are expected to have the same ISA, continuing the
> processing while warning and ignoring the malformed node might be
> acceptable.

Handling malformed device trees by providing a warning and an empty HWCAP seems 
like the right way to go to me.

>
> Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
