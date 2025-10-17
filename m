Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F9CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBJjyWmVnXUrt9LM4dNQNLqteZogx0SVazdMs4PYrj8=; b=fIHuLLrkgzoG077hDAxrgDa4uO
	T19uf180iAU5vBzFjcFTJ2C7GZ/+dTF+sfCY+xxOwIAm1mXNejb54XkI74Cs/Gf9HLSowDOVQf5vZ
	375Qn88BNp5TV7J4q1HMKSQoeCRPcj2wOvs8wFcqkXwEMJBxrCgu9MN93Qw1cl0AKUEukuww6UAzl
	9ZWLci3xcJDFYmPROF1Tss8qbngdTDehm5SBuDhpULIRiZ+j3zHGkhzovwI1MP4YPfPqaPp0roI/u
	wIRCEovXKZ6ltZg2R4ePQ28YSNy/vH7em9UKKElrKQw+FXx27Xi3wtfhB0jBF1wZfDDOEpYzE3ADP
	QY8AUOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCd-00000008QIX-3cWb;
	Fri, 17 Oct 2025 16:21:15 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCa-00000008QFX-0GJy
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:21:14 +0000
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-93e7ece3025so29835939f.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718071; x=1761322871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7+Wio6b8w1yNg9Tem9uVrRYlYIL3Mf5C/3BZyCBdIc=;
        b=X3AKmOCj9sv/ZwxYaRWq7p8zyUkCa9hpv0ZXJge9ckNy19blo0bCWmWxI601ZeaWZ9
         kdQEBEf1ujZc5zVivhQtntWbGj7H38mVm07YAPyfZqQuz2U9VG7EM6g09tNlPjifsY6b
         96LfmutdzxwD2ukIE6Xm5K5tbSWRNUcu+4MMKzQG2mL0EB/4rH7u8amCk6ILsJNiIgQc
         QdrL1bajJc1n5ViuqWqP/4Zj9IflP2N6LwcCTtntAfWhpP5IDSp41BbT1rbq4pcpkEj3
         V8pYGXZBW8tScq/tcQN75RiUDRe7y/DKBudznBws84DkSRb7mPdlhLTW4QurxQxF7TnX
         hQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718071; x=1761322871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7+Wio6b8w1yNg9Tem9uVrRYlYIL3Mf5C/3BZyCBdIc=;
        b=MuLTuL+qRBey4lToc3cGreVIL6ORTNYGH9Qac16RlBE5rzsVSji3nSrc09ph6Z40aY
         Leu3X6G07ljXwhMTkRk/rG6tZEN4oZf510h4yEHd6Q/A5Dm08WT6pb6AngxUDjU2K3VV
         tPYs+2pKAtp4ZXqDBsB3e4CtKbjIe6UyWAJHPPNariGIRebT7BmFPYwfBrQFr1fbkbBe
         rT2MQJTioBa3xGpa1mFnbL6bQbS7Ftu2M8Vhs7Lv5hukjk+lNr7TwBKwBj5cqF5jCCvl
         yL2of1j/26CF2ipJ//Px0zVeeMzd5M2Y0M9ezy9ROYGu39Es6jjXUUpD6cqq+kyfG9Cg
         Q3cw==
X-Forwarded-Encrypted: i=1; AJvYcCU5PzXQG61PALSitREd6k9sZEUM3H3T9XP5qV9agawnE8KU+OUWqITDvOd3fMRuGsIPPIbdDGN3HMrP+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVvoSbNUqj9vNUZduwMUSn0By/ea4JRhtHFxDirCvIHGvoTy2F
	LNQ6DrObb6238awA47AQBdIBCGM4JKwGQHq6b6MSm1HeyDnCnzsamXd6Aty9zS7KaK0=
