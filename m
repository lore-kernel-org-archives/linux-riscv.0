Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E326EC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duI0XAdqX2rNNSWqTQ+oJnql/bKsWyt6AIye80TAhRI=; b=1FWUCf3hjjeRLZ
	d5zJ+zoQZLl+WW8R2Cp0+XI7uOrz52CyibB7yKic1ZtRFMqNatSwg6nCMz0bQ/k0OFgxGZd+PA9mQ
	0oMR5lUZeD+xBHC1KTiyLN6bRnWuo9LXrvvQP+Ddx0NYrWb9+zHXbYA8lmdfhxr9q3/lXUzy0ZUSn
	Wc7PWzW2uJyosMOh+DejcxuFpq9wCfIc9B7YAg/dVcOSTeUmUgBKKVTpSKYtgGSXzzrwO7TAKCqMw
	pQlGRwCYdOuxPpaBMpuLm6RSKdKC7StnqOku/1YdppgbX1sj6YqoO4Iex6H3oExNjDUEU6GlFkO+X
	8HVRXy8+hXW7VQHLwihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjwL-006EVx-2R;
	Mon, 11 Dec 2023 17:19:33 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjwJ-006EU0-1w
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:19:33 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5906048e9e3so2014615eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702315170; x=1702919970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=mMr3FrOA0gGF2f+HHfOUr8IBVeSUmAqH5p5vIOy76oY6O/l5MtgIRazUMqxb82InFm
         lg0RlSNCESm4JU4ScNI0rBqxLLasze1KRHT8KrYb6pm/jHgXLzONmsOOLYtpWX91EptN
         QOaEitvRdl9+cDRpPH1Jv4HCEg9qQLJ9Z32wu9L5DIFqdI80/46Ev7AB2sjHplGilpOn
         HnP+S+YkXhXBd5G+CDOV1BaDo4dyGW1KTZvNXLYl4fsiXcKeW20AJwOvE97RtzM2Z1ym
         rTFkBfW2m5CfvRjTWBfSck6w1gzZts61+XYeDbhCg7LjOqjs0DwtCy3S5qB3BfuTrBzS
         AeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315170; x=1702919970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=mrOP0F6R+HcRW6oXCHPCykdj/Vp/NPBDWjyuqgF/bIjKhhGoWybj8MeOrsbsIxuNRV
         IUmkB1UiQtAWgdoRH5ZOJ7/nVsfNoN8updSXd0QL+adpDDGMq4WV1HydoYn7aCNFgvhZ
         w5j2jj/8Ro4MUw12da4sRc/1sj4U25rbM1G6bTesiDQr5QbBDY7LXRqE481nnxOx2Kq+
         kdPFiXtG424fzrGdFFFsKAAPwKon6VCNyfGd0OTZW++sUHBLhiZOY1aihyYH1PYLvZAh
         RM7e51a6Nb3dt1sneso6l7xIiJ9t6As/q6+bAO0oj28TLj3lKrzAYX26naj49r49Edya
         r8bw==
X-Gm-Message-State: AOJu0YyqWaIPv1B+fEwmnI79l9sIYBL/J169Gvn7xhmk03QPV3TAl/qB
	IpuYgLCbsJVH/yjUNl5De1TbpySZaoL3SqSbWXTfZg==
X-Google-Smtp-Source: AGHT+IEC8jdvAnetFbqJVF6lQQw8UXKnB/IQiMsN2t2NyqglmpS9Xy9aZsTAJAYPyNV0NsZe4DU6SA==
X-Received: by 2002:a05:620a:15a8:b0:77d:855d:1b09 with SMTP id f8-20020a05620a15a800b0077d855d1b09mr6457241qkk.0.1702311148452;
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id a15-20020a05620a066f00b0077d78afc513sm3014865qkh.110.2023.12.11.08.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Message-ID: <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
Date: Mon, 11 Dec 2023 10:12:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
 <ZXczty+Y6dTDL4Xi@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXczty+Y6dTDL4Xi@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_091931_637457_55233664 
X-CRM114-Status: UNSURE (   8.78  )
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

On 2023-12-11 10:07 AM, Christoph Hellwig wrote:
>> +CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
> 
> Btw, do we even really need the extra variables for compiler flags
> to remove?  Don't gcc/clang options work so that if you add a
> no-prefixed version of the option later it transparently gets removed?

Unfortunately, not all of the relevant options can be no-prefixed:

$ cat float.c 
int main(void) { volatile float f = 123.456; return f / 10; }
$ aarch64-linux-musl-gcc float.c 
$ aarch64-linux-musl-gcc -mgeneral-regs-only float.c 
float.c: In function 'main':
float.c:1:33: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                 ^
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                                     ~~^~~~
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
$ aarch64-linux-musl-gcc -mgeneral-regs-only -mno-general-regs-only float.c 
aarch64-linux-musl-gcc: error: unrecognized command-line option '-mno-general-regs-only'; did you mean '-mgeneral-regs-only'?
$ 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
