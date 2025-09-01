Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F702CA1000
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRPLuomp2xJ6JBd1fEm2CK8psbGMHI1gXs1vOowuRPM=; b=iSr/BcGDj9NqEoGZKSqDz+5n59
	YiRm+btOUya5zfXXK+PBOvzpvIm5g5sCfexPPr3BYsNjhQ9/1OniNKCJjh6RWEzpW0xn0ONRSMKo1
	/VZBOMljbd+24GQaqA4YExBY4lQ9ivjoiNTFvJWmnNdMO0LuVPsBeImhckI9JKZcmRspGvrc+Szii
	48oZY18xGRSbLWC7Egs9iNQK6G4d0/DgCU4ZiGx3wu3cdnEzqWQ3fSw4F2pA4FegPo2k0UZhmpJNa
	bSzMrGfeD9j46moSX00q9AHb3zjNi98Z0sQEdU5T/yenpdlFJXJIfq3eH3esr8ECBp9mqkbrMsRrV
	9aXhIdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyGD-0000000BM1K-3t1k;
	Mon, 01 Sep 2025 06:43:25 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxb4-0000000BGai-48AW
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 06:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnZVyyttCdQmaJVG/jLBgdsb6/U+H96vmUCbUmBBun/iLJ1YMJwSRDIGIfmCLjn0u6XUcE6Sd1lRVv/5697jCFNEqEEg0g6nTXLnaPD1anuaU2ouo6KCmlYVMCNbP4SC9KAM464b9lO65gyX7zD0ejBlh08sgCtpmoTTFIKCHA9SoCUFP5PL1oFB1YCoCl6Cr9bJGlypF+oOq63xEkZc5A57/dq5dD1/WLIhOy6IcnZcWfQmoeMmLR35r1EfmvhP9R+tpSt/u/8lqE1dBqodQBVqGUIaOHZgDfZ1A5uBL356xypvyO33btVEkupk01MYqyHYcnXYTQvOQl8Tj7ifQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv+w2nqZ4LJJIA0JDUEAk+MrlrDBnbAzrM7LzkMym/Y=;
 b=dzrYvJFMf0NcOPgDjhWKL4CFNU6YJ7MHhe3S3Dz2N8i+Cr3AF8gqzMZ8+BztMWqAjoU1ga0SZOcgno8hns2q1iqxTNm9Abk3/JGOEGWy3OO6ziSYot5gDyZaQfKfWNYlk4Dy8tNbsuOMkpzkD17BKtI9ub8GVnJ9gssqCf1E2graFZ29BqfIue7QD0hIcMSLdZPBZx1EMGtFOcejEy59QfRULkWHmmbk7AVzMPHIGw/54HcKFoATUuIX4CGMgJBrgTq5taqXHvdpUur0Aa+GjUhSfVMGdMwefUFMOsMoCr4tirbmovj60Ij9PBmDRjEhXlkxMq+gBBacK5RfCsb2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv+w2nqZ4LJJIA0JDUEAk+MrlrDBnbAzrM7LzkMym/Y=;
 b=uFKhJEHzkSqkg2F+0FqYMo1Lg5DQ1TfQwzXX0gwKcop42TrQZXdFt/EdhPa+fCgMvNwf2sLV/YdYcs11GtA09xjomCemiHeWKFdc5qrF2H63MjXnWman8JQiqRJ4JDksrvCRnz02Tom4Tt2mlMeb343nOwrAbdS2bFeUtCnuOdi0Qj1IwVNmCAyRgF2+GiWPoeDNOnaGZCqVTxemdV6Lon65k+FVn01bR3qDKBp6r8bljUR+QS8R9VvQfBn7j6lFSERgGsbyBcKTFp/tta5yDYwz5EdMuCNdn9iLE1newYxhCgx2B5N5I1TP3/XS5TSmAfjel/0LqIElTPecwMNMuQ==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PNZPR01MB4480.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:19::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 06:00:35 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 06:00:35 +0000
