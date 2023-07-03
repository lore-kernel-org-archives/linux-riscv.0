Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC10EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 04:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mhlb3XqlaW2UTJwk3JH6mR4CNcdsZfPl98mHHsJ3BA8=; b=3J0ii0GSJzUybB
	xgn3LIbw1PvtoO+FKJuxZ+/8kRqYTMv546TAzr3EO0q6fnRNHK0FOHIoEO4O8QXlpF0JpWMWXOWKT
	qEUr0dSMdpIf17HAEpAGoIgNTUdTZ+i+GRYILpWUwcOEFWwtHP+qeUO+A77Q3SkPRSEzkb1+SFogX
	WWsQkUz+0HbWHBuTRNtO4ty8pL0cB8HSF3BzKLExULm87qzY5xBmhB6+joyo3kcgt0R9Y8qf7ur+K
	c1EAB3Exb7hnh+Irsw2S71OQdi9Kg0WqBgxWvH1fWXfkZYdKUbbzxZhC5DckUN5h/F78FCTFJ5APq
	RAyrcQkhWNNLZXD/o1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGB4d-009Fox-0p;
	Mon, 03 Jul 2023 04:22:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGB4a-009Fnu-0l
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 04:22:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b84c7a2716so19141095ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 21:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688358112; x=1690950112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yCyxORhZQcSjW6+wQb0JHG8SHx3C9xb2wsZB0KAdpI=;
        b=hrs8TxzWqVROATb1+OO+b2scKvbkRUaPXE8wiQC3gOk/SRBZqMzOVrYrs/f17rNkqd
         NywN86FFrtLqy8fAMv8FhNiblVyHqCyz6vpyZqebVrvgO3ev+tC/Cr38by1gy0KG70fA
         iZKR0qUNE2EJjOhywKGq6YJbVbpAvoDclCTraEjqcN+v/H4gbKfk/V7N5Ztj+uKHMSwH
         vpyLcw/nk4GmAR1AUZiMrfPCXtucNbwSEFzKSkyctwPD653hxDFnHtYc3bSRmNiPA+em
         Sn9tlpzPXU0uirbvBbONeafLp0kQ72U0lHiVMaRQUsIycH/5jX2iUvG89jTxTRzebevg
         vt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358112; x=1690950112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yCyxORhZQcSjW6+wQb0JHG8SHx3C9xb2wsZB0KAdpI=;
        b=BgJq0rDAyFbRNVHDNGsrk2N6vWlTRXyIVdqSkujgsqnW9BRUT+/aGiQLbQnx7WDF1Q
         7CmL7VKv3DVLtwIwqtoRLIejzpWBqvUPI/mv5LcxA33dSudUI9x09rZ0AocAaxoXFj+a
         6yiUtHOiyvWqI2561X+yrnQo+1Obk8S6JSr1/tRiPk5A6F9ApoIGjx6z2dOuYVnT9Byv
         uNnBZk2gpH5g421Bc+SWBYRLuprN8F3xnWjvtFbyJIeWYgeYRBU3y+e3y1I/QmUpJ84G
         L0150V11G9dqTIamhDNl8Dnp7hB64/n5fBo4IFLZG3ccjMzhBUtRfCqeBugH66cjWTBj
         llfQ==
X-Gm-Message-State: ABy/qLYk21W3Nd25axyZ4A8BJrCAi8dfZPFyz8F2vWjiKazU0LckIWK8
	M25R8wUP25O6qF4PDcg3YZfImQ==
X-Google-Smtp-Source: APBJJlEuGGj6sFTOjEj6zdUt3a4LaoFocfAFlTOucF+WBrGmLI99yG1sSNGh9BMAqTV7PHKonGRnxA==
X-Received: by 2002:a17:903:1250:b0:1b5:5059:e733 with SMTP id u16-20020a170903125000b001b55059e733mr9689916plh.17.1688358112035;
        Sun, 02 Jul 2023 21:21:52 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902bd0b00b001a9b29b6759sm14296207pls.183.2023.07.02.21.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:21:51 -0700 (PDT)
Date: Mon, 3 Jul 2023 09:51:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, ardb@kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, rminnich@gmail.com,
	mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org,
	lenb@kernel.org, jdelvare@suse.com, yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, geshijian@bytedance.com,
	weidong.wd@bytedance.com, alexghiti@rivosinc.com
Subject: Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Message-ID: <ZKJM1fG3JXEBApfj@sunil-laptop>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230702-headway-dreamlike-d7ba39ac4910@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702-headway-dreamlike-d7ba39ac4910@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_212200_285265_97405B37 
X-CRM114-Status: GOOD (  17.08  )
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

Hi Yunhui Cui,
On Sun, Jul 02, 2023 at 02:47:41PM +0100, Conor Dooley wrote:
> Hey,
> %subject: riscv: obtain ACPI RSDP from FFI.
> 
> This subject is a bit unhelpful because FFI would commonly mean "foreign
> function interface" & you have not yet introduced it. It seems like it
> would be better to do s/FFI/devicetree/ or similar.
> Please also drop the full stop from the commit messages ;)
> 
> Please use a cover letter for multi-patch series & include changelogs.
> 
> +CC Sunil, Alex:
> 
> Can you guys please take a look at this & see if it is something that we
> want to do (ACPI without EFI)?
> 

We have supported ACPI only with UEFI. The current booting contract
between firmware and OS is to pass only one of DT or ACPI, not both.
This approach brings another booting contract for Linux mixing ACPI and
DT which affects RVI specs. As per policy and since it can affect
multiple OSs, a frozen RVI spec is required for taking this patch into
linux. So, could you please bring this topic for discussion in [1] and
get agreement?

Isn't it simpler to provide a minimum UEFI configuration table and
stubbed BS/RS? 

Have you done a PoC? I am curious how do you handle EFI memory map
dependencies.

In case this is approved, I am wondering why do we need new FFI?

[1] - https://lists.riscv.org/g/tech-brs

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
