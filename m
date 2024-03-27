Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8983CC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLwUWUFm1/MmWtEBGHCOUC6hw7g0oxd6NaTxe9TYBcI=; b=U2ebdDqMMYI0of
	KoMSuX1B6Jn7CwYtt1fVIxyfLIsKiO/XxsSo7QQwcYMvHEIgBnJq0BuOw7a2fZ6VW7E2WlcuCiH8U
	T+bTSq1Gk518a5YbrgGe5R/zDHIzNoGzjOpJyvjQ8V8DCRfYbgB0O9qvb2uEiknGYmnsT4USLOCaD
	BDgUTUWYrHNp99q40ig3wLbmW0z0C12bPWAnHxAUmQlL9VukvbVWCUH65ZPGxKz9YVC4FKOhRf1xy
	2nMLJ5BYurDpA8AT/CjGQj9+dCic8u/CQWje5rKVR7WvKq7t1p25pz9UcELyJbeglc7Mp9SIk00CG
	hg12pSbi2Rx6FUaO7VVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVyl-0000000A326-1SZs;
	Wed, 27 Mar 2024 16:18:19 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUxE-00000009iHu-0sw9
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:12:41 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7d07e8c5e04so26137339f.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711552356; x=1712157156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuoTzi8rOFJ87iK0QDMAtmZ0NUzmHRlY2Wibz55w4qg=;
        b=fB33zyOx+2b06spuoDDWM29wwFQX1dXyI05MOhiQ9NGX7xq38mDhtFS006+MJ/uBtx
         UCvqk1RO9kXM6QjeHS77fkorwziPsaYANXkPdEJ/VtZzPKlS6DCmRR8jxPJzgSAYbP6x
         +BNoRftD6P1LVFZ2l3NBQBaDEB/6KqY1BMTAhZX1OeKhFCRHpzxSHaA1dIIB6Z8OSjv9
         7wIjcuZ0kvjlBxRenKva66d7j/by1ARdSM3lKcpSAIyxTp9ZlEZ6dofBNvL/gYkmWJ4/
         d+ZnU9mh1cAXoH1Qg70vxBGzooCvkLFMyGaKeVL0mUKU1tFBpeRmeM4mKOTWVRFlo0bv
         yBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552356; x=1712157156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuoTzi8rOFJ87iK0QDMAtmZ0NUzmHRlY2Wibz55w4qg=;
        b=GbVx9iFd/VwimJ7UU34tzXaOZKlJlvTmFoHHHwolHMvX1JcpWwmJERfQvvatttSBa5
         xx43q5wHdu89igoevocjCv8Gvi5e86ZleH1aTVMutG7lKE++ifmGBdF97J2vVQepBJLi
         lZvfxnE0ITfL21upoSX+dcQ0WzjXjG7n4M/BZF0P2VJHR/+kFk8zZwpQ0WOMuMelLiwd
         ts1YdYc7/0YPpQXfM+0MXvTN1MhNw58SW2vl8AghXQRrxu+bWveHrBRVmo2iSIlzPthc
         QD6SR0G8ibSkMMCMhLS8ieBLHbRedc5WGlELUN44Vj3FbZfag75M4KYxe/EN0Uiani0X
         R8jg==
X-Gm-Message-State: AOJu0YyNV6xw3xGQivoyjQmmaa9WWfYYpB/xKNoLtZPhL4rD3imd7TTu
	PwMHNmyinY3vYQpHbfdo6HolnXT58lvQyL93ARfWTeYk0GhddamaItUH1bvbJEQ=
X-Google-Smtp-Source: AGHT+IGqFH7jy6vdiT/UHr/bx2+JznqAw0ftyUqt4N09oQx6Vx2n3f1L96q65Y0mwHXiMutMid6ZNQ==
X-Received: by 2002:a5e:9903:0:b0:7d0:676a:d0ec with SMTP id t3-20020a5e9903000000b007d0676ad0ecmr486405ioj.0.1711552356161;
        Wed, 27 Mar 2024 08:12:36 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id n15-20020a6b410f000000b007d0445ac470sm2603214ioa.29.2024.03.27.08.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:12:35 -0700 (PDT)
Message-ID: <198af54d-10da-4320-9623-85dfb102f5de@sifive.com>
Date: Wed, 27 Mar 2024 10:12:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] riscv: Simplify text patching loops
To: David Laight <David.Laight@ACULAB.COM>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?J0Jqw7ZybiBUw7ZwZWwn?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-5-samuel.holland@sifive.com>
 <874je4fvxl.fsf@all.your.base.are.belong.to.us>
 <cb89b03b34d6403685297f95924524a7@AcuMS.aculab.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <cb89b03b34d6403685297f95924524a7@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_081240_312001_875658E1 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi David,

On 2024-02-19 4:13 PM, David Laight wrote:
> ...
>>> -	while (patched < len && !ret) {
>>> -		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
>>> -		ret = __patch_insn_set(addr + patched, c, size);
>>> +	while (len && !ret) {
>>> +		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr), len);
> 
> Does that need to be min_t()?
> Both arguments seem to be unsigned.
> (Did it even ever need to be?)

You're right, this never needed min_t(). I'll update this for v2.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
