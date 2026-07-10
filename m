Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F992C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRDQSI94B6eQCYtYrw9KIZflcZjsZfetJ7z9JDJEqiA=; b=sS5/d21wDZ00TC
	J7YP8mvPY0bSG3Duhk4xE8Q67sO1KkxnlJt+PGlLORTjqmqGam+tZU2WpZpyUb/Lpt30hDZbHAmxp
	BPrafpoQQ2spHCPB9w8qSohnR41kSZmD289Ez8Dz3SePNxwj1idGhOcU3PPcEYZMsJuz8D0Z/FwqX
	yOB49DyY+/pmQj/UWOjEKtTZkLXbt84pQ9bxcMFgzrh+GNR74mOcZ4E5Na1S6ih8cRCN0pq1Oiu3x
	O5EuFOWoaimwQmAkarPDvZsBC9mEl0cFe5/3ZwKXNctOIp8FDKQIIk5O4rYzSiHBW9vgqqPJ/iCzi
	HI2Bs/fcY0kt8yTG4yBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8tf-00000004l97-2mG7;
	Fri, 10 Jul 2026 10:55:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8td-00000004l8Z-1HYr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 10:55:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84864086bfeso672046b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680952; x=1784285752; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYS+VjE3ZeLF6fGUZwF6+bVV7JweMtmHNhPsPcBJC0k=;
        b=XV0gxsL2nSTPiDqnm8l6Get8mcsuCJBR+HAT7CrwX1prLp7gJjZRIIPJJIgfJ9eLFl
         DXHMcNRATvC2q6kan9Zv24ynisLZQv8WRUNjwE5EPJKjojNQtXPISrVAJeWDJOv/J5qG
         W+pr915rGQLxZGrMLkDa+vV308cXT1l+L9aukoAHRlmw3W0J1j4n6KvVz2k5tXncaiP+
         Fcl6k2sIpRqfTwy/2CEdYAalTf3pfOl8VIHwLSrooKfduUtoZ2NAIZVTfo6BWFsiQsGp
         SHOW25z/s03XCbmdvyw3iV2sk7B12zgiY5q2pnMGsaQ4qZxsBaEKYZY3Eubq4/QSazT0
         DhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680952; x=1784285752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYS+VjE3ZeLF6fGUZwF6+bVV7JweMtmHNhPsPcBJC0k=;
        b=OIeQJrZ+d39+OwYgqLtyMYxEHMUKDkNb+JYEPAjhKZb3zCQBbUpn7G660TnxkKp0mO
         BlyE6IlmMGUFXOvPgfjJyDEPhagmwoBiYIvlXxbtNkVrfBAZu/rzv92HD9bYfHfSfv66
         exslL0K6AVH65SnoUxnqLSKLyNwrhRDYSYGlUzmz7Egq2g0/TtTMnBiLvqY/v6zzozV9
         K1F4l98fEMnsnj18D0xGBWmJDq73b03NWOWANu3DCz7JyEx7gj2oLoL3lYd6/SHDmklt
         DITbi6/odfHoYrd4JRICHgW5d+3jpypiJD3NgSaSmK/M1qypNjF/l9x2K4LFZfjNhlHe
         m+Jg==
X-Forwarded-Encrypted: i=1; AHgh+Roex9XfMj9CPfwJ/WuVRxECM1ccCqojX5pq6C7DqttYp5LeNkwjoqiF2Zf9VE9I3TF+zCPCRSjxtXF19w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDqgOEtsUIzBqit1Qbsq5Mhco4FG8hRtqEoa59UtlBnTOGIFLE
	6rcVqLT/NRSAbXFwRi2F7G6bxzWQA7ZJaggRqo7fpW4zTThLd13jnq89
