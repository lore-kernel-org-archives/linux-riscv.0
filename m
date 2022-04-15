Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82592C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgJ3Ex+BGtMltcsZmjbA+P9frVE3MSiLHm1EOXH6/vw=; b=Z3gDTt+lqAxQUT
	aAyvr6Sv8PrYrzqW8EgjZ/4tUEUQtnr5NBr/bkA//+hLL0OamegLTiBzcPSvo3cApW4NxJaeGrW6m
	yJMcFzG9ku4QphJpD58iXi8qmakSTgzJaptqAn9Ccx5vxx60ufk5IAh94pddA0Cb8sljhGMGmmTiM
	CooT7I6maWmT3u2/858dNy6sr5EnUupCoiNItY0RI+KGNCyq31uR96NEviXJ7mHEcxakv9xrZ695m
	0luTN6n+A+fPTSTV80iqksysFMCE1DkfYXoDcVv73kSoUNs18c27/LqWcG4oiaGAu300UqWTkOxr0
	Q0TGbqSSn3rdByZ2a5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9rj-007t4P-VL; Fri, 15 Apr 2022 00:31:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9rg-007t2n-EV
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 00:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649982668; x=1681518668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=by8WYiAWff5iBTPTfUiihuv7rXF+Wmvm8gg3usNY3dE=;
 b=riaMjJqX+ig7i31eAZ+F/cEv8fCI4WTrAFdjUE66LWN9RgfufWFBWB9y
 Nkze/d80VaDs6xY83VEy+vfckxa1nBlx+KboHZtcym89sq55UYrkkNYeG
 FI+6L8P6Dh+6ZZKStQE+tp2vx8n7p+tJXNwZb6T6f4e+isPzo9w1SMadT
 BsmjihezZtVX4y16hczvF/w/vCkYwoSUKPQgbFOfOAWAJloxPB9HzZFl1
 nBcgJzKFEJSfoEJJcJjzx1+fvoLRcRnxamjZMX4vjB1tRtsr+YidtRBX8
 GEpIx123H2tWIDQX16tPJmqgGifXjqLSFvI6yZd4ZXmVtss+5zbwuMT32 w==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="198853407"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 08:31:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or1cGmEHIcevWHY2kabkU9vA6zajj5IToQIngwvcig4WqsaMNQcLk5oflJtuqHpaifaKzVuo5GMvQUDWHSr2JMZnfHqropUiigRgrSgupCebEezSFW9xGigeiVokjyVf474n62mIuuSbGZ/Z6HaVUvn4s8MBpbiEWHslUJL39JuK1h5YBOWPyYbBZeUbFQlkT9nYvzvURH+l55oRx8NKhN9rgzmWGNeYO8eawsXppZ2iq4JKZsC0kxNM6bazFeR6yczBDs0XhoBDQDrVEe4oolF0AKTpLwFrmUviKbJZ6SJRVnUCD6U6JRttihNahiKhuihCDsuIF4MKbllisVOI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ffxEew5BtRanyTKghZXcdurZvjNYuBiDlsgLIJjxR0=;
 b=eGCvvC+NBSRb748bDj2ba04CHGSbrW/m82ZnTSC/YQRuekuBsEFgnvUbzXb2iReEsfLcyfTlsY/GT4jh6tDu8WxSGwaNgVIjm3LIQQIL3O2Kf9lEpGRmfcrKmVbzcvJ9gdWNLsVNtdkOfOCqSw9BGLrVZyip2LOn5Tn8gcLq/WzDemfd7XODHIdZNMpNqQsq7kdrvV8Owya7PkZlcmpxoRyckHNehSxGKYevB7XvNaHA6qbDrOg9IpUDxS7CVA/Xtmpi4KWbeDQRmELSccQ8JPdurjPDiWWsLsn2Vv+bv+DseWZRHNLKnpDPRLeDFwaaH+I6x02fP6EHPo9ugc5PgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ffxEew5BtRanyTKghZXcdurZvjNYuBiDlsgLIJjxR0=;
 b=ovStQ0mdIhvI8O+o90i8E2oaZ9g205lVi8Ygl4d8lzV8EzWQF+vRo1huEk4QtalfDFCbvRptc47EJwEANSk/EhWHKcw2lMVq4H20rq9JGQ37rP7FHUPQeQPlClj6Vma1tYXUXQxtq6LychU2O3e6/2p1RHCkIm3D3p8mp2/6XA0=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BN0PR04MB7920.namprd04.prod.outlook.com (2603:10b6:408:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 00:30:56 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af%8]) with mapi id 15.20.5164.021; Fri, 15 Apr 2022
 00:30:56 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger
 <vapier@gentoo.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Thread-Topic: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Thread-Index: AQHYT9+B/BNFs63JH02JGuF3zm1OJqzwFV2AgAALBgA=
