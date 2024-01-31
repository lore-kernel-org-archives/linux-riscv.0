Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E17C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VW+8Yeu/rng4ca00GQsvCxCbAV5SIw8GwEGu8nvw4c=; b=yiMlFmLeT5ZeAq
	qBrsmoiJ9rREob4EVzEFaJKfarkdktHN6DlzHmydLrDiEKx53lVrd/svqM4ccFwwZC1CdvZaOCLId
	E1dMyhjbo6j/MThs53MkDAPpnd4WdF7ueZJz7IJyE66AgkKsclwwTR05GW7xqiXveaQ+jJLkaB0IY
	NqrwSLnoGg1WVojwdn796Ryu7qveQe3fhpmUArJffsebpSFaOcFRAh+62o6Hg8RIp42YVmlpXjFPP
	O3nkop48u6RpqH5xLCC5kiofRoJJY59k8A1hsfm6Br75sUHkkGRN+ukQnICpAFSaE8YYmUg1WIJU2
	UeFGxie4UQlL+sVQo+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6yW-00000002UG6-1vpw;
	Wed, 31 Jan 2024 09:33:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6yU-00000002UFD-3PbL
	for linux-riscv@bombadil.infradead.org;
	Wed, 31 Jan 2024 09:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:Date:
	References:In-Reply-To:Message-Id:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zfFTIJuMkeXWXqP1X9CM0AfUVjTJrLkI22bHlsMbmtw=; b=c/C4TVf3Ql0ohWGiziAr1kngPU
	fw/qtdoqqtixJa+JD4rpd0sk/9LFH5MuEjHeA9Ec3PoxqbxsTXnknFKlR0YfjQV0fqCfVvsJ8Q+UO
	L1poqP9eILix4EszsHRmbMp+MSXQE64qHHZNRH07MMSosWZn83WnAxW5NjiQK78sR7/YtD8PRFxfy
	bSEHIq2uVOVL7bErUlLA5S2jPBlCyhr/1+5U6HKysV+cbOsVI+krEtmJ0pYuCuihH/Oz1x2C9YdIN
	Oatoyt3zfbXIbPhSiBeQXsyS7Y+CV+eC7c9MopyLELUMa97jl7WPiq4PzKEbQeOp67GJLlQfvz9c8
	Rr+0dBQQ==;
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6yL-00000008uwN-2I8z
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 09:33:39 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 04E625C00CE;
	Wed, 31 Jan 2024 04:33:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 31 Jan 2024 04:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706693602; x=1706780002; bh=zfFTIJuMke
	XWXqP1X9CM0AfUVjTJrLkI22bHlsMbmtw=; b=bSn4THvb3TNzacAXhTziKRl5rh
	em6ZTUsdUJUsNMIzHZAlPH/1xeZqsrJAi5uO+4udjh12g5xLfLgQYDe1mO2XxRtB
	1TLw9nJgsgXCa6Ev2O9ki1haskqZrxDBf0aCheZRxM0Tfq/kC/l6rE4Uxp5V/mop
	Uyc05OnShT3Ow1NJGsuVkNMx1l7NYmOx50NA+QID4bpVIGiPWD+dSe4zYGnijSYG
	75hR5solZGQXgJKEUL4wKhqTMrinzElUNUPLcsj6Fjifv9uedR+hDdCuk8VTNfqq
	h5C98oj021rWDFM5haCHo4IrDgXT/CRQv1fNSgbjJ4ho/6yffnKI1ArjyvrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706693602; x=1706780002; bh=zfFTIJuMkeXWXqP1X9CM0AfUVjTJ
	rLkI22bHlsMbmtw=; b=oigmsgoIRcR/hClDiIcHKTJBEMKvbpFKKx6R3l8pRfdI
	Vx74VCDzlM85cr2ridYUVdbvEsZ1NiVUeJGYBwjb/KQeIKieImcZgWJNTNoKdori
	ZMW2efPJoF9tTfewUgPygwdom4VHTEmR3mMaGkFEr8i6TItuuYIrACXLT2xBzGKJ
	rniO4Az8EBb5KRXnavAIh7qJSEQbqGFMx2TYgYmd8zoSOem22M6SlRrBVJCqpRia
	TVK7v0RecAJOOLIXvuJOFk+AcsEjniiqZLBnHkSbD92jo2HYsjoDkwbVPwssYmzn
	XwFUvCZzXE7X7zhYSWhCx74CzGgOXMIhh+ZDvah73g==
