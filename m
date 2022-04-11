Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E64C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 05:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWaaGghlmxOjAPoxONPL6iZybbpNotG88SflQClfo4Y=; b=cHwToQINomf2VP
	eCRMk6M+d909wF/KMgY0187V0zLTC/kVs4wDlJAaf3jBf3rGXke16av3T4d1yQsn+2AFt93vFLFEM
	z1Fg0ern5VdYOFP7zG6ED49WIjchwPMfiaTYXqyQBQ5fKeOAg3PnLlTKM/5EHYj0O+mwDnPWIGlYK
	8s06WLshVa09St7JDXLvIHpwhTDuL8uYB/tat5CFm7KSR4CH27SPhC0a4BGSbFyBGdGpYrqWhaQDI
	VNlcmNLyXrvzPBg6N2OePrelkiX2DBG/dsqxomKHmcT2tAVChj7zCAG/Lv1N1h0SAsSHZgh7DYK/T
	HiR8g8moWeLZFRqUX44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndms0-006pAX-IN; Mon, 11 Apr 2022 05:45:48 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndmrx-006p8t-2T
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 05:45:46 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23B3KCt9026870;
 Sun, 10 Apr 2022 22:44:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=w4XdvatXxWLIrI+dvoFp68fDZ3h+7vaMsogYPl+HH/g=;
 b=BzvGgsu+Bs+XjsLK52ftGRqCeWZDvqiNyBGoXbOoOUvLhFVQfc30MC5go4w4cEDOu2hW
 QhDtzjc/xJ8WeJJe4JzFQqea76YNWXcfUy0Qjhh93wMCTC+kYLsjiw5BZfrMLeodLCi4
 bSq5pyC2wrGfVPFMpzSwsQQuI1XR428MjRQ= 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fb5fqyfje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Apr 2022 22:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3kSBIYd3h3tDoJqtKz6+VzALCpNsunu/icGs/TAItIZ9oU0xlJDkzGtP7MK0kDcSrTWAPm/Tk/p6t7jow2cEr/aWBf13D2QYT5NfSNNdRnqTW6sJ6zEZrBoTl9J2hQUS3Sd+WWY/CtnidldnvRzICJpxxVF0SX7iSlQUyb+BQ9LGaWIYXwyuDTYlB0sKtj/zfyWKIQGQquXmPJ6R/PixHhKcxP6guhE3mEoJkj6GG7+4u0dKfpn/q7HpLVtweKyOdH6PrZi/UVhb80gSeUTb4+Lp60oHeu2Svfoor1cFsVvORTzhTg7B1f/sdwyYZlnANGmppN3telBE0xz/VTAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4XdvatXxWLIrI+dvoFp68fDZ3h+7vaMsogYPl+HH/g=;
 b=fR4uqoZZazqxNDQZrBg1qOCLaBYuE28TDIx6PCtSrq0rJ/Hx5MI865m+/SDX+6YEFCZp8xoGZIcEubw4YKa2/W/mPSGcYjtZbv9IYyXwU6e9mkMj2udQ3XRjh+W2ikGAJBZUX0A3/ATf2MLc5BUaW7VQRj55ZBrJqsb0EDa0yQa6TZkl6F+EIFGjrPtfuIMaUAivhYk3d06NBEKqtCIF8rUvzHYHCDsbi9h71l9s1Z3QYkPiErQVlAFgU9hCHDPYAb7LqdNe59g9Aqpkobx3NF3PmqVPFtktgnuTg+HD5EDM7XuISeyMQ5dKTgfX5924VImW9L0KXMCjbiuWFeKGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by MW3PR15MB3867.namprd15.prod.outlook.com (2603:10b6:303:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 05:44:57 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::20d2:26a2:6cb1:3c4b]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::20d2:26a2:6cb1:3c4b%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 05:44:57 +0000
From: Song Liu <songliubraving@fb.com>
To: Pu Lehui <pulehui@huawei.com>
CC: bpf <bpf@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "bjorn@kernel.org" <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "andrii@kernel.org" <andrii@kernel.org>, "luke.r.nels@gmail.com"
 <luke.r.nels@gmail.com>,
 "xi.wang@gmail.com" <xi.wang@gmail.com>, Martin Lau <kafai@fb.com>,
 Yonghong Song <yhs@fb.com>, "john.fastabend@gmail.com"
 <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>
Subject: Re: [PATCH bpf-next] riscv, bpf: Implement more atomic operations for
 RV64
Thread-Topic: [PATCH bpf-next] riscv, bpf: Implement more atomic operations
 for RV64
