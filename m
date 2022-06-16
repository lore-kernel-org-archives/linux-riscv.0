Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F75CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IYsu8Wor0QpEKoVQA1UtVuOOjTl2jr7jsuMQSRf3YkU=; b=vKEAXfN1pDubkG
	K6lzHnmbZ0eX/cJs0yYobaqRwGcgDHN8eJX66cpvOvlf4zd9NDD6Z5+3M5lyRzl2Zc4eUWl4fO9p0
	gMcwKRcXeONmieO//knkLVcfUdhu3jBNfRksqhzcjiDiXx4pIk17Mfpfv+/EuphehnmQ+qA2X9Nad
	+yNXUNkFKT88jQUMN3381J0jfgLlP0NOEpf10qA3O6TRMe35spfsIKc9EBGomHBHSnNm5+PhWUmWP
	MR4+DnXb0ukKkvQBPFoe1pWApbHPDYgvYrBN8K6rCrkepr5OpIXSE7wKSD4VsXyL3p0FatEhO1zXo
	I+y193Pdnv4G9Os0dy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xDZ-004SfL-LB; Thu, 16 Jun 2022 21:39:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xDW-004Sd0-2d
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 21:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655415593; x=1686951593;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=AXrBx12b21JRW2J0P17ScTJXWKqsPGQaYXfFuURuTLY=;
  b=2i+Z9B+f6+AsT1j5yg2EpObsE/SHmACuPaCIVUJva3oohJgs+DW1Rqyy
   tzG5JZzUDjuHyZXsmLjvZq6rcx0rk5gkVXF8LkTR8P8tfZiUeIA8BAqwK
   Akdlb56TnMJIdBcMADP4LYq7166L9FL4RP3vXpfzQscfpXD1yz0R1UY7g
   aYIx12tUe6UPqGaR6V8raI6gfE2rpej8OjGIXEOWeqvkjawy0AF1VZvwF
   bOxNJ0mjPXIIrgcxi5esFh5W8bpiur5v/BKm+C+V2NYblkWWDGG0dwABo
   0dcGSAkKPuywJBes4htay8qfxWo5YR4eEHBsN5TiqLzYzIWz1z7gOv0Ps
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="168743833"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2022 14:39:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Jun 2022 14:39:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 16 Jun 2022 14:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUnKvwLILS2MCBMaYEuom3SiorWKW6dubXIOy4041Cowq0jcAAxjdyq6fIRWC8FYp4B5Lh7Xmz4JN10Y2JxwiBJz2wRyVlg9uDnQeyXG29dNxhXqtHvMAheC9a1qlbhrx5mLBtNRciDYwrXet3cru+HemvvMdAHcPRLTb8uG/4Pwa3VPBcHPURuUne9gRkJZ7Hh4MOtyMG7rcTqozceH8TibUMZ1ATdYoCmiCf9k3jpDmmeBpjJrZ3O5p6RZFAreb102S9jf4fRT5kWJBZz9IaoOSGlSCTHcwZyezj6b3ulJKC+9Mvtlxg1MkC6JHQFY2qldcDEE7v2AFzQfxaWvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXrBx12b21JRW2J0P17ScTJXWKqsPGQaYXfFuURuTLY=;
 b=ClEdaSXjXi0s4WchIkllgNbKkeQbKttq9bVJ1XJA+pvlh+xbylQKovt4G0rzMn82YeHotfndKl/5RxK8ZGsyAABD8X2dZHpBY3nGIFa2VaXNCT4ndOgtwpm3NNvixQ+4qEksM21AeXoSIQ45R4KdGgOhMATgZA+jvcgitqOOr4cd6nN3aPuUlCdcC3IlnOo4z2inmRQvnzGqUVBLVh/u1knDkAeFLSSgn14AoYCIp+lmQis5BOc/6rofyjkegrs5BQAVRCsRAAILPkRUZq390siP0/HoKPBgzlNaAs1w48y0WHvQcSZhxWPWUThKLAwzw8GyV9xzkYl7HBQvWju8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXrBx12b21JRW2J0P17ScTJXWKqsPGQaYXfFuURuTLY=;
 b=icQWfXsOIrDZooBMoFFx4KLaw0s+N7+QXQHDfXLg902zvPj8s9GKUUOy5wyXI9mmCrg099imvPfyoiJzhqT5gJvAU6i0rz4Lbv6clPfYcY9o7eEVgSe1erONOmQEcCohdSN2NcySTIXNdaKUmseNpXuO5wWu0FRdZ4ZOAGMCPjg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2664.namprd11.prod.outlook.com (2603:10b6:a02:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Thu, 16 Jun
 2022 21:39:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 21:39:47 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] Microchip RISC-V devicetree fixes for 5.19-rc3
