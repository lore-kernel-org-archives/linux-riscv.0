Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620F7C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbO6sflXtZdMXikq4TfuXSdlZbbSCQrKBlZ7zK6Oa2Y=; b=28zoBAU8Xw18Gt
	RUp1xb437F22oLsm2euS/ctkEpuxOGPnUvuf/zObsa22sYSeAYCpnLkIhdz6QgCsV/a2persdVcbN
	qE5rWmwZlozdYsuY9+yyZ5h01t8nX1lY+LSthMGF4uD7VPnNpLBk8oxU3K0gvD3r8tOWrbpxyNYTH
	msmRa7w1Nk2mfE3plfbZXgBiN6lhj18g2TrOVxmVGBymFrImQbbPyCakT47OVx27KjneLwfoDT4qr
	K2YyNY8EKx8VmEJltwW8Ob7DgetB7hEn0+MAxc7GpQc8iEYipn1gTGQgXrVD7s9nmeHYDTD7DKkSa
	YzLco3WVE39DKTPrJCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVGd-00000009KTu-09Nq;
	Wed, 26 Mar 2025 18:14:19 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVGa-00000009KTG-19YB
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 18:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IwGQlTa50b11s0/QB0TMViZRNAPGc3dv8qv0hUaDBFw=; b=XWdheIXYnr/QruXm3c4EN6hiz0
	RmY829zjrqRP/rERC2OME6bZbau2rh+ICaEniwmsUTscf21co+WGCbPYEXfAF+3/yxxnGO//jhifx
	O+XyHJm8TDTWw3/6Mrhl8OJSUW9dFoZmns/OsCclrgaIrz+t7Ug27KmXq7bttBuni/zq/TbqWeCVB
	C5EwqKbUBGGIAGt1pqdj5Ibwbjgv+3609tuqoxRpuU2MEz3jwjh/ZD3TlMmtUcFFBIOt+oS3zvcL3
	bBr43rsJo3z4g+64lm5Zcu+ryRO1bRFh/idEd9IVFYRscEVn4r8uo8LN11oah3aPyW7U1ljL/qN7a
	1b7NCJnQ==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1txVFh-003lrg-Lc; Wed, 26 Mar 2025 18:13:22 +0000
Message-ID: <f38e690b-2eaa-461c-87e6-72927a02bc9e@codethink.co.uk>
Date: Wed, 26 Mar 2025 18:13:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
To: Conor Dooley <conor@kernel.org>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
 "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel <anup@brainfault.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
 <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com>
 <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
 <20250326-headpiece-muskiness-dc167183018e@spud>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20250326-headpiece-muskiness-dc167183018e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_111416_399849_A349B20A 
X-CRM114-Status: GOOD (  15.86  )
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

On 26/03/2025 17:55, Conor Dooley wrote:
> On Wed, Mar 26, 2025 at 02:20:55PM +0000, Pinkesh Vaghela wrote:
>> On Tue, Mar 25, 2025 at 7:06 PM, Emil Renner Berthing wrote:
>>> Pinkesh Vaghela wrote:
>>>> +     soc {
>>>> +             compatible = "simple-bus";
>>>> +             ranges;
>>>> +             interrupt-parent = <&plic>;
>>>> +             #address-cells = <2>;
>>>> +             #size-cells = <2>;
>>>
>>> Hi Pinkesh,
>>>
>>> Thank your for the patches!
>>>
>>> Should this not be marked dma-noncoherent to avoid having to mark each
>>> peripheral as such?
>>
>> Thanks for your feedback.
>>
>> We have not added "dma-noncoherent" because there are no DMA-capable
>> peripherals in the devicetree yet.
>> We planned to add this later when we add any DMA capable devices
>> i.e. sdhci, gmac, sata, pcie, spi.
>>
>> Do you recommend to add this property in current version?
> 
> If the bus is not cache coherent, then it should be marked as such now.

If it was like any other P550, then the DMA has to go via the cache 
coherent part of the interconnect which is a different address space
that maps into the same bus the P550 and cache controllers are on.

You just need to add the right node to map the DMA addresses and then
have the pain of what happens when there's no memory in the 32bit
address space.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
