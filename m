Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D99YHu8RtcDOBS2zapEu+R90rMrzpEZef05y62aM6ls=; b=C926dnK4FOataD
	3e5752bPts4uQnLb3aH6jSX6t9RW5KqNTfMR3/FxAlWZeV8b6KcQEZZqRl6vQBim1aqGtoN2vl4zu
	83wmSpzorhPKW02CBFuQbdBMII0WXkpKkgXVBWnmuQ/ue7Qjydj0elyZKU2PXXDtF1ATjXbLVf1SK
	nMwbHr3h1ityk4I8h8Ui4rbCbIVQQamAFMmCphR1Li2qbgJktULSTbetIncivouguJuZOExbGVpx2
	p4SjSGWq/9uVpEkesDomtunsVCsRESTeA77dijbjfIOUbht+K/RudL3ILXVZQI+zGUUVlHFaaT0m4
	eNUTkcxvCqkSx8nY9VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERNS-002N5D-KP; Thu, 21 Jul 2022 08:17:46 +0000
Received: from mail-os0jpn01on2089.outbound.protection.outlook.com ([40.107.113.89] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERNM-002Myg-Rs
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 08:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiFkQ6DqIvMXGhrRyXuSGUL+5bQWeGPCiyUwGPxdeqvZ3dWnYlYM9blOyWLxngBMCm9OWVAJ6CsUP5cIGGyeqPOjKEbQijIx3kp3/tsRWWShPp/QowtGCjQMIeykfBfWq3eB0l7iqWiha1m0bUCGedHdrSJZei9Bm1Wy88Ww3lvrPH7MQkvMWZzZthGmwCnibhqB2ECz4eM+k6O1jaYHXKjGsweR9u+tDed7HKkJ4Eb37RpKTc+fuhWbMy72ltBlfu4vtHUXb7lxFWIR5nqsKBtop97S2kM1w1ir11i13QGRdfzg+5OD19l31F2uksdjZZW7wUSwzpSVBPpseVlLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1At6+E9Ai6fAgcnh+JrNa2zD+0ZcrqgA69slK8NgADg=;
 b=lC4C750eUuLx2Z6GrPte1JdSg6nE3kU8451K7uxta+iqHKAShjSBKtD+9A1DCL831dT6pBEfKJ0cm2A8IRwwgQz1blIJTSdiG98Ihsa9qqAiKO/IycQ2BgI8X89+9H22FdmsrfauD5ZWcxjXkxdcAeb+8GdtcQhIiDngFyIsGAWrTHSg+ulRnUzc+yFqzQzB9Zp+t8MZlgds56tUsmMFR/qZ8jDe+F7cQKqroyVcmYLPKBBVTx5ggp1N33kP7BIhqaQC6SfwZT235RoqJRdB4NqOARX1HaeUqXYzPtVgPE2n5RPSyw4vzMZOU2VqP/GOq7v8+GhB7QwXjuieh7ivOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1At6+E9Ai6fAgcnh+JrNa2zD+0ZcrqgA69slK8NgADg=;
 b=ipAMVz0PeT4eG4/abAMavcb5iny7T2nUgB9tFKCY3FUu1ulNGqTU3M4DupOlVW2O0DmIpRrY+dFeDQKDQ8eqHnxzhXGTGN8ynaCTwGPWg/4B6h4B7K1AOO+TOqF1dZgprOuf7ZfVTjYQw0v8CdTF/mxQbyeBTMz4A65oy5W2myc=
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com (2603:1096:400:cc::9)
 by OS3PR01MB6322.jpnprd01.prod.outlook.com (2603:1096:604:f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 08:17:37 +0000
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc]) by TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::7c2f:2e0d:ff2a:b7cc%9]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 08:17:37 +0000
From: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
	<k-hagio-ab@nec.com>
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
	"crash-utility@redhat.com" <crash-utility@redhat.com>, "mick@ics.forth.gr"
	<mick@ics.forth.gr>, "heinrich.schuchardt@canonical.com"
	<heinrich.schuchardt@canonical.com>, "guoren@kernel.org" <guoren@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hschauhan@nulltrace.org" <hschauhan@nulltrace.org>,
	"huanyi.xj@alibaba-inc.com" <huanyi.xj@alibaba-inc.com>
Subject: Re: [Crash-utility][PATCH 2/8] RISCV64: Make crash tool enter command
 line and support some commands
Thread-Topic: [Crash-utility][PATCH 2/8] RISCV64: Make crash tool enter
 command line and support some commands
Thread-Index: AQHYmlGo17ZVVNNP90S6SQvvtqC7BK2IgAcA
Date: Thu, 21 Jul 2022 08:17:36 +0000
Message-ID: <d88dd8db-9102-eedd-6221-0a77fc9fcb02@nec.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
 <20220718025346.411758-3-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220718025346.411758-3-xianting.tian@linux.alibaba.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cac27234-452e-4df5-dab7-08da6af178a0
