Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83649C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 23:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeYNIUyz83E67Eyrg/0cl8nae4l0QNsKymPBOG5JfLI=; b=2tyEQrl8+KtTHx
	Ex600xlLz/4xxgPFg30mgT9x2U62ftZCDhWQirXLkClhbnHqolMJsi94/gn7uxQX2Ci+7JtutJbGR
	WPiHEtDY0DHBl72aMldHkmrs9vi0LL/gWdwXXJKbm8n7ggPA/EDeQKqIH0pHZiiRG8ecqmKuqM69H
	zp3CLvFZ0VbIVcbwhaiQ5lnGEGo7Aya4g93iSEbhYmrfThFnPBLuk+Tw1veaCcC9p3XPDIpo/jv23
	bd34vN5RTQox6uJXTKtXEW/tedI2i5oTUk5N13L6bqEDmFrX3cCjnIWaP2UBWuWyxTlALMD8oq5oB
	btQBFrnhmmzCiCk2p4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmi30-0000000FVYx-0S7e;
	Mon, 24 Feb 2025 23:39:38 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmi2w-0000000FVXP-3MUM
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:39:36 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7be8f28172dso389903385a.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740440373; x=1741045173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I28BvW8sYtCIJpp5k7EPbcyeOkG6IabIbB4ctmQvitg=;
        b=MPtolzbV1cZXI2LlpclxAPMZRQ9ndNr0Pg+CK+NjxqLI4I4O6lWUm6YTUpOW+boIZW
         9Lz2lka3eFujNXntIOKHVKPHx/9ce7TtH9fNkkWXc2g3a7cXmgZZbMzCLOxfmCv3ip39
         8blN+2AY60yy2fQ9WMOkrosHSpN/uf0+MWLU37AIQjJJ3Kuxl1zVvMeVMMQY+9KSlfBz
         3yPWWrx6n9Gfrze0IU95/F0yxszb9iRbqC/FD/y4d7R0PhawJZv3I17d5rBU7N7QGvY4
         s73bYFbMm6ZuGa14UG+WF4/zOtJR1BwHKiN6I7Muk06IwXktkAf7YC7OepUJV1egApxD
         P1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740440373; x=1741045173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I28BvW8sYtCIJpp5k7EPbcyeOkG6IabIbB4ctmQvitg=;
        b=ARpta3JVTvHy8NbUGRHh68Q+QpZs/Q3XuVgnLqN1RUtTv3D7zd/q9pJFk134qxsfX1
         GqVg7WGNB+W/ERnn+thG0/0JGi6uWRI+PHjTioQwEkAHNZ0xereMsz36IWirxpyUvQJd
         nbp2ndpG5RoF1ru/kJ/Ls4LLBmFiBQmpKBrAB2kqIxt/EmYeSBHv753zSdJ+ZC35ZaZF
         Fixnk9sWs/T4rxrCg5eaRWAssSNXFLM5yf9ktgMOuStipCUUwLKieUhpXbBK1+9d78v3
         XRDirxpO5bdvQJ7KngBPtAXNq+mEg67xngIQD1m5W1rUxgndJL+FhjbbLTF73+ASUJ17
         aXkg==
X-Forwarded-Encrypted: i=1; AJvYcCU14O2Jhse9mIPTWczUm34fico9Qcnj+KHKbzEvmshkFBKAa68TTVPn819ARmpX9fKcRBlzBcQ8hOCsVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN/0gvj/1v4qlIASUJ032Tjbyxy66SwnlKy+GqoZZ5QSayp5vO
	aPoMPjKTT3zPS8lvIvSyMMwz7mOUuTARHjAZxFissCup8H4L57oK
X-Gm-Gg: ASbGncv1+X+2vIt98HgQ0cAZnZSuRmnOPNMh7NoEzf2BN7glkeGV3lCMA1dI1o6Djlu
	mgoq03pfOW6i4KyWwKNtEog6NlhNzSF6NfM1D0yVsleMD91XnUKmIekKCnw5x1manPB3IpvWAMc
	wN7kQ+kt/lhc/r/AUrUjjX6T79VdtvXC2bVit+30L5uLPSBMrThbVk8SshyRy3uWXMzpRFKgpUg
	WkBtDvt3yCh6Y73/6L1gN/gd5qYQQbyTdAwKw7MCzKj40XN2wvHmE9Js3gtsTbDtq2DSFhnh7xx
	eQ==
X-Google-Smtp-Source: AGHT+IFwSiY82sk1UHPy1sh4TaxDRFtt/bKpmiKYsLl62LaJzeIFLc36bW8vjGEj+Z6l8tQnP1hrSg==
X-Received: by 2002:a05:620a:600b:b0:7c0:b368:5d78 with SMTP id af79cd13be357-7c0ceeea4e1mr2231799485a.9.1740440373095;
        Mon, 24 Feb 2025 15:39:33 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c299259sm35457385a.14.2025.02.24.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:39:32 -0800 (PST)
Date: Tue, 25 Feb 2025 07:39:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <jq55rzcvcp6bxfk3klkomr3gtzqgkwqb2qpjnfndymomaac6ry@5jmzq6vlpu2u>
References: <fanm6m6fx6cqwalhdvrxmjzsluiyptbvrwbi5ufwbqmxsf62xl@lntprhkjv6tm>
 <20250224194725.GA473475@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224194725.GA473475@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_153934_836103_74D4C791 
X-CRM114-Status: GOOD (  19.14  )
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

On Mon, Feb 24, 2025 at 01:47:25PM -0600, Bjorn Helgaas wrote:
> On Sat, Feb 22, 2025 at 08:43:46AM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 21, 2025 at 05:49:58PM -0600, Bjorn Helgaas wrote:
> > > On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> > > > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > > 
> > > > @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
> > > >  	  Enables support for the DesignWare PCIe controller in the
> > > >  	  Rockchip SoC (except RK3399) to work in endpoint mode.
> > > >  
> > > > +config PCIE_SOPHGO_DW
> > > > +	bool "SOPHGO DesignWare PCIe controller"
> > > 
> > > What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
> > > subject line and in Chen Wang's SG2042 series.  Pick the official
> > > styling and use it consistently.
> > 
> > This is my mistake. It should be "Sophgo", I will change it.
> > 
> > > Reorder this so the menuconfig menu items remain alphabetically
> > > sorted.
> > 
> > I think this order is applied to the entry title in menuconfig,
> > and is not the config key? If so, I will change it.
> 
> It's the title shown by menuconfig, i.e., "SOPHGO DesignWare PCIe
> controller" here.

Thanks, I will reorder it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
