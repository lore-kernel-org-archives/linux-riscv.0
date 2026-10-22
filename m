Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5F606A325
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+LBTea8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=selector1 header.b=suS+fq5r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N1rGdzbZP82wqQ+xeakLsYu0Gt44v3Po8P+QaaVUnzY=; b=3+LBTea8OeuCto8jnfpkAO/Egq
	QQjjWP5YvsVbTx+7dJ8/ivBRFw5KjtORurELmhcSKXmMD/i0kRBuRS5GzgypeFAtN8/rSaNL2Gsdg
	ANiMEwAbdiMGvSY4qjMo9Cfb/JkZ/A/da4CSwTzygPCgwrSgs+c5P6l13T6u1rKLAbXgV7oUCjYXN
	6j7b5maSWgxrLl8EzFuJh2EQLfLYDrPHtdPj0H5FdYFHLTdz3VVc1gcF76IrBRPlsgalHSCxrBYx5
	yOkKHtS9Eh5pRFhhEXTktboXGrhHzQPHua7LaP+BkT0vKCfrrVK19LVRxyGAdc1G3+8TfSMe0pJ9e
	64C6PnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpuq-0000000DvEg-1EgA;
	Thu, 22 Oct 2026 10:20:56 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpuo-0000000DvE7-22Za
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 10:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voP3I5d7tZnNnCS3rDboqWiLEnPb/0R1jIeAcatDhfrM9F1zERhZg+WwL+VOhRiI9TJ9VKmVZCp0od0T0BwZsBkqnuIrJaCOL1GwAQvRiTKlsoj6lbQvSt858Jxa/hFZN7yTMVockr3KGwU9R9fFNN27xpFeguf8ybm3lDNnKKVNLFBvA2OBwqPMXABEWugVrSamhNPj6Gy3T1vbvjqvOWNvxxAzdCZJY1lgtFtyA9ND4E+SbcyjlAnzCY2LGKahQ6aBnBvQ+KtqFCpElLxkpuOF5O19KWE5xVKGUfmosQ9PCHlttiSZ4xeCgiW+hloXWT96r8UrVaVL/nqKGMs5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYBzU/XppeheFXFmE5BLeoFRNMT681CX4S0wIhaXofA=;
 b=kEnk0zVIivTv3YdvPydomjrStoKkNz1iyOPNSE9HNMNwdB9SKONDDo92KlsdYILN0KuU05CijgAb6aBoMmwz+c2mf+NLS4BX5a0dSW2V1l6f7K3tCkYBrDJBL4gNrCDEh2nFoN2W4JEeZQL1ybPqfAeifiwVWEW1wYaJZ+2QcNZGWOoHHbml3dHoYOOQWYu1IOSB5T0R3AUCs9RfHVJ5hQ2WJ9vLAOtb2ZguL9B+kr71XfVRlw8r/NycrDgTf4W63vFMJbXrxgb5x/IhWOwUKMlrm6D/HlrkX5dHz0yq0wRT8wUNlnEJpEz+ShZkNHTwQmREyK1EJxye3GVzsM+9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYBzU/XppeheFXFmE5BLeoFRNMT681CX4S0wIhaXofA=;
 b=suS+fq5rW6V5bcvVqDICmRKiTbJCfpBnWfyZRW1F4dEJgpiX0wArIWKgL8ACVJc4v86LdHchoVl+b85y/0Rpg1pPK0MJ+IY8/HK7hMIn8/0l4fXZWsciGpKnlpdTHO9SOnSOU+SDVxCxVAVZitcLz2pJLdqoT/dePYIQIRkCGEg=
Received: from BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
 by SJ0PR04MB7469.namprd04.prod.outlook.com (2603:10b6:a03:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 10:20:49 +0000
Received: from BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01]) by BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 10:20:48 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>
Subject: Re: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Thread-Topic: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Thread-Index: AQHdYg8BHevFmech/kmjtw7J+NG/nA==
Date: Thu, 22 Oct 2026 10:20:47 +0000
Message-ID: <BY5PR04MB70254A39FF5BC39716B23E5783652@BY5PR04MB7025.namprd04.prod.outlook.com>
References: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
 <20261021-negation-carol-e42b4ecf3726@spud>