X-Gm-Gg: ASbGnctxuFCzsB8AKV13TPGprcwhKsSUAVgRbXcYiHr+b3i/MDCZdsVqvsOFulDa+59
	Fq01+LTYRhFPRPefmFAz7vMjh/NmLLYVp+0ZucZdt3Ubc38XQdsbikofkRr6+3GX1N06N9dFiio
	pdvhOTOa/trqbC4eNALsIVmpE1hBMdgR+dbvucfErG9MbYGyN7wCxyYtVCWEGkXQ4FMAu/vv8Ay
	Y6loAAY7b6ez68l7mL5Uvi103xRGlgM4tIX42EkzZwD6Ad7WN3hc7VA3Kt7eRk9b9+4rX7hJ9jK
	HvnVjhCoReGEcaldmAhj/GEjlHm3pepsaqfJlFJ1+l9tFpFMRAvsEZNlJa++dMPBHxbS1qp8ZeE
	1BFazP7KQQh1UOHs1JI6YOBNzTsa9G94jB8UqUaW0nnfaflWe6BNSeAy0AU0D0bm50loVtsCAzZ
	3sbwvc3jF0ZEFwK+ilhAYq6fWS5+YFWZ1W+krgjtY=
X-Google-Smtp-Source: AGHT+IEIgP2oHx8F177Q7uZqnuNLPeZz2b0M8yBXR1aqrI1laVD3XEel+UPyfoDNXtqbVVX4QNo+pg==
X-Received: by 2002:a05:6e02:440b:10b0:430:bf84:e94c with SMTP id e9e14a558f8ab-430bf84e9e5mr60046655ab.13.1760718070850;
        Fri, 17 Oct 2025 09:21:10 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97b92b1sm10677173.68.2025.10.17.09.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:21:10 -0700 (PDT)
Message-ID: <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
Date: Fri, 17 Oct 2025 11:21:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPEhvFD8TzVtqE2n@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092112_320174_0CB45489 
X-CRM114-Status: GOOD (  20.30  )
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

On 10/16/25 11:47 AM, Aurelien Jarno wrote:
> Hi Alex,
> 
> On 2025-10-13 10:35, Alex Elder wrote:
>> This series introduces a PHY driver and a PCIe driver to support PCIe
>> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
>> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
>> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
>> one PCIe lane, and the other two ports each have two lanes.  All PCIe
>> ports operate at 5 GT/second.
>>
>> The PCIe PHYs must be configured using a value that can only be
>> determined using the combo PHY, operating in PCIe mode.  To allow
>> that PHY to be used for USB, the calibration step is performed by
>> the PHY driver automatically at probe time.  Once this step is done,
>> the PHY can be used for either PCIe or USB.
>>
>> Version 2 of this series incorporates suggestions made during the
>> review of version 1.  Specific highlights are detailed below.
> 
> With the issues mentioned in patch 4 fixed, this patchset works fine for
> me. That said I had to disable ASPM by passing pcie_aspm=off on the
> command line, as it is now enabled by default since 6.18-rc1 [1]. At
> this stage, I am not sure if it is an issue with my NVME drive or an
> issue with the controller.

Can you describe what symptoms you had that required you to pass
"pcie_aspm=off" on the kernel command line?

I see these lines in my boot log related to ASPM (and added by
the commit you link to), for both pcie1 and pcie2:

   pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 AS
PM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
   pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM

   . . .

   nvme nvme0: pci function 0000:01:00.0
   nvme 0000:01:00.0: enabling device (0000 -> 0002)
   nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
   nvme nvme0: 8/0/0 default/read/poll queues
    nvme0n1: p1

My NVMe drive on pcie1 works correctly.
   https://www.crucial.com/ssd/p3/CT1000P3SSD8

   root@bananapif3:~# df /a
   Filesystem     1K-blocks     Used Available Use% Mounted on
   /dev/nvme0n1p1 960302804 32063304 879385040   4% /a
   root@bananapif3:~#

I basically want to know if there's something I should do with this
driver to address this.  (Mani, can you explain?)

Thank you.

					-Alex

> Regards
> Aurelien
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3ac2ff14834a0aa056ee3ae0e4b8c641c579961
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
