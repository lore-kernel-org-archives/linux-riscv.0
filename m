Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA4C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbg27f/u3gIpO5AIcTeMHUyH3LEP55EG1dW9k4ZaQpI=; b=NUubtkg+fEzzg6
	zaih9UuYlFLN97PFonDHS8UiF/xMIoENstUh6oWChHrNDYE4TkXwC+Ivma6dcPFxDeYpyheTanI6m
	TR4UVobCrnlQYGidZ08V8fBg/MoXHJRTImR5ML7spMdZvs1JI661I/UY8VbUpRYi4/3h4kXMf8Pn5
	aly/osaUMEQFQTppeXrZPa1ShxYpVhDh6PJspxjlRL5WOQ3GbexdVp3p3YQhXGcpKcI4pPgf/FQnq
	TMQ6RrEN+K9WFxI79dXWzHTG230Zq4wN3W9RI0D28mUq7TtBfN64TUmwsoX4vfSrIPYiyUcaEzEwC
	V3fmUwReMkLZHRlf0jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9PvQ-00FkA3-26;
	Sat, 02 Dec 2023 13:20:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9PvO-00Fk9d-09
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 13:20:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ce3df4c282so1976b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Dec 2023 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701523248; x=1702128048; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38eV0LKdNi3TITjOGB0YU27nx54Nu5BIRGcEBAMr+DY=;
        b=kQv7+FFAX/v3+bCCdMNbp0Ae05saM64royOch7KvYXTyzBf/KWkyDlCqE7Ml72EanW
         1uTGl7v5ZKD5w6/8CsbdtRLjsHBMhFryoRaRUowjKzUe3c52ep+Z4UwFlVvsPA4D9bxm
         Oj8dGasifilq9uv2Wqzqd9RjCaa6UoOqPA4ghx7gHCxG4tjKqRfHKhrSlHKDfTrOAvTb
         urvC376WIOtivoydjZcRggLxfdZuLqZ26VzCkvUiuJiJHtYxRy+86qtQT3ZEkMFNLO26
         ihawDJfGc9WYWgAVPbUWg+Ti+yzgi33aiQS+bnCvWDzkWMX1WlY+SsH9voVGXIq3Yy0y
         0q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701523248; x=1702128048;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38eV0LKdNi3TITjOGB0YU27nx54Nu5BIRGcEBAMr+DY=;
        b=M3kRBcqycO2Y9Jah4Z06MSzxHm0Rjm75dXKGW++xVU7AKCr78f9zVOv/ZRMjU7CrSh
         pSNh+LWVYTd3UJtvaV3LQQLafuYeagDKAHnpvxnbzu+RZqew9023gbG31ptxIFJVglNE
         pmYkXkZ9j8ULoikhKlmqxwIpiQ77ByY/fBGCLudfQvPYBJ8cmFHgN2cUCeKkKJqcjm3J
         0ZJLcauGNu3904oigcfH8bmKah435B+Zyo/kbxQq7NKmfNo4XtUZ8KoNe5J0QV/AnPPt
         Vx1DZriTrF4k5mjjqBM0G0XAAcBM71TqWIvyIf15hGLAyDVjyskien9UxnZ5GQZSCpUg
         UXpg==
X-Gm-Message-State: AOJu0YxvjcghwcIC+A52Buc5FGU4YmkNWm164s5x8wONksmoONGW1mxS
	NlefpMDRihJHVN5U1SHK77FQyQ==
X-Google-Smtp-Source: AGHT+IEzgP87enLKzkmPs6y8qDB6CMCPP38yBGAzMauITYCVSxePOcsnUgMZlQEjr/wK10DVgz7vOg==
X-Received: by 2002:a05:6a00:2a09:b0:6bd:9281:9453 with SMTP id ce9-20020a056a002a0900b006bd92819453mr483081pfb.9.1701523247890;
        Sat, 02 Dec 2023 05:20:47 -0800 (PST)
