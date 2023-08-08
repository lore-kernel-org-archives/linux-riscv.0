Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCD0C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mg3EScrr+cDaKEL3StNvqnVt9lmsizGp/lAFMuHLBh4=; b=hAySH0MgL2v7Sf
	9GCw29l7cd3N1WkFN3yN5CAr3BtHdsfu2S9LysqJBO1pBu2BfMYRT/6UGFPsJ2wKItYrRUdc5k5By
	XWwCXn/i0IPRyTxOMLeCEGCnlg37GC6a9yqnbaagfgPsO/eyhlTgP/95OJ2urpYO3IGuY00PZ2scy
	P1BUyfbZC1Nx/ZYHA9+R+UpJ23nHiCES7AmdbFaLo6sfX4S/ZvjiLwj++UWVKdlMEYGLdUiFC7sRQ
	sCcPOvDlk8PVqXDUhMjRLauWK0a9B+E7P7/E4mTQtkXpuH6D8mfniToIL0Oie87rNYUZltEfgV4nM
	CeOdTdIhSF1sDd3djhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJmx-002D8p-0N;
	Tue, 08 Aug 2023 10:18:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJms-002D6n-2e
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 10:18:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A5F65831C;
	Tue,  8 Aug 2023 18:17:22 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 18:17:22 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 18:17:22 +0800
Received: from EXMBX068.cuchost.com ([fe80::e99c:4abb:32f:d650]) by
 EXMBX068.cuchost.com ([fe80::e99c:4abb:32f:d650%16]) with mapi id
 15.00.1497.044; Tue, 8 Aug 2023 18:17:22 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/2] riscv: dts: starfive - Add crypto and trng node
Thread-Topic: [PATCH 0/2] riscv: dts: starfive - Add crypto and trng node
Thread-Index: AQHZycgtdre3xH++D0m1ckikpOWjy6/gLsnA
Date: Tue, 8 Aug 2023 10:17:22 +0000
Message-ID: <6c26992dca244c6eab05b64a16be0d0c@EXMBX068.cuchost.com>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
 <20230808-despair-calm-40ca60de2afb@spud>
In-Reply-To: <20230808-despair-calm-40ca60de2afb@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.156.69]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_031803_036522_142D7E69 
X-CRM114-Status: GOOD (  12.33  )
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

> On Tue, Aug 08, 2023 at 02:11:48PM +0800, Jia Jie Ho wrote:
> > The following patches add hardware cryptographic and trng module nodes
> > to JH7110 dts. Patches have been tested on VisionFive2 board.
> >
> > Best regards,
> > Jia Jie
> >
> > Jia Jie Ho (2):
> >   riscv: dts: starfive - Add crypto and DMA node for JH7110
> 
> >   riscv: dts: starfive - Add hwrng node for JH7110 SoC
> 
> I only got one patch, where is the other?

Hi Conor,
My mailing server failed to send out the 2nd patch.
Do I resend the patch or send it out together with other fixes in v2?

Thanks
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
