Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA2C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l50P2p1EsNjjsAUYTaEeuQnSK+d64Al6v6wiQd8gLN0=; b=PVX+4A/5oenoVd
	N6WOc8XNERYCtJW0RZgS/heywasjzUZ4hgfUt5ZmlcUeVUhaHDs8nktLtcLFTMqUc6gq+Hq0oDcQt
	lOHgG902HsOYraaxINppgvfRYoXXcKGk7bn7y//3J6ckBATZCXsEzsEVHVM+tskmBzSG3m9+oKaRU
	r0jfhM9eu24MZUZj1BSr/a96v0w1w65MbrvFEUu/R+YKuO1egcA6m++1I3YS3U51Tlvkltjawvvjc
	vNrl2iHs9Tc0Kw9XoDsILDPWjgdAsMJKiFS4OQvP1XGUlRbErJHgHv9/dSQ/dx++LAYvQeUtCV0ve
	JRFvEvfO+P6cCCsL2Eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMvf-008kYI-9W; Tue, 10 Jan 2023 22:17:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMvc-008kWe-05
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:17:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id jn22so14687599plb.13
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 14:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eubwlTjLbS6LF+xfl33NbO6mIr60CrwQo+9xM2e1vEk=;
        b=EJb7Z2t8LBtTrIg200Hh0oR4ECKefbV35wQRUANpaQ8/omu0woJIaIkvFZui8ud5Ul
         UfPEn21ivY0IreFexZxhYWIjupEiN8TOuRPEEFbaNwSVq2yj2erHV8mcxrFt30Jc96J0
         U5jR6rnd0asP7A3LBBW4oorCqDCiJdBSi3h+/LniYjaZ9jP6c2jlwdjJlnZlAE6F2r1p
         6/2ThDIE5fRzEbg1tIWHBYVob6HSJqOsJlLwSkTAtdAFXUZf3L4J1TgvPGuMSEOS3aJ4
         bVXBz5b6IvlU0EllxfZKD+Few4X2gYt0ppUzgB6E5Sr0r7vYwC89kKbfumM0QaKGGpZJ
         EZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eubwlTjLbS6LF+xfl33NbO6mIr60CrwQo+9xM2e1vEk=;
        b=UsmVBylqF2UMo8MnRXzWzvRrLrnzfqzXJD1kMcq+nJV1Zp+BOQ9nsOBYdcE7/VurmB
         MdI28qIpxqyCXqaBrztak8rwAcbFHzi5pMze/4J+fEFS3nXD6fZjxRKz1wU2eqy+kuak
         M/EXGn/AYKvXVPvZCs3ncWJowRBHSRJji4djBcuzuha9S5/pQ+rm2nOK2b7Likhw00AV
         UXGUxl9IaYAaajCf3e2qLL2kW3VUVIXlYXrVmXOkBm3mxOroOSzxxLpVL7mXOGU5RM9e
         WKu0lIGgI6fHmxa+k+Ky90lhItyg0QYe8iPjZabe4JKdg+++79eJXU9SZ9PYHNMeAwID
         e31A==
X-Gm-Message-State: AFqh2krhQO4FO7+2JR9s9qQVUObHePhSjr11qCSF1cDYfNbWHjUW4w2S
	mP0cTqkZkyVHLC+NNx5DMpAP7w==
X-Google-Smtp-Source: AMrXdXsQ3V3JH7+Exzn6JcXoAWs2LZbt43xeVAwEtFJlR4eMzp1QGQLiCG+YQdNyHdHFTT7HtjNbbA==
X-Received: by 2002:a17:90a:62c1:b0:226:d7e8:e11f with SMTP id k1-20020a17090a62c100b00226d7e8e11fmr19174103pjs.12.1673389020392;
        Tue, 10 Jan 2023 14:17:00 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id k15-20020a17090a3ccf00b002195819d541sm9593528pjd.8.2023.01.10.14.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 14:17:00 -0800 (PST)
Message-ID: <dfffd3ab-d607-9b1f-92a5-24a798807849@rivosinc.com>
Date: Tue, 10 Jan 2023 14:16:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <Y73g/nkDe7Sfp9ps@spud>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y73g/nkDe7Sfp9ps@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_141708_094249_36FC6B94 
X-CRM114-Status: GOOD (  18.81  )
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


On 1/10/23 14:04, Conor Dooley wrote:
> Hey Vineet,
>
> While you're at it with Jess' concerns, couple nitpicks for you.
> May as well say them now rather than while a v2 comes around.

Thx for quick peek.

> On Tue, Jan 10, 2023 at 12:18:41PM -0800, Vineet Gupta wrote:
>
>> Reported-by: kernel test robot <lkp@intel.com>  # code under CONFIG_COMPAT
> You can drop this, even if it reported against a private branch AFAIU,
> just like its complaints about patches. As Greg would say, LKP didn't
> report a feature!

OK. Personally I tend to add Tested-by (vs. Reported-by for the same 
reasons) to still give them the credit for finding some issue.
I can certainly drop it.

>
>> diff --git a/arch/riscv/kernel/elf-attr.c b/arch/riscv/kernel/elf-attr.c
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-24 Rivos Inc.
> s/-24//

Fixed.

>
>> +static u64
>> +decode_uleb128(unsigned char **dpp)
> Surely that fits inside 80?

Fixed.

>> +static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
>> +				   struct arch_elf_state *state)
>> +{
>> +	unsigned char buf[RV_ATTR_SEC_SZ];
>> +	unsigned char *p;
>> +	ssize_t n;
>> +	int ret = 0;
>> +	loff_t pos;
>> +
>> +	pr_debug("Section .riscv.attributes found\n");
>> +
>> +	/* Assume a reasonable size for now */
>> +	if (phdr->p_filesz > sizeof(buf))
>> +		return -ENOEXEC;
>> +
>> +	memset(buf, 0, RV_ATTR_SEC_SZ);
>> +	pos = phdr->p_offset;
>> +	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
>> +
>> +	if (n < 0)
>> +		return -EIO;
>> +
>> +	p = buf;
>> +	p++;				/* format-version (1B) */
>> +
>> +	while ((p - buf) < n) {
>> +
> While I'm already passing through, checkpatch isn't the biggest fan of
> your whitespace after open braces:
>
> https://gist.github.com/conor-pwbot/a572e395763916c7716cab9c870df4f3

I swear this patch was checkpatch clean. Fixed now anyways.

>
>> +		unsigned char *vendor_start;
>> +		u32 len;
>> +
>> +		/*
>> +		 * Organized as "vendor" sub-section(s).
>> +		 * Current only 1 specified "riscv"
> Is it worth having a comment like this that may rapidly go out of date?

Rapid may be an overstatement given this is a psABI thing. Besides for a 
new vendor subsection, more code will need to be added to sanity check etc.
But I can drop this from comment and instead mention this in the changelog.

Thx,
-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
