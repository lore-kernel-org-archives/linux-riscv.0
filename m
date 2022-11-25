Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC83C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8WZ9Qbw05WRTuYJSJ5Qs2PNrCbZwfnFGFXWWMmGz00=; b=1Cz2bFcAjpXxjY
	le0Gnyo7Y4RDX19vYSNaZmJp3RPqGD95xo2QSKKaA/A9EI88tAPEMLZv+2piaqlBxSfPgq7jhkgDW
	LsZ3cZo0PsJ3TiLUzWRjS3/GvSH7BFx+FK1MVzRAOnh7UgEw9BtbROHRXt6Z8NECfIpthV1bkJkME
	J1hHPzB7HUuOG4bA6OXi8wu//eIH7uMAsKRcHvp4iM+UdxDGuOUYutuVsxUOEYqoWAPrhXzAC1m0z
	CXnwe8y5gr11L9LSRXqSzKlwqr6smRtgDtreaX3XIkbMoAnBHOGubrc6cD6MS2PNaNICSpCVLCeax
	tDxA0oRp6gfdGa47zVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYj9-00GgCs-JO; Fri, 25 Nov 2022 13:26:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYj6-00Gg9A-0h
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669382803; x=1700918803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UA141tGZyiEAmJaA8GvAlkPxmTZrnS0ZPB0waL9l10Y=;
  b=XJw7j2Y+Zb8uJZiUTyr98JxYFYT+CHVsnHQ/cqhuYHuowASbXqaKWEgt
   DHk5YmgXyQVZZVqnmah9z++UnjMySm+dodpbj4MHBcHo0sWkqmnAr1jc6
   4b0F4O5KeTdMoTt4bTosxwiSD+BjESLPGV6BpogrVpvEpnAgShVVM38gR
   g/3E+JgUralS1Hz2e5SckVcr4p6k40lFDqR56bdrtUdUG6DYex/Jii6xL
   nTZYo3ej9OXxqH9sYNaY4d2NcaW8xr4LD/ocRU983FctkQMOK1xBeA6zd
   NgN8OignmU8VeZrOY5W6xauYypdjeH7ITajkkJ+6Pe2o7eREgus8ffsbU
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="125108547"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 06:26:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 06:26:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 06:26:38 -0700
Date: Fri, 25 Nov 2022 13:26:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in
 __ALTERNATIVE_CFG_2
Message-ID: <Y4DCfCR8RJR7tqvT@wendy>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
 <20221125113959.35328-2-ajones@ventanamicro.com>
 <20221125130647.rufk3zho5mdracpq@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125130647.rufk3zho5mdracpq@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_052644_150382_C4FFBE10 
X-CRM114-Status: UNSURE (   6.78  )
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

On Fri, Nov 25, 2022 at 02:06:47PM +0100, Andrew Jones wrote:

> I just realized that I forgot my slashes on these macro arguments.
> 
> I'll wait for other feedback before sending a v2.

While I think of it, perhaps for v2 you could yoink that comment
improvement of Heiko's:
https://lore.kernel.org/linux-riscv/CA+V-a8to-Wr2x8qbxnktTzXrWjTGvtCqwXT27A8EmHTTG7Lbkg@mail.gmail.com/T/#m92aee3a065a01a023e0960aec9c0acb8f9fcc77c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
