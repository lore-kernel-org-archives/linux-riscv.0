Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF406EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQP7bkM6zCqtQiPDco4WWdlx6TzGIuCSs7npX7cSJlE=; b=l8reZCKXQIMar+yEStpdRhIfat
	7we8CSrp2Uq9U2UubqfairP+3xY47CbMz0ApHtSEfVQJ+0WTdhOxVINxVk2k/kOqdi3yIvrzXoPK2
	BsqWntIZ1lEfQsiwWzzj8wJkV5TZ++h/Qn+lz3OJYRewTVtcWKQM04E3OZeKI5r63aPXO7zNm0JM5
	PLnhuwlDbICNOpqXfj4bmUpVBUJZ0BGN1xygfvJl64z+we3gZK3wJO+RWJoWpu6AXIgyiygyppI0I
	1YxOAzPfFDeLVrYJYSAyd2VbUMv9t1ZqWnZKqBr9SEh0sO/QsyzDNNVkR2NDWp367eHiTW7jRKbhw
	jAm9I4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9P9S-00BYm9-0C;
	Wed, 14 Jun 2023 11:59:02 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9P9P-00BYlF-0M;
	Wed, 14 Jun 2023 11:59:00 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAJ98Z029310;
	Wed, 14 Jun 2023 11:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=G28Fiw7FWAGEVIoJszLRzBC6BzQXk1+v3Djg/QP/kkg=;
 b=GszUM5jkmo20W02+X21YjR9qmVDWZzqjT1uxJ4pkGBC0fD2XJmvzrIbAUUwn5TWOtFzW
 BI+/1wN7rO8JVGubK/KKJqp6CtHXGGnk6tQ8TQCvNfruEmTCz4qSA2bDvhzlKe7yfbUC
 tQ/ZYujRIUc1ENTQU1rCpq95215KS7vkWAPoPqySqqu9ikuvezmU+XG2Zs+NbjcdH5ZW
 mCSzLi+m1V6nqn0JIAwOC+h9yyigx3xeCFzVMHPQZtbCQBJJAT/Oqob4Yu/Ese9pX4De
 gt4EHsX36tZOI9xqyeg7EWOzx9U3Z/oYKvvgsMIjtNWlTIF/aD2tuoU3kIcxMgLbwPAb 3g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h7d7ck8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:58:51 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAOYEr021668;
	Wed, 14 Jun 2023 11:58:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm5f6c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO2L6my8hHZR54bNX7Bt4+gR8UBSz95A61hGSJpYLTeRtCHwZLSI7scYD0Ak5KTwda34GVUb0dLqsTt3HRa8exworiPK1LVWPTroOvK6Ug7lY2lFllZfZ9I6V8zt17dX7FqbztbxP9IDYbLZGp4uubEJRo/a857Rh1DtbZige4GLwPz+z2vDNeqUjmRmiJIQ6DQ8pUKJNKvHv1FZEv/8vyNK1uNUPtKFHUSprTpAWoYwXG36vyDqKrbU8Apf1xDptemg+BRosHifHXbHSShRuPkll5SDslso1gtvLY5lOdbRJ7zw8RWMQfCIPUBKTxWLIQbrqasmrd1YryhJKQ8PZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G28Fiw7FWAGEVIoJszLRzBC6BzQXk1+v3Djg/QP/kkg=;
 b=mQYmBLG4aHDQ6rotePypLHnCX2L0k3+dQfC1UK9X7ImUWMInPQ5n2u7oq6SDCLjp3dMkegxQBuvxmR4RJRz+RvCZiF6LaFtzoFFmHu9YT9sMDPMb8VKBuQ56VNK07rhrzUon7UiU2EZh5U6w0X3d3bQVDs84Oq/beA++P8io7iSik+OgelAAhoVho2RG7ftAQiBloJ+pefrRIQURJSxQZVA3vZl45RwV69D+I3avsR24U54M6/8/IHBp4gQ1e5+qcTAck8Vr9PT56e3akbRasLKV3x2ngkk3WX0XKw8zf5raE9i1/IGAUPMmuMOCccH9t40kgDvH7tVaf0cTtdHRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G28Fiw7FWAGEVIoJszLRzBC6BzQXk1+v3Djg/QP/kkg=;
 b=lg2S6G9n7EzbtCIEE/DxgmjhAYaUxOXJZOeJsXwGRdaH3d94YX0wHZp0AcBakkv01vHzDEliNrQhoYTiUeEScSbY8Xx4uFZgAlyplNg66CEEfIiFCaHHwgmfNknjjbzbsqZuimpMVE7YykC/ONGGZ9mQHQIwwnlgzVAC9ZcRYyY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB4204.namprd10.prod.outlook.com (2603:10b6:5:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:58:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 11:58:34 +0000
Message-ID: <e2220209-edb6-740b-32eb-fc3c9651d526@oracle.com>
Date: Wed, 14 Jun 2023 06:58:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 07/21] m68k/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
        keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
        frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org,
        samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de,
        rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
        sebastian.reichel@collabora.com, rppt@kernel.org,
        kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
        ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
        mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
        xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
        tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
        sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-8-eric.devolder@oracle.com>
 <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
