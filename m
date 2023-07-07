Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5357BC001B0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlYOeCL00sKkSc/s3iLn4SnwHD/K08opB2QHLiiU4sA=; b=yDd6+gw6ypEKsgesvGB7oEIzey
	CNoES5ri9bMtVhJUz8lbwMIM24MfVqjVqA4/YGfZRSo4HG9LHAzEkf8N47+Aih7+Uxnzz0YRdiCIy
	XFPy66VQZJtaNmJjTuVKMkxsB2LNPFei9mpTfykMawUPFnmVYTvE9ZZtZSalN8rsqWrXJm2lKWab3
	DnnOvFpFsSt8Zi2TEMqj60HeNNftE+gzqEQ8EgDJ6lZ/a+50noViQUxKrrVcJ1ZgJlk1JAVtnb+3/
	aFRiGi9+nkwZo+hvpA4HwVANIqOROM18cu0Zlmy9Tmo14wb2suflKZLPGEb+bGZER6Z0bekQ6vdR7
	DzcLQlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHkOP-004bQS-1o;
	Fri, 07 Jul 2023 12:16:57 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHkOL-004bPL-1T;
	Fri, 07 Jul 2023 12:16:55 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367BTuV6022708;
	Fri, 7 Jul 2023 12:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=wIjTw3vHw72SNVON/pdWkHPoZiAi2yBYdb2AseaHEzOzQMbyz6z/a4U9BLZJ+T3IbcnO
 yuZQl6J42o2EfOspLPBy9I1Kg/lMi5jPpFsMDMDa0E02Rqi+6aQmIlW6HyOf00QxROdj
 /SWG7n/31KfM6nZWrIvULCcOU08G8zdnF/ZDwbn1hT4QDXLg8MD/sqLACRW+qBz6+o+H
 LvpZYvbmkM4NQwSeVBFQwL/AUrSGWCLmGM3fKK1VfjlLJNyTPoAt4YncciEioGHG5tUJ
 2xw/ZtNRXOkoU4yZCcqZcp5BmV5CmPeog+svGi0XrhS8HrGPdTCMNSH3L18wzESBE1oA YQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rphvjr24h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 12:16:39 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 367CBgG9033490;
	Fri, 7 Jul 2023 12:16:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak8jk30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 12:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEjn/7Ywo9Fbq/tgQeLFZLTHZkKIAroDugvBHsYKxv384ta2ingouPaLkDPWL3DFx8VgVKq1SpGw3ewmQObRHdYUjO+T0DSqC4WLEaTlRNf6gDw8UmT9t6jEzmwnU6cqX5vBfzsJb9zbcDzAAztIvO0ZZm8vP4f6h7Yw+3VTK2tvdNKEUkPtpL/2UFlhpvSbCMXp/0iAoc+DLHZ2xAxpRPwfItN2GmPudMo0j/tHrzbZUmfzeeR5NFKiuY4jrYDCEKpGDjp43a2E80w5WjAjzePZ9v8BCCWbDtS7tGjvPrgcSuyTkmoy9F0Yp4DBDgWCjnwaqsJvEVS+oMTaFT18/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=grFtC4jyurLntw1grpmG/h0Dg8s1g07IdFLf/74YUy9quuJaNi7JYMOL67slP35YutZjOU8pPSrPCR3TW29ZtL+Jc2dx+vSn6WtDv6+HZ3S2HszU2zs/jTWcERtiWzWgVGFQKb5at7OBNX+n9aGuzZ5iuxHsWJXc/Thl3967zQ2u34xupoTk8AoCJPNC/ICNsthqmQ39P2VKnKuMYmXQmv9KaGty9S3miuduNLTP0XDNJJ1SmV1FzuwH1ZaQXdsKW4HJlcScJRwSCea4GjVS9PNkinvHLG1VUOgdvqU9G+lptL1P3GCaCFknODYyc8YRiYdfDNq9FPeLsUnj9wh4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=g4CMBQzQ1xOpwI+JpJwuVxwMjXZUffwMJqo/Ai9s4zNtbDMIuUSjnpHXa2qyhSwJWQpu9M27n100FWQq0xooml5MJ839xjPUWPSR31gp3qafetqYpKpad/YURFceRV+OTXNHYkLSmS8zcui9QXeYnGq/oAqQjFyXZYuWSDGaliM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB5354.namprd10.prod.outlook.com (2603:10b6:610:df::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 12:16:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 12:16:34 +0000
Message-ID: <c7e2b428-eb61-50c3-dd44-2d3fbe39301d@oracle.com>
Date: Fri, 7 Jul 2023 07:16:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
        "dalias@libc.org" <dalias@libc.org>,
        "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Cc: "kernel@xen0n.name" <kernel@xen0n.name>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "hca@linux.ibm.com" <hca@linux.ibm.com>,
        "gor@linux.ibm.com" <gor@linux.ibm.com>,
        "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
        "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
        "svens@linux.ibm.com" <svens@linux.ibm.com>,
        "hpa@zytor.com"
 <hpa@zytor.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "frederic@kernel.org" <frederic@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "samitolvanen@google.com" <samitolvanen@google.com>,
        "juerg.haefliger@canonical.com" <juerg.haefliger@canonical.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
        "ziy@nvidia.com" <ziy@nvidia.com>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "ojeda@kernel.org" <ojeda@kernel.org>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "xin3.li@intel.com" <xin3.li@intel.com>,
        "tj@kernel.org" <tj@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "tsi@tuyoix.net" <tsi@tuyoix.net>, "bhe@redhat.com" <bhe@redhat.com>,
        "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
        "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
 <20230706222027.189117-3-eric.devolder@oracle.com>
 <0d1097dd-f0cb-8518-cf88-e6afbd2a6a19@csgroup.eu>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <0d1097dd-f0cb-8518-cf88-e6afbd2a6a19@csgroup.eu>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 252203d0-9f79-4b83-f58e-08db7ee4017f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ge0sogSf7HeEvH0EQ548JJlBeqIFcCq6R3TsPY+81flrZ9fGAcllMQMuu3EzpmpEwlgw4p4z9Uj891ZP/oKRFUG1EGMdzrWfJB05WMir3KYW+hy/zue993l/tp/ikj0dSZqt+6LAjDdXNR8ZSfJhuen+964s6QT7Vf5sjmUqiox2MyMRMcwHSREKrNtJEAsc6ZZbWJfhcZK5Jx4n7HDp56/k9y9H3Vm6i+uv48asQJm6o3Xb2G+9m0/P3QC+kHl9riE15SfUaQ/PV8g8FzT6TMHg2yWdC8kbgxGlv8ysKp10HW6p6/AkuEMs0OW1hKJ1W9UpJx2IqdUdReQFIV5bmKtQGZST+VM6Y7jA6jD3XXrhXvLqbQynoTX0lQCYxHmrL0vRIbNwwo9nt7/ccPSlZKh6QUaEW9FsdIHGEpQhzyYkLJgjfgKXvTOc8AycdX4LnlDZlUqp+MF/BHqaEhjNuWZxf1vT4xN3tC13H8fqFZN9LBY9Fc8aUi81wewOvBAk8in8PTGPDFNvdwfa451zs+WHLJngntEJSgC7chjnLG7sXqILJcA1uagdcNNwwRKJwI9+mg7Uf798ScL8gm3eo8TeMipYIk5kScVe8aREtlTJmQoe2SHOav8Ex+96KUYJfgEhqRMxdMjfqJqCVv28csymBzIGMABDr3bnPmSUuE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(316002)(921005)(38100700002)(31696002)(36756003)(86362001)(31686004)(8936002)(41300700001)(26005)(7366002)(6512007)(5660300002)(107886003)(7416002)(7406005)(6506007)(53546011)(186003)(8676002)(2906002)(83380400001)(2616005)(66574015)(6666004)(66946007)(478600001)(110136005)(54906003)(6486002)(4326008)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkN2VUpPSm1zL3N4OXBEdGJMNW4zSS9ZOTlmTDMwb2o3UENzaE1mQUozYndk?=
 =?utf-8?B?bEVnMmFCMkZla0JoanVrSXc1b3dnM0xmSDJ4WkZLc09nem0yRHp0aFlDRGtT?=
 =?utf-8?B?Q3FwWVJWVzM0WUdwNnRaWFJaVzBwVjFwd1B3TG04dGo3MGFvUVhWMFBqU2Uw?=
 =?utf-8?B?ellqUGVaT3RGZVlING11QWEwalIzSTVnNUR3L0xlMGlEN3pWWkdFWWRJVlA3?=
 =?utf-8?B?RWE4SU9Fd3BRSTlxemNVdjFsajJXZitCbzQ5TzJxdmNjUUJxUDdBZTROLysz?=
 =?utf-8?B?WWYreGdnSnVsUUc0UGorU0Zob2IzbmpoSzRCOUEyWklDa1F1Tm9xU0VYOW9V?=
 =?utf-8?B?S1ZuYk9XcXFPdm92TlY4RjFtOGpqWTJnTGxLS0puNmV0bXhIenJDc3hMbGRF?=
 =?utf-8?B?RHlhOVAvejdGS0h6UTB5TUtPc3k4d1hCWjFndkxRVFZtbVZneEYxbm8zTGF5?=
 =?utf-8?B?Uko0anZRNTd2YUxnMlBJZ3ptdWJOQzVmNHNhNWRlZDRMQ1ZSZkNEdngxeStJ?=
 =?utf-8?B?dm5OZ0hwMWJiWHpLNVl4VnFzcUExTkFlSWJEZUpPckp1SEFqN1pvRXZEMTNj?=
 =?utf-8?B?TGhvOExrc1E3RmV5V0ZQRUZLeWgyWk9BMUZac1ZvTmVJdU1YLzNRdzVtalYx?=
 =?utf-8?B?WXBkcGRJdjc4NHNyZWlGSCtKeGdoUVpJWEwwY3ZzL1JEOC9SV2RxWnhaK0R0?=
 =?utf-8?B?dlVwSU9vTE5kYk0wOWxnS0Nha1BWNGVPQm10RG9QWFV0Qk51NFN3QmhWMjhU?=
 =?utf-8?B?bnVRRmR5ZC84MkxiV2NIWFlaZjVjYldqZm5kRTlBSUM1OE5VOHZzZWNGdmx3?=
 =?utf-8?B?ckVnTkwyUVNBWnRhdDQzcXJ2UWJmZTFyL09hZzVVVWJGeDA4b3MzUnY5elJS?=
 =?utf-8?B?Sk5TZFNRN3ZkWkZhSlNvejNJUWZYVnZEZWNGdHFUVy9Zcmp0S1BZUFl1WWkz?=
 =?utf-8?B?c1NMYnh0am5BYkl2d3VsbGxvRXREMWN3b0NlUGN3aVFvRWtxeEYrWWFVOThU?=
 =?utf-8?B?R25lSXpRUU1sc0taYnNNb3VkM2hDVzNIZlVBQUwreGZDcitHMlVXR0E0Vklv?=
 =?utf-8?B?UkdPN0VaSkpnR2NJZHVlYUhOckFFc1ZiTjVkNytLM25aRXZOSHNlcHBrWnJ2?=
 =?utf-8?B?UzZha2VqMFZwOWdUbS9oT3RYU0lkZFJEVHM3ekgvb0NaMDF0NzRMQXhBVG03?=
 =?utf-8?B?cnJOUVVuWHpkL0NNSGNDZVp3VEFuRXc3MWxOaStXZ3pzY2pydG10eEt1SGxQ?=
 =?utf-8?B?ZVdkbWMvcTAydmZrc0ZsbzR1cXVCdGQydVM2UE9xeFg4R0MwMklMeCttSFBX?=
 =?utf-8?B?cmlqUHRUVW0vT21iU2UwNnFSVTdJNUlTbUdaMEVud0JWVjZ2YXN5cjlhdThD?=
 =?utf-8?B?eGtnOGd1dXVXVFJsSG1MOVltaWNxQ0o0LzdvdUFVRkJlOEVObEVONytUVVhy?=
 =?utf-8?B?eVIzSUttVlp0L2FXSFVzQkVHbHdlZzFoUUtFbEt3UFBrNmdIOFFSWWNqK25S?=
 =?utf-8?B?cWVWQ0MwQ1RmUVluVDhPSFRWZCs1NlJpcjM0dkxyYmNsQkpQdVhyMFBQZStI?=
 =?utf-8?B?aDRQcWdlTWxaaFNBM285b25Qc3Btb3F1S0UrZzYxQk9EeUxHK3NTaWNveFpO?=
 =?utf-8?B?R3g0dnVqbzdyM2tIdEVLeE5JSkRwWHhNbFpkZXZ6UkYrQk9QN2dYRkwrbWVv?=
 =?utf-8?B?ZFFjbTNFVktldHJadWJBYUZ6ekpNZkV1YlpuQzVjR1kzZlJmM0I4VmErOHRr?=
 =?utf-8?B?dEQ4cjVJV0J2Z3Q1WitPZWxoWnArOEVhdHUwQlhQWjRIVXkvT0t4MW5EeUZB?=
 =?utf-8?B?SjVteTFnM29nZXhDaDJzY05FekY5aTRQd3MyeFBUQm9VdGc5MWs5WFBoeith?=
 =?utf-8?B?dnowbzhjUVlKVE9qNVdweXAyRy9vSlBKbDg2dW1xMDZUSDVnTWZVNGFTczJi?=
 =?utf-8?B?Y0EydFVRNFpidDd1Y2p4eHMxZGx1aG9yYjhOVks1WFc3c05Ob1A1UTlzWU1k?=
 =?utf-8?B?OS9rSnhJK2RaWFBWQ280QXZTZllndmF5Q2MrQUtWazZlaDBRUTlVMkVVa09p?=
 =?utf-8?B?VlgyaGt4VUYvWlpvQlcreDVYdmNwL1ZvdGxFNkRzRUREck5wRlViUlBOWW9N?=
 =?utf-8?B?UmdOKzVsRkFtR1Q1MC9vcW5qalk3VHNZUnNkNE4wd3FRTHZlQ0krSnNHR3JY?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Rldiakk0NG11aTlaNERqOEpweEtHejFWNlVTSW9BYnM4MTU4ZTdHU3dHZWxM?=
 =?utf-8?B?Rkw0bzY2UjJnLzFoNFJ3Sy9qMmRrOTZuVzhvSVZCNUFEbkFmSVVIckdtWDRm?=
 =?utf-8?B?dnUvNisxWWVHTkMvbmYwM2x3S04rbGU1RXVNekVFWXpYVVFFREdhOXZjQWw4?=
 =?utf-8?B?ZHdaSlh0YkNvci9FSW40Q2RqSlFvRUpBbm5DK2xyaEhZdkE3RGIzZ1MrN2V2?=
 =?utf-8?B?UjB2cHJZSXJzMEpYTHVnMTFOc0F3cnNuZVRoRURra2x5SHZXbkJxeUt6V0hS?=
 =?utf-8?B?OW9HZWd0SFViQlN3U0FBNnhCbnp3Nk9SQ3lCR0hYaTllSnV4dVFEWVJwa1Yr?=
 =?utf-8?B?aTNTTUkxaitrZjIzZ05GazNPSzg3V0NpUmdsTmEzc3UyUkdRNlNuWkRBTWlQ?=
 =?utf-8?B?bU12TWZvNCtNZi91L0UwelNlcnlJT2ZYZVVCRVFRUy9vZk96R0xKdFUyMmhl?=
 =?utf-8?B?ZXhkRkFvTTZPdWtGRlY4NnllOUZlMGFjSDM2TW9tQkJYeVpudXR5TG1pUmNM?=
 =?utf-8?B?bGQ0U1ZQUGhPajFRcnpxNkFTYkZ3WEFpT1NISFBqSTlHc3d3YU5zbk0yMUo5?=
 =?utf-8?B?L01EVDZOeDFuaFJhS1B2MlZmeFVORi9qY1ppYmEzMVlqSkdTWEdWR3JHNzJT?=
 =?utf-8?B?eDRYSnArUHdhSnFsb0pJTXVXZkRIWlRzOEJHZXNjaW1ibmpBOGkvZEVXWDdE?=
 =?utf-8?B?WG9WVlRHSnh1STBTSFkzWFQzdVVxcXVzSTdjRUhEWG4wR2hGRlRUZnpWSmFn?=
 =?utf-8?B?TXB1OXAvNnNxSzVaNkdEdWlSSVJnNUhyYk9IeS9JM0kyL0dxZE43RmxVT3Fa?=
 =?utf-8?B?Z01makRlSmZ1dHJ1Y1luaEVjUndoaWJEMkVjOUh6MzN0RW1nUitVTHJHT1ZT?=
 =?utf-8?B?NSsrTVFocWtScERMakpDcG5ud1hJVFdUd24yZFZmNUxpa3VQZWtmbnhHbDZD?=
 =?utf-8?B?eTFDaXkwVDRQTml1Nk1Cd3ZKenBkY2ZnSkFJZkRMS25OcjVhMUExWVZaUDh4?=
 =?utf-8?B?djVWUldRK09IcUR1Mm5JMkpiZzZ3K2IxVGR6bEZyR1A0UmozRHFOQmh6U3dL?=
 =?utf-8?B?WmVPd290UVR0RTRwbllxUEsxUWtDbzV3bTRBR1BKT0xGU3lUbDlUYm4rMnZN?=
 =?utf-8?B?RG44NjE2SEl0eDFZUjlSbk9kK1NySXZnUmdjUUQ2a2JScmRxRXhJamJvanVJ?=
 =?utf-8?B?bmUyTklHNTVHejBhcWpxNUNHWkx2b2hBYXFKUGZWTXJQMXVPV2xnbUhqdm5Z?=
 =?utf-8?B?U2dDSTB2RVJ1WUpZQkZneGx0NnFmSmE4UXNMczRWMy92VG5PUktiRE9hc3p0?=
 =?utf-8?B?aS9tY1V3NDl2MUtIaTJ4dHdsSkNVRVlvOWFkRFdzL2lTV1U3WDRYSGRaV0N4?=
 =?utf-8?B?YWNaclJkNXJYZE9GbHRxYXBBalBYS1FoaEIwY0R5Y2N3TmZFWFZNSmVhWWd5?=
 =?utf-8?B?cVJITXRDUmlLR2xpNVlMai9zbVNCajJyU0Vxa1RjRVZVSEpvWkRRa3VGTWls?=
 =?utf-8?B?S0JDVll5ajg5aGFyUDVaZk9kRmcvTk1PQnhSZjl5eEN4eEF2NzVWMWlYd2lX?=
 =?utf-8?B?bzRzUCs5MWZDNlhFdVZCY0RVSVdGT2FTdjIvZ2RBcktJQnRMdEUwbVBYM1FX?=
 =?utf-8?B?YnJZd1ZNWTh4NHBXSXNZU2prSXZFdm4rRGpRZEl5Vlk2bVF6aC9LUlFaZDdP?=
 =?utf-8?B?V003MzMxWkNsRmVxVHBQVFJEak03NWZlNXd1SlhLb1IzcXNhNkdRT3Z0cVgw?=
 =?utf-8?B?WWZWMWR4SDgyNTRYRU4rZGxhanZ5NHRiaGRVVVFjUzE0dVBFTHF1VlI3TFgy?=
 =?utf-8?B?eFpuaE1jNXhWdER6TVkwQnowbEtGbllGbUlTUktVUkVIL2xvNndnN2VOb2Fp?=
 =?utf-8?B?ZSt5YnpuYmdvV002WWovT2lrVVJCaVFMcDdxMVlpalVUbUV2bWFEd1JCeEtS?=
 =?utf-8?B?NGI0RHAvK0x1c2l1MUFCRVNWMU04MjdPOTBXTDFjc0NWZXhOQk9Pc2hxUXdC?=
 =?utf-8?B?a0JXNDFzdFpuUXBEZWFDbXZ5MXNWeVBkaG5JRXlyTWQxUU1YRi9SYnpBYThF?=
 =?utf-8?B?NHpoSjBxOG5nVFVFZWV2amFhL1JvSXMxdFJtKzZ6SDBXTFpJQTJETExsay8v?=
 =?utf-8?B?S3IvQ3JSVnhncHVIQWdsMW5uSklaRkN4TExmeFhJWkFoUGs5aURpekdTWkps?=
 =?utf-8?B?N2x0d1FGMTFpUFNzZ2VaYmkrRHhTcmJYOFdFVkdMRjJjejBaSlJzaG1WdnRX?=
 =?utf-8?B?QlQ2UzlBM0svUDh0aU1ySVZNM1lxbWZHakJGcGRsUlVKSVpZRHdMc3ZQdzJ4?=
 =?utf-8?B?M243R2xPUW0rOXBRUHlyaWpVSXlIdThZL3NFS1kvY0hvSTNjM3ppeE92Njdv?=
 =?utf-8?Q?3305T3+MdCUySFL5ZUBa/Ewa+OOapb4v3/SjZgDVQArpc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: QosDKHLeGs/CAfeT83EgBxsYfRhqD1IVA7bDlwoI6+IZRKAEoSJh03ihhFn/rdNy5bkmeaNGQHS1QKNzIigFisZRZxC5wv5cgJOF9pC6azWAbbFk7GwUvAl8sALDsjOLEtMC3dp+vNxrQPfXnuLA/F+KUFEbhepn2zYNUaI1lVxdHQ08JLTYjBwRQjnVOpyhSMfKnoRNqJVi3JW1+vZVIheJJxr/RjwDUhsuKuZInCFtWypn9SsFLQi22asr3UmBpFDOxxCuoPhKtWSq/QGlP11t6DBaBSMJbGHTwQR+ZeWOkl1lQF4s4UJWdcV3LnNHTaJ4uWbvkh3yyWsjwZ7eswjCDWJ7xULjQr/7mp4lAkDUD/AAHzRbMHifwrUE+rLI7pnoiwubRQ6FSeut85UCq36PuVOQwIfMKX564Bo9C8o3UXSuYQcYe5HmErFWEmNi4mgPX3irKqe/gg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252203d0-9f79-4b83-f58e-08db7ee4017f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 12:16:34.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tadNWrXpdlNZJHPF8w06ExCZ4V0Xl4cFbNlKdwShlDQC+aMfq8ZLLaLpMP3KgaGxLhTvLtbGOYOzxgLHtiZosrjtCJpzJoAMFTUyeoEQbqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070114
X-Proofpoint-GUID: bhlY-lzXrhqQr_Fg9wxavC4FSAdtsUu7
X-Proofpoint-ORIG-GUID: bhlY-lzXrhqQr_Fg9wxavC4FSAdtsUu7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_051653_808642_BA17A8D9 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzcvMjMgMDA6NTgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMDcv
MDcvMjAyMyDDoCAwMDoyMCwgRXJpYyBEZVZvbGRlciBhIMOpY3JpdMKgOgo+PiBUaGUga2V4ZWMg
YW5kIGNyYXNoIGtlcm5lbCBvcHRpb25zIGFyZSBwcm92aWRlZCBpbiB0aGUgY29tbW9uCj4+IGtl
cm5lbC9LY29uZmlnLmtleGVjLiBVdGlsaXplIHRoZSBjb21tb24gb3B0aW9ucyBhbmQgcHJvdmlk
ZQo+PiB0aGUgQVJDSF9TVVBQT1JUU18gYW5kIEFSQ0hfU0VMRUNUU18gZW50cmllcyB0byByZWNy
ZWF0ZSB0aGUKPj4gZXF1aXZhbGVudCBzZXQgb2YgS0VYRUMgYW5kIENSQVNIIG9wdGlvbnMuCj4g
Cj4gCj4gV2h5IGRvIHlvdSBuZWVkIHRvIGR1cGxpY2F0ZSB0aGUgQVJDSF9TRUxFQ1RTXyBlbnRy
aWVzIGluIGVhY2gKPiBhcmNoaXRlY3R1cmUgPwo+IAo+IFdoeSBub3QgZGVmaW5lIHRoZW0gaW4g
YXJjaC9LY29uZmlnIHRoZW4gc2VsZWN0IGlmIGZyb20gZWFjaCBhcmNoaXRlY3R1cmUgPwo+IAo+
IEZvciBpbnN0YW5jZSBoZXJlIGZvciB4ODYgZm9yIEFSQ0hfU0VMRUNUU19LRVhFQ19GSUxFIGFs
bCB5b3UnbGwgaGF2ZSB0bwo+IGRvIGlzOgo+IAlzZWxlY3QgQVJDSF9TRUxFQ1RTX0tFWEVDX0ZJ
TEUgaWYgS0VYRUNfRklMRQo+IAlzZWxlY3QgSEFWRV9JTUFfS0VYRUMgaWYgSU1BICYmIEtFWEVD
X0ZJTEUKPiAKPiAKPiBDaHJpc3RvcGhlCgpIaSBDaHJpc3RvcGhlLCB0aGFua3MgZm9yIGxvb2tp
bmcgYXQgdGhpcyEKVGhlIEFSQ0hfU0VMRUNUU18gaXMgd2hlcmUgdGhlICJjdXN0b21pemF0aW9u
IiBpcyBwZXJmb3JtZWQgZm9yIHRoYXQgb3B0aW9uLiBUaGUgY3VzdG9taXphdGlvbiBpcyAKcHV0
dGluZyBpbiBwbGFjZSB0aGUgZGlmZmVyZW5jZXMgdGhhdCB0aGUgYXJjaCBoYWQgZnJvbSB0aGUg
Y29tbW9uIG9wdGlvbi4KCkZvciBleGFtcGxlLCB3aXRoIEFSQ0hfU0VMRUNUU19LRVhFQ19GSUxF
LCBoZXJlIGFyZSBhbGwgdGhlIHVzZXM6Cgp4ODY6CiAgICAgc2VsZWN0IEhBVkVfSU1BX0tFWEVD
IGlmIElNQQoKYXJtNjQ6CiAgICAgc2VsZWN0IEhBVkVfSU1BX0tFWEVDIGlmIElNQQoKcG93ZXJw
YzoKICAgICBzZWxlY3QgS0VYRUNfRUxGCiAgICAgc2VsZWN0IEhBVkVfSU1BX0tFWEVDIGlmIElN
QQoKcmlzY3Y6CiAgICAgc2VsZWN0IEhBVkVfSU1BX0tFWEVDIGlmIElNQQogICAgIHNlbGVjdCBL
RVhFQ19FTEYKCkFuZCB0aGVyZSBhcmUgYXJjaHMgKHBhcmlzYywgcmlzY3YsIHMzOTApIHRoYXQg
c3VwcG9ydCBLRVhFQ19GSUxFIHRoYXQgZG8gbm90IG5lZWQgCkFSQ0hfU0VMRUNUU19LRVhFQ19G
SUxFLgoKU28gdGhlcmUgaXNuJ3QgYSBjbGVhciBwYXRoIGZvciBvcHRpbWl6aW5nIHRoZSBJTUEg
c3RhdGVtZW50LCBpbiB0aGlzIGV4YW1wbGUsIHRoYXQgSSdtIGF3YXJlIG9mLgoKQnV0IHBlcmhh
cHMgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSB0ZWNobmlxdWUgeW91IGFyZSBzdWdnZXN0
aW5nLCBlaXRoZXIuLi4KCmVyaWMKCgoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogRXJpYyBEZVZv
bGRlciA8ZXJpYy5kZXZvbGRlckBvcmFjbGUuY29tPgo+PiAtLS0KPj4gICAgYXJjaC94ODYvS2Nv
bmZpZyB8IDkyICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+
PiBpbmRleCA3NDIyZGI0MDk3NzAuLjk3NjdhMzQzZjdjMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC94
ODYvS2NvbmZpZwo+PiArKysgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IEBAIC0yMDQwLDg4ICsyMDQw
LDM0IEBAIGNvbmZpZyBFRklfUlVOVElNRV9NQVAKPj4gICAgCj4+ICAgIHNvdXJjZSAia2VybmVs
L0tjb25maWcuaHoiCj4+ICAgIAo+PiAtY29uZmlnIEtFWEVDCj4+IC0JYm9vbCAia2V4ZWMgc3lz
dGVtIGNhbGwiCj4+IC0Jc2VsZWN0IEtFWEVDX0NPUkUKPj4gLQloZWxwCj4+IC0JICBrZXhlYyBp
cyBhIHN5c3RlbSBjYWxsIHRoYXQgaW1wbGVtZW50cyB0aGUgYWJpbGl0eSB0byBzaHV0ZG93biB5
b3VyCj4+IC0JICBjdXJyZW50IGtlcm5lbCwgYW5kIHRvIHN0YXJ0IGFub3RoZXIga2VybmVsLiAg
SXQgaXMgbGlrZSBhIHJlYm9vdAo+PiAtCSAgYnV0IGl0IGlzIGluZGVwZW5kZW50IG9mIHRoZSBz
eXN0ZW0gZmlybXdhcmUuICAgQW5kIGxpa2UgYSByZWJvb3QKPj4gLQkgIHlvdSBjYW4gc3RhcnQg
YW55IGtlcm5lbCB3aXRoIGl0LCBub3QganVzdCBMaW51eC4KPj4gLQo+PiAtCSAgVGhlIG5hbWUg
Y29tZXMgZnJvbSB0aGUgc2ltaWxhcml0eSB0byB0aGUgZXhlYyBzeXN0ZW0gY2FsbC4KPj4gLQo+
PiAtCSAgSXQgaXMgYW4gb25nb2luZyBwcm9jZXNzIHRvIGJlIGNlcnRhaW4gdGhlIGhhcmR3YXJl
IGluIGEgbWFjaGluZQo+PiAtCSAgaXMgcHJvcGVybHkgc2h1dGRvd24sIHNvIGRvIG5vdCBiZSBz
dXJwcmlzZWQgaWYgdGhpcyBjb2RlIGRvZXMgbm90Cj4+IC0JICBpbml0aWFsbHkgd29yayBmb3Ig
eW91LiAgQXMgb2YgdGhpcyB3cml0aW5nIHRoZSBleGFjdCBoYXJkd2FyZQo+PiAtCSAgaW50ZXJm
YWNlIGlzIHN0cm9uZ2x5IGluIGZsdXgsIHNvIG5vIGdvb2QgcmVjb21tZW5kYXRpb24gY2FuIGJl
Cj4+IC0JICBtYWRlLgo+PiAtCj4+IC1jb25maWcgS0VYRUNfRklMRQo+PiAtCWJvb2wgImtleGVj
IGZpbGUgYmFzZWQgc3lzdGVtIGNhbGwiCj4+IC0Jc2VsZWN0IEtFWEVDX0NPUkUKPj4gLQlzZWxl
Y3QgSEFWRV9JTUFfS0VYRUMgaWYgSU1BCj4+IC0JZGVwZW5kcyBvbiBYODZfNjQKPj4gLQlkZXBl
bmRzIG9uIENSWVBUTz15Cj4+IC0JZGVwZW5kcyBvbiBDUllQVE9fU0hBMjU2PXkKPj4gLQloZWxw
Cj4+IC0JICBUaGlzIGlzIG5ldyB2ZXJzaW9uIG9mIGtleGVjIHN5c3RlbSBjYWxsLiBUaGlzIHN5
c3RlbSBjYWxsIGlzCj4+IC0JICBmaWxlIGJhc2VkIGFuZCB0YWtlcyBmaWxlIGRlc2NyaXB0b3Jz
IGFzIHN5c3RlbSBjYWxsIGFyZ3VtZW50Cj4+IC0JICBmb3Iga2VybmVsIGFuZCBpbml0cmFtZnMg
YXMgb3Bwb3NlZCB0byBsaXN0IG9mIHNlZ21lbnRzIGFzCj4+IC0JICBhY2NlcHRlZCBieSBwcmV2
aW91cyBzeXN0ZW0gY2FsbC4KPj4gK2NvbmZpZyBBUkNIX1NVUFBPUlRTX0tFWEVDCj4+ICsJZGVm
X2Jvb2wgeQo+PiAgICAKPj4gLWNvbmZpZyBBUkNIX0hBU19LRVhFQ19QVVJHQVRPUlkKPj4gLQlk
ZWZfYm9vbCBLRVhFQ19GSUxFCj4+ICtjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQ19GSUxFCj4+
ICsJZGVmX2Jvb2wgWDg2XzY0ICYmIENSWVBUTyAmJiBDUllQVE9fU0hBMjU2Cj4+ICAgIAo+PiAt
Y29uZmlnIEtFWEVDX1NJRwo+PiAtCWJvb2wgIlZlcmlmeSBrZXJuZWwgc2lnbmF0dXJlIGR1cmlu
ZyBrZXhlY19maWxlX2xvYWQoKSBzeXNjYWxsIgo+PiArY29uZmlnIEFSQ0hfU0VMRUNUU19LRVhF
Q19GSUxFCj4+ICsJZGVmX2Jvb2wgeQo+PiAgICAJZGVwZW5kcyBvbiBLRVhFQ19GSUxFCj4+IC0J
aGVscAo+PiArCXNlbGVjdCBIQVZFX0lNQV9LRVhFQyBpZiBJTUEKPj4gICAgCj4+IC0JICBUaGlz
IG9wdGlvbiBtYWtlcyB0aGUga2V4ZWNfZmlsZV9sb2FkKCkgc3lzY2FsbCBjaGVjayBmb3IgYSB2
YWxpZAo+PiAtCSAgc2lnbmF0dXJlIG9mIHRoZSBrZXJuZWwgaW1hZ2UuICBUaGUgaW1hZ2UgY2Fu
IHN0aWxsIGJlIGxvYWRlZCB3aXRob3V0Cj4+IC0JICBhIHZhbGlkIHNpZ25hdHVyZSB1bmxlc3Mg
eW91IGFsc28gZW5hYmxlIEtFWEVDX1NJR19GT1JDRSwgdGhvdWdoIGlmCj4+IC0JICB0aGVyZSdz
IGEgc2lnbmF0dXJlIHRoYXQgd2UgY2FuIGNoZWNrLCB0aGVuIGl0IG11c3QgYmUgdmFsaWQuCj4+
ICtjb25maWcgQVJDSF9IQVNfS0VYRUNfUFVSR0FUT1JZCj4+ICsJZGVmX2Jvb2wgS0VYRUNfRklM
RQo+PiAgICAKPj4gLQkgIEluIGFkZGl0aW9uIHRvIHRoaXMgb3B0aW9uLCB5b3UgbmVlZCB0byBl
bmFibGUgc2lnbmF0dXJlCj4+IC0JICB2ZXJpZmljYXRpb24gZm9yIHRoZSBjb3JyZXNwb25kaW5n
IGtlcm5lbCBpbWFnZSB0eXBlIGJlaW5nCj4+IC0JICBsb2FkZWQgaW4gb3JkZXIgZm9yIHRoaXMg
dG8gd29yay4KPj4gK2NvbmZpZyBBUkNIX1NVUFBPUlRTX0tFWEVDX1NJRwo+PiArCWRlZl9ib29s
IHkKPj4gICAgCj4+IC1jb25maWcgS0VYRUNfU0lHX0ZPUkNFCj4+IC0JYm9vbCAiUmVxdWlyZSBh
IHZhbGlkIHNpZ25hdHVyZSBpbiBrZXhlY19maWxlX2xvYWQoKSBzeXNjYWxsIgo+PiAtCWRlcGVu
ZHMgb24gS0VYRUNfU0lHCj4+IC0JaGVscAo+PiAtCSAgVGhpcyBvcHRpb24gbWFrZXMga2VybmVs
IHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gbWFuZGF0b3J5IGZvcgo+PiAtCSAgdGhlIGtleGVjX2Zp
bGVfbG9hZCgpIHN5c2NhbGwuCj4+ICtjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQ19TSUdfRk9S
Q0UKPj4gKwlkZWZfYm9vbCB5Cj4+ICAgIAo+PiAtY29uZmlnIEtFWEVDX0JaSU1BR0VfVkVSSUZZ
X1NJRwo+PiAtCWJvb2wgIkVuYWJsZSBiekltYWdlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gc3Vw
cG9ydCIKPj4gLQlkZXBlbmRzIG9uIEtFWEVDX1NJRwo+PiAtCWRlcGVuZHMgb24gU0lHTkVEX1BF
X0ZJTEVfVkVSSUZJQ0FUSU9OCj4+IC0Jc2VsZWN0IFNZU1RFTV9UUlVTVEVEX0tFWVJJTkcKPj4g
LQloZWxwCj4+IC0JICBFbmFibGUgYnpJbWFnZSBzaWduYXR1cmUgdmVyaWZpY2F0aW9uIHN1cHBv
cnQuCj4+ICtjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQ19CWklNQUdFX1ZFUklGWV9TSUcKPj4g
KwlkZWZfYm9vbCB5Cj4+ICAgIAo+PiAtY29uZmlnIENSQVNIX0RVTVAKPj4gLQlib29sICJrZXJu
ZWwgY3Jhc2ggZHVtcHMiCj4+IC0JZGVwZW5kcyBvbiBYODZfNjQgfHwgKFg4Nl8zMiAmJiBISUdI
TUVNKQo+PiAtCWhlbHAKPj4gLQkgIEdlbmVyYXRlIGNyYXNoIGR1bXAgYWZ0ZXIgYmVpbmcgc3Rh
cnRlZCBieSBrZXhlYy4KPj4gLQkgIFRoaXMgc2hvdWxkIGJlIG5vcm1hbGx5IG9ubHkgc2V0IGlu
IHNwZWNpYWwgY3Jhc2ggZHVtcCBrZXJuZWxzCj4+IC0JICB3aGljaCBhcmUgbG9hZGVkIGluIHRo
ZSBtYWluIGtlcm5lbCB3aXRoIGtleGVjLXRvb2xzIGludG8KPj4gLQkgIGEgc3BlY2lhbGx5IHJl
c2VydmVkIHJlZ2lvbiBhbmQgdGhlbiBsYXRlciBleGVjdXRlZCBhZnRlcgo+PiAtCSAgYSBjcmFz
aCBieSBrZHVtcC9rZXhlYy4gVGhlIGNyYXNoIGR1bXAga2VybmVsIG11c3QgYmUgY29tcGlsZWQK
Pj4gLQkgIHRvIGEgbWVtb3J5IGFkZHJlc3Mgbm90IHVzZWQgYnkgdGhlIG1haW4ga2VybmVsIG9y
IEJJT1MgdXNpbmcKPj4gLQkgIFBIWVNJQ0FMX1NUQVJULCBvciBpdCBtdXN0IGJlIGJ1aWx0IGFz
IGEgcmVsb2NhdGFibGUgaW1hZ2UKPj4gLQkgIChDT05GSUdfUkVMT0NBVEFCTEU9eSkuCj4+IC0J
ICBGb3IgbW9yZSBkZXRhaWxzIHNlZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tkdW1wL2tk
dW1wLnJzdAo+PiArY29uZmlnIEFSQ0hfU1VQUE9SVFNfS0VYRUNfSlVNUAo+PiArCWRlZl9ib29s
IHkKPj4gICAgCj4+IC1jb25maWcgS0VYRUNfSlVNUAo+PiAtCWJvb2wgImtleGVjIGp1bXAiCj4+
IC0JZGVwZW5kcyBvbiBLRVhFQyAmJiBISUJFUk5BVElPTgo+PiAtCWhlbHAKPj4gLQkgIEp1bXAg
YmV0d2VlbiBvcmlnaW5hbCBrZXJuZWwgYW5kIGtleGVjZWQga2VybmVsIGFuZCBpbnZva2UKPj4g
LQkgIGNvZGUgaW4gcGh5c2ljYWwgYWRkcmVzcyBtb2RlIHZpYSBLRVhFQwo+PiArY29uZmlnIEFS
Q0hfU1VQUE9SVFNfQ1JBU0hfRFVNUAo+PiArCWRlZl9ib29sIFg4Nl82NCB8fCAoWDg2XzMyICYm
IEhJR0hNRU0pCj4+ICAgIAo+PiAgICBjb25maWcgUEhZU0lDQUxfU1RBUlQKPj4gICAgCWhleCAi
UGh5c2ljYWwgYWRkcmVzcyB3aGVyZSB0aGUga2VybmVsIGlzIGxvYWRlZCIgaWYgKEVYUEVSVCB8
fCBDUkFTSF9EVU1QKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