Message-ID: <MAUPR01MB110724916F72E34B35E9E6361FE07A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Sep 2025 14:00:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Manivannan Sadhasivam <mani@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com,
 bhelgaas@google.com, conor+dt@kernel.org, 18255117159@163.com,
 inochiama@gmail.com, kishon@kernel.org, krzk+dt@kernel.org,
 lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de,
 thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1756344464.git.unicorn_wang@outlook.com>
 <1df25b33f0ea90a81c34c18cadedd38526a30f01.1756344464.git.unicorn_wang@outlook.com>
 <xfu33ans5jaivwcadv6pjontvu5b4n42jjjtvqiqfhqxieoimg@2yaz75zsj7vf>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <xfu33ans5jaivwcadv6pjontvu5b4n42jjjtvqiqfhqxieoimg@2yaz75zsj7vf>
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <5536c75d-79b0-4510-93ae-2fb8b4eb2822@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PNZPR01MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed304a2-86f1-45b2-8fe4-08dde91cde0e
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|41001999006|19110799012|6090799003|15080799012|23021999003|5072599009|461199028|52005399003|41105399003|440099028|40105399003|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG1Ua01yMndHcWEzNVNrQUdLZGQzZVZKTUx3bzgrcEZBWUlITTZZOTNmSEFk?=
 =?utf-8?B?RmRvcDJMN3V6akcvRkZtNU5tMytWblV2R2t6Qll0d2I3TkV5bEhDNkdwVUFX?=
 =?utf-8?B?ZVhGS2hXNFlqcS82M2RGTkRFbGtwaVZpc0N2R2RsR2FjZ3E4RnZiRkJKR0hC?=
 =?utf-8?B?bXJLbXJWUWlrL2JHakFCbHQ1bFZHSGJ6eWxiVHNBU294d2M1Y3FpZHZySmRQ?=
 =?utf-8?B?b25DM3d6amtNM2RKWjZ3NzZBUjg1UWJmS2RaellES2R4VGE4THp1T0pBbFpm?=
 =?utf-8?B?WGtiZzBXamxnODNtK2czek9MRmpTeWtoaHJXOVJNN1BRcWZjN2xqd3ZCakIr?=
 =?utf-8?B?b2FzMkQzUUpNbkFWT21pcEtBQVJ4MlpsbFkwQ1dOYzc4WUhsVkEreUV3WVln?=
 =?utf-8?B?SzhNbFhTNmEyTVRjQ2pSK0Z6ZTBmRHBQUVFmMlZBa0k3Uk9rdkJjdnYraHFH?=
 =?utf-8?B?cEcvYlp1RWp3amRpMlNLTUlYOTNaR0xrcnFKWVU3aGhRdEpqOFpEdnNCRXk1?=
 =?utf-8?B?cENrNVdnalNOWFVNbS9hMTd5Vm96UlRBbDlEK3czNU1wQUlkVHBBQmd1V1E4?=
 =?utf-8?B?bGV4MVFyODI2S3UrckVrbVAwZjd2Wi8vRmQxeUk0OWJReTRPbkJ0UXR4azdm?=
 =?utf-8?B?ZStLUWIyekhOUnJ0VEsraVV1aXRpbm5EemM4RWNJNFJQQW1HNU44U1c2MUg2?=
 =?utf-8?B?ZWNUMzhRMUM1VUNlZWNsekp4Ykp4VjVXWkJGQmpvZXNQSkN1aWNpdFRiRlp4?=
 =?utf-8?B?MlNSc3RaLy9WcmdDMHcvM3FjQ056TTVlTHFla2xmaXljRCtvbEQrYjNzYUt5?=
 =?utf-8?B?eUV2bnhMNXdIaDZ6VXdHQXp0RkdGcURpeVBPTjkzM0Q0U0VQQmNNU0JESi8y?=
 =?utf-8?B?aFFIZGJhdUlSZDVxR1Z3eHk0UDA3Z2dsWm9UNmYxbk1MTU9mNWlVcmdRMmJi?=
 =?utf-8?B?NHNDQTZTVkZmRFM1T0xFOVozdjRmVnR0U2FhNTZqRjJxeTZTUlNrZ05OZytQ?=
 =?utf-8?B?d2Z1S2krU3lFR3VNV3l0em9HcXFnTVc0dHZURTlvUjVFUkdWTFhMTUpwQ21X?=
 =?utf-8?B?VFhxd21uVVRRYytrK0NHRWFhRjNnY05CV1ZtTFlJejgxYkRuOHNoOGE1N0g2?=
 =?utf-8?B?SitYK25xWmlCTzBOUWw5ZjJkUlBOZld4UU43ZG9vVDIzK2JMMHlYTEVjYUs2?=
 =?utf-8?B?SnF2NXBoc2RaMnJSZkxuRGc3TUJnd0cvTzFXTnNUclhFaDFDbWhpaEZWd2hh?=
 =?utf-8?B?ZVZMOVJJa1NpTXROaC9OV3FTejF2TUEvVUg4Y3poSE9LVUFKVTVYT1NZSHhk?=
 =?utf-8?B?eEU0dUV3c3lCL3d1NkhpZThnbGNuT1Q2QzhvRWs1aC9pcnVnSkVlcmMxcFpQ?=
 =?utf-8?B?U2cxMnNBay9JajVKS3hEb3VBcXpIdStxalZDS3UveXJ0R1RTcmlYRFZsS0ZX?=
 =?utf-8?B?M2F2ekxXSHNDQXZlaGxaK3lCVU03Nmc5a212YkI4NjUxZjZIeDZzTXdlNGNj?=
 =?utf-8?B?YXFOV3M2ckxKVUQwUmlvc3BBL1dqSGdSMElKUEpkV1daUEZXZ2JsOUhSd2pT?=
 =?utf-8?B?ekhvbEdRSmVySDJqcGJHa2VETGhjWkRIbzRwWHFKeVA3SE15KzNRbStDM2FF?=
 =?utf-8?B?TUhxQ1l3UXZ3RGdrL3hTaWdITzFwbTJKKy95UVBGOW1Mcytsb2Qxa2hzaGkv?=
 =?utf-8?B?a3NqRUE1dmxmbnRMRjVqWlVRMm9ZbTQyZDU1ZUxwdSs0dEJoMVVnak13PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXl5aE8zeWk0NndYdEcrME1qVlNNR3B4RWRZK2p5ak5HeXJtRmhjUVRCK0Z6?=
 =?utf-8?B?RWtMU3EvbkFGNXk1NkU1TCtrbm1HbFJYQm51UmZPTnIvWkR1eEl4RFRHR1E5?=
 =?utf-8?B?T3c3TG5CM0FJenhPTzVMMHpJVkQzdDV1dnhCSUl4N0d4OXk3cENkK281UG5F?=
 =?utf-8?B?YlppV3paMEVoV3JMWjYvMTJNd0RqU25hSmgrQ1ZxSDF3NGdUdGJadHlQVmk5?=
 =?utf-8?B?aVdKUGNNK3lLWFZ4WFJLUGtrbndXRHJtTW9FZXFldkJOeGQveTdrN0xld2ZN?=
 =?utf-8?B?OUk2NEQ4YlZEeml3N0pOcDdpaTIrRjRMZHdaRDFrdlkyRU92OHlnbnpMK0dM?=
 =?utf-8?B?MnFoMU1RSWRYQnI2dGRjYmQydnlUVnV3c2FhOVowMFM3UUtGKzVuQ0x3ZXAy?=
 =?utf-8?B?RXRkcHdNUjBzN0NCN09tSHBkRjE0YXhkeXNGODdPMWg3azJDdU9iS2tJaDkw?=
 =?utf-8?B?YkJRZzYrMkZOMS9XalZtNTlSYU1CTXBOQTFRNFVWTDZZRTV4RHFrK1pSbjZz?=
 =?utf-8?B?Zmt2bkhGeGdScXFTTGl0ZVlGRndaeHRCSFRnRm41SlAyd3RxOHR0L1Q2QmVz?=
 =?utf-8?B?dmZheHNBTFlPVzRXQnhzK2tZTDJXV3FHQ2M1cDd2d3RhSFp1R01QTnREQmpo?=
 =?utf-8?B?YnZiZTBiRWJ2bTRvcFAwVHlzYmZsMVdreVVScllZMVlKc3FDdktCU3h5R254?=
 =?utf-8?B?aVJIZFVrdUxSaDVWK2psVnFTWEg2WWdLbGxrTUt4clFZb1cvY1ZDbnExOUhx?=
 =?utf-8?B?RjhqOGxNMGJ2YTZHNDV2WkdrVUNhMVM1RXZuNncrUVBUT05mWWhRVzBRMHNw?=
 =?utf-8?B?SWRRdGdFalZmenF3dnE5Zmc4dFVUcStQUGR0S1JlTGpLa3FEWHZLR21QSVp6?=
 =?utf-8?B?THNqOXVHNFJiZHExNXBidHhmajd6VmxUK3R5TThBRzlqSms4ZzJYbkJMYlNN?=
 =?utf-8?B?Sm5JUU9aQ2QrUjB4RmNmM2sydnRxNHRxeVoycG8vRTBoNHJtcHhXcXNKMWFK?=
 =?utf-8?B?RkNuMXVzT1hnNzc3dW9HbEFZamF4aFVwSS84bXI1Zml3QnltZHRIQlFzNm5H?=
 =?utf-8?B?Tlh1cXhVSThneGlxYjQzUytuWTNhV3lGT2R3SFBUZFZSK1hZRkQrRXdJWmM2?=
 =?utf-8?B?cHJzOFROZHE5dDFna05LQzQyV2xjakRJZmZLbzBpK3JlQzkwbHhZL0RVY0Q1?=
 =?utf-8?B?T1hReEU4Q3I4Q1dWWDZwWUs5cU5ROGVqdVVkaW14Z0FkQ2REU003dllJa2d4?=
 =?utf-8?B?UGw5NnZjK1g3SWtSbEtHY1BKdUk3OEhIRC9PQzJIeGJHRTZoQU9PTVN6U2tP?=
 =?utf-8?B?MTB6cmo4NGlwQVlhcWREZk8rNWVzTno1Z2VDS2NsWTh2cktnckZ6Vk1mbThu?=
 =?utf-8?B?RjhuZ21iTWlidkVXZXdFSGJzR1gxUlp1U2Y5ZkF1Y1dqQzllc0pJdmpla0h5?=
 =?utf-8?B?dXZIOHo0OHlldnZCdU1icVlaYlJTcEI2dDVSWSt5bkRCazJQSFVFR0xsdmZw?=
 =?utf-8?B?ejVyaWRjbVBYVnNsdE9YOHlxMWpQUU5CZVlUOFNwUHFKWkRqUHY3M29MWWI1?=
 =?utf-8?B?R3NOVmxqWUZjRDB4aitkcTQvdTZxQ2RXWkRKcVh4MUdoMzlKYnRBZUdJcXJM?=
 =?utf-8?B?L1F5SGEwQktsT0xZV0dIOE02TUlGeXBKNkNEOWE2K0xycG9tSTNvcDNsM2di?=
 =?utf-8?B?N0UzRHZaekNRZzNDc2p3cWxCbVl2d2J0Tm9mVnhWWFd3K0JmREVJTjVtRlcz?=
 =?utf-8?Q?0SyzCYUJeI4xqJwvjkiimzjuvDtrN1iS1abUbDy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed304a2-86f1-45b2-8fe4-08dde91cde0e
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:00:35.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_230055_037922_7BA14089 
X-CRM114-Status: GOOD (  25.11  )
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

