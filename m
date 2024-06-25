Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24F0C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZAOsxyjXCGJLXyyOjkDqGW3UxL4hwUA72njaFpObrI=; b=buMqsSXZOiq1IE
	UvuiMJgFmaDzCxanOFt06pmqp4jh8CoaMKcyGw2xIgFFDBa1/+eNN//p17c5J5hcNFPjelF7JjkjV
	Tp55V0HXUvidhDmKnm+R9KzOoguh8Ngsaiq0tnw/+F/JaRNqjQfA/1AtF7zmWLIWtwOq/o3YEo+1A
	aIS5L/bfHoiifaMfV6j3klJpT0j2zBVxE8pFLTdcTHysGefpboysqKFM2zhVbnD03m7lMYzCkC3CX
	cUbAkwEnVfXlE36SefMd6fykZQZgAzm9urAJeB3+peG7y89M52bRdmzQJhlfoJJhVpSlc08KpsQbo
	U9BvCI6YfxjrMoi2GaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLz8r-00000001jaM-3IAo;
	Tue, 25 Jun 2024 05:54:57 +0000
Received: from fout5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLz8n-00000001jYc-2eAS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 05:54:55 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id EF39E1380264;
	Tue, 25 Jun 2024 01:54:51 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 25 Jun 2024 01:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719294891; x=1719381291; bh=c4rAxw1qJr
	qmWKYY1+6s9jcUf+yB02+YU8+qyUtjImU=; b=hOBgzJNqmR6TU33sReOT4py3qK
	dYCveIA42sZ76GlTKbmK2TOuG92TPXQrFJO3QomVOIf1mP3qvMaY1CB9ehRCO2y3
	1aXP6UtIdrbm2s6iWsW3q3FCzUzlvdUA3c334w43NbfNtp5obNSxAmAK4u/4V1ao
	DJ+Q7BPAM2eT5xRvu5oMU09Vwbpr9n6V9zmc8j68kcr02Cr2nJWWBTBaM7d1OODT
	A/RDvI2Sl1rH0ubJ9Q8vL0epwU/GY7DXmfdVdqfyFmM/czN6/6KPHdrRU0NVoAzF
	Po10m1/q2RVdw0LVqX7B5d/XhsfMgs5Jo3E9HBp/KONewsKcgM0JXakPqmKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719294891; x=1719381291; bh=c4rAxw1qJrqmWKYY1+6s9jcUf+yB
	02+YU8+qyUtjImU=; b=fIJJLdtckJkRQLh3iC8ZIFuJjU4zw4E82RsAcThCStuv
	Ua6ph2V76trOT84wxq1YpJz+EEeN3nsYFB77rVd7pKfi1/FBzHeU7gb1Vqp+gi+r
	z9mPsogek8aLSiR4F/FLJJNApfJbv0DZ8slfpcrTA/WVX/7+Y+A//DUgEJUVTJ5z
	Om9kHBGjxBmLG1USrbHt1grJg+f83EBoPtcrt/NqvkIWI/bfopfbUSDsgh8ldqbF
	fLqYPQPRfzFJfjl4Jjng1DmxI/KJz4nkAOQIOmfH9ai+OCBlAJokX0FVAb5PbKxy
	k2D5IoSb1riYASWae9Z9aRZ7P4JpjOIwlLNTz39oQw==
X-ME-Sender: <xms:q1t6Zn3ioKmrtnme9anL1JcS9f2BpsuVQQYeSI0uM1WrZry-1HBmPQ>
    <xme:q1t6ZmHZLj7B4Pqi4sanidCr1fBrPpnHbAq3y8dHe4TjxVRitbbKXOSwrUyJ0GKUm
    EhEyBnrBX5OwkkzNZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:q1t6Zn4MDAx4zqdrRw5LkJ5Xzlay8kM2cVTjAI6JetuC4uEsoTRwTQ>
    <xmx:q1t6Zs3xZQHiJTTr43K91JWArLlzxNs0NhxWiAM3G7d5NEySaknRLw>
    <xmx:q1t6ZqHm5RpeXZxPTM6vetJphGeoaV01kTXpa2b3vBDk9eB73Sxq_A>
    <xmx:q1t6Zt90aryFtv1Jg1BH2x0omg-jXM-yLNLeOIXPo3t6bzDyUMtpqg>
    <xmx:q1t6ZnNJac-Cfpo2M03Oa5ZnSu5RvSl4AJdsYJZlhJ4Mz_Wb5EcBntrv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 16D2DB60092; Tue, 25 Jun 2024 01:54:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
In-Reply-To: <20240625040500.1788-3-jszhang@kernel.org>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
Date: Tue, 25 Jun 2024 07:54:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jisheng Zhang" <jszhang@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of __put_user
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_225453_880887_3FEF4320 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, Jun 25, 2024, at 06:04, Jisheng Zhang wrote:
> I believe the output constraints "=m" is not necessary, because
> the instruction itself is "write", we don't need the compiler
> to "write" for us. So tell compiler we read from memory instead
> of writing.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I think this is a bit too confusing: clearly there is no
read access from the __user pointer, so what you add in here
is not correct. There also needs to be a code comment about
why you do it this way, as it's not clear that this is
a workaround for old compilers without
CONFIG_CC_HAS_ASM_GOTO_OUTPUT.

> index 09d4ca37522c..84b084e388a7 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -186,11 +186,11 @@ do {								\
>  	__typeof__(*(ptr)) __x = x;				\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
> -		"	" insn " %z2, %1\n"			\
> +		"	" insn " %z1, %2\n"			\
>  		"2:\n"						\
>  		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
> -		: "+r" (err), "=m" (*(ptr))			\
> -		: "rJ" (__x));					\
> +		: "+r" (err)			\
> +		: "rJ" (__x), "m"(*(ptr)));					\
>  } while (0)
> 

I suspect this could just be a "r" constraint instead of
"m", treating the __user pointer as a plain integer.

For kernel pointers, using "m" and "=m" constraints
correctly is necessary since gcc will often access the
same data from C code as well. For __user pointers, we
can probably get away without it since no C code is
ever allowed to just dereference them. If you do that,
you may want to have the same thing in the __get_user
side.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
