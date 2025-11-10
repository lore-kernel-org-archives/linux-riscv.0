Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C6CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0v2afNIjoHS5bvhT1HbZiH2LmNgvOzA6mIJK8YYsD8=; b=xQrtYLJDjKdtS+tpuWokdUcpBC
	aN6/OeL2/7U9NKbZTBc1pB4F/w0teX5+XuyqZMncE6b8+OlsTgbYc0XUM7uF4uSwQKLORJYcreRF+
	cx57w/giNG4ATWzlZnu56FKkzHjthDMDligRxAND0pwha8c30Z40EaX1/5qckiJcC9upzGVmf4r/w
	ebjrXo3j7+NPGhaXDhhDXLV52rll3gt0OcEn5F5J+wtm0Ajkw3TYMAHcykNn863qzQcCUFZ2ScQH1
	Bm4pEETNCM7l07dyWndXV57JTGbSvLWK6q4gZSsJi4Uv6EcuxoSuDJYTUBd04NuZD5H0iHHLufh/x
	Da8Y88Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITgq-00000005fyL-1B2N;
	Mon, 10 Nov 2025 15:20:20 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITgn-00000005fx7-1eXd
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 15:20:19 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-43376624a8fso17941545ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762788016; x=1763392816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHqCJdsR7z6UGezYu2PLRy2EX3z1OohmVvws0HQYrFQ=;
        b=0nF7kg12cHIovP6iY3zivOWNgKm2kcuaxWnJlJgSQxS7sD3XgQllODN67i4j4om7Zf
         UEcpMu2FQ6r3IMu3KA8FsATFC8cuG7+KHCbOJkq5kDjIh/y9hACD3LmhmUya2KMA8I+j
         iw2l3QlQxBpTDI2q2boJLFGbtyih8qJbLn7bHIzvcM1SEAtTK08cubm6m3NlOrpNzC83
         Uhlr7ehaqkoF0KdNy4DQv4S0gNOZlhAQUil1zi1R6MjYBOahWgFqclcdeBqNiSIRNcmC
         /CGxOvHeFdtDSDKG74WE7Qo8Nt3j01QkYVQdzBm4H7JdG/Im01eRQulOExvxZQBK0Jv3
         mUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788016; x=1763392816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHqCJdsR7z6UGezYu2PLRy2EX3z1OohmVvws0HQYrFQ=;
        b=xCWqZBc2cbRjS0sDyNycs7dxPvZBDL0eArv+vpRc/kyawnZhmRmTqJ3wq46p2pmKkG
         u0u8u9C/f/XJQtzQzEuxVcTK0SisE5AyjcaS4wthx1dVxezZIkKv1jd26hpZieG6lCTz
         80AFkWGrRwp3z3Fc6A6UX3pkEGMq/gfX8EG9VHlzpjCFCYE5mehfzhsIKj4K1jpPSkZt
         /1khnPe1r8knFEt5lxlsbQJNOefYN13bCwHyO+n0r9O9KwfW4AHlWu7cPRlCYJ33VD2H
         zm8WD3wcMLqYlpDwCuSZ47WJptHhVAwDsbwqIEjJluQanQK94axWnFmqG0kHooQS6j+z
         ettA==
X-Forwarded-Encrypted: i=1; AJvYcCU6bfZZDHQ92dcIxYCNw/JUiEZYMAmfcyl67bdPodXLi/wIE0RIKydZYRrukBfNJaAHyI6R/NOmji6UUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO3t+a0fhqZf0TLfS0ZkePMOXiDzn7q/fOpHbZOnyFyXx92kFA
	xpo8kVyqBp1L0jV1OCVVWJLE2OvdZ4BeEoGs5l5suK55aRH6vkKIpFLLh56F5IUwL7w=
