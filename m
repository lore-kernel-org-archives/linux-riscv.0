Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A815ACD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foAXtcxMyrVKFNTeosTTK5NRn7+besce9umTROgb/mo=; b=cbY8iLMYeI6dY8
	HQWV04F1Q6S2JsSAT4N1vuhZAV5xLnewweEaaAyT2WeVRccKbtACH2g+lMSNHjmPsyRWXY35BwW22
	klMii81v/Pn595LdIGxtOnMsHS8rDOEhHn7P3ryLtbbfnDwzJ2wexRh/ibs0ch7r0S0KmHPhRXB18
	nBepCPCrBIh6eCUWmxme6JmNBpip8z7JNdrutoL2w2WimNt6Yc9zTgIwVNR7l5CxVz9PT0Y4YitXi
	VINRuepzt/FTV1wzhKisMvSu02lKDRW5pA44xpfPJ4EvFTnszL84shfeU2JAnr9RQmaJHYnwoDqjP
	Vd7k5o0BWPMhsgoJ3qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Sh-00000001eph-2Psj;
	Wed, 13 May 2026 07:56:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Se-00000001ep8-2xnO
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:56:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so57293675e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659015; x=1779263815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7duSVgYKIOQw30efTE5UcGH1h1Zr68CDYsggisvPQ4=;
        b=kYotNbebh+2er4adz911Aw0/oeCCXKtWmzTjMDyUH56qK34LLB7S+V8SN6GSq6SfAA
         tVmj0IsI7Nkt/F3WvSTw64plWmeGy9PDSWaQlpv4G2citCvkUhS0E3e/svTqHu8/ckKh
         d05nKsDZUBw4gKnLF9PtB/Ga9XUc6+UpSmp0kMED7JmdhwacaAGNVTLQdNa5fcZzJ+v1
         DkgMYYNW4NbjB+vuLgIy0E49nMAE5JQDflvjXKdA+EiifFAY1z4ADaJC8G5jyaw0WnE7
         2129Oc77WaMe/2T8nGyiTuOCF6xMdUj7F6ep+OnU2o/+vpBKk+5Srqs+1pSij3u//oa+
         Yk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659015; x=1779263815;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7duSVgYKIOQw30efTE5UcGH1h1Zr68CDYsggisvPQ4=;
        b=CiCIkkpZ2fdsV28GUiLnB2eJxjWWHoLYA4oZR3zbbCescfj+BXqmPnhq9SsdKW8f/X
         n+HHMK2Rj7dlsdNf1kOiJjLpI9X8Fn6XOjL35NKqVDGxB/aVWXtCBiIAe+zub/CZTDz2
         Nc4TP9hK3OzKImGTkpz8vy3qF8tB+CUY+Pw6OCD0PKYmdVw+JSMB+/vYgB7fw42W6QeD
         13Ec51xzqqWsJJAAh21sArwsHe/GZDe+w/n3VM05Tk6doXO2RZZLsGdpisJrOWgWpyHZ
         PslUMHX1DVuZKdMkhM9/mTgNRut+O1Jq5TN3E7+WIekGKbTcQGrdp40GIpO5USAPDGeY
         fEjg==
X-Forwarded-Encrypted: i=1; AFNElJ9W12Ts94KC8U8ASViPA71TDTtRB5DzCumfRg7CBqpd5qH10sb7vCKjxlBdTIobs8iJrBDgAUhcT+h4Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsabVXQ7z6UYtpCeXu/SEgUB1c3UGepGdSE1W1HmozZlCHIw1U
	ldXZu1XNU7ITofNbjg03Xmzp5WQfN8vpx38EuhOmpipqmHW1+v17a0M1f80WUWwT