X-ME-Sender: <xms:4hO6ZSDyts5aymwbcqXhOpRv0NxSxSa2UKeaCznOpdlSQVr4IJCxqQ>
    <xme:4hO6Zcjz454H0hMy7oS-pS7TI1rnKjkNJ4UsVwOBJjIjr6EqnnZBz5WseBxtWDRXk
    RmoDtpqmmRCmPSYfhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:4hO6ZVnU1Je3RbLMfWXzYNYVf-vOuAmn3LwXu_JuyFMU2WcH8KegxA>
    <xmx:4hO6ZQzMVRFHjHlgoA45o1frQlsonOJJIG8Hrr_yDlxoNc-Xz9HDvA>
    <xmx:4hO6ZXRtLjYqwGq6bwLd4PgDubiIaysXdJ2KLX5fkULA2lJA-syrdQ>
    <xmx:4hO6Za9ZjHmo9sg797cPxDJg4WV7uKUAbwDU7WfE4Ho3o2nuVuC0BA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 08CC4B6008D; Wed, 31 Jan 2024 04:33:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <682f037e-0efe-4d73-b867-f1f86a244836@app.fastmail.com>
In-Reply-To: <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
References: <cover.1706603678.git.haibo1.xu@intel.com>
 <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
Date: Wed, 31 Jan 2024 10:33:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Haibo Xu" <haibo1.xu@intel.com>
Cc: "Alison Schofield" <alison.schofield@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "James Morse" <james.morse@arm.com>, linux-riscv@lists.infradead.org,
 "Ard Biesheuvel" <ardb@kernel.org>, "Baoquan He" <bhe@redhat.com>,
 acpica-devel@lists.linux.dev, "Robert Moore" <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, "Sami Tolvanen" <samitolvanen@google.com>,
 "Greentime Hu" <greentime.hu@sifive.com>, "Len Brown" <lenb@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Dan Williams" <dan.j.williams@intel.com>,
 "Chen Jiahao" <chenjiahao16@huawei.com>,
 "Yuntao Wang" <ytcoode@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
 xiaobo55x@gmail.com, "Anup Patel" <apatel@ventanamicro.com>,
 "Tony Luck" <tony.luck@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Evan Green" <evan@rivosinc.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Andrew Jones" <ajones@ventanamicro.com>
Subject: Re: [PATCH 4/4] ACPI: RISCV: Enable ACPI based NUMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_093335_861782_DD102664 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed, Jan 31, 2024, at 03:32, Haibo Xu wrote:
> diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
> index 849c2bd820b9..525297c44250 100644
> --- a/drivers/acpi/numa/Kconfig
> +++ b/drivers/acpi/numa/Kconfig
> @@ -2,7 +2,7 @@
>  config ACPI_NUMA
>  	bool "NUMA support"
>  	depends on NUMA
> -	depends on (X86 || ARM64 || LOONGARCH)
> +	depends on (X86 || ARM64 || LOONGARCH || RISCV)

The dependency is no longer needed now since these are
the four architectures that support ACPI now that IA64
is gone.

All of them also 'select ACPI_NUMA' by default, though on
x86 this can still be disabled by manually turning off
CONFIG_X86_64_ACPI_NUMA. I suspect we don't actually ever
want to turn it off on x86 either, so I guess the Kconfig
option can just be removed entirely.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