X-Gm-Gg: ASbGncsCgnc/MHFjpLc+YyKO8Fp5SAilnqd/7Pztr66J869LwP+l1KPK+NkRgOfvZmE
	YkWIPYi2s2Ik/P+njWR5AG7BVYlKNdhirm3rE8XCx5cwsaLrQH8cAHEpDQ1Vdm6bNJWqrnuhk77
	rLgLYD6JGQYEb9FbCCczU0TxR4a2ecv3kk2D8JB9IeM1Ra2cJpHx+7VxGiBg+1gI0qhoQwBGKse
	IRGX5bUHPVKRZxFVic16UpadYJHNI7HUXJvDh9sARkN0TnpzYCjWkVYWfdq4/1+G74Zt3jn8jhr
	/CbzuOKIobkSzNQ/iLmyCsAmPPnPfq7wHnT20so9KWTITlFiRrutsDUMRNDJIyVAvec5lDscN5+
	EtQospaJWOwTjDhS5Xm9q8V8vOJ7MLaSfGpXdy4qc4zg3Q2ISiJDB2NciltTbjUsW6BJuAsw87e
	ValMVIeO1tCtEE/LTIR3c0aOTIM8nmgHQxcTlT3LQ=
X-Google-Smtp-Source: AGHT+IEbu7UkRnaq1HAZF7KJE8mC7YX4IT4qsm04tHRZF/RRVkDmdBo8SVYWqOjog8FiLYEn3hk8pw==
X-Received: by 2002:a05:6e02:1aa2:b0:433:3034:e88 with SMTP id e9e14a558f8ab-43367e48c8bmr107760915ab.21.1762788016218;
        Mon, 10 Nov 2025 07:20:16 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f4f5b90sm56357735ab.33.2025.11.10.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:20:15 -0800 (PST)
Message-ID: <66ab3a48-5d5a-47c7-b8eb-b477fd987314@riscstar.com>
Date: Mon, 10 Nov 2025 09:20:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, ziyao@disroot.org, johannes@erdfelt.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251107191557.1827677-1-elder@riscstar.com>
 <aQ8kqIljwGZfkF8M@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aQ8kqIljwGZfkF8M@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_072017_476589_7FE93639 
X-CRM114-Status: GOOD (  29.67  )
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

