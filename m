Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9181AC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OhLCVKxweG94D49xoBgEbZQ/D90MnE3OXsiR//+Nrw=; b=Na1NY9W7VITISV
	WeCZL+53uN3P2znqjl+WaOG+158vmKQrBBWjmmisH5KOeVPN+bmEq3vpy9cGCncH6dBaEMTkzDh/c
	oTosl76mNjQ8ldOcpLnmFoQuQ3v83IVvndPq2W02XJRnJ4hPAGBq8yZ1zWfkghBRDbEewiLkXCvL2
	qHCYzmsaDqUmu+TVIOMAEBAyeqPOmgogTfivq51r1zO3JOW9BuFIx+z+PZVMwqlcNy/WJmN0g6KsU
	Jj2xCjLe0b7Ymb9HDmvQ1M1qwaDdfgomt+a31toXSyXJCwuJoOBgsHoOK8BaOmgPkmRPL7ZpxVMzD
	1F1rKLCPMgKiX4ulKhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfPi7-0000000AhNu-06kv;
	Wed, 28 Feb 2024 19:35:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfPi3-0000000AhLV-2lCc
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 19:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79890CE22C0;
	Wed, 28 Feb 2024 19:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB56C433C7;
	Wed, 28 Feb 2024 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709148908;
	bh=Uym1km90jfZMuTJ+0Ntvz9OhbaTkbIPMPpk5s7b4d8A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EmW+BrHsD9Qz1QoqJkLpg3c6cM9Xojkg2ra11HYCoP/1LDDOWM4P8DU+MTdP3XuxO
	 Zt+ESIF1Ll5lJikG8jYq+TM/STBZR+jWSgyLX285aY8qjiuH0ADMGxly6E3mmLSwS5
	 VFUk9G7RlY91r45tWc1oU3XB6nK9IDobx+mC9bkDnt8runGn2qNup4/lIMI8QF72PX
	 aJPfZhd7mQIxjSUN43Gp4E3/YmP2eGwEN4OIulG8Jc9dHeqq30ySZ9KKBWnqtZoZAv
	 cIg9vBxBpvX+BsFqSu4LaqOPuRkZp14PZyNTU+ng+/uLoVA4siyX3hGxPvmTnzmjr1
	 yqeh0HaBE0oPA==
Date: Wed, 28 Feb 2024 19:34:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Soo <yuklin.soo@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_1/6=5D_dt-bindings=3A_?= =?US-ASCII?Q?pinctrl=3A_starfive=3A_Add_JH8100_pinctrl?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240228170338.GA239206-robh@kernel.org>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com> <20240220064246.467216-2-yuklin.soo@starfivetech.com> <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org> <20240220-bottling-reverence-e0ee08f48ccc@spud> <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org> <20240223002443.GA3877354-robh@kernel.org> <caea26e2-6598-4796-b199-4ee5b1b9cd30@linaro.org> <20240224-smudgy-eldercare-d5d8640d9961@spud> <20240228170338.GA239206-robh@kernel.org>
Message-ID: <6CB89570-8BBE-4323-AB75-4D0582AD1058@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_113520_131873_D41024E0 
X-CRM114-Status: GOOD (  16.01  )
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



On 28 February 2024 17:03:38 GMT, Rob Herring <robh@kernel.org> wrote:
>On Sat, Feb 24, 2024 at 07:20:30PM +0000, Conor Dooley wrote:
>> On Sat, Feb 24, 2024 at 09:46:53AM +0100, Krzysztof Kozlowski wrote:
>> > > I would like a solution though. The only idea I have is passing 
>> > > SystemReady cert, but that's an Arm thing.
>> 
>> I don't know jack about SystemReady
>
>AIUI, Risc-V is working on something similar... 

Probably, but there's a few other things they need to ratify first w.r.t. booting before they're at the point of implementing something like SR.
They still seem to think they need to invent their own discovery mechanism, so my hopes aren't super high for what they produce.

>
>The primary intent of it is to enable installing off-the-shelf OSs.
>
>> - I had it in my head that it was a
>> system level certification. I am wondering how you think that
>> SystemReady certification would apply to a whole binding (I can see it
>> being a per-compatible thing, but that would be a mess I am sure).
>
>There's a lot of pieces, but I'll stick to the DT aspects (which is 
>SystemReady IR band). Certification applies to a specific firmware build 
>(which includes the DTB) on a specific board. The testing requirements 
>at the moment (for 2.x) are every binding (compatible) must have a 
>schema, but warnings are allowed. 
>
>So a "stable" tag would apply to a DTS as a whole. That of course 
>implies that everything within the DTS is stable too. 

Right, so it would be on a per-compatible basis then. I guess not altogether different from marking a compatible deprecated.

>One wrinkle is that SR has no direct requirement that the DTB come from 
>anything upstream. Indirectly, the schemas must exist and be upstream 
>(or acked on the lists) and various distro kernels have to actually 
>boot. For that reason, if we had some tag, it would have to be 
>distinct from SR.

And for the reason that other architectures may want to use it I suppose!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
