Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E74C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgmAdNzUu5HTpbfa/lJOGcpN1BU+AnpqTaS9azujnDc=; b=RZOhxQ5RHCLO1v
	P/1YrP1O10QXN/SpFyS3YCWAkGdnO5DufELMKQkon8rjQ+98ovnsX3xIEVV8EaxiDSJGk7A75o4C6
	yI3kuVLcb+n97E4UicH9YOxmKQh7AIwu2h8LGrcODRsLTfPVXxXSD7F1aF8hWHDBha5ZBaJmQhVOl
	ncSVmwREUXhQBdDlka66ywdrTKLlVLHSOUhuJNOhl+16+vfZoUh9pIPDB6SIZd2GYTQZhj927SP0F
	he4U0pParxRZsuDfO+mbADIwVeR0tWWvO7Fzl05DelWi8+6vOJYQHQuMxV5wE9LsIeUu6BMND56kC
	HjB30oKxCF0eyFKJlCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lUe-00000006nWX-2YPa;
	Tue, 15 Apr 2025 18:58:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lKP-00000006lar-3UxC
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 18:48:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4747387b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744742892; x=1745347692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
        b=EP923AOmXs+mkcHM8lt7R+3G4HaZFnoRnFSMSl35B+12C2dT3qp3pXzftUGa04XUqH
         wYmftWkAQixAHFUodW52KuiEib7SEUcLCdUXlysGV+FY/oa3bmTN2CnisTwE6l5EPzD+
         zk+CBvmYMnVXqCsxBSo+67CZj21+4zfqTw80gvlI2nUs5qeGsIXsamG1yTX57i5yiHzf
         kuhNK+3y0z36DCaP7A1J/aLpuBk4ynKALdKOoec4l08bPftT1gJqcXrnozZNEcFw9l3i
         G9UVwYkWSfvi1Di0K0ZM/YLvNNh6BD22fGeKyOfbDbFpD88472A5NVZXvENCW/10iQRU
         0I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742892; x=1745347692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
        b=YfzbUcoHQA+Zn0zYl0I4kZ4QbgVbRvL0qeCT4mH9mj+kCVxrDeJu9LimwWSO1+aZLO
         unH6ETbUCs4DJSX2RH1fsqoWTu/eaWiPi6/eiCsxmSCqwws3cgf/TzLfGLAaQ8GTIaU5
         7Kcb7AIXE+U+dLYU7ZVxMWaBmMru255IkWKXc8Gc/2lQCBpghv+hcExeFhGaQosfJqf8
         464wi+5cmNTI2hKubgRZ4KR3g+hLTqDHOEgYkIOJd8UPEHUtGXP/9dkb5vbnyhdoksGf
         15NjdX+p/uXUSShlf/YxuqeJWU4dEa7y5El5EehFQY98v4UJVgMHXNokimGwWeIK+Xqp
         XTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrPFQ6yvcQ58MgJtIzwr17teOIv3ORIXSjiGFvVzdbilX/tCdrS/OWqj5bDo8ysmiwz/pyMiotdlJ/4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGbjLczpwxrNEw6VnonBSUmBh86VPDNjhl6Ik4fzGw7HTug6o+
	YC6bomK5br+L5bRwDmXEypFND8kO6BYSa3+eO3xlECSXJOG2o723EDkYsPEz5j0=
X-Gm-Gg: ASbGncuDr4ZQiq7XKRiyvRyeSm7epnM7hZfg6obD8s7hd/uuFbI50pct2hwiMhfFYdp
	l7VO09ts9BAAvjZIt+zGQ+Vzl1zmsgLXhQ1ZPrEnTQsPr7iPLxaUlRj3cp7Ry5Y23T85QFc+cbP
	j1ICDJbMjv8I7N5/DXnphduBbLruhvbvmQC6N7DaOBdgvtkK3Y63C/x5Pph9Gg47Ql8McQj1Z2v
	yNS1E9pZKixkVA8HHjUyJ9ECcTt7+NFNgs2NYptYA/49wz7LHGQP1I8MefF3J7g6OrTCnseOQtD
	bcJxZ0S5qaMdI5vPsuZbbhS1anLMAqwEkYkPeNBdgLctv8M=
X-Google-Smtp-Source: AGHT+IFU1A6IgDtbE+ayph1nkrk/Xkmje9tzi2mXCLVIUeRmrboHqr3jd6su6fZeet5H41nBKRVWlQ==
X-Received: by 2002:a05:6a00:a26:b0:736:3979:369e with SMTP id d2e1a72fcca58-73c1f8f742emr628913b3a.9.1744742891991;
        Tue, 15 Apr 2025 11:48:11 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a4ddsm9578290a12.49.2025.04.15.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:48:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:48:08 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Message-ID: <Z/6p6MQDS8ZlQv5r@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
 <Z/2+rbhsaBP0DQop@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z/2+rbhsaBP0DQop@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_114814_139101_7512126C 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Apr 14, 2025 at 07:04:29PM -0700, Drew Fustini wrote:
> On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> > The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> > TH1520 SoC implements power management capabilities through the E902
> > core, which can be communicated with through the mailbox, using firmware
> > protocol.
> > 
> > Add AON node, which servers as a power-domain controller.
> > 
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index 197df1f32b25..474f31576a1b 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -6,6 +6,7 @@
> >  
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> > +#include <dt-bindings/power/thead,th1520-power.h>
> >  
> >  / {
> >  	compatible = "thead,th1520";
> > @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
> >  		snps,blen = <0 0 64 32 0 0 0>;
> >  	};
> >  
> > +	aon: aon {
> > +		compatible = "thead,th1520-aon";
> > +		mboxes = <&mbox_910t 1>;
> > +		mbox-names = "aon";
> > +		#power-domain-cells = <1>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > -- 
> > 2.34.1
> > 
> 
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> 
> I tested this on top of 6.15-rc1 and found no issues.
> 
> -Drew

I've applied to thead-dt-for-next:
https://github.com/pdp7/linux/commit/2bae46e3de2a64fe3a619d61b16da0c01b8df2a1

Michal - are there any other dts patches that I should consider for 6.16
PR?  I would probably send to Arnd around 6.15-rc3 or 6.15-rc4.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
