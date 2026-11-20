Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F102606A33D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EqMBITaI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qjYEkRJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f3Out5KSUXFpYZGqzySH1HGJrEKx8Q7paYXkaIX9db0=; b=EqMBITaIJY4MMAetAAZnOhjYrG
	8pBbqoyik8DqgNiqJKCosK0GB9YxDIUTO4Sk4eGVjO5XxTfoDz2+NOLLih153UdK08eiAJxsGxY6A
	++fFnCP64fy/zDwnLfzsl+DUr+KVoUK+CGZaj8toXOQF0fNzbs+f6rJN33jUmt17DfbJ9a55E3scv
	FBSoWvZQ8flnGRANbij4UZdkAHC5FhjVWasGG+/fgRUSVEoaInS+JVbxzJF35Wgl85RqVxzVRf0DG
	q9zs3iYK4GdFGY6lUmUO3gkXsKMDjO/VHjZESV9+d01LvGVeBuLxgJ+nQoYG472BOgbRVC3bktvc5
	HbFcPhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSRH-0000000Fhi9-2Edl;
	Fri, 20 Nov 2026 17:30:19 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSQu-0000000FhSs-3rNr;
	Fri, 20 Nov 2026 17:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3E4g7Jxw3UaUNcfjztU63AmEEwOaCoLq1jhOHADVcdkuIXS5WThMW3W3UwXmdvXVYf1mZp6lOOLma1CFPrP6hdK4qb6QJnyPQC3hjDevyZSKxdeYSfLiAAwCqvEZ5EojvbKi0jRALtO2fzt88GMBYULeTekweKRUpztPxGWmYfUogfHazBwu7DaYMQAClS4QWgBKU9NbQi5oeBFKRte4XUgV8H4O0reSxTUBBd+HAbLMeph0W2vzD1vnjKkLJTbwmHWsTZ1yGfLC13FmmBr/FFduRed/59M1KaRuP0kJfloFRqIl0wgT2WszwuO+g3L/2l43y0KOb7fcZ1Y95NtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjrk+6+HHB+i+mxXa5/gIwoaNJia7LvozlJppRUXfwE=;
 b=aqNxxI3U5IZEYObZhd5v3EWcF5QzUQILzZBmANVgSXTlHbS8Vcd6+Cu9xvsdUCtVLC3y+asVIdjXyTRrx9AJCTXo9i11Oy+Z2QgQn8G8A3opynXetLZTk5AySvJpMrJCPS25/x/lDsnNDW6l5ERouGlkRmTRT3tfNyk1KAEW/f1NDuxwiPBc3G988VPyyzqF5gqYyWGhvXWv5W7uO0FAgPVGkwdNwUQ96QeHvHYx09PhQC8/8aZVj+SXTRyiTIZS+LyN8BBAmJpinHBd3aRqf0geXwg+txAU7BuArSsd2m5M5oa6eYjlGjNqr+awo5027jdF5rSSWafjhvelXf6TOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjrk+6+HHB+i+mxXa5/gIwoaNJia7LvozlJppRUXfwE=;
 b=qjYEkRJsVf2cyFSx1CGLVsmXZo9y3QxhEKXSp5ZpDXiIMgffJxVqALvZUeUUlanHacbjtWPfeYoIerj4+cZUTjQ9kzmFFTAsJLy+RM34OJ8nAlGlvsy7x3f75I+u3KqeOC7k/B4pqug/Fgq9u5ddKvgsvbchWPOccPW8EREYeqiv5ow3S/YXCUmCfSO22c87Jv+MkdrpKjV7+q9srClp1wEfWEePyyc3CSl73lxH02ZdPWE3QDwzUD5UW8Wq7lNio9b3WhNO6rrKRjrmwHrGEc140kDUgqpdw7yoccvoZKb+0sszH0ZbccM81sqKKtFEfwgvT6P4n8o+oPX10mx+AA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ1PR12MB6099.namprd12.prod.outlook.com
 (2603:10b6:a03:45e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 17:29:29 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:29:29 +0000
Subject: Re: [PATCH v4 11/19] efi/libstub: Drop reserve_addr/_size params
 from handle_kernel_image()
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261118182105.1633603-32-ardb+git@google.com>
References: <20261118182105.1633603-21-ardb+git@google.com>
 <20261118182105.1633603-32-ardb+git@google.com>
Date: Fri, 20 Nov 2026 13:29:22 -0400
Message-Id: <179519576291.392094.219056149366423269.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BL0PR01CA0012.prod.exchangelabs.com (2603:10b6:208:71::16)
 To CHBPR12MB731189.namprd12.prod.outlook.com (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8f4d26-5198-4655-57ee-08df472bd3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|4143699003|11063799006|261102123227099003|261022075727099003|261021121427099003|261022115727099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 3r/Gvr8hGkXne9y3E8YkfKwsiZRZw2sgRWfFBgDVtaAN/Veu3yBssPgKQ2PfutEKlCtN1swd073zKxTov4L14dkUzyQwL3gPcNX22Mg5Rfj6TgxK6OvsWLszMrx2nmnoyV44PqrVMsZzK6Sg1uJMOc48knyuBNy6x1AwFsBZewIPXl9rB3daT59TNh4GEn8/evHJhVHwdOEsJhXpJ0JLbgu9y4qBrqwgafazrGxprH0qqrEUuqHnH8VRmZIk9osMXURtd9IhPDjk6idyYTPk7fe2egqVD3NFfg9X66kNeHUYo54z0GicWL9SziG02jvdq630uYWjvA27BlXAhQQNyyUJOoNEpeZk7a1A8I2R8ky0z1qbtL85DKE995PsDZD4tqy9kcrRb5/wy9PHWiIimjs0Plw17IXFGNs8f+6hmiR5+aGEnFXMnHPO5uBUeBFi2eO/TlNDZ+UmIAHUtDXe8rxM7I1bZurDhlv1y/lPpVFMHIgPE5FHsw+A3WUq5rqJTwyS5A6OWm37chZQ32+MSit5aMDGOcdoaWk7K3BDkQmCWUUAlTNNfIYlWwd4xxuODGBiq05uNLarLBSmGEwO9YHZ3KmhPWX9BqGp3+D8kIYJh0BeVPbOmZ30SEfeJEeFVqFV3pXdbXroleC0rEZgLJ9RxXzoWspRb6qaqna3ZYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(261022115727099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTRNQUVPNk40dXBvRkVEdit2YXhNbyt3bHlBZDhJZHRiMXk1aFpWa29uQWEz?=
 =?utf-8?B?SkltSnFBOHU0OGdxZEw3eFVTVlRFbDFyZGRSaWxMV3hSTXBjVDBWZXpXVERT?=
 =?utf-8?B?aE4wVlRmc2N2bUlDNjM3UjdSWHdFSGliN0d0U2xQRGc4SEFiZm5pM1ROZ0Rs?=
 =?utf-8?B?RWJJem9PcWtHMnorUnV5Skl4SnMzNUt0cmxDNzVodGduNDNtSDR0Yk9zdjVL?=
 =?utf-8?B?YzVPVXlaZW5oV3UrYTE0SUR3NDJmL3hCS0FSWDRrQWV3Znp1OW1YOU90bVgz?=
 =?utf-8?B?clh0dzlGSWZnVURZcXRtUThHV2F1NnpSZm1FUW1tcG02aUxtUEZJelZCeFd1?=
 =?utf-8?B?STRBZ2FTSWhhRE9nTituOEV3U2FFOGNocHBVNXRKMVRTMTlpT21zb2R1aWJV?=
 =?utf-8?B?c28xcXZuOVlsY0xSRjBQV0d6YU9QYmdwL2FCcFI1TmtOdXE3TjNIbkZRZlVS?=
 =?utf-8?B?VmZDYUd6Ky9VaVBhNWh5SDBDdTRTTmRNMXVSMUhzcWswR1REc2dWWW9jME1U?=
 =?utf-8?B?cURyV0hOa1d4ZXFGQkhnQm1vcFlhbUlFRGJZTTIrZG5vazZLMTZJWVNIY29m?=
 =?utf-8?B?cVNqd01NUW41aHpKT2VjU0c1ZXpNQ1ZLdE1aZzlmQ1hOTGVlR0RFVmZidHZQ?=
 =?utf-8?B?RS9OOC9ta0JidmhxUlhYZ0poaURMSi8yL3ZueURlMFNlVk9kTC9SaTZlZkl3?=
 =?utf-8?B?S1N2aFY5MUJlbXh5ODAwMWxnenROR2RBZTlJL3lvTGRGL3E0VHg3cHI5WHdn?=
 =?utf-8?B?bWY3SXhQbGo1R1VYcXlueWFvYi85Y3phb3lBblFqbkU3cXRWS3dtQ3BJT3VE?=
 =?utf-8?B?anZJSUpHQ1M0WjJHLzc4Z1dBQ2FTNThtOXowQVM0dUFIL3BzeHhXVDArT0g3?=
 =?utf-8?B?Q1V4MndMU3llT3VEZkUzZTYzN2lVOXNGWE1WVG5yVG0raGFHUVVSRmcrczJS?=
 =?utf-8?B?MDJENEtSVkxWMWlCTDhwNjJjeC9VUU1WRWVNd1RkZTRScTRjTTNPYWNwWWo4?=
 =?utf-8?B?cWpsOXdxY2Zsbm9ITktRUmpoOGdEZUI1UVhZNEZUZFZSSFp3eCtIc2FNYS9x?=
 =?utf-8?B?VzFqa1lPVDNSWEZQVmRya3E3ckR6cC9EUngzRFl1SnUraWN1ZTRMd3ZuR1Bw?=
 =?utf-8?B?UUlmM2lHK2hkZjVqUnR0ZERyT0EvMlA1b3BpejFCSG45b0RnTkZBaXJQaVRM?=
 =?utf-8?B?NGQ4dUlxbHJTUlhaamt1Y2I5aEFYb1pGa3NxQUZBdkZaQkxVVEZmY2NuV3Zs?=
 =?utf-8?B?OW5WMHk5MVBUMVUzbnNTYzhVaHpOK2R3QnltVkh0RTFpMmtkc0tvdVlrK0FX?=
 =?utf-8?B?MkozTEkwVlY1YUZDNDUvS0l4Vnh1WWZnSWlyWmZpRGpUY2ZBL3NualdmK3kv?=
 =?utf-8?B?L2F6TkJPbnh6V2pHWGdvRkdoeHhRdGQ2QXl2Vk5vbWg2b2V3YVJaOWtTVi92?=
 =?utf-8?B?bGNDSzFFSUNHcUovLzdiSER6cmtEL3RGN2pDcWV6WWJqL2RKbWR5Q0tHOGNi?=
 =?utf-8?B?OTVPaUFXS2NqTGxxcHM3bHh0Ykp5VWFVMThKZGtTd1V4ak9xNmsxbmdNbTZS?=
 =?utf-8?B?YlFCcGdsTUtCY1Q1MWNoZU0veW0vd1RxTGoxZW9SeHF1MHF1a1hMMFVJZlM5?=
 =?utf-8?B?NkNINDZrRmlEMEZscU9jSmdSNmdBbHZEbDdNWmdOOHpOSmY2VUtHNFB2M1FH?=
 =?utf-8?B?eG9YSHp4RHoweGt5SFc5VnUrMzBwbkUvYmZ5U3JGRU41ZCtvdWFDTk1PYmhy?=
 =?utf-8?B?R2lpZjJJeG5BbTdjYzVKNHk2dWsxaDB0SHdSQTdPOW0vRzlkaWpET3pCbHNt?=
 =?utf-8?B?NldELzRhcTJIUVF6UjY5ZG50eEV0di94YzVFeUlmSlNXZm02Q0Q0d2dBSG9D?=
 =?utf-8?B?bGp5eTgrT0JZTmFmMlNHb01BTzhyQ0ZZZEtqcXhKTFptYitxcjh4UnpWMW0v?=
 =?utf-8?B?ZVJOaU4wVzJqb0o2bE5IVXNEaW9ZTGxtSWljRXp0dGxaZ2pKSWhLNFJNTnU5?=
 =?utf-8?B?VmVkdXFxcG9LdmhPeWFMU3FyYkhRZWZLV3ZFaFFVb2RSNWxCbFlhV21IbGd0?=
 =?utf-8?B?encvaGZsUmw2cDhzN0NmWSttNTJLQ1lyeVhjZ21uM0Nwd0ZhVXJTNHFsS0w0?=
 =?utf-8?B?VU12ejdIZXZHVUJybHpRRndhb2gza0x5aTRYNzdyZGwwT0ZnbVZ0Ujlialpa?=
 =?utf-8?B?SS9jSnQ5M253NTZmd0VOWlFRR1FnWE1BNkRNeW9MNzdWQ2ptd2FndDEyOVZO?=
 =?utf-8?B?RTlSVitLN1E1YjdrZ3M0SkNTT2RBVERsY0VPMmVrbmpOVW05MlBvWVFHNDdV?=
 =?utf-8?Q?eE9p+ge47rfQgHeWcH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8f4d26-5198-4655-57ee-08df472bd3bd
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:29:27.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUac+11llgp6R9zGz2YzM+KSl/DAQOOBwofTafk/+akpBsVkgktH5ajaGOeNZNkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_092958_981025_66A7DC1B 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 19:21:17 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> The reserve_addr and reserve_size variable pointers passed to
> handle_kernel_image() are no longer used, so drop them from the caller
> and from the prototype.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
