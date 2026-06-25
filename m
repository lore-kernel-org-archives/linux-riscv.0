Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B99CDE00E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 21:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6fZGK9VoF0zvLrBT6rpII6DQflilOv4lJQECRUIryM=; b=I30CFBhPgJEFd/
	OY/euzlFQtxbGW+bV5Fe40F2E3Pwy6+W9iI96GIPecVfIBJLIFyfFmexJfhW4qgw5aHbgmKPs4jG4
	JHfSyDZsElndUS1xb+sbH9Vs9u1WwvdN6BLO/+VdtxaG5gTb939H4tcB9EZkBV8vxza+dRp4zmfao
	Cr5AnXezIoqJN1GmN84Rb7OKpyrS5Nd0lSHRZEQpN99zR2q+8rPoC3XWoCSOD4qbN7FbKSgJIm2cA
	AhvpOOatyqSsRBiexV1pa0uVJFFKPyUIVLO1FQn3bLrbYQSTLQ5Au/H5D/XsvEdqUK5s3ZG9/3+zX
	OnTO5yzC4S/+IlAMX+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcrWL-00000009rnI-3X83;
	Thu, 25 Jun 2026 21:22:01 +0000
Received: from mail-southcentralusazon11021093.outbound.protection.outlook.com ([40.93.194.93] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcrWG-00000009rmh-2Zqb
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 21:22:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJeNGuHKmRaW+w6rXdbyke6VcvowXu8xxyA0gKKcDlwXbU9Eyg6RXL3v9exPIDpv8aH+LsOuq0l+aa6OEPgIqfih5CuJm5ncNII4hPoylvmhRP2MNE5JFvfadRBjZU4Hnd7wA2XLuoLM2FO1Tju9Ej/4Hexjf5njPEpYKxJvp27PbMQA8GzKImt5yu3di2zRE5P8Wu2CTH7kclvrGqCarks4ckzjMff8GHrGMb+cir5W1uKgzgJ7eVcmFb5NeuIOAiUyIvvsvIEquCg5sfMEkRMuVkvgPAigFuco4g8brNYISXy2QZvxVN64PZ15LkX+MRTvsV0G9hikAGKsV1zZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA51S0pesopoKLwbt6yUIBshppdISFMB8sZGTlRdlEk=;
 b=jriYLPeL+cjGa2MkYe2zAtrv3lyyYdQ3n8LCQ09485aJIhfKieMW1oRSRH2I/DuyRlIIiKliCxn9Wp9HyDxqK4ZL578zbSjALRdYTe5rXW8YK5/ly5m7VumAEd/vHX7DG6ErDFiqAdy/yVsChqepTmGwjIcOsKHodsOa96vg4laO5Dm5mZQZagLsrZQjQWW/dYfAbNgmMB5c08GymJ9KFiGQe4H0mcwMshj6edKvc3hNMQq9HTw0S9vKYIk2kH6DCYT2WnS55z/8BbTsxp4CZVMjWZETT8LEY6F8lydM9bSkscFVOq9tE2uIA8hGegVQYx84eCu3RDn8xy4Lr+kr+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA51S0pesopoKLwbt6yUIBshppdISFMB8sZGTlRdlEk=;
 b=JSNp6c4NR8WEbxOJLZ48CNvrVy7uPYiGYsAFpraF3JX71Tk7byo5fJOKconUtEIMbxOyE3lfJSTB/KVJ/LfVrp2aMI/Xn2ypj38Q/7SzZwstPQGDdf2vbLaWoT+PdnWbkd4gXydeSXF3ogrf1+htLAQ4hUrjD4Hear1MVGI1y7XeUPG+1t3MEIHuN09eCd/dC2OBLpRJ/fh2UqPJa1UZwbxJlqAM81O1O/gd8e+qpR90i7Ju73LmlgEPumatjxVTqutm7RcJw5SNjTO9xmXM4WO4HVO8xUsedVcRZsPrLL7nsLeez39gl1hshyplfkBO9k/vf7MJ0iEjNCT6jQ5KVg==
Received: from SA1PR04MB9851.namprd04.prod.outlook.com (2603:10b6:806:4ac::5)
 by DSVPR04MB10174.namprd04.prod.outlook.com (2603:10b6:8:3a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 21:21:50 +0000
Received: from SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f]) by SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f%6]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 21:21:50 +0000
From: "Krishnamoorthy, Saravanakrishnan" <skrishnamoorthy@rambus.com>
To: Randy Dunlap <rdunlap@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
	"Ousherovitch, Alex" <aousherovitch@rambus.com>, Conor Dooley
	<conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu
	<herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Shuah Khan
	<shuah@kernel.org>
