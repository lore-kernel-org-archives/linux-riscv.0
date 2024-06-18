Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F1C2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQYqhXoG751CPfibbdIETu0TdceosB7fI3o+aPXwtRY=; b=t7dipF95CwW7I8
	S/d8uznVRCBJVln14iZhpIxoKf9z3acwhBTNc0Nybtn4tKWns4qI8orRxaCumsCTCFf59twLG2p71
	KMqNuXiUCeNdMaaJ3NIEM5rsh6gVYdE+LBASxT+eHWaZplql1NZG1s31JJdqmAcXj1zNXEUydSO3y
	NrJ43kJH7wWFRlzKighMhdQ+SymZ+DWft5gMxh6ubDGPRV/myiKqoL4viFVfQ7EIKW5S+/QVcFmEl
	Op2NRWcFLtPwkiQWKD2m+CtWs0XAG0R9fo9lhsC03QPuhTXPmW6+ajG1h/IwEYc1racoN7GvJxOCK
	kkaVxkc3hStKfUNAQ7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVX4-0000000EEEF-2hFb;
	Tue, 18 Jun 2024 09:53:42 +0000
Received: from mail-bn8nam11olkn20803.outbound.protection.outlook.com ([2a01:111:f403:2c14::803] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVX1-0000000EEDk-2dgQ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 09:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD7xPL8n34eSxZWUX4yVnhR666QWMiTMpRhddydb0FpLlt3aMyjEzDtUY3NivTRKuX7Ki2NmUASr7SYarD58/eZWccFHOMhR/3AqgFAnAnwBWXxpX81cvbR7MUpgVlAXCSHOYjGN5TuBWaIlOMVAI+btqFow0eSqE/c3AbjiPldDZ3/X5F3XECw/MV5xbn08FvCLJ0iBmhnCwFxmMqRwHISvUQ+HE/YaO/fuG2OiskbOeI824UISQPBBqx8hvmO0pjXPMRy6WMViyJadDBbZPQ48vJzckqhKqGLjn1hfie0MhSQwd+qhKVxmFSM0RkUApDfva/NXOyMeRqG7elhmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPBGng1gKqr0Ym2qNgsbeBOkEfBwp1vfRgOet2AaWO8=;
 b=XCYMZCPCm/9WrEEDYHgiZOaP952fec8Ub9WAGpD3ilhP+cWNf+yBHImeGM4na5Po3Ge5wxDPkt98hFpvig7cCPOczRyW8CUrvCXhiu+Va6TGwCiwRTYRqmzr7WGmJvXULeXV26PGODsj0JgVVfq31yAd6S6+ymHcARMgc14gi30wrfo4hva+36qu3uT8dLrDjm3Ijrc4na3s+94+yPsCjgEkccuX2Y1UnBjYzmFqw18rHSztKnerqdtoAivCkFQ7+4XdYcy5VvJ4J8gtOZrso4LBzXDvp9K+qiOF6oaXtjrXdDL3TzBP/W7pmqXMB5z8AGXp5wjZnChX2yUOLvEukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPBGng1gKqr0Ym2qNgsbeBOkEfBwp1vfRgOet2AaWO8=;
 b=TxRcNnSucUxzJmNpgv6lYEtSNy6Q3GG9zAKp2tusBIxPEHWSnut+Yy5iV2A28z2JiD0VxI3d7OtFQ7YnNQa/c1Y9yTKsrmhSglbjNbdxgt5c25D+M3cMD1M0X+W1OImrByKOXUaxMoAOySUDgPuSlL8jCGadbIoTG8Jrr5I6Qwo9AXM5NeNqVSj8iRcEarp6f6toPzbKmWLaP2TOlbPYIn/OXTiX+UBwnTfr7SJxGxdqQlT4QhcKwSQsA0oS7hQJo7pvx6lT38aOYrFOXsjraDZA/AQMyNrfBqQVgIyV+14vA7x02JFA3vmxJNcQKoCkDonhmILapiNOzVG+bKMkLQ==
Received: from PH7PR20MB4962.namprd20.prod.outlook.com (2603:10b6:510:1fa::6)
 by LV2PR20MB4678.namprd20.prod.outlook.com (2603:10b6:408:178::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 09:53:36 +0000
Received: from PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c]) by PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:53:36 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: disable write-protection for milkv duo
Date: Tue, 18 Jun 2024 17:53:18 +0800
Message-ID: <PH7PR20MB4962ED1765D0602DA853AC88BBCE2@PH7PR20MB4962.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <SEYPR01MB4221943C7B101DD2318DA0D3D7CE2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB4221943C7B101DD2318DA0D3D7CE2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-TMN: [tw+5rdLw/LwAxfHo0qQXVUlEUoL5mqpl9/km6iOoUOg=]
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To PH7PR20MB4962.namprd20.prod.outlook.com
 (2603:10b6:510:1fa::6)
