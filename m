Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A947C02181
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=A7inHFWpYZatE/2DcoTBd6Zn/9hgG0AReFH4FQo+kVs=; b=fGJMbMqhu7Dgdv/Iv8JdC0P1wI
	vNvvdg/sWAcrqnACZ/cMVjr2TlQQaVk37kXMAOZjAKivhnzhkYWNXiE0EGiloVA8US4GMYofsV1kX
	Op+9of0hHzfgSnOXvBeDPpxnaT9lrFNzFyd7dzpFopofs93wbwfq7Qnvyda8AYOB4LXxydus+X7L9
	1KcU7DzgJ8It4aWcrAUOk1QfcOzl480pQvsAXghVXT7sFqdnAm9+4tmqQOBuZcpRUSKGlvMVFoVxE
	qt+bjE6Ftn9SAIRhJMY5Lq3g9Cn1UIaVwJBphrzpTiIkD+4R+f6/nEHVIDEpLMuDw+efyz+Xltijp
	5UAgCzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spO22-00000000LxI-2Wpq;
	Sat, 14 Sep 2024 08:21:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spO1z-00000000Lwt-29NW
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 08:21:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7191df6b5f5so2119730b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726302082; x=1726906882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilH54TMFMO/532p4dSlQLHzGzRiiqRzXIJ2V4dFceb4=;
        b=El23JVr/NTx4UCBqftzONpzZqfu/bkHmaMDeY3FB+aOUNqDRc4Xx5woIj2vzkkpSv9
         fYIIdvEd2UjTPpi3H91a3AUsCJ1AkBFfybc6sppmIC0KtASszg9sTduhwFSRUBUCcjX8
         MHe8CWvvvze2NHab6nITwhC633R686frvuNvsNz2OPTchgIZiSzK2uq7kYEDV9/rhGWu
         HSrJuEOwfXmQGaWNvxijvyMcHOTjWC2NKk5OQ0kKZcqUW5GnmuZxauwMrc8jt1p1xsBa
         1QAeLNnyz7LvH0oqOxDLBidsnUV3QZFzBq3S5qvP+U788taGVfvMHPVMLlAirpUgk7KC
         6gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726302082; x=1726906882;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilH54TMFMO/532p4dSlQLHzGzRiiqRzXIJ2V4dFceb4=;
        b=vMNvZ2cPefGyMVoKOooXz0eGPraKoyH5kXiZPnM7t5ld/EXcxPAwtVZ77no+8yjfj6
         DEzu5fsH3ApwYVtwvSaVLBq53Sk3bVAuahQiEj1t5VUskQpGsWQJ6qEPYDcDWbOzppqt
         zHIkg7oVmlqbxR85kj5FzCDqZF/WlnW2bz6oNw621yEE+erqmlE1yerVInU0qLTMhFrz
         n/ZkQ3wSID2xj5AMFm/1jmGs0kr5S0C3vQR5ED5dsqLuH1IYJ8xr0Id3zdweETvUKTXU
         Q9l20h8lli0Zcs8A7xjVxUDqJhV6X/BAWbSkMAWXFpeW32yjajlmLm8k3qzlIynOGSIQ
         diBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxF9Raw3kpM3l7D7G0jrVos7YfXsSKfC6Sz7MI5chClRw/nUIlK/mdtGRq99iKOVuVr1KMHDBZ0gpsDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrKN9H517aVuDdLxgLmOaDtFrPRF3I/qFu2sNmvm9t1flfCgeZ
	Kd2XR7EwhgNfsOd+QgNhZM8+lPAfsnV29c397MVnDb1FCXMwOToJwBW/gViZdIE=
X-Google-Smtp-Source: AGHT+IFY/Xq42oMtYtCSkvz/SDjtv31829zY7yH+ltLYgM5AYj4y9hQ7+IK16DRGjjCfwmXF9YSEUA==
X-Received: by 2002:a05:6a00:9a0:b0:710:6f54:bc9c with SMTP id d2e1a72fcca58-7192606564cmr13283731b3a.2.1726302081853;
        Sat, 14 Sep 2024 01:21:21 -0700 (PDT)
Received: from localhost (guests-out.ms.mff.cuni.cz. [195.113.20.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bb97fesm617917b3a.183.2024.09.14.01.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 01:21:21 -0700 (PDT)
Date: Sat, 14 Sep 2024 01:21:21 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2024 01:21:12 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: cmdline: Add support for 'memmap' parameter
In-Reply-To: <874j8hku51.fsf@gmail.com>
CC: cuiyunhui@bytedance.com, rppt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, akpm@linux-foundation.org,
  bhe@redhat.com, dawei.li@shingroup.cn, jszhang@kernel.org, namcao@linutronix.de,
  chenjiahao16@huawei.com, Bjorn Topel <bjorn@rivosinc.com>, vishal.moola@gmail.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: punit.agrawal@bytedance.com
Message-ID: <mhng-7b39a06f-bf26-4bc0-beef-45bd4b5312e1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_012123_844288_EE82CF94 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, 22 Jul 2024 14:13:14 PDT (-0700), punit.agrawal@bytedance.com wrote:
> Hi Palmer,
>
> Charlie Jenkins <charlie@rivosinc.com> writes:
>
>> On Mon, Jun 24, 2024 at 08:37:39PM +0800, Yunhui Cui wrote:
>>> Add parsing of 'memmap' to use or reserve a specific region of memory.
>>>
>>> Implement the following memmap variants:
>>> - memmap=nn[KMG]@ss[KMG]: force usage of a specific region of memory;
>>> - memmap=nn[KMG]$ss[KMG]: mark specified memory as reserved;
>>>
>>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>>> ---
>>>  arch/riscv/mm/init.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 46 insertions(+)
>>>
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index e3405e4b99af..8e1d93ae5cb2 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -208,6 +208,52 @@ static int __init early_mem(char *p)
>>>  }
>>>  early_param("mem", early_mem);
>>>
>>> +static void __init parse_memmap_one(char *p)
>>> +{
>>> +	char *oldp;
>>> +	unsigned long start_at, mem_size;
>>> +
>>> +	if (!p)
>>> +		return;
>>> +
>>> +	oldp = p;
>>> +	mem_size = memparse(p, &p);
>>> +	if (p == oldp)
>>> +		return;
>>> +
>>> +	switch (*p) {
>>> +	case '@':
>>> +		start_at = memparse(p + 1, &p);
>>> +		memblock_add(start_at, mem_size);
>>> +		break;
>>> +
>>> +	case '$':
>>> +		start_at = memparse(p + 1, &p);
>>> +		memblock_reserve(start_at, mem_size);
>>> +		break;
>>> +
>>> +	default:
>>> +		pr_warn("Unrecognized memmap syntax: %s\n", p);
>>> +		break;
>>> +	}
>>> +}
>>> +
>>> +static int __init parse_memmap_opt(char *str)
>>> +{
>>> +	while (str) {
>>> +		char *k = strchr(str, ',');
>>> +
>>> +		if (k)
>>> +			*k++ = 0;
>>> +
>>> +		parse_memmap_one(str);
>>> +		str = k;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +early_param("memmap", parse_memmap_opt);
>>> +
>>>  static void __init setup_bootmem(void)
>>>  {
>>>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>>> --
>>> 2.20.1
>>>
>>
>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>
> Another patch that looks good to get merged if there are no further
> comments.
>
> Any chance this can be picked up for this cycle?

Sorry for being slow here, but I don't understand the use case for this: 
we already get the memory map from the firmware, it seems like 
overriding that is just asking for issues.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