x-ms-traffictypediagnostic: OS3PR01MB6322:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7i4VbpFb03FDGJT9XRYI4q85iDu+r8JL9q/gT3sCT7jDpTQV4fDDZTF2sqdMz90EbOdVJz0PqBm3CKmhFDcbmMNeSx81EDO4GNT8sD4QBM2qEYWJjy9C9mwGuAZiwMPmJ3rSbhsM0YzGtURJhmXbyx0vImhPjuJ7+I69voEvC1rSNZ6CTS/oVbkiL95oefRS6VKhclw6Uld4HyK03SHBEfSuAOhqRkWv4Fli0em80TBc9LiC2+Chi6NH8Sr+4Dr8OvhwvX2b7YFmXtqT3CoFRtF+vihRo4hak7kHHT5afpkARZGO/Pkod2T9UdpUK+vFeNRCOpjz/Uqn6M0iXWP0Ssb3W6MkUEPaEATfpU5TdYIkNFeQVn9iNbVIehvcTXqWNaaQa1z/6z4ZIsxo/T0OunDFJZhrD5l0yC6SxGCm9nGocq40QMNT0JJV4tP49QN9XfqRj1ZKP/ygX6gL1X6WLs9Y6Pwy0WPBQy453jLN9mlPNplL6JPDAT4yZ/u6kn9YhqaUu7fdPSMUwWJhr2fnf4dd08R5BFLE6T2d6xFrPc8QOuDRIps9YaG71kdLEH3OCqKBpYsKZehozOPKDF+maMsDXGF5I59HyGjDBAR+KD1sWZ6kJz6holYd/HGuINSo/ZP48hPtWXOciJsqQTdmov/6pTRIatbQzcH8ObgmhZskhARaNEiacFSthVQrdwYetRUWrmR0LCiff212A/5whavOVibgFMWzHsM7CHa8BYYxd3TOGhorMIfVdLR33FhbIEG9wXSuF9stxPkyIljER71U3QTT6bAtuUqsT606bMgoGvJPe76SlYO/Wsiktoik36cPBtPPJyMiEaQiA8wA0KCr71uWGyGJmVj5llhJZdI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6777.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(53546011)(38100700002)(55236004)(6506007)(8936002)(41300700001)(38070700005)(5660300002)(2616005)(6486002)(966005)(122000001)(478600001)(82960400001)(71200400001)(4326008)(30864003)(66446008)(76116006)(66946007)(83380400001)(64756008)(316002)(26005)(110136005)(54906003)(8676002)(6512007)(2906002)(31686004)(66556008)(36756003)(66476007)(86362001)(31696002)(85182001)(186003)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NitDYmVCWHpZZ1gxV3pwU09uNUFaMm9RdGZ4ei9DRzk5RnlvVi9GMjR5WENE?=
 =?utf-8?B?NFhQbzB0MFNXWFVkcnpVTTMyMzZhMDFnL05NVHVQYjcvKzRKVEpvSU81cktQ?=
 =?utf-8?B?aGkxKzhXMnR1NmxtZEdFdGRJcEV3SWtab3dEOVJjRXRucjUwbzdJUjZzKzQw?=
 =?utf-8?B?TGRiTk42WEh5dmFNcE9mRVlVWVIzUVVTdzA0cVJLM1pHNmtuOWs5eTF6dUto?=
 =?utf-8?B?QUZVVHpsNU5xNmdNTXBza3ZVdXhPRjBtTi9NdndGNUdGQjdpcUJVTVNWQUQw?=
 =?utf-8?B?U3hXOFJHTWRRRTNhdGVpZEpoTHBxOEhIZ08rOVViMGlKaXdpZ2h4WnROQlJS?=
 =?utf-8?B?VmdlVkpZaXpEek5xenBIR3NIeDVQQTUzaWNxV2FGaWtzcTVaR3UxSVdqaW4z?=
 =?utf-8?B?VWw4NWFYSWlTK2tpclJXanc1NS9MaHp0R2FwSVdBQncwQTBHS0pqZmdvSzQ5?=
 =?utf-8?B?WTJtVTlBdWZ4NkpHL0RPdzlkM1p3cWNjVHlpRkx0NDNNMUF3a3c5ZlcwZEkr?=
 =?utf-8?B?RDdwTTFpNG9VYkJ2dFYyT0xUc3ZwQm1melAwb0ZUeWo3QS92UGdEeUc4OHVC?=
 =?utf-8?B?N0lHZGVsQzUvL3JwdEF5bmFFalFGenVmRXNQOUQvL2RONzJCdDkrVGNrTVo2?=
 =?utf-8?B?UTNvWDdLMjlzek03cFVIcUg2djFzL284SVc3N25XZ1NXUERGUllHR2w5emtM?=
 =?utf-8?B?TEFYT0dFZUNHVVZhWUxJZG1zVTdQOFZZRmN3WDdvL3Q3S2U4TFNkOFQ0eWZa?=
 =?utf-8?B?cHJOc01ueGRxbERONjlsMXYvQnFBakJsdlZyRjAwMExzcXZMTmt1aGlzZ1ZH?=
 =?utf-8?B?ci9INWpTd210SFdmaXJWd2Ivckg1OVpnVTVXS3JkbzByd1ZyZDBmeWJJYi9E?=
 =?utf-8?B?RDdlVTF1bVJXRG1GWlZBdlppMGxIK3VXc3BjMzVGMHBlUEVwaVM3QmJOVGF0?=
 =?utf-8?B?cElyS1lydWRJZ0t2MWtlZ2RCdzE0L1R3MjdKQW9EcUtBQXIyemVpc04wN1F5?=
 =?utf-8?B?MXlpYmtUY2NJeS8waWlYY2JGVUlHTDMwb2JtT0ZRVVNraUlKTkFFTEN0SE1X?=
 =?utf-8?B?R2hCRFJ1RGxhOURqUk9mSStFTFhMVVJuNDlxc3h2cm50NS8wUGtNOGcrUTBD?=
 =?utf-8?B?ME9vU2N6TDhqT2RSalZsYlh1V0Joa1BjS3BUT1pnMTBrblZyTXJxVGI1bDYz?=
 =?utf-8?B?elBIcXMrMCtJWm01S3BUbTRnb0RvazJmVkN6NmMwMHpGdERUeFZnZGNVcHJw?=
 =?utf-8?B?ZHhNUDFScnVzQUdqd1ozUkVPZ2hJeG95ZnNodUtnQ3hiK2tYQXVWOUJGclVq?=
 =?utf-8?B?SDZ3MU5veUJUK0VsUXc1cmpPZUZRVEhjeGRFOHRsTzlKOXQ2ajVVMTNWV2I4?=
 =?utf-8?B?amtEV1VwMmRmUnRJcmNYQlVjVmpodzNuNkR1V1dFM1M0eG5mSDJRQmpmQ21I?=
 =?utf-8?B?V0xsSlNNd084c2V1REpDZEpZUlpwNUlndnJGVjRVRDBUS1BaNW15UG9vU3BY?=
 =?utf-8?B?Nk1YR0Y4ZzYyQjRvKzU4UXY2K1pZK3h4U2tYREJFUmpscDR3VXc0L0dLdlQr?=
 =?utf-8?B?dElJQUdjS3QrNTQ4cVZGS0RLL0kzNmszalJHMGIzQ1J5Q0xaRkZCZlZ2cXEv?=
 =?utf-8?B?Yi9yaWMxMnJhSFY3U21CdGJ1c0JGU1FjZTVkOFh0SkhOem9mYnRvQkpESmFD?=
 =?utf-8?B?UHF6TTZjWkpOdHNmdXJURjBRcFNtdjBZSStUamlRL2UvYXlRNER5dFNBcHU4?=
 =?utf-8?B?aGN0RzdHWXQrMGIwSXpWczZuMjdBeU4yUDNXcS85WjZ6VUtFbWZ4dThIMXRu?=
 =?utf-8?B?cVUyZEVqNEQxRXZ5SXBxekZyditkMmphRjEweEVUdTNua2VCNTNPR0Z3T0N6?=
 =?utf-8?B?SGFEQWxHVTlIUVpPTkZteUZIZFBEc1QwWnZBRktyYWU1OUFHZ2RoakVNUXV3?=
 =?utf-8?B?WFlSdURWL3hLejd0VGM3ZE5OU3pzYnJPTlFQTmdPMEdBQVhZWWhDRU9ZZDlk?=
 =?utf-8?B?djhVMzdpYUh4STBOVlVRVmIwOENXSnUxSzRGOTY2SU1xbzM2WjNUd0dnUlFX?=
 =?utf-8?B?a3JxRnd5MUFkWS9IY2V0c1NGaVViK2xGVm5KOGw5MThzckVNSG1GeFhkeXJz?=
 =?utf-8?Q?HsIpwTd4P8ur7ModS2tIeuhZB?=
Content-ID: <36AF5ECCB5FFAF4193EB537F4F773222@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6777.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac27234-452e-4df5-dab7-08da6af178a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:17:36.9348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iChQM+7wcCunk87vV+dhNgis+eYlKlRYUrVIFPQRL8R8ckcREXSQ53LBZBnJEWdbmvDTLKtGmiaN1KPx5keFhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_011741_184978_264BE692 
X-CRM114-Status: GOOD (  21.33  )
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