X-ClientProxiedBy: DM6PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:5:337::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM6PR10MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 294fcafd-2f42-4cf4-9468-08db6cceae2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Glu62sRffinB252Fwx7DGgIVIvPNWu7fULmgo1VRN++BlcxYbx3t/rR6JqqyFfSXAJsssDI0+pxOeKV3gX33ZCBEmcTwKpYFTgv7z7znDiBa49yEV0J5BEnGMo33oSfhqizjI9y42JV3HHBUfi/XK48MNm/ATsX9UzXmLP3YhBKpWBU8n/lnJTCFnhOVqblYhziVQVJ45bF+r7JEy1U07YvYo4Xr02IyhvJDLGSz1LnDMd9nMRqxhGRdz1h/Gw+awUXb78exKsya3ek4LmOkQS0+Yp/GnTQ7NGNEHi3JZOC/pWdwgJG6FHXfOCbGcPE/INh7CZ4XNg1d/5H/JY5ppA8iax8qhcTbVef0Q5R3K7HtO7+VVgKpPv5sKG2czNhvcM/j4yaMdFK6ZaGhnltgvf/XtISPDkJasU7WTVs42LHYqKTxapqLryN0oMafm7/Vop5HX2ge9IiuHIL+LjiWUxCAsbF9nH+eW+1fwmhUirgnp9+WY47odDf4qGw6VmaKpB/L4nb+j5DAu8AW4/A0cR+DwJj4EmJixPJP1bMPWwJudHgdGoRU5TGgAVbONNw22LY5nYrM42+WbtnYv8D2DyX08KSeafDCCMY3FsOYo4lJiEWPxE65NsqcL7ezPNmiLmTNt04XbfBPNqHdNQISwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(2616005)(86362001)(31696002)(38100700002)(36756003)(478600001)(8936002)(6486002)(6666004)(8676002)(2906002)(4744005)(4326008)(5660300002)(7416002)(7366002)(66476007)(7406005)(66946007)(66556008)(31686004)(316002)(186003)(53546011)(41300700001)(6916009)(107886003)(6512007)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWF1Y2RWNXVVL3FVelhIdVpuZVVoMGZ4TWd2YmJzS0c2c3V3ejBjZEtvclNN?=
 =?utf-8?B?ZHpiOFVhWHdnRHpsczRpVGhpYURNZHVZTXN1eVJvUTBpQldRN29aSlFvby91?=
 =?utf-8?B?RHR4ZDJlUmlGYXhtU01HUzArQUl3WW1HdnpmNWRMSC94VFphbVpvVGFseU9j?=
 =?utf-8?B?bHk4MnpvTk9tOHQ0bU13RjViV2RCTFIvbDlvQXVJQzJBNFhJNkxLY2FrY2Ir?=
 =?utf-8?B?bXVGeG5zRWpoRm8valJzU0NqOEN6UDBkMGJDcEY1NlZ5YjNTZkhERm9ocFRh?=
 =?utf-8?B?SVdnejRkVjdqZmc2NGJGYUZwSFppQW1Lak9HWHV5NXk4RXNnYTFKV2M2UlFN?=
 =?utf-8?B?Q0s0Qm0vamJOK0pBOFg4TnRtcGFaYmVIMEdNSmYvTDRtbXBRWm5GbW9SR1hk?=
 =?utf-8?B?a1R2anFSS2IxUTEwVUVTR3hUYlhkQ3QwNHlaMlc3UVMrV3A1eWViVEhUaFVz?=
 =?utf-8?B?dG9yR1hEWkE5MmJPQnBXdVd5SUJYZ2tPQnNtYWZ5Rm55eXFFaWZOeVpBL2s5?=
 =?utf-8?B?dUFobkVaZGhHYk9FOTA3aVRSeDJCZngxaXp6eTRUbXUxZnBBcENETm1nSDU1?=
 =?utf-8?B?SUkvbEdweERiMkppdmdWdDQwQXQrZG5GV2F3d3Zlb09TbjVFNGllK25aUlpI?=
 =?utf-8?B?eDhzYnlaTDNsV3U1QmxmTFd5MTJoaTlVR1BOUng1c3JieFhMTnptaDVwdmlM?=
 =?utf-8?B?eW11L0NYSVBoTGFrOUl5VVZSUnNWdXducW9IY3Y1MEQvVmxJYkkwNnRGSXdU?=
 =?utf-8?B?YUFFd3JtRzR1M3NieEtNUUpoK0RkTjBia1kzLzAycnBsZUVaOC9YWmg2Yk9M?=
 =?utf-8?B?cmNZV0FqUXhvYmJ1MXBZdlhZWlNSamZHQmp1ZHVjR2xtMzZsYlc1K1krbEN2?=
 =?utf-8?B?ampxTnNBUTFjNlhkeC9UZnBkVjRQRnJJbkhxcmZuVGl6NGo3Mzk5V0JGZlFN?=
 =?utf-8?B?ZWc4RlJHR2Q4dUNVK212a29GeTZlWHM5NDNYZEQ5WnE4RFpUUFhpYkRSeHo5?=
 =?utf-8?B?Z0xTOTlwdVFKMXFsMHdLK292SHJ2YVBqaWRGTmRJcU5BRDhjTkYyOXFTTXFu?=
 =?utf-8?B?a3lON1dUZDdzYksva3FSWHFOVFJ6VkdQN1hiOW1wbDA4MGh0aUpTcDY0cHcw?=
 =?utf-8?B?dkRuMlkxVmJMcnprMzU3QmdIdmpIMUdzQXdhdURtQjhhYXdEM2VUaFdlYXRy?=
 =?utf-8?B?QXRhbU1ZVkZGaU9aVVhhZXpZZG0rRy9pemdWdjNHRXF3YVNaWkNQRVZpQWFR?=
 =?utf-8?B?RFc0S0NBdHgvVENDajArVGZxMlVqUnhpVFJnK1ZJOWYvTkZ4ZExERTBZOWF5?=
 =?utf-8?B?dXQ0VXJKcnBsWER6cC9haEQ3MDVWcWdseUEycDViaVZqakttT3dhYWF0RndO?=
 =?utf-8?B?ZGFZM2pPcjFBWWhDR0tUQ0NHQVFQbDBPcEJWaTVWY3Q3dmlodzJHNGlSN0M4?=
 =?utf-8?B?YnJoakZqdWxsNDBHWmdOUGtEWXl0U2o2cER6eGZ6MnhtbkpzOGkxWkdtaHI4?=
 =?utf-8?B?NnRQYUlyK24yTUpiR3BwSHE5RjZZeExMWm50Wm5kZ09qVUZrdUYzYUZReHZr?=
 =?utf-8?B?eUJTR3dHcVBtTnRsSlJ6dzNlbWNNOUR4SitxeDZWNXNHdHc5VTUxT2VnaE81?=
 =?utf-8?B?MVVSZmdIYmdGWmg1T1Frd1ZQS0V1by9ONFNhaTlEY2RTSTZ3d0IzNUlTeXcw?=
 =?utf-8?B?eXlWblo4SVdaSXB2Q3VYNk92M1dHM3FEU2JIVzB0WEJmcnA5aTlLRWNXUGRM?=
 =?utf-8?B?RDlrU2ZsMSt2NFpIdmRGd0V0cXVTUHk5dG5qSHhIZTQrSUI3UVFMN0xOUzB2?=
 =?utf-8?B?R3YxZlFGalRXYzdjVVQ2eXl5d1pvRXRPd21GQkYwYTZHVCsvQjlST2dqYXRG?=
 =?utf-8?B?MFRyZXpRWnNLTTZZZEluVmgvcE5mQnU4NXNKUnBRbC83NVdCWVp2V0k5bCtZ?=
 =?utf-8?B?VTdRSXJTKzVhWE9WZEo3ZXFneElYUjhzaUsrL0FIamwxMHB4N2Q1WmRReU8y?=
 =?utf-8?B?U20yRFNPWXFCS1llNE5jbm96cC9aaUdoRWlNWk1HUTNJMjJqLytlcmU1MDlh?=
 =?utf-8?B?Y1pMakhvVFJOUG51NDlFL1U1dmhtUHBnUXAzVUlIclJLaWhqaWhZZlJLR3pq?=
 =?utf-8?B?UEJFM2wySmVYeDc0Z1hKV1l1TC90T3lwYTdzcDBRZkJYYTNiWHpvVDlSaENE?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Tkgxc3kyb3l1NEZMS3lPVExYK0I5RmM1ekVSYUY3OUNPaDVMV3NVbFlpelVm?=
 =?utf-8?B?ckxjdkFqRGlaRnhkYW91UHZQQUVQVzZrS2J4bVRnWXZ4UCtET1pUWUc4Slla?=
 =?utf-8?B?cnRpenMyMEJ4QWJCemNPaUhBZXZzRFk0YVBvSE9WTG1uelM5Z1I1ZmJRVEgv?=
 =?utf-8?B?V1VyaTdKZnNPOFdLWUdBN25YOTNER2VFRWxuNVFmTGFQaGo4RXVDNnJNRFdD?=
 =?utf-8?B?WE9jWnFuZHdXN3VnS3UyOEJ6ZWNiSlBtT1pWSHpSdUZMalczaXFxUTd3eHE1?=
 =?utf-8?B?a3ZPNzIvaElDZE5QMGhsWUZNSVJIc294Z2UrQzBma2EyUmYzalp3UHdpTDRa?=
 =?utf-8?B?cWJQZHFBcCtMUWd2SjF4ZjNzNmFCK3NGeXB1T05LUHJmNDZqT3UvaUUvMHNK?=
 =?utf-8?B?MURqcEJxYytDNXkvVDdyMVBZQVNLeTNjbXZzYWdQY2FNTzRBSHRhcWxhVlBa?=
 =?utf-8?B?ZWxDRWx0QS9ZY25uMGNBZGNzd3V6VTJXOEF2VFZ3NTJvN3I2c2U5STNmUFF0?=
 =?utf-8?B?bXFQVGprc2dOVWJRd1hQTkRmbnlMWGs3L04yckF6aDZnYzZyUG92T1JNRi9u?=
 =?utf-8?B?WGl0am02TmlEd0hUazVvR0ZuYjVsT0dnUG50ZXpIOU5kVHdwNmJCU1R1eUht?=
 =?utf-8?B?eVViTTNQMWpIbUVERkNjTCtFTUVLUHhzbUZ2YnVPKzErU1NWWkw1VEVMM1FJ?=
 =?utf-8?B?RWFyTkVOWFU2SElJVVBBcFJmWVl0MWVaampOU0hxbzVETVV4Zm9FUUVnU055?=
 =?utf-8?B?WWl6SmpoSE43ZU9oajgzSTJuWjA5bnhsT1pnWS9GbVZ4REpDS3V1bk9LNm1P?=
 =?utf-8?B?L1cxNDZCcDR3Zi9vcW5zZU9HT3poWUZtMExpTmVIZGRnRjhIWGdsQzdEclV1?=
 =?utf-8?B?UUk4TUxJODJQQjRjbkR3NWl1YlZpcGV1SmdGSFNmT0VrY2YvQlZhNHlBSjZj?=
 =?utf-8?B?TmpNMVNrUU05YlpCYUxkb1VxZ2h0Z0xvMytaaWgza0VQdDMrcko2c0FOQWNr?=
 =?utf-8?B?bDhBVS8yMFBHejl4N1Z3ZldRcVdQT0o1cjlBVUtLVXYzTnRlS21iY2oyalVx?=
 =?utf-8?B?NWxSbG1IbnBBTnlIYkNtVFlJc3R3disxajVQb0w4anhKdm9hRERGdW5BOXdE?=
 =?utf-8?B?VzN2elpnT0pBYWtIRmNPak4wQm5oUm9UQXpCR3c3SHZpK1dIekRwTEN5eVVu?=
 =?utf-8?B?YUlNWnN0aHZmQzFCMXZrLzBOU3BuU0w4ZEdNZGFRcDFXOU1aYWwxZXZLdHIv?=
 =?utf-8?B?S0d5NUdxaWJmQWh2Z3JXK1NPcVFQbXFOZ3VsK1MrVG1JQWdJNk1oS3NiMjBU?=
 =?utf-8?B?OGRGMUxST0J5YVZHRW5QYVNnQXdvMGxjWTduT1puMW14eE9QK1BPU3R6SmhU?=
 =?utf-8?B?MDNrRVZXY1M1MUZCQUFUOEx2U1FSUXZrRzVwVnF0UlArWEhIT2k1Q055SlBW?=
 =?utf-8?B?TGFWQ3Znd3llbmkxRy9HdlFOV01hRDA5dmVQNGZTcUFLV29jM3kyWGZqbkVC?=
 =?utf-8?B?ZW5ZVDZmZm4yL0RReFR2N1VPalY3bnNZWkh4dFVWYmdneVZGL1RRMkFIOXcw?=
 =?utf-8?B?aDR1TktyQkhUV1NhVnJRZlh6Rlc4UGNYV2FRcjlQK1VZaDRsOE1PM3Y3RW03?=
 =?utf-8?B?c2M3ZVJHL2ZWbitINkNXMVlTclYxVWEwcGVRYlJ4OW1UN3VZV2E1VDNjTXE1?=
 =?utf-8?B?YzNVTGUyMGY4dVd3dko0K3k2Rm1nMUY0YndFZmlFOFJVa1NKalNGTHJzMWx1?=
 =?utf-8?B?RW1zbTMwTnlGUHZMYWcvT1NXK2xsRzdoazlleDByTkhGWjk5ZVRIWnJlY1RK?=
 =?utf-8?B?ZUdXYVBaTlZXa0hBWC9SUFdrSm90cW1LRFpCY3lGMFNORWhmMUF3T2tkei9E?=
 =?utf-8?B?OHRLVkJrVUZ0blhKUTZtMzd4cXJFVW1iRFpjeWhobTRqWTJFNm42SGx1Y2lI?=
 =?utf-8?B?Ym9hR1ZyM2hDUENJK1g3dWhiYndOYm91UmNPc3JyMkJoY2gyQUhLZHZSQTk3?=
 =?utf-8?B?UStJSFZldEZlK0xzMFJqNjdZWHA2aEVyUHczWWE1YVlSSlVDTnpXV3ZaTkFQ?=
 =?utf-8?B?alM0QkJIT1pjbjVJSFppSFJNUUozSzJ5NDR3cFFnT1NocmQwenp2dnRUamI2?=
 =?utf-8?B?dUx1bXFWdmY3aDZRNXQyNHhrdUNtcENJNzdWZkVUWDc1UExWOStrenBzbk1r?=
 =?utf-8?B?WDB4OVdyNFg3MGlNL2hUbS9sOGVHQ2QySWdrekRRb200VmYrbUY4RHoxSW1s?=
 =?utf-8?B?M09FTHpvTVN5SzlqL3BpZFNCVzlaTXNLbVlHdWVBQ1p6TkJaYk1HRUMxSlpY?=
 =?utf-8?B?Ym9VWlhLeXBFVlA3TjRJYkVldmtKT3pBR1NhRkNwUjJJelNKaWZhRHhhamJi?=
 =?utf-8?Q?k6J6VHOdhxEbVHBhdkzi2iht3OaZx4+1byo+99darejW2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: h3zQ2HYzwGnPLku+kRee2ePmM+gBnMNZ+4WHP0CVT8fehjcZA4bn9XxAtNbA10i5hizZvu5uzGVLzU0oWgah9snn/qCQLGpeKgIzs6gHPuMKCzSfMKosUuapYs2KdyPsWpP4fu0qv4tCW/Q0vInApxEgdGdXzI9O5RJTTVsWH8AEp0jaw6+LreZRhBlz7u9X0vJdan7hExrljOsqj0z/gRZwYSMKkHxTIJ7YESVU/C/Y4oKTYg7/JWm1Smg5oiwJ/MUS2E4g1/yrLZ3b/ZYShPuqS3DUaqkc0+Rgx+KxLXhPl+89yGndACXj6LENgVSXUTJFA/pfB6yHkhTddpRGNDA3jPzFs4fAwLg7t3Lg4ekFaTzc6KkwArUpPtyZ2cJVJEP98aIaGMa8Xc4iyMuJIXx5lTb+dKkBwq6U5xv94kRKUe/d6a6g7QXTCOlzcdA0Q44x79t9gGm/tg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294fcafd-2f42-4cf4-9468-08db6cceae2f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:58:34.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhsJCt2by+j2FqxKMEKNaMCVFjdeYg7G36MMniXrAtJ5jCVq8PXZi4qEzXR/09P4jaVEhe+pTWatkwzJ6yYvV0mjMj+XSrI0LqbOs+FUxeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_08,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140103
