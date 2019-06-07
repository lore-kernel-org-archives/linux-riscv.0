Return-Path: <SRS0=Yvo4=UG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7ABC28CC3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 05:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF00220825
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 05:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcMHOuom";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g4C+4UQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF00220825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZPUnWlYGUfPgKMIcY29CjXQLZU56AL1RkokfvzDghQ=; b=pcMHOuomBVHI/e
	hWtuxAOe8hQLSt8NLverfMS+pEieckRM52iaR1p2DuWdT0TlStVKixFbsA1JgT6s4Wi3Hq+NdSErh
	iLWbxbiw88DUKR5RPIE/1bDWzbzmy62dyB2UAUAAVvsp12hnguYaWT0hnkWH13nAen567vzqjeklj
	K+PYDs0dieDC5sna/4kDiR9lPuu0KEC7RsfNeszqd0pHmnqv7I8q9NLUlO4gwbGeuGbQ2Vs+BYOqw
	MlH5MunCuAcExc7GYaWtCNOBow+SLqusmNA4c3egti56/2fcQQ/yzrI31qaWIaJ0NhBg634ovUNvp
	R1rrmO7hvsKGU4ABO1eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZ7Gl-0005Dx-Fe; Fri, 07 Jun 2019 05:18:27 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZ7Gi-0005DH-AD
 for linux-riscv@lists.infradead.org; Fri, 07 Jun 2019 05:18:25 +0000
Received: by mail-yw1-xc41.google.com with SMTP id v188so237931ywb.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2019 22:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=eoRzeYAqZlJbfZh4zAUKVpebco1RBz3PtP4CtRfM7Do=;
 b=g4C+4UQ+G7+n6CWfezVr0aU+9R1Vs3kM5/Tj5EFf6GBfexZsW6nX6JNP9adG0p6i8E
 wdXtGRA56JO+0eu/mflysRFrPogTbP1VbXwahD9ERnp4SBGOQgNpohY0O+STd85SPZCp
 0D14mot/I51dgtzY0kdlj6gVSirT/x6IcLJuMI9bSG0KelC8dSDTugSyTE8CxMTWJR4T
 lAEbZ/iVjEfTfwuo/+JgN643SkO2F17oJ8v5n/4u0m+pXbefmLimiM0bmwM2A8TE8Jc/
 vr+QMfSFfpIW0fC0zU/TzqEGHSYn59mw5RLpnIfbsfqGfxzH9aOHqZ+szgn4zGE3IyX/
 3b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=eoRzeYAqZlJbfZh4zAUKVpebco1RBz3PtP4CtRfM7Do=;
 b=A1CW80yCLsZFTlAze6+YBb3iBN5BPaDEz6xAgFtJqSvG4n52asnG7mMi9sJatUyrTZ
 b8tTPCf6VNWfNtD30tFgAuNW7jpNC4HsHGOSTh/kdim8/P3G4P5MWkCzCfVRoBkHfSBM
 1Bvy2TTBVReAtE1fvagygE+IZQkp19RB8cI1H4zNRRMdxkUhZgrTah1cbmWOIw3DCIsr
 o7Zva32KUdPDMiTU2UHnZq2LTkmz5EoQcguiYI557KB3+QVTIpW8z72q9eaeFSxsaljG
 MSHEVfrYeJV4BgqTLj0jiH0xUYSkZqUBatqX1OWo8ldaK5ykA+H4lIJS+M/x+MgQ8VOt
 YWmg==
X-Gm-Message-State: APjAAAWVrw/ikADo/Jq6lAB/5G7XeWc8TeAVm9MYbtR9x/YLnjCijT7E
 bsiGlrxiM7IkJSKCfj2O/2jivQ==
X-Google-Smtp-Source: APXvYqzRtoKbEdmGiDBrHOJnawjQHJ5r7JhN0MHE+bODwJs8PBihqGbMjQEf3g9xcuXnaW8nrha44Q==
X-Received: by 2002:a81:2702:: with SMTP id n2mr17821596ywn.464.1559884703085; 
 Thu, 06 Jun 2019 22:18:23 -0700 (PDT)
Received: from localhost ([14.141.105.52])
 by smtp.gmail.com with ESMTPSA id 136sm298723yww.63.2019.06.06.22.18.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 22:18:22 -0700 (PDT)
Date: Thu, 6 Jun 2019 22:18:18 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/5] arch: riscv: add board and SoC DT file support
In-Reply-To: <7h36kogchx.fsf@baylibre.com>
Message-ID: <alpine.DEB.2.21.9999.1906062216220.28147@viisi.sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <7h36kogchx.fsf@baylibre.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_221824_355514_A87E8F47 
X-CRM114-Status: GOOD (  11.38  )
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

Hi Kevin,

On Wed, 5 Jun 2019, Kevin Hilman wrote:

> Paul Walmsley <paul.walmsley@sifive.com> writes:
> 
> > Add support for building flattened DT files from DT source files under
> > arch/riscv/boot/dts.  Follow existing kernel precedent from other SoC
> > architectures.  Start our board support by adding initial support for
> > the SiFive FU540 SoC and the first development board that uses it, the
> > SiFive HiFive Unleashed A00.
> 
> Tested this series on top of v5.2-rc3 on HiFive Unleashed board using
> OpenSBI + mainline u-boot (master branch as of today).
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks very much!

> > This patch series can be found, along with the PRCI patch set
> > and the DT macro prerequisite patch, at:
> >
> > https://github.com/sifive/riscv-linux/tree/dev/paulw/dts-v5.2-rc1
> 
> nit: I only see this series in that branch, not any of the prerequisite
> patches you mentioned, which made me assume I could this series alone on
> top of v5.2-rc3, which worked just fine.

Yep, just forgot to drop that part of the sentence from the series 
description.  Those prerequisite patches were already merged.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
