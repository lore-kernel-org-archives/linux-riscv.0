Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EFCA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 00:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxWX73k9Xwsx1KI2iCKFz7n3VM0akRMYu50JiLA41Wc=; b=tYjj7Rs1s20KTRkD8nmMY97cjd
	/zRgEy2w5AJKCasxBQEFzDnYQFPwNvzT+N2+tdag33gQ3tiChzv6QJHjhTzNGhFWWnWv9d9ufBrA7
	VVOrHYzP6u5qo3C1NEF9Nns78ZBHh/Y0Q/mC6HWH23Q7IYaAKHD3a0noB6EYvOb+WzrJpZVaIv9Ao
	2syAJurzyE0GLOsn3jZZC9UrGUehVqUHo77fxpuQTEi/+C8NK2zLwJRjYVuuWHbirG+VrpN5aXGWq
	rfeyUIrhBzVgL5VMC6aHN7JuQnTxFCyKpa6iFQpPIc/T74CQUrPOYktat0q/iCAX7zRM6a+pnVKX6
	B0Nsed5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmkt-00000003peV-1zy9;
	Fri, 29 Aug 2025 00:14:11 +0000
Received: from mail-southindiaazolkn19010011.outbound.protection.outlook.com ([52.103.67.11] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmkB-00000003pa3-33by
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 00:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+ubLKdjfoxfrt2IDYMK3lsEzJnGRFaK5+9VQLE1AXUIKy0y5QWV3w832LerxM2Ve1QfFo+KWVh1/MbKWmckxFVChmnn2jNYYkAm76tym8UOt0orUOtL55TvAYQUM/72VTFYhvH2+sAMcPNC8daP58K5bWAl6MZMdCJ0btjSJnQU7gBC2n1ksEBpWNccvrZdS1dEqaxoaAJuKdjq7m+Q3t9/tTgUlZkUxq/H/9TeU7SX64ma/7yBPgo2Fd+aag8GHFvwKHASb17ODfyG8WoKEA3VeZbkV9fFmtXjkzRJ3utijMY0/kOrmOaP9ZDfodzXYAa8Ttj2MBaCX9t307jHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5csuDAYwMoupiruJeH6S7OYkc+M2eubQcdv36jKkzPo=;
 b=ISF1JTi5bo/+7jww7j1HiunuInzTK4YAd/C4hzGRttVGMONjLBlUHHYENXFnsJSoP53k7lx3rzAkJfM3KlBZujNPsJ7o2B1vdrWp+T0pMIm/Gubu6KB5GYRmJDGg0phrWodn/2u7kCFJKEFNxtl2KgoJ7FXjQjQ9NJf36pI3UCOs5tJaA2dHtrjtME58BUGLumDHXvYjpwCLIUjtcDEoSSldrVwE8jjklXVgaOpDCWlD+c01VFB3+HW2BGckVK+E8w0fHpRT2ROdEFDvMoDjKFMyDfPQzKtlOSxcPYMXiMXkHf9Tnn+PyTzeIsv7vgLa72eSbDcvjuCqpTcv6erl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5csuDAYwMoupiruJeH6S7OYkc+M2eubQcdv36jKkzPo=;
 b=Z3RnXAdscBn2riF42afkLnkWAX/uqfyVI2JBtrkcFuErK+naJUmAZBEi3HV1hvoyPKUk7CJ5Dlj7pcwzLfCAlRkpQFX5sD0t+jhADyvnZiD66kCF9I0E84Y5O+NsEACfgMykPTlGvyNl/Vly/hQPGKriORkm8KfqbFn+5hHHldBeXbQb6f6isVVHjbQAqM+zYk6MM3kY3yg0MKJDQSDgBiEHnZfIUdsiNKMVy0qAte9ebL94DZGve9SEVhV2UOSh6hAB43Isn7hu6esGCp5dSyIQoC/ciLjVFf+Sc+Ec4XE0c/BtcRFIg7qRztYTGNEepcOcqC6RF0+NyEbf/mxpGQ==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MA0PR01MB9401.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Fri, 29 Aug
 2025 00:12:58 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:12:58 +0000
Message-ID: <MAUPR01MB1107294E89F312A26812B9FC4FE3AA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 29 Aug 2025 08:12:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Chen Wang <unicornxw@gmail.com>,
 kwilczynski@kernel.org, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com, bhelgaas@google.com,
 conor+dt@kernel.org, 18255117159@163.com, inochiama@gmail.com,
 kishon@kernel.org, krzk+dt@kernel.org, lpieralisi@kernel.org,
 mani@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de,
 thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1756344464.git.unicorn_wang@outlook.com>
 <1df25b33f0ea90a81c34c18cadedd38526a30f01.1756344464.git.unicorn_wang@outlook.com>
 <08d79767-4b9b-41c3-8d51-5ff879eacb31@oracle.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <08d79767-4b9b-41c3-8d51-5ff879eacb31@oracle.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <6ce590d9-d8ad-45f5-89fa-f9d36bdd2ed3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MA0PR01MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e9691d-e9d8-4885-1ade-08dde690ce77
X-MS-Exchange-SLBlob-MailProps: rYPt1fhvLTUem4+YyY73AGh/GMpkrRb3eiSMrFOydFCTSkgdpCU1WMDbc8VU7htQEnDJ1iJH+1dHm6XJrk3J+gzDUMfas3AAvLbwMFevLToEuG6yDWhvXGd70VDGnqBTFI3F7QXJ2QHXC/+9iOtAnH+1wjf7eEDYjlIvayP5LBHObUR9N2ApgdjC3NpNF7hexJIH5zAQXCOd0d4yfnnOSLHCWd7Ms+8hJMUxxE/ZU+xx8mIQqs97ThPlNV5dWQDra2E2b+CzarSvq8Bxo8hvHjlPh3SmcK1DtGTkiU42Eu+306Z6qrvBzaerpYHmJ+FN+7FYYJ3qt4AZWBI0THzQg3RkqEyDyb4DFsSLUGDk+Mibty1eHoY+wbayYF2CFq7jK5bbcdhdRCZpjj5EIDCSgKCGBFvrvqUJXiif958m02wO99Paepenm2M3veUdicRRkq9qPEb/Xe2xxJn0Z0RSHdd6uLBKtDE+5/GWpNeKfpGgig3XnVh1fOe94iShJAu2zNfygl0RwnTMCFT877lUrKk+H3ZO5AmRb/kdP1zzQm3EXYR3UQfAgaAaNuDFgaiMHMUcQoL5KRHPL+1/SgQP3l53KiAt/IRtWbb73WrpYv7tz71oiaba0HQ1seoxtrcxwN+1I8bDubFzc2Y5mbMz2JfhI9qJMMGkUgdgxCwkwfRHdWagreGdP8EFSFB0R+wLpK6IrExd7nNdOaOhG5151Q==
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|461199028|15080799012|5072599009|8060799015|19110799012|6090799003|41001999006|40105399003|39105399003|440099028|3412199025|41105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHRwWC92ZW5XZFJiZmJFVnBYZFpMQ001eHcvdWhpU29FNm4vRld1Y2tBRzh6?=
 =?utf-8?B?TUhxS29Id24xcHErRlBJT1BiOVprR01ETjRLa0xQK2dCR0hpNitCMmRLZi96?=
 =?utf-8?B?elZwMTBXSlc5MUpURkxRZ2ZDa0hNS3RyVWRYdjNIK01KVVpRZG93L1BySlJF?=
 =?utf-8?B?S1JIbUN4N3JNTXltbHBRYm1mbVdRcTJpa05lUlVmR0o4b2lFUkNTY3Mva3JI?=
 =?utf-8?B?T25KZ0tiTTF0RlFFNDRFUHlWclNkRUFXQWNxR3pVVjZOdG5qcjdwNTc4NVll?=
 =?utf-8?B?a3duWVc3UWh6bkRGK1dYY2FyZW5pMEVVWTVDVnhOWkNLK3JpN2F6REx4S0Y1?=
 =?utf-8?B?dFdaY2l0cWdMV1M0bHhhbnNydlBQNmFDVjFWYklVQW9lVUNrSWc4WVZaMStC?=
 =?utf-8?B?TEw4NlRqVzJqNDQrV1hsNTRPMm5oRXI1UFJCd2VJVmR3cnp2dEVzMldjS1Qy?=
 =?utf-8?B?elZhZFJsNDZaTVE3S3F0eVdEcThVMk1zRmVmbG9vYnk4SmhpY2Rmbzhmd0FH?=
 =?utf-8?B?ODVzSDNXMitWazBzalVVclpKeDVwSXREV2VMWmFBb2lGVHVpaGlycXU3MFkr?=
 =?utf-8?B?aGRxZWswcFlPUTBUd04xS3JnemJkcmlZOGxmYUpjNFhNSW9NSzlHemZPZm84?=
 =?utf-8?B?K0hCRkVuQUVONDZxeHhsTERGK2w2RzFDZzg2R1hDVnBSNi9NbHh6OEZiQWd1?=
 =?utf-8?B?aW4wWjBhYnMxVkJVL09oMEpxbXJTRmQ3SVo4Qk1TdERUTHdtc1BXVmh5clFj?=
 =?utf-8?B?bDlFMmwvRVBueXhOdXdBRHdVZWVYeEx0WjgxWnQ4V2t3N3U5RmJiYkVGWU5R?=
 =?utf-8?B?aGtHMmd0dEZMVnB2SmpUZnVJRGs2MkxWR1hIQjJTYVlBLzg0NUR5T0dpZ2ps?=
 =?utf-8?B?aW1ScndYeU5SRkdyVVl4dzdWWWdQZHdvOWQxUnloVDNIaEVNU0ZBOGRnMTQ5?=
 =?utf-8?B?UGdlUDZwVjJPZ3l1R3hVejVyOWNsWXRWeGtBbHg2djVTNWJ3aUQxT3o0bzAz?=
 =?utf-8?B?K2JrZ05HelE5cmhLeU5JTmNudjdacUt1NGxHTFhuaXgwcmV0QTFtYnlLVGYv?=
 =?utf-8?B?R2t5dTFmQ2doQ3FKcGhreUg2MjVIQU81Q1pUTWlHM2tIMWZUeWlud2ozeUZG?=
 =?utf-8?B?MDZ5RlFpRUVvOFVMeG00Yk9nREEwSEROZzNDNmlpaEJCQU03S1V2WTM0YklT?=
 =?utf-8?B?SEZESTZ6cTFjK3FtSEx3ZGlRTkdla0dYcU9aeEZXbEdTQ0ZpZHJzWVRwODJZ?=
 =?utf-8?B?bjZBMnlpR1kya3Vhektkby9jWlNVWlROdUpRelc1RFZ4am4wYUFaUllzNjA4?=
 =?utf-8?B?QVgrdnpiaHBlVEVxSHNackVPMVFwRFhEZHVwUlBJQlRkMktXMnJKNWpXdlUx?=
 =?utf-8?B?TVFQUFZrd0g2cDlCRkpXTnkxRUxmYkRlWFBrcGhxUjJrYmY4L2ZEOUU3WStR?=
 =?utf-8?B?TmwvNVhucnlUWDZZbndUaVdVY2g0eVRnVEZtZU1PNTFkTXJCVUJQcUU1VEpV?=
 =?utf-8?B?dG0rY050c0M3VDg1aW1IcytYbHFLTjNPdUh4MTA4K3BBTVRkQm9UUm5UNmhv?=
 =?utf-8?B?ajNGdkpzMkpqNUxObjVwN3dQMVhpbXpCbjJSTUhRVTErbkZMdFFnRjlESVd3?=
 =?utf-8?B?TXlyZTNHdXcxZUhpZ01zd0ZPQ3RjN2VFb0ZjVmQ0aHJoM2V0R3lVdEJaNHRa?=
 =?utf-8?B?ckdnbkdKTmJyS3dSOXJWY05HZWFGRlYvekdLSUFQcUIzUXJ5M09WUGN3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFFwU216aUZUUVZyT0pMdjVXUkNxdVVKbFpJbmtRd2xsRUhFNFRMWUhleElL?=
 =?utf-8?B?eXVWVms4M1JkVDlHcFI4SXFOUVgwUE5Ha0UzRnZESnRjYWpZQStmMXZWcjkw?=
 =?utf-8?B?QkZweWtrK3pyRVJYdGMxUmR6Z3NQbFhwbURxYjY3WW1IOEpPVWtZU2JBT052?=
 =?utf-8?B?SHg5VmNRT3I4M25QOTZkRjNWQXo0eTNsMlZ6QzIrSnNFekFCRHk4Z0RyemVh?=
 =?utf-8?B?VWpLRTlvMG96c1BtNllrb3NiY3VManF4UUtrY3YreE5ocVFRWC9ieDNmVXJU?=
 =?utf-8?B?QWxzdzRHRXNqY1FWdGRtaG5Nakp3QVVYL0xYbklxSThPRDMwM2JmQ2dBOWV2?=
 =?utf-8?B?TzJ4Smg5clJXRXQ4TzZXSEUrS3p1NWpDeDBDaFFTWHJsa0FOUjNNNVRIV3di?=
 =?utf-8?B?OW0rVmVhNFJmRVNFd1ViS25uckxFbU1DVW50RzdNNklaeldpUHdPd0lrT29a?=
 =?utf-8?B?VXdmUXBKWG54cUtNb2dLM3dROURIWHhFUFJCRmJESCt6Q3ZzYWdwTUNrSjhp?=
 =?utf-8?B?b3dVcDNsUmdoN3cySy9lK3BYU1FxdmdoZ2d4Si9YdTBnZ3JBR2RNMWdUUkd3?=
 =?utf-8?B?RUh0cmxQOHlFMlk5MWpZT3VJaDRKbytYdXBrTmMwc2ZZdE9DUDI5Zkd0aFdZ?=
 =?utf-8?B?QnpEeVJOWkYyQjgrYkhOUFdFbTlLRFZCczRDSEN0eEhJdGpkSWV5MGhaUkM4?=
 =?utf-8?B?M0NnSTZGM0NxU0xKaG9vYWcxeXVJWXpDemJSMWVVMjB3S3lZQW13ZHVZN1Zt?=
 =?utf-8?B?eUNrUC9MWUNDeFJFR2tMbHlSekRqUVM4WXRRejVyWWpxZ04rRHpQZ2FXdEVW?=
 =?utf-8?B?ZTBEVXlrTnlZQXRzRzNaRTV3Nk5kWWZKb1BCVUxHaGtPOVR1ZEw1TVVsdXhM?=
 =?utf-8?B?NUYwTWFiWWdvdmxZUGY0RXlaREVXV3dBbUQ2eW1TSXVhSmZKS3o1YXkydkND?=
 =?utf-8?B?cStaSnM3MFVHdUVLaGxHMUFJMnZjbHdML2NtNnM3UU4zY0FNVmdrMkNzN2pL?=
 =?utf-8?B?eldENURoUFllQmJPYkVneTBvZTQyaGk5T3dLWnhsa1NNdWg3WURyTDlVM2NM?=
 =?utf-8?B?OUYrS0RDMkhIcTdJTzViRXFHRWdINC93UTNuVFhmUC9YaW04RFEwOHl1SXht?=
 =?utf-8?B?d0ZoVXJiTnZIdHBsNXlXWWxSbEhwb2o3T1dYbkliaEpzVW1IbXdwZWZaVTRz?=
 =?utf-8?B?THBmV0JGUXA5Z01xNnpYUWR2T2cwUjYvNTNOQkt4YUp1amQ3V2tEZUhJMUVj?=
 =?utf-8?B?SzE3aVVCZDN1TncrZXNCSURxTUZ0RHYxYzB6YVBOZmhPYnRYc1g3bTZIMzll?=
 =?utf-8?B?ZnhYT1pIaDFLdnRQOERKbjhVMHVxcWp4MVdWWHZzQmE2ZGI4NGc2M1ZaVXhD?=
 =?utf-8?B?Wkw1YjJvYnUwWlcwU0w3M2RDZnBVTCs0dEs2bDJpNUVSWVFWS1RoaE5yUlls?=
 =?utf-8?B?dlNETDRQcmIrNzArWndPd2RDOHEybHExbkNIRUgvYStEUXNURDlLcDhrK3FV?=
 =?utf-8?B?eW9xNFhOWDJZOHNPTElLMFFCcjVqdW1rTGR4Y2xjV1BsRnM1aGkyNm96SXg0?=
 =?utf-8?B?OWhSa1VIS1N2NXVzWXh6a2ZDZ25mSFpBSk5IR1dVeXNmTlM4N2tVd2ljK1hr?=
 =?utf-8?B?dWVCM013K09mamF2aTY3OS9vVXF6ZU9SU0Z1dnk3ZHBOWU1tcnk3T2dzbzlV?=
 =?utf-8?B?d2pIUExmem5iUjhGa0lJdUFob2RMZ012TkgxaXpHZkthNE04Z2wreGpwZFFD?=
 =?utf-8?Q?Ig+IftEj539nRfsjEY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e9691d-e9d8-4885-1ade-08dde690ce77
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:12:57.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_171327_766787_97C24EF3 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDgvMjgvMjAyNSA3OjE4IFBNLCBBTE9LIFRJV0FSSSB3cm90ZToKPgo+Cj4gT24gOC8yOC8y
MDI1IDc6NDcgQU0sIENoZW4gV2FuZyB3cm90ZToKPj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3Ju
X3dhbmdAb3V0bG9vay5jb20+Cj4+ClsuLi4uLi5dCgo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9w
Y2kuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4gKyNpbmNsdWRl
IDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+ICsKPj4gKyNpbmNsdWRlICJwY2llLWNhZGVuY2UuaCIK
Pj4gKwo+PiArLyoKPj4gKyAqIFNHMjA0MiBvbmx5IHN1cHBvcnQgNC1ieXRlIGFsaWduZWQgYWNj
ZXNzLCBzbyBmb3IgdGhlIHJvb3RidXMgCj4+IChpLmUuIHRvIHJlYWQKPgo+IHN1cHBvcnQgLT4g
c3VwcG9ydHMKTmljZSBjYXRjaCEKPgo+PiArICogdGhlIFJvb3QgUG9ydCBpdHNlbGYsIHJlYWQz
MiBpcyByZXF1aXJlZC4gRm9yIG5vbi1yb290YnVzIChpLmUuIAo+PiB0byByZWFkCj4+ICsgKiB0
aGUgUENJZSBwZXJpcGhlcmFsIHJlZ2lzdGVycywgc3VwcG9ydHMgMS8yLzQgYnl0ZSBhbGlnbmVk
IAo+PiBhY2Nlc3MsIHNvCj4+ICsgKiBkaXJlY3RseSB1c2luZyByZWFkIHNob3VsZCBiZSBmaW5l
Lgo+PiArICoKPj4gKyAqIFRoZSBzYW1lIGlzIHRydWUgZm9yIHdyaXRlLgo+IFtjbGlwXQo+PiAr
c3RhdGljIGludCBzZzIwNDJfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICvC
oMKgwqAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlOwo+PiArwqDCoMKgIHN0cnVjdCBj
ZG5zX3BjaWUgKnBjaWU7Cj4+ICvCoMKgwqAgc3RydWN0IGNkbnNfcGNpZV9yYyAqcmM7Cj4+ICvC
oMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIHBjaWUgPSBkZXZtX2t6YWxsb2MoZGV2LCBz
aXplb2YoKnBjaWUpLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoCBpZiAoIXBjaWUpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIGJyaWRnZSA9IGRldm1f
cGNpX2FsbG9jX2hvc3RfYnJpZGdlKGRldiwgc2l6ZW9mKCpyYykpOwo+PiArwqDCoMKgIGlmICgh
YnJpZGdlKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhbGxv
YyBob3N0IGJyaWRnZSFcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgYnJpZGdlLT5vcHMgPSAmc2cyMDQyX3BjaWVfaG9z
dF9vcHM7Cj4+ICsKPj4gK8KgwqDCoCByYyA9IHBjaV9ob3N0X2JyaWRnZV9wcml2KGJyaWRnZSk7
Cj4+ICvCoMKgwqAgcGNpZSA9ICZyYy0+cGNpZTsKPiBGaXJzdCwgcGNpZSBpcyBhbGxvY2F0ZWQg
YW5kIHRoZW4gcmVhc3NpZ25lZCB0byAmcmMtPnBjaWUsCj4gd2hpY2ggbWFrZXMgdGhlIGluaXRp
YWwgYWxsb2NhdGlvbiBlZmZlY3RpdmVseSBsZWFrZWQgYW5kIHVubmVjZXNzYXJ5LgoKTXkgZmF1
bHQuCgpUaGFua3MsCgpDaGVuCgpbLi4uLi4uXQoKPgo+IFRoYW5rcywKPiBBbG9rCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