CC: Alexandre Ghiti <alex@ghiti.fr>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Wittenauer, Joel"
	<Joel.Wittenauer@cryptography.com>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	SIPSupport <sipsupport@rambus.com>, "Nguyen, Thi" <thin@rambus.com>
Subject: Re: [PATCH 17/19] Documentation: ioctl: add CMH ioctl documentation
 and register 'J'
Thread-Topic: [PATCH 17/19] Documentation: ioctl: add CMH ioctl documentation
 and register 'J'
Thread-Index: AQHdBMjaL7m/gAnGP0iQl0ogSD/mPrZPl3gAgAAv1so=
Date: Thu, 25 Jun 2026 21:21:50 +0000
Message-ID: <SA1PR04MB985100241C022033C8F4B952C2EC2@SA1PR04MB9851.namprd04.prod.outlook.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
 <20260625173328.1140487-18-skrishnamoorthy@rambus.com>
 <60a7850d-1527-4517-aae8-cd5cbebcb9b5@infradead.org>
In-Reply-To: <60a7850d-1527-4517-aae8-cd5cbebcb9b5@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9851:EE_|DSVPR04MB10174:EE_
x-ms-office365-filtering-correlation-id: e00322b9-ffad-44a8-f011-08ded2ffc597
x-ld-processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|38070700021|921020|11063799006|56012099006|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: KbUWLw+0+oelTWPHFRMH80sQ7lk0Yki0ui0oEF3gikUdsv/BuUo7T06O4NVp9ds0644UHi4HkljJ/lJX/TG+NyOUEutYwky5rhjN8aNSUALq9mxwUadfH98ivNLIjwsv+S+ER+iqosrQrMK64hKboCpgPxL9+Y7+on+oEveW7EPCrnatmoj+q8EOS+iOu2x6loRUhadNUUg+dA8/pVHrf0TTR4CT8NKigkZfMk4uYxNnaYrzIKGiC9n5SeLKkggNu/HirpCvnD+a1w2/v5MYiFiSf21b0G9IgyUtLG/yNJwGDvaECDLC2YTrlWMJHMkFGRvont6+vbhA1tp6eNVpkf7fkyEDYk6IZ2y/9EOkvTLyThpjg3AnhJ+xQRgqT2o/PLKF3Cl+kOV1PKonQUggYE97Z2bewobTX9iN4R1CtckO7cBH9fvb3i2GLBMNyj/hYG9ZpLB3D7cP3z23/r3k2rtcRHa2NeDpi6Fz5MGBUTxkY3RaC67wvun11rfquOxd06hXOBTjoU5xhiKGfxgxiYhzPya5hKO6TexM2pEf0bm1zNRRHJrIeSTz4S6QMpPLlVu77WuGG+tOFm7VsVmNMhLFcIOWJt/AomYpskBw4q/SW3SLezR2vHgY7Q3zNP6fvYSJTVhCd3QrmRF/UN3qXhdfvaZQzXkb5c5FX8nJNOpIZsF/XDg0FKi9BhsBQeAm29u7zBRQ2UUZgv1f+oboJFOhTCuHZzj7cc2yy0yB86A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9851.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DrXJ097McVWHo4nbN3PpbmZYUbb91Bsu3aEd/dJVUI33VtXCDme9WfOAFtez?=
 =?us-ascii?Q?uikt3MPmk4dvoqz2NC1ceAyaKRvLHKAAQwSS155uJE09GQ9pmTLL+ojgDx5K?=
 =?us-ascii?Q?/RgAqYBMxRfaA0H7NVfUw9yr0vGpxiu/DkzsGSEdzWrHRR3UwuFDez+RFOzQ?=
 =?us-ascii?Q?lXh/XtG/5hWFb1PiG5svSY8fojaGCr4i6C89KSPm7g9nt4cdMmz6RujfctTU?=
 =?us-ascii?Q?9qAIKcUy/4CGaP5Gb7kNFhcP0Madkg0Z0PHcZDxNlTZOwVv60Vog5WYPlYse?=
 =?us-ascii?Q?o0vOsAlstMJcErU4zWdVd0T7ai1xPpanolmrWZ9AHjj0Dqm48mMdO5sIWKoM?=
 =?us-ascii?Q?2oEiX+q9zycUxpK+TOQ40kPnxdhIsmhFN8u7QGLf/D+w/9Q6upaf2+2vz2qv?=
 =?us-ascii?Q?jmSga7vEBEMFc4xh8yJbNOpulFplUR0l8bp9YEpMeyZaDZ8r7XbWtvyGzF6h?=
 =?us-ascii?Q?d2bxPWBhdzwoSzT5AHzjvcXcSpFecrk5juMNwZ1tym6+GzmfkCrHDKmi1Iq7?=
 =?us-ascii?Q?yByjy1vjkFctmYxmqCFeQazqnzT+stmyrXTkLqrABRQuXQnwn0EEGLjl5TgF?=
 =?us-ascii?Q?+Mpvv5O4m+culHPjw/i0dJXB+joaO5FyC0+wMDRSKOEhcBR9zXniWaxQFd8q?=
 =?us-ascii?Q?7+r0T5bSE7rvo3bjSVIL9fl0HG++AolEvST/za5yur0eBkCXSlXbPkIl9IAf?=
 =?us-ascii?Q?VoAk1yEq3HIkzmKk3db1STK0FtPgdZIGLKYkGlKOUUtdnWflZHCm8v023k/f?=
 =?us-ascii?Q?OAIekdEIbUXLlOow0FRfLYxDVK93FUa7U0F+I1oexv9ZMUex+JNxq4/5YsSc?=
 =?us-ascii?Q?QQlP60yPCdHhJLRzJ3C+H2EbsSqndITD9gDRfulNzTRJdo3coXRkAxnMqEAd?=
 =?us-ascii?Q?l0Qe70qoENoswcO2TPyt08Sdd88sJ9jyXi5REzj1R4j7E0m/GU4ICPsPZhjs?=
 =?us-ascii?Q?H0DmXUPZv3GwE17+5iOf7L4rDWYxqHlf+YirWSlXw2ccvz+CifxLblBbEJFo?=
 =?us-ascii?Q?GhBWESgohGv4EaZVtUNQGbbZGCkCoJApWXzKNYm7PWD5Vylzguk9JErN2SF6?=
 =?us-ascii?Q?EtMc1fg74xppgwFNdAQGPZvprI/t8+69AatXuG52r8OiCLBtL0ri2WMkBQ8R?=
 =?us-ascii?Q?OqIg3cuTRamCUFXEKqhZVPvTxeMqsSreUYxe6Jc2XU4GmAN1cs+Cpn57ibFb?=
 =?us-ascii?Q?HIoJ35Kbus0PRfqL4wOB4SrQcBiAV/g/Upa3vol9Mur/9R/usweJF96ZdDcc?=
 =?us-ascii?Q?C6DzYPDyFT7uC5xVL3bqpp5i/K4N7Szh01rkg7mjV7jFJsq9wrx26/Uh/Mwj?=
 =?us-ascii?Q?C4p0A0PQE0pYtk2IWvMJIyrT88NFEX1a2nBuUl476dzN9a4Ki9C+St8oNlrl?=
 =?us-ascii?Q?xa9/TSQ18NShkLceoY7ZlkAleyrY6mTyK5fDiuuld9dtAIK5kd3s9RK/qwS3?=
 =?us-ascii?Q?PNAPLutVozzpg+KAo+aADQDsOzesY+G2KFbgQVGQFhSzy2RoH5AfJUZYoS8S?=
 =?us-ascii?Q?NaCz8b44RplLXtW01uVYmaZfur9ELC6CHifgMA/Sv8t+7ElOgxHcXfEzKlvB?=
 =?us-ascii?Q?m3rvIX6Q4x9U+fA03j5dppYYwJbJMn9IMUQLQuPdChFlOYROI2U2yMyQYBg2?=
 =?us-ascii?Q?92tDoVcMzHS8jdzSUTz42t6FojvnOBjV90lCOhkdEiJdw9L7umGQIbsIwmbR?=
 =?us-ascii?Q?U6RLY632++R8BagRzG2sXf6d0WJUbDBuiWVBDHi0fTAAV6Cqx0akIguVBksu?=
 =?us-ascii?Q?LXqUpg80jw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9851.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00322b9-ffad-44a8-f011-08ded2ffc597
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 21:21:50.6714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJrINyB66J0oepJbgqqIgmif1iOa+jy9k9DlZH9+nqyWK63TQnwLI3lI/oOfTLmC7lMxpkv+czHPKf3beGEnDMOFLPYaTS9Wb861l79xi1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR04MB10174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_142156_681779_AE67F1E8 
X-CRM114-Status: GOOD (  12.14  )
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

