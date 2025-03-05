Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99001C282D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 05:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8RWT57zSRHdoTqGr2LE1Etp2//ZlvmpDv9y5m90Uh8=; b=D6UmHZ/uZ1NhBB
	Yz8ga5TLZh09XwGUSxMwkcVXDb7EhM+dezsgcBOSW7oxbBsGm8yxN4XdauaQVFsSXfwKmgj8N4ElO
	NojLv/wn2DGM1pUenVHHvMGw7wJT1J2ApbGI9EmHwksHcjQdTbP84QNQGR/GwTV8JCnZH14dm3z0w
	9saz7ZM9EBm2VhQwMEy7I6DiKjfOvEs9qaPeia9sfEU9Bpp1L4TcLQC2gNCjIAZWkwTDweyVC5seB
	YlPU4nt9gvdoXuE1JX/eHfV37iJ69Z0/kzPafGFTpo8t37RwyT7JXYHWnrHrb6cvAh5xYb47ls/tB
	2LOYwIfXxjlm98veE5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tph4a-000000070aZ-1eQM;
	Wed, 05 Mar 2025 05:13:36 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tph1V-000000070Fy-3Y5x
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 05:10:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-46c8474d8daso56698501cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151425; x=1741756225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aXc+eFaQqactfAjsWukq5bexYGgg4h92obG4bg34aA=;
        b=FKgtXc4+IunVVk5iUG0kELnwzJ+P9MT56hKfYUAOz4FcUw/Wyrt9LiQbBO1NrJ1rGY
         /XdGn5PeA5dGu/J3dy6h6rQoGEJ/y+aseRhktEfmEYZvE0cagT0oz5GwKzzAn7VJk5NL
         vCXjNlSb3XO6bWB418KvoqBES48H2kNPcabyTu6E1JVaUMMu/6CDRwqwH919QG/r35Yz
         yPXEFR+BS60S7ZvgiRdy/hhrF6W2UjraZYeO3r7wWwXQoq9xWLJ4pcaxTJH0CMseWdzN
         zdgruRLFsJT2PD+iZWZa6+5Lt2elNX7zKYCLc8s7CwfaEd7nYcbilQRTt+EXxzzFyDSw
         uFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151425; x=1741756225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aXc+eFaQqactfAjsWukq5bexYGgg4h92obG4bg34aA=;
        b=uKSjc7P4aTFlhdbUvhTjfjL9rfuSBEZvAliJLesQMmKglrLq7LoBrx5nCMK6SuWEVz
         6z0kodpOnaNje6a4F23TnOYLlmMzWAcfv8NMJ4urbMV96++XJyFVXXWoPgXt9UpJmfOO
         WJzjfL9vxk9yAmhQLOgnuaT7FgJx2VwYNxOyUFY5EHoCvb2VlE65plGZTQSBIop85qT5
         eeIMmyWNJ7fLFkkAsqSPzKBxITvLpFF0JvNBOwlF58upXEEzMfCoyv7dwf7Agr/vSkqR
         DLMsBDwDLxdIbIaI35zl4cUvso3fpEdFZKCwBgT3U7+qrBEWx0kp1o54grPxHS9K2THF
         xh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUwjw9MQhJiAUq/mgZfA9nYsgbkqDVJA2GWHP2jdnEObX9yo4WToDxFyj7uuRGAROI8IF/T9nyJO81Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJN6gc2u8x3aJVM65SoKqbua/3FwjivA2Akq7ksHuP8J0GizI
	HsvGzRNIOCfXlOVQUPenFL0jYJi6GHZYI0b4Ahm/hxoYH4ovxlCU
X-Gm-Gg: ASbGncvU5B7VXpd2aD4leoTU7DzPXzQO20UNFxWoPR0wz92pjqSlOprJrOUkee/pJST
	v6iSMsheKaZxe89xSB/5oafNAS0uRZfVgEkcUHq7B7PrFEDAoH4+4LACr7rQ26nVW20Gv+Kj34S
	UMBpkObeSU/BFdLZ11TbO4m/sec1mUG4kZNbt18o8PL/qKbbKcoc713USQcyTA2oHfING116nki
	2sOT+YlDIe1pAsWVNJCjBz9Nx+WpLdEXsM6gnTQJQT+RJCYv/UstQDvwqwcl+rVtNxI1PRvZVpF
	z7+8TciVyNQdxLuOXnyi
X-Google-Smtp-Source: AGHT+IHU4vogNMuRCH0tVBz2RJOUF3BRl3lUNyiWVLGC65w1tNpBCw5qZt0mtmykFYE9WEb3N6Pl9g==
X-Received: by 2002:ac8:584d:0:b0:472:447:ad7d with SMTP id d75a77b69052e-4750b4c3f0amr21880881cf.32.1741151423766;
        Tue, 04 Mar 2025 21:10:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47508cfc40fsm9857171cf.34.2025.03.04.21.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:10:22 -0800 (PST)
Date: Wed, 5 Mar 2025 13:09:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Johan Hovold <johan+linaro@kernel.org>, Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, 
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <bxwsvluj6amgoelk7r55gqhmhjwpewnfyhvvw6zpxen7kqzvwc@fxcebjzo5axk>
References: <20250304071239.352486-3-inochiama@gmail.com>
 <20250304173632.GA243820@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304173632.GA243820@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_211025_892608_4EF98D73 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, Mar 04, 2025 at 11:36:32AM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 04, 2025 at 03:12:38PM +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> 
> > +static void sophgo_intx_irq_eoi(struct irq_data *d)
> > +{
> > +}
> 
> The empty .irq_eoi() is unusual.  Why do you need it?
> 
> I see that the existence of chip->irq_eoi() makes a difference in
> chained_irq_enter() and chained_irq_exit(), but I'm surprised that
> this is the only driver in drivers/pci/controller/ that implements an
> empty .irq_eoi().
> 
> A comment here about what is special would be helpful.
> 

It is more like a mistake that from the vendor code
that I refer to it. This should be a level irq, and
I haven't tested it as I does not have a device use 
INTx. I try to get a test device will replace this 
empty eoi with handle_level_irq if I can confirm it.

Thanks for pointing to this.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
