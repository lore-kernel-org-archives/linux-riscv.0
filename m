Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C56EC531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 01:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=330fxE/a9H6PkKJvy/8NseMgu46Bb12lhgd9LNIPaFs=; b=I/rUBDy9NMzf9n9GKc9vXFytMF
	hCPNQx18bp8yF6Pn+DDoNU/I/TQQxajNpIU595JoWPsyq9bew7iLSWUs8UdFlkYVmZjUqjpaUcNdW
	f1Sw/VQlEhvokvLu+8IEkiQOsbXY4Gh2eDJO9DrOZFq0qmspUMIMyyM6WNWrtdn/c+YsAiszsLrGH
	1J3czpwp9Vh3F69TwHyQ2PbDxLnZNZOItPwQGTCQH5tb4wpMRJpbySwRPkesPzosm07TbKQzTE1fh
	t7qiIiLSdqdHYhKO5I7KAW8KLAcOmb6hKaSNF8Fi8uWJqJY+NFpPx9zUqUHGctynT/O+7Exw9Kjx8
	iEOTwRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWsI-00000004DQC-0vQA;
	Tue, 28 Jul 2026 01:44:54 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWsF-00000004DPl-0ZoP
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 01:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srfxo0eFwX1Vs6n0VXk8DeAjubHPWd6AtNC1yZbTNmA3ZzZOm/zJm0XX4e9ABzXKQ1/fraXj6u5ZXoeL7lkEjVttf4+NqJ/H7YAKSVqr4vGAl9/JDbnd0o6mkAWIkA5Esr1/B/avIqaRlKI7bwctthKq1mnUh8yyDmQ6gHHCkeVoyrJvlwwhJ9c6d9mu5cymjJLGjS+WGKVNilCyGhYh4LbDYzRLvchIptOnh4toRdDs+EcmWWeqEgjUbAhps67cHq1wRF9/FbxlV2OcRQxCJUaEjzdVJsWEChhMJ06k8KvpzKlLPpAb67xiKwCFf+wlYtSY3POCWEGzwSwZA0raPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/E+Nvts1GXsiZWFLcXPZEzx2guAEsaAZmheNQRzvPI=;
 b=UqSPtBP1b5PviCcIifrKfhGU9Zwhm4wvCdsiBnkQHIIYIElJzXonK42Swu6sCgwqTIxO0cOVEa5tmeopZgegJo6DUay8x938NAWbV8vi2sQNSu/BDbsD4ulZv77j/eJTfSSZDW+y4+WdIBlPXhvvY15XzPCBM1/jF+RuLUiCeYqRZoRycuVxKLlguc/iFaYR+T8N7N8NRDBz57fPBOja2G8sRWLbGB02b1LiGv+V4zLhaof/Js9dcgD4kZETlgy5OuU1ve3NIaRyZaKsU0OpnJ/BXCcpaB7tD4APqH49VoF74kcM7vRgGQkamYT64o2mhs/vfdGpDD3Y5dMt93lglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/E+Nvts1GXsiZWFLcXPZEzx2guAEsaAZmheNQRzvPI=;
 b=ZJr/5jvPi6MjQfY8S7bJLIkbO2o+OJTFJ5F7hUCIJtU+GhgnnrKVeINF0uor6qnn8YK3upygGVELIqfXDiGC7oVpnN94T1Q3wZYeUS0LOywVx3C9Vuf/ciSyiDTUaN6xj4PtuEqCqwm9G/VsuLNPbxJp7uYkcHzGP0vgq7mqysq6q1oGmV7LXK6LI8D8MGaVdvIoZn5Cob2XWrZ5tIHaGe2Zc5n6JOlCNVdMDK91A4lQTgrD/QFEtOGQRCuOGvXMmKvtIW1nZ5IQ/3L/pVdcmJdSY4YmRJrtUMOAM1BA62RP3XFBoJ0FbWnpAvuVHkwBxsc99sODhEtoiQO/JPJbJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPFA403A61D8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 01:44:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 01:44:37 +0000
Message-ID: <be8c93d5-9882-49f1-995a-0d7c99450027@nvidia.com>
Date: Mon, 27 Jul 2026 18:44:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 02/12] riscv/mm: add
 untagged_addr_remote_unlocked()
To: Rik van Riel <riel@surriel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
References: <20260724222934.1463812-1-riel@surriel.com>
 <20260724222934.1463812-3-riel@surriel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260724222934.1463812-3-riel@surriel.com>