Thread-Index: AQHYTL920S3ce5vu6U2zipBzF4EQ7KzqNQoA
Date: Mon, 11 Apr 2022 05:44:57 +0000
Message-ID: <1ACA6849-7960-4BA7-9F85-449E9EDD0C74@fb.com>
References: <20220410101246.232875-1-pulehui@huawei.com>
In-Reply-To: <20220410101246.232875-1-pulehui@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e220ca15-ddd0-4d18-6b65-08da1b7e6932
x-ms-traffictypediagnostic: MW3PR15MB3867:EE_
x-microsoft-antispam-prvs: <MW3PR15MB3867C0933500D96AD50D5E1CB3EA9@MW3PR15MB3867.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H6YU0VTHUmn79PRk4TgqmVfMLlN3a8NGwVuBhLNP+UlmDM7RZOwx8V15eLtJrDDZt6XIsztKiP8s2DiIviQAUvAeFz75AQcQHyc1b0tnp8peqp9R72JLpK6EIXy7hapmYXpriKn8qRaq3Z2RH9hs5MWfGOBd5A6UpAD+uzvEkbwBsHsT43Qy9/vS7y4ZgetDyDsZ9m16/i1WyN/rblaR/ly/+0iBkqLo+74oZtmTWy2NVem0jK4bp7XyZspbOKrro6R6HFVvKLzPKbP58xf8EJhL+KBi6DvWEBETQg2MM3Ix+ly0nad8J63vFNKzCk+h5TQmhDBoMpnXb8IAvahN45k5+Kd0t1BwxP7qBGNcbV9QznxOPCKjSVOmlT7GuUTGQrNUFPFWNtr8B3q9ipV3eVsRi2Il3ABdCiUcPOnjXcAdqtdNzOR0TuLZRMPQIzhe6NP0fI4ZROibDJCd0su1Xdl867tg5QFLngJLc80QtnXWYoTQSl1bKYOjbWBNiwhzHK41h3kbrNyuVIhEmmiHB5r7QRFRSibNCjK+C58/c9ebJ096s8ENlHfeFHykYpu0cjRU1Xdfia+APLr9pZvLtL8HZeGdlI5klwBgxkEz9C7eSUODjVYl150hk6WcLWLsfAfkDrc+io1/MgMzzh/qK5GuoOzIvwgf+iKvosxXjACPIvVnP5LommiLrpkE3msXHfkrqmTyBydLSqG2IkmBCQCxFqZXStuiyHrJsHAhX8sp4MHNZoYRF7d6RM8lPxqc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5109.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(36756003)(4744005)(5660300002)(38100700002)(122000001)(7416002)(38070700005)(2616005)(508600001)(71200400001)(66946007)(8936002)(6486002)(8676002)(64756008)(66446008)(4326008)(66556008)(91956017)(66476007)(76116006)(33656002)(83380400001)(186003)(6506007)(86362001)(53546011)(6512007)(316002)(6916009)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hdv2oJ1V3+GzrSaNP+goUpgC3dqNl1UNTanOuTDX+4MoXaib6/6xmoiT+U26?=
 =?us-ascii?Q?jxT542WqdIsk84px5Rxeh4/cP+q2DotrCRNenNlMFzKOlPSGQE6n369gKy53?=
 =?us-ascii?Q?8FM9EWaxaGKT5Krpvl6mz70cZwrrbTUvmNMKmREy/PPY38aD0NFjGnAFklNw?=
 =?us-ascii?Q?6TVxFfiyYKbwp05gFL9/JO423u9izt3+ktdXbRxinJkmHUfVMIlXM4h6mES2?=
 =?us-ascii?Q?x9n04DNg7dTImCaRzqqSt9y1xQRrXtTRLlQ/5kv52rBgstd/9kGqUOAQZakK?=
 =?us-ascii?Q?HAvgxTPl/9akGwBLXIuHBVbHbZj08k6nIIIlb3aoCdrCoBA6lKhBl6xyo2FR?=
 =?us-ascii?Q?KPHLZkHMwwRxqXkdsQWtctqaw8qr4obhv3C6mf1ePhRtIIf5Q+K2ABC6LnW+?=
 =?us-ascii?Q?6RwllppapdduV0gwfUiqFcKI0eibSwguq1p1bLh7c6IdL8HJH9xaierkiA40?=
 =?us-ascii?Q?p7RXT0ID9Ug/UjbvrX22VUValFQRfw4IRgf3dvWNfbALX7LkOlo28JnUJB2h?=
 =?us-ascii?Q?Lxk6pv8pb+l6syMH2NO7L0Dvz4L7zLHbhKdjD70pR8TPpS9cicoiKEMPtFTa?=
 =?us-ascii?Q?k7NJ3L+JngjTM8yORiI8pa53QNzemnYMOC3+/l2cgVQdywVvhax/t7rKQcjw?=
 =?us-ascii?Q?4Oz6m1UWUE+huWyjxl2JGyGjHo+WwT5LAGwMBkKZkPEESM8uXRBxkat6wmP6?=
 =?us-ascii?Q?JrVUlEYX5YdnXLNMjpEwWF94O41mfW9rmKLhzT9zQI6NKciieqHe7GxJSCzJ?=
 =?us-ascii?Q?E6the1yRcgLQ164tw6+/zrAwHi67cEwm/eD+44VZKAArsL/q09nA9G9M/FFN?=
 =?us-ascii?Q?KFppCHMfzGxs4TDfYrXjtPrH2ZiGKcBLIOkLxekN58EuJ0ik4Keu9hz3VYMm?=
 =?us-ascii?Q?g2D0h7h76oLzj73VByGrBR//MSfYdmaDmmpM9aNAl10uqVAoMHv3ICfh5X0a?=
 =?us-ascii?Q?27kjuAZTxN8OTuBs1FqACN05mgvPLblkgvmOCt1+QvC0B8GoohW4bJBPp3pm?=
 =?us-ascii?Q?zoXHpsUbk+KgyGeOZDWrwONQmgUy69rFv71edRi15W+EtL5zwsnYBFAUWjXr?=
 =?us-ascii?Q?3wXGV5lc1ExILjSkq+GeyPsY6ijnfu/J3s+xlzEgP400y0ylzPCr0YuHT7Rv?=
 =?us-ascii?Q?pULYjISW2QG26Ngx4crkaT3mNlfHurXOMTydCfFpVgfx7RgIYbhaRvHY+ou6?=
 =?us-ascii?Q?E8+/AzMYd1b6hfsDxQAWkyE+rIbdhlP8yfuJsfThQvboNAoVweokYv+tF5OT?=
 =?us-ascii?Q?A+zvpM/C6rqZMcv9S4qsiImkOwfF3JZPoshidp+iD02LPnkRWhIBH8jkWunZ?=
 =?us-ascii?Q?WVyoMRCU8KAhwIhFSxbrTPzjPpYIKLJWclX+KUkG51XQMyJigtBr8Y1kNvQw?=
 =?us-ascii?Q?KA3XqYfG2dqKbucQJeBhKOP68Azt0xfZki+Eiiazjra4Qckp/aoE5zEM/OLX?=
 =?us-ascii?Q?g74ayvjNT9QI7HYNyNUiXZ3s7ckaM7l2w+I12KYnzx77qZxw9TBMl1U7jQxf?=
 =?us-ascii?Q?c1D7zPStKHmkkpDFxnWsJFrIN97/IixQH0dl1z8souAjijyympnkkItoXzRW?=
 =?us-ascii?Q?FLseElyjrM/b+LAFPD7mPDcW6lDsrFSv6Xu4EqhZ9UM8eQisnEa/plxBMmu3?=
 =?us-ascii?Q?1WOakB5KxqyNFDErkFkOD+EKQhIwyKhUHqUhRMtMXa6ccLuJ+znKKN+7KV5g?=
 =?us-ascii?Q?DqVfHwX9tCzRIRAlayrakpEbj0/W+Uq0o9WydT28LHhOdrBpynlhnuQXjGrJ?=
 =?us-ascii?Q?XOorY7objRIa5lGZdcsmk6Yv+5gk/mWvsw60Cjg4RPOZ9kKzZWbL?=
