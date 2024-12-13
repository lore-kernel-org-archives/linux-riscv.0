Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58181E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 04:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XE3qzKCg1NHWxWg4K/u0sFAlTzczL/Ir+2WXge6aM98=; b=h0AvkPafi6CCyk
	IZb7C5wEGc7cElFdZxE0KMxhigs4xYGyl3A6hO00KhZ13IOIg/4mZcdSoo7/LJTHzp9L1YZuA/sGQ
	36+63lX/P6L3D4vSztu+WXRyhPXcNc8ZLrBEJMQXVESPIYYTWuaaMmwHOKPxz/aDuqWuFRuZSlwsw
	EbA0KExuW47FWMJHQsJNCtitMv2Iq0ml5bVHaZae+ugXs4HikXG6gPoJ4iirFmCqAxDTI2y5HAGeE
	qShSp72STvYg7QP9CcJKhmbFOre8lCg+j5QANiYx19lILs990g6RWPo/uNwd+1YA+JV2QxvEETEwS
	xNumq42evGZX6PN1pQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxD9-00000002gbq-41Kd;
	Fri, 13 Dec 2024 04:23:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxD7-00000002gam-0i1L
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 04:23:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728eedfca37so1432330b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 20:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1734063808; x=1734668608; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVpovzDFXwge3Q3+ToA6U1Heg/KQVI3DYGJ0qfmqewk=;
        b=gS1dF0rMbUIjc7wfGMDB7GB20KauUaN9upNfXtw0H/UPhDxl8MSZKM5n0YjFi5jYwk
         evmmiVV6QLxZU/UD92zdrfxeLB/hYGZmqN8e13YIfDrmXfhURKfHyaH2yknVIlGECJNE
         L9tEjgXYm3nZkdIf7vg+LVEZwzuCFUdsugbf71iKF1QbaYtzc25PxGYzUAFSGaQEH6Nm
         B9iz+geHtnkwwfH2kH73jZHjPbjasLDslbvmEZ5H1dvI/atf7oKuZmLWKVpMYN3PkIwo
         GVW2HFkGAj9CYDQGVVF2g7EFymluFgfrQxpaes9qispFE46VcsVAllr1zUX/wKINQo9o
         Oj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734063808; x=1734668608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVpovzDFXwge3Q3+ToA6U1Heg/KQVI3DYGJ0qfmqewk=;
        b=U6gXqmXxSwHCqNmkDlugMsFs2Mz6SbjU++fZ9cHiBAaBbn8GhyyiY4GHUTKymkVaKA
         tGHhhQGPJjbRbzMaFTS9fdtUjm7zR95oJZWXsP51mKfvtSGO9gHvltFgjJQhXxc1egi9
         ClbVBZk+11zd4DeAuyWM5kmXq7m4GtX3DCAkiyqhaXzbggR+swGJ98uZ3nVSXWi5YkUa
         VNI76mOhFE/kJ343428p41cEl3Dqt61rLwULDHbYNRJ33hr24zYSmQqHAYqYqg8TQxsx
         o1CG3m5rlQ/9FtKfKjjLhFqId5YRw8dFemDEjJl6ZFMpUBf4thaEzwy3tfkPkoPToIaL
         s6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW63VZb7EE79xRbUdefjssg5sjacl9VE+mpi/9IU7/UlLuJVdKdXl+0CLkOFf6aZOvtJYguo91qEFt6BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVap0LQn5zITOLtP/Si2U7R4v2vxV+fPdNzPg2DslxGmFIOKh1
	ldVsKMEqBifT19fFLfiF4mAmLGjYntmkmqUSkgvjmahv4s2rQBPO6077+cu+wEA=
X-Gm-Gg: ASbGnctGMXAr5j08hUSnRsYbiL0BhchurK5/et+BQzccmZ/Ayki3AS9YT833e4tj2XI
	YSpdx3FHbHGUYl3g2WKL0+ZubxCjpRerig/RJQ+Q1FtRBkFlRWg3u/TvVvhPAiIkVTlGu7Waitm
	urOoyvNtzXgW58z/XOWXszZQAZX+Ma+U7fMM51+nHXPEpPsxfHC5qaOOr6HxgdU7PIvZuylyEq3
	B1RIrXjbHCMJFqiVk+lgjuaE74ygtLoi2iduAtg8xyDM21aCaLZzdQY4RNmfIzqNmMLDRNftyYT
	xbTb
X-Google-Smtp-Source: AGHT+IE1gWRpEWOOFyENRCzyuHkw+v1u7Rpqnlivn3esqNQkA9AcnHNhDDeYbLWGFzJcgO2JHohwSg==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:c748:13c1 with SMTP id adf61e73a8af0-1e1dfdb04dcmr1876388637.27.1734063808159;
        Thu, 12 Dec 2024 20:23:28 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd313f0ffbsm10396549a12.82.2024.12.12.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 20:23:27 -0800 (PST)
Date: Thu, 12 Dec 2024 20:23:26 -0800
From: Drew Fustini <dfustini@tenstorrent.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com,
	samuel.holland@sifive.com, emil.renner.berthing@canonical.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v6 3/3] riscv: dts: thead: Add mailbox node
Message-ID: <Z1u2vsoCmmcNm82V@x1>
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
 <CGME20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb@eucas1p2.samsung.com>
 <20241104100734.1276116-4-m.wilczynski@samsung.com>
 <Z1oO5ewIOMFco4KI@x1>
 <Z1uiWXWo9szbgfx9@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1uiWXWo9szbgfx9@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_202329_209617_00DAF1B6 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, Dec 12, 2024 at 06:56:25PM -0800, Drew Fustini wrote:
> On Wed, Dec 11, 2024 at 02:15:01PM -0800, Drew Fustini wrote:
> > On Mon, Nov 04, 2024 at 11:07:34AM +0100, Michal Wilczynski wrote:
> > > Add mailbox device tree node. This work is based on the vendor kernel [1].
> > > 
> > > Link: https://github.com/revyos/thead-kernel.git [1]
> > > 
> > > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > index 6992060e6a54..89de5634d3d3 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -520,6 +520,22 @@ timer7: timer@ffffc3303c {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		mbox_910t: mailbox@ffffc38000 {
> > > +			compatible = "thead,th1520-mbox";
> > > +			reg = <0xff 0xffc38000 0x0 0x6000>,
> > > +			      <0xff 0xffc40000 0x0 0x6000>,
> > > +			      <0xff 0xffc4c000 0x0 0x2000>,
> > > +			      <0xff 0xffc54000 0x0 0x2000>;
> > > +			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
> > > +			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
> > > +				 <&clk CLK_MBOX3>;
> > > +			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
> > > +				      "clk-remote-icu2";
> > > +			interrupt-parent = <&plic>;
> > > +			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#mbox-cells = <1>;
> > > +		};
> > > +
> > >  		ao_gpio0: gpio@fffff41000 {
> > >  			compatible = "snps,dw-apb-gpio";
> > >  			reg = <0xff 0xfff41000 0x0 0x1000>;
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > dt_binding_check and dtbs_check are clean when I apply this patch to
> > v6.13-rc1. There is trivial conflict due to the gpio node label having
> > changed. I'll resolve it when I apply the patch to thead-dt-for-next.
> 
> I've applied this patch to thead-dt-for-next [1].
> 
> Thanks,
> Drew
> 
> [1] https://github.com/pdp7/linux/commit/98064af36cbc0c216d0a2d11da5e3746a57ccce7

I forgot my SoB so it is now a new hash [1].

-Drew

[1] https://github.com/pdp7/linux/commit/c95c1362e5bcd90c45987828bbef02236d181ffd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
