Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8FAEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 00:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HqvgG6pI1yTWi7PSfcqtstOEev35agC+6I/qTGRl5A=; b=X22SKy6j5pOMBK
	I2g0j/JLoVmNGPmOlV8+ypbgZXRAA5YA71I2DenzOEV3stc+gENDJbHFJ4Hp8pBEKhGpjMWNRDScQ
	T2wql8SGNmhRN1ufHJzM7elI/56dCUKD8CLFWfiHJgYyqwEjPFLySSdaFbdARiYm/Ok2hvrytbeT5
	R7mYQMBsOgOtpqc2fp3FiWQREYRx4uOtARubA7mDIWMYrSNlbZsPoDhp0faruIg3BQAeKsyA+2CjS
	Eg3V4ygXLzrcPV0F/pQ6SAD2ga/hqSt7sF/WEecumW+IMQn/BFk7rjiVaQjnzIXjKyYBb2d9B9tZ5
	+XBDKntmYRB5S3IPBMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJ5i-00ERTV-2e;
	Wed, 28 Jun 2023 00:31:26 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEJ5f-00ERSP-1w;
	Wed, 28 Jun 2023 00:31:25 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 98B8C5C014D;
	Tue, 27 Jun 2023 20:31:16 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Tue, 27 Jun 2023 20:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687912276; x=1687998676; bh=Gd
	+embUeOu+6SuIKsLjAuiROY4aDSeIcBFv7Ckb3rMM=; b=SUs3+rVzQ9Kc44D1Ir
	EfZhhxnwMQKCJYCd6NfF4bzhjN7zGAR33fD7wWFe9QjZwcehgaDfnrwgmwDekq+L
	PXq7ZpkI/KdtTDmy4onYbuT0MCiD/7yoXlvcNm4X4FdhCQh3l4QKLRfKu8Lf0cEQ
	GCDd33n8nkYd6rYxkrb5GPsCk06xwS5/rIgmMdUaPiWoCJyW06ASDjNchnymNONe
	kqpbQtri1RcW4VfPuCIYmbhUs5EwdlWp41nEc2A64nx39gungwCki90ejJKjjDbS
	xFfRIaivq6uZNlHfQJBHdZ7dhsL9rQxE1yZThEekcYXa59wYxm8rXnd1QDEGUo0D
	Zgow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687912276; x=1687998676; bh=Gd+embUeOu+6S
	uIKsLjAuiROY4aDSeIcBFv7Ckb3rMM=; b=klqGuJPZyF13Jx3BmwizcdEiOuxmP
	yovHnCA79KVmyf+FB3jwJYhTE7okodz+BZJFdDsIYr+0hnDHFc/T+MOp3ggsxCWu
	RxNPEOWLog7VNjDPgICgX1WMad1XWJnj4WmUhAPolXkWi3jyBmusbAi0Bw55NCmf
	ngcIMtRa1VoUgXPUKBdmPDEFDt/23HoikzKCRk8QmkTOkNXhwqEsoSoxPrAmCt7J
	pdKKh/qGqS4D6kbXcKhqMbkZun0kYwYiXGI+wIbpMj8YrJIa5zXr5BKLY/ROKvkz
	iBhNowjqGM4uVLH0/wAkLj+kYvUNFnoxz7SL1Un5zGzu0g8/rcZGSNY3Q==
X-ME-Sender: <xms:Un-bZF9Ec7t5Iqj71s-sqeB2juBUx2wTooDJRUMWE6EqU3bQshpyUA>
    <xme:Un-bZJuSCxF9zujrrY2FQulHKee-jl6xKh6PfbYrzWZYzeYuOs4NxnjMHJ07Lk3rx
    gNAq7mX9MyBUZDR_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddugdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Un-bZDAG6S9spu--SH1qBeaeEW-Mk8LOGgpimxQ7czBcZGjwODPFOQ>
    <xmx:Un-bZJcu6lqmS8nlGSvTtTdDaHoOSS7IVjWjmueGVpWe_AYcUiJo5Q>
    <xmx:Un-bZKNECT2RWycM06WPjtcF6HLPeH5_1WpqqIQt7l_XupgNmNSzCA>
    <xmx:VH-bZPfjd3-WwnURFRV0_oD03Fdata9h4EY3DWWHXTsG2zzJr4JE-g>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9E1821700089; Tue, 27 Jun 2023 20:31:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <8af3e53a-ead7-4568-a0f1-2829f5d174e6@app.fastmail.com>
In-Reply-To: <20230605110724.21391-4-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-4-andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 20:30:33 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Andy Chiu" <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>, anup@brainfault.org,
 "Atish Patra" <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heiko Stuebner" <heiko.stuebner@vrull.eu>, "Evan Green" <evan@rivosinc.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Celeste Liu" <coelacanthus@outlook.com>,
 "Andrew Bresticker" <abrestic@rivosinc.com>
Subject: Re: [PATCH -next v21 03/27] riscv: hwprobe: Add support for probing V in
 RISCV_HWPROBE_KEY_IMA_EXT_0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_173123_713635_7AA145DE 
X-CRM114-Status: GOOD (  24.33  )
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

On Mon, Jun 5, 2023, at 7:07 AM, Andy Chiu wrote:
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changelog v20:
>  - Fix a typo in document, and remove duplicated probes (Heiko)
>  - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
>    Evan)
> ---
>  Documentation/riscv/hwprobe.rst       | 3 +++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_riscv.c         | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 9f0dd62dcb5d..7431d9d01c73 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -64,6 +64,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>      by version 2.2 of the RISC-V ISA manual.
> 
> +  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
> +    version 1.0 of the RISC-V Vector extension manual.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
> 
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h 
> b/arch/riscv/include/uapi/asm/hwprobe.h
> index 8d745a4ad8a2..7c6fdcf7ced5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -25,6 +25,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
> +#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_riscv.c 
> b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..88357a848797 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,6 +10,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
>  #include <asm/sbi.h>
> +#include <asm/vector.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
> @@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe 
> *pair,
>  		if (riscv_isa_extension_available(NULL, c))
>  			pair->value |= RISCV_HWPROBE_IMA_C;
> 
> +		if (has_vector())
> +			pair->value |= RISCV_HWPROBE_IMA_V;
> +
>  		break;

I am concerned by the exception this is making.  I believe the intention of
riscv_hwprobe is to replace AT_HWCAP as the single point of truth for userspace
to make instruction use decisions.  Since this does not check riscv_v_vstate_ctrl_user_allowed,
application code which wants to know if V instructions are usable must use
AT_HWCAP instead, unlike all other extensions for which the relevant data is
available within the hwprobe return.

Assuming this is intentional, what is the path forward for future extensions
that cannot be used from userspace without additional conditions being met?
For instance, if we add support in the future for the Zve* extensions, the V
bit would not be set in HWCAP for them, which would require library code to
use the prctl interface unless we define the hwcap bits to imply userspace
usability.

-s

>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
