Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA48FCA19A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGg8Onh6FG4fu1BeID3kKEIHgGiNL9VQlLXfQ8olwQI=; b=py/NW0lGpgt5Er
	ZiwzUi8nJI/IJy6SZWdWw4xzNxgPJ3s80ex3rc5FHpTlKYjKdTArN/U0z4AJpdQ4b3bQBREjfEtyZ
	C7DZzW3HoJQmWtj7AiwkH0vg35sDGNxNx8lH41ake8+nGrx4xOuMxs4JSxvPsvJpXBl8o/Fv5dKQ+
	VY+9zAHu1QvisloF0DA0GFrGtiijn0de9+jegs4qsaZu9w005eeMVvIhFEgGkelsyxzzvD1GFMlTC
	H/TPqFQ7Ctgo+9oi/AH1UOuK+UI98yW8RQcAiiJbPIMDnPf05M2HTYP4Khxbxj2RuA7uaDq5XgFAL
	I18csHENzdRyYq0+tfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj5l-00000008E5W-1UqZ;
	Mon, 09 Mar 2026 22:28:49 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj5i-00000008E4X-1tvX
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 22:28:47 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-89a000f5adeso150983696d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095325; x=1773700125; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=X+vtD3KAc4drwuQDmDfYX24uK7kmtRWt5ggx20w4jufYhb6dQgP95CpCfBBztR99KL
         kCbzLOlxjhWEm543Db7wu47UvSwR0efBbcugyKbpVgXSSQnoKMiyI8To71RSDEt9Ln1c
         SGO2Bgx0SQmyG2PvLwPR6Z0nKLBZXaSBjzgVGWcxiRdmVNdGGkc99Mv4k0A6QpUAIR+B
         tn/oUbiODkOt/rS34zB7hdOPvuvwDMBDHQhVY5whw46nulnEWNNRLH0bnHrWpU60epVd
         rD3uCx2y5YSY0kcejnBmSEIJH+PL8KvtIArxjttUdd/kb5c8j5AcpTFmYb7UTA8Rhb64
         Qwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095325; x=1773700125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=EXQfoc3E583R7qt23NKgk8VKB5eBOfJkpdyJFBtAtWGhfJ/QYQMHQ3ckcRFoheXVIJ
         Wy1rNXwmi7hj/m7YgibXIrBeWNAE2ALwayk4ykgNv2yVFJIfDWHm3ymmTrKnD2acDUUQ
         RoubKhHRsLTalxZFZJIY6FGhxsCxFHCjf/CQ+dZttN6IBf5ObpnQdMc+dP5P7BzGc7S6
         y7VTt4N6wJgrgpRVkWkT4DlcfUYOR44or26y40l0VF6t9hanBWUUNXWiO5Doi1avSmkL
         FLWk8eSBExivBpQnqC50mLMVHI5PI2maxa/95qdPYlxMnU2hO4rDj5PtpoaHznCM0u53
         5E0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv3VW/LZWWvn9DGKUae8tMr7mG1N+pBFXLzJUVmGdNSWyTl51YfQnWcgH7NpPA6bvHIqvhPXHLFiARag==@lists.infradead.org
X-Gm-Message-State: AOJu0YztSr1XnsHbYEDwOru8+dLKd3tmLmGjLD9X6oAWYQszTH2Xilz8
	OiA3FUcem2ZKXznJNq0Bc7+GszvNV5lF023Q55tSjvZR5a0jwfQa7W9D
X-Gm-Gg: ATEYQzyUCEjcWadD2ggcWMTtq8AOprkx84ufx4ONh2ss2+VcDD/ndcCvIyyvIxfRoKp
	TFuJwhC4She/aJ6EsjnTfBDTJx5JMz4duMBubol+sXSQxl7KflU2+Fh7V+DYr+fDykpqwJYMkfd
	lOprIaF4sHTZKVutmX9GJp3R6Y9KbPx/XH9sEBT0SbeNM+a0E0Q4MeMVovg7nMncaNTUp4woePF
	DimSGFrYZ8pk83jNJ/wVRL0bbF9qu9BrldtGrCawElhs34+3qGWPZKncOpCSp7symQIZdxnAXz8
	7J1O+wsieb0iAO5z3ckPLXfraGJ+xLOzLz2XfDhM9kEL45T+L3j4WrJ/CKg/5EakJUSjlwtjDGf
	I+h63TWQIHK1ofiGnaY6DpnqWiZMh07QCGTh2Im5tn5kpJP9bPP+HvCoYrZyL48oZHvsrw1sn79
	8QTOF2dm3noe4s3/KO9a9Uuj8=
X-Received: by 2002:a05:6214:e4c:b0:897:255:d5c2 with SMTP id 6a1803df08f44-89a30a4d3cdmr192944066d6.26.1773095325119;
        Mon, 09 Mar 2026 15:28:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a1e68esm6918006d6.2.2026.03.09.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:28:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:28:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aa9JCWpJ_EJbUzXV@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152846_491362_9BAE3025 
X-CRM114-Status: GOOD (  15.37  )
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

On Mon, Mar 09, 2026 at 11:57:51AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 09, 2026 at 08:42:44AM +0800, Inochi Amaoto wrote:
> > +static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
> > +					    struct stmmac_resources *stmmac_res)
> > +{
> > +	unsigned int mask = CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
> 
> This looks like the last thing I can spot that needs to be addressed.
> netdev wants to see "reverse christmas tree" local variable
> declarations.
> 
> Please reverse the order of these two declarations to achieve that.
> 
> With that fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 

Great, after some lookup, I find the variables in function 
spacemit_set_phy_intf_sel() are also needed to reversed.
I will also fix this in the next version.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
