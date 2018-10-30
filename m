Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F9BC2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A0120657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U85UFB2S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="IXwxfZLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A0120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb5/zgNDVghwBEYEIfz7ufFp5nwSGkdQhLMSfXp8Yu0=; b=U85UFB2S9EWS6G
	vA0VsE6860shiELOL6PkMx5JxqCRMqByDEXinuLusf5wLg2uVChP/UZl/bt0QfmcfvbTM+YBGLExp
	e0TMKq9u26hMHENVHPTNaIGL+g4SYy7f74H93avTBnhq0EaPrnJJnXHu5D9v4LmhQ0szgdsn8NS+W
	BQWOEwEfUKztkLrumVKsz7kgVbOZe8N7GR8AStuYtlTWtgKnrSPymgcCQeCL1ixCAEA7PupIhe3IF
	z+6RjZCN44aHw6ZHPCWG6afJufq+TQ+huH1u2QIeTtBsRfxIWVJzHPSp6rRPqVsWxGVpX2p6pJGNF
	Eeoe/63Nuh25x8+8b6uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWjj-0005lU-Gn; Tue, 30 Oct 2018 16:19:23 +0000
Received: from mail-eopbgr720068.outbound.protection.outlook.com
 ([40.107.72.68] helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHWTt-0007sk-CH
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 16:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWlirXWb/vzEFOm/LcFm16wXJ0YJMe8vBBFxMlSHVM=;
 b=IXwxfZLiyd5z9vpyL9/CT1ff3ZuJQDIcGrkf3EdfSXeHyvBPOBEAWCz7QuCgH+9V0uCrMLPXfkXSX86+lSL6NH+mzNBGcPLpmeKRCA39t9EUFnPi+P3gYzh3AYG7bCrax945vZ6gTwlsD1PdoY2MfWrKxQZhSndsddUXGo4tha4=
Received: from BN6PR12MB1714.namprd12.prod.outlook.com (10.175.101.11) by
 BN6PR12MB1219.namprd12.prod.outlook.com (10.168.227.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.19; Tue, 30 Oct 2018 09:27:46 +0000
Received: from BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::5472:26e2:affa:2b41]) by BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::5472:26e2:affa:2b41%7]) with mapi id 15.20.1273.027; Tue, 30 Oct 2018
 09:27:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Michael Forney <mforney@mforney.org>
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
Thread-Topic: virtio-gpu without ARCH_HAS_SG_CHAIN
Thread-Index: AQHUcCGA6A/4JoUQ0EyPhXq/yTMyeqU3hVaA
Date: Tue, 30 Oct 2018 09:27:46 +0000
Message-ID: <751487d7-6cfc-17dc-b53e-08d72d4b88aa@amd.com>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
 <20181030072344.sstmq6jxcmyzbqmr@sirius.home.kraxel.org>
