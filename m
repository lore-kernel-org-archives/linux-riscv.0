Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E54BC5DF93
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhlgkzpJn+01Hl2mtX/eAt9MRGgE2tHb4nJij+yCODs=; b=x6Hfaps3kQDCs8
	Tx8N//DNx9jJL6CbwHpQiwy1+QurrZt0Z6s6i7tIvB/dvnvmmjC8Y9H0GaPUmzcB3yGcJ+aUqIjNl
	GWUruAyHV7VCz2nuAEwAq/xZ+OMIzzpTYOgotIG+8XvrrOVRWdOis7R/0xk1Mhyf3haFabAU0VbSz
	/ANwnyFD2tM2OTQgphL8xctP6E9YfuOLO0FL+ytSlUVaif2ayWtprDlzlTrZyr/ERudsHItMcJzL8
	S4oAplwPWSITO/1BE2ElAf+VldMNxcds9HEnMaMkKTLUrLeJsMsxViuSNILHtz8GnmlQkMqF4fBOs
	xmdh/+P3wTdLBoCJjDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPt0-0000000DUzb-00I1;
	Fri, 21 Aug 2026 14:06:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPsy-0000000DUzN-1iSy
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Aug 2026 14:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=9Ds7nLoZ7Wu9dbhxR+fAiPKP3lfAhk5bBHQVtDcx6Bs=; b=ifFZL98AkFZeKPQdmSbpxdWP6d
	xd4y/7UleywnmTBmcVbvAs67G5hdIwaV/PyHt2hPHD7g08gsVL47BQr6Q0yYXdOmFZ4ydi1dgkw7O
	SGLXnCYqZhhVHHMtvwzGcfrbObX9WVbH85D30rMtoRWptBOITBi9Xq4Zb5UwczQnRFbVGjoyzVg74
	5MIJEXrkWGigTfwcdE0jHuHwY5Z4QwDv8XozV7XDvvNrHd6R33kGyXzoTrKZUSa9FZl99gqvHSXgS
	LNQOOeJ1e9bIoRGiTSRviw+8oQM55ZBPBoUGhF25RHPx75ekqMbMo6M8y9RL3luxqs750ysiR0jqm
	FKugI+pg==;
