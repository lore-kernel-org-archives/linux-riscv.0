Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B2C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zudKnGMYVBgNFeORopkmdBI3m87iEBdzRP39lhZhxoo=; b=m8NoLerQZl4/Q+
	H1AGfPoYBYw2GqRbpPc4Lxl7JBg/LTh4DHSEK5KXPTW9VSj0OfzeyeGGbXYKuBb5T4L9boWunPcE5
	g3I6F0zl24lh4X6cJUOK16oIxiGMNZGSaGUDj/bm7r2BTdH4ED1EvzB3wscVkVWToqwiWrn0j6ueP
	JSgkmCoqh/ZmJ2kBLuEiC9ANScb3G2Bo7jKotaBHe1I4gkGJZF5BUjoP2p6J74R8WRdf4NxgfbQSM
	l1n+OoM3jubss+xeTshw+Vtot6CnWhglwLwTXyGuSrn/wCtMTkzgpqSZjiWnslkqj44Sos0yefiIF
	Rv3rRAtixNNHEMWWa8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01s0-009OSB-Lj; Tue, 29 Nov 2022 14:46:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01rq-009OHo-Ei
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:45:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n21so34300686ejb.9
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KiG5truOza4yGHW/YJc4GVs+QTaR7KP6zpQYmRX9k4=;
        b=Pn7C38fmI2y6m3hRQbrEsRn0KW8HG8WoDVpx39Ph1BYozt9EPQPjParJkEzWhxS58H
         VWI7vxHvh0lVE8M6MHeMZWNR4XjEQHLock9iiksqk7LCi0QcwJVtXyRqrNmMMLi6ln6x
         rOJwGJeBsG2iD/0cZ658jBCmZR7ujmKhb1y9pKnS1fNp+1ijNzryXFIIodpECCce5lGf
         VuqTz/Oip14I5/8JrZIEZ2Yd1YBHDLnLi42IF7ZAxeln5fnj8POUqgX3glbCVRSudhl7
         +CW5krIgeji0amCtDvDnRKA4Rgj4hoOhkSi1v0wu+zXH1f68MqJsJTRCsAPXGzSvL18F
         lyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KiG5truOza4yGHW/YJc4GVs+QTaR7KP6zpQYmRX9k4=;
        b=1LU0p6OLC15nJ5tadQRf/oBADMGblqTF1aPyOtHUayPzQe2XWalR6NsaVsWDU8MMx+
         5mcM8bMk5vToTLeHUoLE7QnQa6FuCYe+o5w+pFFPWd8hHXjHmlL2IrNmmZvmPBIH7Q9F
         lBUDwyFp+zulhtvlgUDwJqvYs0A3H4HI/t/70Jo7vVozAOSrWnvLUJbfqyxJvZBSeEyv
         P8E2VySJK0y2pw2DK/en71io7yPwUy82xyXuRdGr916pB8bH1EqQmX1ZR7NSrtZ07rPk
         mC4wmY4njt/0yc0b16FYH3WMKHl+iwEvDlH1w4gX5L+tWxT0vUZf3rZ7aNXeUk0YiNC5
         QCAw==
X-Gm-Message-State: ANoB5pmuwpVdsQYZVG8sr+zKOFQVAxmkqwMvqVSHfkAU0oxL/bo6+PTi
	+QqpVBRrzNyZJr/IZzWxWTLHGUimFV7tgA==
X-Google-Smtp-Source: AA0mqf7vTq/e4AMDTYOQP3C6P6tGw3a1ZaYMsMH/+OUcQDZvZOm9gCtc+8WvInvNzO06dLIupumUiA==
X-Received: by 2002:a17:906:882:b0:7ad:e161:b026 with SMTP id n2-20020a170906088200b007ade161b026mr43155309eje.760.1669733147410;
        Tue, 29 Nov 2022 06:45:47 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id c7-20020a50f607000000b00461e4498666sm6410577edn.11.2022.11.29.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:45:46 -0800 (PST)
Date: Tue, 29 Nov 2022 15:45:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: Re: [PATCH 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in
 __ALTERNATIVE_CFG_2
Message-ID: <20221129144545.p62id4ztwhcitfhg@kamzik>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
 <20221125113959.35328-2-ajones@ventanamicro.com>
 <20221125130647.rufk3zho5mdracpq@kamzik>
 <Y4DCfCR8RJR7tqvT@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4DCfCR8RJR7tqvT@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_064550_540255_29542C13 
X-CRM114-Status: GOOD (  13.10  )
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

On Fri, Nov 25, 2022 at 01:26:20PM +0000, Conor Dooley wrote:
> On Fri, Nov 25, 2022 at 02:06:47PM +0100, Andrew Jones wrote:
> 
> > I just realized that I forgot my slashes on these macro arguments.
> > 
> > I'll wait for other feedback before sending a v2.
> 
> While I think of it, perhaps for v2 you could yoink that comment
> improvement of Heiko's:
> https://lore.kernel.org/linux-riscv/CA+V-a8to-Wr2x8qbxnktTzXrWjTGvtCqwXT27A8EmHTTG7Lbkg@mail.gmail.com/T/#m92aee3a065a01a023e0960aec9c0acb8f9fcc77c
>

It looks like Prabhakar plans to do that when respinning, so I'll leave
that and just post v2 with the macro fix.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
