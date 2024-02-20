Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E6C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+aNkmgQS3z6zHDIB93pup8mqkTi1m9JXhBOT2cqQ3I=; b=PoZ40idSsH8eC1
	lgncHkwk4UzCDBTN/EA5rOj9ro9qxxguYx5t0SNpTcZpsBKRvkIGaozi1GMdMgwHfvnjPKVDxK4PX
	j9Xc/74PsFIWjWZ2y+GHe02AbZHuIhBKgmWUALuqBE1SslRWJPOHjzt63PoXfyeYtbWM9j0bDy6+2
	b4bXfdYNS0TbL6dRl0Oly2DDchmh+s9L5J7oLCSSxru3UDX03LkB5C59JUF/1kVxQZfaFGi0c3diu
	5XFvGD83DOLPP2xFXUbz7pNGF0ILwUyyqrzWfug9iuPIx0Q/oHpr9PdBZckx3iTVrwa3spy1SvodN
	lE0HEZ0YTE/QnHACCMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcX1C-0000000G9q2-25y3;
	Tue, 20 Feb 2024 20:47:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcX1A-0000000G9pa-0TU8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 20:47:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6299620009;
	Tue, 20 Feb 2024 20:46:58 +0000 (UTC)
Message-ID: <ac11967c-3ab4-42be-86ca-0d40c35eee04@ghiti.fr>
Date: Tue, 20 Feb 2024 21:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] riscv: dts: Allow BUILTIN_DTB for all socs
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
References: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_124708_331371_A528B582 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Yangyu,

On 20/02/2024 20:01, Yangyu Chen wrote:
> The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
> patch moved this configuration to entire riscv.
>
> Although BUILTIN_DTB is not a good choice for most platforms, it is likely
> to be a debug feature when some bootloader will always override something
> like the memory node in the device tree to adjust the memory size from SPD
> or configuration resistor, which makes it hard to do some debugging. As an
> example, some platforms with numa like sg2042 only support sv39 will fail
> to boot when there is no ZONE_HIGHMEM patch with 128G memory. If we want


Orthogonal to this patch, but if needs be, we can fix this issue with 
128G on sv39 by changing the sv39 address space layout, we still have 
room to gain the 4G you miss, at that time I was pretty sure that amount 
of memory would come with sv48 :)

Thanks,

Alex


> a kernel without this patch to boot, we need to write the memory nodes
> in the DT manually.
>
> Also, changing DT on some platforms is not easy. For Milk-V Pioneer, the
> boot procedure is ZSBL -> OpenSBI -> LinuxBoot -> Linux. If DT gets
> changed, OpenSBI or LinuxBoot may refuse to boot. And there is some bug on
> LinuxBoot now which does not consume --dtb argument on kexec and always
> uses DT from memory. So I would like to do debugging on DT using
> BUILTIN_DTB, which makes it very simple, I can even install the kernel in
> the distro's way and provide a kernel package for other users to test.
>
> Yangyu Chen (1):
>    riscv: dts: Allow BUILTIN_DTB for all socs
>
>   arch/riscv/Kconfig                  | 16 ++++++++++++++-
>   arch/riscv/Kconfig.socs             | 32 -----------------------------
>   arch/riscv/boot/dts/Makefile        |  2 +-
>   arch/riscv/boot/dts/canaan/Makefile |  2 --
>   4 files changed, 16 insertions(+), 36 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
