Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEADC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 07:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3BFF217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 07:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lf/2JgIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TAsC2Kjv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Rl0EC92I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3BFF217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=1+wiUAR8E/VcciRhMh7to/hvA8QkQMm6RBvJj9hoS30=; b=Lf/2JgIh38mqiy
	yiaDoaeabwQc2r9NUAV/Vv59HSCrfqojLA7AYyDWm70Dg97bXVhMhjgkSbgc5B8EUsMjhnjmPXErP
	bijdSYsmCDZqxHWhVOcFZjQK4QthUakSYvLZws2MW6jvh6CAww550XFUvENxxf6pIuUR8hQMP2Buk
	LH+4pIw9+Zo4dlMQsbKnQKd+s7k57e0u8yBOYSDzDEFOFbbOtWstPMiKRy3VwxKrZZXShT9MaTGJB
	2qaIkkb/yNKwC6AnALMaNzdY08c6ATSk5tM6fJ5XMUNjWJ/UQ5UmOqMCWa+hulN1LBB7rZgVLum32
	KVynVM3jjGj9o9uDruYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grI2c-0003ap-7W; Wed, 06 Feb 2019 07:54:42 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grI2Z-0003aQ-Ey
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 07:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549439679; x=1580975679;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=xCbhwNw+9rG1w4IWm0xc6h/MiNt6et4JlLC7ffqeAig=;
 b=TAsC2KjvFsnOnHTHw3ze07YuxZ2h7As2zjaI0iPbs1OcJJGh3KIeBZQN
 EQJos0wwShxofaKBgbvujJ4kPbOajOPXzT4iwfYDg0WSaZVHY768P2ykd
 vKc+QQWndGCvxRf7ktjH/l1BYiZh+NnHuQEJCHXPh/DkZfncIrAiPJFMh
 aQG6Y23asjOyS8veZCtOHUd6JctsFuD6/TjBZY0a+ewIZDhk8R48ST4fH
 D/LZhE8xH9GTgwaWDCqfxTdLJnuxCXQzWlTfbKJ4P5fYjZmTakbSOuehn
 V/XD8elmR55cBKOTzZpI3+wr7i0/S7opjhXenRd7LIMiflQCsKafFipxG w==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="205702076"
Received: from mail-sn1nam01lp2054.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.54])
 by ob1.hgst.iphmx.com with ESMTP; 06 Feb 2019 15:54:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCbhwNw+9rG1w4IWm0xc6h/MiNt6et4JlLC7ffqeAig=;
 b=Rl0EC92IVY0VGrClf/l0rOggyeMRjz6f5fLG0IIQd56TfIIlavKxQg53zJdNWEtfKFg/K7D7pSt+7s64Ht29Y4vVDbKkuK0VifEPlyNs1xDZ4ymc1eXB+y+JMcQ/HwhqruBN8nBCEDlQftBAqMn95YZ6lGuMvYOZ6uV9wAUfEwM=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB5335.namprd04.prod.outlook.com (20.178.50.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Wed, 6 Feb 2019 07:54:26 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::88b4:7016:f0cc:7bbb]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::88b4:7016:f0cc:7bbb%3]) with mapi id 15.20.1601.016; Wed, 6 Feb 2019
 07:54:26 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: ron minnich <rminnich@gmail.com>, =?iso-8859-1?Q?Lu=EDs_Marques?=
 <luismarques@lowrisc.org>
Subject: Re: [sw-dev] SBI extension proposal v2
Thread-Topic: [sw-dev] SBI extension proposal v2
Thread-Index: AQHUeJ8H904qMdFISE+mIQM9tRdsIw==
Date: Wed, 6 Feb 2019 07:54:26 +0000
Message-ID: <BYAPR04MB581629EFFF1EAE6CE1A6A4F9E76F0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
 <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
 <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR04MB5335;
 6:EWcCiLFzcRs1hNpVpW/08OWezk8gLVo1N1S/kk6wmpLs0w1ZOZXwOWkKK5TVbPdOI13Vg03Ctnp+iCCGvGrgFsWm+cOyZsD1Cgx1m6zKWRgCkF89sTNTcxLkNCTxpKBL1WvIy1bcYzteUORmPmRmLF8E3sKG/MHikTziYQua/rY96NsvhVXqkPzvDQGssi6wAzIKOCXyBmcONYhNgNy+2V5I2jDInJn8pKIU8gw7oTRzwB2f3Jj2TEqtJ+0XdwT/9Qjx+Kamks24aTNTTLft5hqJGoFHmey5l2zRmlTqFPttj/46SCpw4jWjuRzpKA9sPvEQEzuE9F1cxJey4V4a2DkwM4RTXokXDR2le8KDkwcPLnt41nwOiaKBugPh51foQOP0ghRxGWRmHsjNAQuxV+hm6XzKYVl5pBfZZsnnRH+79XvbeFvf9ZCE5fJR4NV1iDH55GSEqtXtY+fYb/ePug==;
 5:sLktFlSPehBTA30tqZwx3CBh6QqvzUtv1w+OtbfblGuKp8HO36C/BXQ9Yu87QPT3cWvH44wnOJFyR4gKnNAUGNBAYAaXjBjbq8kRcvrnwM+oBS+f8SXlFJI1HUmi2jvIemDEDkkf6FgPHqUnTGLqYkXuAJxrNivtAeDFFAH294gmzxzsTmTpYpnnb4zvvswOdsPpwzXsSV/zXzyJOGRc8Q==;
 7:0LST3wZemuyk0TJ7DKv4wSEHQ9gTzjk5oaznymU7S0kpcodZMD24ve37UoDvchJxGTsU/UAq+sPGCUkzJF3cbARn/SDteU2WILs7mH1dM3QrTSAD2WiJSmtIplj1fW1mLog8C+Mn5LygoRB0f7Pg8g==
