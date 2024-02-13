Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9AEC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 17:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YMKgtEj0h6YlWlweigwNa5pyNzY3jH1RP6ZDBR0a9E=; b=OTlF75jEJZzPwe
	ZyVYgjSIB+SgQi/dVCkK6nP5l7QDek+OIDB1V6WCiOyUS0bl0ja1Sf9F6BgpYAljYjwxhtbHSoc6p
	sTrGuz+SzJi7k3VWw/8/FDW9Z+5QSb6ygbW1omjBDFpkIUGaDH7p4hV/5MWPZeBOTmhQkUb1tcmfG
	4tHPAwFlA+y1kaa7AytsHdirkplD6aQuZGKzqQHsNGWW5ziu99YojmjjmYkfQy3IYGDBnQJhB/y6X
	pLRas/mF7rzJb4CfIOuirkhkAoUV0maz97eBMn2zKnDWxiNMySGxv0Qk6G+5+JrMBlkhjhURpJVt1
	BQFIdyZyRqrYuz1fgWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwxS-0000000ACoR-0aVW;
	Tue, 13 Feb 2024 17:52:38 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwxO-0000000ACn0-2dYf
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 17:52:36 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id CAF8C13800FB;
	Tue, 13 Feb 2024 12:52:33 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 13 Feb 2024 12:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707846753; x=1707933153; bh=vhIUZMkM/x
	km+Xv7l4njwVz/7cIEtITlcl0X+PsN0Os=; b=cKKvjeRUhSWp6+KhNtBeyKLCaP
	ARMNVL/sNSqKUPXeEIvvmdrmznNX3hSweyArhvGRaXMdXCuSwGTT94uwp9tdyHEh
	QDMKJxANH7X9ypCfoDN4sHAx3qWkvtrnHa/D9EbMiXb865qnBoha6dbnM9zFjqMi
	PImaRO78/kcizAGxrfhDBxmRp00OvcvJLxmNM1oPQ8xYKea72hJv2n9yPTEHlNb+
	SRDmJdU1HM2QAQLuSDd+GWhM+lR7Nm0rHtWZukQZ6WFDjnDUXtBJe1ykZ4fDyeTt
	JKmXQL7SIoi3wKNtP34jhWCLS3xkJ/0QkmsqxphIw6SJpE77GcYpEm8ozzoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707846753; x=1707933153; bh=vhIUZMkM/xkm+Xv7l4njwVz/7cIE
	tITlcl0X+PsN0Os=; b=bSOoRBZAsw7JU0umqY2910XERNx6hsT0mxYGuPfhxfqk
	eO94kt9BRz2YIPa+oo26NydGk6OvpWXgdRu5rDrUABXrP/SAdOmmlK2UC8KE/9rq
	+ieKjARFMQgIL2Do6Rl4WRyxC12Z1oxff9EVrun5rHvK3PZbkFDHRgUmUELdptGk
	cNgyz3gHwAYi8LlLXUG1/duYNwbs5iEF3GpDu9oMOYf4SdQ1znL+zdvllVKJ1wCG
	MM5bdFiMNdiSDy3N/5qhwZFXcUrZ/7xVKTHqs3qC+lSjHFnRqpq6jQEs11ZLvrjE
	0YR6Qj4Be3+2Cuyge0Web+zRRZnpeKSgTvp7dnxPGg==
X-ME-Sender: <xms:YazLZfElPhnISDzsnbD26WHbam4Vxj-EptGnSboc52H60kijlPdlmg>
    <xme:YazLZcXJrtXEIQLT86At18cbqeXMrZNRkWy3zkXfG_xVZT9BL1yNw9TrO9RgcYT9Y
    OlmkP4idn2SqjIplA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufht
    vghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhephfevteethfetjeegjeehjeehieejuddtfeevtedtvddtudet
    ffduvdfggeefgeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvg
    grugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:YazLZRI_r9PXxz_Q1QL5g5mjArI6GBlvR_cfyX_PFzRX87lu-k4X0Q>
    <xmx:YazLZdFyw5m1CczybkpOv7laYymyu1RrDybDKKtqKJRP59hOuJZxjA>
    <xmx:YazLZVVtT2SaLtCDdZ6rexlm_Z-hJsN78gtNCR6rwy5ebxMMKo45ZQ>
    <xmx:YazLZTc7Agvzm5Naz1oNFwqv_6vDEP8ELDt_4ZdUnmcj4WJXbG5n6Q>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 908C41700096; Tue, 13 Feb 2024 12:52:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <1c93421f-a70b-46ba-a25c-50cde87bf64d@app.fastmail.com>
