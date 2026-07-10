Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7309C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 01:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmFhPqNPzXdmlu7Hzz+gLsyV4+ibXM3F81n+MFTe7/o=; b=I+Oj1b6N0qSC6I
	p4cCRIXvDX6XjaBj/sq3DEEmWnqlWLG+yfX6nBFw4OIMBD2SACJFriJGFmI3pucjnWuqiW8SyXB/V
	WVMplqgfl2imWdYRS00vV5/K+LRsIRYHv4Z0iLrg1wDBWnfpWXHH9arpW9yQ7E/LY6befSdemADwj
	Ov4q6OR32zmop82KSVXwpZE0J5en8n3dJw5/u+/SfQdUTToWjlolB0qtPXTUYjJOUeS5q6TkALqXP
	VCIh7cwBholPjr8D/g7gaKEJY/ty9uBWJ+97e7HfcZgOkNOlAysX4NwgjOvDhQdlDJoWuYPn3swDD
	ELsLfcMyszjFZS+lcucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0Uw-00000003vuT-0tQU;
	Fri, 10 Jul 2026 01:57:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0Ut-00000003vu8-23bS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 01:57:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cae1a3a744so2552345ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783648666; x=1784253466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNnnvPqeszB5BO6wBdcbAXNtS5SR1xypVlNj/wphgrw=;
        b=D3JbhRXEXgO/Jpovmlp0elrIkHBrph+2unnfErudbpr6rBzybPl6+VJ3fhzf4nd/Vs
         gKydiS6akAPgGrTvLZb/rE0/DLb8PFgh5/W1OY3k9apIxVV8F9f5S2zRCWZT2AIcx9v3
         aUZ6fuFlmzEg8+2nqvj9xHG4IK2IZ4oihoN+D+Atrx0im/NaUy3B7tZ2JZPFpFuOse8a
         dKBbnUyg0NbGAD5xV34LYp4FxDqPADNBeOoh9C4j8PNNDLjeZXxojquIyopGGE5nSuSL
         7UDtxl2p9bLjqp+Iol8sPUxDX9jfDH2WQoUDRpNuncGnSIIbQTKM+n5q21Jx4EsSUdPl
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783648666; x=1784253466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNnnvPqeszB5BO6wBdcbAXNtS5SR1xypVlNj/wphgrw=;
        b=bFNp7kQWqryBClED03EeQH40F295aMIXTQirmjnniXkkGs2Fp9obqw6Vz4PgHc0HtW
         KamNAU7tYChHzzylvIuUVOuI3QZHGMLXC2/8uI5R4zaFWyexkDKvLFqbuXCN6vDn6qei
         cMLLKlagyhfK2wV7N/Kb4L5iF2hgLv7WEMEzkiq1Fla0TY0DvtyA+SlO0mzJ7cRN6ipp
         X2wButkWZ0tjHe63DP6sskRz0I3yT9dZYp/uHPYMDQWf1i71rcl1sGCa9dQ08jlUIGbn
         nm5TqFypnl4z0brFdp+2G3AA2DQqt5Dcfv5lKVo1Z5cOISM0vgK+qLnsXhjtBePgy6Qi
         L6SA==
X-Forwarded-Encrypted: i=1; AHgh+RoRQSVn5YX+aKDTOpgbAzGMTVfRx5CXbIVsIqdoR5I1s8DOUZYVMkGj4/I850SyhAsdtEB0UnDT5mpNuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgygAy2cT+BPdXDc+WVyROD8GE4tbdACP56Vw879bjQndLnRng
	TFzwlCl+TS85797sW7DLvbKYQlpGvVh52lveH7+j1DOfWhpoLacCUKV5
X-Gm-Gg: AfdE7ckHq4waJ3sQsoczt5wXA7fyGDAPyz3Yf6iOMQL0isPFPpktYZreBMWrf5wlPA4
	NoLuxUqEUNYGPuPkOPPdEo0jdB7jpmoO3P1zr9klT9bSLywUE0dqoWnFsg4r6skhrvB6LDMyC9g
	Eyy+EHsBiPJkDowc6J6vLX0hdFAaaGyHWc1yNRhvPKPSrCCpVyZeXwVtaP0bNhLA0KxfSs2Ga4u
	Lcn3biyt6NKz49GA5EtP2fW9xXr9YUaAy5qAlm6MJrqJWMmawiSWlk3Gd4n0MFU6K+NOZ52QmlQ
	IJvd5hWGMUjoMeePLGAClr/as+/eXXgI5aFn8q1Cd92hQgmHBba4jJ6K/NvkaId+/P4glyGkZ3d
	gwap6y55Sa5D8B2hSwYSrfGH0MDLrUJTy57Ll/qk0BFNPd1MMTduBgEsnXICScHMQ
