Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E582ECCFA03
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtP3Pu5NTkFUhLopFQ3I9VH8UnOja1F+i3HDlKe/NyY=; b=acjlebXrlRjpR7o5r6bn0YdM+p
	yYl3AJJwYbHqAMJH/wiHhikaUnyNInfOsP+kAG7Zf4or01bML8OBdt7M6P1woMd/1jEbLjU/6ssTn
	Smg7Z3a62KVYAegI96/YU2cKf/71ld1wYYjPMkLxeR8g56eVUkz6bizdZvCiJPlddEauYHx7m8ncu
	zngFMNT8NYHbrFA+vDHxAYI60cK/YCYixQpbLlxKApRSyO8L0y4esm93sSJuErptHu3lG+coLKrRi
	CDn3inUADRD0nU3HTU8QpmDhJ/1ePXG2fdXFhD6M0KX798LACzVqaWYWY1b8/Gsv+ErXSNXfiVgVF
	kaNkDjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxm3-0000000AJXW-2D9A;
	Mon, 03 Nov 2025 16:51:19 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxlx-0000000AJWc-4C6K
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 16:51:18 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso467092239f.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Nov 2025 08:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762188673; x=1762793473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZYP6s7A0e6t6qMHErZJUr+ea4gjElbTNwHT5ZSG9V0=;
        b=zS6538rTH2ftCtGZrFUvIwOMPrZJLUdGwhtDgrNXZk4L4xeGOtruGD5nf+vUVCfubI
         7F8X988bseYKhnc/ILUZRJNxqaDdOZ7Y71M7jg8i8c0E5P1r5XPk3qdowYJW9/dhhbDw
         FIfp9Fs+qE9vcbLFjlYPGq8/3g6MbMQF0PHYI/UCdCHynNqIrBRm2AOyn/o4CRPIFQYN
         Hcz8Q5wUYvAa/bJS01q8VJzD0uahbtqZ3Agn2H1IqjJW5cBujttMEFImbjzE4+Eaa3oK
         BzNH8l6RsWq8vV1QuZQsdZGX4kSyUI1d/syV7cxtOpiQawj3u9nFFKuzb3nRJkQskA6+
         u9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762188673; x=1762793473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZYP6s7A0e6t6qMHErZJUr+ea4gjElbTNwHT5ZSG9V0=;
        b=EyyCUwM0j/8dSvnR4r8txAK6zuk4A/tcgr18F7l7zfEKZ+OJFlhE6dUlyx/Dm+mwuX
         ws64YWIFHDlUPCpq8a6lOUu34/PLd4RsdKO4usQHIICCh5cl6Wy63t7GIGfbCxYP/9kr
         z0IHpaCT1zkBvgoax9tZ4oR8GiUuYUYWoFl5XP443Ugnes7/6wxG3yb7dF/MFLiW+DkR
         ja47tO6i7rKdt6d0qzumDWk2d0kLLgKPxalCgbG8f9041UEKs+AWXVvEqen7k0f0MTxJ
         WQBsF0yEiAtsSj4FzCIiBGp+f7X0hDNAX3qJJGCwuPyz8hN8qGw6EKy+NJ+awuMflT57
         WM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBW4ewPQ7pCB3mIRYqwW1OLdqhIHl1jjdaFK2+JCVC5OXv1y9Tbw2gaMKu6yG3VcNqjgsLik75GFp6SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySQi7OB6yKRrAxLOV5wLdlaEdbJXDdrxcwEDlWnjokaCkyEY4I
	tTpFHI3a6PWBfKcMoWxPzNIAlQebgAvcKT4BrnGy2BkbN1rrFOqZNva5oEvjYJ89jHk=
