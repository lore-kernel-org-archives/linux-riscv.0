Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15881C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 04:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4Z96yyCk+z4LCJ46Vsi3/kuBuEVb7RAoZ8Hnf3Nu1s=; b=QiI67ocpQivCXV
	ftYM+CxFoUQi4R8epfCBjxLV1ovMdq981xpArtExWGHsvMeWWZCtzq9T3ma8iDfv0hTN+u+kNeYeC
	MvHrud0GTVPEN9i2iBcsankoZc4EPmjK+hdbM4iqloahOfT76wupWP0/BDzak5eRwj8V/AxArbN09
	zTjBWfud7EN/B1N+aYKnmoDGxHSk/gGh3osXLvK7LVk7EHDa0YtCakkLkAB+4KupLJxY31dQx4vgb
	0ZdJQcV3caEP3WKKzFj/vpZ2Jh48fo757Q+GPK1DyJojet5qtYfJRRyy0ASkrtoxQqXI64i+PvyBG
	qpxkX57ot4Q4zt7Lph4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvVav-00F6sY-1i;
	Sun, 07 May 2023 04:01:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvVat-00F6rI-1P;
	Sun, 07 May 2023 04:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tm3SRrA4SJDcdCywgZMwcG/iIZMVXNj+W18OTc7O+Q4=; b=cOWUxR7XfCMM226oph7WJsRYmm
	MEcpMGs3cE58Wf2K5AahnFEmM+SlDt6DmjF6f/Bizh+hK/7PGGHPTKdlnrHqHbAJ+D0gbNxjc3/sv
	GmRDP9ES89i5otsZ03hpHlzXKV7p9LsTIV49wvmDEvsD16KWFp1g7PcCVCb26fWnVimUuKvRpcxIO
	7WQUcdwbboaEzH6g4nLBJNVsuQsuPLYUUzJ4j8nkngzOfF43UCYETBemfM87r/rlRFbIt5QEeZflY
	4doKj0PfvhPying2ITEtMqVSBUVRG+n1WorhoyPxFDOgWef+i78XepLF20uSxFdj4GdgcPDwTeyyg
	86W886zQ==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvVal-004K6c-1r;
	Sun, 07 May 2023 04:01:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5BE7E24DFDC;
	Sun,  7 May 2023 12:00:45 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 7 May
 2023 12:00:45 +0800
Received: from [192.168.125.107] (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 7 May
 2023 12:00:44 +0800
Message-ID: <976dbe61-9edd-6003-1d32-888a90c1157f@starfivetech.com>
Date: Sun, 7 May 2023 12:00:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
 <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
 <20230506-dating-twiddling-b364de21ed2b@spud>
 <b1965ae2-af2d-b11c-3e34-8129c29333b8@starfivetech.com>
 <20230506-foil-basis-31724c50b30b@spud>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230506-foil-basis-31724c50b30b@spud>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_050149_365313_A1261F04 
X-CRM114-Status: UNSURE (   5.06  )
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



On 2023/5/6 20:29, Conor Dooley wrote:
> On Sat, May 06, 2023 at 08:26:01PM +0800, Changhuang Liang wrote:
> 
>> OK, will replace "starfive,jh7110-aon-pmu" with "starfive,jh100-aon-syscon" in this series.
>                                                             ^^^^^
> Just make sure you don't propagate my typo here in the process.
> 

Yes, "starfive,jh7110-aon-syscon"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
