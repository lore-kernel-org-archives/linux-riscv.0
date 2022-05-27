Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FEDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FDmzY5XHKa7V9JEW9oJkNEUsYWIhDUJ4sfn5KeBdwNw=; b=2X+wWSyv4ck3m6
	DoPSbJ8vZFdOAXEttJfsLyhJRXynZAJCJJfrLIZ3p+B2+ok6N8hidn9zh2ZiWeEHygbuwQxFk3Od+
	65ykNKdh4SkfB5+cYAQZuKG/eRD68uDbn3T14BIeySal+EWzV3+aIB4Q+y0KAZ4xzDbtN1uF85nuL
	OpjSxAbgTAEyDCuIc+oivf2M/cXJFssaKCRN6VaSGUABuiFeg5bb8rBvJelMJj3T1lOzr8GqyK3k4
	BRWPaX4e1f22cDRBkuHgioz6EjFVsh44sf4RcSUuXSVaovfvO1O5Yj5Ga16gEcixFHpVzNM+hmBDu
	xnAcM6NCz1waZZqfZzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWS8-00HDei-EZ; Fri, 27 May 2022 09:40:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWS3-00HDFa-Hn
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 09:40:14 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 18B6C24E424;
	Fri, 27 May 2022 17:37:36 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Fri, 27 May
 2022 17:37:35 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Fri, 27 May
 2022 17:37:34 +0800
Received: from EXMBX161.cuchost.com ([fe80::5c09:58ab:29b:a780]) by
 EXMBX161.cuchost.com ([fe80::5c09:58ab:29b:a780%15]) with mapi id
 15.00.1497.033; Fri, 27 May 2022 17:37:34 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: arch/riscv: SV48 patch series questions
Thread-Topic: arch/riscv: SV48 patch series questions
Thread-Index: AdhxrOkRGR9CQf46QWqljv+TL2tt2A==
Date: Fri, 27 May 2022 09:37:34 +0000
Message-ID: <83813d991f96428c95c6d681c16ae852@EXMBX161.cuchost.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.49.44.206]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_024011_761179_53762C61 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer

Alex's "Introduce sv48 support without relocatable kernel" patch series in [1] was partially merged to Linux v5.17. But there are 4 patches are not merged (Patch-10 to 13).

May I know what is the plan for these patches? Will them merged to next v5.19 merging window? Or do you expect any changes for these patches or Alex needs resend with rebase to latest kernel version?

Note, we would like to use the Patch-13 in this series.

Patches not merged:
[v3,10/13] riscv: Improve virtual kernel memory layout dump
[v3,11/13] Documentation: riscv: Add sv48 description to VM layout
[v3,12/13] riscv: Initialize thread pointer before calling C functions
[v3,13/13] riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN

[1]: https://patchwork.kernel.org/project/linux-riscv/cover/20211206104657.433304-1-alexandre.ghiti@canonical.com/

Thanks.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
