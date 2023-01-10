Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F27C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfi6ikXStDf8Z4xaRLwIMud9Uu05FNtAMmi0cWLF0nA=; b=AGEss7/Tjs32W4
	YPID9+2QPFcFPYchLXb/kR30igUgpGEmb/wOnuyBL+fIgenxPKHu65HVjoIOho4dHIaBT4YuMfyIk
	YfvZZ1D3pNUdxdcC+CM2CkNQM5uTh8IIaG/GhjOew5WGr5xRN/bWr4R+887jTJEjrYDPZqray7oz0
	rL/djUcc93NUdWcqNOrNEKM6BVh4NxTiDwmUW9iHGquYakM1Lq1IZMOiucNy3xOX6CIES2h36aAcX
	iiEmMYsK0Ghsvqbl5Tt4/8K3riy2n3UzuoajkaF03mwwa7Z/Jf6efUcvmTb98QkRMRhrIt9fzglp0
	ivEEp1l85QpUldi87VAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNP4-008oTE-Fh; Tue, 10 Jan 2023 22:47:34 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNP0-008oR1-Ug
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1673390850; x=1704926850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EyXwQzQXnYWbWdIrsPiVh9I7Ij/jwKnQ+4GWwlT/CTk=;
  b=JM/9aRA2W14nzVH4T0iW4QrkZdW6ogUILp10eIOHViwa3N9lKb3Sq5k4
   mz7qyatEeKp/d7vRc2msQZ0kOvagBx/8dIq8lHlwPQ4U8ZXoqxtOUu4ZE
   QgHgD+NUNbFQFiHA9akFd+/C/8EgF0XE6l2ggOmUZ5HtWw5m10RZuOVx/
   8y5RReXwbKiCpo3MCJE5bjLfhTu78mPk/04GecKYqmaAQnrcad0u/2rxw
   aKvBikwLu004rH5MIWj0QIIDaX/089+djZ9WxKyo5ASfvPURV3ILPSP8z
   e/Q27jsMoK/cG78VCpwNL3SY8kieM6gb+3LGxGInzQztsBWn//RU7vMEx
   w==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665417600"; 
   d="scan'208";a="324779829"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2023 06:47:21 +0800
IronPort-SDR: OsMAbl5eSDtA+1WCxdkbWMQ/QpC0rTkcqvElZq3xjglWEd/zWcZJFQjiHWNFNYTyFfzDAei+4M
 DwRri6z3XRA/jRpS5/lBevOpVCx9jx8FBtaGZ8Ky8G6B+t7XDRAdhFy2A7XasxbvrK5hrcMmMm
 j9GCrLXwsCIWDZz/W48/pR0XfVWetpV7AgF/aJZswvBn3KVYxOsoc4gcKvX9EtV4N+N/gIHYGF
 bsgo9SMYkDmsxWTI8fvJ3oLqxMBYhnxQM9FJCl15IE0ZQNrKkhgGXZirRiV9DNGCDnbe08YFSr
 l8Q=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 13:59:25 -0800
IronPort-SDR: NlpI+n/N+Oqs7v46jLBmQg7Buk/v0JgSu4zsxcQApD0WAASxyFrsG5V0e1acO7d8Afdjjh7VYa
 14F/g1J8w02CBuwMzccid+Lf7IbxglZm5hmYmB9+ThvrjPEtVqxZ5nIwViYHaWWW2H0BS7u2em
 7KJjUvwdDGC2b3qWwMYL9M1QRM27gdi7FGF4i0cizCi/lcFCW2t9s/dOTG2Nm07MkCAlzme09I
 HQDSIdkm9S9YnU2tHLZG42a0eJSgXv92/zBN9tNeW1aCujmZCkj2GuSNfS1M5JidVS3adC9LyH
 3M4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 14:47:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Ns5Y455q1z1RwvL
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 14:47:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1673390839; x=1675982840; bh=EyXwQzQXnYWbWdIrsPiVh9I7Ij/jwKnQ+4G
	WwlT/CTk=; b=D0+oQw7s4KD6/uCySlV1T687c/FPH/deD21BoQwdcbcLP5YDsbC
	FWkzC2rwU8dCM4Ew1pVkWjfhdkL7Oh3DaJ21R/46NrY0xE7RoxduazXNUHmF+Af6
	INl6wm60sNwNpQszQQpGP7s1EU1CQOkzDOznAzR9wS8qRpQCTRcIZoJiAP6axK22
	SqWER3y+wRF5frP5FJcsoI9v5gZNZIseWqsR0EXIFQWZWmFjAbqdCjdlQkZKS3MG
	UdFUsqoBs/aePMuYSU/u5rXu9JGFZppxzsmc/iuT2QTla0qdGm+i9+z20u52oSV8
	vhNy3nwkhaEyo1IMa5WV4Wlfmd2QvkQliVw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d45KoSnU1o5t for <linux-riscv@lists.infradead.org>;
	Tue, 10 Jan 2023 14:47:19 -0800 (PST)
Received: from [10.225.163.12] (unknown [10.225.163.12])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Ns5Y22WCPz1RvLy;
	Tue, 10 Jan 2023 14:47:18 -0800 (PST)
Message-ID: <e63232e1-7340-7c68-7658-6e2b04b70a7e@opensource.wdc.com>
Date: Wed, 11 Jan 2023 07:47:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel@sholland.org>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
 <125360d7-9f06-05f6-e3bb-300514b9f821@opensource.wdc.com>
 <Y73oECczK3bklSyS@spud>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y73oECczK3bklSyS@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_144731_057744_9E5E21D1 
X-CRM114-Status: GOOD (  18.23  )
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

On 1/11/23 07:34, Conor Dooley wrote:
> On Wed, Jan 11, 2023 at 07:22:47AM +0900, Damien Le Moal wrote:
>> By the way, I recall some pushback with the renaming of SOC_XXX to
>> ARCH_XXX. I personally do not like it and Christoph suggested the revers
>> approach of renaming arm ARCH_XXX to something else instead. I did not
>> follow further on that discussion, but it looks like the riscv SOC_XXX
>> renaming went through ?
> 
> We asked the ARM guys about it, I think on IRC as they'd not replied to
> the thread, and cold water was poured on the idea.

That is really too bad. Naming something ARCH_XXX that is not a CPU
architecture is simply very confusing I think.

> It's Murphy's Law that the thing with the problem would be the k210 too
> isn't it.
> I could've sworn I booted one of each vendor so kinda kicking myself
> right now.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
