Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ECDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2v6UQbhs8Rexc/lNYLYwlPnGNPtVKL/xvwnyopfLCA=; b=2IAldYbg03cQhM
	abL72uRjeHG9Xe/2KdP0CrIhiOF6Z+EiLBplinZH+j6nrPE8k8jlArCfIoJ2rAXQjCtV/Pqc8KZX5
	iDRqQ/WgIk8nQJi0RqJSH3HqinURFkyyNhlqhQzFHh2ln9NrsX7bNNdXK75XTw5cmsfIt3X6oJCTC
	qrkHOCy7/cd5rIf0IaxZGURzWbWWSc2zjvc+oVt7ZqS5Hu4dCd1i7nqOb77v5rvsNZJr7DzcreV43
	qcg6weNs0Un5JexcfaGu/PrKGWlNcaERkv2908TPCcHz3geZJQ9d262+DpcCFxCMUZqA+sSw9u0yK
	KBpYCnDrD9Gzx+prTGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdfD-001XAw-04; Thu, 02 Jun 2022 05:46:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdf8-001Wy3-4R
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:46:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0348024DBC0;
	Thu,  2 Jun 2022 13:43:43 +0800 (CST)
Received: from EXMBX164.cuchost.com (172.16.7.74) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 2 Jun
 2022 13:43:43 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX164.cuchost.com
 (172.16.6.74) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Thu, 2 Jun
 2022 13:43:42 +0800
Received: from EXMBX161.cuchost.com ([fe80::5c09:58ab:29b:a780]) by
 EXMBX161.cuchost.com ([fe80::5c09:58ab:29b:a780%15]) with mapi id
 15.00.1497.033; Thu, 2 Jun 2022 13:43:42 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: "alexandre.ghiti@canonical.com" <alexandre.ghiti@canonical.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: arch/riscv: SV48 patch series questions
Thread-Topic: arch/riscv: SV48 patch series questions
Thread-Index: AdhxrOkRGR9CQf46QWqljv+TL2tt2AEQwdsAABSqKCA=
Date: Thu, 2 Jun 2022 05:43:42 +0000
Message-ID: <e99af0ab0a264aadb77d949c4b73fd57@EXMBX161.cuchost.com>
References: <83813d991f96428c95c6d681c16ae852@EXMBX161.cuchost.com>
 <mhng-055df44c-3feb-41ae-b8c0-ae3a6489dee1@palmer-ri-x1c9>
In-Reply-To: <mhng-055df44c-3feb-41ae-b8c0-ae3a6489dee1@palmer-ri-x1c9>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_224626_842728_91612990 
X-CRM114-Status: GOOD (  24.89  )
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



> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Thursday, 2 June, 2022 11:44 AM
> To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Cc: alexandre.ghiti@canonical.com; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: arch/riscv: SV48 patch series questions
> 
> On Fri, 27 May 2022 02:37:34 PDT (-0700), leyfoon.tan@starfivetech.com
> wrote:
> > Hi Palmer
> >
> > Alex's "Introduce sv48 support without relocatable kernel" patch series in
> [1] was partially merged to Linux v5.17. But there are 4 patches are not
> merged (Patch-10 to 13).
> >
> > May I know what is the plan for these patches? Will them merged to next
> v5.19 merging window? Or do you expect any changes for these patches or
> Alex needs resend with rebase to latest kernel version?
> 
> I just saw this as I was digging up Alex's old email to reply to, all but #13 are
> now on for-next.
> 
> > Note, we would like to use the Patch-13 in this series.
> 
> Is your use case a CPU errata?  If so I think we should just go ahead and add
> that errata via the existing errata mechanism.  If you've got some other use
> case, do you mind elaborating?  From that other thread it sounds like a
> command-line argument is the way to go for folks who want to turn this off
> more dynamically, but happy to hear if you've got something different in
> mind.
It is not CPU errata. 
RISC-V cpu can have sv39, sv48 or even sv57. If it is a heterogenous system, cpu cores in the system might have different sv. Eg: one cpu can be sv39 and another core is sv48.
In this case, auto detection is not work. So, Patch-13 can help in this use case.

> 
> > Patches not merged:
> > [v3,10/13] riscv: Improve virtual kernel memory layout dump [v3,11/13]
> > Documentation: riscv: Add sv48 description to VM layout [v3,12/13]
> > riscv: Initialize thread pointer before calling C functions [v3,13/13]
> > riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
> >
> > [1]:
> > https://patchwork.kernel.org/project/linux-riscv/cover/20211206104657.
> > 433304-1-alexandre.ghiti@canonical.com/
> >

Thanks.

Regards
Ley Foon
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
