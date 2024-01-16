Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4794BC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4szSKVtEOTO3RM9H3lViEAMrvB85cJDOxolpgF51hUQ=; b=ZHI1TjidsrExa6
	XzE68od/OOFZJDtqSDzv84pr2dGs1/PTZRYJrIHGOa2ElQQSHnII6XBFROoCGeVGdBtPKUSfehL5E
	3Mw3A9MPtlxEy4DJrs9bzke0gl8hP2v4KchxJRn1sPC75S2BIjF8LDps8QBA/wAIupRHA7D677HM9
	1HnexewabkKzMXmmHYbheajj63V8EcGWnn7QGtOgeDJgsVvxaqBAIRJjfXKLeN6uDIRNS/bKvxEza
	esUC4uppFAOmtU2qNZAzyFxxFySKJwXLPyNzzGs5fkV22fJG4K3/xGIBtQSRwGmPq2pZ85ATx9IvB
	MhJEVfAnign87z6qwS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPibg-00C4wn-1t;
	Tue, 16 Jan 2024 12:31:52 +0000
Received: from mail-bn7nam10on20601.outbound.protection.outlook.com ([2a01:111:f403:2009::601] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPibc-00C4tf-13;
	Tue, 16 Jan 2024 12:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBDU7Iuo3pkIVqOgqdgFO7n0v/JSP+1lCg/rsCJG9Urpa+Sw29ztX2hjL78EHEhTJypr1WIlOb/mOgg4Wxqphr0oK2IFLHLgkKfk8axfx0ZLetH9EpygkC5P8J1fvyX1gecHM1PVxgi+JNfRYaqLbTdZZIyz+QopXZH6ABw1VHBZquaCuyHKXbFfZIJFQfRzogyHrPwBNlb5L9gae1cOMOKLT9EUSQNxa9CWTZilHgCl6De6VOfMWoe64nYBigawp7mfrlZ5MQGJr3jcTn79I4DywQs7WQJg05yHgAl2geBtQJgh+nqGlT2m/UJSKetzqUEe6MPpw+7mg8zEP8mlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou69qmu5MyFdSzUksBk0UioIF8NrI2EuIjJPhw39MO8=;
 b=FSYsdD9F7Jy3ZSeAQGZQHxURC5IDoWB2nofreQDX4FLkxXQJEz5OKKK/1J8s8H2JtUdWcYiwmECGe87d6s+FIGp40G2kY8YThlw5tnhiqJkPm10pTjIhE5/1ruoZcyOWXoEkBOPSWWNOzHJ8cFmWcah0qT/LjcqISIXcDWDbE9XM91bJZbuvwpvdS8Y86Yd+a3LjGgcom4Xw2kErqipPu7p1QOEar5YT08z565msJ0LLMQGrVUxizOr+sFQlsBl0QG+Q6MEdeE5g22CWDgDLnt2wZdM3qAwqNEEVPCQFJ0rSqfK3aiR/1aQ41pC1IM8hTzPSYv76pyKIjwt3IcMrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou69qmu5MyFdSzUksBk0UioIF8NrI2EuIjJPhw39MO8=;
 b=oLsDTSbx5nU4UkKtJrtSM1ihw4jYLk53xAhWHdqTCptwADWLeN0ztN5IR4vGp948lLEcYwOCjBI25+UPGbVW8W1ZozxgNQ36MqpG0h2wKLgJfcF4wBmclYQZmu4fZwJL0WEiO0qmv6U6K+hCLnrD7htTOb0UGSIVznOI8VxBnF2JhzDYsmXul99yFNhdQp6vhtjX3SN4BUG/P+TA51BWqSeYbqWRER6AgShkEXBfCvVKpTtY03PJoRTpO+sftERkrUZaA+5lBXVNA6AgWqwQFPtymMsiliZQ8Cqh4i2J3UTZu1xp16nJ9rwfQsgN2q1VFqyZV0mAFdzM8km0R1Oeaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV8PR12MB9112.namprd12.prod.outlook.com (2603:10b6:408:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 16 Jan
 2024 12:31:40 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 12:31:39 +0000
Date: Tue, 16 Jan 2024 08:31:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "peterx@redhat.com" <peterx@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <20240116123138.GZ734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
 <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
Content-Disposition: inline
In-Reply-To: <c60c9d88-33aa-4312-a23c-20206e503b6e@csgroup.eu>
X-ClientProxiedBy: MN2PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::39) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV8PR12MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cdfa55-9746-4133-6268-08dc168f16c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prUm+q64mhOP79HbjbpXdCYY8GwWVnlGcIsMX7rlOr2EpGtnHR9gWxYDRYPamfmrD0x4pWI0uQOW9Mkq1XZFq1XD/kfAMvteKVoCVU98KhrLB3K5Svj+qpgDc3t17uzKIV3TeWA8ZhimPEd3Qm/qTrCZ4B0tmyIB6fL7wbzhg4EXHBZYMccEw90AEN2CuT0ze39ldw0sUhUc/4y1QzVlL4QL3JehVginc65mag97bbbfvaJHOdQp1YzwFUos/3irW2exZ+CDpQS1A2UYQi1H3vlwswy9KWQylDHbYDBT/2knbAyUX858ED1d/2lLcExJIgIBQr5fpjTdnu4q1yf8T7qVifvVFybhz62ho6XQcsTdlVM53yDiooDRbzdUqA33LeG8ICEeGP2xQ7Y/NfiNaf8jm56SIwPm6leNllGgkuX8MNyg/rSy0/QWXySZgedyHe2v64ZlJhBI2mL15E+fDFx61xdMlW9yG9y8zanCr8VvQT+sznzIfCJkk+Qt+gQlMXe7rVvywpXy0YibHUWB/GQIrN3H2iNgNGqKXaJRzaLgWqBFdoBcszBkNG7yuB/LS6cgNQazE9roWO+VyyItC1hEodpQbai17y89mwK3EWhFG2+uwTAMQokfLZpfUXsP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(86362001)(26005)(1076003)(33656002)(66946007)(36756003)(478600001)(5660300002)(38100700002)(41300700001)(6512007)(6506007)(2616005)(66556008)(6486002)(2906002)(66476007)(66574015)(316002)(54906003)(6916009)(8936002)(7416002)(8676002)(4326008)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FRSDAyUGpFSHgwN3BFdTZWQ1g5TEI3VUNnaVpBamJNNVhXdm16K2dtTUdY?=
 =?utf-8?B?ME9IZllTS0J2U1ZkOXNtWU5zNXBTRGVDaS9yLzNVSHNZMGhrc1dOZDBsMG9L?=
 =?utf-8?B?QzZieXhkVmlMdWtxMWpsdjZ2Qkc5aGJKYURLemZEUUZWY3RNYS9kQnlHRHZQ?=
 =?utf-8?B?bWNFUExTdGxpb3dVeU9tUldwQ2pUcTA2bXhTRDR1WUl4QmlXdDNFZkI5TVZB?=
 =?utf-8?B?T3NIVnRhYlJCc0pvekZyblpPUEozV0hiTTNNaWFoVVlERmM2Yk1wbVFiWGVP?=
 =?utf-8?B?azdnVTM1ZWNLakxlb1NieU9scWNCS0tZeGkvdGFqWUpKZXhMcEE1ZzFoUEtZ?=
 =?utf-8?B?dkMweFU0b1AzK0t2dklGekdvYU54VURjeW5OV2NjZEVnSFJVMFUzdHp0ZXRM?=
 =?utf-8?B?TXZxNWthcTFpT3FNM0Nqa3dPOVhCTTB2TnBnQ1VWaFNYRVdzNGFtUSs0a1lB?=
 =?utf-8?B?VEZTa0tKWkxHNllQYmx4L1NiMjhMVmpualVIOU94N1JLbXRXSmxScnQzRmJ5?=
 =?utf-8?B?U2tpZS9aekNVcExDd29jbFBmaFhQNXVNNE1aLzkwOG9yQW1ING9Qa2xqaFZX?=
 =?utf-8?B?elRoUG96Q01OZ0prWW1yVG5PQ09MNkRFWU5CbjRrZkwwN2w0SzFvV1VITkx5?=
 =?utf-8?B?aGRZcFdQRzNsdFJ0cmM4U2phZFhObVBPWWlCMmcyL0ZkRmZKTjBFYzEyNlBl?=
 =?utf-8?B?MTM5NE5WTzBxRW5VZGxRejNLNUVzSXhBckg5NUlmUDMwMEg3UUVFT0YzVGFk?=
 =?utf-8?B?SmNFL2xUZXU4M2lLblFveE9vbkhlcHdsL2FhWkQrR1BONmhMb2lRY2tiZkhS?=
 =?utf-8?B?ZTl4b1YvV3I0S2VxZkJlaHRnR29LT1JVYmRyR01JN3pqMThvcjFvYlMvbnVr?=
 =?utf-8?B?WmkvS0ZZc3NIL1RiN1htMUZqVDZsQzM3dUJPWjJBTDd5S3dXbS83K0VOam91?=
 =?utf-8?B?K2xoZVorQ00zMVdieW1XY1ZEaERsQWF0U3VBYWRabitQS2hFVURXaUtuSUVL?=
 =?utf-8?B?aTdNR3V4L2hyUkg2SkhiM3Z6bktKOHN4YkIxcE9XanBxakg1UEpJUVg4VnZC?=
 =?utf-8?B?ckdGczd5TVlwWGRrUTYzQlNPYkoxbGYrZFE0Q2orYU1CbDJKN1FVWndidTZt?=
 =?utf-8?B?bTNhR0pheVZFelMvalhvUkJ2cHJIRjY0QWROZUFsVjJPTWhYTFh0VkJVaTN4?=
 =?utf-8?B?eGVZLzI1Wk1hd1dFM2trV1ErVXZNcmRDaEVYU2Rrcy9pekJ1a2o1UWdFWkVY?=
 =?utf-8?B?SThVdXk3NVN5djdkMW55K2RkQXk1OG5zMGlnRGNOOUZlbWU5OGhab3FXaFNl?=
 =?utf-8?B?WUZvRURDY1J2NnlsTHVyTnExZ0dHWUZFWWJMcDI3eE04bTdXRFhmVmZxMitC?=
 =?utf-8?B?OS9zcElFTWdlUy9PQWtmcDR5ZUFVdWtQWlhlUEZBVGFVb3JIMTdPQ0Qrc3cr?=
 =?utf-8?B?N3JOOHh2aWR6eEwzTUpsWmxBV1JMdFJlL3ZVaEFDQTJkR1U5TXd6ZkQ1M2hp?=
 =?utf-8?B?Q2grY0t6ZUcvanljZFNMZzM2Uk1kUnQ0UVBUTXcrYUV3ZFp0TU9yYnhkbkVW?=
 =?utf-8?B?RHo0NTgxcDlYYmNPUWg4L1hDTW84NkZ2NVZDZzMwQWRsN0VxZzhRVFArSUhG?=
 =?utf-8?B?anA5aFVncmdpbGFUTE9RTlNtM3V1bkl5RFQ3V1hqeDRJNnNuaGlnVW1rOHB2?=
 =?utf-8?B?MU9sMEtZUXkyQnpkWWg2UmFzUDhxNGR6UTJ4ZXZJTEpaeTRhRnpjdW1uK1Jv?=
 =?utf-8?B?TTNxY1l1WjlYMTFuaktoSXBUem8xWWc5Z2hTbHBOTU8rR3BrT01pMGhPQ3hL?=
 =?utf-8?B?cHdqNTJ1T0l2K25kaHpqTURnMk1yNXUyeSt3WmFFUWZGRDdwRWhTeHRieVZv?=
 =?utf-8?B?bWFGaG00d1dSM2NTRlJqVHFGVWRqb0JIcnhmRzd5SkJVaUVrejVVU2VScWxn?=
 =?utf-8?B?eTFIYWR2QTFBaWk5NWFxMVF1OG9vYVQ3TlV5SjhTODBUdjJud2dRc2VOci91?=
 =?utf-8?B?UUdrelYzRDBBRzJDRGh3RXl5dUVBRnVvc2JoWmMwWFR6SlhNdGtXRnR2UnJN?=
 =?utf-8?B?VUduMTh6UTczcG4yMThCTnlQakxqOUsvbWoxVkRaeGduN0o1Sk5jaERlSnJO?=
 =?utf-8?Q?mAEgX+hEIwPRl0IvFLjRT7TGS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cdfa55-9746-4133-6268-08dc168f16c0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 12:31:39.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y1TezYZ2rSee5Ffbt+yOeqXsGBaTW5ng+cB6WdAfoQzwMujC44tRIPriUjmccZy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_043148_373274_8B573713 
X-CRM114-Status: GOOD (  30.31  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgMDY6MzA6MzlBTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiAKPiBMZSAxNS8wMS8yMDI0IMOgIDE5OjM3LCBKYXNvbiBHdW50aG9ycGUg
YSDDqWNyaXTCoDoKPiA+IE9uIFdlZCwgSmFuIDAzLCAyMDI0IGF0IDA1OjE0OjE2UE0gKzA4MDAs
IHBldGVyeEByZWRoYXQuY29tIHdyb3RlOgo+ID4+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVk
aGF0LmNvbT4KPiA+Pgo+ID4+IEh1Z2VwZCBmb3JtYXQgZm9yIEdVUCBpcyBvbmx5IHVzZWQgaW4g
UG93ZXJQQyB3aXRoIGh1Z2V0bGJmcy4gIFRoZXJlIGFyZQo+ID4+IHNvbWUga2VybmVsIHVzYWdl
IG9mIGh1Z2VwZCAoY2FuIHJlZmVyIHRvIGh1Z2VwZF9wb3B1bGF0ZV9rZXJuZWwoKSBmb3IKPiA+
PiBQUENfOFhYKSwgaG93ZXZlciB0aG9zZSBwYWdlcyBhcmUgbm90IGNhbmRpZGF0ZXMgZm9yIEdV
UC4KPiA+Pgo+ID4+IENvbW1pdCBhNmU3OWRmOTJlNGEgKCJtbS9ndXA6IGRpc2FsbG93IEZPTExf
TE9OR1RFUk0gR1VQLWZhc3Qgd3JpdGluZyB0bwo+ID4+IGZpbGUtYmFja2VkIG1hcHBpbmdzIikg
YWRkZWQgYSBjaGVjayB0byBmYWlsIGd1cC1mYXN0IGlmIHRoZXJlJ3MgcG90ZW50aWFsCj4gPj4g
cmlzayBvZiB2aW9sYXRpbmcgR1VQIG92ZXIgd3JpdGViYWNrIGZpbGUgc3lzdGVtcy4gIFRoYXQg
c2hvdWxkIG5ldmVyIGFwcGx5Cj4gPj4gdG8gaHVnZXBkLiAgQ29uc2lkZXJpbmcgdGhhdCBodWdl
cGQgaXMgYW4gb2xkIGZvcm1hdCAoYW5kIGV2ZW4KPiA+PiBzb2Z0d2FyZS1vbmx5KSwgdGhlcmUn
cyBubyBwbGFuIHRvIGV4dGVuZCBodWdlcGQgaW50byBvdGhlciBmaWxlIHR5cGVkCj4gPj4gbWVt
b3JpZXMgdGhhdCBpcyBwcm9uZSB0byB0aGUgc2FtZSBpc3N1ZS4KPiA+IAo+ID4gSSBkaWRuJ3Qg
ZGlnIGludG8gdGhlIHBwYyBzdHVmZiB0b28gZGVlcGx5LCBidXQgdGhpcyBsb29rcyB0byBtZSBs
aWtlCj4gPiBpdCBpcyB0aGUgc2FtZSB0aGluZyBhcyBBUk0ncyBjb250aWcgYml0cz8KPiA+IAo+
ID4gaWUgYSBjaHVuayBvZiBQTUQvZXRjIGVudHJpZXMgYXJlIGFsbCBtYW5hZ2VkIHRvZ2V0aGVy
IGFzIHRob3VnaCB0aGV5Cj4gPiBhcmUgYSB2aXJ0dWFsIGxhcmdlciBlbnRyeSBhbmQgd2UgdXNl
IHRoZSBodWdlcHRlX2FkZHJfZW5kKCkgc3R1ZmYgdG8KPiA+IGl0ZXJhdGUgb3ZlciBlYWNoIHN1
YiBlbnRyeS4KPiAKPiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIEFSTSdzIGNvbnRpZyBzdHVmZiwg
aHVnZXBkIG9uIHBvd2VycGMgaXMgCj4gc29tZXRoaW5nIGRpZmZlcmVudC4KPiAKPiBodWdlcGQg
aXMgYSBwYWdlIGRpcmVjdG9yeSBkZWRpY2F0ZWQgdG8gaHVnZSBwYWdlcywgd2hlcmUgeW91IGhh
dmUgaHVnZSAKPiBwYWdlcyBsaXN0ZWQgaW5zdGVhZCBvZiByZWd1bGFyIHBhZ2VzLiBGb3IgaW5z
dGFuY2UsIG9uIHBvd2VycGMgMzIgd2l0aCAKPiBlYWNoIFBHRCBlbnRyaWVzIGNvdmVyaW5nIDRN
Ynl0ZXMsIGEgcmVndWxhciBwYWdlIHRhYmxlIGhhcyAxMDI0IFBURXMuIEEgCj4gaHVnZXBkIGZv
ciA1MTJrIGlzIGEgcGFnZSB0YWJsZSB3aXRoIDggZW50cmllcy4KPiAKPiBBbmQgZm9yIDhNYnl0
ZXMgZW50cmllcywgdGhlIGh1Z2VwZCBpcyBhIHBhZ2UgdGFibGUgd2l0aCBvbmx5IG9uZSBlbnRy
eS4gCj4gQW5kIDIgY29uc2VjdXRpdmUgUEdTIGVudHJpZXMgd2lsbCBwb2ludCB0byB0aGUgc2Ft
ZSBodWdlcGQgdG8gY292ZXIgdGhlIAo+IGVudGlyZSA4TWJ5dGVzLgoKVGhhdCBzdGlsbCBzb3Vu
ZHMgYWxvdCBsaWtlIHRoZSBBUk0gdGhpbmcgLSBleGNlcHQgQVJNIHJlcGxpY2F0ZXMgdGhlCmVu
dHJ5LCB5b3UgYWxzbyBzYWlkIFBQQyByZWxpY2F0ZXMgdGhlIGVudHJ5IGxpa2UgQVJNIHRvIGdl
dCB0byB0aGUKOE0/CgpJIGd1ZXNzIHRoZSBkaWZmZXJlbmNlIGlzIGluIGhvdyB0aGUgdGFibGUg
bWVtb3J5IGlzIGxheWVkIG91dD8gQVJNCm1hcmtzIHRoZSBzaXplIGluIHRoZSBzYW1lIGVudHJ5
IHRoYXQgaGFzIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHNvIHRoZQplbnRyaWVzIGFyZSBzZWxmIGRl
c2NyaWJpbmcgYW5kIHRoZW4gcmVwbGljYXRlZC4gSXQga2luZCBvZiBzb3VuZHMKbGlrZSBQUEMg
aXMgbWFya2luZyB0aGUgc2l6ZSBpbiBwcmlvciBsZXZlbCBhbmQgdGhlbiByZWNvbmZpZ3VyaW5n
IHRoZQpsYXlvdXQgb2YgdGhlIGxvd2VyIGxldmVsPyBPdGhlcndpc2UgaXQgc3VyZWx5IG11c3Qg
ZG8gdGhlIHNhbWUKcmVwbGljYXRpb24gdG8gbWFrZSBhIHJhZGl4IGluZGV4IHdvcmsuLgoKSWYg
eWVzLCBJIGd1ZXNzIHRoYXQgaXMgdGhlIG1haW4gcHJvYmxlbSwgdGhlIG1tIEFQSXMgZG9uJ3Qg
aGF2ZSB3YXkKdG9kYXkgdG8gY29udmV5IGRhdGEgZnJvbSB0aGUgcGdkIGxldmVsIHRvIHVuZGVy
c3RhbmQgaG93IHRvIHBhcnNlIHRoZQpwbWQgbGV2ZWw/Cgo+ID4gSXQgc2VlbXMgdG8gbWUgd2Ug
c2hvdWxkIHNlZSBBUk0gYW5kIFBQQyBhZ3JlZSBvbiB3aGF0IHRoZSBBUEkgaXMgZm9yCj4gPiB0
aGlzIGFuZCB0aGVuIGdldCByaWQgb2YgaHVnZXBkIGJ5IG1ha2luZyBib3RoIHVzZSB0aGUgc2Ft
ZSBwYWdlIHRhYmxlCj4gPiB3YWxrZXIgQVBJLiBJcyB0aGF0IHRvbyBob3BlZnVsPwo+IAo+IENh
bid0IHNlZSB0aGUgc2ltaWxhcml0eSBiZXR3ZWVuIEFSTSBjb250aWcgUFRFIGFuZCBQUEMgaHVn
ZSBwYWdlIAo+IGRpcmVjdG9yaWVzLgoKV2VsbCwgdGhleSBhcmUgYm90aCB2YXJpYWJsZSBzaXpl
ZCBlbnRyaWVzLgoKU28gaWYgeW91IGltYWdpbmUgYSBwbWRfbGVhZigpLCBwbWRfbGVhZl9zaXpl
KCkgYW5kIGEgcHRlX2xlYWZfc2l6ZSgpCnRoYXQgd291bGQgcmV0dXJuIGVub3VnaCBpbmZvcm1h
dGlvbiBmb3IgYm90aC4KCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
