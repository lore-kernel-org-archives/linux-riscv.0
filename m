Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2705DC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVTuSWxzE7tZ2q0leo+syWhYMfdrg+q2DNWDzxdEPtE=; b=S5nPNvwwCkSw4m
	hylX+WmV8ztq1f2x8huOhJ4eU0Wq4nmULSSaakFhyIVGdAJ9xI4BNqWHqhMdsowTbdYJM1p1dTmri
	OihHyb9XbhaTFGOPnMvb7hplUijN78ilCNKuDvxWqEkhrT3tCOUW5sHS7xCFLFTOVc4BXzRN9m1cj
	5dzOtIEhFRxFv0+ysQ8gkHVv5pseMlD9XN6OJcLd2d6vouIcwz5o+OWfCry/jD/tArR+9gIJZcOqu
	g8Wp1Lvg6nR+xCMGjhyHjULl8xCkc3nuGFB69SmywyFdIENVNonqufvP5E+CoQspMbzUMtN03X2et
	x8PQJizLV2ESt9Tcweiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Yk-0000000BfuA-1Gnr;
	Wed, 15 Jan 2025 11:27:42 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Uc-0000000BfCR-2oVq
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:23:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CC1132010B1;
	Wed, 15 Jan 2025 06:23:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jan 2025 06:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736940205; x=1736947405; bh=ByzO5w+1mO
	MQVMBITDsGht6ia4qGIbINVIriTnsrlDc=; b=Y3bgNbfgpfaH+IOt39/5evHlbj
	hD/rg73P6hSXAp2IydkWj5iQPjEszdgjg2h1gmh7J4j/+sEgrj1TirQRRl7LYWuP
	DHJ/7Nifl7irE+t7u5bk5V3uTu5HhxLrcMX5iq3PV66p3hQiaJTmQqZCGy7+vk5S
	f7o/aUX2Xz97YzNztx61UomhBL1oatPcIbfd1PsivJ5eZbMNlvKLf9ND9ehE57ek
	ek9LOAiLUnNb++sYV/31/GidurBo4k2SdlMcnL7eiaEyu1ofOUhdpUzf3nZ4OrJO
	70+QsIoSM1YJKjLbL+4e9R+JtjAGO9dK7MZlndo0Cib2wk4LJ6OPr06/4a9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736940205; x=
	1736947405; bh=ByzO5w+1mOMQVMBITDsGht6ia4qGIbINVIriTnsrlDc=; b=s
	8eTOlrr09KkEm6TnN/RRc1yr0e7ZNC4+RrKBEOs3Y+dWbxJcQbTevGK0uX4b43wl
	+/NU1uDX5St+2euxgdPgz6OScn9f1T9ygwBVpOhq6fzcIfHk+MAWSjWTu1EB/LDY
	UO6AVRFhXGu1IRTPzhGwbBfFO+qp3JLA4NGDqm48mzBVmA/ONE6DjNJ0r8iJ5i4U
	umkhYpaYfjr9CX1QOLfFH+QwAoEbFR9wNew4ySuYunezRbno9TAI01FBXXvk7VJ7
	YtseWP0XKL1M1yPoaUqJBV29RDJfqpSpN1zYb3HMImDbMVmfPletw4sTh9oMnSlh
	gh0jUuiIjNmikHuKIJZTA==
X-ME-Sender: <xms:rJqHZ8lTkH2iXvorgBpXKq_s0mBVzHHjQlf_tZPxeWVWR7fRXc1FVQ>
    <xme:rJqHZ71e_PT8QMUjvvvpmxZNe5DPTKoxhJROL-iJ4avBE85-uMb7DvSmQ-kd5B-1l
    V8dlDZt6-poqmOU800>
X-ME-Received: <xmr:rJqHZ6p8LkBa-OE597onudUfWZau3njRU7nU4Z-p5tkxn_4NI5maCKX2ISGnsboA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepteehjedvfeevteffvdfhffffgfehvddt
    jeejuddutdevhfeigfdtvddtieelfeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehufihu
    segtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtoheprghjohhnvghssehvvghnthgrnhgrmhhitghr
    ohdrtghomhdprhgtphhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    epphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgr
    lhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepvggsihgvuggvrhhmseigmh
    hishhsihhonhdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghouhesvg
    gvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrlhgvgiesghhhihhtihdr
    fhhr
X-ME-Proxy: <xmx:rJqHZ4k8Z7XGyhqbEWWyUgxP5jOd_SfFUsIV61MAqUXGAdNNC-0rMg>
    <xmx:rJqHZ62g59VCwr8OUGJHEHJb6UeCtis8jkUc7G8ClUqTfYmDwl0DFw>
    <xmx:rJqHZ_tzXdTU6ubjOwmU9JeHSRpNYLgzccvnV3J_BK_PA-QZZhoO0Q>
    <xmx:rJqHZ2V1_2kloilAqlr5Q7sMRHaQ9Yi-u3MAiS46FU10A0bqa1slug>
    <xmx:rZqHZ4kGUEP8WY3ciKWz44NhJmFwPxJVMM1ST5s1MS7mhZsZP9OpXC_V>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 06:23:16 -0500 (EST)
Message-ID: <e286346c-0aa0-49ae-b789-75524221f58d@coelacanthus.name>
Date: Wed, 15 Jan 2025 19:23:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] riscv: selftests: Add a ptrace test to verify a0
 and orig_a0 access
Content-Language: en-GB-large
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ron Economos <re@w6rz.net>, Charlie Jenkins <charlie@rivosinc.com>,
 Quan Zhou <zhouquan@iscas.ac.cn>, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name>
 <20250115-riscv-new-regset-v5-2-d0e6ec031a23@coelacanthus.name>
 <20250115-28c95808502d43f84b3fe0a6@orel>
 <17dfb122-4ae3-477f-93a8-1748b819c59c@coelacanthus.name>
 <20250115-9a1a8e824977f49770a5358e@orel>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <20250115-9a1a8e824977f49770a5358e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032326_784053_CFCAE35D 
X-CRM114-Status: GOOD (  13.99  )
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

On 2025-01-15 17:56, Andrew Jones wrote:
> On Wed, Jan 15, 2025 at 05:41:57PM +0800, Celeste Liu wrote:
>> On 2025-01-15 17:14, Andrew Jones wrote:
>>> On Wed, Jan 15, 2025 at 04:24:59AM +0800, Celeste Liu wrote:
> ...
>>>> +#ifndef sizeof_field
>>>> +#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
>>>> +#endif
>>>> +#ifndef offsetofend
>>>> +#define offsetofend(TYPE, MEMBER) \
>>>> +	(offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
>>>> +#endif
>>>
>>> I think this is the sixth test to define these. We should copy
>>> include/linux/stddef.h into tools/include. We already have
>>> tools/include/uapi/linux/stddef.h with __struct_group and
>>> __DECLARE_FLEX_ARRAY, so I think it should just work.
>>
>> Agreed. But it may be better to be a separate patchset
>> so we can change those definition in different selftests
>> one pass.
>>
> 
> I think a separate "copy stddef.h" patch could be in this series to
> avoid having to add the defines here. Then, another series can be
> sent with one patch for each conversion. That said, I'm OK with
> adding the defines for now and doing the conversion later. I just
> hope it will actually happen.

v6 has been sent. The "copy stddef.h" patch has been included.
Once this patchset land, I will send another patchset to deal
with other usages.

https://lore.kernel.org/lkml/20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name/T/

> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