X-ClientProxiedBy: SJ2P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 3397df4c-456d-4618-6bc4-08deec49c89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|4143699003|56012099006|22082099003|18002099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: wNNFZ9b+ZzKVM0vPjrai+VWrk2797BZOcTP3OR+okquSXaW1Qii+jHl+9DzUpYVA/nak6iE+vLtJtxgGOWLwYDstZna/DRiIa1g554vtohyBvzp6LUKwWXiqMXPOh0pUUhP0em96hUOAMfH1J+oFdcgHjcD5y10IXNlSKcT2a1fe1YPbj5Ul/FeR/U9subkiJn8bg+B4sNsg0lFeXKgvHDG4G+RNlG1hlWyW4pmuQ8RFfQCq80VSgUvpo4ot73Y+86LDWNJUOzqz+/j+Ek4A0Le0s/N2Ymntyod7ziuxHYtUPWlKPp8zwviy0hdwcd39d7bODC4frO407FECec1ithhxKDpnY3pf7/7LJO5uBGOLWPn4KHKqH9hVTux4eUzbkBROpioVW8GlLBIXpFvHQQ0xmcGzf7xZSzabf7F4NiIsSC98ECt30Tp9amqTJi/RXcQk94BU+Z9Bfdr2OVfASmvtw/fhzGFcfbsJ67RFGQ45+2xcCv+b8gpxVlNR7IygofJqICUwXvI1PO9ULEttV99UGQOhMCqkDUKRyE/UHlul3ImROlirDMSq9CKNK4uN8sFuW1thqJHvArh+ee7r/pGeMu/4WXl6vtG9rKZPn87KefJyjcwQm4E/vLuMGB5XEcrns1dzkkmGFUSrkdUwWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(4143699003)(56012099006)(22082099003)(18002099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZythUjlob0VTR0thcjUzQnBMYVYwSGZ3cXFySzJGaWl6UWt1aDh5NW9nbUJN?=
 =?utf-8?B?MjAxQzZGY201SFU1VFpVc2ZqVnJHMGx2VkF2RVplZ2RlREhrSmcwTVR6UHFB?=
 =?utf-8?B?WVVERUNBQThyL3ZmVTg0d3FYeW41QlVqZ2FDOGRnY2tRNWNpMm1iNi9VbG9D?=
 =?utf-8?B?QkF0bVlreWhkakZrczQyOGhtMDIvd21HaXZsL1VVUE5RZitGdC9QNU1ES1Nn?=
 =?utf-8?B?TUtqeW5IazJiNklTaWhVYmJ6NmFSbll4MGVGSDlHRUgzeVZYRlZheGJOY3hW?=
 =?utf-8?B?ZmNMQ3lvanZJNWp3Rzl2ai9wR3RBd1FzNXJLT0puZHNyNUNaK2ZnQXdFRFc5?=
 =?utf-8?B?OG5WaHdUanQzS3dTWWZhNDQ0a251ZFJiNWphbTBUM3Q1MXFKOGJRUTJuQ0tN?=
 =?utf-8?B?dEFLMGg5MmovMWpUeU1CYi93NythbmRYUWg5aGJEaTdVM0JiRGExVldhK3N4?=
 =?utf-8?B?aERucHJDUTh4TVBwZUV6YmIwdW9acURmZWkzNnYxamxqdlVFSThMT1FvcFZx?=
 =?utf-8?B?Vk9sY25qL2JrYVVnTHBQbGpZWG9HVHdhM1lsdEJJTjlBTGZCRFRLTHROQWVD?=
 =?utf-8?B?WmRRRU9KViticG9zT3JKMENYUWNLMU1jZ3BnSHhDQWdUc0VFRG1HWnNWSnJ5?=
 =?utf-8?B?SUhVbHVuU05UYTRsaEhJZlVBSEtXaWJJSjBwNzl4QTZHVWZlQXpTVmJrZXh1?=
 =?utf-8?B?V0l6aTdlMFlmZUdvamlqUkpCQ2RTRzJyVFpuU3RPMHdwQmlxT0dsYTdsa3Er?=
 =?utf-8?B?ZzZPRmRUbjRxa2gxTllDRDBGZFhYWUEydU9uS2s5d1RDL2IxbnBVN3cvM013?=
 =?utf-8?B?N1MzTEZqcTRuU2EzQklodGlKOEYwSmphZFVMNGI0blFYNHFZdTNvUE1QK0N1?=
 =?utf-8?B?U3dQK2U3MGx6aEMveFFQUkplcGY0OWduL1h1YUNHUllCd01kQ0NjUC9iQlh6?=
 =?utf-8?B?SExDaVk4YWJaZnYxQmtVTkNCT25tVE8rSllGWVBSRWVYNzV1Z1NkcjJId1Vm?=
 =?utf-8?B?aHVHZWNobnR6S1BGSGRjNlM3YVVHZDZQQzB0TW5uU1BUdVJsWDFpMGRqdEpP?=
 =?utf-8?B?SjhKbmwvWXJIVll2VkpBVGQ4RDRhL1QybEVRdUFBSGRaeFNCRDBXQjM3Vy9W?=
 =?utf-8?B?UUxhSEduZ3o4N3BFME01TVF2c1BVeWJueUt6NGp5L0RmdjVWVjFHdklEWkhB?=
 =?utf-8?B?UnZDNnlhNmlRVUkwMEdkcThmZlF3MVdUVUJhdnh5ZGZnNENOdjA2b05QUFJk?=
 =?utf-8?B?MXVoT01FQnovbnBubUE4MzRjOWJCTTBBVlRONkg2ckJLV3E1eHF2RmVvcjQ4?=
 =?utf-8?B?NHRqTGM5eWpjdUNqWVlBVzNTLy84NGEwQXI0a0l6dDNGV0s0eDdKOFR2Y1g5?=
 =?utf-8?B?R2wrcXJEMWhxdCtvalloalRRTW5Va1h4YmNIaittZStBTEJUeE1XNEZtNVFi?=
 =?utf-8?B?YzdOazBlQ3VhK1FtS0lLN3lNd1FPWE5FajhqOVdrdTFVSUF0RG03Nk5EaDky?=
 =?utf-8?B?djVwMzdrT1B4alJIOHBCWDhwS0E1cEtING5SUEduVlJnbjZSZzJwSkJNSUdX?=
 =?utf-8?B?ZzhFMThLd3FpOEZOYzgwdDZ0U0pmOWNFbTIwd3J3T1loNjdYVy9FTVpWK0hK?=
 =?utf-8?B?NkZnZTVoMlV6cVBDVEEzeHgrSG91NkU4d2dyeHVGVHVBOWZjZkZkK3p4OHdm?=
 =?utf-8?B?ZStnS2d4dXlwZ3JoZ1R3K3hrTkpnTmpDWEhrM1dZekVMTURmUW9IT0pYdmlx?=
 =?utf-8?B?OFNmV2NXU25mclppZFJ0R2FOZ0wwNm9zVFZVcnlmTHVQZTNNdGp3TlkvS2FS?=
 =?utf-8?B?bFVobmlIekJGSGhvRHp4cjJxazJWREJrWDhrZ3Y1QkNPK21SbW1OaW82dFBR?=
 =?utf-8?B?cHcrMnZnUm9yTllwVU1wY0tiNjlGUTlENVNSSGsxU0hHcUNQNHJjRUxmMVB5?=
 =?utf-8?B?bENQRUl5RjB3ZHdrY1B1b0FmMzV5dnZKd1loRDFteHVyZ2tFek5rMXYyUUVs?=
 =?utf-8?B?NngzYkxwam00ajQ5TlZCTkhGVEtROE82TFdGZklrWnIyYU5aYXVRdWVRK2ti?=
 =?utf-8?B?QWw4UWhlSlBPQWhhbHlHSzUvL2E0V0JjaS8yRENrUU1QR0h0RzFZY3VXRnpz?=
 =?utf-8?B?NzlwbEltclo2bk1nL0lhTjJTUzliVTArTDNNWU1LcDJVQ3lwZnFJbDcwOE5T?=
 =?utf-8?B?OWxnZ1dKTnNjaGVHMWY2SUNwY1J5b0YybjllRWI0VVpndGsrYnJkWUdKVnZm?=
 =?utf-8?B?RjBZSlpGZHVySDJJVkQxZGtFejIxbGt5cmFjeE5ScHJuQ0Y4SmUzaFFxYmpk?=
 =?utf-8?B?bVVTaTM5TVFKaWZQZXdzWmlFdGVycGMrSlEvT0ZnYlpnNy8wUGRtdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3397df4c-456d-4618-6bc4-08deec49c89c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 01:44:37.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+i9Sq9kusY6cXKvgOz6WMRtMhoEn9c5rfsAB1YqLjgvgcJdt0d7PNCfVVMJmBw+ZcyjHYca1QYt3xbHuDE3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_184451_187110_A0684846 
X-CRM114-Status: GOOD (  11.70  )
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

On 7/24/26 3:29 PM, Rik van Riel wrote:
...
> index b2df7f72241a..6ae7552fed09 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -357,13 +357,15 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
>  
> -	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags) && mm->context.pmlen != pmlen) {
> -		mmap_write_unlock(mm);
> -		return -EBUSY;
> +	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags)) {
> +		if (READ_ONCE(mm->context.pmlen) != pmlen) {

I think you should remove this misleading READ_ONCE, because it
implies a race that is not there. The code is happening under
mmap_write_lock_*(), and so does the only writer to pmlen (below),
so they cannot race with each other.

> +			mmap_write_unlock(mm);
> +			return -EBUSY;
> +		}
>  	}
>  
>  	envcfg_update_bits(task, ENVCFG_PMM, pmm);
> -	mm->context.pmlen = pmlen;
> +	WRITE_ONCE(mm->context.pmlen, pmlen);
>  
>  	mmap_write_unlock(mm);
>  
> @@ -394,7 +396,7 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>  		break;
>  	}
>  
> -	if (task->mm->context.pmlen)
> +	if (READ_ONCE(task->mm->context.pmlen))
>  		ret |= PR_TAGGED_ADDR_ENABLE;
>  
>  	return ret;

thanks,
-- 
John Hubbard


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
