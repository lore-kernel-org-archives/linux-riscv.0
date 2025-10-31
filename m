Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D4CCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6LKMhPwsG2Gv3rFtSae/qvniLf0x8ioEigZN6bOivE=; b=1n+uBtpxYFMTqY
	rqzlQfwEe+tmWU6D4TEC5wqxZtfRHb3VD3M0ZYFGFrM/kXzyhwnuyrtQvUUtszstHHNgORBMZ+y0/
	jWb/x7NK6y1APANpsNZngfXVmdceht2FdyymeXV523g/L1K5da+AL9P1YMhzGeADazFNTOTC5+6fc
	ZEIvZVH37LgwvItBmukUCoVGPOSgeTgXQ7k83jwbgjMTtUdIr6xFpBn9I3REXoQ1nvN9l7A/iO8wF
	a2SnpNcVk5OjoCVBrPbTh8uQroi3QOT12cJSo/y8e3Ort4Xlv/KGigu79yR7KG2khGfkmFxjj/2dy
	o7Dczfzjk2bx93L73V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdkh-00000005DSZ-04gg;
	Fri, 31 Oct 2025 01:16:27 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdkc-00000005DSB-18kt
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 01:16:24 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-92790f12293so74297839f.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 18:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761873381; x=1762478181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNmWvB1sse+ll8fu7wLpbE6Pu2iBxbQUEY600bj95+Y=;
        b=I4taMT85ero3bAiqtsGqCkskVJ9wNm45CmOi4ZoBPiGIh6f2skDvdUGn5RZh2t0s0N
         RHLKEldy/K0EMqMxRaeKyaIa4HPuws6kBUInVvKTrgWdvtVvSXjxiX2bl4Jq0mzDiYWk
         5O7AhmIov2e23wM3Mk1PDybuvczq5zXokuLbJrekUTfzVJ8zQCPfimGZFsLZSSX3LWBs
         eIhmlIjc7mVeiHbkYdi+HlTxX7lQL9EcjfWy2RHAJy+3giazeqgtyg+A8mX1GhmZfIlj
         AQ19g9EE3JKSc903NC/665cmOI89FOf5BiUvYHLm0R+7hZ4sX1yjJbJUOgfKVD/CLbIi
         h6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873381; x=1762478181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNmWvB1sse+ll8fu7wLpbE6Pu2iBxbQUEY600bj95+Y=;
        b=E+VJVqj2ksXpP8iABVLGhOuUIzRHbSyxm3INpR5u5xSKEeyEciBlEXsSncRZV0D4wp
         /LvZocVNXXF9hD2Fs437BAZBd/TV5OhcZ9E+b+rp5jm5YRoCW8ejZZUtxyO7q7hNsz6X
         Kex/PFCRnK+70UJ//nj4Jjezoc8yZwnJObBU35MXyXCp+S+ksmBGWcY6SLJhXj+4H7aE
         WIzDbPonERFzBaC5X3oe0PIbGNfWfTS30mRKrAlXxLJ1yKmpSAaRoniVvxc5MVHcVWvM
         nJo8YXIi/jWb5S9F0ShjCC+CvaArQjTDf/Qn+AFWKfoVNOYNPIDxc/S0hKt2qfwg1iPQ
         Mb9w==
X-Forwarded-Encrypted: i=1; AJvYcCWoHxKNyutkezl2Bwak5QLBkTk37EFxahEPkixQKhA5bpb1ecavSFUs74nOPsFroG5CXRCWRNXQx4Pa3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUXdPvJiYqxTnpJch/3/pQqhSmU7wGaVqkagR3rNPKBs+f2rsE
	AK9p1WKVjYLGKd3heVkFPlUOWwtI+6SV+1HC4bLuSKUzanS8LsAtWKtHE/O95MhiWLk=
