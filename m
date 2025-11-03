Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1E4CCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGImg/uTTE14MDC675IPDFSF1iwChHNsgYMamM0gFm0=; b=hQEZ3iLPrvPLRD
	L37P7YRv7REowlLKKBozKo2c8/dpwhQUFBOfEqv8FlPPfjUKz0Uv/ObiTVCRQ46R2bUwxIkT8uoU0
	ywUQdP+aSnZrnGlG9dQaBAXm3/tgVci+Q40DHcGnZvkVqiuef8YBBIHniDhwDvImoRQmCGONRZ3tg
	P1KgIr1jcG6ZLcPj+hEKpI1AXbc1yk+L5cojvwx6EKklALzUr9oKU+hoTZiCOYsKv68ZNZbqGHnyI
	xHOy/9xELyfT2fTNkdrcBBKlOYzRlz4MvEhi9F7qup4j7KNWZSrKQSiDvK/hKjNcnvyiVaxRv0nWN
	8Gs+bkEfi39NGrDfwkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxdY-0000000AHwQ-02QP;
	Mon, 03 Nov 2025 16:42:32 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxdU-0000000AHvR-3FX9
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 16:42:30 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-4331e9cb748so6805955ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Nov 2025 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762188147; x=1762792947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHeoDcWtrtw4Kqs9i7E9yy2tKQ26ZOwu5ohkUo50ijM=;
        b=sMXbLwhgqcBlYyO7RiPH/tjjHjImG2bieXZnXntKKmCNvQyXGrV5Y9q0Xx6y5t0CyR
         lVZjxo6zQ6QC0kwbs7JF1U2xqgIHDzkppXGsk+MERwVuAnvEEaKWZkPwuraP2CkjZaYY
         A1gaE8kk0kr0SVxXjspz/SpRnlvcQu5bHiIuw78ldbNSCff4MilEihLI+/P+ZYZr1Yhy
         HaRM5HBEWhQyl7cYGwyOZWNKDKX/kmuEGletSPNYOVr1QxIh7226C7RlFB9MxSvyBKkg
         62wYUl1PILkpKLksVIUb+yrzbZ55ofzfWh+IwzkCcFdJcJEgtrB52lnbatn1wnYOfOT2
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762188147; x=1762792947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHeoDcWtrtw4Kqs9i7E9yy2tKQ26ZOwu5ohkUo50ijM=;
        b=bNTgGB/99duqO32BjaVqTQfHZoLOWlE4MQaFPwg7iph5397XI5kQPGOSJUxm9ybWr+
         z9OHBntgqcdC1QWTp5TI8OzWo9RCSPK0WiDvfWDiUNXYa5aHNgkQSTneiaKtTw+Uqt7A
         xPeaGgX3M4DKOVtDepscqooaCO8KaL51HZDSZm9JMdAZCISoSH02mr69bq28PLPvshnU
         noSYZUJ8LAgh8LuE0SxziEuP0F/9AJkkLN9QVBmDEBGAAVbRdccdpCiimTh/jRQx7xdl
         R4Toi+ZZNu+V1TQ4vDIVp+R9YfDSn/h5qdN8N4PWaS1v3MJuM9FNPLIo41UYm001hzT0
         tRMw==
X-Forwarded-Encrypted: i=1; AJvYcCUV7f7fZmKCUY17mqQwTl7MD02uQ/AeLSJZtD3jgwaoSMpB54D91lKitcFNitQLNHa+EgPrBoi0WoU40Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywaja3Vhjn3mJefmFHtQGmN0nsYfzXDbJ+WXM361E2lNDw9EXiq
	G7wopCumS8YdFeaziFhEnov/LUcVa7Y2o0TCvGi5cC3BdKolIFRlBQCzbWcNezOje24=
X-Gm-Gg: ASbGncsJqb/YL2R4C3tGjlEp74JkAq74QJHQdeEjhVoaRozgIsgOCtp1ukfwKgcpLiW
	5F7yyy1Tle/3masNg5mtBZVCUyO8RuvxqDzcigPU3BXt55rJA/VTrYW/BCeXwqokvFbvwjKxE0w
	YJhUJeucK+HeGRinrrPAGGKN05b1rQZcLKOJutVVVAPhgdNjB6Wf+2957ILxw8cwwfgYYrxh9tx
	nIPwHVdyVgARy+1XTY9jmbd1gy8f3IGxzKwSPM4PdqRNH+YGgVOQ5b83oiYAndeQ6kXtzpq7NQf
	/XVu/QDYN15Ax5zLlhoZhQOG8tYUVqHqKntwulebv4mzIcqx+UkqjPE7uErDtbnQLqUQyXxs9un
	3YYaR2CyUqOYhcTslcdwfMSKeEAYRICJN1U6ESFtz5euNyq1VFr4wlj5nC6h/AzOzpHjBn4swgi
	TGdYAKl9DN0eTtLCXtqdURX4M6hhu5LPFPIVMmn0w+
