Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD15CA9ECF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 05:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E983E222BD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 05:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JzpXs1Ym";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6talJ7w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E983E222BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJWXgabQGEgCy9NGSz+qQY2oMimoSKeWZ9nNFEMGvQM=; b=JzpXs1Ym8Jdg1t
	XU3DhATkog28pQDXJBfMx3/BSoz4psaRpiz57dQxnH4VWCNXXCFNe+lHItbYHGBY9GXkVXyBYtJ3U
	y37h7rGcU+zyiRxXMf1+GGnr414e/s+LvwaQdlQAsJBVNhSTUHcznkPjGpIOjpI8z8CcbEZiNp8Wo
	HlYWPeD1yektenXwgMGxzBlBvbdraDrOfxmslyloLYRU6dZMlPfEjv/5In9YhAKvxXp9hF/cEqCWk
	eUUels+eU4uGS/27mgOCLB6Kd1WCZj4YIwLEVf4lGSCUvxc+XRlANYE/PUisWQB4hxBEQJrcZz07E
	H2Wb1WVSTNAnfZeYE+0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLKlH-00021O-Mo; Fri, 18 Oct 2019 05:25:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLKlF-000211-1y
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 05:25:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id n124so1043961wmf.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XOUV6t3jirkU/o3kiBNxKrxEZIvkxKelj6Wk/Jg5/do=;
 b=f6talJ7wJw+pt76jatTkr/oYKwAQ7eEX4HAfDZHccy18vOTgBzEwtGY8dnwapGpOvq
 y32QjtHB74l6mxLMTT7eXl2GGEDoff2+wtZhwTkMV3brmWzlVz94d+hhbuCRgAk8y2FG
 ajkPfCdat/V8Fszly9vI4DZTJdFbomBSbLgzY+uHazLhtzSaikyL5Ve8cdfTb9+Okn9s
 2fbh9tr8Td31W4cnRRdychRqIpMNSrCPKdR7D7LzmHVYiGNrrCzEAMgQ1FpvOJUyEPFY
 xF3rlEwAuU63TXSAfYlntLaJJbpoPX+2/oHAgCcdaX3g8LO3A5+fdXcF0cogMjFktj7N
 twlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XOUV6t3jirkU/o3kiBNxKrxEZIvkxKelj6Wk/Jg5/do=;
 b=plaMGjUz93INKdILR1/cXBdMdmuysC6EBrwAP+YR37ETmpGSnpKwYCL7D/PzWVTh1J
 wYNyH17pMl6938WhAKIkivzeFl5NODntbczJidW3RNu82jOO8b9tykP8mTheoB1YorM2
 jLMwSYRd5GmKevyHR+I4ertTtAfQSEKrE/R2+nsHcC3Jyo8BBd082ecnUTaWT64jV79g
 Al01aW8mWPMWz/XOdhtjxcfQV3kZFh65C3OgVeHxwbCe+4mO+YcvbE6StW6gaRXWftc+
 kPc18cl/QXGkbm3zQITPK4nCYpMSvrCUnAzmJshr2LQhmMriVU4nOSsEluQRqXOCk80D
 ED7A==
X-Gm-Message-State: APjAAAUcfgFQhnq3+//pvMsndsPkXT68S9cfBFR34CjC3HJ70M7NL48p
 w+G4nf4nSgUj+Dsq1HAMkPA=
X-Google-Smtp-Source: APXvYqzsnrypTKGpbfgyJExRA8OA9ctZIryYpbseZrOOFSfOMgsfAEEWxdO7cDIErvmf948c93UzaA==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr5447793wmj.110.1571376311579; 
 Thu, 17 Oct 2019 22:25:11 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:f882:d2a3:f943:89a4])
 by smtp.gmail.com with ESMTPSA id s9sm4988206wme.36.2019.10.17.22.25.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 22:25:10 -0700 (PDT)
Date: Fri, 18 Oct 2019 07:25:08 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 4/8] riscv: ensure RISC-V C model definitions are passed
 to static analyzers
Message-ID: <20191018052507.l2dkdam2lam6ul2j@ltop.local>
References: <20191018004929.3445-1-paul.walmsley@sifive.com>
 <20191018004929.3445-5-paul.walmsley@sifive.com>
 <20191018040619.o3qb5fyj4qdevwoe@ltop.local>
 <alpine.DEB.2.21.9999.1910172138320.3026@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1910172138320.3026@viisi.sifive.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_222513_123380_1C0A357A 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 09:39:29PM -0700, Paul Walmsley wrote:
> On Fri, 18 Oct 2019, Luc Van Oostenryck wrote:
> > On Thu, Oct 17, 2019 at 05:49:25PM -0700, Paul Walmsley wrote:
....
> > >  ifeq ($(CONFIG_CMODEL_MEDANY),y)
> > >  	KBUILD_CFLAGS += -mcmodel=medany
> > > +	CHECKFLAGS += -D__riscv_cmodel_medany
> > 
> > I can teach sparse about this in the following days.
> 
> That would be great.  Would you be willing to follow up with me via E-mail 
> or mailing list post when it's fixed?  If so, then in the meantime, I'll 
> just drop this patch.

For sure.
-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
