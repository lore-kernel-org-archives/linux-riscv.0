Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE81CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfusNQ//yuWOQIKo0NDQBIsP1wxfVYrLN24nXPrgFw8=; b=L1VvZVjYEt+69A
	+97lYxYTsWjEQhkZcQDweHHmGIQTSnYQ415dCoqvEttDdgL80R+sZKSlbrCk5nBznoOUwqjlPFJle
	AJmAcp1gEd0MOdxTJDvfLqn76/KSzKxwNKyiITgQy+avHJyrY3jcJaR8EkVqmqtOlRJwi5vo1MjJY
	B/33zb7lVskC5KjYyWS4uMVO67010NtB5lTqSL8nchxZTqxnXmaU+0+s8MeqCitiw7s59iA9AlM28
	4o23elwkxXsyPS9sjjS8UG84NOxiV6GYaclDJIgNcVTvbpR1SBIuSsAjM561RA4fU8lnJwc6pXK8A
	Z57BGoBiLyxC0iKpwUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWAw-000000080WY-1c7h;
	Tue, 16 Sep 2025 13:56:54 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWAt-000000080Ur-04xi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uNIYRj9GoFIgE0bx3nW1lY0HxQFaZbKTteY8eNBKQ4Q=; b=jQayv1VVFcnT5BAqM4uK/OlAZV
	LYQJq1eiD3b8JQ6j5nfh6GhIW7kNsl830AW0BcyIre0+fpaQe5OovfHNcu2bdd3aXIx0cBUg26kOY
	uCIV44iDgprzcHZycLPQATqNaZj4c6wlsX5K+lvNIKUkhafja4KfRzYxIiCdcsRjvvV45AchOqMdq
	Zy0rQosUwpNiP7PGCpeUym+btRkzwd4P5R9HBEG3iHrS7Z+FMIgjvSHbw+vm2sl0QKuckPdN95Qd1
	aCwXyD/6+9l/KENCZwlZD1iDLCaxI6GnBRjzJ5iPzIG7tjF8LWwpiFBQ+gI9QwICo1BS7yXE6TGWo
	s5SoBbwQ==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uyWAA-00HS9q-OA; Tue, 16 Sep 2025 14:56:07 +0100
Message-ID: <70241f44-2f8d-4945-9c84-71416776cefd@codethink.co.uk>
Date: Tue, 16 Sep 2025 14:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe
 cards
To: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Drew Fustini <dfustini@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
 <20250915-mouth-banner-ddfb2e48bdb3@spud> <aMhSSka3gyIcND/L@x1>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <aMhSSka3gyIcND/L@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_065651_143096_02508A0E 
X-CRM114-Status: GOOD (  11.26  )
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

On 15/09/2025 18:52, Drew Fustini wrote:
> On Mon, Sep 15, 2025 at 05:47:08PM +0100, Conor Dooley wrote:
>> On Sat, Sep 13, 2025 at 02:31:05PM -0700, Drew Fustini wrote:
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..b2b08023643a2cebd4f924579024290bb355c9b3
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
>>> @@ -0,0 +1,14 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/dts-v1/;
>>> +
>>> +#include "blackhole-a0.dtsi"
>>> +
>>> +/ {
>>> +	model = "Tenstorrent Blackhole A0 SoC PCIe card";
>>> +	compatible = "tenstorrent,blackhole-a0-card", "tenstorrent,blackhole-a0";
>>> +
>>> +	memory@0 {
>>> +		device_type = "memory";
>>> +		reg = <0x4000 0x30000000 0x1 0x00000000>;
>>
>> This isn't at address zero as the node address claims.
> 
> Thanks, I'll fix the unit address.

Is it time to just assume any dtc can handle a 64bit number?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