Ck9uIDgvMzEvMjAyNSAxMjo0NSBQTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+IE9u
IFRodSwgQXVnIDI4LCAyMDI1IGF0IDEwOjE3OjQwQU0gR01ULCBDaGVuIFdhbmcgd3JvdGU6Cj4+
IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pgo+PiBBZGQgc3Vw
cG9ydCBmb3IgUENJZSBjb250cm9sbGVyIGluIFNHMjA0MiBTb0MuIFRoZSBjb250cm9sbGVyCj4+
IHVzZXMgdGhlIENhZGVuY2UgUENJZSBjb3JlIHByb2dyYW1tZWQgYnkgcGNpZS1jYWRlbmNlKi5j
LiBUaGUKPj4gUENJZSBjb250cm9sbGVyIHdpbGwgd29yayBpbiBob3N0IG1vZGUgb25seS4KPj4K
PiBTdXBwb3J0ZWQgZGF0YSByYXRlLCBsYW5lcyBldGMuLi4KT0ssIEkgd2lsbCBhZGQgdGhlc2Ug
ZGVzY3JpcHRpb25zIGluIG5leHQgcmV2aXNpb24uCj4+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2Fu
ZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2NhZGVuY2UvS2NvbmZpZyAgICAgICB8ICAxMiArKwo+PiAgIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvY2FkZW5jZS9NYWtlZmlsZSAgICAgIHwgICAxICsKPj4gICBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2NhZGVuY2UvcGNpZS1zZzIwNDIuYyB8IDEzNCArKysrKysrKysrKysrKysrKysr
Cj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1zZzIwNDIuYwo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL0tjb25maWcgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvS2NvbmZpZwo+PiBpbmRleCA2NjZlMTZiNjM2
N2YuLmIxZjE5NDFkNTIwOCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9j
YWRlbmNlL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL0tj
b25maWcKPj4gQEAgLTQyLDYgKzQyLDE3IEBAIGNvbmZpZyBQQ0lFX0NBREVOQ0VfUExBVF9FUAo+
PiAgIAkgIGVuZHBvaW50IG1vZGUuIFRoaXMgUENJZSBjb250cm9sbGVyIG1heSBiZSBlbWJlZGRl
ZCBpbnRvIG1hbnkKPj4gICAJICBkaWZmZXJlbnQgdmVuZG9ycyBTb0NzLgo+PiAgIAo+PiArY29u
ZmlnIFBDSUVfU0cyMDQyCj4gUENJRV9TRzIwNDJfSE9TVApvawo+Cj4+ICsJYm9vbCAiU29waGdv
IFNHMjA0MiBQQ0llIGNvbnRyb2xsZXIgKGhvc3QgbW9kZSkiCj4gU2luY2UgdGhpcyBkcml2ZXIg
ZG9lc24ndCBpbXBsZW1lbnQgaXJxY2hpcCwgeW91IHNob3VsZCBtYWtlIGl0IHRyaXN0YXRlIGFu
ZCBhcwo+IGEgbW9kdWxlLgpZZXMsIEkgd2lsbCBpbXBsZW1lbnQgaXQgYXMgYSBtb2R1bGUuCj4K
Pj4gKwlkZXBlbmRzIG9uIEFSQ0hfU09QSEdPIHx8IENPTVBJTEVfVEVTVAo+PiArCWRlcGVuZHMg
b24gT0YKPiAJZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9TT1BIR08gfHwgQ09NUElMRV9URVNUKQoK
T0sKClsuLi4uLi5dCgo+PiArCj4+ICsJYnJpZGdlID0gZGV2bV9wY2lfYWxsb2NfaG9zdF9icmlk
Z2UoZGV2LCBzaXplb2YoKnJjKSk7Cj4+ICsJaWYgKCFicmlkZ2UpIHsKPj4gKwkJZGV2X2Vycihk
ZXYsICJGYWlsZWQgdG8gYWxsb2MgaG9zdCBicmlkZ2UhXG4iKTsKPiBVc2UgZGV2X2Vycl9wcm9i
ZSgpIGhlcmUgYW5kIGJlbG93LgpPSwo+PiArCQlyZXR1cm4gLUVOT01FTTsKPj4gKwl9Cj4+ICsK
Pj4gKwlicmlkZ2UtPm9wcyA9ICZzZzIwNDJfcGNpZV9ob3N0X29wczsKPj4gKwo+PiArCXJjID0g
cGNpX2hvc3RfYnJpZGdlX3ByaXYoYnJpZGdlKTsKPj4gKwlwY2llID0gJnJjLT5wY2llOwo+IFlv
dSBhcmUgc2V0dGluZyBkcnZkYXRhIG9ubHkgYmVsb3cuCgpTb3JyeSwgSSBkb24ndCB1bmRlcnN0
YW5kIHlvdXIgcXVlc3Rpb24gaGVyZS4gSSBndWVzcyB5b3UgYXJlIGNvbmZ1c2VkIAphYm91dCB0
aGUgc3RhdGVtZW50IGBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY2llKTtgLiBMZXQgbWUg
ZXhwbGFpbiAKd2h5IHdlIG5lZWQgdG8gZG8gbGlrZSB0aGlzLgoKT3JpZ2luYWxseSwgSSBkZWZp
bmVkIGEgZHJ2ZGF0YSBzdHVjdHVyZToKCnN0cnVjdCBzZzIwNDJfcGNpZSB7CiDCoCDCoCBzdHJ1
Y3QgY2Ruc19wY2llwqAgwqAgKmNkbnNfcGNpZTsKCiDCoCDCoCAvLyBvdGhlciBwcm9wZXJ0aWVz
Cn07CgpCdXQgYWZ0ZXIgY29kZSBjbGVhbnVwLCBJIGZpbmQgdGhlcmUgaXMgb25seSAiY2Ruc19w
Y2llIiBsZWZ0LCBzbyBJIApyZW1vdmUgdGhlIGBzdHJ1Y3Qgc2cyMDQyX3BjaWVgIGFuZCBkaXJl
Y3R5IHNldCBgY2Ruc19wY2llYCAoaW4gbmV3IAp2ZXJzaW9uLCBpdCBpcyByZW5hbWVkIHRvIHBj
aWUpIGFzIGRydmRhdGEuCgo+PiArCXBjaWUtPmRldiA9IGRldjsKPj4gKwo+PiArCXBsYXRmb3Jt
X3NldF9kcnZkYXRhKHBkZXYsIHBjaWUpOwo+PiArCj4+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2
KTsKPj4gKwo+PiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsKPj4gKwlpZiAocmV0
IDwgMCkgewo+PiArCQlkZXZfZXJyKGRldiwgInBtX3J1bnRpbWVfZ2V0X3N5bmMgZmFpbGVkXG4i
KTsKPj4gKwkJZ290byBlcnJfZ2V0X3N5bmM7Cj4+ICsJfQo+PiArCj4gV2h5IGRvIHlvdSBuZWVk
IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKT8gRFQgYmluZGluZyBkb2Vzbid0IHByb3ZpZGUgYQo+IHBv
d2VyLWRvbWFpbiwgc28geW91IGp1c3QgbmVlZDoKPgo+IAlwbV9ydW50aW1lX3NldF9hY3RpdmUo
KQo+ICAgICAgICAgIHBtX3J1bnRpbWVfbm9fY2FsbGJhY2tzKCkKPiAgICAgICAgICBkZXZtX3Bt
X3J1bnRpbWVfZW5hYmxlKCkKT0ssIEkgd2lsbCBpbXByb3ZlIHRoaXMuCj4+ICsJcmV0ID0gY2Ru
c19wY2llX2luaXRfcGh5KGRldiwgcGNpZSk7Cj4+ICsJaWYgKHJldCkgewo+PiArCQlkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBpbml0IHBoeSFcbiIpOwo+PiArCQlnb3RvIGVycl9nZXRfc3luYzsK
Pj4gKwl9Cj4+ICsKPj4gKwlyZXQgPSBjZG5zX3BjaWVfaG9zdF9zZXR1cChyYyk7Cj4+ICsJaWYg
KHJldCA8IDApIHsKPj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0dXAgaG9zdCFcbiIp
Owo+PiArCQlnb3RvIGVycl9ob3N0X3NldHVwOwo+PiArCX0KPj4gKwo+PiArCXJldHVybiAwOwo+
PiArCj4+ICtlcnJfaG9zdF9zZXR1cDoKPj4gKwljZG5zX3BjaWVfZGlzYWJsZV9waHkocGNpZSk7
Cj4+ICsKPj4gK2Vycl9nZXRfc3luYzoKPj4gKwlwbV9ydW50aW1lX3B1dChkZXYpOwo+PiArCXBt
X3J1bnRpbWVfZGlzYWJsZShkZXYpOwo+PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+
PiArc3RhdGljIHZvaWQgc2cyMDQyX3BjaWVfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4gK3sKPj4gKwlzdHJ1Y3QgY2Ruc19wY2llICpwY2llID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4g
Kwo+PiArCWNkbnNfcGNpZV9kaXNhYmxlX3BoeShwY2llKTsKPj4gKwo+PiArCXBtX3J1bnRpbWVf
cHV0KGRldik7Cj4+ICsJcG1fcnVudGltZV9kaXNhYmxlKGRldik7Cj4gWW91IGRvbid0IG5lZWQg
dGhlc2UgYXMgcGVyIG15IGFib3ZlIHN1Z2dlc3Rpb24uCk9LLgo+PiArfQo+PiArCj4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzZzIwNDJfcGNpZV9vZl9tYXRjaFtdID0gewo+
PiArCXsgLmNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiIH0sCj4+ICsJe30s
Cj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzZzIwNDJfcGNp
ZV9kcml2ZXIgPSB7Cj4+ICsJLmRyaXZlciA9IHsKPj4gKwkJLm5hbWUJCT0gInNnMjA0Mi1wY2ll
IiwKPj4gKwkJLm9mX21hdGNoX3RhYmxlCT0gc2cyMDQyX3BjaWVfb2ZfbWF0Y2gsCj4+ICsJCS5w
bQkJPSAmY2Ruc19wY2llX3BtX29wcywKPj4gKwl9LAo+PiArCS5wcm9iZQkJPSBzZzIwNDJfcGNp
ZV9wcm9iZSwKPiBXaHkgbm8gcmVtb3ZlKCk/CgpPSywgSSB3aWxsIHJlcGxhY2Ugc2h1dGRvd24g
d2l0aCByZW1vdmUgd2hlbiBJIGltcGxlbWVudCBpdCBhcyBhIG1vZHVsZSAKaW4gbmV4dCByZXZp
c2lvbi4KClRoYW5rcywKCkNoZW4KCj4KPiAtIE1hbmkKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
