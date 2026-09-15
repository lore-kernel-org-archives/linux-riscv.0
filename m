Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB58C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e7Vk/AWuwOKgHIEZrEUvoMcfxwT6UdApNxj1x7q1FQ=; b=C2NLtb7VUukkXM
	xtDepT5YFQzThUJqnm5po0DGLyWE2JVKjFFCcT5MzYO6fbmkxnDkMEMx2kI2ur863s3rkZyRG965J
	hYE+KIFLURlTy1smhTl4JiEMCpSqYmfgQwRC6M2QU+NDNPLYZ0GKug4fgbzouSwcZfXkAo9CPuSWh
	ETrMRYTEGlDy2L5y/72g+U5d4qbU2Oe4HMNRqKct9aaA393My7EuDmm1ta9YgH9dub3uuxZAcPrU6
	9NuCDG30MzhqSyqL3JHj4ntPupsyALy/Se9Flr+BZQbn/b6WYGx59wplp8SllILx48vIdpP3my0iR
	PorCYUJl+v6GA5ZQRqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Srm-00000006eq3-3meb;
	Tue, 15 Sep 2026 13:06:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Srj-00000006eo3-2k6X;
	Tue, 15 Sep 2026 13:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWeJkxByoQN09f07YNNSQcccQvVg6NpKWVeVpZR+bNEdouhYQl+FL65AcTaXLrM0mD1vq/6N2w64oJYI+cfklSDUQ/tCB0WqyCi+7ZbbHV1ocxhh7Jxt/6rFp67OfwLhW7DRVFfKWefVdiewTmTB9C2udMla6/t3aOotsidUyAR/iWeLJwu/jBklI2kG2PERXOuBzrRPIm4/dxIJOG6+1bKauoCUi2noOBmdojuYeXGyGguka0IKCPLAMI+iGTzN6L1QT3Ef4jkZ+k1zXVT02IxNBJZ5wxFNq0kFKPrEpYx1GXsshAtyzhq8IyCcNgk+VW85AyZ3KROZphnmICtW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOp3JtybWms32leAMCYMUqn5NkXXLi3EW/yybA/Mv+s=;
 b=S/NEzAVuh3GUD7+qfKq76jzpCYpHAoUbW15Qn2FJkIbdCpn2lWAvgpKFh+JXwuljkjEyJi/7mAPXPWzeTKYdus/wIopFuqiRQn9o2xw3g3BzqQa31H/db5Y5Elfsi8IRjrVlOrT7GO+V/w+Dyu0c+uxdNnbko9VKmnpbCTgOYC4+0ozICnTQxxH1osIJSnlAu/EB2c5hvsjZPt+bAe/c3duvR0JQ3BAe/Hm1sYEGdpZBiUBQa24SDqM8M2Uxsz1OxDcVYZQY2BHfFZtQUxF/jUH9pg845sHpDXmi82pKl0iH53PD+e7AgoDS6YwJT9VEbMrBOGZvdZnCVo/o1t7m7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOp3JtybWms32leAMCYMUqn5NkXXLi3EW/yybA/Mv+s=;
 b=N5ua1jkaRHMjD8DAUF1XkKT5J/DwtOWbKN5fy3oY3TF/K4daxGqapO7fraan+nnyXtOlLlUVtUjx3O20j4W5LTqXgviL5w52Z3MUFWq66mJKL2NwTs9J1ljJvJm0HqS+9aUGYNADtQRqsYn7N1BjYOL2oMH/zx6/NIS0BgE/6U0H9oppWKbu8PCLRkrGNRUOCSebAFyt83la7l+0yC4ELlU9+yTfx8hY5q14zgj6BaQGf/07GSKBPWvJsXtgnVqZrtTJOyiaTWqfMjEWarKVgP2+ywem8AYGlI6NilZwfatgX1gZEzrducmZy1rau7cGfoZ6i05+q/flDicaqt4wBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYPPR06MB8235.apcprd06.prod.outlook.com (2603:1096:405:383::20)
 by TYSPR06MB6409.apcprd06.prod.outlook.com (2603:1096:400:411::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 15 Sep
 2026 13:06:01 +0000
Received: from TYPPR06MB8235.apcprd06.prod.outlook.com
 ([fe80::6ef9:8fa6:5ebd:96]) by TYPPR06MB8235.apcprd06.prod.outlook.com
 ([fe80::6ef9:8fa6:5ebd:96%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:06:01 +0000
From: Xueyuan Chen <xueyuan.chen@vivo.com>
To: zhanghongru06@gmail.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	baohua@kernel.org,
	surenb@google.com,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	vbabka@kernel.org,
	willy@infradead.org,
	zhaonanzhe@xiaomi.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	zhanghongru@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Date: Tue, 15 Sep 2026 21:05:42 +0800
Message-ID: <20260915130544.3774446-1-xueyuan.chen@vivo.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To TYPPR06MB8235.apcprd06.prod.outlook.com
 (2603:1096:405:383::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYPPR06MB8235:EE_|TYSPR06MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 54230f9a-907c-4683-aab2-08df132a1718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|23010399003|376014|1800799024|11063799006|38350700014|10067099003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 4qv46FO4G8prujqOrYUJa8IYpI66+l12EGuFal+Xj56c1yVdxYhn8JSpI2k9VG3T+noIXplNNWOrGao4hkMT4KdB3adzwgddD7eW6qDHnaq0lLGdmGRFskLBpvtuiBvrDzdlUF1PJwzPqxCBBJyiI1Zezcy7zmcWefROUdAIwB3VbBnGKLWdfr1eLZQ+WoCxaDR8o8o/Ja5mMtuYP0i4ZV44Lm0BX9w8MO9TsqWOeTTbYV0+5Nq78eborIhPjcmXdqHL+IiYaFBo4T7cxbcXK++4tYJTp4TD93FdHXrmTpOjQsCBCiqC4cRRau8xWQ1HZGuXfyVH4lpbkz7yO2O0SSOrzbDMRM3jrzIXktCRJ9QC6Lo5hJmPjnsmtowH4hKMeJfnqk43PYCYCKzC1gL/IlYmQuNTCdcdT60Ox/ewApmdAi4NnGPO1NPBQRjN8C/65urqQmzFFPIlmyrBQRjzr9PfFN7Vzwa2L9n9DkcmOEgFBZoGCz8JqhjZk4bVx3p/nXzrdeuxOot+TKLuHuwe+sxiT+qKz2WpEnLUCv4+DXnWI7I5StVCLKUSjkxjcs6Hgh6HEgItUx0gBrHIUZVW7CuCxiRWhsVVS5oQdCxeY0I4G0xB+RB04I/rPUsR/3zq3BCstQZTLLFFhL6SvlNlXE7aNQwrzAc0Nd5hQdcvi+uVPAz4JkYOqS/fB8VR/Lebq/QEBQbnU1ClD7F23INI4EFES9k7ZV8HZkZdT3SJoAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8235.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(23010399003)(376014)(1800799024)(11063799006)(38350700014)(10067099003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2YzQkJhaGdPVDY1bG54SE8zb1k0UDRIb1dBKzNPUmN3TVhRNi9hc3FMRjF1?=
 =?utf-8?B?dlpNV3ZrU0U0Y1AyRDg5TXU4N1hCcXQvSEhrUTd2QlJKNDQzckJURWdNL2J1?=
 =?utf-8?B?RG1tTlFTb2tURjBjd1RzeEF6RUJVVTZYc0o0N2ZyTXp2ZExuNktWVUY3TmVv?=
 =?utf-8?B?QngxWGlvL08rRHZKWUkvRUdxWUdEbThxV2U5dVZxRWZieFlVenhDc3QwUXNw?=
 =?utf-8?B?Z0JrNXdSckdEK3FtcU9valhhTVduYXpRMDVCVnhGR216L3gwVHM4dVFiT3Rq?=
 =?utf-8?B?L1NQUnRDYjljRUJvbUVvSmdyWHFWZ1Vtb1loNm4wNjZFWHl4VE83andtRmdD?=
 =?utf-8?B?RytUZHhxTVpadERxb05BdDRTWmgvbVl2YnpCdFZuUHZLU1BJUkN1OE1ieTRU?=
 =?utf-8?B?UFM2amMwV0tlNWFaeHhXU29lYmYrQ0t2OUpTZ1hXN0VqQmlZb1h6T0ltcE42?=
 =?utf-8?B?V1dUUmxXbUE4dHBaeVBhV2JQMXZxMDdJcitvcTZPV0kwTzZwWHF5OURCajdV?=
 =?utf-8?B?NUc4UmM1MS9hTmY2MDBsN3NVeTZ2ZHN1SllLYllGZm9FeE1DT0lWZTFLZ25Y?=
 =?utf-8?B?Zm1QczFKTkczTmJYdlJJMkcycHZpUU9jZzR0dU5YQTNtekFIcjBnOEVvQjlD?=
 =?utf-8?B?RXhvUkptK0s0QU50TDJ0K3UrRkFaQmZHNCsrLzJUYlMvcm1pWkZPcE5UMnhQ?=
 =?utf-8?B?ZklEd09PWVo3T1JCZWZnNFU4WTR5Qjg0aUJDYWVXYUhiUUlrdWo1NkFZdG93?=
 =?utf-8?B?R2xiTzFLV1QwZTB4WjgyTjlaaWNyOXlCeWs4QU5STWlNYWF6K09MSDc0TG94?=
 =?utf-8?B?QzNmcW9saGkxYkhrUmRYTjJUZ3JoTnAvOFVxMnhIRkVXWVo4RUk3T2hrNTR0?=
 =?utf-8?B?ZzJ6dkM3K1hNZDRjZGFLd2k3cHlEWGNuN25kYXZEMThJallKeEZVcTZLQVZW?=
 =?utf-8?B?eFNlU1BjSWdaZE82M2RKNVJnRlZmVWQ5SkJXeUlMNTBGM1FNa2huSDdlRk5k?=
 =?utf-8?B?UGY1SzhWeWI4U0NoSS9UdEZkamdIUEpsNjVLeTJvYjliL3NBMFo4QkFTQkhr?=
 =?utf-8?B?TkNFeWVxcCtqcHIrLzRrSHR5U0s5ZDc4cCtHbHFJb3V5Wmg4WTRNZ3B2OEQ5?=
 =?utf-8?B?eVNDREtMSlUxMTRYalVIeW5BeDdRU09tWGhDUW1SQTU1dnFtQS9uTVVNbGw1?=
 =?utf-8?B?dHRSbXNXZ0dYOGcrSnYyVlJYMXBkMlhSd3hRQlZ5RnBOMVREaUE5SHorMnNO?=
 =?utf-8?B?ZDU1RzZvQzFFOFVMbjFmcW1CclJvRFBWSTBOK25JaTJ6VlhmWC83U2E3SEQz?=
 =?utf-8?B?bUlLV0RiUWZlR1NBdkw5NEljRkcwODZLMWJYa2hZTDdiVmNBNzhGaGwrSmlJ?=
 =?utf-8?B?UWxsaU5OOHJpRVhFSExreWxwa0cxWXdHR0sxak8wVVQzWTEyMGNXb3AzcFpY?=
 =?utf-8?B?dHdIYWE0UjdweDlvZHMzOVZGSWNmanN6S1I5Sk5QeHpCeGMwT0NvendzaWli?=
 =?utf-8?B?dTB3Y3NjOE43TDF5dFlsZVpLQ2xkVkNUc3I4QjZ6RFByRnd5bXJPYmZ2RzBQ?=
 =?utf-8?B?cERFUTRzeVByUm5qTGZZZm5TS0tvUWNadnJJeXpqNFkyb0FFcVlIcW9GZlV1?=
 =?utf-8?B?ZENIcXBiNGVHem51Qm51SmpEOWpFdE9NbkN2YTB3ZkQzN21aTGpOdGkyUmtP?=
 =?utf-8?B?VzRxS295MUtVamNMS0xIZTBBbnJ2U3BlWTdOdjlRaDd5MDh6VFJiNmNSZ0p5?=
 =?utf-8?B?YnZ3WGN1YmVsN3M2OG9wdkFjRkt3dnVzRG9yUzVNQUdubjVGRUFQR01qbkM4?=
 =?utf-8?B?VTNlYTVVVDZ5MGxqaUUzb2hMRG53TGdmakRFSVZvUkFhTUY2bUNBa2ZkakVx?=
 =?utf-8?B?cmR0d05kaGJUSzk0T2hEM1l2b2VVSGVPZWhLKzlSeXhVZzFIOE9lS2VrMTdL?=
 =?utf-8?B?eldFdUJsSmtrdGUvMGhVdjdKMFdZWFk3N0xMNGhSYkVQYlVqbXZuRFFBbGFx?=
 =?utf-8?B?U3FOclZ1clpQelF3Z0hOWVlMaUViQS9vdmlmQU1xQytaaDkwRzV0bmpoSld6?=
 =?utf-8?B?N1VIdWYySXhUZDB1eHk4SE1hTmMybnZMMjh0TENSWXhDY3hRTWxnQ1RwWTcy?=
 =?utf-8?B?VDBrZ243b0xSdENITUcyTFhEM2tYTVJyblh5VEorR0w4ZVVRcU81bHRVYW1E?=
 =?utf-8?B?QWgzbnRBUzlnYjRseXJ4T0JRRjBZNklJd3lKNlB3ZEhOYWxrS0owU2oxVGZU?=
 =?utf-8?B?T1ZDbHRSYkwvYWRMR25xSEtPUWlnNXpNT3IxdGhqNy91SFA5eXp5cUNKcklH?=
 =?utf-8?B?dkJjcWVMdXNVQ3puZzJpbFNXbUU3YnVqem9aQ1hZeEEzYlVETUp3QT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54230f9a-907c-4683-aab2-08df132a1718
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8235.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:06:00.9725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH4Y9nyLOCBCoXrtAg96kaNjOgpNvYR/7x8k/d4jzyiAxBXIWfM3F9nkd4PO4D7DzBRA1b1/jbhKpCr6arS9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_060627_817833_88C4DB21 
X-CRM114-Status: GOOD (  13.67  )
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


On Fri, Sep 11, 2026 at 10:56:13AM +0800, Hongru Zhang wrote:
>From: Hongru Zhang <zhanghongru@xiaomi.com>
>
>The per-VMA lock fault path releases the per-VMA lock when the folio
>cannot be locked. It then waits for the folio to become lockable
>without holding the VMA lock and retries the page fault. However,
>the retry always takes the mmap_lock instead of the per-VMA lock.
>This can cause serious lock contention when a writer is holding the
>mmap_lock at the same time.
>
>Add a single retry under the per-VMA lock in the architecture fault
>handler. This does not touch any page fault code in mm. The retry is
>very likely to succeed because the first page fault has already waited
>for the folio to become lockable. For example, this usually means that
>any required I/O has completed. This allows faults that can make
>progress on an immediate retry to stay on the per-VMA lock path,
>avoiding waits on the mmap_lock when it is write-contended. This
>reduces page-fault latency and mmap_lock contention. Some faults may
>retry unnecessarily, for example, those in __vmf_anon_prepare() or
>device-private fault handling, which require the mmap_lock. However,
>these cases are expected to be infrequent and only add one cheap
>per-VMA lock attempt. If the second attempt still returns
>VM_FAULT_RETRY, the fault continues through the existing mmap_lock
>path.
>

Hi Hongru,

I tested cold launch time of douyin (the China's TikTok) and Honor of
Kings on SM8975. Each number below is the average of 100 runs:

     douyin:          666.0 ms -> 563.0 ms, 103 ms faster (15.5%)
     Honor of Kings: 1169.5 ms -> 1117.0 ms, 53 ms faster (4.5%)

The data shows a clear win on real apps.

Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Thanks,
Xueyuan

>Based on the stress model from Kunwu Chan and Wang Lian in RFC v2, we
>adapted a benchmark [1] to a 20-core Intel i7-12700 desktop by reducing
>the thread count and adjusting the memcg limits. The benchmark uses
>concurrent page faults under memcg pressure with parallel munmap to
>amplify mmap_lock read-write contention.
>
>Filemap throughput (higher is better)
>
>+---------+------------+---------------------+
>| Threads |  Vanilla   |       Patched       |
>+---------+------------+---------------------+
>|   40    | 1069.34 /s | 1400.13 /s (+30.9%) |
>+---------+------------+---------------------+
>|   60    | 1038.12 /s | 1683.37 /s (+62.2%) |
>+---------+------------+---------------------+
>|   80    | 1042.62 /s | 1767.83 /s (+69.6%) |
>+---------+------------+---------------------+
>
>mmap_lock contention count (lower is better)
>
>+---------+-----------+---------+-----------+
>| Threads |  Vanilla  | Patched | Reduction |
>+---------+-----------+---------+-----------+
>|   40    | 3,187,336 |  52,086 |  -98.4%   |
>+---------+-----------+---------+-----------+
>|   60    | 4,385,154 |  65,079 |  -98.5%   |
>+---------+-----------+---------+-----------+
>|   80    | 5,337,890 |  69,708 |  -98.7%   |
>+---------+-----------+---------+-----------+
>
>These results show that retrying once under the per-VMA lock keeps more
>file-backed faults on the fast path, improving throughput and reducing
>mmap_lock contention.
>
>Using benchmark [2], we tested this on a 20-core Intel i7-12700 desktop
>with a 2GB swapfile. The benchmark uses one pressure thread under memcg
>limits to keep a 128MB non-zero anonymous mapping under swap pressure,
>12 reader threads to fault it back in, and optional mmap writer threads
>to amplify mmap_lock read-write contention. Each test ran for 60 seconds
>and reported completed reader rounds per second under swap pressure.
>
>Swap throughput (higher is better)
>
>+--------------+-------------+---------------------------+
>| mmap writers |   Vanilla   |          Patched          |
>+--------------+-------------+---------------------------+
>|      0       | 17303.09 /s | 17899.48 /s       (+3.4%) |
>+--------------+-------------+---------------------------+
>|      4       | 12596.23 /s | 16095.20 /s      (+27.8%) |
>+--------------+-------------+---------------------------+
>|      8       |     0.58 /s | 15420.57 /s (+2658619.0%) |
>+--------------+-------------+---------------------------+
>
>With increasing mmap_lock write pressure, Vanilla degrades sharply and
>drops to near zero at eight writers. Patched kernel holds up much better.
>
>Performance was evaluated on a Pixel 6 running Android 17, using Baidu
>Tieba (com.baidu.tieba) and Tencent Video (com.tencent.qqlive), both
>very popular Android apps, as the workloads. For each workload, we
>performed 100 cold app launches with each kernel variant (vanilla and
>patched). Each run recorded cold app launch time, measured as the time
>to first frame, and the main thread's mmap_lock wait events. Shorter
>launch times indicate better performance.
>
>Baidu Tieba cold app launch time
>
>+-----------+----------+----------+--------+
>| Statistic |  Vanilla |  Patched | Change |
>+-----------+----------+----------+--------+
>|    Mean   | 3,672 ms | 3,580 ms |  -2.5% |
>+-----------+----------+----------+--------+
>|  Maximum  | 4,469 ms | 4,156 ms |  -7.0% |
>+-----------+----------+----------+--------+
>
>Baidu Tieba cold app launch time distribution
>
>+-------------+------------+------------+
>|  Time (ms)  |   Vanilla  |   Patched  |
>+-------------+------------+------------+
>| 2,750-2,999 |  0  (0.0%) |  1  (1.0%) |
>+-------------+------------+------------+
>| 3,000-3,249 |  8  (8.0%) | 14 (14.0%) |
>+-------------+------------+------------+
>| 3,250-3,499 | 17 (17.0%) | 30 (30.0%) |
>+-------------+------------+------------+
>| 3,500-3,749 | 38 (38.0%) | 27 (27.0%) |
>+-------------+------------+------------+
>| 3,750-3,999 | 26 (26.0%) | 18 (18.0%) |
>+-------------+------------+------------+
>| 4,000-4,249 |  8  (8.0%) | 10 (10.0%) |
>+-------------+------------+------------+
>| 4,250-4,499 |  3  (3.0%) |  0  (0.0%) |
>+-------------+------------+------------+
>
>Baidu Tieba main-thread mmap_lock wait statistics
>
>+----------------------+----------------+----------------+--------+
>|        Metric        |     Vanilla    |     Patched    | Change |
>+----------------------+----------------+----------------+--------+
>|    Total Wait Time   |  569.9 ms/run  |  469.9 ms/run  | -17.6% |
>+----------------------+----------------+----------------+--------+
>| Read-Lock Wait Count | 32.4 waits/run | 10.9 waits/run | -66.2% |
>+----------------------+----------------+----------------+--------+
>
>Tencent Video cold app launch time
>
>+-----------+----------+----------+--------+
>| Statistic |  Vanilla |  Patched | Change |
>+-----------+----------+----------+--------+
>|    Mean   | 1,907 ms | 1,840 ms |  -3.5% |
>+-----------+----------+----------+--------+
>|  Maximum  | 3,023 ms | 2,851 ms |  -5.7% |
>+-----------+----------+----------+--------+
>
>Tencent Video cold app launch time distribution
>
>+-------------+------------+------------+
>|  Time (ms)  |   Vanilla  |   Patched  |
>+-------------+------------+------------+
>| 1,250-1,499 |  3  (3.0%) |  7  (7.0%) |
>+-------------+------------+------------+
>| 1,500-1,749 | 32 (32.0%) | 33 (33.0%) |
>+-------------+------------+------------+
>| 1,750-1,999 | 39 (39.0%) | 36 (36.0%) |
>+-------------+------------+------------+
>| 2,000-2,249 | 12 (12.0%) | 15 (15.0%) |
>+-------------+------------+------------+
>| 2,250-2,499 |  7  (7.0%) |  4  (4.0%) |
>+-------------+------------+------------+
>| 2,500-2,749 |  5  (5.0%) |  3  (3.0%) |
>+-------------+------------+------------+
>| 2,750-2,999 |  1  (1.0%) |  2  (2.0%) |
>+-------------+------------+------------+
>| 3,000-3,249 |  1  (1.0%) |  0  (0.0%) |
>+-------------+------------+------------+
>
>Tencent Video main-thread mmap_lock wait statistics
>
>+----------------------+----------------+---------------+--------+
>|        Metric        |     Vanilla    |    Patched    | Change |
>+----------------------+----------------+---------------+--------+
>|    Total Wait Time   |  139.6 ms/run  |  66.4 ms/run  | -52.4% |
>+----------------------+----------------+---------------+--------+
>| Read-Lock Wait Count | 28.4 waits/run | 4.7 waits/run | -83.5% |
>+----------------------+----------------+---------------+--------+
>
>Across both workloads, the single retry under the per-VMA lock
>substantially reduced mmap_lock read-side contention, leading to lower
>app startup times at both the mean and the tail.
>
>[1] https://gist.github.com/zhr250/c36c2c54d9351df37e12fd072d4926ef
>[2] https://gist.github.com/zhr250/218ffe693f842346b56434483127422c
>
>Signed-off-by: Hongru Zhang <zhanghongru@xiaomi.com>
>Suggested-by: Barry Song <baohua@kernel.org>
>Suggested-by: Suren Baghdasaryan <surenb@google.com>
>Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>Tested-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
>---
>Changes since RFC v5:
>- Added measurements from 100 cold app launches per kernel for each of
>  Baidu Tieba and Tencent Video on a Pixel 6 running Android 17
>  Tested by Nanzhe Zhao. Thanks!
>- Rebased onto mm-unstable; no code changes
>
>Changes since RFC v4:
>- Drop `VM_FAULT_MAY_USE_VMA_LOCK` and always retry once under the
>  per-VMA lock, based on feedback from Lorenzo and Barry. Thanks!
>
>Changes since RFC v3:
>- Keep VM_FAULT_RETRY unchanged and add VM_FAULT_MAY_USE_VMA_LOCK as an
>  advisory bit
>- Bound VMA-lock retries with FAULT_FLAG_TRIED
>- Opt in filemap_fault() and do_swap_page() to VM_FAULT_MAY_USE_VMA_LOCK
>- Rebased on mm-unstable
>
>Changes since RFC v2:
>- Redesigned as a single blacklist-based patch (v2 was 5 per-path patches)
>- Added retry_vma loop to all architectures (not just x86)
>- Rebased on mm-unstable
>
>Changes since RFC v1:
>- collect tags from Pedro, Kunwu and Lian, thanks!
>- handle case (2), for uptodate folios, don't retry PF
>
>Link to RFC v5:
>https://lore.kernel.org/all/20260814085300.399107-1-zhanghongru@xiaomi.com/
>
>Link to RFC v4:
>https://lore.kernel.org/all/20260804095135.45897-1-zhanghongru@xiaomi.com/
>
>Link to RFC v3:
>https://lore.kernel.org/all/20260626075019.1833065-1-zhanghongru@xiaomi.com/
>
>Link to RFC v2:
>https://lore.kernel.org/all/20260430040427.4672-1-baohua@kernel.org/
>
>Link to RFC v1:
>https://lore.kernel.org/all/20251127011438.6918-1-21cnbao@gmail.com/
>
> arch/arm/mm/fault.c       | 8 ++++++++
> arch/arm64/mm/fault.c     | 8 ++++++++
> arch/loongarch/mm/fault.c | 8 ++++++++
> arch/powerpc/mm/fault.c   | 7 +++++++
> arch/riscv/mm/fault.c     | 8 ++++++++
> arch/s390/mm/fault.c      | 6 ++++++
> arch/x86/mm/fault.c       | 8 ++++++++
> 7 files changed, 53 insertions(+)
>
>diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
>index 0a09d4ff7718..70472744f5c5 100644
>--- a/arch/arm/mm/fault.c
>+++ b/arch/arm/mm/fault.c
>@@ -344,6 +344,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
> 	vm_fault_t fault;
> 	unsigned int flags = FAULT_FLAG_DEFAULT;
> 	vm_flags_t vm_flags = VM_ACCESS_FLAGS;
>+	bool vma_lock_retried = false;
> 
> 	if (kprobe_page_fault(regs, fsr))
> 		return 0;
>@@ -395,6 +396,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, addr);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -424,6 +426,12 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
> 			goto no_context;
> 		return 0;
> 	}
>+
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> retry:
>diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>index 75c3e463df2e..c7fd6f485b16 100644
>--- a/arch/arm64/mm/fault.c
>+++ b/arch/arm64/mm/fault.c
>@@ -614,6 +614,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> 	struct vm_area_struct *vma;
> 	int si_code;
> 	int pkey = -1;
>+	bool vma_lock_retried = false;
> 
> 	if (kprobe_page_fault(regs, esr))
> 		return 0;
>@@ -682,6 +683,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> 	if (!(mm_flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, addr);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -728,6 +730,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> 			goto no_context;
> 		return 0;
> 	}
>+
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> retry:
>diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
>index 2c93d33356e5..ef6ea847b1e0 100644
>--- a/arch/loongarch/mm/fault.c
>+++ b/arch/loongarch/mm/fault.c
>@@ -181,6 +181,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
> 	struct mm_struct *mm = tsk->mm;
> 	struct vm_area_struct *vma = NULL;
> 	vm_fault_t fault;
>+	bool vma_lock_retried = false;
> 
> 	if (kprobe_page_fault(regs, current->thread.trap_nr))
> 		return;
>@@ -219,6 +220,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, address);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -265,6 +267,12 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
> 			no_context(regs, write, address);
> 		return;
> 	}
>+
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> retry:
>diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>index 806c74e0d5ab..06018b6d7086 100644
>--- a/arch/powerpc/mm/fault.c
>+++ b/arch/powerpc/mm/fault.c
>@@ -422,6 +422,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
> 	int is_write = page_fault_is_write(error_code);
> 	vm_fault_t fault, major = 0;
> 	bool kprobe_fault = kprobe_page_fault(regs, 11);
>+	bool vma_lock_retried = false;
> 
> 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
> 		return 0;
>@@ -487,6 +488,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, address);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -517,6 +519,11 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
> 	if (fault_signal_pending(fault, regs))
> 		return user_mode(regs) ? 0 : SIGBUS;
> 
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> 	/* When running in the kernel we expect faults to occur only to
>diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>index 04ed6f8acae4..ff861793dba9 100644
>--- a/arch/riscv/mm/fault.c
>+++ b/arch/riscv/mm/fault.c
>@@ -284,6 +284,7 @@ void handle_page_fault(struct pt_regs *regs)
> 	unsigned int flags = FAULT_FLAG_DEFAULT;
> 	int code = SEGV_MAPERR;
> 	vm_fault_t fault;
>+	bool vma_lock_retried = false;
> 
> 	cause = regs->cause;
> 	addr = regs->badaddr;
>@@ -347,6 +348,7 @@ void handle_page_fault(struct pt_regs *regs)
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, addr);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -376,6 +378,12 @@ void handle_page_fault(struct pt_regs *regs)
> 			no_context(regs, addr);
> 		return;
> 	}
>+
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> retry:
>diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
>index 46d828926009..dcd1ba24497f 100644
>--- a/arch/s390/mm/fault.c
>+++ b/arch/s390/mm/fault.c
>@@ -271,6 +271,7 @@ static void do_exception(struct pt_regs *regs, int access)
> 	unsigned int flags;
> 	vm_fault_t fault;
> 	bool is_write;
>+	bool vma_lock_retried = false;
> 
> 	/*
> 	 * The instruction that caused the program check has
>@@ -294,6 +295,7 @@ static void do_exception(struct pt_regs *regs, int access)
> 		flags |= FAULT_FLAG_WRITE;
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, address);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -318,6 +320,10 @@ static void do_exception(struct pt_regs *regs, int access)
> 			handle_fault_error_nolock(regs, 0);
> 		return;
> 	}
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
> lock_mmap:
> retry:
> 	vma = lock_mm_and_find_vma(mm, address, regs);
>diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
>index aa88370ce739..df10d5cea4ee 100644
>--- a/arch/x86/mm/fault.c
>+++ b/arch/x86/mm/fault.c
>@@ -1222,6 +1222,7 @@ void do_user_addr_fault(struct pt_regs *regs,
> 	struct mm_struct *mm;
> 	vm_fault_t fault;
> 	unsigned int flags = FAULT_FLAG_DEFAULT;
>+	bool vma_lock_retried = false;
> 
> 	tsk = current;
> 	mm = tsk->mm;
>@@ -1331,6 +1332,7 @@ void do_user_addr_fault(struct pt_regs *regs,
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
>+lock_vma:
> 	vma = lock_vma_under_rcu(mm, address);
> 	if (!vma)
> 		goto lock_mmap;
>@@ -1360,6 +1362,12 @@ void do_user_addr_fault(struct pt_regs *regs,
> 						 ARCH_DEFAULT_PKEY);
> 		return;
> 	}
>+
>+	if (!vma_lock_retried) {
>+		vma_lock_retried = true;
>+		goto lock_vma;
>+	}
>+
> lock_mmap:
> 
> retry:
>
>base-commit: 3628c3df6cd2797b34714d23113cd44cb30801e7
>-- 
>2.43.0
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
