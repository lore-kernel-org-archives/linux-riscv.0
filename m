Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAD6C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=o/IckaYxcTAmwfn95BaG1AHL5HMkFTSn2+AwaQ3H6dY=; b=Pwp5TEFph3ChFO
	iPpOzNVIq7DjSF/rpf2CFuwjhXhjASZlQdoYzPPd0Tyt6hUrw91UUq1UEcipxVV3KCuhqlsFZUEyO
	RYiqqEv9J1FVf/VAE1MyiUsimcvBsbYH/O0IZywLPoGK0M7dw2Bas5BXpgaoMtIapWuJEGDoNVXEb
	CReTfb4rWSy7rKYEwM41dLLX9PjeyqgI01mUJ9FCFX7DQoSZm+iKXVht3zHN72/hrnp8OOvQ5rOR1
	sYvOCk7mN2QJ4r4RsSlaRxYi3OdbWiZH4RZ5A2eObn96+djhK3HECVmXQFsEuwRjFp3eZHcNg7lBn
	ePXZJasANZcSXFQBHPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBb7-00000002LXP-02lf;
	Tue, 22 Jul 2025 11:55:53 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBSk-00000002KX5-1AbQ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 11:47:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753184822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DdBCLaeCsAfj/AcN99FfwGfHj8oCOHBcr24JxgrFvH7b49ZdsHVI7xw74RCbY++5eysOePiGQzNZCU5huPjEw0UBIunOaO42tf8col8GXE/ScGkF3pOFEY8jjTY3g4bKgJa0fYN1NYUnwiqTca7rwa7I8DxXUH4yS5Hg7WRmBtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753184822; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iLoaiwS+Ud2yCbXeC9zL0Mtugd211TCM6YPAiCXDkGs=; 
	b=WcNS2HjKW4KJIauGA/uu5xDWgUkHF7q+I84+DA22Stjr9UjuOQVA71A2EhiOo/L39QzJIP9ENcimPH1cLvWLs81irpd6HIBPdUspriV/OIS9Ei96uNC6lxoZ0IPSrkpSKTWANywBJ8j97nTVL4IpUgJD5BjeAc0AUEtsXcpwRbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753184822;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iLoaiwS+Ud2yCbXeC9zL0Mtugd211TCM6YPAiCXDkGs=;
	b=NgCQTdb/5h4sQYxngtfLCx56kgvIKBKfK43c0olNs8WqxaXrbI1RINvaX/npx/G4
	kTsXKPscdSZUbIexWIJMWZaEwxmmM/1KHXfONk6/RKO0ZsNOM+304c0jH36hUA7Xkgo
	qEBCSyt7r8DMh9gKInrUkIJdRPFzNZB3W28xJVqE=
Received: by mx.zohomail.com with SMTPS id 1753184818692439.0197627599191;
	Tue, 22 Jul 2025 04:46:58 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
In-Reply-To: <20250722-proud-polar-mink-12caa8@kuoka>
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
Subject: Re: [PATCH RFC 09/10] riscv: dts: anlogic: Add Milianke MLKPAI FS01
	 board
Message-ID: <1854904c2bf8d2d8.e7cd4abd4f21761b.29b7782965d4456e@Jude-Air.local>
Date: Tue, 22 Jul 2025 11:46:51 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_044714_726418_1DA79A57 
X-CRM114-Status: GOOD (  10.01  )
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



On 22/07/2025 09:31, Krzysztof Kozlowski wrote:
> On Mon, Jul 21, 2025 at 11:46:15PM +0800, Junhui Liu wrote:
>> Add support for the Milianke MLKPAI FS01 board based on the Anlogic
>> DR1V90 SoC. The board features 512MB of onboard memory, with the region
>> after 0x1fe00000 reserved for OpenSBI.
>> 
>> Currently, the board can boot to a console via UART1, which is connected
>> to the onboard serial chip and routed to the Type-C interface.
>> 
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  arch/riscv/boot/dts/Makefile                       |  1 +
>>  arch/riscv/boot/dts/anlogic/Makefile               |  2 ++
>>  arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts | 28 ++++++++++++++++++++++
>>  3 files changed, 31 insertions(+)
> 
> You need maintainers entry for your entire sub-arch. Otherwise why would
> we want unmaintained code?

Thanks for your reminder, I will add the relevant information to the
MAINTAINERS file.

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