Content-ID: <F24C82D1EC506D4C9FE636CD2A764889@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e220ca15-ddd0-4d18-6b65-08da1b7e6932
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 05:44:57.0775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dbxazs86ZiZYvzOzNkdCxlOdt3ud1X1UWY4AjMhgWwsy0M75TfcODgPqLWJM1T4NwPyfRnkM19XjbCLI/CQ7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3867
X-Proofpoint-GUID: HBPi1pPzhKp6ekLrfzSiwm5kIIaJaywL
X-Proofpoint-ORIG-GUID: HBPi1pPzhKp6ekLrfzSiwm5kIIaJaywL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_01,2022-04-08_01,2022-02-23_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_224545_191372_31BBC9B6 
X-CRM114-Status: GOOD (  13.10  )
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



> On Apr 10, 2022, at 3:12 AM, Pu Lehui <pulehui@huawei.com> wrote:
> 
> This patch implement more bpf atomic operations for RV64.
> The added operations are shown below:
> 
> atomic[64]_[fetch_]add
> atomic[64]_[fetch_]and
> atomic[64]_[fetch_]or
> atomic[64]_xchg
> atomic[64]_cmpxchg
> 
> Since riscv specification does not provide AMO instruction for
> CAS operation, we use lr/sc instruction for cmpxchg operation,
> and AMO instructions for the rest ops. Tests "test_bpf.ko" and
> "test_progs -t atomic" have passed, as well as "test_verifier"
> with no new failure ceses.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

LGTM. 

Acked-by: Song Liu <songliubraving@fb.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
