Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0699C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhnqRAhyaxdSmgfesNA7fHQrLcYJOl/qWhktragJK9o=; b=qhUMwEZz1dNOnO
	gJHJr0AZG7EhmConzq2TPCNnC2TUGF8XYzhS9dSFl7Z4VpbydnfIkVDyt/7O/46wAAmnzCDnZ0Kht
	6KIHBxz2sJv37lGi6+/zGamZi/+L1dBa6uaVAaphZ/qjLz07R3G/F84FradWocgGmlSYtRHk3c4xZ
	dm550+/4WeyWpykAR2haFIYWodsGIrAss10eg/Fxiy9gzxDdgkXKRx9H1PBZWs0KTDl2BazYjwRP1
	6CnHNlFAZ5XhiK9cni7fpPURBNRFPIPJ/s92nV6x9lidJQ2hrEGGsAxhNemh83Hx6F9ja8bCQqiO3
	iUL9komrVLUuLMQ/Nd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AY2-002evr-Qe; Mon, 05 Dec 2022 12:26:14 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AXt-002esZ-5j
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 12:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670243165; x=1701779165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=neMU4Ok0awO5Rq5skIsVHn5TxIHDupVu3e9O7MCpojQ=;
  b=kgrBxhkkFCKQMx0Jso8JgKwqwlS74ba+eiHrx2Qk+dL2QpfO5T9ROTWy
   ofsCnL2nuZ3Bj2UdIB0UC9S5HR7e5xO7nyA775tIWxpGbU5PshknvtEOE
   w+VkUxLlvKyWeBzDD/Et1UgSFxxjLApwjx7sftRO8B68QxHnn2W72TMZ3
   rirfxAflyX/RTzQwMk/USSMMUX0VMfGHGQjK0N3gWe7QIbi+vF4qTPH48
   gYRqd43f55BiU+I6Aq2zq6uAOBK/iHSFNdgmwUOmXojdO9TsiT1QQdMVq
   bJDI9Nf7ul662E7RdJDtD2QPAsKf2zDDqpLGyiqSXMIkB7GfbIAkzb4aW
   A==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665417600"; 
   d="scan'208";a="217912148"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2022 20:25:56 +0800
IronPort-SDR: CYW7jaQ7AqpffF+WCVJabl0hB1iWo8CikGoViIKny7WBn8fWz3+Nw0QTDjsNMF6ss+KTBjGilw
 al4zARRrYMGsA0R5+vMjBLu59fiA/qBv4y1256Hcc0i7Eq17nCj+EFru+T1gtDN6kmbfQ5cPW0
 FdrjdNMI4inQ0moMtAadwm4tn/QCD1xThSJbejdDTzPk1yJJQ9/3Pm5sdtvvZ0vTxyrQNcl6H5
 /xh5UNrOrG7lpJ3Xk5N5Ij0MxN62BIwNSg8K7vy0hw9eu8Eqezk4iaRDlTNj8ckGZ7mPlHWegK
 x4Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 03:38:45 -0800
IronPort-SDR: ZcDEzycyqo9Xvj9uhnqidRlPlGIlxDiC1umNX+Q4vb7rTljxBGh7k9x4ZQVbFfDRljcgRHpeXQ
 Ym3a+i4GRpo0fvEAgBZm4pXewEhxKy+7i+4CEcHxECzsWwk+R03StK7ikKkCGDTRg6d/MYReTJ
 OU9Y5cYdWrYuwLoEnPf11eU7oo/W9yoRF1K/UsTdgVeteekOp8Gl4b7QOtlrpwUXKYSRGycENM
 OuywiaSZTu1Y9IaH7xhkTahtenkYLg2bMWAVljW37Hb4HS58gpOhNq/Moil1NzHrt4F5lFzKlq
 K0g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 04:25:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NQjSg0mc7z1RvTp
	for <linux-riscv@lists.infradead.org>; Mon,  5 Dec 2022 04:25:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1670243154; x=1672835155; bh=neMU4Ok0awO5Rq5skIsVHn5TxIHDupVu3e9
	O7MCpojQ=; b=gTyQiIEtSVqvwVxAB8CGYS4bn2kbh+onxccWNV2pvnEJ+s1MACa
	HasKpuudsHW2I0jpWQdI60uCpE7syCOp5DmV8WeF6T6GDyzSPOBIxbLb7JDtpHL5
	z5WMuG/3pXadnoyPHiZTHDyRqi/tbpww8Sg/bIzhlqIcBH2f6rEuO69h9qEgK0Il
	YwwhRbfChGSHLra69SncbFAS7Oz90ikKUlvaT+EUgBl6anL+lhhs3zTcrxrzs8j8
	bdXdPtuE1b0NNsUMqYgYuSIBtAeQCvvpiy0EXzJwyjPKIe9SCPH9nwmayNXQzf2K
	BYgRH3gvTis3DJ01W8qmCcKom9ZOBBUx1mw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5RE5sottP8rt for <linux-riscv@lists.infradead.org>;
	Mon,  5 Dec 2022 04:25:54 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NQjSW6BW3z1RvLy;
	Mon,  5 Dec 2022 04:25:47 -0800 (PST)
Message-ID: <e62bc865-3b6f-2790-3dbf-6485cb233c4e@opensource.wdc.com>
Date: Mon, 5 Dec 2022 21:25:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 12/12] mm, slob: rename CONFIG_SLOB to
 CONFIG_SLOB_DEPRECATED
To: Palmer Dabbelt <palmer@dabbelt.com>, vbabka@suse.cz
Cc: cl@linux.com, rientjes@google.com, iamjoonsoo.kim@lge.com,
 penberg@kernel.org, 42.hyeyoo@gmail.com, roman.gushchin@linux.dev,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 willy@infradead.org, patches@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com, tony@atomide.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 ysato@users.sourceforge.jp, dalias@libc.org, Arnd Bergmann <arnd@arndb.de>,
 josh@joshtriplett.org, Conor Dooley <conor@kernel.org>,
 christophe.leroy@csgroup.eu, geert@linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 openrisc@lists.librecores.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org
References: <mhng-b0214281-7ee5-4698-a158-980427a97472@palmer-ri-x1c9a>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <mhng-b0214281-7ee5-4698-a158-980427a97472@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_042605_229207_152CEB7F 
X-CRM114-Status: GOOD (  10.41  )
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

On 12/3/22 02:59, Palmer Dabbelt wrote:
[...]
>> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
>> index 1a56eda5ce46..4cf0f297091e 100644
>> --- a/arch/riscv/configs/nommu_virt_defconfig
>> +++ b/arch/riscv/configs/nommu_virt_defconfig
>> @@ -22,7 +22,8 @@ CONFIG_EXPERT=y
>>  # CONFIG_KALLSYMS is not set
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>>  # CONFIG_COMPAT_BRK is not set
>> -CONFIG_SLOB=y
>> +CONFIG_SLUB=y
>> +CONFIG_SLUB_TINY=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_VIRT=y
>>  CONFIG_NONPORTABLE=y
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Though I don't have a K210 to test against, maybe Damien still does?

I did test and it is OK.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