X-Gm-Gg: ASbGncsJXk3iCob1Ngjzlv1Ma5PNtoC1arrXcfurri7rsBHSBnzLBNHmsJ2CCfdyHSf
	dUmQq+owdCXmVeZWRwY08nHcK0JR29oMb/vOJylKuWz0Sxg1XhBAVowKbRGibkZIMNkr4TSNejd
	qC07tUGQg8ni9mG18GxhYLuKEhV3C1+kLIqq8RUB8979hvtRz6YxwtySbENZTRWN2MEzgTH/Nsi
	cCHyuaBknvmiDjYzh8r2bK5ULqtO76WxoVU6AGuqlPmivb0CEeI/+fFzOprIlnoq6qMgCPu3rkJ
	fLpiuAypmGwXdUfixdJ4HRTrZQQhfmJYONWSMuZns2ylroWtDJn35ZkC/Tg9a7lIF7gjYXU10WS
	5Mt74i3urH0mM4Q7il7eXk7TuCZDBJD97hG2goBfjXycpd8KGzl5kdwHFWnWZNkIoW48hbtmHKv
	pXG96mchn7ghR2AEr5phGZy1FgOlIMMVTwgbkeXfWwgbshnLiYEL4=
X-Google-Smtp-Source: AGHT+IG3IvG/mEvLf0CP6EjG0xRAhCkqKP6lfBEvoWKsucXyQJGlFuxO7exsoiSwRmrN+GNPUYV9uA==
X-Received: by 2002:a05:6e02:174b:b0:433:2d6a:ec2b with SMTP id e9e14a558f8ab-4332d6b190fmr50614775ab.24.1762188673045;
        Mon, 03 Nov 2025 08:51:13 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7226ba48dsm324005173.49.2025.11.03.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:51:12 -0800 (PST)
Message-ID: <6872beb1-f27f-48b9-a756-5b7faa380cec@riscstar.com>
Date: Mon, 3 Nov 2025 10:51:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org, johannes@erdfelt.com,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-6-elder@riscstar.com> <aQU4rGzrB1-Vu7C6@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aQU4rGzrB1-Vu7C6@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085114_059986_4115238D 
X-CRM114-Status: GOOD (  21.87  )
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

On 10/31/25 5:31 PM, Aurelien Jarno wrote:
> Hi Alex,
> 
> On 2025-10-30 17:02, Alex Elder wrote:
>> +/* Disable ASPM L1 for now, until reported errors can be reproduced */
> 
> Thanks for adding this function.
> 
>> +static void k1_pcie_post_init(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	u8 offset;
>> +	u32 val;
>> +
>> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +
>> +	/* Turn off ASPM L1 for the link */
>> +	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
> 
> Why not using dw_pcie_readl_dbi() instead?
> 
>> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
>> +	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
> 
> And here dw_pcie_writel_dbi()?
> 
>> +
>> +	dw_pcie_dbi_ro_wr_dis(pci);
>> +}
>> +
>> +static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +
>> +	/* Assert fundamental reset (drive PERST# low) */
>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			PCIE_RC_PERST);
>> +
>> +	phy_exit(k1->phy);
>> +
>> +	k1_pcie_disable_resources(k1);
>> +}
>> +
>> +static const struct dw_pcie_host_ops k1_pcie_host_ops = {
>> +	.init		= k1_pcie_init,
>> +	.post_init	= k1_pcie_post_init,
> 
> Unfortunately, while I can see the effect of the change with for
> instance lspci -vvv, this happens way too late in the device scan
> process, i.e. after pcie_aspm_override_default_link_state() and causes
> L1 to still be enabled.

OK thanks for this information.  I am going to contact you
privately to get more information on your errors (and those
Johannes is reporting) so that I can try to resolve them
before I post the next version of this patch series.

					-Alex

> 
> I have tried to move it earlier, in k1_pcie_init() after writing the
> vendor and device IDs. This works as long as "nvme scan" is run in
> U-Boot. But if I don't run this command, it seems that the change is
> ignored or lost (i.e. I can still see L1 enabled with lspci -vvv).
> 
> Moving it at the end of k1_pcie_init() works fine, like moving it at the
> beginning of k1_pcie_start_link(). But my knowledge is too limited to
> know where is the correct place.
> 
> Regards
> Aurelien
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
