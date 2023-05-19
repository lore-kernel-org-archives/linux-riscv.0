Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F987C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YPaW/emf1nkYXifEhnmsv/c1tq+9R3CUjUM3mC2w+4=; b=VnyasQeTZe+xLH
	XCzipmetGsdWEIZIqKqUHzROJLhlwix0xADy0wvy2/ldkmmTJTTFI5UDlyd081tnRpYg59h+p0Oe6
	hcEQ/r1dwzSOKNlkDnEYr+IIrJS2zhbD00kZ/i9iVBi69wq6YmZAGwXcHxZ5E2V864OPkvHMpArKK
	6Q2Sn0yfihH332BrG3duPQYvD5I6+/ywOVjctb2DN61CUK6RTJ3hOkv4m+DsFf5GDJDNgKJ33OUX0
	vH+xoiyhkPyZU5sTLfg099J2KrjTtz9LxTi6e18NL/YtOh0x4i8gVwgqN81LGP1JxVkFZL+3LQgGU
	NdTt1nYEKnnQGV9l5mZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxi5-00FxYT-0W;
	Fri, 19 May 2023 10:51:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxhz-00FxMi-31
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 10:51:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6934D7FFB;
	Fri, 19 May 2023 18:51:02 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 19 May
 2023 18:51:02 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 19 May
 2023 18:51:02 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 19 May 2023 18:51:02 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Song Shuai <suagrfillet@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Mason Huo
	<mason.huo@starfivetech.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: hibernation: Replace jalr with jr before
 suspend_restore_regs
Thread-Topic: [PATCH] riscv: hibernation: Replace jalr with jr before
 suspend_restore_regs
Thread-Index: AQHZihi0VP3rwfUufEaZ9/XX0w5YHK9hZs+g
Date: Fri, 19 May 2023 10:51:01 +0000
Message-ID: <99eac7b418bd4b518e2edb7379e1158f@EXMBX066.cuchost.com>
References: <20230519060854.214138-1-suagrfillet@gmail.com>
In-Reply-To: <20230519060854.214138-1-suagrfillet@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.53.70.89]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_035140_288782_73C450F8 
X-CRM114-Status: GOOD (  15.27  )
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

looks good to me.

Thanks
Regards
Jee Heng
> -----Original Message-----
> From: Song Shuai <suagrfillet@gmail.com>
> Sent: Friday, May 19, 2023 2:09 PM
> To: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; JeeHeng Sia <jeeheng.sia@starfivetech.com>; Mason
> Huo <mason.huo@starfivetech.com>; conor.dooley@microchip.com
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Song Shuai <suagrfillet@gmail.com>
> Subject: [PATCH] riscv: hibernation: Replace jalr with jr before suspend_restore_regs
> 
> No need to link the x1/ra reg via jalr before suspend_restore_regs
> So it's better to replace jalr with jr.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/hibernate-asm.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
> index effaf5ca5da0..5c76671c7e15 100644
> --- a/arch/riscv/kernel/hibernate-asm.S
> +++ b/arch/riscv/kernel/hibernate-asm.S
> @@ -50,7 +50,7 @@ ENTRY(hibernate_restore_image)
>  	REG_L	s4, restore_pblist
>  	REG_L	a1, relocated_restore_code
> 
> -	jalr	a1
> +	jr	a1
>  END(hibernate_restore_image)
> 
>  /*
> @@ -73,5 +73,5 @@ ENTRY(hibernate_core_restore_code)
>  	REG_L	s4, HIBERN_PBE_NEXT(s4)
>  	bnez	s4, .Lcopy
> 
> -	jalr	s2
> +	jr	s2
I am content with these changes, as they do not involve a return after the jump
>  END(hibernate_core_restore_code)
> --
> 2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
