Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA825C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P52FE2wjVNF6zIQaXgirQ4kOKA/p3WwGCjK0R9N3yaU=; b=Xe11kwR0q4LlJ2yJ9S9pWZIrxp
	FeM9O2P6ybsBshcxXhHI08WkjGy7O8xCsaT04uz1owXMzygD4fdGMWKrHIZsRpOBNkp5/CDJwvfqS
	Q8Cdm6PVuoGN3mrD6yAtpeOLA+JYYhOxHxL5heEkxy3rGhf3zfqhxhMesF8r6DW+69mWEJLRq3JsH
	GA6r8sphN2Q2nisY5UlBfJ84nJ9+bXFDCym8wtGelslYmMkod2kN3xiS9gKVJR5EfOpzrI62P8n/t
	zLExfqQFYK/pUKWfz4fn7Rn5StGQ407Brkk4hOcKOK85m84y7D+1X98tO7hybfAebiL5Px6jgGHwx
	UQdPbT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnul-0000000EPYz-38Qh;
	Thu, 12 Jun 2025 19:48:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnov-0000000EGVI-0v3W
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Jun 2025 19:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=9wU2gWru+pGp/2bdnX0/py0HOFjAqRaBE4NmRyG3YyE=; b=j7uNAyugFYBkGa2mgnF157332N
	HfXgNtZaAXgWUen4V2iBpQUT2KomMT9s3cEAecPzUqOZsTk93T3J/uNqHnEeehasaEofgfIr9iC15
	rZOzu6ak8QdR25LWQ7ckX+h3FZ/bEeBubvRboX7MXb1aUhHwg5ubdY8q1qrENxdGdFNUCMA+ZoR3g
	XlvQD5YmahiwLJ4/kL3hJNRCjegzks90/DbiEoaUrR+PGTMbl5mjLeaFTL8az7YnnF7Enj0o6ktqY
	/JplPXFptdc8hNA1i93hdxJPfWEKMK144026rEnBxJhoif7i/ulLGqzcyjx4L8iy+OcWzfI1jCEaz
	HwpwciOw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnor-00000002dzF-2vHs
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 19:42:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235e1d710d8so18622805ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749757353; x=1750362153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wU2gWru+pGp/2bdnX0/py0HOFjAqRaBE4NmRyG3YyE=;
        b=dyXaswAJfxj+bvyT9/d/CqLghS4Jc81gTtdrooErRLx4DxCi3HTTA81JhOgyBVzqVb
         s4stEYJTPcQcga1UAfPnlXfFHL6v3BqKaS/tiRDpq1nZWxjRMjWu3AdUuEbWSRJeGSGr
         jZVAXnB4Ikr31S/PNmoHKJ6MXHhBaYSXdW2bgc7QWDU0l0DaTWynT+Y1Q9y4fNEYKF/6
         VOylaWD6prDWHxsUMMr2ei2AorDEDVFUpLZVqbfUOqsXjjq3NETnqiyI6MXLoHd9x6+1
         8zviBLGskypkMVUFyuVzaE6MlFvtFPHdoivM72v15+l23wJ3OXHy/Gi36xRzAxs4ub8V
         gnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757353; x=1750362153;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU2gWru+pGp/2bdnX0/py0HOFjAqRaBE4NmRyG3YyE=;
        b=gp31y7fLBAVOPyTlFbG3E4CwL6GIQUOZBmzZ/xWshvnhJzQwMDy7H/ZbU1ASOmFHG0
         3GXPPZGlUsRgmk36Avn2mvjO44o+DRpn+qfZctGF0yS+od6xtKcry6SdX01Zg2N/Fqbc
         nSoUGG8pTeiV8jLN0QFAMbUTIA/EUyCaP7u6d7pMlw8aYYy5lImWqzA9PO+c7etYOy4u
         TxlfdkikK2VXQMpv55+0alOjmDhJSl8HiU+0aVgCEyOLHWGKDvrlz39elfVPBM+hqY2E
         +t5mPHFGezd5WwC4iMKGPbSuLYhgr5GFddvsyPxd9NMLrPLIZSGodAyrWrTfBsM+aA08
         +YGQ==
