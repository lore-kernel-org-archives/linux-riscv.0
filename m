Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9959C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pGTmnRQ+zUtl/dCj9dgxLpBKTacUtnsqBhk0AgTniwY=; b=UDNywNgyfWoiMI
	OnugHAOHLkYZJNPf/cPwhQWz7Mrv1mAJ7NrsxQxkZd154SbUBYnUgxPZ1W0NvqGeOtCsSzib64221
	Z/QBq8LFptcztXCNG9QhOB9Nmk6IW28mH7Bao1idnVGjdwmv6lCXYB1ZNF5xk3ObmuNFzaf5T0PRt
	B+ciTRmV+AZMX6aiZcQzWqrBEjlCfHG32b2ZZP3CV6RID6YmYiQ8/nyXhBQ5HY/zeEf/9UAO/c/UT
	TalGOatV/Ncx7w+wloeAVVVjj5JuvZOr/n85qKg68P8waLNy43z9DXzsO/beZOgIrS45J/fcSewVh
	Rms7R9kkBVhqfo/gGGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBRD-00000002KL1-1u2x;
	Tue, 22 Jul 2025 11:45:39 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB9f-00000002HZf-0hfZ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 11:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753183646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L8uXSYQxwzi6GnqOKA5+M/zFPG4YsKprlvaiueZ6tyTNaDL5JdRi7F4krtqMduJ4Ag69Rg7U4KPh8r5llGt06szaffvPBwsjPG0Le/CnRbR41qo1u8JBxhK3xiCfh25Qe6QdZrzckGLUiHvZWTJDa2Lh7TQZOFLxLKr6lu3WOQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753183646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oSWzK9+1+wJc6wh6CDIQZWQCvimKKJe8O5m5BgUOpHM=; 
	b=jrZKYr4L4LdOFAuzndQZW5Qz+Lz1wmRU490h2L4eC6Dm7C9X8bR490PUz42rHs55ViumCFNLmb3iufzWwCweDrl45bjqjmsw4JatKBu9sJKx0MY8pNkHVBJRTExu6uVWhYFPEH83ifRRTLuzU0+RPMY/hB1j8jI6sOUcSLnwtLA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753183646;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oSWzK9+1+wJc6wh6CDIQZWQCvimKKJe8O5m5BgUOpHM=;
	b=KuAvm1U7/rkniCfUxMjB0BR6KZ2ypIXEi2EuO2iqtr7dyL10XVPnZaVwSM6o14Sj
	38SyFAnkKq7IVnSYBHIVmUJx0CNsrmkcDmyn4geRQiBGTO5bg4Vz8byXslcL198w104
	zbn14B6zSUpYB83NsJcFigm/jWU7OkcYb3JkyYwg=
Received: by mx.zohomail.com with SMTPS id 1753183643006882.6847732993253;
	Tue, 22 Jul 2025 04:27:23 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
In-Reply-To: <20250722-berserk-octopus-of-destiny-f4475e@kuoka>
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Daniel Lezcano" <daniel.lezcano@linaro.org>, 
	"Thomas Gleixner" <tglx@linutronix.de>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Palmer Dabbelt" <palmer@sifive.com>, 
	"Conor Dooley" <conor@kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH RFC 07/10] riscv: Add Anlogic SoC famly Kconfig support
Message-ID: <18548f39bd190d28.fca9acf422f7bf67.f37c65074e24e08a@Jude-Air.local>
Date: Tue, 22 Jul 2025 11:27:13 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042731_602646_8DD785A3 
X-CRM114-Status: GOOD (  12.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 22/07/2025 09:29, Krzysztof Kozlowski wrote:
> On Mon, Jul 21, 2025 at 11:46:13PM +0800, Junhui Liu wrote:
>> The first SoC in the Anlogic series is DR1V90, which contains a RISC-V
>> core from Nuclei.
>> 
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  arch/riscv/Kconfig.socs | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index a9c3d2f6debca1469f4a912b3414711eb709baab..de163cdddcda1c08e7c9e98716eaf043d4c4555a 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -1,5 +1,10 @@
>>  menu "SoC selection"
>>  
>> +config ARCH_ANLOGIC
>> +	bool "Anlogic SoCs"
>> +	help
>> +		This enables support for Anlogic SoC platform hardware.
> 
> Wrong indentation. See everything else in this file or just read coding
> style.

Thanks for pointing this out. I overlooked it and will fix it in the
next version.

> 
> Best regards,
> Krzysztof

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
