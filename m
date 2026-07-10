Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FD7C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5CZLULLNIH6hdcGUIMuEguU2z/X9RxYBPlRQSCFFZo=; b=LC+fXb2iBilo+C
	7qHzUVNVM33qaxnNzdT+mTTeVSuB6b6F5Ma4iILswNyoaYXwTKSh+WRuQb1SBzR+R24Pt54PPsbr3
	cBMPNAB4HXZeuBwAmb/PbzLA/1dxYyZFAo5mQk1xFf6ItyST00lU91cetLqCd2Qf1kGRW5uuDiQXH
	cMeg9nb0g86WLlCyu5QgY7AsgYChFzn/RsYGC87cpQYaqTlxXNcoDlyBJ2BeBfVvxxMF0R25hdfwq
	dO8MJA8qOvnjkJJrfh11U2vSSK4/c6L7cYbHWBL1G3WvU/JLwCiAMf//+etwKOzO7UmKzoK1U1SmD
	F9KMBQ/S5bRKqBhkM3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAhD-00000004wz1-3uAu;
	Fri, 10 Jul 2026 12:51:11 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAhB-00000004wxr-2WRd
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 12:51:10 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so4732496d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783687868; x=1784292668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RI31gw/Ag7VVxVHoPD2L4lb5ga+FSsjQx8Z6xYz3UlU=;
        b=n6t8YdB7wj1DUdhGFd/ZdcaCFuxxJtbB+obx16IfKqNXKx0Rg22ASirzDBPAJhGfeT
         JO9p6izQi8qvR3+l+SEGPF4pzux1WpHL5cr81pzwWE7R5w7/BGI1CVLSA8/UhyGgJM9b
         VL4AdBP8/BUvGLS1n1Q4xf1F9QzsOQxT/xDkmIYv7KPtUl4VPyUFRUu4H/l5Oa6m10CI
         MzQskTulE44GdWt4bU7ED7n1h1eqbWzOVTs/ih3OIML/6Y/G5k1VJajijK6Xubrot91C
         Cigh7PB9hTDR5gXLJ4HrRm4c8P4F6V3MJR6bQtD9ULGY94lJ74w8/fpmeta5gOQJswp7
         psLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687868; x=1784292668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RI31gw/Ag7VVxVHoPD2L4lb5ga+FSsjQx8Z6xYz3UlU=;
        b=bWosL8PNTYhtDrnPnhyhXsDuBafOku4lNj48OethkuXM0gwYvBNBwjtZdn+wm517GP
         PWuT9AYL4aob7lmngf5HJR6VwACPLYgj891wfZO7bOm+QvsrG10PPcSOfD8gkWTbvST4
         6y9WLhcYB7AtJGzDFSkJICB8PsZcGBP2CXrh2hHzQb032du1Wwa1p8IMB+yY81ZaAuPL
         gPFwzLi3SEDawhff3H/Q5WI9TMpJ7w71ZFtmrheC8mROrGwL1W7ITaGTP1sYqLJ3jbE5
         OTqkVhDRQJfGuGfEJpmKok4isWgSIOGxuDK1KkLI/MLOGOYEFGRFMoN8UB2k7uiQbdRD
         UYZA==
X-Forwarded-Encrypted: i=1; AHgh+RrItnvQbzlrsb5JsajXTuABfBUMLEuTOXj0MF268VP8V8XNXWjHOKXrrLbHQYEQSB2pugbKD3XGg9xinw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4PYTZkwKYmAd/AxvpzT4RQJXHOSVaVP3yECksMmJWqfKGnjsP
	IZjf57amTb6ICWu29l/FG61XRsHaGiuv0Jt0fNGcjQ5aP+PzxxpLKZ1GR1ayaOZBK7o=
X-Gm-Gg: AfdE7cnOtDeVSj1YQXSRkVL7fkIK4TRtDdMcw1oGbnggHfDwhCJ9IipAG5fUTMbVg2Z
	OKe6uJbAKn6udneDRnmwknethrgp7dfUm+h/2MbMhICpt8Sx0H96w40Rv8M7FNOUcGNJNHqrZYg
	mANL/iOD82n9FpCqoLIHWxeloD840M6mZdxFjk4fOJQ/+aLk6S6NVpoQxL/Rjr12pl/ZhCfP4vs
	crpRw1xmP4NuTxmqO3pp11pXLzYwvqTJRSvqJ2HjZE58TZUPnrL0kbua6RL9IDziJmcp1XW+5B2
	ezRMYQNzhj0sqniFWrCPSOm4xNepXaOyw+JmAZ9j+NFA4peJ1rXDX+NGMruPFIYrb8VuF2r/yrE
	FXi+3xjZF/ddsCSDSsgK/H16M2h8w8dAxr4TwJ3GesSZGflTdFD1tXHF6482PXgxw5iYo9ebl7J
	MDxoiIprtXY6ZP
X-Received: by 2002:a05:6214:2487:b0:8ce:aace:eaf7 with SMTP id 6a1803df08f44-8fec246fde7mr144215156d6.39.1783687868337;
        Fri, 10 Jul 2026 05:51:08 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm40299876d6.35.2026.07.10.05.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:51:07 -0700 (PDT)
Message-ID: <9de024d9-c7a8-4291-a79d-83acc77b261d@riscstar.com>
Date: Fri, 10 Jul 2026 07:51:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ak9KzNFF26B0Kttz@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_055109_650975_95780C1B 
X-CRM114-Status: GOOD (  10.71  )
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

On 7/9/26 2:16 AM, Andy Shevchenko wrote:
>> +		if (IS_ERR(k1->phy[i])) {
>> +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
>> +				break;
>> +
>> +			return PTR_ERR(k1->phy[i]);
>> +		}
> 		if (PTR_ERR(k1->phy[i]) == -ENODEV)
> 			break;
> 		if (IS_ERR(k1->phy[i]))
> 			return PTR_ERR(k1->phy[i]);

I'm not sure this is a huge improvement.  Checking IS_ERR()
before using PTR_ERR() is comforting (a little along the
lines of the other issue you mentioned--assigning a result
before checking for an error).  Anyway, it's a little bit
of an ugly construct no matter how you do it.  Here's another
possible way to do it.

	k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
	if (!IS_ERR(k1->phy[i]))
		continue;

	ret = PTR_ERR(k1->phy[i]);
	if (ret == -ENODEV)
		break;

	return ret;

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