In-Reply-To: <20261021-negation-carol-e42b4ecf3726@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=cf2522fc-10a0-40b2-a933-263add331aac;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-10-22T10:15:10Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB7025:EE_|SJ0PR04MB7469:EE_
x-ms-office365-filtering-correlation-id: c5bc1fca-0e41-4bf0-d424-08df30262406
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|261021121427099003|11063799006|4143699003|56012099006|261009223027099003|55112099003|18002099003|10067099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 2wNV7J1RSDbxi5a+0YxUdcVjvSk5F1xmn9qoSEbeCZWkPY8LCgSto9hxKszxzmHPmIxvrwA7GEMU6d9/H0CQFgyiVyyeHRkxxHzZ+pzw6Q/2WJEUIsK92NumWL57G3SvGBFE9ooGS+K31URuhgqzWDfMMF5jEZTBjGjz2c+YAXZnuOxmrv8yzT6Y9sL73YZGe1dVqH/a6iWkE9eGfR+Hj4vdQydZCbjGo1nuQaCwzAMcovQ7ecJq71Pdr3BAxN01bo79UahjTTkNOyaCriepa01o7V1qLt9eAZ1e8fuXkHuPs+nMUFOCCjbRAsZpZC+CE6i2HVXhbM1tQeQU53VWDf+lDIPkb96o6rGLChR/1s2Io8fyjImgUFoza4f5M2SnACed6UL6ZudvadYarg87PzA5T8Z16AAV44xiVgE6vtoqTFJrpPkTSMjQpecNCqEMM7T8FSbITdQzOSOEiyyTglWbFxzRBI/7E5J1gPW8j42QKPMmwczxphhJDcgaSrYyRqYnWsMLKKw8QcJSsQcve69ao/x3vAJnZVNP8sbyPvAkVPCvbcqbWXTYSgLlqKCLH7NGnnlWt+Vt4n5cvl2/aoQ8GXnxc5uNxTdYmXCYHuNTR0IHIfF4NYI0lCw2MFONb1rlpAD94ESFnYXUn1Z5DxzSPvomvy5YO94JYzmXabys450LmY/qx2u148YVW6mKvPiFvHiXFSOpj5Wwjp7nNLg5XAw2e9dDmfs+wvXNOgw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB7025.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(261021121427099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(55112099003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u290nuHyGTrrfEqocU2q3tDsbzFbpQwYsJCrAfqKP8bMk3FP2DDTuxsmwUOA?=
 =?us-ascii?Q?/yJTG6IBtMzwPNLMcDSBhl1AW5bWtYaEG81hu1T1XVYtK25Capz/VG2jG3nW?=
 =?us-ascii?Q?S3/J7FKknqJKn5PJEXsZw00tR0hgRN+ltGQECKgNRAY6wXbBmlf43lNxNCr9?=
 =?us-ascii?Q?5wEU3G9GLC2e6a6OzUzLr883Ptgt9a2IUh4Dx3rv+aldwgAzKqJW9+D/QtEP?=
 =?us-ascii?Q?pmdCjij7lzUJHYRU9zNPTl9bau+t4yeJmDh0xjdQHjkVot6kYTGm1IJtHb7X?=
 =?us-ascii?Q?484kskA2AitbMiOz3pqHYBaPpB+eXdMdB0W8ghgSpZZBgVeIKzxyj/kRC9WO?=
 =?us-ascii?Q?ghRPjPjRyftgp9kXxzQ0l54nvUWlZB4Pou8WiAzVUV3bmVMRcszjkFaY7lSG?=
 =?us-ascii?Q?86ZzEHrEP+pxqC/hw6b4yTLywxVUvZqspFR2twVeH2peTavrwqsMSIjuEzGl?=
 =?us-ascii?Q?TF+Ld3Bxt9iwScKzreNEHoUPSxtaResQpEW2B5X8R+Pn/evjdzYBjVYrvQtl?=
 =?us-ascii?Q?ZbBKB4cZtpyFubj64emqq0m0FQmIG1IX4Zg4a1na/pWAfkaCtEr9SchP/sxo?=
 =?us-ascii?Q?IFsxtrPib3fHgwvbSlOOf5O87ewOhgRyUuwxyAqKfd/AHeFvNp0MGEaya/Ou?=
 =?us-ascii?Q?QBt+ra8n+YIrl47MVi8WhsmmCFvmpd7ajQy2M10qJB6S/ijahJlodzhw43CA?=
 =?us-ascii?Q?TT7v3urXRAg/X0wr08jAey4tzGGmi5k7F/EIpOWzVdfDouhfp/TJncL33KU+?=
 =?us-ascii?Q?uwYCdyfvMnXmuoAYZBAh4W/vc66Y47172Klp36QFen78fZ/NbLDsU+Kd1dCs?=
 =?us-ascii?Q?vrP0D1hHEPyRPmLoYBUKRINkF5mz8hpAZuc5vkleHq0z83NldCI0fI0wykvJ?=
 =?us-ascii?Q?YTd2RqOgMviY1eRvX1RlW9Yoz+lbb/bHdqOba1MnLBgrzqRiMkkWvgys72JZ?=
 =?us-ascii?Q?T46OePbe0yid/E1lfKa2WgEJk5adz2QGxnzppJculsamaj1sgT9nqXsQ/DFQ?=
 =?us-ascii?Q?A4H5rZ1JLFo/w2+YSShFYqmfUy/ZIuwRbPTmXLDTmiexd/Zornw4t7QbnXkL?=
 =?us-ascii?Q?IycBPfBvdhf25lp5bpsiSJxK+kSA7o1Dci5dZtIlqxM5KcI2NZC6PzKZoa2k?=
 =?us-ascii?Q?AoCjpgHdjPxTbAaEs6MEtkNr73hK4n+gO7AQSInY7Np+RbXS4WgGWAWe/I5S?=
 =?us-ascii?Q?7KQKFPFh0FycPQVHotSm4AzoEAORFPNNV3pcSHOp54PHV2r0jVhPRjBvHLhQ?=
 =?us-ascii?Q?+TLIIdsbL1XdzOaUY5z2xIH3+j1fro9yZlknHgWI6fZqRVC74Yqzu9MBDTWQ?=
 =?us-ascii?Q?wndMUTIVtZYKWj9sX13sSLQNk4Tyygfl+D2IO72Xj7t0zwdcnDEsdu1lO6Z/?=
 =?us-ascii?Q?A2IJWfuOviCRkqw4rMQ/5/jNxcH8xqgL2CsvCUjYby5uZI/5I9mHn6LkeWcw?=
 =?us-ascii?Q?AhoF61+O/0qDzgD0sOg/mrpk8E67mQNkaRNTfX7Ha6aPytyMJIRgmAcuKtZZ?=
 =?us-ascii?Q?1fW5Y4EFPWGDuxjmUPpwa5yiHifAGWcYlrkOyWCPCTlgImLnOHQGAiHXbdi4?=
 =?us-ascii?Q?nwukDSsxy80HKIbWsZJ3tBIH4mP95cOPln6NX5Rm5YACseW6p3o2pfvdlZdg?=
 =?us-ascii?Q?dsbh7iB3tzXkYRumhOkmc5wwU5fhiIzOvYs4pG8JsylvXKw0s/9Y4ZXmuFIl?=
 =?us-ascii?Q?w4lFxkScom1VK699b9sxRsq0mWf+/LIE3JQKIqlrV825yuOnC0PUHxsukUzN?=
 =?us-ascii?Q?STnyDZpnQ5RNxm6opPyAf0fQSlyg8xU=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB7025.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bc1fca-0e41-4bf0-d424-08df30262406
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 10:20:48.1195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cqx0GN3Tw+TolWI51n3djnDU1ohVyzGEovMkUqcfQwXXaTCH8yhyxO/UpKu+I/Bi3l/rxtJCyp/6r2t34IlmTMHIlRhLt6S1WBwWtNG6p4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032054_540399_4EF885C9 
X-CRM114-Status: GOOD (  35.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Conor,
 
On Wed, Oct 21, 2026 at 10:43 PM +0530, Conor Dooley wrote:
> On Wed, Oct 21, 2026 at 06:39:06PM +0530, Pinkesh Vaghela wrote:
> > The composable cache resets with only way 0 enabled, while the
> > remaining ways are available as Loosely Integrated Memory (LIM).
> > Systems that do not reserve LIM therefore use only one cache way
> > unless software increases WayEnable.
> 
> This is not true in the general case, firmware may intercede to set the ways as
> it pleases.
> 
> > When no memory-region property is present, DT describes no LIM
> > reservation for the cache controller. Validate the reported way count,
> > then enable all cache ways so Linux can use the full cache capacity.
> >
> > When memory-region is present, leave WayEnable unchanged because
> > enabled ways cannot be returned to LIM until reset. This may leave
> > more ways assigned to LIM than required, but avoids consuming reserved
> LIM.
> >
> > Apply this policy to all compatibles handled by the driver. Firmware
> > or
> 
> I know this is going to cause problems for all the microchip boards, which
> maybe should have reserved LIM but never did because the LIM was never
> put in the devicetree as memory in the first place.
> They also don't suffer from the problem you mention because firmware sets
> the ways up.
> 
> > DT configurations that require LIM must provide memory-region;
> > otherwise, Linux will convert all disabled ways to cache.
> 
> I don't like this behavioural change, it's never been mandatory to have a
> reserved memory region for the LIM. I'm only in favour of doing this on
> devices where we know it is actually required to be done. The eic7700 I
> assume is one such device.
> 
> Cheers,
> Conor.

Thanks for pointing this out.
 
I agree that firmware may have already configured the cache/LIM
partition, so applying this behavior generally could overwrite that
configuration.
 
EIC7700 firmware does not enable the additional cache ways, leaving
only way 0 enabled when no LIM is reserved.
 
I will restrict the change to EIC7700 using a device-specific quirk
while retaining the memory-region check. Would this approach be
acceptable?
 
Regards,
Pinkesh

> 
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  drivers/cache/sifive_ccache.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/cache/sifive_ccache.c
> > b/drivers/cache/sifive_ccache.c index 2acb8bdf06d5..17b6ba8ab984
> > 100644
> > --- a/drivers/cache/sifive_ccache.c
> > +++ b/drivers/cache/sifive_ccache.c
> > @@ -117,6 +117,22 @@ static void ccache_config_read(void)
> >  	pr_info("Index of the largest way enabled: %u\n", cfg);  }
> >
> > +static int ccache_enable_all_ways(void) {
> > +	u32 config, ways;
> > +
> > +	config = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> > +	ways = FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
> > +	if (!ways) {
> > +		pr_err("Invalid cache configuration: zero ways\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct of_device_id sifive_ccache_ids[] = {
> >  	{ .compatible = "eswin,eic7700-l3-cache",
> >  	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) }, @@ -319,6
> +335,12
> > @@ static int __init sifive_ccache_init(void)
> >  		goto err_unmap;
> >  	}
> >
> > +	if (!of_property_present(np, "memory-region")) {
> > +		rc = ccache_enable_all_ways();
> > +		if (rc)
> > +			goto err_unmap;
> > +	}
> > +
> >  #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> >  	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
> >  		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
