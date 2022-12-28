Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE9AC10F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 01:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBIhy5/ID0vm0DsYGEppDLPtCOUXeQBVtekr+uc39Ss=; b=g0/2QZ6B85trlM
	5voLw2uljRK07RptnFu2NF1D6IpxVg8C2+/VJoOiBNgCCaC8dbBvXkUgEgRSDRL+GVaN/RhkstMY6
	h1wzm7fH8hbnTGcyBDEx+MtusIs92gLhzkJLBzU7N05Q9BwLcg4/w1k0LnbsuleaxfS9m7hJvIUi+
	xAufnup/P0ELacxuErWLVCyeu2ZnzNY4Kobo761p1/SpUgFj9f93uf4JJUfo6TuoUrjiyWNw2Qpca
	C8p9+AuKzxdIFJUVW5L1EER+DZtChnwN5QGG7j2kKsTE2ewg3a8Mr+IdMRf26tFmATJrj3j1MT7ls
	7TMVSgrgmCwuqqX4rA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pALP4-000VJ4-R1; Wed, 28 Dec 2022 01:38:46 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pALP1-000VGi-G8
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 01:38:45 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D26AD5C00AE;
	Tue, 27 Dec 2022 20:38:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 27 Dec 2022 20:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672191522; x=
	1672277922; bh=iC1a58fopLg2dyidRFyFPZOZXaXL0ZruSKVGJ6/nOig=; b=E
	4w5GwRQ+8JtzSAznWScl6ANpSNTjAR+dZdPBmXkUxKOxPUKBvBTmcTyi63N5kKT7
	H1963AjYxTST5hYfg15Tu3+OOWKXIh15dyJuisJVNytsv93pnA0ZAVFN5JmiJAtn
	z8uPTmwonvlgkAIBOEVputB9tKYEwKmXKHgJz1vAhGYWIJYcDp3474+w62ZfXNgq
	T6xaC8eR3smBS/r3Y5xjSztycCyBj67yMmr1mLzR2TOMIlhi+A9ep3ZBnFiE7PwH
	j8+AUT1bmwH/si70iqIx0swW/vF+fYN4+ejARZD2sOofT+E380VoiArSVBObC+qN
	KhrYdgMFB12Z9rvw/1NAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672191522; x=
	1672277922; bh=iC1a58fopLg2dyidRFyFPZOZXaXL0ZruSKVGJ6/nOig=; b=I
	cteJ0wEdzCTJFIm693Mp4YyQCI8l/LyY2LVrrKKqnmlteO3PMjNrEYrZI5CTtvCF
	9SWl09pJ7NnkfDGOPS8xJIyLgH95IstiYl8GJAdqgEpsUvXAsDHjKxFmtPyvJCdw
	foijtjsJ/i8pQsoSYHBR+/xt9la3IQKXXlSc+m42tteJeqOfBeQlf+uulfKGjtmi
	Oq+Ts2yQ8RSma6RI4fx5aC6n2RHG/CNolSglPQiz/Oncz8CMsgZLOyfRZd4Fsvt+
	I/KaftcoNbaMjA/m9ZYon7K+xWmiWBi48/vrnGIqLxMraJ8kaJrQ0oNY/8IkTNLs
	9aZasQs0C5YV83pL5LuEg==
X-ME-Sender: <xms:Ip6rY86Hc6PfiZorb-ViYn7cNsgRiihh9R7R33UgMPXDgjO4aqJfnw>
    <xme:Ip6rY94CEoJ_6ykeqyIPHootVw0AH3sNJXM-zOCi-pUA0Dc3etv6lAudQ_kV4JBWH
    U8AY5SnV3Uakbw64g>
X-ME-Received: <xmr:Ip6rY7cER7AJqKJEMsP9Ncx65pyKHt8M-0sphpSR0tOfhOgImORxG5pB6NtKDpXzwSaZbLJPJErZi4bSEyK86Zvv9uZkfuQpB9FzBSpgGdE5FSsYK09mHly0lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfhfvefhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepjeegjeejteeftedvgfdtlefgveelgedugeelheeuudeigeejjeef
    jeelkeffvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Ip6rYxLYECx36W0zOVc1NHzxPgXH_frOUR53fxfeS385DymiHcQ-PQ>
    <xmx:Ip6rYwLwJ-7liOxx2WSKJ1R7fL9sycFYmRGedr5AsVW7g_w7_ETyOQ>
    <xmx:Ip6rYyyZYce9HaGHafCHt4Bmua1nOgrAUqVtfEDflxEzd6DkoM6Y6w>
    <xmx:Ip6rY1UhNBd3iVCNH7Pu8J_R9vIFbDPEX6lkL72oWO2KIKYzIziqig>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Dec 2022 20:38:41 -0500 (EST)
Message-ID: <cedd59be-e194-aef9-6249-aa6a15a53842@sholland.org>
Date: Tue, 27 Dec 2022 19:38:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] riscv: Use PUD/P4D/PGD pages for the linear mapping
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20221213060204.27286-1-alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221213060204.27286-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_173843_786059_E0E8753E 
X-CRM114-Status: GOOD (  25.43  )
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

On 12/13/22 00:02, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
> 
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
> 
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
> 
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
> 
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
> 
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
> 
> Note that we rely on the firmware to protect itself using PMP.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> v3:
> - Change the comment about initrd_start VA conversion so that it fits
>   ARM64 and RISCV64 (and others in the future if needed), as suggested
>   by Rob
> 
> v2:
> - Add a comment on why RISCV64 does not need to set initrd_start/end that
>   early in the boot process, as asked by Rob
> 
> Note that this patch is rebased on top of:
> [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping
> 
>  arch/riscv/include/asm/page.h | 16 ++++++++++++++++
>  arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
>  drivers/of/fdt.c              | 11 ++++++-----
>  4 files changed, 57 insertions(+), 11 deletions(-)

This works nicely on D1! Before:
	MemTotal:         490680 kB
after:
	MemTotal:         492472 kB
and I tested booting with CONFIG_DEBUG_VIRTUAL without issue as well.

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
