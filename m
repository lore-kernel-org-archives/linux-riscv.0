Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113ECC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTnIq/B861UhMeya6cGdRt4hqoDrWmeerG4aTHiYKco=; b=TK5cZm88dECDaJ
	qQZanEP5ablMBdh1UErb2dN0XDHl3eEzSU2bRWsuQoXEjZZV+gTYzvDyCxp4HQeU3oCSCHKwL5490
	0LhrFzkPjzzbdXcjZ2TGR2yRAoZtmGovEmPn/rtq5rJFjWMDbnEBfMmqqzq2FQMSxN2NV2JMKjEBt
	zfmoYs37Qmoypypj5pPeUjp3Cmv/7XDcnyEupkbvgc1X2Zcq87QtjypdHrjCzpwMBDKfBOn2vLgRZ
	qxZvw9+LlASXwmo3IoLZcHyxlxE9/7aJRC+aviygNBIR6T0XOj2uc8ByZg/g8fcgrXhGNkZeRFRbn
	DMxtaIG4hfCIDOhLhPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjdt-0000000BY3u-3VcD;
	Thu, 13 Mar 2025 14:34:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjds-0000000BY3V-25FZ
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Mar 2025 14:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GICFi0VoA04wMmuC8eF7tQ0MeFnd48JKTtPTlIjvHiI=; b=IsOU0i6p7oQInneTeygHlgR7Ub
	UODYjB0zoAaeQBEHlK6K4inDzt5yGDQlHr/yQqIUGMBtZtRw8n0mnzF8j3Nz85odH5mjjGpaU+BOB
	P68FjF0UJuu/HFrBEqnPon4aNrgqYO1x9L+/ICF1XCr9M1ENsFvnux3oKeP+s8HvtVCSUXD+Gmy/U
	O5TXZakXpZNCCBsREdXkHdjt+YMwyVeYkbsKP1k3+YQNlzCr+NJOASbnLz24nNrPGHw1UXZ6Os/P2
	6PADY3X8P6kzuhlQLPPYh4i0GpfmrZs8VYRUQlCe6v/Kr5FGr9x1hhWJpR5RiK0V82cGVValC7ryO
	ty2RprJA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjdp-00000002gzx-2DtJ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 14:34:35 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso2240046a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741876470; x=1742481270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GICFi0VoA04wMmuC8eF7tQ0MeFnd48JKTtPTlIjvHiI=;
        b=Z3VTdr/eD52yW5TmT7+JgVmOc2xFNrfIT5HD10w+bPTdd+o1HD8xAXQbCc46/BnRZv
         seYZvbRP7IwGYMsl9gYyanZja3iY9dg/eZwiu7VLJVr/xf+X4Xacc7IUTU/0NECK+gt5
         fbGk3G2GFX7gpx9HkVdkR7V3fXZNCoocdHaO71vZcEh7xRIRgnY1QmQH89g7mfdNig9s
         5jIJSVKJdDCN6vUjPm0YSRiV55iaenYWykaa5yR1WBJlBbXO19ifyKhRpJ3b4o5wAWUA
         hyjKMasoruKKdx1P/adcD+EJBe5vqTprmSEWqxmLpoKYjPc2T7Yfvmc83u0pRAqDGwbt
         uD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876470; x=1742481270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GICFi0VoA04wMmuC8eF7tQ0MeFnd48JKTtPTlIjvHiI=;
        b=no1a1rO6Nt8WKECSb7KRJMM/BfnBeYQ+gpiT8BS6y/rI3atk7OI8yXiLTJ7UUOpz+X
         32aCk08xYbcgZcpKkqdw+43ELP4N7qkrp/FGLBVRnNRQuRWXtt2rHgOwTzCXKrExPD2/
         sKla8i+boqRfWzq2HXkMhAiEhz9Lx/jWCwLwdC5dtw7/I4yDrWP59OLa+CsPfrwvmDer
         0qbVegUhnDIGbLvaUvxHupvcqAqbx3NMdc+jvn265XBB4o4QIJadkznkVddzHrEie5iQ
         0Ue1eF/uTTUng/sv/cATwl/xnQnvHHw0kVbE1dN012WsvnoXmeuEmsKZfLBV7ermqV1m
         Qg4A==
X-Forwarded-Encrypted: i=1; AJvYcCWHhaGQlXyUmZhOsZAsoztqfPOFqYa+unstC4eyx2gAjaKMSDyDTrgZVIXlJ+ofTNqkavC3d2rmDRBpdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+lPSAieATE1o0toJqoRgoswEYlHiFLiaI3RqPxxjMZVvDsUI
	6rae2wioMzJyFCKLmacGyptaxuf4oHuwLPSxnzTB0NQMO3NkIqyz
X-Gm-Gg: ASbGncsxpfHaPEo2o39LExHfbuot3bTUf4RQ6u1ZtQoL/vmXLLooXd8DnaTWoLUXMBy
	wtH1PfNjjZ3/dPURqpRTYOvsPBNkkaSO24CGb4yGumvnxV2joUkqhjxbWigJA43V9RWriQMKHwb
	AJ3YgNMEr67o2y3ITUvFj6R8pRyEf/je1KZZ8n+ToHzbOT8OeSIcazsFiZCKql2bGcWuag9xpkZ
	Aio0k1UYvek8sJXy6O9RaXVvd9Fi2LFpppjHICH3AJgRbiKXzUE5H4k8e0a4Ajf4vfMQtjulYcY
	vQjwDCtxNlb0WhYHknRLP+BlKBRsNLM=
X-Google-Smtp-Source: AGHT+IGfaVAk+c9RAVXj/AWvec/u2Em3Jena5j9eOn/cnAaGId16whELS7F/FD8YOMC2w8PrpvsyVA==
X-Received: by 2002:a17:90b:380e:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2ff7ce594ccmr39877404a91.2.1741876469920;
        Thu, 13 Mar 2025 07:34:29 -0700 (PDT)
Received: from localhost ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30119265943sm3891865a91.36.2025.03.13.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:34:29 -0700 (PDT)
Date: Thu, 13 Mar 2025 22:34:25 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v3 2/2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <ujqeq5do2xqf5jvepxaynaxridccalbjows7gid4ehyj7jduyk@2axt2thtet6z>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
 <20250313-sfg-spi-v3-2-e686427314b2@gmail.com>
 <6262dfd2-9e0b-402e-bb03-a2174d544923@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6262dfd2-9e0b-402e-bb03-a2174d544923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143433_638460_98477F24 
X-CRM114-Status: GOOD (  14.49  )
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

On 25/03/13 02:43PM, Krzysztof Kozlowski wrote:
> On 13/03/2025 14:11, Zixian Zeng wrote:
> > Add spi controllers for SG2042.
> > 
> > SG2042 uses the upstreamed Synopsys DW SPI IP.
> > 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > index e62ac51ac55abd922b5ef796ba8c2196383850c4..9e0ec64e91a2330698aea202c8f0a2ca1f7e0919 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -545,5 +545,31 @@ sd: mmc@704002b000 {
> >  				      "timer";
> >  			status = "disabled";
> >  		};
> > +
> > +		spi0: spi@7040004000 {
> 
> Does not look like you keep order by unit address (see DTS coding style).
> 
Thanks for reminding, I will read it more carefully.
> 
> Best regards,
> Krzysztof

Best regards,
Zixian Zeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