X-Microsoft-Original-Message-ID: <171870435173.651883.10154649703016964785.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR20MB4962:EE_|LV2PR20MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 15900f27-1f18-452a-2242-08dc8f7c85bd
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|1602099009|440099025|4302099010|3412199022|1710799023;
X-Microsoft-Antispam-Message-Info: ucTtE/m6DVb/2duooEuLZW4wTaUhdBtHERlkHNZfY8rOVMmmB1BW9igEdH4VOxkhlUGTuoarCZYEs8U8izcPAkvBj82lFwN4NLZ78K7hXa/zCTr157S/kuXw7FlKvYUwODJw9MtAuN24sWs3Yru4cLrFreKdb3sTDPw9u6Zjcm5Na5WvPCmysuSqPpk5DN+XCWMfLJpiVzt8AJd8Bb9GdHb3UxmP7v/Z8hdBg4JSCTC/5EalH8Kh+P2Tgo8sZeveCZJG8NC+bJZD17qVHtKRDDuM3DRSRgfa93jD/rD70SzsutRWBn7wgRQ0CkLhFIc9/vXGOj/aroTAzKGNiNWD/frJYwAci3B7YMYyjml1XlsWUr6fSuuqjrRrqYFWrsKN/nbq1vKsjCFVhUZD6gAquCCED4COJSM88XBBRPfw2A0A6oU87xMEZyUpVDwXIyTNFheW4EB+T/xfxahwNsG25GM20oawJX4+pzVz68LAt+nzSAMqbld1ZrcbSkzs5MBSJdZdK9LP5KPw3d/wyDv6KgDNE851EM3O0B36xSAh0qKaUy/MKv5yKB9odgdi4BxPzlQC1kzVekNXxNVddVkmdAUIuRvt0PParcWmYi3+JvYvr/lG99V8WryPSGLMOsjZSMV344auI+JyaXwmcgEPnohBFHPZblFPrSR0rKG7BbNcY8JoIF9f01fzSH5dQ8oRgPRBonEPcxR0ePXs70GyPfy5Yp3FiRpjl1ubkzjemZU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1LeGhpQzE2RmlJaVlnWFF4cEsyK01NeDFhTDU5cnJaUmk3bnNPQitzK1Mr?=
 =?utf-8?B?QzRQbCtoeWptcUozV0dsWGlPSjNIc0ovTzB5N1BjVTZhdjR4dFVnR29lR3B4?=
 =?utf-8?B?cEVOci9jYktJd2NEMTNYVGFBaGhveVRCMktvaVhmb2RvTmRnOTVkT3pUTFlR?=
 =?utf-8?B?UGpDQmZrOEdjSTliN3pyMXNsT283RGpsaVNoRzRmQXB5NFB5czNZSEpibzhz?=
 =?utf-8?B?MG1Mb0JCYU45bjk3ZDE2ZCtLRXRydE9vMDV0ZWJKVk4xbGx5dlAvM3JmaXRJ?=
 =?utf-8?B?TlRKcEtuUUkrVHNDZ1pvQlVTN2RmSUlhOEFHUnBtVzFsQTFId3EvRG9GZ3lj?=
 =?utf-8?B?bGxjWUJSZU5sZU9jV3o2R296bkpodXJDSHFDVGlPMnRvT0J0YzdaQWpQeXNt?=
 =?utf-8?B?SDR6K2w3c2g5UXdJOWgxNzB5dXZDUVFtQlc1b1FFZEFJNGJkTTM3QWNEUkpn?=
 =?utf-8?B?bk1LZDRraXJjUkNoSml5SzN4c3BjSDJkRFpZdFRyclJMRzhsUm04TUlxS3FE?=
 =?utf-8?B?S21GUHdiR0JpNDdHVW5rTWdmWkZISzNWc3BnUVR1OEZpSms2YmJ2T2FxV2s2?=
 =?utf-8?B?SWw4YVFPMGw3ZVZ2M1g1QmdMS1NkNzBPd0NWT3pPei9DRFY0NENrdThSSzhQ?=
 =?utf-8?B?YmdtN3lsUTlOc1BaUVZGRW9uejZpc3lUTWZuTVorTWNwOUhNdk9YaFhxbG1P?=
 =?utf-8?B?ZklROTRjZzNLaWtVSVkwTEpWSzUyZjBLRGZWalJrZXR6MmJpeVVNUU1MTExi?=
 =?utf-8?B?QUdLdi85dUN4VkkzYU4zODM3aWJyTE5Qb0xlOUNuSExQamhTZnRqQnNITTB0?=
 =?utf-8?B?QmVWa0JZVmFUT2tKUjcwRUZ0SlBuNzJVNEZFVEwxR1lZVG5SWkZxbmQ4Z2Fv?=
 =?utf-8?B?MHhhUThNeGNoZVNqQ1lTSEVuUC9ZMDV2eXdKKzVXM0wzdU96cE8zbDFBeDdV?=
 =?utf-8?B?YTlESEVTcFZnNjhEMlovZjhRWEYvRjVqTTJhTnBTbVF6TDNmSXhCYjFrUE1s?=
 =?utf-8?B?T0htRTF1aFFPK2Q5Ti9vY2RxUjllMzVBRGhyYTJZYzVZejlIZ1ZFQ2s3TW0x?=
 =?utf-8?B?d20vbGlnMitsbGFZcWEyTEtIZFhVemxpbDExUzBSWHZtNDBoUFBxSXNoYlVi?=
 =?utf-8?B?THczSnlNMG1MS2hlWXNPQXB6ZWROdkE0RDlhSG8wK3g5NlFVTWN5U2svRUNt?=
 =?utf-8?B?MW5RUFNNRWhrRzdCTmRQUVFuclRHTStlT1BqeEIrSURyWlR3UnFBd2ZiSFI3?=
 =?utf-8?B?MEFsZFVUQ1A0cWgvYnVCRWVMYVk5NDhyUjV0MVNCcndSMTNkSTNoL2M0NmVH?=
 =?utf-8?B?cHFEVERidFBUcW13WGtpanhHQzkwd1ZjQi9KZTdoMVFqcW11MkdaVW16bWVQ?=
 =?utf-8?B?RlhMQWJ4c2Q1SklXU1ZkN3dPZ0hCek9NNTRtN01UMmFmOXJyenJKb0x2MlBG?=
 =?utf-8?B?VmV5R1ZWMTd3YWJNWDk5NklFZ29HTUxpY1ZuNmg5ZjJVMS9IUmpmMFJQczNo?=
 =?utf-8?B?M1lSYXZ2OWpWbzNjM1FnVm1GRjdXVk96VU5iVEh1T0doUGtsdndXUDRHKy84?=
 =?utf-8?B?WmM0b3lwRHlGcmJ0Q3dtRnpwcHJLNFlsV05MRlBkUmxhQklxSzIrdjY1RmVP?=
 =?utf-8?B?TTR3V0ZzSWtOdDc2K3UycVhMU3FHMTQ3ekxBSnRmaXFhV2lVanJsUDhRTnFU?=
 =?utf-8?Q?F+kyfeOkrvXeCpgaPGw3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15900f27-1f18-452a-2242-08dc8f7c85bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR20MB4962.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:53:36.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR20MB4678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_025339_708489_BF065EFB 
X-CRM114-Status: UNSURE (   4.81  )
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

On Tue, 18 Jun 2024 09:16:14 +0000, Haylen Chu wrote:
> Milkv Duo does not have a write-protect pin, so disable write protect
> to prevent SDcards misdetected as read-only.
> 
> 

Applied to sophgo/fixes, thanks!

[1/1] riscv: dts: sophgo: disable write-protection for milkv duo
      https://github.com/sophgo/linux/commit/90f6cc7f8e07b926f60e3a37944c428e7809bed1

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
