Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B201C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:Subject:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZ+eddS0lUkGkgrearTufP1woLzwfB1Uf8IvwHLxz7U=; b=pSPIfPf+8RIrmq
	8pjIkia7fJ6j1sybdRk7zZrYYf9uWCrqy9yN8a+Y67Yj5Se08OsYuW+ruGEr43OTcGfuhhU1pjmkW
	Ka5wc7l32VUHYqZjrqM0QcZbgpFEqanznggk//orMRZxyCSIZB3xG9VuAt8i/ybmYhgOyfqfEzXVI
	Q+R5RZqB/KVwTKiYHxbU1S4KCOKUnVVFsvqHUJ8VwSv+msll7y84Cz8YpwiCONIhd1cDTzDgBxDLF
	mfYZtLZLbwBzz36jL0xumywU12mo360dWdPyJsk+7mHCARFeyNTlUPS+9BupYUpt0hHyx2kA4qZIF
	j/3kVbCf2Eb1VllR2m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQWJ-007Wtl-0s;
	Thu, 20 Apr 2023 09:24:03 +0000
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQWE-007Wq7-3B;
	Thu, 20 Apr 2023 09:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681982638;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ce9f+CnsLS53jZdO3yENs/I6TWQ0Bpki9dH27jC8ao8=;
  b=YbzUTfsqS4VKCftDZpRqGQTHseR7cfPwhFqKT0839Bowm0DRUm44omsw
   E7+zsESJQ8drf00jNYyakoPC7cCFjuS2nwyO9p/hQd+18/3Lqahxqc2A4
   9/jakkPzBiYbfovscPIq9BuAggvu/YkhSRmdSdLK0GXHUKNmtS/zjNnWb
   A=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 104989347
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SFMPd6JLUPL5dWIGFE+RF5MlxSXFcZb7ZxGr2PjKsXjdYENS1zwEm
 jceD2qHa67ZMWf8Kox3aYu1phgC6sLSx9A1SVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c54MEwQz
 6wFCgsvRUChvsaZwoCSYdRz05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX+qCNNJSOLQGvhCoR637DAfJzcvWHC4htCViHyBWNFEN
 BlBksYphe1onKCxdfHhUBmoiHqFuAMAQd1WEv185Azl4qPO5QqxD3ICQjQHZNFOnMs3QyE6k
 1aTmpbqCCZpvbm9TXOG6qzSrDW8IyEZIGYOIygeQmMt6ND/qYUyiFTKR8xiFqeuptTvHHf7x
 DXihDc/g7E7jsMR0ai/u1fdjFqEqYXOVAMzzgbaRGSo6kV+foHNT4ip70XLqP1bL5exUFaMp
 j4HltKY4eRICouC/ASJQeMQDJmg/fOBMTvBkRhoBZZn6jfF02K4d4df7TdyDE5tKsYNPzHza
 UnQtAUX6JI7FFmjaKJsJai2F9gtyKztBPzlX/bPY9xWa4JtcgKd5yFvfQib2GWFuEQhlaUyI
 7+UdNbqAXtyIaBmyiemAv8Uy74wzQggym7JA5P21RKq1fyZfnH9Ya8MLV/Icek96biArRT96
 NdRNtWHjR5YVYXWeiDT9IMJBVwDJ3I2AYywoMtSHsaHIwx7CCQ7CuTa35slepd5hOJUkOnS9
 32wU0Mez0Dw7VXDKAOXejVmaav0dYhwoGh9PiE2O1usnX85bu6H/KoZMpc6Y7Qj3Ohi1uJvC
 ekIfd2aBfZCQSiB/C4SBbH3q5Zjb1Ksnh6UODS+YykXeIRpTAjEvNTje2PH9iYUCTGsndAju
 LDm3QTeKbIbQglkHsvSQPeoy1y8uz4YgO00U0agCt1Sflj8tYtnMSr8itcpLMwWbxbO3D2X0
 0CRGxhwjfmd/ac2/cPPiKTCqJ2me8NyAU9FRUHa67isPCXX92blxpVPOM6CZz/QTnjo0Kqnb
 ORRifr7NZUvlUxIuoxUF7dt0LJ45t3zqrscxQNhdF3TZVOtGLJmI1Gc0MVPv7ELzbhc0SOuU
 1+L/9JZEbaEIsXoFBgWPgVNRviD0vQdgX/W4PI5KU759Qd++bbBWkJXVzGXhSVbLrBdP4Qiz
 uMs/sUR7mSXjR4nMc2PiCxO32KFMnUEXqMksdccCYrm4iIk0lBJapvYCwf375iLatwKOU4vS
 heQmaHAjrIawlfJcXM1Embl0u9UhJBIsxdPpHcOOFGWstPAj+0w2lta9nIqTWx90w5O1us1M
 3JqOWV/NLmD8z5uj8UFVGepcylEDQeavFbs118AkmHxRlOtEGfKKQUVIu+H5kkB+mR0dz1S7
 raejm3iVF7XkNrZ2yIzXQtvraXlRNkprAnawpj7QIKCAoUwZifjjum2f20UphD7AMQ3wkrau
 e1t++U2Yqr+XcINn5AG50Ch/ex4YHi5yKZqG5mNIIth8bngRQyP
