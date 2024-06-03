Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF24DC25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmDz1gbhGekqxye3Cids1p7Nbq+LvtByyUaX1TA44a8=; b=UcDz8qYmFmLEpz
	aLDq/wb1WjcvkKCeyyrwv6Ogg6gH7rACeaHrZQbhVLTutPuQ84yTWtJzQQlgKRuNAWvj2U52nJ2og
	vpFfmql6QiqlHJ5RB4ilb+v3beKndzM3FHVWjLMfXwE3L112BpX4T/wHMH0zAjhlm+Yj2z3Y16Ncq
	HcTXAvMA5/LVKuzsZFCxxbqy8eknveAH4iGhFf/rH6d9O/e7Rn0d6MwMITzabBW9zpNCUcwSuqpuo
	0G3quCxhQOyCdYRP5lOqvoG1F4oRJss25VbCSa83URGzXXcvbQuxNQV7585Kqcdrs+M0TFtJxDy5E
	lC/faM6rBmWo5n0FxxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7Bc-0000000GlK0-1X0w;
	Mon, 03 Jun 2024 12:53:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7BZ-0000000GlI2-3fcH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 12:53:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4213be171f7so8388405e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717419191; x=1718023991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bimdtL/8Yb4rbSFpMqz1UL6qiGEqUPhGsLy+D1hTls=;
        b=F9bIBSsXt0N+bNdbLluuzzeXoGy0oX4+A0ExwAPkFJrrzf6FGTTsyTUnUn5t2qRUpf
         i00TXom27ZJSC3TfucxrM9Mn8J085EOwqS5cb1DUo3JIpI8uWDf3aZGJ2Q4FPcERq9w6
         VEqF7eHA8Za4PZdu8Xw7bsIXDQPVy4DV4yr+CCTP9rHlnur2HFiYePqofV21140kgy3u
         /8UxYqfDv61nTln1q38q5qfGE0qrMO8eY0onJD644l8dPCtNlkaop2YZYEfPwtd70elx
         T7DyjPynNJI7E6wIPTzVLv9jpQwrHeAYmo24PCvGTjl6GxahAxvmJa0lTerzH2sFpuCn
         RpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717419191; x=1718023991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bimdtL/8Yb4rbSFpMqz1UL6qiGEqUPhGsLy+D1hTls=;
        b=WcWWW0nnD3RJOUy06cbjut5PmI//QtnRoqk9J/QzE8voozk/GVAjXD8/TzH33XrUx7
         /l7wPI903nH1GoQHy1aadR8B1nUtyz3Yind67AssPVCfFnYThDjOo4xo5UVFRXyWbmAr
         UNGrPz1PqHpUnYnYlvnHrSxo/X+LE5SrhzdUdG/Mkrq8tArDs+9SCj6kyo57k1jfHoqh
         pU8p1RVYKgz32f/oTi1LK6FG/nSKJ4gbLXFZxdSgiaFCK6VKR7dlU1YAv2kXB2gUx+jk
         DikrrdlRscP4vk715NoMw+yJ0QBDfnY+37urTuac+EB1GkwiWSci4NxaZnNQ5J5NPNoP
         zTRw==
X-Forwarded-Encrypted: i=1; AJvYcCWNDZLnQdARYRxrutyWE9XoBqVYZ/QR/uOVfgv86TK7HJ8yhZ3hTDV32S+m5fWeAlyvpJkeQaQSRdJB8RMzng9dgs1V3xKMwrhVWxmzlNx2
X-Gm-Message-State: AOJu0YybIfaF95YDv57e0djhVzqkkjiG0SGXWjO/tvJ58FV1raBB8SXW
	0TJGAY5GY8dr8z3S7vU6PsyDMrRtwb8SNaKpPAoRA0bDxrSZrs2q1qsSpMAK9Bw=
X-Google-Smtp-Source: AGHT+IGr2qULxcr2ltWgvnytabKWi1pfPCuyLwlDBqb6eNha2uciqvGkQ3OnCBvDSIF3/JuDzfDAZw==
X-Received: by 2002:a05:600c:3510:b0:421:3674:7933 with SMTP id 5b1f17b1804b1-421367479e1mr41938045e9.27.1717419190599;
        Mon, 03 Jun 2024 05:53:10 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35e5e3d1902sm1783031f8f.32.2024.06.03.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:53:10 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:53:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240603-c4a8257697f83cd3bace6ce5@orel>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
 <20240529-08fd52a8e703418142bdfa84@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529-08fd52a8e703418142bdfa84@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_055313_931604_17836412 
X-CRM114-Status: GOOD (  12.33  )
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

...
> > +/* 5.19 Performance monitoring counter overflow status (32bits) */
> > +#define RISCV_IOMMU_REG_IOCOUNTOVF	0x0058
> > +#define RISCV_IOMMU_IOCOUNTOVF_CY	BIT(0)
> > +#define RISCV_IOMMU_IOCOUNTOVF_HPM	GENMASK_ULL(31, 1)
> 
> RISCV_IOMMU_REG_IOCNTOVF* for all above. It looks like this
> got renamed and the header of the spec subsection still has
> the old name, but otherwise the new name is referenced.
> 
> > +
> > +/* 5.20 Performance monitoring counter inhibits (32bits) */
> > +#define RISCV_IOMMU_REG_IOCOUNTINH	0x005C
> > +#define RISCV_IOMMU_IOCOUNTINH_CY	BIT(0)
> > +#define RISCV_IOMMU_IOCOUNTINH_HPM	GENMASK(31, 1)
> 
> RISCV_IOMMU_IOCNTINH* for all above. Same header with old
> name spec issue.
>

Scratch these suggestions. Based on IOMMU spec PR#243 ("Clarification
updates to IOMMU v1.0.0") it looks like the iocnt* names are getting
fixed up to be iocount* names.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
