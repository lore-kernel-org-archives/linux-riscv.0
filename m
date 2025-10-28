Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9515CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yutKkvhtWYbIRPpNlQspvJ8e2aFY+ucFXBLvkdM6YxU=; b=pOUBOLtJB4rF0G0PhAaJogHh3q
	cvUm8Uv4+ef2ryrlxgLGHSeuv2lfgpDjiwVRwdNrw9wFmOJpIr+GWEWVDyLQTwTg/7VOFePM2Y/hE
	8UzD2ioKQAJ22jQetMwO0x89sxyW4Je0CvBAugntIouDpwOkHVEzObT49qYiTZqv5U6PS//lAUgxn
	ln0GaGbk52f6fA8ibgVwCsxHQoh3U4SOhktCcdLn8+hL+ql8KoiRKHuT4YXNCC5ApvoKQ8yE+HybX
	wo4Fc55HtFSA77SaA/rG7BaR9rdPP1cdOPUNCyMNEtaZNqsKiQqTvWd6EWkaSF4ivaQCMfuAlIRJn
	CVE7yoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDp5T-0000000GXMC-0tjX;
	Tue, 28 Oct 2025 19:10:31 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDp5Q-0000000GXLV-1Cb2
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 19:10:29 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-92c781fd73aso612943639f.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761678627; x=1762283427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EvGdMAKfZ7Ml9MAZLdEsRbNSkR6vsJo2X4G5HAZ0rWo=;
        b=lNt/a9ks/IcBsZZnwMDR5USimAmeIA5IK4BCr0phPj+QeIIELYSpBaFOzJUDTVT0F2
         o9wG3q5Y5lqmvoWZudgJoVl0MH3QtpUZ5px6PcEq9zPjc5h8YGsP6M9Xq9+oCmWv3TGG
         8hPVABUacr1SH0ajNb37Hc7kuVG1tw4AsA4/prEQDWEDnP3SDhR7sQxkz57IzRmHLNQl
         kXjB+pu+oJwHtd1i3nS1G0EIrz/EYJ8Fl6dwPj9pFDZMV1r3QO5Pch+jEJV7PB7SOmuL
         3JzDAnmP5kt0cglcxkG89aVCaFIN5pklFs7+2rGw6+JmnnUwZAxr/kN9RU0nhtVcup/H
         ef2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761678627; x=1762283427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvGdMAKfZ7Ml9MAZLdEsRbNSkR6vsJo2X4G5HAZ0rWo=;
        b=iozVA4B4tm+upQWKUjuL023PgRNxILv10Hd4/QjvvwRPaq1VV2uxcBwjTysmXgv70e
         rIM/RDkDUdB8aOyyFfoMx1N/CU8NskzeT13J8r9Aze2MMUCTViIgHxjStNLAjD7PMLtZ
         fPKrF3mcSgIi6jd5dDUPbIWllWfpE237XKwHabgTe9XoxKqFoq98aUdJqKQ2IxARCilC
         PfLVqXEvo4yYhmxhALB8KEdQ6EeqFJXNkotp6vdaSaePeg1uY4ocoTj5BjBdVFS7mowr
         zATE9tDspfJi2CVZhxAA49NPCTryCok91cdslReH0l4xQ8GsEBw9AaSk67WuZ28hTDEQ
         doIw==
X-Forwarded-Encrypted: i=1; AJvYcCUBFN713VlbBd5zMvkFRB/42wv2TrMzP4X0xl6qaSiSI9GWj3QtdOnBrUcQk4IJsZZINhyUBEUJREc2xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG6ftqUSNjO211tr70IPYUUtv19p9Nw/Mp1xsloqOJUuFpRMjI
	+pXjVL4VQEFXpouy7x+hV+GAtYtob0pY31I6DQc1wqFcJpsoCEgb59bN6v8xPJoHkno=
