Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E55C624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfKo3qKLUHoPXwphuGcVGtS+Kks1/uEMhep0iEBX7gg=; b=ZpY+aRiNTEd33E
	onu1mEDabcuWAuEnNKba67YHcKHcrK3+lCc7ZSTUtrIkJiENEhdgmLVl/OhiTQC30co4cTG28qj+3
	bngr8j1yDvY3omqbE2y5gKigp1lHPrKRoiErArda/7WBf/QBAM4ijyN//xVcJNQ+ukEf7ScCRTtBk
	qMouFHEfmbGCWRbpBivA7DH32VR33CilTk23ELvfUZGUufndFESJDKVVYpFVTxTYx+yTKjB2LwEAj
	0kuCIxtQHAZtUxhcvxri32cSpSXSZlcA0BDd9d9Me2y2CqiXVJV1G/3N3w4aDqg1DsVBP0ZHAMTi0
	yBv7Oy8ZxhgY4AvgkbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2rfO-000000049Va-3y2j;
	Sat, 05 Sep 2026 14:46:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2rfM-000000049VD-0e8O
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 14:46:49 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so2216111a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Sep 2026 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619607; x=1789224407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lIUHrxpa8LGuaDX4+74JSWWI9JDXZlTSaRdKXqmY6I=;
        b=FjWCq2NoxjzcnnrMR/np5ouDQOU1mKdFCPhyBSH7esMD11ux+44QvFyXAWM4oFqhRZ
         K2+vczitYJbQ6sRpbFyNDb2FIRGrYa7AJK0uzw9S25iwDs9EX3TLzyhFdRnaaJ3AQ2y0
         fxnZURc5I7/4o+qSSot/NAG1+tZNTyOa9CkDPly648r25Wt+ZjqpM/pns0mq/sYlRYkM
         EqnovvFEQztZcpY/GEVzNfaTONOan33tO3mC3fhng+ZIXG/bAkpHrNt3p0Znth9cJ1o+
         DAWTPXO/B9ed/AdmTVDpIweMHXCNeAegeDE4iY0iuPZeXGY20DBT2wDSy/hiZ+ar6R4h
         9vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619607; x=1789224407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lIUHrxpa8LGuaDX4+74JSWWI9JDXZlTSaRdKXqmY6I=;
        b=U6T5SXril/+DaBz14FvZk3uSVxu5P11gFotBNTlWIPOooj8jHtFH2UXJMIlCzV2fb3
         cUFjalXjNzdFCLLeVkqtN9NAV+qGD2iwpDGUCTmJ/RqWOjL4SwnDS8BYxKTVzlV6lU7j
         wolcdDpQ0Qe41p1NEOFkEtxPqE8W0391fpVY3ha0hXIO7qPIVErX90yJpeMk6VnpblZn
         NDnzERKj8aQFFIR7/0TxCcRQVpewdg9kMgaIreFwrx1J4C8WoKP4JEGBcVBpLW9l/te8
         5DVUvRD5l8OMzq+MK59MDMecvZjiNIgmYd5oveFf3nSmt+MNU9eqYS/5FSqoOP4wRyBC
         e2nw==
X-Forwarded-Encrypted: i=1; AKwUvBy/Ns/rZzRh2PsB9hkL+z9oppYJbAh5TiXODwpM6vX+wyP5wgu4H7qSp1xXnujhdLL7MdmJ1YexDS8QKA==@lists.infradead.org
X-Gm-Message-State: AFuF++lhN5hsaBuUW9xk93JILGgGkCujxgoOO+O7GKdnHu7Tcdqtz3UX
	I07KrTLHVdbxSt3m8z+TwZ+/QvgU+LKLEt9qeFCF/mfV5IIQm1tMJ2JA
X-Gm-Gg: AYBFou3r+50ktdPfWLB/G+lqXNRj3pLqraPwvimPx7oLG1+DSEs1ztcgBwmJR0bH37j
	iZ/Xe7fgh3UhkscNIxP6Kg3Kku5Gm7VWUEPF9JQnP5vvpoZgF7UxW5XRogSrtd9diSaGKQK1DIA
	Mk7jd0xG7v5XKxshNrxpxWca+yZLU/Jkd+tKYkAyN61itHX4TU4hrR81Xbro5WGkO1XFgRqrlg+
	cZ6fP8GAGuEO0hwAlsL9PTXrDKvCCaFVFtFnhNX2mdCjCrVJ5UO9ypsegBPqMPU72Fv2Jt4efZ4
	/u8MN2HZEmoDaAVYQAUA3xur7Mx+TTTC3WK9Sm65BZjf588x1H5l2zvvu5FMXBPPaKERTk1VWGy
	BRxh27Zy2akvRyHXDkgiibmwZxxPTCNtpryfBJQRW95S6K4fStzOKvEj1Ymi7o/cai7ldQtV8Tr
	anKWWskVNhtCLB2cccOnytvIczSwHUXLF2Z0yTVFN72IPhP/fKeEhauAbtBvLSrd2A+ANmd85wL
	zH6AbMicmA82KP4daeSaCtTshC8klKLN9LgIuy+J5IjuXVAK0eZ7PSbt0qdLOd+5HpB8eXIlyW6
	nj5ukRKzpkM=
X-Received: by 2002:a05:6a21:487:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3da39b58320mr21305071637.1.1788619606891;
        Sat, 05 Sep 2026 07:46:46 -0700 (PDT)
Received: from nickhuang (2001-b400-e2da-caae-e718-2aad-4c92-5b14.emome-ip6.hinet.net. [2001:b400:e2da:caae:e718:2aad:4c92:5b14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc467df7beesm843306a12.7.2026.09.05.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:46:46 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:46:41 +0000
From: Nick Huang <sef1548@gmail.com>
To: "hpp.iscas" <hppiscas@163.com>
Cc: Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yu Ning <ningyu@eswincomputing.com>,
	Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Message-ID: <apwrUYd3VybxbAm7@nickhuang>
References: <20260905134251.67210-1-hppiscas@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905134251.67210-1-hppiscas@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_074648_216463_713E6826 
X-CRM114-Status: GOOD (  17.29  )
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

On Sat, Sep 05, 2026 at 09:42:51PM +0800, hpp.iscas wrote:
> The ESWIN PCIe host controller is a platform driver matched through
> eswin_pcie_of_match. PCIE_ESWIN is tristate, but the table is not
> published for OF module autoloading.
> 
> Publish this platform-device table. Do not change the RISC-V host
> initialization sequence or PCI device matching.
> 
> Fixes: b593c26d081a ("PCI: eswin: Add ESWIN PCIe Root Complex driver")
> Signed-off-by: hpp.iscas <hppiscas@163.com>
> ---
>  drivers/pci/controller/dwc/pcie-eswin.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
> index ce8d64f..1bb4469 100644
> --- a/drivers/pci/controller/dwc/pcie-eswin.c
> +++ b/drivers/pci/controller/dwc/pcie-eswin.c
> @@ -388,6 +388,7 @@ static const struct of_device_id eswin_pcie_of_match[] = {
>  	{ .compatible = "eswin,eic7700-pcie", .data = &eswin_eic7700_data },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, eswin_pcie_of_match);
>  
>  static struct platform_driver eswin_pcie_driver = {
>  	.probe = eswin_pcie_probe,
>
Hi hpp.iscas

Since this driver uses `builtin_platform_driver(eswin_pcie_driver)`, it
appears to be built-in only. In that case, `MODULE_DEVICE_TABLE()` seems
unnecessary.

Regards,
Nick Huang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
