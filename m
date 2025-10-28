Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77006CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nq3N41jYv4EOi18teEt2LusIufOPaC5ex23ZB2MIYcQ=; b=p8Ha/ctkHtGxsR
	yDZcDj3AoI4TVYY7sTNejHy7xHEo4huklNv6RcqfyiJzCPadHxFq13SrBFlM/XVvIqgY7lgmIWxWw
	sjUDV+RXVF3HlmXh417aaPCYFWE3htSLzHhkc7GdHTbNht2q26A8J6eUkykUf8eBUg00ivN7x8UOK
	qpylR4B4XzhqExHM9VZsNxcKg+ZNYgDqv5bXvVUN/pGjQfCUohy8kvSZIZvj5Y0K07ohSuBuCwsUc
	WrDXKB1qzE6/SBtiT2Bud1tb62sUjIRRCQtd2NTpyyjHaNi2Yb5ZFDxT0FP9NY9CfilQwBUvcT8gO
	en2yXyYf/wMPkgMuqr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDt2p-0000000GnTg-1y2w;
	Tue, 28 Oct 2025 23:24:03 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDt2n-0000000GnTJ-2Llo
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 23:24:02 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ecee585f23so25019361cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761693840; x=1762298640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OTfru6F2MqwOi8D04rM0pc9yuTPYWyscODXsRwOPaw=;
        b=MWxkkq9CgIOud/EOQhbe258VJD3Hm21V/jeQmGfm/ZSUu8IwnDDZ1uTNPLc3NSAVGK
         hoE/cUoyQFYesMPm4BiX7SfJEl+3T+3O7NZqIyx4k52iYluZEht2Kv2buMh3d1GrM8A+
         X6lNvLuamlJCpuNyCgmb9zh5f86eJnJsRYa906N7/u6V5s3yjdUntynCGPwBUMU+Xpe3
         7YGkJteKYYQdCpKE9rL0NwUmUSxG0GDToA+DG549UzHyBtghSjKnB1TXACuRLB7V5hjk
         SFPgSCZ9yr1KOkiwQCPmCKLU+5U9gWvs6DoAOMKaw//eEytnII2QS+r772f/8WSWnzlP
         jcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761693840; x=1762298640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OTfru6F2MqwOi8D04rM0pc9yuTPYWyscODXsRwOPaw=;
        b=CNr6+7jhbj1q8N6yFE34V/kMMwLZGnpVI2vTPhwdUcoYFrcvkHsupClKUJQWDeyUjW
         59a8zPJiJaSsuuf+G/AWB0EIXnZNZvZLYZ9g6qFy22RfWZ3m7PkzH4Geh/gZuzD4Gs/3
         g0+K3Qts1e/zjNoUxQTMwRirgn+OUgN799i0o9gWwPwROQ8W0E9YTkwoY6OE5gxpnsQn
         O9uguAglDojRpK1PKELRQlHMs0h820ngiCws0olEZ+7F90/8WOM7WJJG0MnNsd6pE353
         MJBQMjdY1DvU7/OmwgN7rZkSejknemqgStub/WbMU+3KlCir3onTN1Hx86mZ9h+ymovC
         bTnA==
X-Forwarded-Encrypted: i=1; AJvYcCXtng3w0HrB7yeBoy05/OEku4R0WaBatMb10xRh6k1Pt1xawJZnynXKKWJ9SJOjIr0KOlAyJ3yjPQ3WZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw17L/cy7KgXHfl49bWDcZwBz8AUqKSRymq4b+ewpvlvReLvNfY
	nGSqTVLzHe7cY4JXaIqjKnwy4ck4gu0oe+7htFNHLu4jcGDnx5AVPFn1
X-Gm-Gg: ASbGncuj5hIMcY9I63bg8H7QO4REQvyLC83Ls4TBxzAQ+Q7VeXrbbQ8dQpQEEJ5pSbb
	dx5UtEzuK16owSVvMO2nu3Bpb7ssVnBnaZF+jOFNBsOYW30HLA/wb1V4ITuF8L/3jkA4AaVhW/W
	OffpK5+WrrRvZDwPw8iWeY2Y+LdDzIRm3PtoTeZBecoTp9sD2jPX3JVmQzFrjuYhTVl+QkVD3el
	V3UU7VpgBjCOKEVd4PEN84D5OIB5pISUyr2NuUKERRFiUdA3scjUfKGQlz1Woawt0UZSYin3oHw
	OUN5OZAEmxv8rNjRB8xshVd5h41ai+pO+0l4Wwb/eiT3BL/kQvtHo39rrXxcsCJBzEmLfHQGa3R
	WLkwPbSdj3fe8bB+qyp11dUAr+4LugW/yHkmF9qOYkIpG9EB17PwbcUx0GX49nDVbvcDbHZOz06
	ByyVJQAy/fJppJskFUNBtvKPrEYeKAj70wVg==
X-Google-Smtp-Source: AGHT+IGl/mFFQsS3epO7xa4Ze0vaEzgt45AdQHMyUoXToezCc+n8l4Ctnz9kWotaEaGAlioq6/UHwQ==
X-Received: by 2002:a05:622a:a10:b0:4e8:a254:c771 with SMTP id d75a77b69052e-4ed15beace8mr15238211cf.54.1761693840067;
        Tue, 28 Oct 2025 16:24:00 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37d68e9sm81382761cf.8.2025.10.28.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 16:23:59 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:23:58 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aQFQjnbfwU6pqUbu@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_162401_603801_BFB69539 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Hello Michael,

Thanks for your explanation, I didn't know it might cause an error.
My plan is it enable i2c4, uart0, and spi3 since those are the
default on the pinctrl mux. I have tested uart0 and i2c4, but I am
getting an error with SPI

[    2.423553] dw_spi_mmio 41b0000.spi: DMA init failed

Not sure what is going on. I have the DMA controller enabled and it
seems to be initalizing correctly.

[    0.732791] dw_axi_dmac_platform 4330000.dma-controller: DesignWare AXI DMA Controller, 8 channels

Let me submit v3 so I can get some eyes on it.

Thanks,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