X-Proofpoint-ORIG-GUID: 2Gx-s-4chE4Uin7giX01OX7v0zYEVcyk
X-Proofpoint-GUID: 2Gx-s-4chE4Uin7giX01OX7v0zYEVcyk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_045859_263464_D6CF7A04 
X-CRM114-Status: GOOD (  10.08  )
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

CgpPbiA2LzEyLzIzIDE0OjM4LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gTW9uLCBK
dW4gMTIsIDIwMjMgYXQgNzoyOeKAr1BNIEVyaWMgRGVWb2xkZXIgPGVyaWMuZGV2b2xkZXJAb3Jh
Y2xlLmNvbT4gd3JvdGU6Cj4+IFRoZSBrZXhlYyBhbmQgY3Jhc2gga2VybmVsIG9wdGlvbnMgYXJl
IHByb3ZpZGVkIGluIHRoZSBjb21tb24KPj4ga2VybmVsL0tjb25maWcua2V4ZWMuIFV0aWxpemUg
dGhlIGNvbW1vbiBvcHRpb25zIGFuZCBwcm92aWRlCj4+IHRoZSBBUkNIX0hBU18gYW5kIEFSQ0hf
U1VQUE9SVFNfIGVudHJpZXMgdG8gcmVjcmVhdGUgdGhlCj4+IGVxdWl2YWxlbnQgc2V0IG9mIEtF
WEVDIGFuZCBDUkFTSCBvcHRpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFcmljIERlVm9sZGVy
IDxlcmljLmRldm9sZGVyQG9yYWNsZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4gCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4gCgpUaGFuayB5b3UgR2VlcnQhCmVyaWMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