X-Gm-Gg: AfdE7cnMgiK302LT4fw0Fi9KEdbYdQbbierFK20IPK1gaVd+aB18j6zrPfOEZ6/YqTs
	CFbUTm6R8HCTMHv1Qk/P+TN9dKfxp0bCCgRGm55Ra5Zsx5AvXNp9t0cjgNBJXtiSZk9xQVub8jl
	STdzx4bu8J8i9gY4Y4+ElXpXDS1iO8ZF9W59mYuB5IeV0yz09fWdutA001YDVvdyoCjxpjmjXDj
	Hmcr8NqG0lzbbbeZYzxoOr0lnKpmxzCnRtth452J5xnTe7vT2TH73uts0NQqbDXTpzU7FnXPTN3
	AFmWZDjkmgyhHUGErjN9YnUOmrUeDGXq3X3tV/4JJdX70ZwBK464omRXmCxZy/Z+PwMItzmpL6x
	XY+j50j4yrenorejsiZXwINfLuAbhEGJJutf03JtWiNCtvHob+FGEkASqFvabfPSp
X-Received: by 2002:a05:6a00:288f:b0:845:4888:74c5 with SMTP id d2e1a72fcca58-84842eecdafmr10377896b3a.23.1783680952357;
        Fri, 10 Jul 2026 03:55:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4986672a12.5.2026.07.10.03.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:55:51 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:55:10 +0800
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
Message-ID: <alDNlfb0_T9g-ATO@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alCoTEDUY8AO9OzD@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_035553_347266_7381DF02 
X-CRM114-Status: GOOD (  40.45  )
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

On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > >  struct k1_pcie {
> > > >  	struct dw_pcie pci;
> > > >  	const struct k1_pcie_device_data *data;
> > > > -	struct phy *phy;
> > > > +	struct phy **phy;
> > > 
> > > Should it be annotated by __counted_by_ptr() ?
> > 
> > Yes, I think it can, this is something I have missed.
> > 
> > > > +	unsigned int phy_count;
> > > 
> > > Ah, you allocate much more memory than possible PHYs... Can you redesign and
> > > use the above annotation?
> > 
> > IIRC use the annotation does not reduce this memory usage...
> 
> It's about how you allocate it, the code uses max_phy_count instead of
> phy_count.
> 
> > > >  	void __iomem *link;
> > > >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > > >  	u32 pmu_off;
> > > 
> > > >  }
> 
> ...
> 
> > > > +	k1->phy_count = i;
> > > > +	if (k1->phy_count == 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	return 0;
> > > 
> > > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > > different 0 in this case.)
> > 
> > I guess you think 0 is a valid number? I can not understand what you thing
> > Assign this to 0 if there is no phy is fine to me, which shows there is 0
> > vaild phy found.
> 
> Isn't it already 0? Semantically code is wrong in a flow (not in the result).
> 

In fact it is already 0 here. But I am not understand why you thing is wrong.
Could you explain it in detail? (Maybe you think it is not good to return 
-EINVAL?)

> > > See also above. Do we have some PHY API that just counts provided PHYs?
> > > If not, that what you should probably add first, before this patch.
> > 
> > I have not found any api for this. But the actual problem is, how the api
> > is designed. I have checked both the array bulk api for reset and clock,
> > it seems like it is much more than this patch...
> 
> Yeah, I looked at the phy-core and I think it will be hard to implement.
> So, the idea is then is to reallocate the pointer each time you get a new PHY.
> In this case the phy_count will reflect the actual memory consumption by phy.
> 

Emmm, I think it is kind of buggy and not necessary. In most case
this array is not long actually, so allocate some pointer should be
fine and be an acceptable cost.

> ...
> 
> > > > +	for (i = 0; i < k1->phy_count; i++)
> > > 
> > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > 
> > 
> > I agree with the unsigned int, but I guess this definition is not
> > allowed in linux.
> 
> It's allowed and it's encouraged even by Linus. As long as iterator is local,
> use this syntax sugar and reduce its scope. It hardens the code.
> 

Could you give me a reference url to check, I have not found this
on the coding-style.
https://www.kernel.org/doc/html/latest/process/coding-style.html

> > > > +		phy_exit(k1->phy[i]);
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
