Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4335FF30946
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkfyAxgtPnNR1xaKIWUyv6Qc2RaU4HXg0eRdMsWLrzI=; b=b3NRdAYLHlA/on
	yA7PKL5Zy+XjK0NugKAYa2xEcIHKgJwH095+iNeA01rzLcQxBhJkLIOqQJaff16Mc1HK/ToIBOQNY
	+dm7D1ehPySPhVSjyaDg0ADTQvscWKXDuh9p9HhxNdAzW9h4fdjKeMNYKHUXhm1S1Qle2MzDIjrTb
	Tn3mfrv6m62pFjo03DfCFUnozDZDQhhW6oX3IXqW8ma2kiiKnpG6GbQYGzYFLHnRgsCN7P5+sCa/j
	SCnZHZQmf2fjQIyOqk0mXQoOYAx0X7M+puM1z6k+O22SPSYsiuQYZVoADLw0pERCD7RHpUqRtBxST
	9rHHz2PBZZXrDJM0Jtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8L0-00000001qBQ-1wwI;
	Thu, 05 Mar 2026 13:01:58 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Kx-00000001q9X-30B6
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:01:56 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aae146b604so60897015ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 05:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715715; x=1773320515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=VVYzGWXRbyc7Ol0bFmBDyYSEoMgdjSB03beQWij426xYFw+/H49dQlwulmbP6kHc32
         XickGZJlqwV1zbw9GjOHMIXN1G8T7yqlNLjIHX6CQ4lbEFWqZ3kMw2gcRq0Le/tIoVh3
         1NVhawbFs7FuQbLe6mzoHm1rJv7idkzK+VPTuI/Fu3S/iVYVDWPM80L/4uuDKROhdTgU
         iLzYxCD6xWsAwd76Hgh4eFM+i28Pba1DyRmgOJd8OlzbaKvBrB0SHOTCgZXqwHwYDejt
         TQ7ZiDlwbn5EhNgjOs/0GeUcmS9pnqnboBwUuW1uUImt7f+IdI3cVe0U4GPW28graaAm
         g7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXOeoxPEKFkxYsFbCFfAWJcD1qmi0aVQ+9/F7NTrNZUHPNUXccJkeXHXRQh3uPG7Y0RQAYnE6KV/qq+Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTtQ1Zuf9+3/CaNdnSfiCYFgqPA8yznP28IsAj10zRdg3wPb2p
	CZxsxYiP70Oa5UuTRoVCF+iSU5qH9KBYHE2BK5XzivBX/uRevyH1zc3A
X-Gm-Gg: ATEYQzzORkav20pMxHLwvh/uupdTmRfWvQ3eh8juyNDBB6tNlW79QEjZv8rVF9+ECal
	9A2XfL7wvHLVaLDsOlAbVtAv5SCl3PTB1Cb4Nwel2dAE3Aadi66OUeAXhTyaYHRY1+9iTQt75Pt
	r3XrHYRztbY7aDPaldavq8OP6dK80S0DnVGGqpJF+rXnU7oM0/XqkaObiZM/+QZ3qJg4QOcfq/W
	xY+s/I8eBqqOhOW3QKbuRtx09rTsIYp6ELfVah78QiiP+uO7nxJA6hJFS4a85J0w1LwLrbEr+Dc
	NWvqiEEOsQbfdC5gbwD/p3ODnfuOk1ObZ46tx1Qu5EBJcB9+DZVWFccC2l2MkPxIngnONbVQhBg
	ZfRzRBkaJn8clHATKe95+u6RjL5LiJxD2/iK6fSEmghsb2O+4u7S+0NEkDzpLScLi+mWoa09vQX
	oT7VVn3efXYIbGmE4tOxxP9/RFFsJ2w/PdSBjJyHfN5IMIaaVVu9peMRNCLcGDWOMAOKgn1dQl9
	mJGmTqMy/3FHZpzv1hcZ3jd4ymMBRv3mG7O+8IBGL6pFs/QXNE9z7CTI8AVaw==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050155_747287_EA0D0EC7 
X-CRM114-Status: GOOD (  10.19  )
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

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