X-Gm-Message-State: AOJu0Yw7vh4CdjuNDCoxSx5Twi82oM6gHCLFoTlLDlApazUpg7kYigmM
	r7yuC9eDvXkWRXJ2guBnFG5JMmD+EqSbk7HhbG9dG5fJtlb95c/dYZaiusNWra/8EB/XZ+LWMAg
	vc3l7
X-Gm-Gg: ASbGncur7U8hlEspPKG3J2XeEt4WgOwIbq91NjIyhuNWAp+pW7wyHTXqmAqFnNujzxp
	CXGhA4ifjffh6BXulMuczjJ+x6cyB3395b3/Pd59RsmYWIQ4g0Z9HUPybwHRFsfk586V3bGZU6F
	oLy65DXZgaQ6A6Kv5B7Ot2vYur9Sp3LIHta+hw+8wgcMMUpNVOtlP+pHlGdKb78kzEtbV1l7VGX
	uA2EnrTUzF7MZKa1z8t8xgza7BWa96QHJIcOV26SwjySxpSWgq4i3i8+20x075IW3iDveykfy6d
	iDZhJOLXTbW6FS/RWnW3jReIJbR5K5Y/O/43ZtM5y0vy0KxjaOw/GPBbHI3S
X-Google-Smtp-Source: AGHT+IHGeSTc+wMQKofdFqp+fq6QEkGdV+HYkmUzLXbvgEikoJEVAyqi9G/tKmrk94n8EqfMCvEsqg==
X-Received: by 2002:a17:902:b185:b0:235:866:9fac with SMTP id d9443c01a7336-2365d8a28ecmr3212175ad.2.1749757353002;
        Thu, 12 Jun 2025 12:42:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365de7832asm949425ad.140.2025.06.12.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:42:32 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:42:32 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 12:41:38 PDT (-0700)
Subject: Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
In-Reply-To: <de5e9d8d-c620-4371-8c74-7ef804d97d53@ghiti.fr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, cyrilbur@tenstorrent.com, jszhang@kernel.org, cleger@rivosinc.com,
  samuel.holland@sifive.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-6698D901-534C-4886-BDB3-BB4EDF14E7E8@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_204238_172953_3EF98E7D 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, 11 Jun 2025 00:31:18 PDT (-0700), Alexandre Ghiti wrote:
> On 6/10/25 23:30, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>
>> I must have lost this rebasing things during the merge window, I know I
>> got it at some point but it's not here now.  Without this I get warnings
>> along the lines of
>>
>>      include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>>       3975 |         if (unlikely(get_user(c, path)))
>>            |                      ^
>>      arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>>        274 |                 __get_user((x), __p) :                          \
>>            |                 ^
>>      arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>>        244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>>            |         ^
>>      arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>>        207 |         __ge  LD [M]  net/802/psnap.ko
>>      t_user_nocheck(x, ptr, __gu_failed);                        \
>>            |         ^
>>      arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>>        196 |                 __get_user_8((x), __gu_ptr, label);             \
>>            |                 ^
>>      arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>>        130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>>            |         ^
>>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>   arch/riscv/include/asm/uaccess.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index d472da4450e6..525e50db24f7 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -127,6 +127,7 @@ do {								\
>>
>>   #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>>   #define __get_user_8(x, ptr, label)				\
>> +do {								\
>>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>>   	u32 __lo, __hi;						\
>>   	asm_goto_output(					\
>> @@ -141,7 +142,7 @@ do {								\
>>   		: : label);                                     \
>>   	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>>   		(((u64)__hi << 32) | __lo)));			\
>> -
>> +} while (0)
>>   #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>>   #define __get_user_8(x, ptr, label)				\
>>   do {								\
>
>
> I had come up with the same fix so:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, and I guess it should also be

Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")

I'm going to put it on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