Thanks for catching this, Randy. You're right. cmh_mgmt.rst isn't pulled into any toctree. We will fix it in v2 by adding cmh_mgmt to the toctree in Documentation/userspace-api/ioctl/index.rst (alongside cdrom/hdio).

Krishnan

________________________________________
From: Randy Dunlap <rdunlap@infradead.org>
Sent: Thursday, June 25, 2026 11:29 AM
To: Krishnamoorthy, Saravanakrishnan; Albert Ou; Ousherovitch, Alex; Conor Dooley; David S. Miller; Herbert Xu; Jonathan Corbet; Krzysztof Kozlowski; Palmer Dabbelt; Paul Walmsley; Rob Herring; Shuah Khan
Cc: Alexandre Ghiti; devicetree@vger.kernel.org; Wittenauer, Joel; linux-api@vger.kernel.org; linux-crypto@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-kselftest@vger.kernel.org; linux-riscv@lists.infradead.org; Shuah Khan; SIPSupport; Nguyen, Thi
Subject: Re: [PATCH 17/19] Documentation: ioctl: add CMH ioctl documentation and register 'J'

[Some people who received this message don't often get email from rdunlap@infradead.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Caution: < External Email >

On 6/25/26 10:33 AM, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
>
> Add Documentation/userspace-api/ioctl/cmh_mgmt.rst documenting the
> ioctl commands on the /dev/cmh_mgmt misc device for the CRI
> CryptoManager Hub (CMH) hardware crypto accelerator driver.  Covers
> key management, KIC key derivation, PKE (RSA, ECDSA, ECDH, EdDSA),
> PQC (ML-KEM, ML-DSA, SLH-DSA), SM2, EAC, and DRBG.
>
> Register ioctl magic number 'J' (0x4A) in ioctl-number.rst.  The
> driver uses ioctls 0x01-0x40.
>
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> Reviewed-by: Thi Nguyen <thin@rambus.com>
> ---
>  .../userspace-api/ioctl/cmh_mgmt.rst          | 941 ++++++++++++++++++
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  2 files changed, 942 insertions(+)
>  create mode 100644 Documentation/userspace-api/ioctl/cmh_mgmt.rst
>

One docs build warning:

Documentation/userspace-api/ioctl/cmh_mgmt.rst: WARNING: document isn't included in any toctree [toc.not_included]


--
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
