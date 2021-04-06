Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AAEC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 19:06:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D5F613D2
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 19:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D5F613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9iRwW6nRNQWqlvnrH3iyBpAh0YhimQcRE8rS5zmANcA=; b=QmvNrlosWMSn7+IuGVAgir8W41
	dMWbg2gxhNN0FrILAck+DV2x/P7gDhyPdq3Zx9/d+NLusRLoF9iMCsR6onQ9DXy4m6BDSJRM+zIMA
	x6UdnIayIm+bBpE/RAs5Vv1RrlH9mXalR8BbogWZr3emdo7XmbcEzG/T3ElXUiTRGGcFORag1FRqO
	YIlSIPmJiqEvQFucVI1mq5rkdP0RwSAqKDxUVjP++wOOvQiCoZnVDveWX1V9JBenbTzy3w84u4113
	99yX1rs9M+7gW62E2kdRFPamz7ZXtI3gngqh1DtG0otq/XQPZqTkjo4Znrofc5VjoxOcX5J/WAr3y
	WhiUkVDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTr1H-003IoG-Q0; Tue, 06 Apr 2021 19:05:47 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTr1A-003InP-9w
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 19:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617735936;
 bh=S5w76roMR9069RbtJkgU377LovVfOK0MpWKmGi2/kjk=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=YUvW0IUkEYFFBjdbWiLopC7be2NB6xosmAvZqw1+MYNWduVNaDmlVPE4efPOEFkwJ
 Nn7C2tFhRSn52qW6QmPZUJ9ZzQK/kW7ZDno+mqxgg/oaQdYHIvffm1RQXYgoOvRoxv
 1PQEWcPZ4EvNmficarqQZgkIvIpDk81npdW3ebLM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWigq-1l5gHP3Qk4-00X3ZS; Tue, 06
 Apr 2021 21:05:35 +0200
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [RFC] dt-bindings: riscv: enum for riscv,isa
Message-ID: <5385012d-9f09-d7d9-7b6a-cef7de2d4056@gmx.de>
Date: Tue, 6 Apr 2021 21:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:ngX28VYtdWQlHye7iPLWOBYn1ApSoOWXfA3SALu5YrflY7O+Qr/
 fZpezTIa/Nlhrsrdk9Lo/Y398bJ1h7tVl9oaPRkKRR+kMZWYWn3i+aFDp4GXpDdFXSeYAO2
 ItcbGkvnpvqiJGS+nuHYiriX0p3XHuyUBtt8ChCTREYFCRTkLqB4aTiXu/0VqJCWib9iOs6
 TkJj2Kcj5ofZ+TLHIVrxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UepjL+PZHsc=:BanShc5P6UyNbjSNcxkUNf
 zFYy/wDiOrK+rPwaV2rT1KnHpgwY2GVujT30j25QUW5YoobHI9kwgoTm+Gf7S/7bFc/6W1qDi
 p9AA6ZZnhQLeBWiJAaXE2FVMbUFsS+QfX2nCmYqzAWFl14OAFNvCtytuHS2TBklMymnESTpnb
 NuJ2kcsXtuhkgCCyamft7+66Kc0q1R4rJ/6dKr5L6LQhqJrI6kPC3r/cpzDrDkAzo7XZrl2mC
 XDACxBqFk3dUIgkqys4w4gRTg9iJiPn87JTR25jjwUVxAc8yUoi/6r5d6TutyuDuFMBMB2/Le
 R6jrnuXCrNwp23PRH7fS3tV8DGFmjLhTICvp+P2BZ2LLq3hVNc8Y3fZvM2PJXfo63tUFBSzXF
 V4wVsB2k/FuTjNE9vyg4UzvUMuArWX3VlR/Zj5/HKlRCjgCSkTMZCRSi/bvvfhpRcMbcXqM/3
 xFfXqHufV6iP+zYG12jZoUtVHwqE7k1LwdzLJ8reufc9en3BZr0LFbDBwYUWj0ndBT5RBA85H
 W99GkXuklomm8hH5zwC8jG5bpL9r2CscvZFcN9PUKzKBKKlSZwXUla7PGgNqwYYvQaaAWYcZ4
 uGWyOX5I2OyfLv0rgeAHmr0DoEMgp4AfjDLgJuboZiEpdtCTTMd8K+WpKcPkfeB0xhAFQD2kU
 6O5IdeziwXrF9jVOktLRrabwTTUjr/u1K+0r5jGS1MIG2EVepDyldXGJzEchxt61hB9LBOWBR
 W91WKo92D4j5xjtPJzDmLRjtqcy4phKeQFmFUhwP9nIddAw3tgfq/+X1CYbOhj+2KuVFkbhui
 ruA4rbBWdULlNWmdYObMKIIDJRzvbUIShr8azks5hkzBsNVFviSAfnGffTcXUOf7GajM6U9bi
 mUFJqGTvfArPoTsINPOFAMNLOtH7WCf81z8Jc79Q7EocxQJRSLlyyEwZUcypJbN3gRYu7nsW+
 QPm+go/7A74UFcHZiliARwGqkoItSzSLGVm+ngzqzMFDpTbuuttKzkTZ8hHxm93GzuRYZFviL
 2ZXegoYj0QuxhdruAF+Vrq2LgQ1qGU8m7YewqD6jkMdouN2fD+sNRCRjYDp+8wr01icY6Hfb6
 egGyQp63KAgHQ3GDzB+xj8mMg0RboqmGikpRuIHdE+xtHrzJaK4z/I3i7F8n0YwcREY+mlyVI
 1DFqbCQau0bxor+CmuQT1lQ/UCniF8wDt4xYlbqquPyEwr8aNaWLOWxZfDFd7PR4g1Cng=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_200540_471359_F2EE6352 
X-CRM114-Status: UNSURE (   6.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In Documentation/devicetree/bindings/riscv/cpus.yaml I find for riscv,isa:

     enum:
       - rv64imac
       - rv64imafdc

This implies that 'rv64imafc' or 'rv64imafdqc' would be illegal values
while these combinations of extensions would be compliant with "The
RISC-V Instruction Set Manual".

To me it does not make much sense to try to enumerate all permissible
permutations of RISC-V extensions.

Shouldn't this enum be removed and replaced by examples?

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
