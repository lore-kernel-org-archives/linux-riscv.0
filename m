Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB6C25B76
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ep+E39Ijw/HDDxnWpL05bIKdh1qnxNeGcuyvyfz7rdc=; b=fmkVmQUZIHHp0v
	mn9VSHMS2+pbddh3i3sym1ZWgVWSMVbO2IIH9JnPsgCSZ7RNVTh8cn1DAOnapwo/1yQ2ImtDYex0V
	vNZ6LBO8T0tm0cknfWtaxRN2DUJQ/I2gc6JZTskjCWdm2SWu2/9NF/5KNkw1JePnfmIlsp5IgbSqr
	6naZ2pRmBSV9BsJwMboIKnJX8Xlhw3BPPsYwUxmynhXxwyKLqJ8uhfBXieh+xLDLuMNmJa/Y3CiUF
	j/dgSlkkoamXggZSGwTEQqV87kurQt1k3WV37HRPhYPSp+vxCHoCBGNI7iis9sdGRFjwRZlWmm0QF
	gp5DLBWsWrEyqhgACdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Hp-0000000Gn26-0huF;
	Mon, 03 Jun 2024 12:59:41 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7HY-0000000Gmtq-3G3q
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 12:59:39 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a692130eb19so79955166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717419560; x=1718024360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcEqjvHDHPrKWRNXO1NAMZemLV5LQ0B+lnFn7VKosBA=;
        b=GKR6SAmIrqxxGwqzA/Aa9uA89RGiZPw0FuFc8Nz87foWp+QgSIid8qQVrzzcdVjrfl
         qlsWkKSiiC4V7qmena04uULiUTOzwhEpApQ9qIRoRNIiQl3vUcHTYWY1RU1sGm+evBJp
         zrziYzya90V2NAqvlShXPOfXWCE/AVxRcpfgoCU77SWDt1xctXerLn3up+BsQyVgr2N9
         Clrjs/FXoRt1MTBGxYPs9F1PDt4ox6tLzpvk4gkByRfI7e8s/wJB/ubJicxDIT7gyXQG
         QXRBwa9oFdBjLmG0Eidd4qHJOTsKksEZBqrGZ+Ce/GQfpcoszNNdFpHT/FbOtxTXSY0h
         BSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717419560; x=1718024360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcEqjvHDHPrKWRNXO1NAMZemLV5LQ0B+lnFn7VKosBA=;
        b=fLUDwDlnPZsKUAFK9hiKZMtvcK3NeQ5Ri0zgGdj3oFCZRwvq6HWix5RBh3Re9aMzoi
         DSQ60wMz1QfMh0y6W6Oi5CUECjWqqa/YPyzZVheudrieXkZOGhX261s9BXZbmDur3a+s
         VaOVU6n13YGYVGebXejcLgKCSnptBRXNgSavGugxhflMlIGEhfvWd57hbfCF45tc+m43
         ubtpyxd7PBCPItt30s/0+EVHbTxnRQlSKlkKwgHX1o0B7fueuAjl1wPMTFyIfjo2tgZf
         eg33u2HOvS6F9xtokof3SHNjKrU/eObjDFCOAYWSg4Iyz8FBgmCeJAe2CZbjFX2YssbY
         Da7w==
X-Forwarded-Encrypted: i=1; AJvYcCW90CiYDQzXLMJE+vicbXEj2BK4OAcrRoq25UKi/felH6QhOGfZJykcd2E4/+F9BYTYiXUa984toV6fRtewRozPPiy/7HGMjSQrpjVVf8M8
X-Gm-Message-State: AOJu0YxfoI80vyPu5xmohnJ+LM2gUF1E8E3TUvnHFf2aiQ5tT6YK6AY9
	PufAxv3eiYp0aCoArGucsCr9NGOwYcAxkeUp8A5XYEcYBZjOkda/LEM+R6OjhnQ=
X-Google-Smtp-Source: AGHT+IHqmXxSxhfsZ5QLcPFpeXSzCRtTW99BPDOeKz6AZRkFkj434iSsteZACpuRGmGnksN+E2iRiA==
X-Received: by 2002:a17:906:d7ac:b0:a68:bae4:d66f with SMTP id a640c23a62f3a-a68bae4e717mr359112966b.30.1717419560024;
        Mon, 03 Jun 2024 05:59:20 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b66c0c87sm347330266b.73.2024.06.03.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:59:19 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:59:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240603-d622cdac0016f1f854bf2b4c@orel>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_055924_957657_49C14EA1 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2024 at 12:34:42PM GMT, Tomasz Jeznach wrote:
...
> +static struct platform_driver riscv_iommu_platform_driver = {
> +	.probe = riscv_iommu_platform_probe,
> +	.remove_new = riscv_iommu_platform_remove,

Hi Tomasz,

I think we should also support .shutdown (just turn the IOMMU off?),
otherwise the IOMMU driver reports EBUSY and fails to initialize when
rebooting.

Same comment for the PCI driver.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