X-Received: by 2002:a05:6a20:1587:b0:3c0:b3f7:e5e9 with SMTP id adf61e73a8af0-3c0bc8c42f4mr11229276637.15.1783648666263;
        Thu, 09 Jul 2026 18:57:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311b00048a3sm5608901eec.5.2026.07.09.18.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:57:45 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:57:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alBNXgMAwXPKwiJ2@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak9KzNFF26B0Kttz@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_185747_535152_7E4389E4 
X-CRM114-Status: GOOD (  34.06  )
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

On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not support by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> >  struct k1_pcie {
> >  	struct dw_pcie pci;
> >  	const struct k1_pcie_device_data *data;
> > -	struct phy *phy;
> > +	struct phy **phy;
> 
> Should it be annotated by __counted_by_ptr() ?
> 

Yes, I think it can, this is something I have missed.

> > +	unsigned int phy_count;
> 
> Ah, you allocate much more memory than possible PHYs... Can you redesign and
> use the above annotation?
> 

IIRC use the annotation does not reduce this memory usage...


> >  	void __iomem *link;
> >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> >  	u32 pmu_off;
> 
> >  }
> 
> ...
> 
> > +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> > +{
> > +	const struct k1_pcie_device_data *data = k1->data;
> > +	struct device *dev = k1->pci.dev;
> > +	unsigned int i;
> > +
> > +	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
> > +				     sizeof(*k1->phy), GFP_KERNEL);
> > +	if (!k1->phy)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < data->max_phy_count; i++) {
> > +		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
> 
> > +		if (IS_ERR(k1->phy[i])) {
> > +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> > +				break;
> > +
> > +			return PTR_ERR(k1->phy[i]);
> > +		}
> 
> 		if (PTR_ERR(k1->phy[i]) == -ENODEV)
> 			break;
> 		if (IS_ERR(k1->phy[i]))
> 			return PTR_ERR(k1->phy[i]);
> 

Yeah, this is more clear. Thanks.

> 
> > +	}
> 
> > +	k1->phy_count = i;
> > +	if (k1->phy_count == 0)
> > +		return -EINVAL;
> > +
> > +	return 0;
> 
> This doesn't seem correct to me, I would expect phy_count to be assigned only
> when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> different 0 in this case.)
> 

I guess you think 0 is a valid number? I can not understand what you thing
Assign this to 0 if there is no phy is fine to me, which shows there is 0
vaild phy found.

> See also above. Do we have some PHY API that just counts provided PHYs?
> If not, that what you should probably add first, before this patch.
> 

I have not found any api for this. But the actual problem is, how the api
is designed. I have checked both the array bulk api for reset and clock,
it seems like it is much more than this patch...

> > +}
> > +
> > +static int k1_pcie_enable_phy(struct k1_pcie *k1)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < k1->phy_count; i++) {
> > +		ret = phy_init(k1->phy[i]);
> > +		if (ret)
> > +			goto err_phy;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_phy:
> > +	while (i--)
> > +		phy_exit(k1->phy[i]);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > static void k1_pcie_deinit(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct k1_pcie *k1 = to_k1_pcie(pci);
> 
> > +	int i;
> >  
> >  	/* Assert fundamental reset (drive PERST# low) */
> >  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> >  			PCIE_RC_PERST);
> >  
> > -	phy_exit(k1->phy);
> 
> > +	for (i = 0; i < k1->phy_count; i++)
> 
> 	for (unsigned int i = 0; i < k1->phy_count; i++)
> 

I agree with the unsigned int, but I guess this definition is not
allowed in linux.

> > +		phy_exit(k1->phy[i]);
> >  
> >  	k1_pcie_disable_resources(k1);
> >  }
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