In-Reply-To: <20240213-1835b458d8cad71a76fa7322@orel>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-4-samuel.holland@sifive.com>
 <20240213-1835b458d8cad71a76fa7322@orel>
Date: Tue, 13 Feb 2024 12:52:10 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Andrew Jones" <ajones@ventanamicro.com>,
 "Samuel Holland" <samuel.holland@sifive.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v2 3/4] riscv: Add ISA extension parsing for Sm and Ss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_095234_762923_FB4CCDF3 
X-CRM114-Status: GOOD (  28.52  )
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

On Tue, Feb 13, 2024, at 10:14 AM, Andrew Jones wrote:
> On Mon, Feb 12, 2024 at 07:37:34PM -0800, Samuel Holland wrote:
>> Previously, all extension version numbers were ignored. However, the
>> version number is important for these two extensions. The simplest way
>> to implement this is to use a separate bitmap bit for each supported
>> version, with each successive version implying all of the previous ones.
>> This allows alternatives and riscv_has_extension_[un]likely() to work
>> naturally.
>>
>> To avoid duplicate extensions in /proc/cpuinfo, the new successor_id
>> field allows hiding all but the newest implemented version of an
>> extension.
>> 
>> Cc: <stable@vger.kernel.org> # v6.7+
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> 
>> Changes in v2:
>>  - New patch for v2
>> 
>>  arch/riscv/include/asm/cpufeature.h |  1 +
>>  arch/riscv/include/asm/hwcap.h      |  8 ++++++
>>  arch/riscv/kernel/cpu.c             |  5 ++++
>>  arch/riscv/kernel/cpufeature.c      | 42 +++++++++++++++++++++++++----
>>  4 files changed, 51 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>> index 0bd11862b760..ac71384e7bc4 100644
>> --- a/arch/riscv/include/asm/cpufeature.h
>> +++ b/arch/riscv/include/asm/cpufeature.h
>> @@ -61,6 +61,7 @@ struct riscv_isa_ext_data {
>>  	const char *property;
>>  	const unsigned int *subset_ext_ids;
>>  	const unsigned int subset_ext_size;
>> +	const unsigned int successor_id;
>>  };
>>  
>>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 5340f818746b..5b51aa1db15b 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -80,13 +80,21 @@
>>  #define RISCV_ISA_EXT_ZFA		71
>>  #define RISCV_ISA_EXT_ZTSO		72
>>  #define RISCV_ISA_EXT_ZACAS		73
>> +#define RISCV_ISA_EXT_SM1p11		74
>> +#define RISCV_ISA_EXT_SM1p12		75
>> +#define RISCV_ISA_EXT_SS1p11		76
>> +#define RISCV_ISA_EXT_SS1p12		77
>>  
>>  #define RISCV_ISA_EXT_MAX		128
>>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>>  
>>  #ifdef CONFIG_RISCV_M_MODE
>> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SM1p11
>> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SM1p12
>>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>>  #else
>> +#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SS1p11
>> +#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SS1p12
>>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
>>  #endif
>>  
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index d11d6320fb0d..2e6b90ed0d51 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -215,6 +215,11 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
>>  		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>>  			continue;
>>  
>> +		/* Only show the newest implemented version of an extension */
>> +		if (riscv_isa_ext[i].successor_id != RISCV_ISA_EXT_INVALID &&
>> +		    __riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].successor_id))
>> +			continue;
>
> I'm not sure we need this. Expanding Ss1p12 to 'Ss1p11 Ss1p12' and then
> outputting both in the ISA string doesn't seem harmful to me. Also, using
> a successor field instead of supersedes field may make this logic easy,
> but it'll require updating old code (changing RISCV_ISA_EXT_INVALID to the
> new version extension ID) when new versions are added. A supersedes field
> wouldn't require old code updates and would match the profiles spec which
> have explicit 'Ss1p12 supersedes Ss1p11.' type sentences.

Seconding - suppressing implied extensions in /proc/cpuinfo will require anything
that parses /proc/cpuinfo to know about extension implication in order to
generate the complete list.

