Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B113C5320E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 03:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ4asAx0P49L9gpD65dX85GVE8C5jtRFByuk5AcAMPA=; b=D42bq3BFghNUby
	L6LbuVctoLICxSCOdKrKLiaj7ENqmyOUngh4JLyjJA5jERj9taheT/SMisUYMFRlJerWYqSUMrwqr
	Khb2pjghW0jiHJxsLlcfhMgyR+sQ4o1vkoe6BqndlkpSHcM8wN9dOVch1fvowhSzEkJR6Qn6r/Ab7
	goMV6NSqxFjGyyI9qKY2bH9bOkk088ExJNDAfPqz2xdTLCUAuCUSSv/vEONfP7VcYb7/V4n1uxxfA
	9dBe2Mj5zlL8MlFQfhx36kxi0+rbRCTCkRvLLpFTukxdSmvo22VH6axmAkvD8O4MnRXzIBa2PKOUC
	7jeyNMF3ZyJHZTQjT9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPzw-00000005blI-0VV2;
	Mon, 26 Aug 2024 03:02:28 +0000
Received: from mail-dm6nam10olkn20820.outbound.protection.outlook.com ([2a01:111:f400:7e88::820] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPzt-00000005bkh-0CbT
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 03:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHiJR8RTJzW8RsXgOewwBvWxTCiAC1lojjM6gW5hfFOXHEbFJ4kfYEEyuuBi8UK0+vSyK/PPmyaRz+qOYVypbwpuMs+NrhTz9LwPpLVTXE1WxTT7PTrACK1dKNCJYNWQFzWb4tLCbM0oYfkOE7fXdHSngV07LW64zMUSSP1lWMB+HKBvXUa77ZU09Obc5h/drc1en3yNa4IiBTdv3M4yQAua0WA0p9Ps30VroMVgr6LFg1HNPo074yTODle+2dbxGiGmAJHjYELqsBtKCzFLupyge8tuk5SFJomicxSxFw8AqXinnLGcU5iw9DyvWO1YfXdFd6Au138Qph4FB9Yjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJlmTkjK8Wsbnzwv7xVMiMH9q6GSUcb5i5dA5DqslxU=;
 b=j8eFqZ1vfzaUHVWw6QeyjmTspybmkDdCYgpcnGagqbgMcvtg+lhqbChaKCDh3ysFsJvKhz4R6BoitxE8eYejQHsPazE7nAql1jxu7bJeQZn/Kw0/WZ2Gqho3uAhRib7kR7Fux1hhFD08mB5j3H5hwgz2nqc0Hp7FZll+zc4c066VftsIlGAnxcpy3REn/8iCxUUNVslzdK2Fv3uc5Yvg4bTsPkHzMGJ8ipMxkIs19uU6cHk4NZZoLYw6FSsA7shu87CMvOVzhRbjcgGdCUzoikHiH7rwlw2acjKd6nP9+Zx0jdaqm0G78e7b4TY6+77CS7jUImEyv6LuUGUCyedLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJlmTkjK8Wsbnzwv7xVMiMH9q6GSUcb5i5dA5DqslxU=;
 b=YmUoev+ZgDTUXBJmNP/1k1d4Y6iol0uMwIaL6rMgcDz6k+9r4qTzWZNokpBOBCH8m1R1ZqbCXLdZFbRhmoQwRf5Ei8uWVrIjguRQSBb9+xCBY7hs6bP+Xphhemx98jUShXHzOHMLIn2a3pscsCHWuxg+ZgLBSB+rffDQ7e3Q8/P9rkQbGJSe9eG4qpkvYP5IE+Y/DtQonBvx+9utErfaYyaLdYlbJhcnPbDzhhCSVKW+V2I2n/YdnJndPDH4P/cIG+B3N09c9q/K7TpsXiiycsGAu3VGtm69p0hL5h5YhQdFgCxRGwLQxhSEA3IdBlSho4R99GcO9n/QDwN0Nm4y8g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB4815.namprd20.prod.outlook.com (2603:10b6:208:3c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 26 Aug
 2024 03:02:19 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:02:19 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH] riscv: sophgo: dts: add gpio controllers for SG2042 SoC
Date: Mon, 26 Aug 2024 11:01:24 +0800
Message-ID: <IA1PR20MB49532B2B3A9AA3DCC8E4B876BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819080851.1954691-1-unicornxw@gmail.com>
References: <20240819080851.1954691-1-unicornxw@gmail.com>
X-TMN: [lmiG7uG/ZwCZJNGvkVGu95zdMkEVzH4J0Q12KOxTWWc=]
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <172464127498.44663.11358842701383653392.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abff582-f5a1-49e2-7c65-08dcc57b7fc0
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|15080799006|5072599009|4302099013|440099028|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: 4oDkjDDmiennei/QpCny/iG4KdaM4aSvpyp83bh5ZRGv+CBsPaR2WZL4f3h3oONwY04jB/Jb1BKQG1bDcmZfaMklycIobNCf5+kaKEQD9volHjmo334wgigQr0Ws5QeJoXZ9kRSZhOH+ZW54WwSmXxY2KBQM6OWSk+susxye0RBQaXcEB1xzR+RnL2FlSiWScu2VIoAEfXri16KFiXUkyjpSmxT53xLufY2uUtEX5mC2jf0gsoUuP7QjQgLrS6fx1GZ9DT/ze2e8v5yp9e0NSdROvr9bYAvzjiryVhET+yoJZ9tAa8nQ2C9+0wKNLB7kRVdt7sedurmWLJ9Z+bIA2hDXWglkMWuDEcJhn92PJii1TxSqjOhUdVbEpnieoGZ1Alh8IFJDsWj0PkG98O2tSINi/W04fK64SsjjHCaC+FmSMXdzWqtgvb+V2KBfgCbHwgZvCxzlWSPUlLCHgYDS8FXCAeOGWLsqxp9SNrJxvqFG7q7ABdU5ArFtYTeHoYCKXeNgrtEK2g4oWrP65W2j2p0wyI2ZYhFbODnCMPWlYACEEZ1h1l96WWo9+P232VkrJOBd5XAFHgBKYVxIcyFndpiYBNzBmiXoe5wcT+yF9cz5Q8aSQgrCD2ycOkXL/dHQLHCU8xJdjddxix0qVx3lAc+pgp9ZtmTOqixURcaQplS6WTk2QswzZ1aArQnh+AxfihdAWvO0TMaMAxmrLxzDTV7EGSiPLpULIADAdft5UfIlE14W/kKc99iWWEtcin7/4x+kGHbpNQ5FZcEK8xkQx6Eylyu9GeENf9ZHC3amJgcGCegzPMdSTOba62WifJ6pbITobQVlztxfIJ7y0S5lOg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUl0bUVLamh6ejYrZUNBWitrZ0E4SkJ6ZnRzODNTWmRwNWd4ZkJFMmJMbldm?=
 =?utf-8?B?WXdXWVdqNHptZWZnTUtoUUpXd2MwV0taSnh3WDA5N09CN0F0Z3hpVzRsayt5?=
 =?utf-8?B?VnBNWjh6cFl6ZnBzVnl3aUt6azJIeURjUUFwQ0tZUHBENEdtR0ZrTGpMeU1y?=
 =?utf-8?B?bXJ5bUtFOW5DKzhsMUlIVlFOTmRBSXJweUJsYWhETTEwY0ZDNDhVVURNUDl3?=
 =?utf-8?B?OGJJc3FFS3ZYRHc3NHFtNU5nTFhWK2NGa00xaWdZSFRyODRTNkZ0TkU5Snhu?=
 =?utf-8?B?Mzk4bTFTbTR5ajNaSmV2OWhXNG1KajJwQmpKZ2JVZHlGM3I1TVAwQVF1UFpC?=
 =?utf-8?B?V0p5OGMvbmZNL0M4ZERuQ3BGOC8veFlueDVJQnp0d2I3WHNEQUZTUEJUYzZv?=
 =?utf-8?B?QXZZakFvR2V5TWFoaFF5OXJGbmhSUDl6SnRwdmM4Ny85SjExdXFmSUhKbThw?=
 =?utf-8?B?L2lUMWVWUDRZcExMaUl4SzI4bXdBNndoKy81cFpXSmc1eHlGRExMTk9CU0xs?=
 =?utf-8?B?TmZyL3NrcGU5bjZrMC9hMDFvaUQvY250MnBxV0ovNE15a3B6RFVsQVZUWFVt?=
 =?utf-8?B?bGhyNVhscUFqZ0pJSStnMGdhcW1mdWw5VzFpbzI1TDBId1VxSTYrYnYwZTdN?=
 =?utf-8?B?eTl6OFNWSVpnVDY3QnJsUWc3SGo3bDdnTWFPWHJUUVdBV05lYXBKTm1QMi9Y?=
 =?utf-8?B?N3lZRjBXRHpsQlBjbzVDb0Y2RWsyMVpwY0lBbDk0eTAzMWRLa0VpYnpQYjJa?=
 =?utf-8?B?REpsaklRc0xPaExBUHZZS0VhWFdYbVZtS1dJWHhUa2o2c0w4QUJPYmYyK0J5?=
 =?utf-8?B?WTB0RmtJbHdJd1p3dlVCYVgrZ2R6MkM4MmV0VnNaaGFKc0ZFQnQyQSt4amVs?=
 =?utf-8?B?N3A3Z3F2WVpJM1RwdEFXTjZ4aDA1S2FOMUszTjNvWmtIK0lRSUlCd1gvK2dT?=
 =?utf-8?B?WnVVclJMV3laZEV1M3h4WEwxRFQ1aWRqSW5uczA3R0Q3bVFrZVNHZEZTVnk4?=
 =?utf-8?B?OHJDNW04Sm9NeDFpUUVlUENGcWlsVkdxK1hJN0NKdTBHczVkOEFlampQUEdP?=
 =?utf-8?B?aEZ4UklMOCtpMzRpQnQzMHhRb0hMMUJVK09xNC9ySlBxQkU1YjJIR2VYaWU4?=
 =?utf-8?B?ZHJDUFcvcXB2cDNBRUZZVFVuTmpuV0VVeEtVK0JCZzE0MllpdkVFWmoxR1Ns?=
 =?utf-8?B?VTZqMTZkZVFFdktOZUY4K3VKWGZUc1Z1R1d0TVlGN0IxRjRBcDBXRHdJU210?=
 =?utf-8?B?YlMzMWxsUUU0R0dCR3V3VWpVZTJRNHpYSk0xSmtZcWJ1TU1kTzNnTDVRdlMr?=
 =?utf-8?B?ei9NOWtUOGl5YS8rdWZXWURoU0hHSW55MTUyRDk2dHRvYW9ENXNqN3pRTGY1?=
 =?utf-8?B?VnZXV2l0R0FFbitxYzZwRzNRU1lXWU5RVm5kSmVvR1Y0eFdIWU13YkZsRDZC?=
 =?utf-8?B?Ky80d1BXeFlMdjdCcWFEb1ZHOTlhUldWQzhuRWdmVldNMVNLZzhSYzhQaEU2?=
 =?utf-8?B?dGgweUFqOUQ0YVovcFBIUzZPWEhRSnI3WDg1d05IMWpzT0hhd2RuTU9rTnhm?=
 =?utf-8?B?Nkx1TFQxeVZzZFlPMkdtMDErQk5xdzl0SUpIM1lXd3VYYkZaeXh4OXRhQlV3?=
 =?utf-8?B?SWVGZW1JcTQ4OXg0VlMwQVVFRjJVbHYwc3RsS09kaDlqS1YwZ2ExMEdXb3Bz?=
 =?utf-8?Q?TZmiVgSeDHFoXpdiuhMH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abff582-f5a1-49e2-7c65-08dcc57b7fc0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:02:19.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_200225_114807_411754CD 
X-CRM114-Status: UNSURE (   4.85  )
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

On Mon, 19 Aug 2024 16:08:51 +0800, Chen Wang wrote:
> Add support for the GPIO controller of Sophgo SG2042.
> 
> SG2042 uses IP from Synopsys DesignWare APB GPIO and has
> three GPIO controllers.
> 
> 

Applied to sg2042/for-next, thanks!

[1/1] riscv: sophgo: dts: add gpio controllers for SG2042 SoC
      https://github.com/sophgo/linux/commit/8b5454ac54554b7389b7202213e77191e571c31b

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
