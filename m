Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A326C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 13:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQir/XCR26w6Uv/CYb+GyB1TBF1JMGSNsNNCR+UaW7g=; b=wiUSvKVz/fVLdB
	CPwcJCcu6jgUUmIk8SSLtCUP9EVk+x3EgTRpkGgcPzOIcAX1ruDon4vb7WRRK4nfm+5d4yLtB2T7X
	5avWh1GPugKyYgAE11/fCUhfwhVbclgC1mGf+v4a9G+VTw3FQiEuZatewOC8KA2Ssy0XC461KEvY5
	hUjp8Sv6QyV/A83aT8ftsfBdEuZH2k5uIT5DMQT7iKig96/bigIHfPGzJJZh/4DiU/dOc7p7QGdzc
	Ba0LGGROC1PRP1AuPnREHXTWRpJdEJ+0x+xMCexFzzJ4oXfN6gw5Ba5oBv9qbZ9yTts5Ou4IJgQ2S
	56xGS1kqt9668USTsmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEvh-004I03-4v; Tue, 11 Oct 2022 13:04:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEve-004HzM-FY
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 13:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665493455; x=1697029455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8RoWLFSAgy5Tr7o7PC0j+CfMRD/Jv0warDBFvuCp6tM=;
  b=WftLvkcExKkh1cf/gFBVsToI34l81+uEwrlljT3idb5qSCG0Jo8JWzi2
   UgcCFZ7jThwPwF+ZaKpuOu7S49mCqkyTTkjcdvjV+mdbvB5iWR+MZz7QP
   8rDQKLeiRcavtFkB+LZz4Hnqer0Glh8i3Tl6NVBeSiIJGCVCy/ktteW8J
   jr8bgEMDRoxaObESpKm0Nisst2PzS6YxMmS9ZASBM494vUuvTFMsKk7wC
   AQKh3ZSRBiBgf3u28/6LdfkWkIk8yckgx9jgu/S72BnEUFYdb4UByTqiW
   FqTJByrX8GBEbl1kKcfJGz75I+keaqwUgV+T90ZWA9SN1rbl0BYk9ZGLg
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="184194289"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Oct 2022 06:04:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 11 Oct 2022 06:04:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 06:04:05 -0700
Date: Tue, 11 Oct 2022 14:03:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
CC: Wenting Zhang <zephray@outlook.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: always honor the CONFIG_CMDLINE_FORCE when
 parsing dtb
Message-ID: <Y0VprlqUrSnDPQ77@wendy>
References: <PSBPR04MB399135DFC54928AB958D0638B1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
 <87bkqjk93q.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkqjk93q.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_060414_583369_DD978DEE 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 10, 2022 at 05:10:33PM +0200, Bj=F6rn T=F6pel wrote:
> Wenting Zhang <zephray@outlook.com> writes:
> =

> > When CONFIG_CMDLINE_FORCE is enabled, cmdline provided by
> > CONFIG_CMDLINE are always used. This allows CONFIG_CMDLINE to be
> > used regardless of the result of device tree scanning.
> >
> > This especially fixes the case where a device tree without the
> > chosen node is supplied to the kernel. In such cases,
> > early_init_dt_scan would return true. But inside
> > early_init_dt_scan_chosen, the cmdline won't be updated as there
> > is no chosen node in the device tree. As a result, CONFIG_CMDLINE
> > is not copied into boot_command_line even if CONFIG_CMDLINE_FORCE
> > is enabled. This commit allows properly update boot_command_line
> > in this situation.
> >
> > Fixes: 8fd6e05c7463 ("arch: riscv: support kernel command line forcing =
when no DTB passed")
> > Signed-off-by: Wenting Zhang <zephray@outlook.com>
> =

> Reviewed-by: Bj=F6rn T=F6pel <bjorn@kernel.org>

I noticed that the version of this patch that I had left un-archived in
patchwork was not the correct one. I then realised I gave a "LGTM" type
thing in reponse to the v1, about the v2 but nothing on v2 itself.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