X-Gm-Gg: ASbGncsORjnlq3tOSwhV/ThQ4G4ja6cfKuOalk3kbuN0N2McYNr6eU2/i5O9i/1c8Cp
	LcukT+DS2NoC8w25fSei+5g9bqzNv6UjiE6FO/nDAfrCLDma451feK4U6SavQDtHjJJNE1DlTHc
	/aw4+fxU8j04vhyhxUaeNfIgAnwYXQk1kBS1al6Pmfy886V4XD9824h0aPySizyzIKAGSIT5RoR
	lHhXf4gYLbVzVAFL7lLWOqS/vrHyxJkGvFmKS4noU+UUYYYBJ8y05WVIlS3QahqOGBfVhiq3kfC
	/HldjUXfiNYz9zDdY9UWFtEJdJyhTO1Gd0ZHR0FVPt5zkH++pUTClUjpsre9Sl6nr9FpNGMoY13
	Iz429cCNPQp5IznU0bulSlk8LNwUxWa91sqcrLmIHB62wggZXeZgw4D4PsrdF/MJO1wbTmG8nOS
	KWyQ3iIn7C8JJZrFx4u+No8YKc5zfHJw6pPKmK7vIo
X-Google-Smtp-Source: AGHT+IHKuwmELl5wvSW4I+FHrhUsBFKFYIw0+cikEGfn2t/jK11qnrH+VrvEbMUJ5F8utuhwE/grRQ==
X-Received: by 2002:a05:6e02:214f:b0:42f:9560:f733 with SMTP id e9e14a558f8ab-432f8fad5c3mr5106075ab.13.1761678626721;
        Tue, 28 Oct 2025 12:10:26 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f6899e76sm45826615ab.34.2025.10.28.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 12:10:25 -0700 (PDT)
Message-ID: <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
Date: Tue, 28 Oct 2025 14:10:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Johannes Erdfelt <johannes@erdfelt.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net> <20251028184250.GM15521@sventech.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251028184250.GM15521@sventech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_121028_584519_5256F101 
X-CRM114-Status: GOOD (  39.19  )
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