X-Gm-Gg: ASbGncvO2ekdM3LJFAq+r5LZDndetXgcgfJ5RVn29iRVn77f/OGAliAMAkYBDeUkdsE
	W3kBCy66FsbKv6nTPqSYXNjt6P572mIH7+r2cj0t1Ur1Qw98szj7+SiYKyhf7334y4QX47+oVQV
	o78uRUzhXUqUrxU1FpT0hQwOgC1Qf0rx7rWcqd4E39sVAF0T9nbBST438FKGRdOR8mV599PLZ0N
	dowu3F8wsKU6yUKKxErcyfnsf87PjiFyoeZCJ9Uf/DuBwdSgYyAghuYgOXPUI5NAKbGwNDtnRy4
	7emkUsMJnrwybKLYg1iAYZsoV44UnVnNi+x20CGgJuQg4C4FqX8suXXeXcTCCttcpzeerZE4sWJ
	TMmRA/VBJI4nngpnioZKkTtq/5nOAyKz35Skt8tslNefx6sPOcOWkviXyQ+H2l3c2YjAPwLOabj
	+gQ+h5s/SELLosqlLcQedwGpPmybqyYe7F3o7+KeS9
X-Google-Smtp-Source: AGHT+IF4xxWwH/4LfxxdEtp/ZJLyhKDeHy5QKQAhJFjWBy4txu4y5k6mqZ7NiiibuaIjhND7W09bcg==
X-Received: by 2002:a05:6602:2c01:b0:940:d7cb:139a with SMTP id ca18e2360f4ac-948228fff16mr371985839f.7.1761873380679;
        Thu, 30 Oct 2025 18:16:20 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b6a5a981f5sm144822173.46.2025.10.30.18.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:16:20 -0700 (PDT)
Message-ID: <f1bec6f4-bf44-4cbf-a676-fa81d81531d4@riscstar.com>
Date: Thu, 30 Oct 2025 20:16:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org, aurelien@aurel32.net,
 johannes@erdfelt.com, p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030230801.GA1660222@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251030230801.GA1660222@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_181623_149538_C52CB5E6 
X-CRM114-Status: GOOD (  20.16  )
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

On 10/30/25 6:08 PM, Bjorn Helgaas wrote:
> In subject, capitalize "introduce" to match history.  Or you could
> just use "Add ...", which has the advantage of being shorter.

OK.  I'll capitalize all of them in this series.

> On Thu, Oct 30, 2025 at 05:02:56PM -0500, Alex Elder wrote:
>> Introduce a driver for the PCIe host controller found in the SpacemiT
>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>> The driver supports three PCIe ports that operate at PCIe gen2 transfer
>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>> configured for use for USB 3 instead.
>> ...
> 
> I guess this doesn't support INTx interrupts at all?

It can, but I removed that support first to simplify the task
of converting the original code, and second because I had no way
to test it.  I planned for it to be added at a future date.

>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -509,6 +509,17 @@ config PCI_KEYSTONE_EP
>>   	  on DesignWare hardware and therefore the driver re-uses the
>>   	  DesignWare core functions to implement the driver.
>>   
>> +config PCIE_SPACEMIT_K1
>> +	tristate "SpacemiT K1 PCIe controller (host mode)"
> 
> Move this to keep the menu items alphabetized by vendor.

OK.  I was going by Kconfig option name, but now I see
what you mean.

I'll put it between PCIE_SOPHGO_DW and PCIE_SPEAR13XX.

>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on PCI && OF && HAS_IOMEM
> 
> I don't think you need PCI or OF.

You're right.  PCI for sure, but it doesn't look like I make
an direct OF calls either.  I'll drop them both.

>> +	select PCIE_DW_HOST
>> +	select PCI_PWRCTRL_SLOT
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enables support for the PCIe controller in the K1 SoC operating
>> +	  in host mode.
> 
> Most help text includes both the vendor and the product line names.
I guess I didn't include "SpacemiT".  I'll add that, and will try
to come up with a few more words in the description.

Thanks for your quick response.

					-Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
