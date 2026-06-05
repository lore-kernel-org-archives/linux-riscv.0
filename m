Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FABCD6E79
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ImL+SPIJPu6Z0o+bSUYkY8slVekHK894QvXS5H4IhQ=; b=wJz3aOVjX7xddX
	mcT1BJEpLo+t7CBV9zpwAG4tWo+0Fz2wDRy64fVICWLjWf9h4PkmlgNWpwdFWSfCzYU8R0X0AfYhx
	8fmNxtL77nzunp47tNDivGViPACliN593LSsz/bH9aCpfcyacoiJXzEsh0ByuQ93ARfnBIx7O34an
	uJtSrVAYBuys7gS6E32tF8ymOkMzVEwyt2GwG2RijNOM8orxKSxXR//43NTyQyo4jzXy8U1gajqEm
	WvIUkuJjraYGuUitOiBAaK5lDQVd+oAzFepMdkMluTA+JUs1K7M8VAeVWHx67r3fIoIe0fU7a2uhm
	CrXlK8J7/yoyOFIlAnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVV8K-00000000haT-1Tr2;
	Fri, 05 Jun 2026 14:02:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVV8I-00000000haB-2b9k
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 14:02:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 274B9409D6;
	Fri,  5 Jun 2026 14:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198A51F00893;
	Fri,  5 Jun 2026 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668166;
	bh=uPcrV+iYaTLbAEiIZUrUU2DpWbYkJH1btO4i9xeqtSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iR76FxbcFBYTrnVAclYOopg77TV28mE8QOYq8HXlCrev9cXDK4aFowUSS/u2Hhw+N
	 B8h4L1VrSrBhbdBTWIZPnpDdc8bJmx0ZyEprGYu+g9wJTLdyOCWo7d1VOmcfmdUsbN
	 kbfj+vLTewS0ue9h4TUdyLxjxn0SQrRzdpLqEe5PdJBsopyYJCNzmLmoCXOLyUvNuy
	 1cze0/NY75rbpBcodfEcgUUmzihJgeqZysNUcVQZdDMfx4pqwYFBnDerf7m8y0EguN
	 c3lr+rEMoIKdD5P5xJUubbBG/BsXe1lSQ8u6QtV2nqqtVTnoU/uhNjDYCGUWv8ZHq9
	 mEOp49pkyHtHA==
Message-ID: <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
Date: Sat, 6 Jun 2026 00:02:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Conor Dooley <conor@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>,
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
 <20260604-pacifier-sludge-196f47ab3c11@spud>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260604-pacifier-sludge-196f47ab3c11@spud>
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

On 5/6/26 2:47 am, Conor Dooley wrote:
> On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
>> Add initial support for the Tenstorrent Atlantis platform, based on the
>> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>>
>> The evb machine represents an internal bringup vehicle with just the
>> interrupt controllers and a UART. This will be replaced in time with a
>> full featured machine once details are available.
...
>> diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>> new file mode 100644
>> index 000000000000..06259cca8357
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/dts-v1/;
>> +
>> +#include "atlantis-soc.dtsi"
>> +
>> +/ {
>> +	model = "Tenstorrent Atlantis development platform";
>> +	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	memory@0 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x00000000 0x0 0x80000000>,
>> +		      <0x1 0x80000000 0x0 0x80000000>;
>> +	};
>> +
>> +	aliases {
>> +		serial0 = &uart1;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "earlycon console=ttyS0";
> 
> FYI, this should not be in here.

It should be there if you want a working console :)

I know it's a "rule" to not include bootargs, but this system has no 
boot loader, so not setting bootargs just means the DTS is no use to anyone.

>> +		stdout-path = "serial0";
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	/delete-property/ clocks;
> 
> Why are you doing this? Looks kinda suspect!

On the bringup system the uart has a fixed clock, I don't know exactly why.

>> +	clock-frequency = <5000000>;
>> +	status = "okay";
>> +};
Having said that, I think we talked about making this DTS match the qemu 
model rather than the internal bringup system. So if we do that then 
this will change.

Thanks for the reviews.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