Date: Fri, 15 Apr 2022 00:30:56 +0000
Message-ID: <Yli8voX7hw3EZ7E/@x1-carbon>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
In-Reply-To: <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbbfca7a-f80d-4d60-9142-08da1e773503
x-ms-traffictypediagnostic: BN0PR04MB7920:EE_
x-microsoft-antispam-prvs: <BN0PR04MB7920704355B4D7D9EB595865F2EE9@BN0PR04MB7920.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M2kDI9rZBhYUN202ALZJEq6xED9s7rvyG5gE4pJXC8Tccok1W7TDpF2aleZwR5I9uTgbv0nX6adN07XYq5NX0UXwSx9N7N3LfpdVOg8157pbRgaQkMahsLi9n0ONex/dHPV4QULld6rhmHvsgEYOjZmQCAZ9CEVbVECkn9w6ZY/DY8ARkVH4eJ97/NMLubeAtxnd11qz2tm/sZ+/vtEhqGGYPuxEVBLPxaPV2PxBxNbZlUKUNz/sA8WYV8hDejKrXP740NQwqCruaLvc1wYjV3nMYlsdTWSvhgTyrByG7nkaVmGXoAhTjqsZGfSCX7ieETGtgVf0ZMvbTUhXd6dnAKAzJFIxpccj+CO3GCNbh8CqUQZIQMzKQJFrVY1O5FFiihOLx+fggbvTgU8f+hCjS5D1SfPJQpiYObVxfx8DohLTJ0tURdrzY395I12FeFXdVaZ+DfYfUCu3TaPkHjnDuVKopT3temQQH4nRSOJnmTOkMf+ULXEufS9xg+qmi2/2zEPmZrC3scJaB/HkcAXpecTI35jHxmvdVMfIIMBto+JUL+nQF2tSEtNkIREcjJdh6hOpuNszMN1dp0TsTvoowp1W36EIADiTBkA+GIstiv3N+2PIb0ULLExtl5l2c/5JwmqCj/3UXys5/fkINfWCUAgDaXcCWn6f7u09I9d9Yf+fuS0/ThigD54MLWo3I91GIKV+HY2tmxA40PEhMNSYZBeCawlA3feJfdZXRH/JMOagvkT6LCcVWNOlGiz/X3+w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(6862004)(316002)(66946007)(76116006)(54906003)(66446008)(66476007)(64756008)(122000001)(5660300002)(8676002)(26005)(6512007)(186003)(86362001)(4326008)(6506007)(82960400001)(9686003)(53546011)(508600001)(33716001)(71200400001)(91956017)(66556008)(6486002)(2906002)(7416002)(8936002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EUTnFc20viBzgFR1USEtPyQBRjdS6Jw4xJzOjZccbH+g4dAF0xBpOoMKlF7s?=
 =?us-ascii?Q?jaN7e1aYNd8mhH/6B+NuIuRFDghiT0W4lSdocT2mr3ir1xNbCKVQA6qI/Rlj?=
 =?us-ascii?Q?kHUH9XXPBuq4TPeqWHOmzKDY2HrtDXJYyznza+LXwHDZ45s0EptuzDIMy0nV?=
 =?us-ascii?Q?QZOpzFlELz7/yfivORM9xUpocdI0EppUAnbTNgsMXPY3KowDPqyirS6bv7Ql?=
 =?us-ascii?Q?ZLthTvQc2Co7r0G8ls3iTE+ByviKNNs2Ow/Z+2H5nPIxwdtQMTmInraCM8ah?=
 =?us-ascii?Q?o5tZf2aKpKA97L9RQKyihJ1TfXl91pmNLYFDpOR+Y8dRj2lsdUEZS2ngcB+t?=
 =?us-ascii?Q?IKaEfCOQfQpI5NqerqAAcJUI/auJEYk2h2MYSJv6cCoIzsJuEbnprJeU1jAq?=
 =?us-ascii?Q?oq9AA3pvWCT/zAff9zgBZdBYzAGwDXzCtTyr1/WFSlgqH9DfRWk/F3iYuOuR?=
 =?us-ascii?Q?gEl9bEfjeQi5QhoqpPapa5QT8G4a5bgK5O/eMNfas0rJTFunQAs+4+pVO8oz?=
 =?us-ascii?Q?lgYOI/hy5hsBnDtmD06giWoinKDSLTjXvV6koPH4M7IPYyo1IQ/W93nb7EuY?=
 =?us-ascii?Q?mR1Sw0knCDn0C7rTABLYVUYHioWZUaAyJFet2/iw7Hpn6byM8jJScJ+rsHB6?=
 =?us-ascii?Q?jtCVo+Oi4wDNRSFBrqwe17b96zoR+9dQDmChuBwAp+1vyxvcBtv8gmpXFqRZ?=
 =?us-ascii?Q?eSylaVTzdsefaaaHpvWPdaai2/h8sTb0kTHPPf7E5Eu11OOWTX2M0CM58pQA?=
 =?us-ascii?Q?hMhIWcIyKhpbQnRdyW1KA6vV3co1LBM6HEK0RnVziXBiaMAg5Bmara/5Wk6A?=
 =?us-ascii?Q?lICReGc0CnFbWNcCy6HDyiMRTEvNJ/dyg8RhbbQCGqL0xtkyLNQ35hfKRVib?=
 =?us-ascii?Q?lSmIC84S+rjFnZPJKdLHHS35orpGxlLGkuZJAo6PgDaYijNv5gEx222L4N95?=
 =?us-ascii?Q?1vfIKik2f+kH5qARhpTF0EJCYyW4TLOSOcmCcxd1ymkmw83FLy/LBB1Gqwhs?=
 =?us-ascii?Q?plfnSxcZFZU0sxu1QYmqGrMZxr0K8W6SQlBaqrUnC5wwsun6/9hyIHamd0hS?=
 =?us-ascii?Q?bpaEZ7TuqwOmAT5+6AiexSX/hQZQ7e1PxaJYw+p9C4p3yO/6RsNLnt5S5kVa?=
 =?us-ascii?Q?4QUuPqqF/AwoFoAkvPJHIlLwQu7nKZ+gJfBPv94X2Fe+kDZw01U5eQwYmN78?=
 =?us-ascii?Q?eqTc9ubKiMfRg73faCrMpfqtwIjgl5CzZTns04tdr2z6Kyy4y05t64q8FD5q?=
 =?us-ascii?Q?HnUQ5JTaXlBvxY0in+UzXlUxVJ3OF91vQpaHnIDJlMbtwr26ub+zk/Gh1+2u?=
 =?us-ascii?Q?IWJK83NZczdDb9vgd94RYZaVXYZiAaYzei70o+QTdDFpM5dD5nrIe9Zs12Ax?=
 =?us-ascii?Q?uiyR2XomyPdYxARe5PkA/T0wGZwtrpvbyqLc9WpiktduLm0pJ/eRiyRsspmf?=
 =?us-ascii?Q?ddaA6wIqv6i3tdnRyYZ88DCUUmib4+xFF5jUis4nKy20BuKmwn9O5KoiSU2w?=
 =?us-ascii?Q?JFsr+mbjyhBcOqxMA9VEvmO9a6wGjdgJQP4rombJhj3cXZeCaQ4MIRANiyme?=
 =?us-ascii?Q?Y4BUWJy4OtZ0kiCZ1j3aTBiQTHlO4xX3XrYDUk2X3A+1rvoKA/jL2dcBvsEL?=
 =?us-ascii?Q?Tph/dSjzPY2Qs1ySJh5KuSIzGRxoiJQwyImMWFOnt9WllY5WwDEq0bw7biei?=
 =?us-ascii?Q?aaRwqmWMIeRnCMPCxHNytGNNFX3ThxBzTJR8qAzEFdeG46+1/Q5uSq+FopvN?=
 =?us-ascii?Q?hY265Jwri15+KLwUeNHyOPZimC1Gxj4=3D?=
Content-ID: <FABFDA205275DB45B36EEBD1FEB6A860@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbfca7a-f80d-4d60-9142-08da1e773503
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 00:30:56.4308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qZ0ko+BTEbSWgAVMLs4I72aSoUwHkoysjNpm59YaOW+m5clR6HU0YXX7/6jFMcXLKQHnwB8YHoF0JMLdSm5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_173108_851317_E0FC8B73 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Apr 15, 2022 at 08:51:27AM +0900, Damien Le Moal wrote:
> On 4/14/22 18:10, Niklas Cassel wrote:

(snip)

> This looks good to me. But thinking more about it, do we really need to
> check what the content of the header is ? Why not simply replace this
> entire hunk with:
> 
> 		return rp + sizeof(unsigned long) * 2;
> 
> to ignore the 16B (or 8B for 32-bits arch) header regardless of what the
> header word values are ? Are there any case where the header is *not*
> present ?

Considering that I haven't been able to find any real specification that
describes the bFLT format. (No, the elf2flt source is no specification.)
This whole format seems kind of fragile.

I realize that checking the first one or two entries after data start is
not the most robust thing, but I still prefer it over skipping blindly.

Especially considering that only m68k seems to support shared libraries
with bFLT. So even while this header is reserved for ld.so, it will most
likely only be used on m68k bFLT binaries.. so perhaps elf2flt some day
decides to strip away this header on all bFLT binaries except for m68k?

bFLT seems to currently be at version 4, perhaps such a change would
require a version bump.. Or not? (Now, if there only was a spec.. :P)


Kind regards,
Niklas

> 
> > +	}
> > +	return rp;
> > +}
> > +
> >  static int load_flat_file(struct linux_binprm *bprm,
> >  		struct lib_info *libinfo, int id, unsigned long *extra_stack)
> >  {
> > @@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
> >  	 * image.
> >  	 */
> >  	if (flags & FLAT_FLAG_GOTPIC) {
> > -		for (rp = (u32 __user *)datapos; ; rp++) {
> > +		rp = skip_got_header((u32 * __user) datapos);
> > +		for (; ; rp++) {
> >  			u32 addr, rp_val;
> >  			if (get_user(rp_val, rp))
> >  				return -EFAULT;
> 
> Regardless of the above nit, feel free to add:
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