On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
> On Tue, Oct 28, 2025, Aurelien Jarno <aurelien@aurel32.net> wrote:
>> Hi Alex,
>>
>> On 2025-10-17 11:21, Alex Elder wrote:
>>> On 10/16/25 11:47 AM, Aurelien Jarno wrote:
>>>> Hi Alex,
>>>>
>>>> On 2025-10-13 10:35, Alex Elder wrote:
>>>>> This series introduces a PHY driver and a PCIe driver to support PCIe
>>>>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>>>>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>>>>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>>>>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>>>>> ports operate at 5 GT/second.
>>>>>
>>>>> The PCIe PHYs must be configured using a value that can only be
>>>>> determined using the combo PHY, operating in PCIe mode.  To allow
>>>>> that PHY to be used for USB, the calibration step is performed by
>>>>> the PHY driver automatically at probe time.  Once this step is done,
>>>>> the PHY can be used for either PCIe or USB.
>>>>>
>>>>> Version 2 of this series incorporates suggestions made during the
>>>>> review of version 1.  Specific highlights are detailed below.
>>>>
>>>> With the issues mentioned in patch 4 fixed, this patchset works fine for
>>>> me. That said I had to disable ASPM by passing pcie_aspm=off on the
>>>> command line, as it is now enabled by default since 6.18-rc1 [1]. At
>>>> this stage, I am not sure if it is an issue with my NVME drive or an
>>>> issue with the controller.
>>>
>>> Can you describe what symptoms you had that required you to pass
>>> "pcie_aspm=off" on the kernel command line?
>>>
>>> I see these lines in my boot log related to ASPM (and added by
>>> the commit you link to), for both pcie1 and pcie2:
>>>
>>>    pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 AS
>>> PM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
>>>    pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
>>>
>>>    . . .
>>>
>>>    nvme nvme0: pci function 0000:01:00.0
>>>    nvme 0000:01:00.0: enabling device (0000 -> 0002)
>>>    nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
>>>    nvme nvme0: 8/0/0 default/read/poll queues
>>>     nvme0n1: p1
>>>
>>> My NVMe drive on pcie1 works correctly.
>>>    https://www.crucial.com/ssd/p3/CT1000P3SSD8
>>>
>>>    root@bananapif3:~# df /a
>>>    Filesystem     1K-blocks     Used Available Use% Mounted on
>>>    /dev/nvme0n1p1 960302804 32063304 879385040   4% /a
>>>    root@bananapif3:~#
>>
>> Sorry for the delay, it took me time to test some more things and
>> different SSDs. First of all I still see the issue with your v3 on top
>> of v6.18-rc3, which includes some fixes for ASPM support [1].
>>
>> I have tried 3 different SSDs, none of them are working, but the
>> symptoms are different, although all related with ASPM (pcie_aspm=off
>> workarounds the issue).
>>
>> With a Fox Spirit PM18 SSD (Silicon Motion, Inc. SM2263EN/SM2263XT
>> controller), I do not have more than this:
>> [    5.196723] nvme nvme0: pci function 0000:01:00.0
>> [    5.198843] nvme 0000:01:00.0: enabling device (0000 -> 0002)
>>
>> With a WD Blue SN570 SSD, I get this:
>> [    5.199513] nvme nvme0: pci function 0000:01:00.0
>> [    5.201653] nvme 0000:01:00.0: enabling device (0000 -> 0002)
>> [    5.270334] nvme nvme0: allocated 32 MiB host memory buffer (8 segments).
>> [    5.277624] nvme nvme0: 8/0/0 default/read/poll queues
>> [   19.192350] nvme nvme0: using unchecked data buffer
>> [   48.108400] nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
>> [   48.113885] nvme nvme0: Does your device have a faulty power saving mode enabled?
>> [   48.121346] nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
>> [   48.176878] nvme0n1: I/O Cmd(0x2) @ LBA 0, 8 blocks, I/O Error (sct 0x3 / sc 0x71)
>> [   48.181926] I/O error, dev nvme0n1, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 2
>> [   48.243670] nvme 0000:01:00.0: enabling device (0000 -> 0002)
>> [   48.246914] nvme nvme0: Disabling device after reset failure: -19
>> [   48.280495] Buffer I/O error on dev nvme0n1, logical block 0, async page read
>>
>>
>> Finally with a PNY CS1030 SSD (Phison PS5015-E15 controller), I get this:
>> [    5.215631] nvme nvme0: pci function 0000:01:00.0
>> [    5.220435] nvme 0000:01:00.0: enabling device (0000 -> 0002)
>> [    5.329565] nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
>> [   66.540485] nvme nvme0: I/O tag 28 (401c) QID 0 timeout, disable controller
>> [   66.585245] nvme 0000:01:00.0: probe with driver nvme failed with error -4
>>
>> Note that I also tested this latest SSD on a VisionFive 2 board with exactly
>> the same kernel (I just moved the SSD and booted), and it works fine with ASPM
>> enabled (confirmed with lspci).
> 
> I have been testing this patchset recently as well, but on an Orange Pi
> RV2 board instead (and an extra RV2 specific patch to enable power to
> the M.2 slot).
> 
> I ran into the same symptoms you had ("QID 0 timeout" after about 60
> seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
> seems to work fine with the "pcie_aspm=off" workaround as well.

I don't see this problem, and haven't tried to reproduce it yet.

Mani told me I needed to add these lines to ensure the "runtime
PM hierarchy of PCIe chain" won't be "broken":

	pm_runtime_set_active()
	pm_runtime_no_callbacks()
	devm_pm_runtime_enable()

Just out of curiosity, could you try with those lines added
just before these assignments in k1_pcie_probe()?

	k1->pci.dev = dev;
	k1->pci.ops = &k1_pcie_ops;
	dw_pcie_cap_set(&k1->pci, REQ_RES);

I doubt it will fix what you're seeing, but at the moment I'm
working on something else.

Thanks.

					-Alex

> Of note, I don't have this problem with the vendor 6.6.63 kernel.
> 
>>> I basically want to know if there's something I should do with this
>>> driver to address this.  (Mani, can you explain?)
>>
>> I am not sure on my side how to debug that. What I know is that it is
>> linked to ASPM L1, L0 works fine. In other words the SSDs work fine with
>> this patch:
>>
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 79b9651584737..1a134ec68b591 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -801,8 +801,8 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
>>   	if (of_have_populated_dt()) {
>>   		if (link->aspm_support & PCIE_LINK_STATE_L0S)
>>   			link->aspm_default |= PCIE_LINK_STATE_L0S;
>> -		if (link->aspm_support & PCIE_LINK_STATE_L1)
>> -			link->aspm_default |= PCIE_LINK_STATE_L1;
>> +//		if (link->aspm_support & PCIE_LINK_STATE_L1)
>> +//			link->aspm_default |= PCIE_LINK_STATE_L1;
>>   		override = link->aspm_default & ~link->aspm_enabled;
>>   		if (override)
>>   			pci_info(pdev, "ASPM: default states%s%s\n",
>>
>> I can test more things if needed, but I don't know where to start.
> 
> I'm not a PCIe expert, but I'm more than happy to test as well.
> 
> JE
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
