Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DDC7EE26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:Subject:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWkAIczNPBXcCrsIIpxLWHQ63G+hbVMzs+1yjMi1yls=; b=nj/TTlhzy+T9rv
	HD8Lj2YxRrFHpbemjgGxkHd0G0Fr1oVhchpnoNo0L6eWZXzM0nN36p+kCkFmWRdW0mdoPf2dg9129
	/sXKrLlW351W2bcOEV9JCZaHKHXvqkhyPFEKrmj32g71DuccOqekfVranyE8zuwah2wmdSBSOGQ1w
	z0+wZPGnKYO1zsPnphY5m0Sx23kI4KdSER79GWwM+k7yPj07uc2yHVGJhKAzn4wBQoZ9VR6FZFxTq
	9QRi0qMitA2BoQg2fkyrp9+7mVwxz4ZgH77S4b59emL+zdtFyQ5w9NpFznuOKDz0i/MgtIgB/+QpV
	wbH+JXxVDsb7p3RTnA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q03QE-00Gmp5-32;
	Fri, 19 May 2023 16:57:42 +0000
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q03QA-00Gmn9-2G;
	Fri, 19 May 2023 16:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684515458;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jG1556UdD29OJoaALVIo8wkISlGBR2/HX2MVx7arj5c=;
  b=MOOhti5gk6Pxur0+O5ezsA4Va6Y2I0Zk5Qj1oC109pxA0jMpXdZUOAOL
   SVtwnaitYE+UCDijLxg1L1I9GVP/KuKtItCM5SMOmtGNMvZ43IuRFSiK1
   rXWuDQ0a/YP7LnaLcjmfWBuEM+sS5Y4vFGdgkPOIQbA+d2PZVwcGzIitt
   0=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 109017135
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jKZWe6lHCqBpyzNxCaWfjgno5gwLIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXWyDaa2PNGfwLd92a9vi8x9S6pbWmoNgGlZp+CxkRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5Q6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aAJNi89Zxudvvvs2YLrQMRvrcoBFNa+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC0WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOzgr6Ez2wD7Kmo7Ui0ECUG7sdSDuhScBvheN
 GJT/AU+hP1nnKCsZpynN/Gim1adox8XbNhQDuI9wBiQy6HV5Q3fDW8BJhZFado7pIo/Xzlv1
 VKTmd7tLThuq6GOD3Ob+K2doT67NW4SN2BqTSQNUQIB4t+lpYgpjxTGVf5qCqvzhdrwcRnvw
 jSOhCsznbMeiYgMzarT1V/ahCihoLDKQxQz6wGRWXiqhit9ZYi4d8mj8lvKxehPIZzfTVSbu
 nUA3c+E44gmEYqHkyOARuklFbWx5//DPifVh11iGd8t+lyF/3+lYJAV5TBmP293PcsePzzke
 knevUVW/pA7FHKwa6Nfapi3B85swaWIPfbsU/3PKPBJfoR2cQuK7QlubEiL0mb1mVIwl6wlI
 peaaYCnCnNyIaBmyiemAv8Uy74wzQggym7JA5P21RKq1fyZfnH9Ya8MLV/Icek96biArRT96
 NdRNtWHjR5YVYXWeiDT9IMJBVwDJ3I2AYywoMtSHsaHIwx7CCQ7CuTa35slepd5hOJUkOnS9
 32wU0Mez0Dw7VXCIB+JLGp+dLfmW5pXpGg+eycrOD6AwHEpe4+35aE3fp4+b74hsudkyJZcS
 vgGdsGED+VnTzXM4TMGapfh6odlcXyDiQ+KOye/SDc6b9hsSmTh4Nj/ZU339CgKDzKsss0Wp
 Kep3QfWB5EEQmxKCMfQdeKHxkm0uXkbhfI0WFHHZMRQEG3m95JrMGr2leMtJN8XKgTrwSGT3
 AKbRxwfoIHlv4Ax4PHNhKaZs52uFepuWEZXd0Hf7LCrJWzZ83ClzItoTumFZ3beWXny9aHkY
 v9ap9nwL/gYxn5LtYRmGrpmxK544MHgz5dKnlpMH3jRaVmvTLR6LRGu19NAu7dW2pdWvAK3X
 gSE/dwyEbyTOsrjOFoQIhc1KOWFyfwQ3DLV6JwdOE/94j12+ruvS0hePxCQzidaKdNdII4jh
 OsspsMSwwi+kQYxdMaLiDhO8GaBJWBGVL8o3rkCCZLvjwEo4lJPe5rRDmnx+p7nQ85BO08oK
 Rebg63Ng7kazU3HG1I0EXXOxuNbiY4mvhlWxVsPIVeO3NzMg/Jf9AVU/DIlQwB9yxJD3O91f
 G1zOAt5KM2m8C9pj8NEW2GEGg5IAByQvEf2zjMhkHDSTUCuEGjQJ280P+GT1E8c+mNYODNc+
 dmw1X3sVD+sddvw0AM4SFJop/XlRtE3/QrH8OilEN6CBIISeif+j+mlYm9ggwfnBsY4nwvDq
 O9m9e1zeIXyMCJWqKo+Y6GWyrEPYBmBLX5FR7dq++UUHgnhlCqa3DGPLwW7fJxLLvmTqUugU
 ZU2f4RISgi00zuIonYDH6kQLrRonfkvot0fZrfsIm1AuLyaxtZ0jK/tGuHFrDdDa71TfQwVc
 +s9qxrq/rSsuEZp
