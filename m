Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D509EB3641
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faMVwcOgaRAsvTBoD+aQZZupSroq+eUOEvXxyNXz7FM=; b=0wqE7Agl77O1d0
	+MExyGqJmKTibR/ouNn02RKUxVqcNAiELh81opzd8KD5oimIRFkEKhKgOtDNRqewn+s5aDkjJhniZ
	WI7Ffz0rK+N12uhpz+6oHGlnYhlCqGHZXebWfP0GagBpeNP7g7lJ3W71Mx3eNk6kC0k03vHNdt55l
	/r/KlkQ7Ed7bJ9ewVixVtwAp6mOhpjK7WKNNcAz9VxzybjlGYCDpLWPEfrNHFngUaQp0VJZLinOH9
	iOoOpQQ5CovNozAKVkCdF2KydV/TbZ94cjdGPj37seL+VgKywwbCM/TAv9gckghs9jP8uF5R0TNnA
	6JQ3jDedtSuJWyPD3qZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEc-0000000EJNW-2KTU;
	Tue, 03 Mar 2026 01:07:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEa-0000000EJLL-4B8z
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab46931cf1so39838475ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 17:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500056; x=1773104856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=PffRCNbm3Ght3DBDzWLuTlchMXUdWWkh6bkahq7kqj6S5+9r1AYhcD3VNmpR6CACbl
         sw8Chz/pK4e9S3mh/VMS5WeTCILYdFYJxUstjTjiELoocMvlPYF9PI/8khhP6gzSpART
         IpnO2CT68BGFg1uekNfd0UldsTw9isPXM8OvCVAqgI8VXArPUgWYp9hlrkzqxVsQVbUU
         BnoTX+ZX+REuYS8QjupDeEdDCv1FmyiFgxjYfPGx05p+NqRq4nDCtEGlCNQrvLHAmGbF
         NzOUH22Ameg/iQTZtw0Jc+TYGNVPL2LI8ttjN9T1x8GRyXQjYdXaXI6pXgs/3P2mc6fz
         xUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500056; x=1773104856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=j1Xy/RbzbfhnrQtFrpWQupyxhjv9pIRh3017wqXQKUBMyJ1COCbWdEjRz+O8sPR7qy
         0GdjVIvAifGRfbimoFaeBAFnLCMwm7k3Ley9v0vl/mgNIxQgjtx4J08uiLYheRcKyS0L
         n+aOc0EHDyUUovYHGhFEe6rSJ9vUSYClnSwjRJxV0YXoHxF9CMC1xEEdgQHXLmTVcF2p
         BPd5+R4DSeT7nBogtXQ9UW+1LqFhDqFwAjM3CIldBAn70kqgF0cn1Gux5ivzeFQCr3UI
         CJdy/dF+MI+qrbMBHi5E5NGExjZgnZjnaLTYY0RGc2OMRsdgYUFjAyt1eMr1Ih52LQDG
         vpaA==
X-Forwarded-Encrypted: i=1; AJvYcCVa7VnF2CAx8FQTc8jrzojCC5/2s0/5DxNrg6XASohgr7iJSUCs+b1lTDOUat/dduMwdhAa7VtGGEQfXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxws5dEwxNDqstDHcX55bnF3zQaZ6362KxFfN12DTYkku3P1hD
	eN5bLqv8yfEnSAHZ9L6gu5Xo8vl5+5VT6vd0FO3mh6jzDI1Csze3z0az
X-Gm-Gg: ATEYQzzQSxETl6PNCp+SsBjS5iJfmZa2/WBiQLZNwzeVF2NEc7B3zIir+el+zo513hS
	neSL557pR3mSEtK+PHhl1hnxmlJL0Iw9EXME5uDFedw/IEvWz/p86q7dMcu9tPqyFiC8rbU3lY7
	QG0nFSDe1wjkQiH1Ysisw/4x1ChPW53BEuGGeL4JRBm9DztuZpkGV0uQb2Sa7+qeOxSYAJFPhEd
	mqlIbzYtTjGx8fVDYMLM/jvQLhfrdMbL9qY8/tyufOMdeoLUi0bZl2EwNZfysnQVMJjKaKCY58/
	f7vww1gdDc8pl4z1SXPnq6qQ1bqB11UD65LNlg4wI1o3ZFyZN5j0Th+qSeEBWR1ZlKAxMOySqbx
	ypllEq9o3hRcRmd9utEDnVWSFIVhB/CRV9fCK5AFycODQszoxNR2CvoXVtv2nAy6NHnL3U2VZkF
	0u1OasDzbW8dKmJW7W9R/Uyw==
X-Received: by 2002:a17:903:4765:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2ae60c60e17mr3650915ad.5.1772500056123;
        Mon, 02 Mar 2026 17:07:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm146608315ad.91.2026.03.02.17.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:35 -0800 (PST)
Date: Tue, 3 Mar 2026 09:07:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aaY0KeKuFwM-5wuS@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <20260227075718.2243818-4-inochiama@gmail.com>
 <20260228131845.70421792@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228131845.70421792@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170737_037709_3FF43445 
X-CRM114-Status: GOOD (  14.46  )
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

On Sat, Feb 28, 2026 at 01:18:45PM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 15:57:17 +0800 Inochi Amaoto wrote:
> > The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
> > MAC (version 5.40a), with the following special points:
> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> 
> checkpatch says:
> 
> ERROR: "foo* bar" should be "foo *bar"
> #110: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:45:
> +static int spacemit_dwmac_set_delay(struct spacmit_dwmac* dwmac,
> 
> ERROR: "foo* bar" should be "foo *bar"
> #148: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:83:
> +static int spacemit_dwmac_fix_delay(struct spacmit_dwmac* dwmac,
> 
> WARNING: line length of 99 exceeds 80 columns
> #243: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:178:
> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
> -- 
> pw-bot: cr

Thanks, I have updated a new version.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