On 11/8/25 5:08 AM, Aurelien Jarno wrote:
> Hi Alex,
> 
> Thanks for this new version.
> 
> On 2025-11-07 13:15, Alex Elder wrote:
>> This series introduces a PHY driver and a PCIe driver to support PCIe
>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>> ports operate at 5 GT/second.
>>
>> The PCIe PHYs must be configured using a value that can only be
>> determined using the combo PHY, operating in PCIe mode.  To allow
>> that PHY to be used for USB, the needed calibration step is performed
>> by the PHY driver automatically at probe time.  Once this step is done,
>> the PHY can be used for either PCIe or USB.
>>
>> This initial version of the driver supports 32 MSIs, and does not
>> support PCI INTx interrupts.  The hardware does not support MSI-X.
>>
>> Version 5 of this series incorporates suggestions made during the
>> review of version 4.  Specific highlights are detailed below.
>>
>> Note:
>> Aurelien Jarno and Johannes Erdfelt have reported seeing ASPM errors
>> accessing NVMe drives when using earlier versions of this series.
>> The Kconfig files they used were very different from the RISC-V
>> default configuration.
>>
>> Aurelien has since reported the errors do not occur when using
>> defconfig.  Johannes has not reported back about this.
> 
> Unfortunately, while it is true with v4, this is not the case with v5
> anymore :(

That's too bad, but thank you for reporting it.

> Fundamentally in the generic designware driver, post_init (which is used
> to disable L1 support on the controller side) is called after starting
> the link. The comparison of the capabilities is done in
> pcie_aspm_cap_init when the link is up, which happens a tiny bit after
> starting it.
> 
> In practice with v4, the link is started, ASPM L1 is disabled and the
> link becomes up. With v5, the move of the code getting and enabling the
> regulator changed the timing, and ASPM L1 is now disabled on the
> controller 2-3 ms after the link is up, which is too late.

Yes in v4, we relied on the root port driver to enable the
regulator, but (on my system anyway) that happened too late,
*after* the PCIe controller driver held PERST# asserted for
100 msec.  PERST# is not supposed to be de-asserted until
power is known to be stable.  So v5 went back to having
the controller get the regulator in k1_pcie_probe().

I am supposed to receive the WD Blue SN570 on Wednesday, and
when I get that I'll have a chance to try to reproduce at
least one of these problems, and can ensure there are no
timing-related issues like this.

Thank you for your continued testing and feedback about this.

					-Alex

> I have added a call to pci_info to display the moment where ASPM is
> disabled. This is without the regulator change:
> 
> [    0.386730] spacemit-k1-pcie ca400000.pcie: host bridge /soc/pcie-bus/pcie@ca400000 ranges:
> [    0.386970] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
> [    0.387017] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
> [    0.387047] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
> [    0.387062] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
> [    0.400109] spacemit-k1-pcie ca400000.pcie:       IO 0x009f002000..0x009f101fff -> 0x0000000000
> [    0.490101] spacemit-k1-pcie ca800000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.494195] spacemit-k1-pcie ca400000.pcie:      MEM 0x0090000000..0x009effffff -> 0x0090000000
> [    0.850344] spacemit-k1-pcie ca400000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.950133] spacemit-k1-pcie ca400000.pcie: PCIe Gen.1 x2 link up
> [    1.129988] spacemit-k1-pcie ca400000.pcie: PCI host bridge to bus 0000:00
> [    1.335482] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.340946] pci_bus 0000:00: root bus resource [io  0x100000-0x1fffff] (bus address [0x0000-0xfffff])
> [    1.350181] pci_bus 0000:00: root bus resource [mem 0x90000000-0x9effffff]
> [    1.358734] pci_bus 0000:00: resource 4 [io  0x100000-0x1fffff]
> [    1.362033] pci_bus 0000:00: resource 5 [mem 0x90000000-0x9effffff]
> [    1.368289] spacemit-k1-pcie ca400000.pcie: pcie_aspm_override_default_link_state
> [    1.375967] pci 0000:00:00.0: [1e5d:3003] type 01 class 0x060400 PCIe Root Port
> [    1.383043] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x000fffff]
> [    1.388927] pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x000fffff]
> [    1.394826] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    1.400061] pci 0000:00:00.0:   bridge window [io  0x100000-0x100fff]
> [    1.406460] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> [    1.413245] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
> [    1.421012] pci 0000:00:00.0: supports D1
> [    1.424948] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    1.432718] pci 0000:01:00.0: [1987:5015] type 00 class 0x010802 PCIe Endpoint
> [    1.438698] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
> [    1.445426] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x2 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [    1.464897] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> And this is with the regulator change:
> 
> [    0.410796] spacemit-k1-pcie ca400000.pcie: host bridge /soc/pcie-bus/pcie@ca400000 ranges:
> [    0.410836] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
> [    0.410889] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
> [    0.410917] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
> [    0.410932] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
> [    0.424651] spacemit-k1-pcie ca400000.pcie:       IO 0x009f002000..0x009f101fff -> 0x0000000000
> [    0.436446] spacemit-k1-pcie ca400000.pcie:      MEM 0x0090000000..0x009effffff -> 0x0090000000
> [    0.513897] spacemit-k1-pcie ca800000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.559595] spacemit-k1-pcie ca400000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4G
> [    0.839412] spacemit-k1-pcie ca400000.pcie: PCIe Gen.1 x2 link up
> [    0.847078] spacemit-k1-pcie ca400000.pcie: PCI host bridge to bus 0000:00
> [    0.857600] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.868702] pci_bus 0000:00: root bus resource [io  0x100000-0x1fffff] (bus address [0x0000-0xfffff])
> [    1.146409] pci_bus 0000:00: root bus resource [mem 0x90000000-0x9effffff]
> [    1.373742] pci 0000:00:00.0: [1e5d:3003] type 01 class 0x060400 PCIe Root Port
> [    1.380963] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x000fffff]
> [    1.386883] pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x000fffff]
> [    1.392808] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    1.395394] pci 0000:00:00.0:   bridge window [io  0x100000-0x100fff]
> [    1.401811] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> [    1.408583] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
> [    1.416354] pci 0000:00:00.0: supports D1
> [    1.420294] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    1.428220] pci 0000:01:00.0: [1987:5015] type 00 class 0x010802 PCIe Endpoint
> [    1.434034] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
> [    1.440772] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x2 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [    1.463390] pci 0000:01:00.0: pcie_aspm_override_default_link_state
> [    1.467000] pci 0000:01:00.0: ASPM: default states L1
> [    1.472093] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> Note how the line pcie_aspm_override_default_link_state arrives too
> late.
> 
> Regards
> Aurelien
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