IronPort-HdrOrdr: A9a23:acvBjqoRXn9NRvA2wqBf36kaV5o8eYIsimQD101hICG9Ffbo9f
 xG/c5rtiMc7Qx7Mk3I9ursBED+ewK4yXcY2+Us1NWZMjUOyVHJEGgK1+KL/9SKIUzDH4Bmup
 uIepIObOHNMQ==
X-Talos-CUID: 9a23:CvMr0GFKcSSFZQaoqmI75VALKskubETElm7gc0WVCk1naoWKHAo=
X-Talos-MUID: 9a23:9s8+yQiu6Euz42IUKptd0cMpbvd6v76uGG03oc8k5uOFKgI3PRiNpWHi
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="109017135"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2023 12:57:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgAsgsjHRP7EACn8XdeluJuZnDeCrbDFUNWSYrQwf9EWPvc2U3QCpNuZkEIaAaJj/uBf1y9LRIE73ZY7Aa7OmpVH6obv5AWBqMG9ftapYrjxF4Q6gJnZ+a7FnX9LxPqeI7iebPZUFW8Ef9uxf1hC6JHIYOgO8XyZTZUcnO+yW7L6rFKvwUPu+nspeVeL7Sswf6cm1CW/YRkZPw/NsQFll+LUq0uKqJSB2zM57xarS2E7XrASFjbUhMEglGhyzHy//TXZzT+PSZ6BVvngatGOjkMHQiHCDkxCKIZGVWgOQWvAq9WTsRgfVFOjyEgNI9SiA5EVGjNnAsdy1kUPw9Btmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jG1556UdD29OJoaALVIo8wkISlGBR2/HX2MVx7arj5c=;
 b=kSMIAT5FgOyy4xytPuQDWzmb3Rxu0rGzlOQnZKImPvpD4yOqcuAnCAUA7NXQ5i4ybhNq7WVpZCgpBKlAauA4n5LgJUJ3pwWsi1PNXb9W6/zP0ouxAc4HFaMo/mnICeRovvH++Mo3eX8JUqxUF69adhCOZ5w8bM7j2rUtpkpZYeh+6eHX5OMTVc1aTT8WUQv9XCSIiMFtv1eix+OjpMjGZdJRH3WIyNNmMu/it4xI1bv3R08XGO7c4+EXNmcaRqnxxWac8FbTwnpHI7HLmV4eoYNjdUNqzKcIDylmbQEFVHZpcv2EPHV05SeUy0OlBfhAMqCUFG/Y0r/ekMqETzZFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG1556UdD29OJoaALVIo8wkISlGBR2/HX2MVx7arj5c=;
 b=cZheZ+t1tSj8VzO8OZt7FcFuNNuVvMq4SA6YzUM0neC7cE+FAwECBmiQLtbBIW8+/T3qo5kjKnq4hsntqwwMY3RIyVNL+GyOy9O26OvrqMoGUfD9Dl2MEiMh432dLemuLL5lrEXItcdUlyJYBuPxVpq3Ft0zfQvPWHmqPNdELDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6094.namprd03.prod.outlook.com (2603:10b6:5:395::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 16:57:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:57:24 +0000
Message-ID: <0cafbfcb-2430-6d90-ee77-4e5de08ee1da@citrix.com>
Date: Fri, 19 May 2023 17:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [patch V4 36/37] x86/smpboot: Support parallel startup of
 secondary CPUs
Content-Language: en-GB
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Cc: x86@kernel.org, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.411554373@linutronix.de>
 <16562305-3bc0-c69f-0cb5-1b9da1014f19@quicinc.com>
In-Reply-To: <16562305-3bc0-c69f-0cb5-1b9da1014f19@quicinc.com>
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ddc14d-f273-4528-925d-08db588a1e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GjmgoYUTqj/Sd8j+X8Ukj3pgab9QdV62vErzk5ym9iN2Uf/PyaeO+URIyI7XfwP97AXUTe+wehrYaQZ87UynaPBB0dMqIPH34hcxXKI/YNdg1W+CLX9F38w0lfwcIKNqclUyErBvK3sjW4kEmwIKLlXIyPs13AHppWDDmJLcmdU9mAsA22ba7i8ubXgwhvpSReg/L5+kujgBxLqa60r49ZUtuYHyqV+wm7W6lbV5wbeoZPFskB44CgsOybE0WZ9zB0ChtsbbY6CWi3EdeUGZD6HU6kyPLk8GKVnyOZ2v7JIffhHeS3BW6d1KgNHQRp5LV8aNupLbVvPJ1g3NY28gb2fENql29EBK4Tv97KON1ACnfRlumGBLaUYmC5yYWxjOCkAdwtPQSSf43o41wJ7wBYkBEE6pzPTge+j2g/fPrB9i3nHEBQW5epoGDkKzMMQUD86i6bYWx50rOfuNGU4AvhJQ99Zo77CWgnMcBKdBH+h4jNh6kdoGD0gSklSrwMOXY4hjji1/B/7eNSjgb6ujy7ihZQkMtHhVSPR1EMPEwIGxQzP3WVH6O1ORSbfATPIo2DF9r3ZEH92zcVpHZn0EfPV/UgZb4sIHOlm5Kz01Q02Wg8Z0aRmlsftAaXsgCu82LONap7y0yDzFSzcdYgbmSQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(2906002)(316002)(478600001)(41300700001)(8936002)(4326008)(31686004)(8676002)(6486002)(7416002)(110136005)(54906003)(5660300002)(7406005)(6666004)(66946007)(66556008)(66476007)(53546011)(6512007)(26005)(6506007)(82960400001)(38100700002)(186003)(83380400001)(36756003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YzhITmZnYWZQajlHRkJmb01TZy85ZTNjaGprNlBkQ1ByM1d1bUVuYmxHcXVw?=
 =?utf-8?B?akc4aHlXM0N1R21FZHZTWE9VcEZGc2FObjlHRWdxSFIzUENva2JOMDFnTW54?=
 =?utf-8?B?SUh3RWoybFRsREpZb2NRZVV4RHdnbWp2eVRBdHVFN1lvQXhvVk1LRGV0QnN6?=
 =?utf-8?B?NDRNTVBkSFZtaGRiWDF1NWlaQWZLSkJka2NvdGNrdDVsUE5kdGlSNXRDMXZp?=
 =?utf-8?B?amJvZkUxM1dESWpqN0VXYkw0SWpRMkJhU1lNY3lyVUdkUEUxelpNeTNIZkVa?=
 =?utf-8?B?SDRlMUE1L3RQUTZpSVZCN2NBSk1kdFFFeU9HeksrT1l1WE4xQjc0dFJsb1Ew?=
 =?utf-8?B?VDJyZXFUZkw2bGVLcThndGtsL08xMHZodWRienVldG95UXlGYzVkK1dVL2Vs?=
 =?utf-8?B?RHNGK2FkWTAyaU9Dc09WWGdxZkNBMnY5NEh3WjBEVE1kbjQxQTRNcWRjOTZN?=
 =?utf-8?B?N2VFM0haaDFoVVZVYXZjNjJQcmREU09zNTFEeUlPbDFLYlFhYWhIUzFxZ3NW?=
 =?utf-8?B?QVAzVEZjL05IbE5TUUZabml0WFJ2UkNqQ1ZhVFVNeFFQZ1dHb0pvbkdHQ1hT?=
 =?utf-8?B?WnFmMHR2RE9mL0ZFeGM3bzI4dU54aEh0QjRGclpnMnYxbGJta21uSEMxWFd4?=
 =?utf-8?B?dWZHVkJjbGxiT3dqck5DR0pkczNJa2NuRm1TWGNoQ3VyVHdnQkgrNURvUUZB?=
 =?utf-8?B?Q3c3T0tlRzhlcTRYOGdXbUZyK21HTEI3Q1hRS2FXb3FNNW14Z0tGazdKOWVz?=
 =?utf-8?B?SzQwamVLRHJaU2lETUw5V1A0aTJmYUJYVjhKem0zekJxZU1SQkhVNm9GZGxn?=
 =?utf-8?B?UG1XUXdBMTQzODBEY1JqZnJyTTQ3djZJbWNpQ3hGN0xpTzFJRTUzdVBuakRB?=
 =?utf-8?B?RktremRhNm5uL3lDNGtJa1Juc2x1SWFueXcwajBIdkFQZG00TmVzaGtQNjdM?=
 =?utf-8?B?bUFZcVpTcWhick9ubzRjWUtBTXBDQ0x1aGM2Y2RuODdRNzJsa0hLY2MxdllY?=
 =?utf-8?B?Y05VNUxEM0NYc2VHYXY2eXp0R1A0KzRVOUR4UGJUcVduelcwTmpXYTJkb2lh?=
 =?utf-8?B?NzgyL3BsSTdlUzliQk9HSk9FaXMrRi9sR0draWxRSzZhNXZtNjVJQUkydHlD?=
 =?utf-8?B?d3ZNTGYwbEFxQXhjSWxzUzVQVHJOQzlOejdHcU1WWUZ5aGUvLzFnWDFIV0NN?=
 =?utf-8?B?ZGJVeXJVbHZnODd6ekhWWS9LQnhyTmVWN3JXVExNYlpmTmlicVpYLy9IY2xa?=
 =?utf-8?B?MGpHNjJoRjhCMXFrNW5Kb0xPQ0VtdDlDbGlvR1lRNUhwOXIvaTNyWklVMyta?=
 =?utf-8?B?S1A3ZUJxNWV3U1RWMTU3cXI2cmJseUk1U21lamV6N2huWU00QzAreFRmUCtT?=
 =?utf-8?B?NnNUQzRLdXQzVWtiRk5sWkdwbjhkcCtsRVg5N2JmUUhKb29hclVDMmxONzkz?=
 =?utf-8?B?U0xtNk5CQnNNTFc1a2dGVzZLbkNUaUFsaVdxNmVPUHp2Zi9wMDZUOCsvbytk?=
 =?utf-8?B?OTdVZCtPMGRNaDVodlFKNm1nbWJwZU9EQTdoQ21DL2JwWXFQUlY5c0xWaDRP?=
 =?utf-8?B?b2dZSW9VUDI4cTNFdTRQVHF1Uy83WjJZdjNiRDFqQkRPb3lOeHNaTWM1cExZ?=
 =?utf-8?B?WHJpeDRvNzJLQWMrT1pxcWs0WldKMkRIUTVPQzMxMXBjMHBWWUMyN3RVRnZF?=
 =?utf-8?B?MEFzaFEzeEJ3UWg1bmJyKzl4bXI5YnQrNXRjNzY3dWMyR09oQ1ZjZUNVRlVw?=
 =?utf-8?B?N2Rab2hYWFdYWjFwWE9qbmNLWjljUUtzM0lTd0tMcXNGKzZpN0pSQ3BnOHM3?=
 =?utf-8?B?V2FBVjgyaXcvdzFObC9rc0dQa2ZZUkVnbTgvMG5veXdpYnlIZHBzMCtYZDNW?=
 =?utf-8?B?RUoyK1BKSkhtQllCZ3hRc2Jvd0xXbCtvWHdtVzNVWk1xS3pIVllQY25tWkZh?=
 =?utf-8?B?L3NUY1J1ZHlUVVdwaE9xZEdMS2NwQ3V2SUkxRVlPb0szY281VDVtams0Zktl?=
 =?utf-8?B?Q25xUElLSGpVRVlSV21pZWVvUWZqYVRDQ1dUZHlBMllNNGhBZnJwL0dNeEVp?=
 =?utf-8?B?L0NWSkY3TnQrVjZ0czVVamRtVVh3WDhzMlgvUmo4SlF6VExxYTUrRVJIdmRk?=
 =?utf-8?B?RVZTcGpUaENJMnlvMlB0dm1Fc2RHVkxHWFUrTnJNL3h6cnpUZnNGRi9iQnJR?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?L29BMUxkUTl1RWYrSUxacFdnK0xYdWVVRkV2RDVmUkJOZVFTQnNkQ0k4Rkh2?=
 =?utf-8?B?VHAxS09MMVlPOXZlSnVHalE0ZHlQMGp1a2FEWDZVeGxIZUJhbUtMR245TVBi?=
 =?utf-8?B?RUlidkxRSVJPcGZWT2NCaVNta0pNREY1a0xrZjNjSEFQSGwyWUhLd3FOQ2px?=
 =?utf-8?B?MTZ0UXFRSzBBTEIvWEk0WHM3cE82Z3BnOFF3V1QrYVdYTUtEekR1MndWVXcw?=
 =?utf-8?B?dzc5RWQ2TEI0TVExSGxVTXVGTHJZWlhVaHNsUWZpRFI3UG4rR2VOWVM5akZm?=
 =?utf-8?B?SnVIN3lxdVhCcEtENE5GUUxzU21xZjJVUGRmQUJrcUN1SG5ZODdaOHlIeGVF?=
 =?utf-8?B?Yk5aSUdOWk5tZEdGdlljcGdUQWc1RHN6eFpKYlBqbngvcVFDbVJGd3lRTXRP?=
 =?utf-8?B?ZjF4Z3ZERHlSem9lVFRCR0pHd3dRenMwVEpFSzk3elZWd0duNmdrc09XdXRJ?=
 =?utf-8?B?TGVzbERES2pFdXArSkF2ckxZNDdSdlc3VHFTck1hS0wxQTJObjlxaXBwdUNW?=
 =?utf-8?B?dU1aMEx5NU1jdm44QTAydTMwQUdaR1hwOU4zNnpmbTVKL3ZGS0pjZHYvKy9M?=
 =?utf-8?B?bVJEUStWVUx6V1RBVjRnUmFHYVE1T1hwU2dZZ25scTE2QVViZHZRRktrNVA0?=
 =?utf-8?B?dzdqUGZPOURXMmhGWDFpQlVqVHhaQzhiQUV4bUlQTWtQMElLVUVqNEY4VFll?=
 =?utf-8?B?Y2xJK25NRmJuYmk0dWJkSmxDYXhOZXpFK1N2Qk5LbHRPanN4K3lHb1c2UTY0?=
 =?utf-8?B?N3BmWTBXT053cE12SGpVTkI4cmVmT0RlTzJqNHZ4ekJJcSswM3ZKZGZQNVY3?=
 =?utf-8?B?VElkMWp2c1JTNitDWFpFOUVUaXdsMkZ3Vks0T2NIOGVOMGVNV1ZnMjlJWHEz?=
 =?utf-8?B?Q2xYMitJZ0UzT0pOVWRFQnRBSEgrMURtRFdoZGNZTk8yUEVzU3I1RVhmMGg0?=
 =?utf-8?B?RTVPeS9WcHdsVmJuSnlncE15OGg2ZnBEYnVVUVhJZkFZNWZJUU00ajJFeGxk?=
 =?utf-8?B?RXdFWU8vaXhyalg2RnpUMG5LSWh3eEhWN2Z4MHR4aExab0F6WCtzcGc5YzBE?=
 =?utf-8?B?WWROczNXYlVxMVhwWmg2ZjdEYWZISnNtZ2F6OFc2S1V1eklrSU5NNlFFSEwz?=
 =?utf-8?B?THI1V1VqTVVOQ0c5WkYvN1N1anRtVERoeHNsVjhOQXo2d3BDYVduRTVuYVpW?=
 =?utf-8?B?UDg2VmhIeFNESzRPRUlkcm9ZbWM5YmxSUEJpKzNULzk2NHB0MjlFTVYzNkpm?=
 =?utf-8?B?SW9TcURDdFRNcWZncXFVdzN3OU1QZzlIQ0xsMFh0dWpTdUh6VXZlVFdOK3k4?=
 =?utf-8?B?K1I4N1NON1lWeGpUelFwM3E5QzVPTDM5bHlyNVFaVkxRVklMTjAxbm56TEVE?=
 =?utf-8?B?SXhMUFk5ZThJaEVNNnVSY3d6OWh0TlBoZXJmSzQzbUFTMVUxeWM0V29Ia0dr?=
 =?utf-8?B?Z2U0WGhibEpGYW9HeTVNd2l5QVJGODRPbDNDN3B0S1VTc094K2NpUDRqamFm?=
 =?utf-8?B?K2ZXLzdrVGtUWWtick9jNVZZTk9KSE82bEhFaGxqanNtMml1TkR1TnduV0VJ?=
 =?utf-8?B?S3hDTEhmWWh6UTVXSmg3b3Nvd25JS2VNdSthNm9YWXI3RXJxQnZxc0RGL042?=
 =?utf-8?B?YlJNOS9hdmVqV2NEbkhnTHlYV3V6MllHKythd0ptMUFDbllTbWdGNE1SR2t1?=
 =?utf-8?B?UHJyWWRtVEFFUFhKT1pZMXlKSzdJUVRReUlwd0UrK1MvN24wR0NZUGFxOFJC?=
 =?utf-8?B?SDNHM3ltdUQ1dUlERjlVYnJiTS92MnVVRTdHOE45NVhDS0ZuM1V1ZGgzNVNk?=
 =?utf-8?B?S0xycmNzV1Z2bjBHUW9TSDBkdGJOTEdqbnlhNmRqcUlXWTgveFlkOGNBcGcx?=
 =?utf-8?B?cDZMVThOWllQTlNiUzlIV1R1ellmUDA2bWRSMjlsUW4ySmtlalJ0TmVGTXY4?=
 =?utf-8?B?bkprb2toeE10bmxnRHd5dGo5TytnZ2hvNDd0SWJYYzcvQWRUY0VFTklQbDR6?=
 =?utf-8?B?a3FUQnpGYUVMZ21maDRMVnB2cnFZVC9tZjlLYTYvaXhMWUFkNUl6ZnE3YzFE?=
 =?utf-8?B?L1pzM2FVKzJaODVFYWtaQU15Ry9USW1tajJEUWEycjlFR3poSlM0S2lWZnFT?=
 =?utf-8?B?M0hwS0hEZFk2R1JzOVNBZWRDK3hDaytCNEdLZDdJQlRCSytROEhBaFBHd05S?=
 =?utf-8?B?ZE56c2V6R3B3aE0yYkpxNms3OTAyY09XWFJTWFF2VVBuTFBXQ0ZqRHp3R0V2?=
 =?utf-8?B?VnRMVWNIbEp1MENnS1VpYWkxWGY5MzM3WlROWlNDVEpFeEJHaUpxMHdlNXVS?=
 =?utf-8?B?dTFmaVpBQmFVb1l3RTdmcHVYMzhBMjhoUXVZdWwxZERTaE9xY3V0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ddc14d-f273-4528-925d-08db588a1e69
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 16:57:24.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA7o/o5FRMYXgF7+HJQsjjD6oFRqFrjubLB/IOEu4eWMa4HGuq+mqx21q5OL9JS/+A3v0qUIiGguLhwBCLjoGM9OLw5zEtHveQM/AJQhTac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_095739_032875_15BF7F92 
X-CRM114-Status: UNSURE (   7.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDUvMjAyMyA1OjI4IHBtLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gwqAgREVTQ0VORCBv
Ymp0b29sCj4gwqAgSU5TVEFMTCBsaWJzdWJjbWRfaGVhZGVycwo+IMKgIENBTEzCoMKgwqAgc2Ny
aXB0cy9jaGVja3N5c2NhbGxzLnNoCj4gwqAgQVPCoMKgwqDCoMKgIGFyY2gveDg2L2tlcm5lbC9o
ZWFkXzY0Lm8KPiBhcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6
Cj4gYXJjaC94ODYva2VybmVsL2hlYWRfNjQuUzoyNjE6IEVycm9yOiBtaXNzaW5nICcpJwo+IGFy
Y2gveDg2L2tlcm5lbC9oZWFkXzY0LlM6MjYxOiBFcnJvcjoganVuayBgVUw8PDEwKScgYWZ0ZXIg
ZXhwcmVzc2lvbgo+IMKgIENDwqDCoMKgwqDCoCBhcmNoL3g4Ni9rZXJuZWwvaGVhZDY0Lm8KPiDC
oCBDQ8KgwqDCoMKgwqAgYXJjaC94ODYva2VybmVsL2ViZGEubwo+IMKgIENDwqDCoMKgwqDCoCBh
cmNoL3g4Ni9rZXJuZWwvcGxhdGZvcm0tcXVpcmtzLm8KPiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjM3NDogcmVjaXBlIGZvciB0YXJnZXQKPiAnYXJjaC94ODYva2VybmVsL2hlYWRfNjQubycgZmFp
bGVkCj4gbWFrZVszXTogKioqIFthcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5vXSBFcnJvciAxCj4g
bWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiBzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjQ5NDogcmVjaXBlIGZvciB0YXJnZXQgJ2FyY2gveDg2L2tlcm5lbCcgZmFp
bGVkCj4gbWFrZVsyXTogKioqIFthcmNoL3g4Ni9rZXJuZWxdIEVycm9yIDIKPiBzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjQ5NDogcmVjaXBlIGZvciB0YXJnZXQgJ2FyY2gveDg2JyBmYWlsZWQKPiBt
YWtlWzFdOiAqKiogW2FyY2gveDg2XSBFcnJvciAyCj4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KPiBNYWtlZmlsZToyMDI2OiByZWNpcGUgZm9yIHRhcmdldCAn
LicgZmFpbGVkCj4gbWFrZTogKioqIFsuXSBFcnJvciAyCj4KPiBUaGlzIGlzIHdpdGggR0NDIDUu
NC4wLCBpZiBpdCBtYXR0ZXJzLgo+Cj4gUmV2ZXJ0aW5nIHRoaXMgY2hhbmdlIGFsbG93cyB0aGUg
YnVpbGQgdG8gbW92ZSBmb3J3YXJkLCBhbHRob3VnaCBJCj4gYWxzbyBuZWVkIHRvIHJldmVydCAi
eDg2L3NtcGJvb3QvNjQ6IEltcGxlbWVudAo+IGFyY2hfY3B1aHBfaW5pdF9wYXJhbGxlbF9icmlu
Z3VwKCkgYW5kIGVuYWJsZSBpdCIgZm9yIHRoZSBidWlsZCB0bwo+IGZ1bGx5IHN1Y2NlZWQuCj4K
PiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBjb2RlLCBhbmQgbm90aGluZyBvYnZpb3VzIHN0
YW5kcyBvdXQgdG8gbWUuCj4gV2hhdCBjYW4gSSBkbyB0byBoZWxwIHJvb3QgY2F1c2UgdGhpcz8K
CkNhbiB5b3UgdHJ5OgoKLSNkZWZpbmUgWEFQSUNfRU5BQkxFwqDCoMKgICgxVUwgPDwgMTEpCi0j
ZGVmaW5lIFgyQVBJQ19FTkFCTEXCoMKgwqAgKDFVTCA8PCAxMCkKKyNkZWZpbmUgWEFQSUNfRU5B
QkxFwqDCoMKgIEJJVCgxMSkKKyNkZWZpbmUgWDJBUElDX0VOQUJMRcKgwqDCoCBCSVQoMTApCgpU
aGUgVUwgc3VmZml4IGlzbid0IHVuZGVyc3Rvb2QgYnkgb2xkZXIgYmludXRpbHMsIGFuZCB0aGlz
IHBhdGNoIGFkZHMKdGhlIGZpcnN0IHVzZSBvZiB0aGVzZSBjb25zdGFudHMgaW4gYXNzZW1ibHku
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