On 2022/07/18 11:53, Xianting Tian wrote:
> 1. Add riscv64_init() implementation, do all necessary machine-specific setup,
>     which will be called multiple times during initialization.
> 2. Add riscv64 sv39/48/57 pagetable macro definitions, the function of converting
>     virtual address to a physical address via 4k page table.
> 3. Add the implementation of the vtop command, which is used to convert a
>     virtual address to a physical address(call the functions defined in 2).
> 4. Add the implementation to get virtual memory layout, va_bits, phys_ram_base
>     from vmcoreinfo. As these configurations changes from time to time, we send
>     a Linux kernel patch to export these configurations, which can simplify the
>     development of crash tool.
>     The Linux patch(patch 3 of the series of patches):
> 	https://lore.kernel.org/linux-riscv/20220717101323.370245-1-xianting.tian@linux.alibaba.com/
> 5. Add riscv64_get_smp_cpus() implementation, get the number of online cpus.
> 6. Add riscv64_get_page_size() implementation, get page size.
> And so on.
> 
> With this patch, we can enter crash command line, and run "vtop", "mod", "rd",
> "*", "p", "kmem" ...
> 
> Tested on QEMU RISCV64 end and SoC platform of T-head Xuantie 910 CPU.
> 
>        KERNEL: vmlinux
>      DUMPFILE: vmcore
>          CPUS: 1
>          DATE: Fri Jul 15 10:24:25 CST 2022
>        UPTIME: 00:00:33
> LOAD AVERAGE: 0.05, 0.01, 0.00
>         TASKS: 41
>      NODENAME: buildroot
>       RELEASE: 5.18.9
>       VERSION: #30 SMP Fri Jul 15 09:47:03 CST 2022
>       MACHINE: riscv64  (unknown Mhz)
>        MEMORY: 1 GB
>         PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>           PID: 113
>       COMMAND: "sh"
>          TASK: ff60000002269600  [THREAD_INFO: ff60000002269600]
>           CPU: 0
>         STATE: TASK_RUNNING (PANIC)
> 
> crash> p mem_map
> mem_map = $1 = (struct page *) 0xff6000003effbf00
> 
> crash> p /x *(struct page *) 0xff6000003effbf00
> $5 = {
>    flags = 0x1000,
>    {
>      {
>        {
>          lru = {
>            next = 0xff6000003effbf08,
>            prev = 0xff6000003effbf08
>          },
>          {
>            __filler = 0xff6000003effbf08,
>            mlock_count = 0x3effbf08
>          }
>        },
>        mapping = 0x0,
>        index = 0x0,
>        private = 0x0
>      },
> 
> crash> mod
>       MODULE       NAME             BASE         SIZE  OBJECT FILE
> ffffffff0113e740  nvme_core  ffffffff01133000  98304  (not loaded)  [CONFIG_KALLSYMS]
> ffffffff011542c0  nvme       ffffffff0114c000  61440  (not loaded)  [CONFIG_KALLSYMS]
> 
> crash> rd ffffffff0113e740 8
> ffffffff0113e740:  0000000000000000 ffffffff810874f8   .........t......
> ffffffff0113e750:  ffffffff011542c8 726f635f656d766e   .B......nvme_cor
> ffffffff0113e760:  0000000000000065 0000000000000000   e...............
> ffffffff0113e770:  0000000000000000 0000000000000000   ................
> 
> crash> vtop ffffffff0113e740
> VIRTUAL           PHYSICAL
> ffffffff0113e740  8254d740
> 
>     PGD: ffffffff810e9ff8 => 2ffff001
>    P4D: 0000000000000000 => 000000002fffec01
>    PUD: 00005605c2957470 => 0000000020949801
>    PMD: 00007fff7f1750c0 => 0000000020947401
>     PTE: 0 => 209534e7
>   PAGE: 000000008254d000
> 
>    PTE     PHYSICAL  FLAGS
> 209534e7  8254d000  (PRESENT|READ|WRITE|GLOBAL|ACCESSED|DIRTY)
> 
>        PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> ff6000003f0777d8 8254d000                0        0  1 0
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>   defs.h     |  93 +++++
>   diskdump.c |  10 +
>   riscv64.c  | 983 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1086 insertions(+)
> 
> diff --git a/defs.h b/defs.h
> index 42ffba3..be4db94 100644
> --- a/defs.h
> +++ b/defs.h
> @@ -3494,6 +3494,81 @@ struct arm64_stackframe {
>   #define _64BIT_
>   #define MACHINE_TYPE		"RISCV64"
>   
> +typedef struct { ulong pgd; } pgd_t;
> +typedef struct { ulong p4d; } p4d_t;
> +typedef struct { ulong pud; } pud_t;
> +typedef struct { ulong pmd; } pmd_t;
> +typedef struct { ulong pte; } pte_t;
> +typedef signed int s32;
> +
> +/* arch/riscv/include/asm/pgtable-64.h */
> +#define PGD_SHIFT_L3		(30)
> +#define PGD_SHIFT_L4		(39)
> +#define PGD_SHIFT_L5		(48)
> +
> +#define P4D_SHIFT		(39)
> +#define PUD_SHIFT		(30)
> +#define PMD_SHIFT		(21)
> +
> +#define PTRS_PER_PGD		(512)
> +#define PTRS_PER_P4D		(512)
> +#define PTRS_PER_PUD		(512)
> +#define PTRS_PER_PMD		(512)
> +#define PTRS_PER_PTE		(512)
> +
> +/*
> + * Mask for PPN and PROT bit53~0 of PTE
> + * 63 6261  60    54  53 10  9 8 7 6 5 4 3 2 1 0
> + * N  PBMT  Reserved  P P N  RSW D A G U X W R V
> + */
> +#define PTE_PFN_PROT_MASK	0x3FFFFFFFFFFFFF
> +
> +/*
> + * 3-levels / 4K pages
> + *
> + * sv39
> + * PGD  |  PMD  |  PTE  |  OFFSET  |
> + *  9   |   9   |   9   |    12    |
> + */
> +#define pgd_index_l3_4k(addr) (((addr) >> PGD_SHIFT_L3) & (PTRS_PER_PGD - 1))
> +#define pmd_index_l3_4k(addr) (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
> +#define pte_index_l3_4k(addr) (((addr) >> PAGESHIFT()) & (PTRS_PER_PTE - 1))
> +
> +/*
> + * 4-levels / 4K pages
> + *
> + * sv48
> + * PGD  |  PUD  |  PMD  |   PTE   |  OFFSET  |
> + *  9   |   9   |   9   |    9    |    12    |
> + */
> +#define pgd_index_l4_4k(addr) (((addr) >> PGD_SHIFT_L4) & (PTRS_PER_PGD - 1))
> +#define pud_index_l4_4k(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> +#define pmd_index_l4_4k(addr) (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
> +#define pte_index_l4_4k(addr) (((addr) >> PAGESHIFT()) & (PTRS_PER_PTE - 1))
> +
> +/*
> + * 5-levels / 4K pages
> + *
> + * sv48
> + * PGD  |  P4D  |  PUD  |  PMD  |   PTE   |  OFFSET  |
> + *  9   |   9   |   9   |   9   |    9    |    12    |
> + */
> +#define pgd_index_l5_4k(addr) (((addr) >> PGD_SHIFT_L5) & (PTRS_PER_PGD - 1))
> +#define p4d_index_l5_4k(addr) (((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
> +#define pud_index_l5_4k(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> +#define pmd_index_l5_4k(addr) (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
> +#define pte_index_l5_4k(addr) (((addr) >> PAGESHIFT()) & (PTRS_PER_PTE - 1))
> +
> +#define VM_L3_4K	(0x2)
> +#define VM_L3_2M	(0x4)
> +#define VM_L3_1G	(0x8)
> +#define VM_L4_4K	(0x10)
> +#define VM_L4_2M	(0x20)
> +#define VM_L4_1G	(0x40)
> +#define VM_L5_4K	(0x80)
> +#define VM_L5_2M	(0x100)
> +#define VM_L5_1G	(0x200)
> +
>   /*
>    * Direct memory mapping
>    */
> @@ -3545,6 +3620,14 @@ struct arm64_stackframe {
>   #define PHYS_MASK_SHIFT		_MAX_PHYSMEM_BITS
>   #define PHYS_MASK		(((1UL) << PHYS_MASK_SHIFT) - 1)
>   
> +#define IS_LAST_P4D_READ(p4d)	((ulong)(p4d) == machdep->machspec->last_p4d_read)
> +#define FILL_P4D(P4D, TYPE, SIZE)                                             \
> +    if (!IS_LAST_P4D_READ(P4D)) {                                             \
> +	    readmem((ulonglong)((ulong)(P4D)), TYPE, machdep->machspec->p4d,  \
> +		     SIZE, "p4d page", FAULT_ON_ERROR);                       \
> +	    machdep->machspec->last_p4d_read = (ulong)(P4D);                  \
> +    }
> +
>   #endif  /* RISCV64 */
>   
>   #ifdef X86
> @@ -6810,6 +6893,10 @@ struct machine_specific {
>   	ulong _page_soft;
>   
>   	ulong _pfn_shift;
> +	ulong va_bits;
> +	char *p4d;
> +	ulong last_p4d_read;
> +	ulong struct_page_size;
>   
>   	struct riscv64_register *crash_task_regs;
>   };
> @@ -6833,6 +6920,12 @@ struct machine_specific {
>   #define 	_PAGE_PROT_NONE	_PAGE_READ
>   #define 	_PAGE_PFN_SHIFT	10
>   
> +/* from 'struct pt_regs' definitions of RISC-V arch */
> +#define RISCV64_REGS_EPC  0
> +#define RISCV64_REGS_RA   1
> +#define RISCV64_REGS_SP   2
> +#define RISCV64_REGS_FP   8
> +
>   #endif /* RISCV64 */
>   
>   /*
> diff --git a/diskdump.c b/diskdump.c
> index 28503bc..cf5f5d9 100644
> --- a/diskdump.c
> +++ b/diskdump.c
> @@ -1531,6 +1531,12 @@ get_diskdump_regs_mips(struct bt_info *bt, ulong *eip, ulong *esp)
>   	machdep->get_stack_frame(bt, eip, esp);
>   }
>   
> +static void
> +get_diskdump_regs_riscv64(struct bt_info *bt, ulong *eip, ulong *esp)
> +{
> +	machdep->get_stack_frame(bt, eip, esp);
> +}
> +
>   static void
>   get_diskdump_regs_sparc64(struct bt_info *bt, ulong *eip, ulong *esp)
>   {
> @@ -1610,6 +1616,10 @@ get_diskdump_regs(struct bt_info *bt, ulong *eip, ulong *esp)
>   		get_diskdump_regs_sparc64(bt, eip, esp);
>   		break;
>   
> +	case EM_RISCV:
> +		get_diskdump_regs_riscv64(bt, eip, esp);
> +		break;
> +
>   	default:
>   		error(FATAL, "%s: unsupported machine type: %s\n",
>   			DISKDUMP_VALID() ? "diskdump" : "compressed kdump",
> diff --git a/riscv64.c b/riscv64.c
> index c7df857..9d40297 100644
> --- a/riscv64.c
> +++ b/riscv64.c
> @@ -16,10 +16,304 @@
>   
>   #include <elf.h>
>   #include "defs.h"
> +#include <math.h>
> +
> +static ulong riscv64_get_page_size(void);
> +static int riscv64_vtop_3level_4k(ulong *pgd, ulong vaddr,
> +			    physaddr_t *paddr, int verbose);
> +static int riscv64_vtop_4level_4k(ulong *pgd, ulong vaddr,
> +			    physaddr_t *paddr, int verbose);
> +static int riscv64_vtop_5level_4k(ulong *pgd, ulong vaddr,
> +			    physaddr_t *paddr, int verbose);
> +static void riscv64_page_type_init(void);
> +static int riscv64_is_kvaddr(ulong vaddr);
> +static int riscv64_is_uvaddr(ulong vaddr, struct task_context *tc);
> +static int riscv64_uvtop(struct task_context *tc, ulong vaddr,
> +			 physaddr_t *paddr, int verbose);
> +static int riscv64_kvtop(struct task_context *tc, ulong kvaddr,
> +			 physaddr_t *paddr, int verbose);

(In whole, you can use about 100 chars in a line, if you like.)

> +static void riscv64_cmd_mach(void);
> +static int riscv64_translate_pte(ulong, void *, ulonglong);
> +static int riscv64_init_active_task_regs(void);
> +static int riscv64_get_crash_notes(void);
> +static int riscv64_get_elf_notes(void);
> +static void riscv64_get_va_range(struct machine_specific *ms);
> +static void riscv64_get_struct_page_size(struct machine_specific *ms);
> +
> +#define REG_FMT	"%016lx"
> +#define SZ_2G	0x80000000
> +
> +/*
> + * Holds registers during the crash.
> + */
> +static struct riscv64_register *panic_task_regs;
> +
> +/* from arch/riscv/include/asm/stacktrace.h */
> +struct stackframe {
> +	ulong fp;
> +	ulong ra;
> +};
> +
> +static struct machine_specific riscv64_machine_specific = {
> +	._page_present = (1 << 0),
> +	._page_read = (1 << 1),
> +	._page_write = (1 << 2),
> +	._page_exec = (1 << 3),
> +	._page_user = (1 << 4),
> +	._page_global = (1 << 5),
> +	._page_accessed = (1 << 6),
> +	._page_dirty = (1 << 7),
> +	._page_soft = (1 << 8),
> +
> +	.va_bits = 0,
> +	.struct_page_size = 0,
> +};
> +
> +static void
> +pt_level_alloc(char **lvl, char *name)
> +{
> +	size_t sz = PAGESIZE();
> +	void *pointer = malloc(sz);
> +
> +	if (!pointer)
> +		error(FATAL, name);
> +	*lvl = pointer;
> +}
> +
> +static void
> +riscv64_get_phys_ram_base(struct machine_specific *ms)
> +{
> +	char *string;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(phys_ram_base)"))) {
> +		ms->phys_base = atol(string);
> +		free(string);
> +	} else
> +		/*
> +		 * It can't continue without phys_ram_base. As for qemu rv64
> +		 * env and hardware platform, phys_ram_base may different.
> +		 */
> +		error(FATAL, "cannot read phys_ram_base\n");
> +}
> +
> +static ulong
> +riscv64_get_page_size(void)
> +{
> +	return memory_page_size();
> +}
> +
> +static ulong
> +riscv64_vmalloc_start(void)
> +{
> +	return ((ulong)VMALLOC_START);
> +}
> +
> +/* Get the size of struct page {} */
> +static void riscv64_get_struct_page_size(struct machine_specific *ms)
> +{
> +	char *string;
> +
> +	string = pc->read_vmcoreinfo("SIZE(page)");
> +	if (string)
> +		ms->struct_page_size = atol(string);
> +	free(string);
> +}
> +
> +/*
> + * Get the max shift of the size of struct page.
> + * Most of the time, it is 64 bytes, but not sure.
> +*/
> +static int riscv64_get_struct_page_max_shift(struct machine_specific *ms)
> +{
> +	return (int)ceil(log2(ms->struct_page_size));
> +}
> +
> +static void
> +riscv64_cmd_mach(void)
> +{
> +	/* TODO: */
> +}
> +
> +static int
> +riscv64_verify_symbol(const char *name, ulong value, char type)
> +{
> +	/* TODO: */
> +	return TRUE;
> +}
>   
>   void
>   riscv64_dump_machdep_table(ulong arg)
>   {
> +	/* TODO: */
> +}
> +
> +static ulong
> +riscv64_processor_speed(void)
> +{
> +	/* TODO: */
> +	return 0;
> +}
> +
> +static unsigned long riscv64_get_kernel_version(void)
> +{
> +	char *string;
> +	char buf[BUFSIZE];
> +	char *p1, *p2;
> +
> +	if (THIS_KERNEL_VERSION)
> +		return THIS_KERNEL_VERSION;
> +
> +	string = pc->read_vmcoreinfo("OSRELEASE");
> +	if (string) {
> +		strcpy(buf, string);
> +
> +		p1 = p2 = buf;
> +		while (*p2 != '.')
> +			p2++;
> +		*p2 = NULLCHAR;
> +		kt->kernel_version[0] = atoi(p1);
> +
> +		p1 = ++p2;
> +		while (*p2 != '.')
> +			p2++;
> +		*p2 = NULLCHAR;
> +		kt->kernel_version[1] = atoi(p1);
> +
> +		p1 = ++p2;
> +		while ((*p2 >= '0') && (*p2 <= '9'))
> +			p2++;
> +		*p2 = NULLCHAR;
> +		kt->kernel_version[2] = atoi(p1);
> +	}
> +	free(string);
> +	return THIS_KERNEL_VERSION;
> +}
> +
> +static void riscv64_get_va_range(struct machine_specific *ms)
> +{
> +	unsigned long kernel_version = riscv64_get_kernel_version();
> +	char *string;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(VA_BITS)"))) {
> +		ms->va_bits = atol(string);
> +		free(string);
> +	} else
> +		goto error;
> +	if ((string = pc->read_vmcoreinfo("NUMBER(PAGE_OFFSET)"))) {
> +		ms->page_offset = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(VMALLOC_START)"))) {
> +		ms->vmalloc_start_addr = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(VMALLOC_END)"))) {
> +		ms->vmalloc_end = htol(string, QUIET, NULL);
> +                free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(VMEMMAP_START)"))) {
> +		ms->vmemmap_vaddr = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(VMEMMAP_END)"))) {
> +		ms->vmemmap_end = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(KERNEL_LINK_ADDR)"))) {
> +		ms->kernel_link_addr = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	if ((string = pc->read_vmcoreinfo("NUMBER(ADDRESS_SPACE_END)"))) {
> +		ms->address_space_end = htol(string, QUIET, NULL);
> +		free(string);
> +	} else
> +		goto error;
> +
> +	/*
> +	 * From Linux 5.13, the kernel mapping is moved to the last 2GB
> +	 * of the address space, modules use the 2GB memory range right
> +	 * before the kernel. Before Linux 5.13, modules area is embedded
> +	 * in vmalloc area.
> +	 *
> +	 * 5.13 = 0x5 << 16 | 0xD << 8
> +	 */
> +	if (kernel_version >= 0x50D00) {

Please use LINUX() macro.

> +		if ((string = pc->read_vmcoreinfo("NUMBER(MODULES_VADDR)"))) {
> +			ms->modules_vaddr = htol(string, QUIET, NULL);
> +			free(string);
> +		} else
> +			goto error;
> +
> +		if ((string = pc->read_vmcoreinfo("NUMBER(MODULES_END)"))) {
> +			ms->modules_end = htol(string, QUIET, NULL);
> +			free(string);
> +		} else
> +			goto error;
> +	} else {
> +		ms->modules_vaddr = ms->vmalloc_start_addr;
> +		ms->modules_end = ms->vmalloc_end;
> +	}
> +
> +	if (CRASHDEBUG(8)) {
> +		fprintf(fp, "va_bits	: %ld\n", ms->va_bits);
> +		fprintf(fp, "vmemmap	: 0x%lx - 0x%lx\n",
> +			ms->vmemmap_vaddr, ms->vmemmap_end);
> +		fprintf(fp, "vmalloc	: 0x%lx - 0x%lx\n",
> +			ms->vmalloc_start_addr, ms->vmalloc_end);
> +		fprintf(fp, "lowmem	: 0x%lx -\n", ms->page_offset);
> +		fprintf(fp, "mudules	: 0x%lx - 0x%lx\n",
> +			ms->modules_vaddr, ms->modules_end);
> +		fprintf(fp, "kernel	: 0x%lx - 0x%lx\n",
> +			ms->kernel_link_addr, ms->address_space_end);

These are essential information, I think CRASHDEBUG(1) would be better
for checking them.

The other patches look good to me.

Thanks,
Kazu

> +	}
> +	return;
> +error:
> +	error(FATAL, "cannot get vm layout\n");
> +}
> +
> +static int
> +riscv64_is_kvaddr(ulong vaddr)
> +{
> +	if (IS_VMALLOC_ADDR(vaddr))
> +		return TRUE;
> +
> +	return (vaddr >= machdep->kvbase);
> +}
> +
> +static int
> +riscv64_is_uvaddr(ulong vaddr, struct task_context *unused)
> +{
> +	if (IS_VMALLOC_ADDR(vaddr))
> +		return FALSE;
> +
> +	return (vaddr < machdep->kvbase);
> +}
> +
> +static int
> +riscv64_is_task_addr(ulong task)
> +{
> +	if (tt->flags & THREAD_INFO)
> +		return IS_KVADDR(task);
> +
> +	return (IS_KVADDR(task) && ALIGNED_STACK_OFFSET(task) == 0);
> +}
> +
> +static int
> +riscv64_get_smp_cpus(void)
> +{
> +	return (get_cpus_online() > 0) ? get_cpus_online() : kt->cpus;
>   }
>   
>   /*
> @@ -33,11 +327,700 @@ riscv64_IS_VMALLOC_ADDR(ulong vaddr)
>   		(vaddr >= MODULES_VADDR && vaddr <= MODULES_END));
>   }
>   
> +/*
> + * Translate a PTE, returning TRUE if the page is present.
> + * If a physaddr pointer is passed in, don't print anything.
> + */
> +static int
> +riscv64_translate_pte(ulong pte, void *physaddr, ulonglong unused)
> +{
> +	char ptebuf[BUFSIZE];
> +	char physbuf[BUFSIZE];
> +	char buf[BUFSIZE];
> +	int page_present;
> +	int len1, len2, others;
> +	ulong paddr;
> +
> +	paddr = PTOB(pte >> _PAGE_PFN_SHIFT);
> +	page_present = !!(pte & _PAGE_PRESENT);
> +
> +	if (physaddr) {
> +		*(ulong *)physaddr = paddr;
> +		return page_present;
> +	}
> +
> +	sprintf(ptebuf, "%lx", pte);
> +	len1 = MAX(strlen(ptebuf), strlen("PTE"));
> +	fprintf(fp, "%s  ", mkstring(buf, len1, CENTER | LJUST, "PTE"));
> +
> +	if (!page_present)
> +		return page_present;
> +
> +	sprintf(physbuf, "%lx", paddr);
> +	len2 = MAX(strlen(physbuf), strlen("PHYSICAL"));
> +	fprintf(fp, "%s  ", mkstring(buf, len2, CENTER | LJUST, "PHYSICAL"));
> +
> +	fprintf(fp, "FLAGS\n");
> +	fprintf(fp, "%s  %s  ",
> +		mkstring(ptebuf, len1, CENTER | RJUST, NULL),
> +		mkstring(physbuf, len2, CENTER | RJUST, NULL));
> +
> +	fprintf(fp, "(");
> +	others = 0;
> +
> +#define CHECK_PAGE_FLAG(flag)				\
> +	if ((_PAGE_##flag) && (pte & _PAGE_##flag))	\
> +		fprintf(fp, "%s" #flag, others++ ? "|" : "")
> +	if (pte) {
> +		CHECK_PAGE_FLAG(PRESENT);
> +		CHECK_PAGE_FLAG(READ);
> +		CHECK_PAGE_FLAG(WRITE);
> +		CHECK_PAGE_FLAG(EXEC);
> +		CHECK_PAGE_FLAG(USER);
> +		CHECK_PAGE_FLAG(GLOBAL);
> +		CHECK_PAGE_FLAG(ACCESSED);
> +		CHECK_PAGE_FLAG(DIRTY);
> +		CHECK_PAGE_FLAG(SOFT);
> +	} else {
> +		fprintf(fp, "no mapping");
> +	}
> +
> +	fprintf(fp, ")\n");
> +
> +	return page_present;
> +}
> +
> +static void
> +riscv64_page_type_init(void)
> +{
> +	ulong va_bits = machdep->machspec->va_bits;
> +
> +	/*
> +	 * For RISCV64 arch, any level of PTE may be a leaf PTE,
> +	 * so in addition to 4KiB pages,
> +	 * Sv39 supports 2 MiB megapages, 1 GiB gigapages;
> +	 * Sv48 supports 2 MiB megapages, 1 GiB gigapages, 512 GiB terapages;
> +	 * Sv57 supports 2 MiB megapages, 1 GiB gigapages, 512 GiB terapages, and 256 TiB petapages.
> +	 *
> +	 * refs to riscv-privileged spec.
> +	 *
> +	 * We just support 4KiB, 2MiB, 1GiB now.
> +	 */
> +	switch (machdep->pagesize)
> +	{
> +	case 0x1000:		// 4 KiB
> +		machdep->flags |= (va_bits == 57 ? VM_L5_4K :
> +				  (va_bits == 48 ? VM_L4_4K : VM_L3_4K));
> +		break;
> +	case 0x200000:		// 2 MiB
> +		/* TODO: */
> +	case 0x40000000: 	// 1 GiB
> +		/* TODO: */
> +	default:
> +		if (machdep->pagesize)
> +			error(FATAL, "invalid/unsupported page size: %d\n",
> +			      machdep->pagesize);
> +		else
> +			error(FATAL, "cannot determine page size\n");
> +	}
> +}
> +
> +static int
> +riscv64_vtop_3level_4k(ulong *pgd, ulong vaddr, physaddr_t *paddr, int verbose)
> +{
> +	ulong *pgd_ptr, pgd_val;
> +	ulong *pmd_ptr, pmd_val;
> +	ulong *pte_ptr, pte_val, pte_pfn;
> +	ulong pt_phys;
> +
> +	/* PGD */
> +	pgd_ptr = pgd + pgd_index_l3_4k(vaddr);
> +	FILL_PGD(pgd, KVADDR, PAGESIZE());
> +	pgd_val = ULONG(machdep->pgd + PAGEOFFSET(pgd_ptr));
> +	if (verbose)
> +		fprintf(fp, "   PGD: %lx => %lx\n", (ulong)pgd_ptr, pgd_val);
> +	if (!pgd_val)
> +		goto no_page;
> +	pgd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pgd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PMD */
> +	FILL_PMD(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pmd_val = ULONG(machdep->pmd + PAGEOFFSET(sizeof(pmd_t) *
> +			pmd_index_l3_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  PMD: %016lx => %016lx\n", (ulong)pmd_ptr, pmd_val);
> +	if (!pmd_val)
> +		goto no_page;
> +	pmd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pmd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PTE */
> +	FILL_PTBL(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pte_val = ULONG(machdep->ptbl + PAGEOFFSET(sizeof(pte_t) *
> +			pte_index_l3_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "   PTE: %lx => %lx\n", (ulong)pte_ptr, pte_val);
> +	if (!pte_val)
> +		goto no_page;
> +	pte_val &= PTE_PFN_PROT_MASK;
> +	pte_pfn = pte_val >> _PAGE_PFN_SHIFT;
> +
> +	if (!(pte_val & _PAGE_PRESENT)) {
> +		if (verbose) {
> +			fprintf(fp, "\n");
> +			riscv64_translate_pte((ulong)pte_val, 0, 0);
> +		}
> +		fprintf(fp, " PAGE: %016lx not present\n\n", PAGEBASE(*paddr));
> +		return FALSE;
> +	}
> +
> +	*paddr = PTOB(pte_pfn) + PAGEOFFSET(vaddr);
> +
> +	if (verbose) {
> +		fprintf(fp, " PAGE: %016lx\n\n", PAGEBASE(*paddr));
> +		riscv64_translate_pte(pte_val, 0, 0);
> +	}
> +
> +	return TRUE;
> +no_page:
> +	fprintf(fp, "invalid\n");
> +	return FALSE;
> +}
> +
> +static int
> +riscv64_vtop_4level_4k(ulong *pgd, ulong vaddr, physaddr_t *paddr, int verbose)
> +{
> +	ulong *pgd_ptr, pgd_val;
> +	ulong *pud_ptr, pud_val;
> +	ulong *pmd_ptr, pmd_val;
> +	ulong *pte_ptr, pte_val, pte_pfn;
> +	ulong pt_phys;
> +
> +	/* PGD */
> +	pgd_ptr = pgd + pgd_index_l4_4k(vaddr);
> +	FILL_PGD(pgd, KVADDR, PAGESIZE());
> +	pgd_val = ULONG(machdep->pgd + PAGEOFFSET(pgd_ptr));
> +	if (verbose)
> +		fprintf(fp, "   PGD: %lx => %lx\n", (ulong)pgd_ptr, pgd_val);
> +	if (!pgd_val)
> +		goto no_page;
> +	pgd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pgd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PUD */
> +	FILL_PUD(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pud_val = ULONG(machdep->pud + PAGEOFFSET(sizeof(pud_t) *
> +			pud_index_l4_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  PUD: %016lx => %016lx\n", (ulong)pud_ptr, pud_val);
> +	if (!pud_val)
> +		goto no_page;
> +	pud_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pud_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PMD */
> +	FILL_PMD(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pmd_val = ULONG(machdep->pmd + PAGEOFFSET(sizeof(pmd_t) *
> +			pmd_index_l4_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  PMD: %016lx => %016lx\n", (ulong)pmd_ptr, pmd_val);
> +	if (!pmd_val)
> +		goto no_page;
> +	pmd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pmd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PTE */
> +	FILL_PTBL(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pte_val = ULONG(machdep->ptbl + PAGEOFFSET(sizeof(pte_t) *
> +			pte_index_l4_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "   PTE: %lx => %lx\n", (ulong)pte_ptr, pte_val);
> +	if (!pte_val)
> +		goto no_page;
> +	pte_val &= PTE_PFN_PROT_MASK;
> +	pte_pfn = pte_val >> _PAGE_PFN_SHIFT;
> +
> +	if (!(pte_val & _PAGE_PRESENT)) {
> +		if (verbose) {
> +			fprintf(fp, "\n");
> +			riscv64_translate_pte((ulong)pte_val, 0, 0);
> +		}
> +		fprintf(fp, " PAGE: %016lx not present\n\n", PAGEBASE(*paddr));
> +		return FALSE;
> +	}
> +
> +	*paddr = PTOB(pte_pfn) + PAGEOFFSET(vaddr);
> +
> +	if (verbose) {
> +		fprintf(fp, " PAGE: %016lx\n\n", PAGEBASE(*paddr));
> +		riscv64_translate_pte(pte_val, 0, 0);
> +	}
> +
> +	return TRUE;
> +no_page:
> +	fprintf(fp, "invalid\n");
> +	return FALSE;
> +}
> +
> +static int
> +riscv64_vtop_5level_4k(ulong *pgd, ulong vaddr, physaddr_t *paddr, int verbose)
> +{
> +	ulong *pgd_ptr, pgd_val;
> +	ulong *p4d_ptr, p4d_val;
> +	ulong *pud_ptr, pud_val;
> +	ulong *pmd_ptr, pmd_val;
> +	ulong *pte_ptr, pte_val, pte_pfn;
> +	ulong pt_phys;
> +
> +	/* PGD */
> +	pgd_ptr = pgd + pgd_index_l5_4k(vaddr);
> +	FILL_PGD(pgd, KVADDR, PAGESIZE());
> +	pgd_val = ULONG(machdep->pgd + PAGEOFFSET(pgd_ptr));
> +	if (verbose)
> +		fprintf(fp, "   PGD: %lx => %lx\n", (ulong)pgd_ptr, pgd_val);
> +	if (!pgd_val)
> +		goto no_page;
> +	pgd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pgd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* P4D */
> +	FILL_P4D(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	p4d_val = ULONG(machdep->machspec->p4d + PAGEOFFSET(sizeof(p4d_t) *
> +			p4d_index_l5_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  P4D: %016lx => %016lx\n", (ulong)p4d_ptr, p4d_val);
> +	if (!p4d_val)
> +		goto no_page;
> +	p4d_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (p4d_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PUD */
> +	FILL_PUD(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pud_val = ULONG(machdep->pud + PAGEOFFSET(sizeof(pud_t) *
> +			pud_index_l5_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  PUD: %016lx => %016lx\n", (ulong)pud_ptr, pud_val);
> +	if (!pud_val)
> +		goto no_page;
> +	pud_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pud_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PMD */
> +	FILL_PMD(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pmd_val = ULONG(machdep->pmd + PAGEOFFSET(sizeof(pmd_t) *
> +			pmd_index_l4_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "  PMD: %016lx => %016lx\n", (ulong)pmd_ptr, pmd_val);
> +	if (!pmd_val)
> +		goto no_page;
> +	pmd_val &= PTE_PFN_PROT_MASK;
> +	pt_phys = (pmd_val >> _PAGE_PFN_SHIFT) << PAGESHIFT();
> +
> +	/* PTE */
> +	FILL_PTBL(PAGEBASE(pt_phys), PHYSADDR, PAGESIZE());
> +	pte_val = ULONG(machdep->ptbl + PAGEOFFSET(sizeof(pte_t) *
> +			pte_index_l4_4k(vaddr)));
> +	if (verbose)
> +		fprintf(fp, "   PTE: %lx => %lx\n", (ulong)pte_ptr, pte_val);
> +	if (!pte_val)
> +		goto no_page;
> +	pte_val &= PTE_PFN_PROT_MASK;
> +	pte_pfn = pte_val >> _PAGE_PFN_SHIFT;
> +
> +	if (!(pte_val & _PAGE_PRESENT)) {
> +		if (verbose) {
> +			fprintf(fp, "\n");
> +			riscv64_translate_pte((ulong)pte_val, 0, 0);
> +		}
> +		printf("!_PAGE_PRESENT\n");
> +		return FALSE;
> +	}
> +
> +	*paddr = PTOB(pte_pfn) + PAGEOFFSET(vaddr);
> +
> +	if (verbose) {
> +		fprintf(fp, " PAGE: %016lx\n\n", PAGEBASE(*paddr));
> +		riscv64_translate_pte(pte_val, 0, 0);
> +	}
> +
> +	return TRUE;
> +no_page:
> +	fprintf(fp, "invalid\n");
> +	return FALSE;
> +}
> +
> +static int
> +riscv64_init_active_task_regs(void)
> +{
> +	int retval;
> +
> +	retval = riscv64_get_crash_notes();
> +	if (retval == TRUE)
> +		return retval;
> +
> +	return riscv64_get_elf_notes();
> +}
> +
> +/*
> + * Retrieve task registers for the time of the crash.
> + */
> +static int
> +riscv64_get_crash_notes(void)
> +{
> +	struct machine_specific *ms = machdep->machspec;
> +	ulong crash_notes;
> +	Elf64_Nhdr *note;
> +	ulong offset;
> +	char *buf, *p;
> +	ulong *notes_ptrs;
> +	ulong i;
> +
> +	/*
> +	 * crash_notes contains per cpu memory for storing cpu states
> +	 * in case of system crash.
> +	 */
> +	if (!symbol_exists("crash_notes"))
> +		return FALSE;
> +
> +	crash_notes = symbol_value("crash_notes");
> +
> +	notes_ptrs = (ulong *)GETBUF(kt->cpus*sizeof(notes_ptrs[0]));
> +
> +	/*
> +	 * Read crash_notes for the first CPU. crash_notes are in standard ELF
> +	 * note format.
> +	 */
> +	if (!readmem(crash_notes, KVADDR, &notes_ptrs[kt->cpus-1],
> +	    sizeof(notes_ptrs[kt->cpus-1]), "crash_notes",
> +		     RETURN_ON_ERROR)) {
> +		error(WARNING, "cannot read crash_notes\n");
> +		FREEBUF(notes_ptrs);
> +		return FALSE;
> +	}
> +
> +	if (symbol_exists("__per_cpu_offset")) {
> +
> +		/*
> +		 * Add __per_cpu_offset for each cpu to form the pointer to the notes
> +		 */
> +		for (i = 0; i < kt->cpus; i++)
> +			notes_ptrs[i] = notes_ptrs[kt->cpus-1] + kt->__per_cpu_offset[i];
> +	}
> +
> +	buf = GETBUF(SIZE(note_buf));
> +
> +	if (!(panic_task_regs = calloc((size_t)kt->cpus, sizeof(*panic_task_regs))))
> +		error(FATAL, "cannot calloc panic_task_regs space\n");
> +
> +	for (i = 0; i < kt->cpus; i++) {
> +
> +		if (!readmem(notes_ptrs[i], KVADDR, buf, SIZE(note_buf), "note_buf_t",
> +			     RETURN_ON_ERROR)) {
> +			error(WARNING,
> +				"cannot find NT_PRSTATUS note for cpu: %d\n", i);
> +			goto fail;
> +		}
> +
> +		/*
> +		 * Do some sanity checks for this note before reading registers from it.
> +		 */
> +		note = (Elf64_Nhdr *)buf;
> +		p = buf + sizeof(Elf64_Nhdr);
> +
> +		/*
> +		 * dumpfiles created with qemu won't have crash_notes, but there will
> +		 * be elf notes; dumpfiles created by kdump do not create notes for
> +		 * offline cpus.
> +		 */
> +		if (note->n_namesz == 0 && (DISKDUMP_DUMPFILE() || KDUMP_DUMPFILE())) {
> +			if (DISKDUMP_DUMPFILE())
> +				note = diskdump_get_prstatus_percpu(i);
> +			else if (KDUMP_DUMPFILE())
> +				note = netdump_get_prstatus_percpu(i);
> +			if (note) {
> +				/*
> +				 * SIZE(note_buf) accounts for a "final note", which is a
> +				 * trailing empty elf note header.
> +				 */
> +				long notesz = SIZE(note_buf) - sizeof(Elf64_Nhdr);
> +
> +				if (sizeof(Elf64_Nhdr) + roundup(note->n_namesz, 4) +
> +				    note->n_descsz == notesz)
> +					BCOPY((char *)note, buf, notesz);
> +			} else {
> +				error(WARNING,
> +					"cannot find NT_PRSTATUS note for cpu: %d\n", i);
> +				continue;
> +			}
> +		}
> +
> +		/*
> +		 * Check the sanity of NT_PRSTATUS note only for each online cpu.
> +		 */
> +		if (note->n_type != NT_PRSTATUS) {
> +			error(WARNING, "invalid NT_PRSTATUS note (n_type != NT_PRSTATUS)\n");
> +			goto fail;
> +		}
> +		if (!STRNEQ(p, "CORE")) {
> +			error(WARNING, "invalid NT_PRSTATUS note (name != \"CORE\"\n");
> +			goto fail;
> +		}
> +
> +		/*
> +		 * Find correct location of note data. This contains elf_prstatus
> +		 * structure which has registers etc. for the crashed task.
> +		 */
> +		offset = sizeof(Elf64_Nhdr);
> +		offset = roundup(offset + note->n_namesz, 4);
> +		p = buf + offset; /* start of elf_prstatus */
> +
> +		BCOPY(p + OFFSET(elf_prstatus_pr_reg), &panic_task_regs[i],
> +		      sizeof(panic_task_regs[i]));
> +	}
> +
> +	/*
> +	 * And finally we have the registers for the crashed task. This is
> +	 * used later on when dumping backtrace.
> +	 */
> +	ms->crash_task_regs = panic_task_regs;
> +
> +	FREEBUF(buf);
> +	FREEBUF(notes_ptrs);
> +	return TRUE;
> +
> +fail:
> +	FREEBUF(buf);
> +	FREEBUF(notes_ptrs);
> +	free(panic_task_regs);
> +	return FALSE;
> +}
> +
> +static int
> +riscv64_get_elf_notes(void)
> +{
> +	struct machine_specific *ms = machdep->machspec;
> +	int i;
> +
> +	if (!DISKDUMP_DUMPFILE() && !KDUMP_DUMPFILE())
> +		return false;
> +
> +	panic_task_regs = calloc(kt->cpus, sizeof(*panic_task_regs));
> +	if (!panic_task_regs)
> +		error(FATAL, "cannot calloc panic_task_regs space\n");
> +
> +	for (i = 0; i < kt->cpus; i++) {
> +		Elf64_Nhdr *note = NULL;
> +		size_t len;
> +
> +		if (DISKDUMP_DUMPFILE())
> +			note = diskdump_get_prstatus_percpu(i);
> +		else if (KDUMP_DUMPFILE())
> +			note = netdump_get_prstatus_percpu(i);
> +
> +		if (!note) {
> +			error(WARNING,
> +				"cannot find NT_PRSTATUS note for cpu: %d\n", i);
> +			continue;
> +		}
> +
> +		len = sizeof(Elf64_Nhdr);
> +		len = roundup(len + note->n_namesz, 4);
> +
> +		BCOPY((char *)note + len + OFFSET(elf_prstatus_pr_reg),
> +		      &panic_task_regs[i], sizeof(panic_task_regs[i]));
> +	}
> +
> +	ms->crash_task_regs = panic_task_regs;
> +
> +	return TRUE;
> +}
> +
> +/*
> + * Translates a user virtual address to its physical address.
> + */
> +static int
> +riscv64_uvtop(struct task_context *tc, ulong uvaddr, physaddr_t *paddr, int verbose)
> +{
> +	ulong mm, active_mm;
> +	ulong *pgd;
> +
> +	if (!tc)
> +		error(FATAL, "current context invalid\n");
> +
> +	*paddr = 0;
> +
> +	if (is_kernel_thread(tc->task) && IS_KVADDR(uvaddr)) {
> +		readmem(tc->task + OFFSET(task_struct_active_mm),
> +			KVADDR, &active_mm, sizeof(void *),
> +			"task active_mm contents", FAULT_ON_ERROR);
> +
> +		if (!active_mm)
> +			error(FATAL,
> +			      "no active_mm for this kernel thread\n");
> +
> +		readmem(active_mm + OFFSET(mm_struct_pgd),
> +			KVADDR, &pgd, sizeof(long),
> +			"mm_struct pgd", FAULT_ON_ERROR);
> +	} else {
> +		if ((mm = task_mm(tc->task, TRUE)))
> +			pgd = ULONG_PTR(tt->mm_struct + OFFSET(mm_struct_pgd));
> +		else
> +			readmem(tc->mm_struct + OFFSET(mm_struct_pgd),
> +				KVADDR, &pgd, sizeof(long), "mm_struct pgd",
> +				FAULT_ON_ERROR);
> +	}
> +
> +	switch (machdep->flags & (VM_L3_4K | VM_L4_4K | VM_L5_4K))
> +	{
> +	case VM_L3_4K:
> +		return riscv64_vtop_3level_4k(pgd, uvaddr, paddr, verbose);
> +	case VM_L4_4K:
> +		return riscv64_vtop_4level_4k(pgd, uvaddr, paddr, verbose);
> +	case VM_L5_4K:
> +		return riscv64_vtop_5level_4k(pgd, uvaddr, paddr, verbose);
> +	default:
> +		return FALSE;
> +	}
> +}
> +
> +static int
> +riscv64_kvtop(struct task_context *tc, ulong kvaddr, physaddr_t *paddr, int verbose)
> +{
> +	ulong kernel_pgd;
> +
> +	if (!IS_KVADDR(kvaddr))
> +		return FALSE;
> +
> +	if (!vt->vmalloc_start) {
> +		*paddr = VTOP(kvaddr);
> +		return TRUE;
> +	}
> +
> +	if (!IS_VMALLOC_ADDR(kvaddr)) {
> +		*paddr = VTOP(kvaddr);
> +		if (!verbose)
> +			return TRUE;
> +	}
> +
> +	kernel_pgd = vt->kernel_pgd[0];
> +	*paddr = 0;
> +
> +	switch (machdep->flags & (VM_L3_4K | VM_L4_4K | VM_L5_4K))
> +	{
> +	case VM_L3_4K:
> +		return riscv64_vtop_3level_4k((ulong *)kernel_pgd, kvaddr, paddr, verbose);
> +	case VM_L4_4K:
> +		return riscv64_vtop_4level_4k((ulong *)kernel_pgd, kvaddr, paddr, verbose);
> +	case VM_L5_4K:
> +		return riscv64_vtop_5level_4k((ulong *)kernel_pgd, kvaddr, paddr, verbose);
> +	default:
> +		return FALSE;
> +	}
> +}
> +
>   void
>   riscv64_init(int when)
>   {
> +	switch (when) {
> +	case SETUP_ENV:
> +		machdep->process_elf_notes = process_elf64_notes;
> +		break;
> +
> +	case PRE_SYMTAB:
> +		machdep->verify_symbol = riscv64_verify_symbol;
> +		machdep->machspec = &riscv64_machine_specific;
> +		if (pc->flags & KERNEL_DEBUG_QUERY)
> +			return;
> +
> +		machdep->verify_paddr = generic_verify_paddr;
> +		machdep->ptrs_per_pgd = PTRS_PER_PGD;
> +		break;
> +
> +	case PRE_GDB:
> +		machdep->pagesize = riscv64_get_page_size();
> +		machdep->pageshift = ffs(machdep->pagesize) - 1;
> +		machdep->pageoffset = machdep->pagesize - 1;
> +		machdep->pagemask = ~((ulonglong)machdep->pageoffset);
> +		machdep->stacksize = machdep->pagesize << THREAD_SIZE_ORDER;
> +
> +		riscv64_get_phys_ram_base(machdep->machspec);
> +		riscv64_get_struct_page_size(machdep->machspec);
> +		riscv64_get_va_range(machdep->machspec);
> +
> +		pt_level_alloc(&machdep->pgd, "cannot malloc pgd space.");
> +		pt_level_alloc(&machdep->machspec->p4d, "cannot malloc p4d space.");
> +		pt_level_alloc(&machdep->pud, "cannot malloc pud space.");
> +		pt_level_alloc(&machdep->pmd, "cannot malloc pmd space.");
> +		pt_level_alloc(&machdep->ptbl, "cannot malloc ptbl space.");
> +
> +		machdep->last_pgd_read = 0;
> +		machdep->machspec->last_p4d_read = 0;
> +		machdep->last_pud_read = 0;
> +		machdep->last_pmd_read = 0;
> +		machdep->last_ptbl_read = 0;
> +
> +		machdep->kvbase = machdep->machspec->page_offset;
> +		machdep->identity_map_base = machdep->kvbase;
> +		machdep->is_kvaddr = riscv64_is_kvaddr;
> +		machdep->is_uvaddr = riscv64_is_uvaddr;
> +		machdep->uvtop = riscv64_uvtop;
> +		machdep->kvtop = riscv64_kvtop;
> +		machdep->cmd_mach = riscv64_cmd_mach;
> +
> +		machdep->vmalloc_start = riscv64_vmalloc_start;
> +		machdep->processor_speed = riscv64_processor_speed;
> +		machdep->get_stackbase = generic_get_stackbase;
> +		machdep->get_stacktop = generic_get_stacktop;
> +		machdep->translate_pte = riscv64_translate_pte;
> +		machdep->memory_size = generic_memory_size;
> +		machdep->is_task_addr = riscv64_is_task_addr;
> +		machdep->get_smp_cpus = riscv64_get_smp_cpus;
> +		machdep->value_to_symbol = generic_machdep_value_to_symbol;
> +		machdep->show_interrupts = generic_show_interrupts;
> +		machdep->get_irq_affinity = generic_get_irq_affinity;
> +		machdep->init_kernel_pgd = NULL; /* pgd set by symbol_value("swapper_pg_dir") */
> +		break;
> +
> +	case POST_GDB:
> +		machdep->section_size_bits = _SECTION_SIZE_BITS;
> +		machdep->max_physmem_bits = _MAX_PHYSMEM_BITS;
> +		riscv64_page_type_init();
> +
> +		if (!machdep->hz)
> +			machdep->hz = 250;
> +
> +		if (symbol_exists("irq_desc"))
> +			ARRAY_LENGTH_INIT(machdep->nr_irqs, irq_desc,
> +					  "irq_desc", NULL, 0);
> +		else if (kernel_symbol_exists("nr_irqs"))
> +			get_symbol_data("nr_irqs", sizeof(unsigned int),
> +					&machdep->nr_irqs);
> +
> +		MEMBER_OFFSET_INIT(elf_prstatus_pr_reg, "elf_prstatus",
> +				   "pr_reg");
> +
> +		STRUCT_SIZE_INIT(note_buf, "note_buf_t");
> +		break;
> +
> +	case POST_VM:
> +		/*
> +		 * crash_notes contains machine specific information about the
> +		 * crash. In particular, it contains CPU registers at the time
> +		 * of the crash. We need this information to extract correct
> +		 * backtraces from the panic task.
> +		 */
> +		if (!ACTIVE() && !riscv64_init_active_task_regs())
> +			error(WARNING,
> +				"cannot retrieve registers for active task%s\n\n",
> +				kt->cpus > 1 ? "s" : "");
> +		break;
> +	}
>   }
>   
> +/*
> + * 'help -r' command output
> + */
>   void
>   riscv64_display_regs_from_elf_notes(int cpu, FILE *ofp)
>   {
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
