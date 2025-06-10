Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDB3C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9lAMH1cX9dczulUSsuRqUjHF1rBijTIcgpvT81ONZw=; b=UlkC4nbM0fGsmV
	28d+q3qOeWDjqgN+WFez79hpdMkgS7DWM2iItPcPS7Owq0U0SY2wAkJxJbvZyLEvYNoWlk7FMLsAs
	aCXKodEgUgKQkZ17LXBXS/76CiN50Beb81BY520l6Yqwzu4x6/hAhLE64hwHoJnfL3GacE8Md94HC
	o4tvFI3aotB5BF7CDKfUJxuwiBttteonRRN6T2aqhcfM0W+v+ylpIYAg92jTV20GToEFrP6aTVbdW
	pM8N5lqG7XJWK+rq4FldVLXF/uHghIS5BdbcjMepgNdnSh7MIrTeLiAPuKQ+Z62f4yb6V55Wy3wcZ
	xe4vhtvwF3EDPqmfWYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1WL-00000007QLY-345x;
	Tue, 10 Jun 2025 16:08:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz01-00000006xjL-1FcL
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 13:26:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45310223677so19140535e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1749562003; x=1750166803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LH44WntEY2fTVqXbHAq8i1nzDw/kDJ8Gl3v9f3DoQvQ=;
        b=Bj1FZ0agr1UTw2yVgosG4YMyAEtVGmuvtZz1znNh1VovFrzHg2KpXovf9Zb1hwVI0j
         SNveG0pGFxuTyEqdgpGWRPRr8P51itz/fTi6/2CbyIJepR+zRw2lmWl9lXjkDRelBgCu
         ZbXNUYgQwlAocKXyMOjH4CFJeSaVSZq49oJ1Hm9E30GB64OHUpnnL7/RLxF5fQfTgDwX
         HWsOJpCoPPEBdQRqPTuF6eI7Pl0BRtb/MWLfJ3IrPXVABGI9YfRAqp4FoTJXoXe33R7n
         Sddna9zZ0B5hFZjYi++dVg8inF9iN3BqbMA4fTnsUlnC6fA5q9CyYRXaXBvqDFSJxuPn
         HN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562003; x=1750166803;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LH44WntEY2fTVqXbHAq8i1nzDw/kDJ8Gl3v9f3DoQvQ=;
        b=ASXDGyONawuzNixbWs8/cQVgWKY33LCs2u3KxvP4RcP9Bhux7P5yTetQ0c228zbwT7
         YBL8omqd4YdtC/fg45YpfWCa0gHla91tHADxhqFSuG2GvSARBogOuWQkrvDcctYlP3U6
         RNQ1HiIufdF3rTmfeSC9QVqQJ8Kjw8xn1SB5LcCN9QxVHW4VVNPdT5NH3QcRoUrn3fTZ
         +/BPPMX61kJD3Q0IA9OWmfoDnwe/Bp9DCB79a/tWjC72vq9uGCTkBMz3D6qCkw8PrdJG
         2iPb9uz0TuxmLgIMAFvP+q6GCWsIXWpyqi0adVHndOvReHOGx8nthh30H/F7+6Py7O9d
         Lv9g==
X-Forwarded-Encrypted: i=1; AJvYcCWbQUjSjlvi6ha1p69bOfVhWLTd0TiRRqaSMpgLXUISHtmPRjq3oWd57RKnrms+J6+rBnUkEUJKYcwP5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze0wNrNNZL1swIRHndUaJ1I8K1B4vRHdttQOdONJgwmykWVgTT
	O/+DQGViYRworQ9Lw3VgOx6NDIOuMKBTgyIZ1GUZ42QEEUJQgCbUDyxhkh+HlaWwPm0=
X-Gm-Gg: ASbGncsStB1Sy+M4s8b6/t3CEAUZruQFSrtOMx+Bfe+T/6JWqownUB17u5veGLh3tHR
	2ee35asnBcNiFrS+kigXQdtHVRVxEANY6CKNGmjlJgXHq2JETj+jcpRpmKgJaDyh4+rCspMcWyF
	HpkQLvmzjZHxphWGdyfJ+OvtyAKMTphNLKF1zKkqDj0bf/Ez/wqY2WUj0NwyUW68mo7x+/vlxR/
	fISOAkCtRxsFK0c66at/Z0YhvMpt5mGlNKboBIa7eLWbusqCq1O8YbnkQt3Je3kAIGr2RUS6o8F
	8xcACczDJzXYq31uWnuXbnAdiRVfEHtTYnF9s0S9UJcpNx6mUomwXjkSxIermUfM3Zepbw/i4iR
	DY4sreULW8c9aVwrG
X-Google-Smtp-Source: AGHT+IFlQReiFJK/Af7RgrjNQqPklkEfv1/bZJWTvAfp+oUAWvrqUQ2eGtnyyMmp2qtcoWM8f0FNSA==
X-Received: by 2002:a05:600c:314a:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-4530bba5129mr95169265e9.31.1749562003150;
        Tue, 10 Jun 2025 06:26:43 -0700 (PDT)
Received: from [10.59.10.179] ([185.201.75.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d15f4sm143315905e9.40.2025.06.10.06.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:26:42 -0700 (PDT)
Message-ID: <f237f87e-50bb-4cbe-a1f9-f1ce41173725@cryptogams.org>
Date: Tue, 10 Jun 2025 15:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andy Polyakov <appro@cryptogams.org>
Subject: Re: [PATCH v3] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Eric Biggers <ebiggers@kernel.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250609074655.203572-3-zhihang.shao.iscas@gmail.com>
 <20250609201306.GD1255@sol>
Content-Language: en-US
In-Reply-To: <20250609201306.GD1255@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_062645_339917_F2A77599 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

>> +void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>> +			  unsigned int len, u32 padbit)
>> +{
>> +	len = round_down(len, POLY1305_BLOCK_SIZE);
>> +	poly1305_blocks(state, src, len, 1);
>> +}
>> +EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
> 
> This is ignoring the padbit and forcing it to 1, so this will compute the wrong
> Poly1305 value for messages with length not a multiple of 16 bytes.

Right. There seems to be misunderstanding. It should be sufficient to 
pass -Dpoly1305_blocks=poly1305_blocks_arch as one compiles the assembly 
module, linux/lib/crypto takes proper care of the padding and the padbit 
to meet the assembly module's "expectations." In other words there is no 
need to implement this glue subroutine in C, not here.

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
