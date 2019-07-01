Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2251BC5B578
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 21:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1B321479
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 21:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOafjKC6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EXlI0foU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GRa+inB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1B321479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1rtUn5B1ksEQ8eb/KIRE071lZfbGxiuijQSDzGyJPo=; b=rOafjKC62ZjozM
	18EGlfuLG5vD2ouSKjyNm14kDAY3vpy9O4V5bYRGLeRBHOld1y2sn5E/V8JC9gRl8R8R5WtwXDnaO
	bVJaDTiOjfhVQ48j/tGU4vrcl7ySlbL/TlOBWFiwsChVGygkAx8Q96x/0D0y7tn0W2bUksCBbrSoz
	6/VP09jzWuh1/glvwJnrKZy48e9vgIZNApMvSvu2EUI9+NGrt5iPXRzVE5Jc/0U0QJ5wErGDAJr7h
	oTcihLEFUNLL7NrFDQLQGCO96zCgXMPJ9Tgf/wGBEKzNbp4Rq9dVpCDJpj9VVCHXD1yydWeQwAHTE
	rp9HRFIPph+VVhbiI3+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hi3eb-000644-3A; Mon, 01 Jul 2019 21:16:01 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hi3eY-000613-Ab
 for linux-riscv@lists.infradead.org; Mon, 01 Jul 2019 21:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562015758; x=1593551758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IbtMsfLcN3s/J+PHWScrjDaYBa9bajLydbe7d3ZJnMc=;
 b=EXlI0foUVYxqgL2d7LPriZRQ2GmUJv7xOpVaAY+G9/EXLf7ORqjUcDD1
 6PcZuXS63sW1AxVQR9xJlMM3PSgx6FUy7shybB2OlveVhRAjLBknNwKvC
 +2o3sXq6A2soSB+00PrJLr1Ot25d1sV4iu/E2euhtt/wN73+UHNrr4mJk
 PYNq55RDEvVRB45lOYaBQv0V4jsFcXT9o7ASaI6nUTigl0FHoBx0l4wZ/
 hVRzlGGdIli4noNQJ08rCfzYwTiLDZCe3suTcoV8/L61YM5lLn/4tLoF/
 bApxWN5u/E5lvY75Db0fXgLZtsJFxVeZLVfnFTC1reWNUV639Z3Yeu693 w==;
X-IronPort-AV: E=Sophos;i="5.63,440,1557158400"; d="scan'208";a="218375144"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2019 05:15:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbtMsfLcN3s/J+PHWScrjDaYBa9bajLydbe7d3ZJnMc=;
 b=GRa+inB9CWIMUybDRtCV4CCPvkLNV/t/5J4WcyNj6FqP7ItxA8sv7sDSJfbqcvlVCLTPD+XPaqiK3R8BwU9Bc3R+4ZVEm6TMT9Ji/bhRvtMy6THZSzj57BquC7gM98LIDr1JnUzLMyBirX4GQwPagvsXVF1vZqiW+NhTVU2sfx8=
Received: from BYAPR04MB3782.namprd04.prod.outlook.com (52.135.214.142) by
 BYAPR04MB5511.namprd04.prod.outlook.com (20.178.232.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 21:15:51 +0000
Received: from BYAPR04MB3782.namprd04.prod.outlook.com
 ([fe80::65e3:6069:d7d5:90a2]) by BYAPR04MB3782.namprd04.prod.outlook.com
 ([fe80::65e3:6069:d7d5:90a2%5]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 21:15:51 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "hch@lst.de" <hch@lst.de>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>
Subject: Re: [PATCH 10/17] riscv: read the hart ID from mhartid on boot
Thread-Topic: [PATCH 10/17] riscv: read the hart ID from mhartid on boot
Thread-Index: AQHVKk/cfMyx94L+NUaLXWJqaXxhu6a2T7EA
Date: Mon, 1 Jul 2019 21:15:51 +0000
Message-ID: <ee7f3fb820b8efa8812670964fe86add9c5838be.camel@wdc.com>
References: <20190624054311.30256-1-hch@lst.de>
 <20190624054311.30256-11-hch@lst.de>
In-Reply-To: <20190624054311.30256-11-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Atish.Patra@wdc.com; 
x-originating-ip: [199.255.45.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a0ec5ee-65cb-4fb2-961f-08d6fe694bd5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB5511; 
x-ms-traffictypediagnostic: BYAPR04MB5511:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB55110765B38400C1D97E76E5FAF90@BYAPR04MB5511.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(189003)(446003)(2616005)(14454004)(476003)(305945005)(2906002)(486006)(118296001)(66476007)(66556008)(64756008)(66446008)(11346002)(186003)(2201001)(66946007)(86362001)(72206003)(76176011)(73956011)(102836004)(6116002)(3846002)(25786009)(2501003)(5660300002)(26005)(6506007)(316002)(76116006)(966005)(478600001)(256004)(71200400001)(229853002)(8676002)(6486002)(99286004)(66066001)(6436002)(53936002)(81166006)(81156014)(8936002)(36756003)(6512007)(7736002)(54906003)(110136005)(6306002)(4326008)(6246003)(71190400001)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5511;
 H:BYAPR04MB3782.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zw7T8D2zqu1R5UTq7jcRxYfVWeR28N+2hACs9Fl87LTzWkocnLO+n4+0vmDQPZzHs0EfjsgN/UJzSeoitkVEOxBh8fSBfIEBq1dPNg8kIIDl+PlXphRz9YiOqI0ZUIRbWlJMpfha/lwRMoGymRoq8IyElEpvYWWXBgkrvszFwUOUfN0aIZPaMXmajFkg6qGZncFYYkWFfv9z9LxonxSoWIHdPDS+AwTk/3VlDTXPaQEAfg6oCaCE0ANeW8T//GuRbWL5T0tJvaENqRlxaQf/2h3wX5Nr9DVTLWMdZhJ00iWKR+bYjMlErDsjPAa3Xh5Ao8FmuiHckrfEFGHS7FzNB3oCK7xW0BI/cnIZIsJofvWyb3vGN/1nMkL3ljVQZEK4ldcy2jrn7/+8P1PWvRQm/shha4WTVUcMcNjAGRWAm+s=
Content-ID: <AF3F2D41B9906D4CBC43A3BD256FF72F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0ec5ee-65cb-4fb2-961f-08d6fe694bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 21:15:51.5804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Atish.Patra@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_141558_493949_D11473CF 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2019-06-24 at 07:43 +0200, Christoph Hellwig wrote:
> From: Damien Le Moal <Damien.LeMoal@wdc.com>
> 
> When in M-Mode, we can use the mhartid CSR to get the ID of the
> running
> HART. Doing so, direct M-Mode boot without firmware is possible.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/head.S | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index e5fa5481aa99..a4c170e41a34 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -18,6 +18,14 @@ ENTRY(_start)
>  	csrw CSR_XIE, zero
>  	csrw CSR_XIP, zero
>  
> +#ifdef CONFIG_M_MODE
> +	/*
> +	 * The hartid in a0 is expected later on, and we have no
> firmware
> +	 * to hand it to us.
> +	 */
> +	csrr a0, mhartid

I think you should add SR_MHARTID and use that instead of direct csr
name.
The following patch replaced all occurrence of csr name usage from
kernel with CSR numbers.

https://patchwork.kernel.org/patch/10916293/

With that change, 

Reviewed-by: Atish Patra <atish.patra@wdc.com>

> +#endif
> +
>  	/* Load the global pointer */
>  .option push
>  .option norelax

-- 
Regards,
Atish
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