IronPort-HdrOrdr: A9a23:AloMBqEVX6uaRyLQpLqEU8eALOsnbusQ8zAXPo5KKCC9Ffbo8f
 xG/c5rsiMc7Qx6ZJhOo7290cW7LU80sKQFgrX409+ZLXXbUSiTXfxfBbKL+UyeJ8SGzJ8i6U
 4DSchD4azLfDxHZJ3BkXCF+r8bqbHtzEnrv5a9854Kd25XgspbnmJE42igfHGebTM2dKYRJd
 6z5tdnuzHlQngedMK9b0N1JdTrlpnklI/GfRVDPBIs6BCPgTS0gYSKaCSw71MxUy5v3bxnym
 TOkxX46qK/99m3xwTRzXW71eUnpPLRjvVCGe2RgYwuJjLghh3AXvUYZ4G/
X-Talos-CUID: 9a23:mCHzfW9H033Y8EzIA8CVv0ElN54fImD/91X7c22BLUlrepS+dEDFrQ==
X-Talos-MUID: 9a23:bwBM/wmU9rlqbROVW6LxdnpDd+NCv6iBInkAupYhkuWGBxNzOCyC2WE=
X-IronPort-AV: E=Sophos;i="5.99,212,1677560400"; 
   d="scan'208";a="104989347"
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Apr 2023 05:23:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8zMb1TeH0nTGsOqgxOcBW/OkfBLU9jZToa9n06L4+pXVJyugWtVrKR1NzOSyNPulzMLxmj3Nl9Y7UzxePTNfN5xtKQlDwPBrXU/I9HKR24YHd5zheFk9eBB6FUd6TRu8Y+tnRivav7t7XybMPC+05SD4aFsboAvPMxXrtjPw26VviDIpdS9FUj/GPKzrub4ZUJ3fQBf5SmQ6zaV4qwwZt9xgePDXJd93Wmw7Jekr3OqMzXiRnTp+jAhtUYQJ23JZpWZwfh2JUmWh6Bc5bLw8uoJ4Q9fHt30BD//ZMV4jExj6fN8+tNNcezdCTa8XGkA+qqKD+QW24gUMpyqenBFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce9f+CnsLS53jZdO3yENs/I6TWQ0Bpki9dH27jC8ao8=;
 b=ZoTTQMhs8A7za5eh6A4o+MhURcLRJClCY6aEVa6qO4dlX0N8JyuZKJdqMAs6iiaLn8dUGkU4Aak1cxqxrQVMTCZjjXEVjN/owGkKFl+E7PAqmTm/VNhTUTJwshcY74XgUWx+7QPFUJPkohqgeEUyiWQ6uFYCgWmKzpujfrRTRk1TRB+xtphSPFlzp7qbNQ9oPN5eZx9+wpxdXC5fvSqgnfR7AsthAnMu9AkE+Udf+5DwwRWEnG3kAQQaQzySp6u2a6RLGgk+V0Mj9DD2YD0Na0vZ5yU2vaVCtsPIouzmqFvdtDUhjxRpEY78qW+DzkNhzpIqDb3v+AZ/+Fw0DyOCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce9f+CnsLS53jZdO3yENs/I6TWQ0Bpki9dH27jC8ao8=;
 b=sA8uCbdOP9XJGurAi8TGLTXfoUPnjTvu6Si1chW8lR35ta2B+jXx/9MZauL5TPDWT5ebOtLgUpmUAjWU6xNmFr5oDWJ9H7fV/kVxa9o76JV4bAIVbI7hGT4MU3g3j2pNEIAPYvous/ftqGRK60Jy2gBH0Sh19CclgCKpB6H21Gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 09:23:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 09:23:46 +0000