X-Gm-Gg: Acq92OHtWfiPjD7qhJPFXNkL48t9yRxDeCHRCFLx/ctG449SuDRzmDevW3L6WcGlERS
	7W1Jrr3FUM/z9QL/e71B7zXN+Z5DbT/WuwdKepoqwwt8DoMBWDFFZgRLFEnx3oDUXL4asWe6o4C
	LeHzL+qQxTQDmqOOvdPXUCTpSbfYB2Qe+KoEDIgcGLkEHzder4H7CZ5z0Mi7UujkcBPpvQfuNlB
	NBTHIpZLWxEaMsbry164jjkGgnUFeOD3giUQA/YXr5/LNEvysBf2WHO0v0ojxhzC/SQ6VNxkLmt
	XPoPOkwjoHmdtX4kgBIqCsu2FiCarSZdc7bWHQMgUZ+g45UmTPoVJa5WCcCzjzpdQUFyWs6qvDd
	RqZkOroW9wdo73Fwa5ZzDRBF6d8tctzju21+prLfCK6SZUK67JV2bP1mBgpoJziROiBvXav5h+n
	cmjRZiUcxeCmVotYKybW8WgqFMt3xwn364lAZ1RnLhDykpZ1sha3yI4Z+JNYVLG8w=
X-Received: by 2002:a05:600c:1d14:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48fce9c3a2emr22415995e9.12.1778659014515;
        Wed, 13 May 2026 00:56:54 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce06ca2csm27025055e9.8.2026.05.13.00.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:56:54 -0700 (PDT)
Message-ID: <171c3f3a-91bb-4620-aa39-ffc82bd272a5@gmail.com>
Date: Wed, 13 May 2026 09:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513074644-GKA3624092@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260513074644-GKA3624092@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_005656_790514_74751585 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Yixun,

On 13.05.26 9:46 AM, Yixun Lan wrote:
> Andre,
>   
>   Thanks for pushing this new version, overall, this series looks good to me,
> Although there are few quite trivial issues, which I could help to fix it while
> applying, let's give community some time to test and review..

alright, and sorry, my git send-email flow is a bit rusty, didn't notice those issues...

>   P.S I haven't run it on musepi board, but trust you tested all functions..

I tested the added devices except nvme as I don't have one connected.
But I do have a pci card in there, which works just fine, so generally speaking pcie works and I'd assume/hope nvme would too ;)

> On 09:19 Wed 13 May     , Andre Heider wrote:
>> Add the missing devices with their required regulators. The regulators are named after
>> their label in the vendor schematics[0].
>>
>> v3:
>> - drop reg_usb_vbus, non-controllable and served only as vin-supply
>> - fixed regulator-vcc-4v0 typo
>> - fold addition of pmic regulator labels into the pmic patch
>> - eeprom is a GT24C02B, fixed commit message
>> - added reg_qspi_vcc1v833
>> - fixed uboot nor name offset
>> - add missing "reg_" prefix for reg_pcie_vcc_3v3
>> - drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports
>>
>> v2:
>> - drop reg_vcc_5v0_sys as per "non-controllable" review comments on
>>    similar patches for other boards (kept the root reg_usb_vbus for though)
>> - add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
>> - drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
>>    ("non-controllable" again)
>> - all of the above makes it consistent with other k1 boards
>>
>> v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t
>>
>> $ cat /sys/kernel/debug/regulator/regulator_summary
>>   regulator                      use open bypass  opmode voltage current     min     max
>> ---------------------------------------------------------------------------------------
>>   regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>>   PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
>>      ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>>      ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>>      ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>>      ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>>   VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
>>      buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
>>      buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
>>      buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
>>         2-0050-vcc                 0                                 0mA     0mV     0mV
>>      buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
>>         d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
>>         QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
>>            spi0.0-vcc              1                                 0mA     0mV     0mV
>>      buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
>>         dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
>>         dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>>         dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>         dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>>         dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
>>      aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
>>         d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
>>      aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>      aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>>   5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>>      c0a00000.usb-vbus             1                                 0mA     0mV     0mV
>>   VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>>      c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV
>>
>> [0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md
>>
>> Andre Heider (6):
>>    riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
>>    riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
>>    riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>>    riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
>>    riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
>>    riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
>>
>>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
>>   1 file changed, 308 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.53.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