In-Reply-To: <20181030072344.sstmq6jxcmyzbqmr@sirius.home.kraxel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-originating-ip: [2a02:908:1257:4460:1ab8:55c1:a639:6740]
x-clientproxiedby: AM6P193CA0099.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::40) To BN6PR12MB1714.namprd12.prod.outlook.com
 (2603:10b6:404:106::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR12MB1219;
 20:AqKOvieZBM9orZ4PIw2YOfHpsgh2AOZ+Av3unUyu33RXeF208+UMgxuEHLmJ74x4YqB7fsTahrgLgDFYNjDJTV7n6h2UqD6/c+6leiTMoaK3of285zeDnpX5hKuCocAX79J0lRrAoVR6deOUN0bivfre35dGzypiwBrxkPJTokn2DHtZQoqB0vs7zEdWv1vPG9PRz8HiGNxMEiInURMj1mwU4fT9ZLvZmHLXk2eXgqgCtttdzrEng/y/foKUARr8
x-ms-office365-filtering-correlation-id: 9a269371-4a6b-4609-74e6-08d63e49f374
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR12MB1219; 
x-ms-traffictypediagnostic: BN6PR12MB1219:
x-microsoft-antispam-prvs: <BN6PR12MB1219F1286FF2C05424A2D91083CC0@BN6PR12MB1219.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(84791874153150);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:BN6PR12MB1219; BCL:0; PCL:0; RULEID:; SRVR:BN6PR12MB1219; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(366004)(376002)(39860400002)(199004)(189003)(105586002)(64126003)(6116002)(97736004)(6306002)(316002)(68736007)(6246003)(6512007)(106356001)(7736002)(4326008)(53936002)(54906003)(6486002)(6436002)(256004)(305945005)(486006)(65826007)(476003)(5660300001)(31686004)(446003)(25786009)(46003)(2616005)(11346002)(8936002)(99286004)(81166006)(86362001)(6506007)(65806001)(386003)(5250100002)(81156014)(65956001)(36756003)(72206003)(575784001)(229853002)(966005)(2900100001)(76176011)(186003)(14454004)(110136005)(58126008)(31696002)(52116002)(102836004)(478600001)(8676002)(71190400001)(2906002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1219;
 H:BN6PR12MB1714.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: hK8ucd6IMx0Pd9dyxTPDlz4hAMUNme0aM39yhtDZz+TcdUWG/wRa0MeUgosvIPf2rFJ/dO3PiIASlEz1i5wdV/qwtHCKuw/IJZa/At89UYrccI97C9kHoDLvPbmBepbj+JuBAmANmsYJVOnKWhSUN6DVYV2HkdncFUgwUCRi9gHEALeyrnl6bWpakbaMCqscZtm0B+O9tX2vZHa/bDNaTrrfB84gAPCecd7kDICAPmUt7z5rwPnqHV2G3OAyBRBBt/VP0YOymWI55cmk0nZhE/MfHTg+DhJySIyfmmy2O/vc++x0BAKJBnsSvvhSShwam9R8I0BLzXcc3aAbW17xnki4J4+rJfWA54o1VpTr0mo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <B69AC00C8133434CBE833B7F90ECB386@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a269371-4a6b-4609-74e6-08d63e49f374
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 09:27:46.0967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_090301_475162_DE65F92D 
X-CRM114-Status: GOOD (  19.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030092746.up-x0qrS2EAK9crnCDWbbr6lajd7UoaA32AHeulHkVM@z>

Am 30.10.18 um 08:23 schrieb Gerd Hoffmann:
> On Mon, Oct 29, 2018 at 12:46:34PM -0700, Michael Forney wrote:
>> Hi,
>>
>> I was looking at adding virtio-gpu support to tinyemu
>> (https://bellard.org/tinyemu/). I got it to work on x86, but just for
>> fun I tried it under riscv and ran into an issue with buffer
>> allocations (though, this should affect any arch without
>> ARCH_HAS_SG_CHAIN).
>>
>> virtio-gpu uses ttm to allocate buffers, which swaps pages to ensure
>> that they aren't consecutive[0][1].
> Interesting.
>
> While hacking the virtio-gpu ttm code I've already noticed that I get
> non-contignous memory even for small allocations (cursor, which is only
> 4 pages), but havn't found the time yet to look at this.
>
> Christian, care to explain the background?  The commit message sounds a
> bit like it papers over a bug somewhere else.

The problem is that the TTM pool handler thinks that we need to free 
pages to the huge page pool when it sees that they are consecutive.

The root problem of that in turn is that we can't use compound pages for 
device allocated memory, but a real fix for that would require quite 
some work in the MM.

What we can do rather easily is to paper over the problem by only 
swapping page 511 and 510 to avoid that the pool things that this is a 
huge page.

Regards,
Christian.

>
>> However, this causes sg_alloc_table_from_pages to use a sg entry for
>> every single page, limiting buffers to only 170 pages (the number of
>> sg entries that can fit into a page). This is only 417x417 with 32bpp.
>> I believe the page swapping also makes TRANSFER_TO_HOST_2D inefficient
>> by forcing the host to do many memcpys instead of just a few.
> Probably not *that* bad, the amount of data copyed doesn't change after
> all.  But, yes, I'd prefer to have shorter sh lists too.
>
> cheers,
>    Gerd
>
>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=fdb1a2236b07948e83e0a777e1795d4f07e52c33
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=ae937fe19636067ec5e20d7f1fa10c6cc6000b52

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
