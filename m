Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F37DC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLxP8KwlpuIVUHUzkfeE0JVM9Sv/kLG7N3Jbblvu5mo=; b=TfW5Q783JznzY6
	ptxHd+BtXIt4/wY38uu9fF5pnMjk5eJOTw/glq4e7V+fhQ7+zzWgjIM6zISuY0LUajcJ/Mb4olpbl
	KF0+ABuJZC6rPNv3GqrkbZlRqKB43wyuM1ZpvdzNOfSmeuI51p+7xCIQRpjTzZE7Or4hC+Sit7yzu
	oN2RtTRy3AUWTOhRTi7zRvMXCAG3KpIqA0atdsWgp18Gt3MLFlbcehxK4DjJUU77lPpXotEucXYna
	CUA7n9ftECZquav5C3F64rk5A29vTYpUx/a1pRZeZdpMJvCvEPUIYcBHkydHy2jRm2ZVIx2wc+M3b
	zHm1wcX0teHJglT7iJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN1S-008lN7-GZ; Tue, 10 Jan 2023 22:23:10 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN1N-008lHX-K1
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1673389385; x=1704925385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oj1vdJ1HNxBMdz38NdNmqwUhOqWqPoo03ZrvnE7tycc=;
  b=M/y54//VrO5a85Xw1IMgFyo0Gc2D+An2POOYcZUDEDjEw09faPWdhIB9
   RFZ/5lOOLzTKjaLY3GgclhifZ1T9E+HrWttzgdZSHOV9iekLPx0bsie1L
   nFHq6eZPIXHOZJM9i0Kcq4ggk1DKKMpQtn397hDDyIaSCaiszpmkSkiJ1
   P6d8LM12gv2Nnx8ndTW8qqZqaMB6SC9fOnOAPe2QU/VZ4E06LCxpNm9de
   cfkhOFWrij4vYD+nxOb6X2Yv9kbJe8RpcdUcMJUbL3tCGiziCDCuIgqH7
   0BRgAUpUN/Bo6pRyRfs7yB9YNtehShcggtE9bpl6urh+zPMmDg+zIpAd/
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665417600"; 
   d="scan'208";a="218797073"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2023 06:22:51 +0800
IronPort-SDR: f+nG9BHOFiYnBhc8YYSXhPnetSokw+C6jItOtvxCtVCyBtkqCjsR7pVO+sUigsjZvesbftzqvT
 ogIS+YFyt53zyuQ6errFZFU6muKIovxpS7jnQiUm2yT6Wg2L+x4BGmNSkrSO15DLwqYkFdYdUG
 ldWipD/RXJt6uWM/5bHDQy0s87Ot0dJIMHeVd4/D+PV4FTMffqPAF0k3JP1NzKxROKuKhVRzvO
 hYE8EeqjUe3VmlCfWLXWBB8r1x5RKG+h4+Wxg18G2ceewY+96bWhcfDP6RIZxwQRAVaMR+/0TO
 DMA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 13:34:57 -0800
IronPort-SDR: pDlRiUUTEsB3w8RGz3TQCY/NMrgaVPQsxEtvqoywPb6+c4RuQIPNxAsJ842KVztJcRCDxpMCRt
 mbCgI51LM6sWFG79Ynny6m+GzqTrsgR6ZbtEHqEPKODXPoAETAcUZqEYF4lVrq2brPk4UEctEj
 8ZqjqePoAP2GbzvB3OHjuvUn6ahYN3oSlgH+njhB+3S8o7NSAfdn1dIRo3laYDorzuXlkaF/uN
 WMhzWBtDdRbkaYlvn420uxsSCcKscumxr500dBv2DvrU+SSzxkpSWrNOueBTAfnhVblQkHHYaF
 +HI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 14:22:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Ns50q2wjnz1Rwrq
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 14:22:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1673389370; x=1675981371; bh=oj1vdJ1HNxBMdz38NdNmqwUhOqWqPoo03Zr
	vnE7tycc=; b=ihCTcFSYggWEDNzBTFeN9R2tI7KJii1Bdud9WmJw6bgutaB2Zk2
	BjVOALVNT6IDAOatjsw65lS6IZCPNGOq+hGgRPI5SypXHL4TlS9JwR0t02br8DmO
	Ap7VsLEr8cXPnQHsvrGvCmcD10itKGUuBcVEP1fIqBsTTdz69EyaZFU6nRQYNtMI
	Omrqc3cC0PXXkn423t9tX9p8EWmuPDRE7naopnIK8yS5jMOEhl2AhNctMyDhppev
	5//mBnvMm/Ct7P5ucNycuvK8UYZwO00RE8ePO6jDJZS5Hqzqv7t+uOxhaaJu3bQF
	RaA0xO6E8cwCjN77BpZDHYhm+r7N/mSUhTQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W7fTJPQyqJSd for <linux-riscv@lists.infradead.org>;
	Tue, 10 Jan 2023 14:22:50 -0800 (PST)
Received: from [10.225.163.12] (unknown [10.225.163.12])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Ns50m6xFNz1RvLy;
	Tue, 10 Jan 2023 14:22:48 -0800 (PST)
Message-ID: <125360d7-9f06-05f6-e3bb-300514b9f821@opensource.wdc.com>
Date: Wed, 11 Jan 2023 07:22:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@infradead.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel@sholland.org>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_142305_810336_3D13A7BD 
X-CRM114-Status: GOOD (  34.16  )
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

On 1/11/23 06:14, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> To facilitate a transfer from SOC_FOO to ARCH_FOO, over a release cycle,
>> introduce some aliases so that drivers etc that use the SOC_FOO symbols
>> can be converted.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch, which is now commit fc43211939bb6874
> ("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to
> ARCH_CANAAN") in riscv/for-next
> 
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
> 
>> @@ -73,6 +91,9 @@ config SOC_CANAAN_K210_DTB_BUILTIN
>>           This option should be selected if no bootloader is being used.
>>           If unsure, say Y.
>>
>> +config ARCH_CANAAN_K210_DTB_SOURCE
>> +       def_bool SOC_CANAAN_K210_DTB_SOURCE
> 
> This is not correct, as SOC_CANAAN_K210_DTB_SOURCE below is
> not a bool, but a string.
> 
>> +
>>  config SOC_CANAAN_K210_DTB_SOURCE
>>         string "Source file for the Canaan Kendryte K210 builtin DTB"
>>         depends on SOC_CANAAN
> 
> Hence
> 
>     obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o,
> $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
> 
> will do the wrong thing later, and I get a non-bootable system (no output)
> on my MAiX-BiT.
> 
> Unfortunately there is no def_string, so I don't think we can fix this
> in a backwards-compatible way, and have to replace all
> SOC_CANAAN_K210_DTB_SOURCE by ARCH_CANAAN_K210_DTB_SOURCE,
> and urging users to update their .config manually.

Yes, the default built-in dtb is set to k210_generic.dts since we have a
only generic nommu_k210[_sdcard] defconfig. We could add defconfigs per
board type, but that is not the common approach.

By the way, I recall some pushback with the renaming of SOC_XXX to
ARCH_XXX. I personally do not like it and Christoph suggested the revers
approach of renaming arm ARCH_XXX to something else instead. I did not
follow further on that discussion, but it looks like the riscv SOC_XXX
renaming went through ?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