Received: from mail-francecentralazon11023073.outbound.protection.outlook.com ([40.107.162.73] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxPsv-00000003osb-0Dsi
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 14:06:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baCBxQLtxCeQAn3aI8k/ff3hzk4Urv7rnMlsg1oaCmfW/3vz0GaLS6AIpFD5ADf7cFRlKlGjFxrrfn2mHTD7lBlHsHvi2mS6kaT5qf0W7HYc3MS1db84kI0dF+0q3GCsPMBjpeMl8CbkQlXlbSdip2do2sVMzzCEZXe/Wr/vQWZOIup5dz+RiVqiozIyVkZZPaa1OB/VRHshU62+SkBTtrCtxZ+Nmzjj/u2sidvZbIDPk0WUnW2EhkfRYDpdUIqJItMyBxr48WZvwpFQSvD2LGqCBisoWf+ySOX5CK3l0oOU2ZKM2a2QV38yd6GA21rIYmqSi9Sp4xQEUdYQyF4Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ds7nLoZ7Wu9dbhxR+fAiPKP3lfAhk5bBHQVtDcx6Bs=;
 b=xTpm8VLPXNfnDDO7WMf6T3Pv+5oNvpXR39GyLmNOveh1oseJzBQEY+4kW6fsRhs6JOC3jyFQLujdZq6cqVXf1mTwKqdXYM5mnsizU02NCqelHdrLRfhfz/5L8n/zi8uZ9cxECKwLH79ITHp6BZGHvODvWNL/qV3McAeLkFjny7cUZW+tQ9ZKWyLyNLsxjMHVNpPm5wgxsh5LXX2sjbhHua44O2fYbAHyXyHuLN4tpSiac+K8+AYjy/VnSBRZ11stTBRsHuSupmipXWYU2MCYPJJyQSAmIo6udO8MpYjvIAAll7mUpMtHaxNUxQmbJdPGrAW6TVcJjcwITblro6HGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ds7nLoZ7Wu9dbhxR+fAiPKP3lfAhk5bBHQVtDcx6Bs=;
 b=HZulvKxxaIp9qgKWFX8+dBwcNtiOYriBpPZtnX1EEddecuxNdn9jgOgRfX0S9mnv6NoNOxjLOd+5eeuPoq8nv5mGq29YBrz6zJUgvj1oGzL387jUDUlYPh6L+ox8y0qdKfijZom7fJUZBJk0PDtqtmy5Hvh2b+HiXGOR90Dk+kt9fMfV43Tbx/iaBuu7ER8bwwK2/Vwl6QFwUKteapf9ANHaVJUWnURDbdiMUjMB+zuaKHksci0F39eDmprevIiOVTuOURqghykvBNoWHsXa6dozJZtzmFwJxMGpBsj1Onild/Z8XkAJbc4xutyczg4yIjfiNh64rSrBE/f0KR9nkw==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by VI3PR09MB828996.eurprd09.prod.outlook.com (2603:10a6:800:382::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:06:10 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%4]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 14:06:09 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jesse Taube <jtaubepe@redhat.com>
Subject: Re: [PATCH] riscv: Add support for early boot errata application on
 MIPS chips
Thread-Topic: [PATCH] riscv: Add support for early boot errata application on
 MIPS chips
Thread-Index: AQHdKNpSnxccm2JY00K0tBZrZ88Ew7anzgSAgADMtYA=
Date: Fri, 21 Aug 2026 14:06:09 +0000
Message-ID: <85d9bba1-a44a-4634-b235-a1c2228a5474@htecgroup.com>
References: <20260810-p8700-early-boot-v1-1-5c4aa08d500f@htecgroup.com>
 <1bd31b3c-bdbe-37e1-0f0a-3cf152ff81d5@kernel.org>
In-Reply-To: <1bd31b3c-bdbe-37e1-0f0a-3cf152ff81d5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|VI3PR09MB828996:EE_
x-ms-office365-filtering-correlation-id: 7908b3be-9810-43fa-1842-08deff8d5a0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|56012099006|11063799006|10067099003|4133799003|18002099003|22082099003|38070700021|6133799003;
x-microsoft-antispam-message-info: HPi/P8tEX1AEwpTXyyBX7Nm9dtG52fjeTVTJtU3dPkqSzN8GfhLuo0vaNCy6AMyN9AZl7H+U3LM5HsMnvxdzunXGgNw02iXV0TrF2Uezt0aSr8s4pUTL6N7LH0Y9mq0TQzEyN5srqMAlEGAQLJIwQ/7hoxAmN2pRNda0LLfYaEFXaqntCEpnyZkgmyeyKqIDXTDo0Gvr8PJFBrjwAquZ+wQwj8yQCbmoZkQDgZRo/Nin/0+E5VLFOB+Zc/gYNYVP+b+HzRyjwur+MjzRrLkoo93fh54guh+1YQPbKttVzmqg8mHZqv6yYx2XTVseAx+4Yma3V9lSPZLbR9Qukx4edq28fm+DCbPC5+qSX0F0m8lQCXDA/GCqD0kmt+H+lsUQxucd41unrfFV/mvhfCiQ9ww7pfmTQL9pmBYRiEyYnrR5+kHGPn2pgeZiig2cDZ4HqKk9tTEDovcfjOmFHJQwYJSj5L12dllHT/55fDdvfAx0wNHxdF0Y94Ne6I4PewdWLQSVa2aBNyz4THKnJQAutD0AAP4ox62m0yGHgYCoONXKM9YNV1D8HmRsmYgYEYlOJsCqJDLrVAceekZeo3Og0EHYGgSfBJUb3/gYgyNuLKmB0aOvlFKG11Hl2ct2FpHH4BPn+F//EIGakgthk0yEyifbgSOt1hxP7VdGl/0u6jZ2tUyNV0hinpx9DIgZbasaRq1kBcz0y4xh8PybKIQNgoQOj9vMIrtkcwzu1l78k4U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(4133799003)(18002099003)(22082099003)(38070700021)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2FwaXEvek1TYjNYU29ldzF4ZTRGeHpCT2lhKzZLTlU4dXVGeUZVQTZIMHV5?=
 =?utf-8?B?OW5Ga0ppTzlSbmVEb3QzSXhMZ2o0SEJ1dkdKVXJMWmdSaW1VQWZnSSs3dzlZ?=
 =?utf-8?B?NGFaV3Z1dlRTU1VEaWlMcVUvcTcxaW1HOVF1Sm4vaUlVeWg2ZDRYYUtFVjNq?=
 =?utf-8?B?bFB2Vk5RcGNIMzhyK281bnpXUS9hdkxHWnk1ckF3YzlyYWVlSVUxMm9IMGh4?=
 =?utf-8?B?Y0JYYW03d3pGOGpIYUhpRmk2cjVhQW1jdkNiYnZNK2wyWVV4dlRLWUtaM1Ra?=
 =?utf-8?B?TFU5WlYyZFA4SSthbnVyLy9sbmdsWlRWeGorTjFNQmJnZXYxRkUwZlB2RWlQ?=
 =?utf-8?B?WVhBZ2VrRjcwMnYyOW1PYnREY0gxV2FCdHZTcmZYZC9yNkg1b09RdWlJV0Fi?=
 =?utf-8?B?MHVzTlMrNzRCK2MyOStWQmhFeXZTN1pIcjBjaW9tblpxMVgzSUpScVlSUGZ0?=
 =?utf-8?B?QnEwdEVIdG0xM2tpQ01oaHdtcEtqVVpmYXRsc3lQdGdyL3FEdTVRVE9sQ2lZ?=
 =?utf-8?B?STNZOU1FcnhLZDM1dnBvNWhNUytISU9xQ09uR2Z4Q0lhblVDazdTZHFYc1A4?=
 =?utf-8?B?UjlPYlFFWnZmUHNIdnNRTmN2WnU5OTlyOTFNKzdvWkkwemE3RTBSa1BZVWN3?=
 =?utf-8?B?dmNVTzBodEZVQkFqYWwzcmtSdEF1cDZ3cGMxV2Uwa1cxbVV0MG9IRGVHMTcv?=
 =?utf-8?B?RThRb3ZvMzRld2Fua1YyRlB0dlRPU3pqQmlOTy9TcjJCMDgrMnJDMGJuWUNI?=
 =?utf-8?B?b3R6cndxZkZ2MHpQSlpITGVuVXh2dHlGbVRjVjVWdEpPak5HVzd4ZzNOdjdC?=
 =?utf-8?B?OFdzV3ozV045V0VQSGJ2cEtZMEhUS21zV2JnUkNGa2toQitFNjVXREZydUk1?=
 =?utf-8?B?NFNUejU5M00vRDhVVWh6TmtPNHF3YU9LMGdVbnd5RllrRGNLMUxmdnRxa1lD?=
 =?utf-8?B?SGVDYldPQ0pRMnlpV2RKR29Wa2lDRlVJMHg3dDNva2RQbkRQeHNsaFlrakJk?=
 =?utf-8?B?enA5aEdqQXU3ay9lanpQU1E0VzBVcCtmWFdqTkwyalMyTFp1UFBCMlBXdER0?=
 =?utf-8?B?WXdnMjBNMndkZk9GamFtYVBBRnJ4UFZKQVVBU1RISERseEx4QzFDK2FBeFln?=
 =?utf-8?B?cnhxTTFLY0laMExqY1AxNnBwSGdDK3hEcnJ6UVc2NVc4VUt1Ti9VTVNMaW9r?=
 =?utf-8?B?ZUFrYWxOSmtDRWJMTTl6c0J1cXNlTkNpOWFjVFlDN01OcHh2SFlpR1hWOWo5?=
 =?utf-8?B?MlhzL1pJK2szWCtSZFJYSUJFS0NSS3RLd3d2WVp3OWtBZTJUd3hybllOTHE4?=
 =?utf-8?B?UmRNY2JnS1lwcDY3a0JpNVVaTHZSSjVQZ0l1c041aDg5amlGVjdPS1NpZ1R6?=
 =?utf-8?B?ZytIa3MzaktKMTNxc3RwSUw2QVZFcVIyZElIMnJiRmZmZzd0Rk1tVUdkMmJl?=
 =?utf-8?B?UU5sbFJCNzdVZ1d2WFBjL1QvK3Y3YTlPQ1pWUXJIS0RyMktzUSs3TS9kNDkz?=
 =?utf-8?B?czY5L1hkNlJYcEl2WUprM3AzMjBpYVA0VjBKL1VEM054NGhPYU03K0p5N3Yy?=
 =?utf-8?B?MWoySTVrRmVmc2RRRERlaEx4dGErMmdUa0ZtT01DRDFxZnJFQVU1SlcwYUdR?=
 =?utf-8?B?NmkzNnZaZlRtWk0zNXhHb1RvdG5HRGpEckNzenduMGpxNXBwd21OVTBaUDVh?=
 =?utf-8?B?TmtZZ3VxbTNVNnhweXdKT3lFU01xTFZDK0Rvcnd0UjQ5QyszbjdtTzUrZHhz?=
 =?utf-8?B?QTFvVUpnY1I2SXZST0oyZnRRVGhIQVRmblh2LzVScDZxV1IzVjcvRFRjTjA1?=
 =?utf-8?B?am5uMVVBdnh5VlVoMmhNY2V3VXlPd0NyRUVrVWZ0K3phRDZHYngwaGY4Si9n?=
 =?utf-8?B?T0s5T012Snp1Rld1QlExSERSSjZyYk5nWlBTNU1aUGRvSDdxd0ozeStOSFFX?=
 =?utf-8?B?Y1hMUVNybXlDK2o4QjBZek1wa3N4V2tXZUx3MzQra2JUczNrVWhOeFBxQWxT?=
 =?utf-8?B?Rnd1ZlFGZVVQMVhockdWVXVwMVVsS0VNaWYzSzVXWTlIcU0zN3NUWWFwcXFj?=
 =?utf-8?B?YVUwZi9UUERvQmw3aytTVFpJQk5jdkxPdmZ2THlmWGczTmg1czlMWkZZRHFH?=
 =?utf-8?B?NUxyWVkzak1OK09Yak51bE1yam5MTlBTMmpHeG5aTEhPbkNsZlR2WHByNFJV?=
 =?utf-8?B?TUxrNVJscG5iR1lad0VOSzUxeEx1OWl4RjIrQlBqWG5zQVBOMlozT21FQWZW?=
 =?utf-8?B?UWhNdFNHdHNoOVBjYzdpa3A4aTBiU0h1bzRWRnByUG11emVVa0RqNGJxWVZY?=
 =?utf-8?B?QW5yZENjVEdOdmJwSkJQdnpISHJlYzl0c3FBMzNmUk1DOHdBS1NrRzdhZWJm?=
 =?utf-8?Q?fiER+svPA/TMYBCA=3D?=
Content-ID: <950B04B02389B34EAC7079AA39D798D2@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7908b3be-9810-43fa-1842-08deff8d5a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 14:06:09.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nxU6Muh2USmLc1B8+K8bD9FoPRytBjAyLY5AoWWFWnG1qmQ1RsY14AJSy/mGJd5KA8r29iuUS1s81jUDkJQnCnHNuM15jUsIJs2PKyTsLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR09MB828996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_150617_323744_11348540 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Paul,

On 8/21/26 03:53, Paul Walmsley wrote:
> On Mon, 10 Aug 2026, Aleksa Paunovic via B4 Relay wrote:
>
>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>
>> MIPS errata implementation previously skipped early boot application
>> entirely. Although the only currently existing MIPS erratum does not
>> require this, amending this now should make any future addition easier to
>> implement.
>>
>> This commit was based on the existing T-Head implementation.
>>
>> Suggested-by: Jesse Taube <jtaubepe@redhat.com>
>> Link: https://lore.kernel.org/linux-riscv/CADRr4bcbD57hmR0XGgo8BjgNp4shEADOondZEtwscCJ9-nxXRQ@mail.gmail.com/
>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> ---
>> The patch was motivated by Jesse's suggestion to implement [2] as an early boot erratum.
>> However, since it's in conflict with [1] as well, I decided against sending this one and the ZALRSC patch as a series,
>> opting for rebasing [1] and [2] once it's clear we should move forward with this approach.
>>
>> I tested this on an eight-hart QEMU config. The testing was done by rebasing [1] and [2] onto the patch
>> and running most of the same tests used to verify those patches. This includes: coremark testing, futex kselftests
>> and GDB to check errata application. The same tests were run on the Boston board, configured with a single P8700 core.
>>
>> Links:
>> [1] https://lore.kernel.org/linux-riscv/20260608-p8700-wfi-v2-1-77efc7459f3d@htecgroup.com/
>> [2] https://lore.kernel.org/linux-riscv/20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com/
> Thanks, queued for v7.4.
Thanks a lot!

Best regards,
Aleksa
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