X-Google-Smtp-Source: AGHT+IHkHY4VTZ7p5OKjtOgXuNnn4x75Ilvl4YEJ6q5B/6x6J8/6eBwuDTFeeDgt2AKvux4z5rFo4g==
X-Received: by 2002:a05:6e02:4603:b0:433:229c:351c with SMTP id e9e14a558f8ab-433377fbe1emr622165ab.1.1762188147419;
        Mon, 03 Nov 2025 08:42:27 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7226f55edsm334467173.59.2025.11.03.08.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:42:26 -0800 (PST)
Message-ID: <35da84ab-5104-4fee-a7ea-4f3d42f7344a@riscstar.com>
Date: Mon, 3 Nov 2025 10:42:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Cc: Johannes Erdfelt <johannes@erdfelt.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, vkoul@kernel.org,
 kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
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
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
 <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
 <aQOlMcI9jTdd7QNb@aurel32.net>
 <ywr66wfkfay3xse77mb7ddbga5nced4yg7dapiybj3p2yp2an2@7zsaj5one5in>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ywr66wfkfay3xse77mb7ddbga5nced4yg7dapiybj3p2yp2an2@7zsaj5one5in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084229_057260_7BD72652 
X-CRM114-Status: GOOD (  26.28  )
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

On 10/31/25 1:10 AM, Manivannan Sadhasivam wrote:
> On Thu, Oct 30, 2025 at 06:49:37PM +0100, Aurelien Jarno wrote:
>> Hi Mani,
>>
>> On 2025-10-30 22:11, Manivannan Sadhasivam wrote:
>>> + Aurelien
>>>
>>> On Tue, Oct 28, 2025 at 01:48:32PM -0700, Johannes Erdfelt wrote:
>>>> On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
>>>>> On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
>>>>>> I have been testing this patchset recently as well, but on an Orange Pi
>>>>>> RV2 board instead (and an extra RV2 specific patch to enable power to
>>>>>> the M.2 slot).
>>>>>>
>>>>>> I ran into the same symptoms you had ("QID 0 timeout" after about 60
>>>>>> seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
>>>>>> seems to work fine with the "pcie_aspm=off" workaround as well.
>>>>>
>>>>> I don't see this problem, and haven't tried to reproduce it yet.
>>>>>
>>>>> Mani told me I needed to add these lines to ensure the "runtime
>>>>> PM hierarchy of PCIe chain" won't be "broken":
>>>>>
>>>>> 	pm_runtime_set_active()
>>>>> 	pm_runtime_no_callbacks()
>>>>> 	devm_pm_runtime_enable()
>>>>>
>>>>> Just out of curiosity, could you try with those lines added
>>>>> just before these assignments in k1_pcie_probe()?
>>>>>
>>>>> 	k1->pci.dev = dev;
>>>>> 	k1->pci.ops = &k1_pcie_ops;
>>>>> 	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>>>>
>>>>> I doubt it will fix what you're seeing, but at the moment I'm
>>>>> working on something else.
>>>>
>>>> Unfortunately there is no difference with the runtime PM hierarchy
>>>> additions.
>>>>
>>>
>>> These are not supposed to fix the issues you were facing. I discussed with Alex
>>> offline and figured out that L1 works fine on his BPI-F3 board with a NVMe SSD.
>>>
>>> And I believe, Aurelien is also using that same board, but with different
>>> SSDs. But what is puzzling me is, L1 is breaking Aurelien's setup with 3 SSDs
>>> from different vendors. It apparently works fine on Alex's setup. So it somehow
>>> confirms that Root Port supports and behaves correctly with L1. But at the same
>>> time, I cannot just say without evidence that L1 is broken on all these SSDs
>>> that you and Aurelien tested with.

Aurelien, can you please confirm that your reports are with the BPI-F3
board?  I believe you identified the three SSDs that were failing.  I
am considering buying one of those models to see if I can reproduce
the problem and troubleshoot it.

>> It could be that we have different revision of the BPI-F3 board, it's
>> not impossible that I got an early-ish version. That said I just
>> visually checked the PCB against the schematics, and the devices on the
>> CLKREQN line appear to be installed.
>>
> 
> CLKREQ# is only needed for L1 PM Substates (L1.1 and L1.2). In other ASPM states
> (L0s and L1), REFCLK is supposed to be ON. So those don't need CLKREQ# assertion
> by the endpoint.
> 
> The L1 issue you are facing could be due to the board routing issue also. I'm
> just speculating here.
> 
>> If someone has contacts to check what changes have been done between the
>> different board revision, that could help. Or same if there are
>> different revisions of the SpacemiT K1 chip.
>>
> 
> I hope Alex can get this information.

I have sent a message to SpacemiT to explain that these issues are
being reported, and asking for any useful information about the
BPI-F3 (including whether there are different versions, or different
versions of firmware, and how someone can identify what they have).

Thanks.

					-Alex

> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