Message-ID: <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com>
Date: Thu, 20 Apr 2023 10:23:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-GB
To: Thomas Gleixner <tglx@linutronix.de>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E. J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
In-Reply-To: <871qkf3qek.ffs@tglx>
X-ClientProxiedBy: LO4P123CA0045.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c06dfb-e80d-4c83-676c-08db4180f135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DNE5Kxb3kN4KxzASBMFzvw/oVskXMxqM9vYq4/6hHEl2Bt/4Mh3pI4iKdhv8eaDDVWxkwFN/cNYCe+qQ6GFsTKY1TKuqjJXLzmvrccVoq0K7ZSyMVU09kQcPhUASpFomx7ETStiviGVI1b4SGtHvWIhkjpZipeRbH9JDvWHVkGm49bVhe7N6N3iAqLIgeaooV/fxFYigw22EVm7NfjvFNL2t90ID/Qa4/n5O2u/nZLgk8xsrfVilFSPsDQpua9ViltcaIzG6GQnr8L3Vld5T+q89w27gTW8eH22+3iq2uq5+2QTiHMGd2YZ8cnNWovU+MQq5TBPD7UQSuj2oRpeq+i39Tu7qiyozRY+QDDMcbLqiRvUODDrwXdxRiydPDDDilYp0+fErHlcx9aMxfy8ZcmDzQMcgDqu+zfPxJnA9FeapV2l/3GG7wrz5ZeRB0qNM6fH6+W4LRAZeHvi1T7M3/Ynq7zwA+2jyuT+Smkjb//tRi41T/2N4kATGx9eRo+rDL5rQ1zBxxCvAv6ESm/kdgwZKpmr+aKH/grF/kCBFxqY8Fk3qMBsk/rHTBDnjq0WQJ7Jag80oSxLpf+65xXrMJkeDrTTZaXonlAS+emgUPS8Nu/K1IFr6nLSM6h1U9DCpvBZP59waEz3xq0SgQpbDTw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(110136005)(54906003)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(6666004)(8936002)(5660300002)(41300700001)(8676002)(82960400001)(7416002)(7406005)(2906002)(86362001)(31696002)(36756003)(38100700002)(2616005)(26005)(6512007)(53546011)(186003)(6506007)(83380400001)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WG1zMWZ1b2U1NHFYSXY1UTRod09DQVZxS1BmVThlUlBoMFFCZDRMVXhJSU1I?=
 =?utf-8?B?emd0L3AwS1huV3ZkRS81YWVEMjViWFQ0elNKNHJRK0FtTEo4SWhMbVE1T3VU?=
 =?utf-8?B?WmVHMVZjalY0MUtqWjRhVTk4UG9TMHlLSzJYT1J1VVp4cTFkWndPRlJRQWtL?=
 =?utf-8?B?SFpsQjc4ai9DbC94ZnhveTBsMm5nYXZrOG1YUDB6T0pybndXWms4eDhxSHhI?=
 =?utf-8?B?eWNhWExkMGU1K1NKTGlKakMzSm54ckptVTh5bEVUNTUvb3dqbGtuc00yNTFj?=
 =?utf-8?B?cWt4YVFQN0FxRFc2NUhDSlZjMDkxaWZhR1lvSUVENE5sbmhJNkNEV3FUVit2?=
 =?utf-8?B?ZXllSWM0TG1sTEVFWllVSlpLUzJXTDVyRVhpZkkzVFZlZzJzeWhsV0E2SzFl?=
 =?utf-8?B?TERobm43dE5hS2pRVGZHbWNadGJ4K20yYUR2NnZLNjMzVFZiVGE1OXFJQ2hn?=
 =?utf-8?B?amZEdWZJalAybGE4RER6Sm5kazlYSDZiZE1jMlN1bHIzaDY4QW9rakJaRlNp?=
 =?utf-8?B?clViZGNCQWt2Q2FjaU82VHJHOGtsRG9MRTc4cHZuUWMyUXhNUmNIajkzUnpY?=
 =?utf-8?B?RnBwQ1N0dVd1ektUVU5hS2NUOFhudFhteWxOdFcyMndIcWxBb1JXOUgrRTU3?=
 =?utf-8?B?RGozc2lZMHhzbzIxbDNwdE84NkFwVVV0QTgrcy9iU2xSTGQvMDJYYzYydXZ5?=
 =?utf-8?B?L28yVldUYWJCM0tXZWJ3RXZpanlWSWJETllGSjRTSHRkQWFDL3Z5YS9JVXJV?=
 =?utf-8?B?cTdDdmxxcThmZDY5V2xtTk5ReHhXUmZ0WGVyMnBkb3ZLaW1PSThzdFhTL0RY?=
 =?utf-8?B?YVJTM0Q4ZjByMlE3b1VxT1dRZitnTHAyTTZnTXJlUWV6a0lnWllCU0h4YTN1?=
 =?utf-8?B?UWdLRFBlRWthQUV6dnE3K0N5dkpFZzZFZE5vaFJISkU2V0FlVHJsaU1xcGVQ?=
 =?utf-8?B?bCtSMEI3ajloWDdZSkFVUU5UZFMxR2txMThPTHhtY3B4eXJaZ0duUG81RE4v?=
 =?utf-8?B?dnZLdk9uc0QvYldDUDdqM3ZQV1Y4ZmVoRTlUa2ExZm8xM3JUN3pEc3lSUWsz?=
 =?utf-8?B?eTl4K0RKVVYzdzJIcER4bEtaK1dJUHk0ams4WExrd0lkbUc1V3VSUWc0ZmZ3?=
 =?utf-8?B?ekd1MmMrZjRrUTRNelNqcEFhZjhlZjFFMWNvUXo4SXQvSE9QckFEYkp4WlBZ?=
 =?utf-8?B?dFRFS2NUMzljOGcvR1lPSU9vQXNwc2ozd2xRdFpGQ3BMTmIxOWUraHB6R2d5?=
 =?utf-8?B?R0lnalRiQytwZU1FUEdRNnNMaW1RZGo1V2l4RG8wVWQ1c1M4RTc2LzRZSEth?=
 =?utf-8?B?MVU2MVlnc1ZDSU9DNDlKT3NXdCtBblpPTjhQOTBlNTFwNVVuenZHOHVwQXBN?=
 =?utf-8?B?UDQ4SUpiTVN4VE5nWXlqWEhXV3VQODhEdFVuR3FRMkhYMWM1YjBVQmFRQWNP?=
 =?utf-8?B?NEpsVmVxYm5aVlJWbnpHekdjMjNpYnM0OTZ5THdIbU41bDkyWHhOa1ZaNVdk?=
 =?utf-8?B?RGc3K3BVYjhUYmZ6MHE3UTZveEZMNnVYTTM1b0pPa3NlMFZ5Q2pjVEtrVWcy?=
 =?utf-8?B?QzQ5bmhuNEQwZXJRUkVJQVpEWS9RZ2l0UkwrNUcxejVVSk5VdUhWMUVjc0hK?=
 =?utf-8?B?SCtHRWhVekowOThid0NMMjVibTdBME92aDZOV0c4b21nKzVBZmMycTlxUTVh?=
 =?utf-8?B?Wk53U2dCTXNKOGdsMWhEdnZnZXFzbTY3SE1BbFo1RUw2RFJucjZhZUN5M0FQ?=
 =?utf-8?B?YlRQaXRKbXdUV0R0Qi9VOWttdVdGaThicmJDckVKeE0wV2hDOThmWFRLSmlu?=
 =?utf-8?B?ZVZaS29RN2o3ZFpwczJkb0tDYUtqZmowbk5XRjRaaytYL2VSRWd4RnVMaEIy?=
 =?utf-8?B?RldwbHA0NnpQTzJ3MUNFZnRYaHJvNWdBVjhIeGdOSzNabkVubE0xQndQODdy?=
 =?utf-8?B?K0YrQWcyWHQrK3pmWmlWazdDMXdJRFF4OXUyWTBOdEYwWWgxSXY0THcwZlJL?=
 =?utf-8?B?Zi9ZYUdBZElBWktMdUFuUjdvZDVxKzRyYm1vUDdMK3NOWVJsV25PS3VDKy9Z?=
 =?utf-8?B?ZFpaNm9UNmF5L0d6UUV2YmhQdXhCcXJXQ1I4Z3BiaEsxVGNTT0Ira21CRWtJ?=
 =?utf-8?B?Mmx2U1IxbG5VNDdWQldYdndySzdVLzNONklkUGFiZEVxb0p5UkpIN2t5ZjZo?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?SG9wdjZOa0x0UG9oWDl2NG0wd281QlR2VlIvc1M3YU9yWnJmTWdYSUtiUVdB?=
 =?utf-8?B?MjlDSFB5V2ZqTEFkTkk2WTYrVnV3UkJ4N21lZHpaK1NBNWs4L1VUOWN2aXA3?=
 =?utf-8?B?VDVhL2FtWDNqKzZpdnA2dytmMnNLWS9sM0JNdzNORzBlYWk4dWVXNURvelBy?=
 =?utf-8?B?OFBUNWF5Z0p5L2JBZk12dm9ja1Z1VjhyQWNXS0ZzNklDbFVsRUNOb0JURzgv?=
 =?utf-8?B?bTEwZG9yMDRXcXpmM1BQWUlLTXdsYzh6NGJVb29IL3gwUmJHUHJmU1hOcUtI?=
 =?utf-8?B?VlZDbzBrcU5laGdzd0dLRGoxUkRJWVh6eVlJeFlTZG0xM1RRay9EajBRQTI3?=
 =?utf-8?B?N0VwRnE0ajF4OHhGL0k0d1ZyWGY0MnZTQUV4V1lIWVBXMGlKZHRoTlYzVGpm?=
 =?utf-8?B?UVoxUlhZbnZQMG0wOVM1TzhmeG1XZlZLdWRDRFJoWnBBQWxuMS9ndUplVGcx?=
 =?utf-8?B?YnN2WW8xbURET0FxOWhzdU5tWC8rWjM1M2RzejZGbmM5cjJHWmxNZ2xiZjgx?=
 =?utf-8?B?ZlZJYk5GSC9PUTZuYktTcitjbzZ6eThUMTh3WUpWNExud0F3Tlk4YjdzdXUr?=
 =?utf-8?B?S0prT3VNY0ZlZWtTczZWUTRMK2d3ZVE4Tm1xWTluemNaemJVcytVYkdlVDZp?=
 =?utf-8?B?YlVxMkNObjF0UDNDVHVsWnlkS2pBWHA0SnJ0T0NpQlZsR0kyc2t5bU80ajUr?=
 =?utf-8?B?WHY5K2NlSnc0Q2taTTdLRUlkTXBXVzZLaVNPeit0Rm9pajlhMFhsK05kRVlU?=
 =?utf-8?B?VGtUaXdFZUQzV1RKR1VmdXp2dnJCUEFMYXNlcVdJNEFXZ3ZkcWFXWEltUU1R?=
 =?utf-8?B?ajlaVlFVS0graFAwcEQwdjVIZU5jRzhRdGdaeDgvZUpwbjI2cG5XTDFkTk9m?=
 =?utf-8?B?aFZvN1VpaTgyVlR6MGgyMXBqa0FLNEg4aEFTSCtrem1EWWs2TEZSY3JkQjE3?=
 =?utf-8?B?WkwzTG5sNDRlaXVUaHBnTzBxTWNKQnlvcmlkbHZQaFZIQzc3TmprY2ZCL3cy?=
 =?utf-8?B?Smw3QVVMTUZKanlEVUttYUxrdTNwb0FpZG5jbkpvVUg3WGYrdzNiZERqM1Fm?=
 =?utf-8?B?bStUV09mSU5JU1I4NEp0ZTkybkozWDZnSlJieko3UEtvd1BUZmF0YUFwNk8w?=
 =?utf-8?B?cWVGZ01aM2h3TW85d1hXM2tlcHltZzFZTzVuQkRPZzYyYTJzYTNtUmhhMzFi?=
 =?utf-8?B?ZXQ1NGplcVVPaDlua0IybHBWeEhCdUhmUThUUTdFc1VmbVRBL01WT1AyVWlD?=
 =?utf-8?B?RFVmdTNLK1VtTWI1MHhhYW1PQjVuNUxLaG9USngwSWNYYzErVWJNUS9YdFBt?=
 =?utf-8?B?aXNVMUJnUzhMbGsycHhvRXFuMW03T1BabkxydGRsM3ZoUS8ydHNxdS9hY3Z6?=
 =?utf-8?B?ZS9ya2pGZ0J0SHVrb05nNFMxQVVEMHJOdElucDdEaWZrdEdDTC9HL2g0a2s0?=
 =?utf-8?B?SUNyUGVZOEtjYk02TDJ0K2p2SkR5UTc1NmViSXF2K1V5a2VPQldJRmw1eVFJ?=
 =?utf-8?B?bThvTXdnWmlPS3BXbmltM1plUW9KVEV6NHJGNVZPdnBhVlpDWjBudHFhYkhq?=
 =?utf-8?B?dHJ1YUlUSkp0aWJsQ0piRXdLcFhQK3h2N1ozTjA3T21JR0doSFZyQ2g4UXNF?=
 =?utf-8?B?SlZheEpORWg4TncyNndvby90ZUV4NnF3ZHVCQVNUQVZJaDRhOW0wMVRYSFpm?=
 =?utf-8?B?SEFySGV6ZGVGcUxIM25KU1kvZzZqQy9ZTkYwdWJnV0YxanBYdkkwb3RGQ0Vp?=
 =?utf-8?B?amx3TmRrOUkveTNuOGdJSmUwYnpBQTl6aGJTOFFkQnlER2dwY1NObWxXOHgv?=
 =?utf-8?B?bXhEeDJFSmJTeFkyN0M3UTVsOTlJSkg0eVVJcmNKT05sYkNZOG90ZG1DM3Ry?=
 =?utf-8?B?WlgyZlZKbVByeEphR0paQ2hOc1lhTFl5RHVNWHZHNUVHQ05UQ2R3ejVFd2VT?=
 =?utf-8?B?azR4U0xRZDlpaGdZR1pHQXNDbEVua1VML1gybEowQ2lzeHBQeDhBQ0dKU1B3?=
 =?utf-8?B?SHlxdlliSHhOVUlITi82WUZuK3JQL0RyYldlYng5R0R0MzJnMVVVQU1sTVNl?=
 =?utf-8?B?Y21acFhLclhVdXpJQ1FSM1NNZXVuSmovRHI5Mkk3NzFTQjBQNUFkNnRBV0Vv?=
 =?utf-8?B?NU8vWmNQd3dJMkJGRkNuU2crdVIwWHdxZFRJVnVVUm95ZEhiYytDT2NQS3VT?=
 =?utf-8?B?R2ZzVmk0R2s3UXljV0o0bE12Z2lQTlh2VVdkbisrVzRiQjFHejRRTjBncXR4?=
 =?utf-8?B?VGJwMm9vZWFIa1NQcnJYamVacjhRPT0=?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c06dfb-e80d-4c83-676c-08db4180f135
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 09:23:46.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVW4+QNUut3bKt+RlHk7uwm9STvjt67GnuiJbjaNx98SkAxkANRPaoTM8k+2Zmgv9oTIvSvDl7PInUhl7VgaH+T/LQB6FyrR3MHivoUgfCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_022359_314022_B78B7C45 
X-CRM114-Status: UNSURE (   7.75  )
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

