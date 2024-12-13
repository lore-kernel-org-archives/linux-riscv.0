Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C3BE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/rgh7638+Uipb+e/jiS6UDiOYyKzxryaAKF/VLbr3k=; b=f5S+RuvaLGxsoV
	MmZ7Tw0Z238otSZ5lfnYZqZa6YvzV6uJsWkTilSZ8fxyj/tOtwzmlCvqb4dZNgD3yEJ7mQsoB0T+D
	GAlH3icd9jovrcWglBBn7dp3MkSuZvJ8Qp4w5WzrFO8RugpkanvuIMULZVVmHsm63ra+sZ22XMfJz
	EiNBhtwfWsk5HC94lX9h9y7y+6y28gkUvs/o4Y4Fqnl4pQ7J6ySyPGpzWoH9TmS/WM6O0ezgEEo9y
	pAVttH8SQzMikEZcvKj0jEtaPVo3FMClJ3EFJtUR0LCC919ZFfzik10oE+vUweSOGj8mAApmBAhQM
	rPFu4bFv8gbiBZZw/3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvqy-00000002XuM-2RcR;
	Fri, 13 Dec 2024 02:56:32 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvqv-00000002Xtn-1WYN
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 02:56:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-728eedfca37so1371292b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 18:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1734058588; x=1734663388; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyBVz9J4Iy1oVqyEvOxvCgnZn06m2Dd6z78eSL9EpLM=;
        b=bEkPHSIbliwqSR+xDX2jvM4QfmX8i1GQtadONACy7m7KpP9QLIeXPSGT/+hCxQZLXH
         PLj1ccSeTaVkEr+Iev9sc7l8J/PxGB3kQnjKrUuApK2Ij1tWQ37dTBlA443o19mfTRMn
         TIoabpp9AEs86uGFZb+GT92hHRyXfV7gXiXi0iUMyIuQqP7vmFA6HC+3/b5YPP16mtU1
         oMkIj3Z7Jdu3w8TQtbG0OaJfgTTZAHTQcLAkU05HZkrgAWqeoNPgrUCK7AO7LnLHs3Il
         KMP+pcS/9XnbEJ9svdPP1HeZNZbwBdZodFiYlV7ye8aArCUvjveyKwMCzpv/LgU+M8hZ
         6nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734058588; x=1734663388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyBVz9J4Iy1oVqyEvOxvCgnZn06m2Dd6z78eSL9EpLM=;
        b=dLBf+5KyRIcRG01F811hYUtC3m5AQ+7JTpXm2BLNCiD2ZKza7qQc7EwMhwxW3OgbyE
         sIVurThJVi7hY8GkhFJ0aQQgbK05C4uxE5d6NJohzOOSl1taYAaT4CQaPpL3dUXIsGMm
         zizCUT+FWs2YXpnNIowpj3hdHdzoR80ZH4NM9VWT9HOwVTYm75wm1zL+aeC8djNqAjrp
         STXZVyYcnsoOAkhUVpQBOrYN1+I9y6bfvkwql5BtC0OZb+oLjTQZODUKpaH5+vNfS8Vl
         If2HahntCR8GwX1HKNI36e1T3PWVK03oPkk1/DTQR0UXuhVPw/wVXud9LKkwvPj2bNay
         jerw==
X-Forwarded-Encrypted: i=1; AJvYcCX0rRHCIVg1v81ghyB7KS62rsKI4rUO5wDrNMh+SjjoHgXRkliCHxnPEpFWZoqG76TpXeO83HgHiumOug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MRmZx/Etp4HryNYfkw2akly8iEtFR06hoNxXmJWNrsrIWp19
	ON17qb5Jw/7H/bEVHN//NJH4JX5/AV9wZ0M78FAxiZWpmVct1xn5c1tsKvd7hbg=
X-Gm-Gg: ASbGncuSUcyNm8J2rt/AgJcMTJ1taZhpUyaksKcX4511XPiAsE4xhwreV8osBR2Gi0b
	GYBuNmHu8AorlK+JKZgeOKl8N85LDzZPZr836zGRxGesQM/fXhuACEJKPqycK/ufLVkzRRWR9vB
	r8A8SrF9xcoHHX/T9Vsiico3hHLktM6W0JDQQH2rBoZ82E/gYThDT3ySaafCqTfPWBDMgSUq8h1
	MtJtcPz9H8zJPEa2pY/LEjpNfnzhpUj/9zUlQaT1dTbT6P5gz27TXLA4ple7wmdLEe/aTIR/Gsm
	Tnjb
X-Google-Smtp-Source: AGHT+IE3GLEOuUBB1zehzAwY9Ah5/2jVDz+WIAO7JDxIdFk51hMlAke8a4l8rZumyuvII+YjSfeLwA==
X-Received: by 2002:a05:6a00:4505:b0:725:e444:2505 with SMTP id d2e1a72fcca58-7290c0eea53mr1353429b3a.4.1734058587964;
        Thu, 12 Dec 2024 18:56:27 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ea44c362sm8693583b3a.102.2024.12.12.18.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 18:56:27 -0800 (PST)
Date: Thu, 12 Dec 2024 18:56:25 -0800
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
Message-ID: <Z1uiWXWo9szbgfx9@x1>
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
 <CGME20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb@eucas1p2.samsung.com>
 <20241104100734.1276116-4-m.wilczynski@samsung.com>
 <Z1oO5ewIOMFco4KI@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1oO5ewIOMFco4KI@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_185629_410788_A031C1F5 
X-CRM114-Status: GOOD (  15.92  )
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

On Wed, Dec 11, 2024 at 02:15:01PM -0800, Drew Fustini wrote:
> On Mon, Nov 04, 2024 at 11:07:34AM +0100, Michal Wilczynski wrote:
> > Add mailbox device tree node. This work is based on the vendor kernel [1].
> > 
> > Link: https://github.com/revyos/thead-kernel.git [1]
> > 
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index 6992060e6a54..89de5634d3d3 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -520,6 +520,22 @@ timer7: timer@ffffc3303c {
> >  			status = "disabled";
> >  		};
> >  
> > +		mbox_910t: mailbox@ffffc38000 {
> > +			compatible = "thead,th1520-mbox";
> > +			reg = <0xff 0xffc38000 0x0 0x6000>,
> > +			      <0xff 0xffc40000 0x0 0x6000>,
> > +			      <0xff 0xffc4c000 0x0 0x2000>,
> > +			      <0xff 0xffc54000 0x0 0x2000>;
> > +			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
> > +			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
> > +				 <&clk CLK_MBOX3>;
> > +			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
> > +				      "clk-remote-icu2";
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> > +			#mbox-cells = <1>;
> > +		};
> > +
> >  		ao_gpio0: gpio@fffff41000 {
> >  			compatible = "snps,dw-apb-gpio";
> >  			reg = <0xff 0xfff41000 0x0 0x1000>;
> > -- 
> > 2.34.1
> > 
> 
> Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
> 
> dt_binding_check and dtbs_check are clean when I apply this patch to
> v6.13-rc1. There is trivial conflict due to the gpio node label having
> changed. I'll resolve it when I apply the patch to thead-dt-for-next.

I've applied this patch to thead-dt-for-next [1].

Thanks,
Drew

[1] https://github.com/pdp7/linux/commit/98064af36cbc0c216d0a2d11da5e3746a57ccce7

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