x-ms-office365-filtering-correlation-id: 8f5a9caf-53b2-4198-cbf2-08d68c0850f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB5335; 
x-ms-traffictypediagnostic: BYAPR04MB5335:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5335909867F9E891A6AE17F3E76F0@BYAPR04MB5335.namprd04.prod.outlook.com>
x-forefront-prvs: 0940A19703
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(376002)(366004)(136003)(199004)(189003)(81166006)(486006)(476003)(68736007)(7696005)(8676002)(55016002)(86362001)(4326008)(54906003)(81156014)(110136005)(6436002)(102836004)(26005)(316002)(6506007)(478600001)(53546011)(76176011)(66066001)(446003)(99286004)(6246003)(25786009)(186003)(71190400001)(106356001)(256004)(14444005)(53936002)(2906002)(74316002)(33656002)(14454004)(7416002)(8936002)(9686003)(7736002)(3846002)(229853002)(72206003)(6116002)(71200400001)(105586002)(305945005)(97736004)(93886005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5335;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FCOeBit/XPut8GBKclpcbqxTT/lTGADQ68/3R3HEEgW+Rya6v/clDPi8qioBLePgF4EO59jojdmsSSSSh+dKOe/sznLRkba0C2ZANfz9kB3Z/mL3cca5CCdweD8zUE+VrQD8l8ay99VJEwGEwTdjBsU7SvXCHLMwo5IwbkZ4cV6K3R3d/RHADpdpSQMqCbBgSOcS+FR+l9ptBxUUp9xaL6C53tYqxJyOGBxd6ucUsZZ5r/L6dhRAK6JmfF+UYlLpT74i9Qxrarlt1XpaZ2gYUmMivBl0bRrN9l1yPS3SDgCqHDVgH+LDQ0UPcEnlPxYreUVijojDxIMLk8/AmG/TGCSo45KuVlFE4WLK1A5oZUmKbICBAPGT/OMCjz5wAsSaRE6D3x1pgrbJQ+o0n695cdbRn5Wbms+h/yvPARzqBIg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5a9caf-53b2-4198-cbf2-08d68c0850f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2019 07:54:26.4682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_235439_682305_C160233D 
X-CRM114-Status: GOOD (  12.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, Atish Patra <Atish.Patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2019/02/06 16:03, ron minnich wrote:
> While I respect the tremendous amount of work the OpenSBI authors have
> done, I agree with Benjamin and Luis.
> 
> There is a further issue that occurred to me doing their excellent
> FOSDEM talk, which is that nowhere in this has any kind of verified
> boot scenario been discussed, and if you don't get that thinking in
> from the start it is very hard to wedge it in later.
> 
> I think we should consider the OpenSBI in its current state a starting
> point for figuring out what we need to do.
> 

And this is exactly why we wanted OpenSBI released as soon as possible, before
even going further with cleaner specification documents for standardizing new
SBI calls beyond the currently defined legacy calls.

OpenSBI as it is now is indeed a starting point, a base we can use to explore
different design directions and implementations of RISC-V SBI interface, or its
lack for direct M-mode boot cases for application software (OSes) with full
support of a known platform.

Going forward, PMP and other security related features will need to be
considered and addressed and we hope that OpenSBI can also be used as a
reference implementation for any such early setup that the platform or OS may need.

There is still much to discuss, prototype and decide. OpenSBI will help in this
process providing an open reference implementation for all to see.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