Thread-Topic: [GIT PULL] Microchip RISC-V devicetree fixes for 5.19-rc3
Thread-Index: AQHYgcmZubqCdxJ5wESa3d/UHAJbsw==
Date: Thu, 16 Jun 2022 21:39:47 +0000
Message-ID: <93062022-8973-494c-8526-a79e41f8494c@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db3ffa9-6050-418e-5ab2-08da4fe0bc1e
x-ms-traffictypediagnostic: BYAPR11MB2664:EE_
x-microsoft-antispam-prvs: <BYAPR11MB266440AC0AEEEF6D78BFA6FB98AC9@BYAPR11MB2664.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2KOqRvP6+B+gzsuMTKPdpxXRwYiqBk9pifph95OG4h1d2Oz1xsPpeaEKWAbR7LQUQMTXuJlP/fqy77hq/N0C6dRXvyvTTnVL3pUqUyKPlFu9Ug7qRyEyux+Rw5dcd8PW+wNp0qerQadmLcIxKI4iWw7+0V+UgrTF8YO9UIsMV6poP1qbCepqfultdfZNHibje2SernDP1XtrTRjIRysAsVaPwp8YKtWsCl5J94dfSivPlk9TF1qv6xTPcY6HgKhd5S7m5y8rwEzZfxLDbICTCW+c3Eh1VXXFicaa/yhxuKDrdrgtnwyaMSK2Cm8kuGgIgt8VR+nPDOmWp7OmNhiD9ALHto1bhldq7Ny/t3nua0MrEdwwRDuusHiWcBPie2rLrP8s2RoSEJYoZZ3i8GSoZDhjnnvKvuqiEl5QeKjBBZKqtAfkKmy6hTdoxOHC0piO8OCmk49FYPWzNQUDAOj53QizV9qwsE0QpX5hg5IcGkm5/4/EyY/pmLahRF0i3j9jbO0XD8DwaWSlHIqp4jFcT400owNVaZ7BCKhccT6UVzuLsWZ0LhJLrjPhk+HsKNjdy1v/Ys0kveqDFDg9FExGZV6daxQj/OYYCkxxqYlPiW2AirM5bcpAAEv1iB2/Rm6CNUjrfqwbfatXVxM9Ph0EBil4TtXwuHBN0CZRKOpodzcmMw/EFzLY9yrTCuSmV3cnQtYfHFS9rcZ1odfBB6m4uRNTg9+gNaEqBd8gQqbFW3XFi9pvlnogloeCIMVBM+wxjvyMCmUz0C9oVXcBTGjzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(2906002)(6486002)(8936002)(122000001)(5660300002)(71200400001)(508600001)(186003)(6506007)(38070700005)(26005)(31696002)(6916009)(6512007)(36756003)(38100700002)(4326008)(66476007)(31686004)(66556008)(91956017)(66946007)(8676002)(64756008)(76116006)(86362001)(316002)(66446008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3FldE4rOFRJMUFZVlNvVWVMSWNnK3dLbnZWcVhYbGU1YzRHNjJsNmlicVRi?=
 =?utf-8?B?TXdlelpZL1AyZkdoRDA4dFkzOFhYWmxSQlVkNFJEekU0cG4yVzVCRGVqSFlV?=
 =?utf-8?B?RVIwN2V0N1R5Z3V3ZUlsUVgzOWFYL0psTTlDVDNlUk1VTGtGMG5IMnU1RzJE?=
 =?utf-8?B?YVNiWlNDWDQxbWNQRVJvSklqRWkvem5zZ3BYRkVpY0ZZdllVbUh6RXBqeS9l?=
 =?utf-8?B?MmJHZ0orRUVBYnJZU2ZwbkFzZ0l4NDhxMFcvRW56RDU2NlM2KzZoclN2QjNl?=
 =?utf-8?B?UXV1SzhlZVRsRWVuTmNrcWZMaE9FY3VSTGVIUVhubDhWcGpRNnJ2WGhCcW5n?=
 =?utf-8?B?Z3V5ZWo3Q0kxSENaaUlYcis1bHptTUcvcHAzZWNsZ0dTZEVFdnhsZVJjS3E0?=
 =?utf-8?B?eEFFYUtMRmNqRmJKNzFkekxsdk5oZ0pCcXBxWkZSSjZZU1ZidFZCWkUxdmo2?=
 =?utf-8?B?eGREZnZ6SnFMSmpGWFRtemxkZWt6RlVRZ2huK3NoUnJZNmROZTY5U08wdmov?=
 =?utf-8?B?OGZrM2U4VU5UcjdFMmlJanhEMFZhVWxlSVVLNTB3aDJWUlEreENWQ3gya2NC?=
 =?utf-8?B?Q2RlckdCaVVORUMweUsrSTRQM3RLeDJkKzJyd21HcFFrWUxQSmhFUjhCYjds?=
 =?utf-8?B?NmQ4MFVNcUdZejhqUXlCL3ovRm8xUUprcFNOdTQ2RGtkTDc4MzBkS1BuYUdq?=
 =?utf-8?B?bEUzcDQ4TTZUVlJuY2R4bmxwYnlVMFRzNU43bStiZUp0THBDWlA4a3ZhWWdL?=
 =?utf-8?B?RERXb3c1akxhZUdhZjBWSkJDUWNhazZmOTlRQzc1dFllS0dvM0VMRW5BVEF6?=
 =?utf-8?B?dzE3eFRLWFlOWEpYYS9GUjI1eGZOM2VjQXBGUGhFV3JEU0VXdGExbktZU0JH?=
 =?utf-8?B?eXVaM0twaVlURUNYbHZQbG1ORklOVHlNWk82a0JQcWordytQK2VBQXMvc2F4?=
 =?utf-8?B?QW1VejhZbldkR3VCbG4vaXVyMUJueFZpTkk0UHM3d1RZdGVuZzV6Kysvb3o2?=
 =?utf-8?B?NXZxcE91VVUrZzVYNENXcWVOSkU5aTFTU3ZnNlhKV1ZqcWZoWjBrTGZpRHpT?=
 =?utf-8?B?RG8ydk5Dcm1lSnhkUjQ3MWo1blF3SjF6bmpFNzJ0UXRTWlNZMTdJZ1l6bW1K?=
 =?utf-8?B?ZUJKMlAyS25zNmNaNG1kT1RncmlranBxK1FOcWJZbDVzL3hGeUFOOVViVFNP?=
 =?utf-8?B?aXAzdDNpQUQwQWQ0Ui9SSklLdGowcHBNNGROS0dKa1dYNXkxaDJ0MVZ3VHFT?=
 =?utf-8?B?RE5lU2pqcW55MEsxUGVUUS9ENmJnZnVOeXE0alpXVjlSR2hqM2o4SVhUaXpK?=
 =?utf-8?B?N1lLbDNDTk4rWUtxMkw4WkNFT2duSTVwMjlVWGpPeWNpdHFhaENoTlRVK3k1?=
 =?utf-8?B?b2ttQzMrcVY3Uzd1enZqRmlwaFBNMjE2Nys4WXdxa3BBaWluMzl0SkZIb080?=
 =?utf-8?B?ZWU1SDRSNmM3YWtHK0hkTm1FWTF1SDBzWTR1MEk3YS81bFR4aFBpZzhJenI1?=
 =?utf-8?B?VjFHNmJMdzg4U2xKbVNyZHhVeWZkdU9uMjl5amN5TjQvRjJVZDZPZ2FXb0N6?=
 =?utf-8?B?Q3Vndk9XSUlRc0xISXN2Y1c3OTRMeXhUMnM3b045ZXh6OXd3UTVIUHZZeE4x?=
 =?utf-8?B?di9lZmhwL3dJRFEwU25JOUJiei9ZcVZsVEpsWndQbWY3K3Z2R2FOMUV1VXB5?=
 =?utf-8?B?a3hBdDFhTzBEeHFaRzdHdUNXYkJmVmwxQ2NDNjVtL1ZuRVhwWkg0SHIvaE5E?=
 =?utf-8?B?WGFWMmlQUWxuazFCWTMyZXJqaWlOOFIzSlJVMTV6a1RhVm9DeVo3T2VxYnc2?=
 =?utf-8?B?SlJJKzRHdzd0RFhyVkRNUTVWY2s2UzB1MGkrc0dKN3pCdHZBQ3NhR1NHUmwy?=
 =?utf-8?B?Y3J4TEFVNXpRclpJNkdobnF3dFRLMG12d2hXc1VXVStDcXlBbVNEMkxYQ1pE?=
 =?utf-8?B?RktNV0RkbFc0TXl6UmR4RytsUWRIWlc4d1VNYUtWRkYzeFVUQVQ2c2QrL2dk?=
 =?utf-8?B?c0hIdll5Mjhzak8zMDFxVjVnNWFsL1FETGd0U2NPcUhDcjVRU2o1NElyenlJ?=
 =?utf-8?B?RHFtTFNTWk16bU5BdzRVeDRmZGdCblJ6c3NZWjN1dHpsMnoyZ01zOU5vaUhW?=
 =?utf-8?B?d3ZLaDRFQmhkdWNLaGxlaThqcmhIa1JqN09zM2IxbXM2MnNpeDVpM1BjaXYw?=
 =?utf-8?B?aW1KNjArWlZvV2JLZ20zVnRuWEREMi9Dam1JNm1FQlNsWE9hNVBKZDJFSE1I?=
 =?utf-8?B?V1NoM0ZabUN5c0FyWkFHdkI3WXlTT3JGZjlVaDBGK0VLVURWR2NxUHk2R2FZ?=
 =?utf-8?B?Vm5Nc09VVHlQQmVBOE9yY1h1TVRiTjhCUGpMd0J1WTF2bWNDcjdkTWEvaURU?=
 =?utf-8?Q?qnEbqrw1lmWtz1ec=3D?=
Content-ID: <895DAED0690F504CA9FB52EA5A499804@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db3ffa9-6050-418e-5ab2-08da4fe0bc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 21:39:47.3408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHzrlU08N1y04MwuL3xEzUjBbp+ZJMA9Iu7FvswOHxrklnu4yyVLWt8Iai0nXSDJzqfI5/aP7NbRM6aEGpQv/LsiDr5d2SLlhRBgIWY2/Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_143954_375500_0006AA04 
X-CRM114-Status: UNSURE (   7.91  )
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

Hey Palmer,
Figured it was best to do this early with just a single patch rather
than wait until things had built up. Hopefully the tag etc are done
correctly.
FWIW this has been in -next for the week with no problems, although
I'd hope not given it's devicetree...
Thanks,
Conor.

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tags/dt-fixes-for-palmer-5.19-rc3

for you to fetch changes up to 5e757deddd918edb8cb2fdb56eb79656ffc6dade:

  riscv: dts: microchip: re-add pdma to mpfs device tree (2022-06-12 19:33:52 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetree fixes for 5.19-rc3

A single fix for mpfs.dtsi:
- The sifive pdma entry fell through the cracks between versions of my
  dt patches & I gave Zong the wrong conflict resolution, so it is
  added back.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: re-add pdma to mpfs device tree

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
