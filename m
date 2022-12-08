Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E110DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQp4YVt1oRg6+QWjfbsomkkctrGlYQhr3gM9bze7kIM=; b=QD1j5gU48L0BbE
	HE5bSf8BUGo9yuppf/PBDu6NsdNOMFRbIOeCdQqxqWEs73xDF+WL0flLDbDmcuOt6IP72gpyxd/ee
	n3eWXd1ilCT49JQ10IxQ+RchxOG9eaEV7GXXMUcwQOBRsuqCTo485WJVrtdN5PXKyXqzz9puVUIoE
	Rlr+rhwFgjuO+icvxyVMiXh9pUYBZ1mS6iUwmxjhybfGhx5PnmKEs8yDRtYZZjOEHOa5+/icnu3eb
	2TsJzjLTce6lg3oZehnmUmTke9ZF4QTO3rU9OCY8dXfxekJis7pYJi2Kuk7kwZ8kLrhhjY8e4eE54
	mcugUA9N65wo/so95XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IjK-003EtU-Ea; Thu, 08 Dec 2022 15:22:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IjH-003EnJ-HF
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 15:22:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id qk9so4866400ejc.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpiJn7IvpkYsu4AkrtTH8oVTMfwxV602I+//8cdGxrc=;
        b=daEIfrys+ULBNo0EjbW/KdcRCUJo2ti7rI3KVg9ojllhP+jDWw8c5tFMe6jdnehg9l
         D57IoIXFD7I1Rhjbno03C1g82TDcjbFm/d/GH4tqh8Qj1WsFm0jIzpnP2WlB5+18ayRq
         EDJYHrdETHMZ0IPLZbCU/pDY1kf+oghzhnrG2sfJxGqh91eH/G+8kkDzIBnVNFGVtNV+
         1162th2H1fl8XBwwJB1kKuaTutw9Ao+QcTuMSgZQDzN1EVMzGyapY4WI++s+akz6iQER
         O67H0tahoWdZK0PyWwrU8mcs/ODVqXX7QeAMw+9QtCu/2nrJDF0njO0cXUxdgZolG5V/
         rgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpiJn7IvpkYsu4AkrtTH8oVTMfwxV602I+//8cdGxrc=;
        b=iJeRIpWWyyN1neMzbRd0OsmkK4DHGSvPjWgE5vZgQG5x2+b3LYcYYpKw6AEk6q+fYY
         WlW9Ke+l+o5fU5ti7NeuOogt8BNoT7eR7xid1mM6rUdyUTdx9CEiu2r3MDBCyqp7TnF7
         d1yhPVNkF+wprqXSjh5GQWFR1sx0f/EmedElxkFe7kmKMQEPy5GKNwGveaU2C5zl05El
         M1kI8ws3JL52TcPxnvZGlvtpwCNGERayupaFJpKC5oa3p5a5xGTN3JxMean8YpPweBXy
         6MF7TvmXQod4sB+xX3Bse9+Y76lrudiztaFy+523VylF8WW3nAg+ryBZ+r/7pG8sxaRA
         0C9Q==
X-Gm-Message-State: ANoB5pnefvzfywcKRn6oye2GG8l0dptgRZv1+uSUO6g/7G0DAMfp1Ht1
	4PotBfvyLnMYY/s+LdiH6a6LBQ==
X-Google-Smtp-Source: AA0mqf6p2hHx62nbpSEoBU79ul8uJ0Hkkjs1/bzGS5M1nA5bP1aBUpnaBRPaDmyKqAqAK8ny4XYhxA==
X-Received: by 2002:a17:906:7754:b0:78d:f455:b5c1 with SMTP id o20-20020a170906775400b0078df455b5c1mr2113526ejn.1.1670512949199;
        Thu, 08 Dec 2022 07:22:29 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id n19-20020a17090695d300b007c0cbdfba04sm7234089ejy.70.2022.12.08.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:22:28 -0800 (PST)
Date: Thu, 8 Dec 2022 16:22:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 3/3] riscv: mm: support Svnapot in huge vmap
Message-ID: <20221208152227.2xuevqxy7k5unsvy@kamzik>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-4-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204141137.691790-4-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_072231_601420_00E73CE3 
X-CRM114-Status: GOOD (  10.08  )
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

On Sun, Dec 04, 2022 at 10:11:37PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
> for Svnapot to support huge vmap about napot size.
> 
> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
> can be tested by changing test_vmalloc module like [1], and probe this
> module to run fix_size_alloc_test with use_huge true.
> 
> [1]https://github.com/RV-VM/linux-vm-support/commit/33f4ee399c36d355c412ebe5334ca46fd727f8f5

Do you plan to post this test_vmalloc.c patch?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