T24gMjAvMDQvMjAyMyA5OjMyIGFtLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gV2VkLCBB
cHIgMTkgMjAyMyBhdCAxNzoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDQvMjAy
MyAyOjUwIHBtLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBGb3IgeEFQSUMsIHRoZSBBUElDX0lE
IHJlZ2lzdGVyIGlzIHdyaXRlYWJsZSAoYXQgbGVhc3QsIG1vZGVsCj4+IHNwZWNpZmljYWxseSks
IGFuZCBDUFVJRCBpcyBvbmx5IHRoZSB2YWx1ZSBpdCB3b3VsZCBoYXZlIGhhZCBhdCByZXNldC7C
oAo+PiBTbyB0aGUgQVAgYnJpbmd1cCBsb2dpYyBjYW4ndCBhY3R1YWxseSB1c2UgQ1BVSUQgcmVs
aWFibHkuCj4+Cj4+IFRoaXMgd2FzIGNoYW5nZWQgaW4geDJBUElDLCB3aGljaCBtYWRlIHRoZSB4
MkFQSUNfSUQgaW1tdXRhYmxlLgo+Pgo+PiBJIGRvbid0IHNlZSBhbiBvcHRpb24gb3RoZXIgdGhh
biB0aGUgQVAgYnJpbmd1cCBjb2RlIHF1ZXJ5IGZvciB4QVBJQyB2cwo+PiB4MkFQSUMgbW9kZSwg
YW5kIGVpdGhlciBsb29raW5nIGF0IHRoZSByZWFsIEFQSUNfSUQgcmVnaXN0ZXIsIG9yIGZhbGxp
bmcKPj4gYmFjayB0byBDUFVJRC4KPiBJJ20gcG9uZGVyaW5nIHRvIHNpbXBseSBkZW55IHBhcmFs
bGVsIG1vZGUgaWYgeDJBUElDIGlzIG5vdCB0aGVyZS4KCkknbSBub3Qgc3VyZSBpZiB0aGF0IHdp
bGwgaGVscCBtdWNoLgoKSnVzdCBiZWNhdXNlIHgyQVBJQyBpcyB0aGVyZSBkb2Vzbid0IG1lYW4g
aXQncyBpbiB1c2UuwqAgVGhlcmUgYXJlCnNldmVyYWwgZ2VuZXJhdGlvbnMgb2YgSW50ZWwgc3lz
dGVtIHdoaWNoIGhhdmUgeDJBUElDIGJ1dCBhbHNvIHVzZSB0aGUKb3B0LW91dCBiaXQgaW4gQUNQ
SSB0YWJsZXMuwqAgVGhlcmUgYXJlIHNvbWUgbWFjaGluZXMgd2hpY2ggaGF2ZQptaXNtYXRjaGVk
IEFQSUMtbmVzcyBzZXR0aW5ncyBpbiB0aGUgQklPUy0+T1MgaGFuZG92ZXIuCgpUaGVyZSdzIHZl
cnkgbGl0dGxlIHlvdSBjYW4gZG8gb24gdGhlIEJTUCBhbG9uZSB0byBrbm93IGZvciBjZXJ0YWlu
IHRoYXQKdGhlIEFQcyBjb21lIG91dCBvZiB3YWl0LWZvci1TSVBJIGFscmVhZHkgaW4geDJBUElD
IG1vZGUuCgpPbmUgd2F5IGlzIHRoZSDDhlBJQyBMZWFrICJsb2NrZWQgaW50byB4MkFQSUMgbW9k
ZSIgZ2lhbnQgc2VjdXJpdHkKYm9kZ2UuwqAgSWYgdGhlIHN5c3RlbSByZWFsbHkgZG9lcyBoYXZl
IGEgQ1BVIHdpdGggYW4gQVBJQyBJRCBhYm92ZSAweGZlLAp0aGVuIGNoYW5jZXMgYXJlIGdvb2Qg
dGhhdCB0aGUgQVBzIGNvbWUgb3V0IGNvbnNpc3RlbnRseS4uLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
