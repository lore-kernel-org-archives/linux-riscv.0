Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136BC61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iwvPQbvqdY8HWhGNUAsw+oDUSNsq+nQsviXdB+uyj0=; b=rhEROYd6RK0nNf
	sXJTHc2PtBfXjylimraH3wkRWjWxUYG2X6u3EeVqx1kYjm+xFF9zl96Qvn5f4dGRaow1UfKhYTamI
	tOHCQSIOdUElfbEkPHJwKYl6+I5kV/3ORuTTSQj5uTKk0D/OSiCXkMhTFagW2jJsMjmegLk7Bigf8
	bLgC/iv7vLex0POkyDs7isWB0CZiYsXF4v98dDQrPE8VAOio3zrRwUrM98zOvBbvo3N4Wl3U4LBCb
	7MVs0OldkNqoCrrfyd9VCGTobTh9+UK7pQjbWa5HPehRXBqq5QV3+nzfiB5p/5/MlMF6+7H21WRdU
	3WEvUqTMDMaiBS9lpcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TQ1-006rcd-1P;
	Fri, 24 Nov 2023 10:28:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TPz-006rbU-08
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 10:28:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50aae766214so501842e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700821690; x=1701426490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nbo0FUidKX+K23TC4mX9mkPOe1qgse1OtvaVCBp4abk=;
        b=I2QsJ6W2tHSDYRhg6pDG7OHHXp4GZVj8BnASwsiiY6+uPW5ZVk+0g0VkHmuO1W17xA
         RYycL2taseTqRtMOttyrlMoK4wP6Utz3oroBoNHPckWoXDv6zkmmedpEKaMLlKuyNxp1
         PpAQ5mC5BEU5U6bSGq2W0b85gXR6XVjKJM0MR+CBgkU7JmSjQyum/BiOaS56YZra5+VI
         W6vQ5oDqba2sudtYU2wiRio0Fv8Ud4kMnb2DTNXIwEds5GteL3+Bdh+MIHOZnlVa3Vvq
         crWh4/AB6YpySUzyKF56ZYgs2qToChR+YmQzNlRjP6mVmv8RhR2/ehFZc4vchHIeQRdo
         PIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821690; x=1701426490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbo0FUidKX+K23TC4mX9mkPOe1qgse1OtvaVCBp4abk=;
        b=jPM2sgFF5ygZrTIy3CKpbiBhVe3AqZwJsKGF3099ySwpgnuU1RoOc4dekDg9d5VU4Q
         dE+2PRSDF7lOVkJGaPTAudwWFJ1VyeKKtrt/WG9RYsMi4NiX+lg+ZHmHtj/MuWhzfrME
         NfzE9UmXxXRhcPl/vNW0VV8N/XM6NfwHzKzEfK6C0HITuwSlx3aYyY994c3DIPpJPQ1C
         LT4o/k2URwIuhJG1lxR36WpQXcRws7PhifoVGO+jeY/eGLtdwIPW5SUhWnW0ajHZvpLW
         HojUM8EmrxVB4mHHm4t7xjuyZAP9Vl3yRDpVc8Pn9PonYQqOdCNNWNn1X9I/QTLQegm4
         0qbQ==
X-Gm-Message-State: AOJu0YwN+AbMTpYl2WBD7ApopKRI+DaL6vc3JxRX35IsO0CDiHo0pYVm
	FaDuDv7uUwLC+IuehTlDv+T4ew==
X-Google-Smtp-Source: AGHT+IE3d4+XZv6KBciYkFY6vMzT3RRiHUMV/wCvD7eh8ji9/04Z6RQNti57N2iLRAT5l+jpr23OEw==
X-Received: by 2002:a05:6512:3d25:b0:50a:bacb:5b74 with SMTP id d37-20020a0565123d2500b0050abacb5b74mr1743294lfv.4.1700821690465;
        Fri, 24 Nov 2023 02:28:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:3471:930b:671b:cf77? ([2a01:e0a:999:a3a0:3471:930b:671b:cf77])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2758299wru.67.2023.11.24.02.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:28:09 -0800 (PST)
Message-ID: <7232f08e-dfe3-43d6-a4f7-abf8360bbfc1@rivosinc.com>
Date: Fri, 24 Nov 2023 11:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
 <ZWA9HwUNHDFIw0wP@infradead.org>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZWA9HwUNHDFIw0wP@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_022815_102582_E48EBF41 
X-CRM114-Status: GOOD (  18.94  )
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



On 24/11/2023 07:05, Christoph Hellwig wrote:
> On Thu, Nov 23, 2023 at 02:16:17PM +0000, Ben Dooks wrote:
>> @@ -319,7 +319,7 @@ static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_insn)
>>  static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
>>  {
>>  	if (user_mode(regs)) {
>> -		return __get_user(*r_val, addr);
>> +		return __get_user(*r_val, (u8 __user *)addr);
>>  	} else {
>>  		*r_val = *addr;
>>  		return 0;
> 
> This is the wrong way to approach it.  Pass the untype unsigned long
> from the caller instead and do a single round of casts from that
> depending on the address_space.

I sent a similar patch two days ago with the same modification. I'm not
sure to get it. Why is it better to pass the "unsigned long" type from
the caller ? I mean, the resulting code would look like this right ?

static inline int store_u8(struct pt_regs *regs, unsigned long addr, u8 val)
{
	if (user_mode(regs)) {
		return __put_user(val, (u8 __user *)addr);
	} else {
		*addr = (u8 *)val;
		return 0;
	}
}

Is this better from a "semantic" point of view and be sure the casts are
done in a single place ?

> 
> And please also remove this horrible else after return entipattern
> while you're at it.

Acked,

Thanks,

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