>> +
>>  		/* Only multi-letter extensions are split by underscores */
>>  		if (strnlen(riscv_isa_ext[i].name, 2) != 1)
>>  			seq_puts(f, "_");
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index c5b13f7dd482..8e10b50120e9 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -113,23 +113,29 @@ static bool riscv_isa_extension_check(int id)
>>  	return true;
>>  }
>>  
>> -#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
>> +#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _successor) {	\
>>  	.name = #_name,								\
>>  	.property = #_name,							\
>>  	.id = _id,								\
>>  	.subset_ext_ids = _subset_exts,						\
>> -	.subset_ext_size = _subset_exts_size					\
>> +	.subset_ext_size = _subset_exts_size,					\
>> +	.successor_id = _successor,						\
>>  }
>>  
>> -#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0)
>> +#define __RISCV_ISA_EXT_DATA(_name, _id) \
>> +	_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, RISCV_ISA_EXT_INVALID)
>>  
>>  /* Used to declare pure "lasso" extension (Zk for instance) */
>>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
>> -	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_SIZE(_bundled_exts))
>> +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, \
>> +			    _bundled_exts, ARRAY_SIZE(_bundled_exts), RISCV_ISA_EXT_INVALID)
>>  
>>  /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
>>  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
>> -	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
>> +	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), RISCV_ISA_EXT_INVALID)
>> +
>> +#define __RISCV_ISA_EXT_VERSION(_name, _id, _preds, _preds_size, _successor) \
>> +	_RISCV_ISA_EXT_DATA(_name, _id, _preds, _preds_size, _successor)
>>  
>>  static const unsigned int riscv_zk_bundled_exts[] = {
>>  	RISCV_ISA_EXT_ZBKB,
>> @@ -201,6 +207,16 @@ static const unsigned int riscv_zvbb_exts[] = {
>>  	RISCV_ISA_EXT_ZVKB
>>  };
>>  
>> +static const unsigned int riscv_sm_ext_versions[] = {
>> +	RISCV_ISA_EXT_SM1p11,
>> +	RISCV_ISA_EXT_SM1p12,
>> +};
>> +
>> +static const unsigned int riscv_ss_ext_versions[] = {
>> +	RISCV_ISA_EXT_SS1p11,
>> +	RISCV_ISA_EXT_SS1p12,
>> +};
>> +
>>  /*
>>   * The canonical order of ISA extension names in the ISA string is defined in
>>   * chapter 27 of the unprivileged specification.
>> @@ -299,8 +315,16 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
>>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>> +	__RISCV_ISA_EXT_VERSION(sm1p11, RISCV_ISA_EXT_SM1p11, riscv_sm_ext_versions, 0,
>> +				RISCV_ISA_EXT_SM1p12),
>> +	__RISCV_ISA_EXT_VERSION(sm1p12, RISCV_ISA_EXT_SM1p12, riscv_sm_ext_versions, 1,
>> +				RISCV_ISA_EXT_INVALID),
>>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>> +	__RISCV_ISA_EXT_VERSION(ss1p11, RISCV_ISA_EXT_SS1p11, riscv_ss_ext_versions, 0,
>> +				RISCV_ISA_EXT_SS1p12),
>> +	__RISCV_ISA_EXT_VERSION(ss1p12, RISCV_ISA_EXT_SS1p12, riscv_ss_ext_versions, 1,
>> +				RISCV_ISA_EXT_INVALID),
>>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>> @@ -414,6 +438,14 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
>>  				;
>>  
>>  			++ext_end;
>> +
>> +			/*
>> +			 * As a special case for the Sm and Ss extensions, where the version
>> +			 * number is important, include it in the extension name.
>> +			 */
>> +			if (ext_end - ext == 2 && tolower(ext[0]) == 's' &&
>> +			    (tolower(ext[1]) == 'm' || tolower(ext[1]) == 's'))
>> +				ext_end = isa;

Per the strategy in [1] we treat every ratified version of every extension as a
unique extension; the unique aspect here is that more than one version of Sm/Ss
is defined.

[1]: https://lore.kernel.org/linux-riscv/20230608-sitting-bath-31eddc03c5a5@spud/

-s

>>  			break;
>>  		default:
>>  			/*
>> -- 
>> 2.43.0
>>
>
> Thanks,
> drew
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
