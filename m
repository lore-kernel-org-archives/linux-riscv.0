Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC9EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDOH5kmq5dTvOlBHz7hYEINy5LQf8/CIiajxrq5bzTo=; b=IryGTCgYFralke
	spmsSh43+yQJlLnY6mWDsUB2i6RFuuzTl5BLmapW37pCsI1zlQhlM/n6fF79WSOal70aRXYPiaPCa
	k2THr85UjczE0lM8hgD1eI1NGIFJ06KFi/nilTPDsP8kRZ1bdkZ4OVpkucu2ufkVzy8QkINoHP7HX
	yOVVyy6aivtwz7bEa9+QZvBD/aMoLrbJ+5y6SYcICd6PneR6URmbLeN+POLBd2T85XhYKHBIOfSIM
	/b3F8IDv8/VegAjYQU4sJnU87nAOB2Zidz5ip9itbH4fAM4kCg87bN6XFAHw7NEHrvACj/DU5tr7v
	4ddvkKnM4wP4UtNqHPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCO2T-001KfM-0d;
	Thu, 22 Jun 2023 17:24:09 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCO2Q-001KeX-0p
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:24:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98d2fb1bb23so108555666b.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687454643; x=1690046643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7NlwJWhRn9vHCeh97jNIwU31z0pZlGYxYgOuGVCJzI=;
        b=dvJcLE41E36YYhtUQ7PHGfwyAcquKBKIJIlyikv838sTlsaqDoPFbYGMCezfpxq/x7
         0FebxD1wbfRTwgHRwX5iwd5wHAutXUzl+ON0b36Cue9o+0FSeeIwgSEgjLK8iEqaTM53
         0hphiRi+FdMFlv9VOsnV97CfvqiH9Hk5obMLsmY5nMQcY7HbA+hdCM+6oJnlQgrRht53
         E392BMbVXiXyO10U0h9+ewm3Nu4sFjNkdLPB3cNFcV/u/E/BXBRKtipXoeNTQsaQ7Bwo
         Ze/XO/y41b8Hl4M3NrITrqybEZNrXZ+qBPlSbjJFTy5VYnvoHAcMtph9vE13v3SFFsJA
         C1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687454643; x=1690046643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7NlwJWhRn9vHCeh97jNIwU31z0pZlGYxYgOuGVCJzI=;
        b=Vi9SmAGIc1I8o8bjL4PpD7lB+p57lTHVAocr2yONw2+rwgWXUOMwqdhRa5oQUODhmD
         gxyc4VfZJNqD40qJZq1FZ9XaB6e0r+VCP15zbXOfKdfQcVVTtGKA7NufuDSWtNbQcA9u
         iFRLoz9tIwOxmpjz+abH36glA5HWtRMn6224+iOaXVdaOKviNFnQMVdwCRwqGfwk01PI
         nrQNtumtLktJ2hquGFuEnzRv4XLSjQA7o8a054j6+2WgD2A3Qg1S24RZtR1knbUymP61
         qIL0f7ID6bmFbO1yFPEKY+n93AAtzj+D5TIiZkhiEiHvF6MbJzeZfji8IxtmhbQoQ6O2
         p86A==
X-Gm-Message-State: AC+VfDyJ7DeuiOuaeSp0kGgpV7rb5FsEnBVmEOUui9FkT+T7EaheeP9g
	b3tM0RDWofZxDWZ8QCiwsKa5yA==
X-Google-Smtp-Source: ACHHUZ7P3Qy5Z4td/nDkOO2K8MDAWad9Trpj9+x3B2xC+pr7mISzhOGHYtMtsPwiPVOnhaT68CrZhQ==
X-Received: by 2002:a17:906:4793:b0:965:ff38:2fbb with SMTP id cw19-20020a170906479300b00965ff382fbbmr18956070ejc.1.1687454643258;
        Thu, 22 Jun 2023 10:24:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lu4-20020a170906fac400b009889c4bd8absm4911712ejb.216.2023.06.22.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:24:02 -0700 (PDT)
Date: Thu, 22 Jun 2023 19:23:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230622-4af59422f118ea634836d351@orel>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621-d6da578719f8af903d6746ef@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_102406_313341_588CC20D 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 21, 2023 at 02:19:50PM +0200, Andrew Jones wrote:
> On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
...
> > +Hardware description
> > +--------------------
> > +
> > +The firmware can pass either a devicetree or ACPI tables to the RISC-V kernel.
> > +
> > +The devicetree is either passed directly to the kernel from the previous stage
> > +using the `$a1` register, or when booting with UEFI, it can be passed using the
> > +EFI configuration table.
> > +
> > +The ACPI tables are passed to the kernel using the EFI configuration table. In
> > +this case, a tiny devicetree is still created by the EFI stub. Please refer to
> > +"EFI stub and devicetree" tree section below for details about this devicetree.
>                              ^ redundant 'tree' here
>

Can whoever applies this drop this 'tree' I pointed while applying?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