Received: from ?IPv6:2402:7500:4d5:3c6d:245f:1df8:d6c0:9d2d? ([2402:7500:4d5:3c6d:245f:1df8:d6c0:9d2d])
        by smtp.gmail.com with ESMTPSA id e2-20020a635442000000b005bdd8dcfe19sm4614743pgm.10.2023.12.02.05.20.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Dec 2023 05:20:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 07/13] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231129201601.GA1174@sol.localdomain>
Date: Sat, 2 Dec 2023 21:20:42 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <67F5B520-ED93-4CF2-AACB-D0B64F5B38A1@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-8-jerry.shih@sifive.com>
 <20231128040716.GI1463@sol.localdomain>
 <7DFBB20D-B8D4-409B-8562-4C60E67FD279@sifive.com>
 <20231129201601.GA1174@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_052050_121575_EAAFE85E 
X-CRM114-Status: GOOD (  22.34  )
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

On Nov 30, 2023, at 04:16, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, Nov 29, 2023 at 03:57:25PM +0800, Jerry Shih wrote:
>> On Nov 28, 2023, at 12:07, Eric Biggers <ebiggers@kernel.org> wrote:
>>> On Mon, Nov 27, 2023 at 03:06:57PM +0800, Jerry Shih wrote:
>>>> +typedef void (*aes_xts_func)(const u8 *in, u8 *out, size_t length,
>>>> +			     const struct crypto_aes_ctx *key, u8 *iv,
>>>> +			     int update_iv);
>>> 
>>> There's no need for this indirection, because the function pointer can only have
>>> one value.
>>> 
>>> Note also that when Control Flow Integrity is enabled, assembly functions can
>>> only be called indirectly when they use SYM_TYPED_FUNC_START.  That's another
>>> reason to avoid indirect calls that aren't actually necessary.
>> 
>> We have two function pointers for encryption and decryption.
>> 	static int xts_encrypt(struct skcipher_request *req)
>> 	{
>> 		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_encrypt);
>> 	}
>> 
>> 	static int xts_decrypt(struct skcipher_request *req)
>> 	{
>> 		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_decrypt);
>> 	}
>> The enc and dec path could be folded together into `xts_crypt()`, but we will have
>> additional branches for enc/decryption path if we don't want to have the indirect calls.
>> Use `SYM_TYPED_FUNC_START` in asm might be better.
>> 
> 
> Right.  Normal branches are still more efficient and straightforward than
> indirect calls, though, and they don't need any special considerations for CFI.
> So I'd just add a 'bool encrypt' or 'bool decrypt' argument to xts_crypt(), and
> make xts_crypt() call the appropriate assembly function based on that.

Fixed.
The xts_crypt() now has an additional bool argument for enc/decryption.

>>> Did you consider writing xts_crypt() the way that arm64 and x86 do it?  The
>>> above seems to reinvent sort of the same thing from first principles.  I'm
>>> wondering if you should just copy the existing approach for now.  Then there
>>> would be no need to add the scatterwalk_next() function, and also the handling
>>> of inputs that don't need ciphertext stealing would be a bit more streamlined.
>> 
>> I will check the arm and x86's implementations.
>> But the `scatterwalk_next()` proposed in this series does the same thing as the
>> call `scatterwalk_ffwd()` in arm and x86's implementations.
>> The scatterwalk_ffwd() iterates from the beginning of scatterlist(O(n)), but the 
>> scatterwalk_next() is just iterates from the end point of the last used
>> scatterlist(O(1)).
> 
> Sure, but your scatterwalk_next() only matters when there are multiple
> scatterlist entries and the AES-XTS message length isn't a multiple of the AES
> block size.  That's not an important case, so there's little need to
> micro-optimize it.  The case that actually matters for AES-XTS is a single-entry
> scatterlist containing a whole number of AES blocks.

The v3 patch will remove the `scatterwalk_next()` and use `scatterwalk_ffwd()`
instead.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
