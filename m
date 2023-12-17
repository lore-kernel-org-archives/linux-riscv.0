Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C8DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9TYTafHf0KnmmDnEproZDVojFa0BCLkNtT+37XTBNQ=; b=kn9FzaalGp1KuG
	hqLahcNV2zvjI3GEU9AVPs0PTlrIZH+2xgV42QvspvHg/e4JoV2E9je9F3fHyYGYvgQF7WrlBCAxd
	3eFaB15DhqBNd2xqqHdStiwNG7+r4lBRB3vsEkr7aUyczFZeFUc19oma32cyMTRMgy+l1hr1E3leH
	MX7+LE7TyTPlFOh8vPj4BzuHzLLKMLjjoiGf4iVOc834+0Pn59j+Q2P3ggd1aMj+kUiP1ghMPJmmW
	llmpinb05+LvL+ka8tKmC+zZk3XV5rrySqR55f3HuBhTCS3yOauqwvhKS3Fh7hTz/RMZWXGF4vR+E
	ebCGUIdyZUZACqiMzQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF0Tn-008dGE-1o;
	Sun, 17 Dec 2023 23:23:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF0Tj-008dDb-0a
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 23:23:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso4774205e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 15:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702855401; x=1703460201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNDNxYIAR2omW0Iw58oFmO1xHTduBk19i+Qg8GrwOok=;
        b=ilBUu8dKmSN6FpMBwDJHlfOQBIhflMpwpy/4y/T/6hjX1BOO3G8w1LRjtcGhnLD7A5
         /uLs3IY+qC5DhSjRJ9ogannxAsvCYcn7Gpj4NtMCAcEhPo/K69KREiELV9VkDWjtwl5C
         gB/vpXZNJkPEAyUmw3Xcl/ch4mzErqeAQ5h68tLUASMjZSqZAG1AwaDj1stIIjv8Pau1
         MicPYz4ujfmQaUm3dxI3lXx5Zw8js8cfZRGZl+9beT9wxvrSaoxr3L0tiJj9k3oqWBKn
         kJA9+kxorNImZTq08++yjU4sado9EMDiIMErLb9kAPb7wXkF3IoM0cikue0Br6Da788Q
         sXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702855401; x=1703460201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNDNxYIAR2omW0Iw58oFmO1xHTduBk19i+Qg8GrwOok=;
        b=fU3apEko7/siUpj8faibmBa6B8AcjVDeyNHHftEJcGB+PT7zGVf+LQlzA8qY9Ke4+C
         LxSeSHWmy+ZBxcM3kNDQLrgWkjEl6Q6r4y+QmUJcCbXuk4ICk2WK6fcgzjUqyHwL0n4n
         /ZiJeyaZLYdr7wCgl4YtLsVuLqb77Hqusj/mYQWMutEIjYC0YK8xrJbPKSw1+F1425V2
         PierG2qf5mzVWbzVdREuwKcqn+kRj2H8b0AI6zgiWi2i7qMxkqLJE9x347XtOmdQo3aC
         TAkjjnDHiNU+ltO+FRKDT6S1ZERS6CgLAkqMxfzhGh5VYv9ARkS81NaRCugc6LiZqLOS
         /A4w==
X-Gm-Message-State: AOJu0YxObdsYjZ4ZDf7lHRSX1+GNlB+MxS+iUxV9WRPFz2drbPy6HldO
	Uf/+bEsD7GPLSf3Ir95Zsy0=
X-Google-Smtp-Source: AGHT+IHyOMxeW366N8PbMvyg6sMfhnuAlxg/FsrFIarplTZzdIwS7kgg8aZ4vkJBD7Ydh9FG5wTROQ==
X-Received: by 2002:a05:600c:3b23:b0:40c:2631:7c3d with SMTP id m35-20020a05600c3b2300b0040c26317c3dmr18479856wms.2.1702855400878;
        Sun, 17 Dec 2023 15:23:20 -0800 (PST)
Received: from ?IPV6:2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa? ([2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0040b48690c49sm39724440wms.6.2023.12.17.15.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 15:23:20 -0800 (PST)
Message-ID: <45351e30-d197-4b9c-864f-8ff5f9b6ab61@gmail.com>
Date: Sun, 17 Dec 2023 23:23:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: Optimize 'strlen' function
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
 <a210197c479e48778672aa13287eef88@AcuMS.aculab.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <a210197c479e48778672aa13287eef88@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_152323_264322_284876B5 
X-CRM114-Status: GOOD (  14.18  )
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

On 12/17/23 18:10, David Laight wrote:
> From: Ivan Orlov
>> Sent: 13 December 2023 15:46
> 
> Looking at the old code...
> 
>>   1:
>> -	lbu	t0, 0(t1)
>> -	beqz	t0, 2f
>> -	addi	t1, t1, 1
>> -	j	1b
> 
> I suspect there is (at least) a two clock stall between
> the 'ldu' and 'beqz'.

Hmm, the stall exists due to memory access? Why does two subsequent 
accesses to the memory (as in the example you provided) do the trick? Is 
it because two "ldb"s could be parallelized?

> Allowing for one clock for the 'predicted taken' branch
> that is 7 clocks/byte.
> 
> Try this one - especially on 32bit:
> 
> 	mov	t0, a0
> 	and	t1, t0, 1
> 	sub	t0, t0, t1
> 	bnez	t1, 2f
> 1:
> 	ldb	t1, 0(t0)
> 2:	ldb	t2, 1(t0)
> 	add	t0, t0, 2
> 	beqz	t1, 3f
> 	bnez	t2, 1b
> 	add	t0, t0, 1
> 3:	sub	t0, t0, 2
> 	sub	a0, t0, a0
> 	ret
>
I tested it on my 64bit board, and this variant is definitely faster 
than the original implementation! Here is the results of the benchmark 
which compares this variant with the word-oriented one:

Test count per size: 1000

Size: 1 (+-0), mean_old: 711, mean_new: 708
Size: 2 (+-0), mean_old: 649, mean_new: 713
Size: 4 (+-0), mean_old: 499, mean_new: 506
Size: 8 (+-0), mean_old: 344, mean_new: 350
Size: 16 (+-0), mean_old: 342, mean_new: 362
Size: 32 (+-0), mean_old: 369, mean_new: 387
Size: 64 (+-0), mean_old: 393, mean_new: 401
Size: 128 (+-4), mean_old: 457, mean_new: 424
Size: 256 (+-13), mean_old: 578, mean_new: 476
Size: 512 (+-31), mean_old: 842, mean_new: 573
Size: 1024 (+-19), mean_old: 1305, mean_new: 777
Size: 2048 (+-97), mean_old: 2280, mean_new: 1193
Size: 4096 (+-149), mean_old: 4226, mean_new: 2002
Size: 8192 (+-439), mean_old: 8131, mean_new: 3634
Size: 16384 (+-615), mean_old: 16353, mean_new: 6905
Size: 32768 (+-2566), mean_old: 37075, mean_new: 14232
Size: 65536 (+-6047), mean_old: 73797, mean_new: 37090
Size: 131072 (+-10071), mean_old: 146802, mean_new: 73402
Size: 262144 (+-18150), mean_old: 293003, mean_new: 146118
Size: 524288 (+-21247), mean_old: 585057, mean_new: 291324

Benchmark code:

https://github.com/ivanorlov2206/strlen-benchmark/blob/main/strlentest.c

It looks like the variant you suggested could be faster for shorter 
strings even on the 64bit platform.

Maybe we could enhance it even more by loading 4 consequent bytes into 
different registers so the memory loads would still be parallelized?

-- 
Kind regards,
Ivan Orlov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
