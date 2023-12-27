Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19FC46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 04:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+IPYguOSqX3VOgsKfAOXsQ0+1dgQfdKrCRIuNhS7dg=; b=qz739tzNsP8Jm3
	Lw/dylyVF7jFHvPUSipcCcRjgqErpMDdE013YiB6MAA1L3XGiAhPAFEiTX4k86zAUD0VPG9I8LnW5
	5i3OVF8qiezD1/qgvwxxrgo4pu8GDM9S/WK39ZwgUdpYeLrTQRpkSn8+1h6cYE0yq5/rRjkEG+FfP
	ZD9ienfGlX7G3p8c3Wu+bLVTUDCFQszCIzlP3VuF3Ha/wgD7lVQPWiGC69MGgw+hHVvd3TJ471rSS
	vdK6QGi6i7bZIGh+Z7e52Ci91NBgG0iKBOGQ1YOa3S366JzYmSB/OS6xl6Im/y+2hcOpDg48d2x3f
	yR3CiPza02jb25X8EUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rILRU-00DwkR-3D;
	Wed, 27 Dec 2023 04:22:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rILRS-00DwjZ-0V
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 04:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 79FDEB8075F;
	Wed, 27 Dec 2023 04:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B23DC433C9;
	Wed, 27 Dec 2023 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703650966;
	bh=ves+k/ehF5nuuuhN50R9kvbHrix4q/GEBWsuYo+6QBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu7JWQd4VQVUFDQTyU5rIq+MCb8fqqlKDBlpMOhyq5hKNo2cG1dn6F2xB7X7LEZKo
	 Njni9Lh9davLmG6kwNdl2rR59xpQSAgMhy1Pk9JGsgK1rx1nSSYlVCjjDrh9hjXsug
	 NFVhLDk0LZAVGFnEEU7WdZe+kbl6zFW5WMCV7XGoA2YdB2UMVga0ZunN37G7/+NDh4
	 hGVJndS6mpTRzyZkiHQRiwTU1d86DSsUmNhn29GCPdAMUW9eiVJLSWgXmpR7NzUw/g
	 gcA23+iYcfcTBMNzR68pDLid3r71deJADwncSxcRux4MaKxIOrFC8DO1GJptKA2dZs
	 HFEG56rIMN4Mg==
Date: Tue, 26 Dec 2023 22:22:42 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Qingfang DENG <dqfext@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20231227042242.GA4240@quark.localdomain>
References: <20231225044207.3821-1-jszhang@kernel.org>
 <20231225044207.3821-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231225044207.3821-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_202250_350461_1AB8B8F4 
X-CRM114-Status: GOOD (  13.62  )
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

On Mon, Dec 25, 2023 at 12:42:06PM +0800, Jisheng Zhang wrote:
> Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
> support efficient unaligned access, for performance reason we want
> to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
> avoid performance regressions on other non efficient unaligned access
> platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.
> 
> To solve this problem, runtime code patching based on the detected
> speed is a good solution. But that's not easy, it involves lots of
> work to modify vairous subsystems such as net, mm, lib and so on.
> This can be done step by step.
> 
> So let's take an easier solution: add support to efficient unaligned
> access and hide the support under NONPORTABLE.
> 
> Now let's introduce RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
> NONPORTABLE, if users know during config time that the kernel will be
> only run on those efficient unaligned access hw platforms, they can
> enable it. Obviously, generic unified kernel Image shouldn't enable it.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig  | 13 +++++++++++++
>  arch/riscv/Makefile |  2 ++
>  2 files changed, 15 insertions(+)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
