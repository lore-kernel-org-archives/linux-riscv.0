Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2694BC76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSNtLPJi/VEYFqORzwOyMcnBDqRKpQYDKnbqxvvBrgk=; b=w2x/8cA63l0Td4
	Yv8chp10xk8UMwLq13xMB2LfjTvkZd6rujtIPwqGlDhjKW6GfQ4Emjw0uFtyhD4e3uoDXfFB8zruu
	/YXxNPkC30DHIJDZd916nk0SoZpivpSq6YqIXgh4FDH+VHqDxMBqp6P77wKL/3/ftgIutiRVwrU4d
	2PNAp0UrgOGRdPfHK3mK7ghS4F3abuh/1j+GIwa311Ny16tYFH0+EIJCofnTdFQ4TVfAKTTcgrLPV
	3viuFglkZdlxeG+/YUQiDvQeHrCxZnPp+7ffjGJT6V3tOyZAvsHyHiToCwdl5zdJS6rHs5J8doXbA
	W7mjHFXNfZCf5qwLJBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyK2-003l0P-1V;
	Wed, 05 Apr 2023 08:16:50 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyJy-003kyz-33
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 08:16:48 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id D88F52B0670E;
	Wed,  5 Apr 2023 04:16:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 05 Apr 2023 04:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680682599; x=1680689799; bh=E4
	FRrBsELPivENRQDY0P/B5Hrosa4b2SmzmKSYFWm74=; b=O/RfOi1e5gJBwc3CRO
	6EWvOBPfA7kqdj7sZ1wQWWJRIVpKzE5AI1hqc9WANjEOPc0VlKVpBB4IA4gZh8jQ
	7gQbGkU/Y7DjtFOLLPN2B+vqHOOIpYuv14gSHyL8hoTTLdHfdixPwXlAinewnJDy
	pCU4zgyjDP5nazvefaHE4a+MCCjlehkk78cElYr1RQto9eQtQ66JYTUtMLTXLFyT
	alXZtoTKYSuJlOQrx08qlQ0XnRUG+rrBgeadWFfm485RuHUuAtjGh84wQTvAYf1u
	Z4J5r1RhIdDO0VDx3umJg901SgI7cGEjedjvsQUVn+HdOdl7WOHeLra+pJfCDene
	/X1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680682599; x=1680689799; bh=E4FRrBsELPivE
	NRQDY0P/B5Hrosa4b2SmzmKSYFWm74=; b=irXtbfnN+lz4Id+q0cchgDiq/0att
	SZqF0jA+dW9eKrzI/Hdz0raj/1VcYz0S2gflBmiiqXTKBYnMjkxwwGXfOBUii5yE
	UrocSTbwq7UP1YsQOV8mpGny+1J6D/q3YTuWIjpoWhsH+YM/IfYiygJCac3N83Rc
	FJfmsJfFPEZjMUiI7b0DptN2qlYh2d+yzFiyZZCVdZw8M2Qder99fArmpHJjQqtb
	qgM7HX6Vcg63d5aPXxLvB+iY6dIDVy5KgzAvwHDcIEJfNmboJODOxqD/5X2FpFq8
	3vw1jmm7OATqI4D9ojOZsheWtwXNAsp0MSV7XYqVK+79+CiIBWKVP4crA==
X-ME-Sender: <xms:ZS4tZMZI9AV0RkcBkz6u_qTZcu_jT_tJVGVzJyGanPX9Z0iZPDhS6Q>
    <xme:ZS4tZHb84hRVmfo9CZeAclAfKYo1GAUMzA1q3vIakl9kqrd-rtexHH9Q_vpBMa_vo
    DitDxNyuewPeT5a4og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ZS4tZG_an9tb6QDw-DeyRnF-MoiRX3UK2FT5yYldQhdyUCEPK3p6cw>
    <xmx:ZS4tZGonhwZm-UauGA8CU4Sr3yRYaGJgKoEqtpioN0iBOguVj5kRVA>
    <xmx:ZS4tZHrI8LJ6T2u70F_faSulNUPHdK-DiuwYUbgSpTxTR3iMl3AIXw>
    <xmx:Zy4tZBagRz_7kfsOKTOayTV_ewyD5h_EN8mJJP8RTtf85jnMin17RvleoA4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B97AB6008F; Wed,  5 Apr 2023 04:16:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <dcd04005-2dba-4ccc-a235-a809220f9dbd@app.fastmail.com>
In-Reply-To: <20230404182037.863533-24-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-24-sunilvl@ventanamicro.com>
Date: Wed, 05 Apr 2023 10:16:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sunil V L" <sunilvl@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Len Brown" <lenb@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Weili Qian" <qianweili@huawei.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>,
 "Maximilian Luz" <luzmaximilian@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Mark Gross" <markgross@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 23/23] crypto: hisilicon/qm: Workaround to enable build with
 RISC-V clang
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_011647_207032_AA30D1E2 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, Apr 4, 2023, at 20:20, Sunil V L wrote:
> With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
> allmodconfig build. The gcc tool chain builds this driver removing the
> inline arm64 assembly code. However, clang for RISC-V tries to build
> the arm64 assembly and below error is seen.
>
> drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint 
> '+Q' in asm
>                        "+Q" (*((char __iomem *)fun_base))
>                        ^
> It appears that RISC-V clang is not smart enough to detect
> IS_ENABLED(CONFIG_ARM64) and remove the dead code.
>
> As a workaround, move this check to preprocessing stage which works
> with the RISC-V clang tool chain.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Your patch looks correct for this particular problem, but I
see that there are a couple of other issues in the same function:

> -	}
> +#if IS_ENABLED(CONFIG_ARM64)
> +	unsigned long tmp0 = 0, tmp1 = 0;
> 
>  	asm volatile("ldp %0, %1, %3\n"
>  		     "stp %0, %1, %2\n"
> @@ -627,6 +623,11 @@ static void qm_mb_write(struct hisi_qm *qm, const 
> void *src)
>  		       "+Q" (*((char __iomem *)fun_base))
>  		     : "Q" (*((char *)src))
>  		     : "memory");

For the arm64 version:

- the "dmb oshst" barrier needs to come before the stp, not after
  it,  otherwise there is no guarantee that data written to memory
  is visible by the device when the mailbox gets triggered
- The input/output arguments need to be pointers to 128-bit types,
  either a struct or a __uint128_t
- this lacks a byteswap on big-endian kernels

> +#else
> +	memcpy_toio(fun_base, src, 16);
> +	dma_wmb();
> +#endif

This version has the same problems, plus the write is not actually
atomic. I wonder if a pair of writeq() calls would just do the
right thing here for both arm64 and others, or possibly a
writeq() followed by a writeq_relaxed() to avoid the extra dmb()
in the middle.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
