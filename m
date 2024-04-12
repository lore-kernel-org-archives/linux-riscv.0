Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09270C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLuCOR78hbFarHGOYJDmy5O31f/LA5F3cNf5nmg3ENo=; b=tUDhX3cSRO4yqf
	hbhWXCU/5QKVqcKMHH3bcoqXbXzEZ99f9ljPEKZCwzQI+JmcedWA9hKyRX1I4vNHFrcPBhaZK0uYU
	pDQmjB4sckK083qwJ68IF9O3GkxLc8L+zI7TkcQC5kkLRK9EfoUIhoFSrNaTkuEKxppHgK2yOJElM
	dmww/oGDFjLFWxFoCl81gfg87dKg7vx+XAfhZNpg3s4GYO4knCAAeTwOA4tNitXiv3vJCEpVMgqsP
	NbjFds9WRQWoSBvytGFYZZlpJoUL2Rp4T2SWjZSaK/RzA4MeggzSN0rq51Gu707lONTrXIKQ4yWQN
	ktTL8uKEgEUyxGw7F3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBwf-0000000Fzvf-2C0w;
	Fri, 12 Apr 2024 08:07:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBwc-0000000Fzsk-1bzF
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:07:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2a68a2b3747so411919a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712909252; x=1713514052; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGl9jdbv5Am2wxVTko9m/8o+kZf52GqNyMAe+a/ezhg=;
        b=lQyk9o8zStw2hBBXZOoaung5R+bjRoNPcAZztkZsTod9YpP5iyk/Conv2SZOPwEbGd
         sYNUvajz9IRZF0M62shImD4K3TXi8cpxGkdfcWLUNChP30dDMPRN7V2g2qwnYEsliHys
         NC2rEU1KMt/3pdjsPnE8seX+sdwlvZ+rti15kvTzGSDbd+NAFsFGITVWbmETr8zzdeVi
         AXbEbRV9wqxGZhX7JoAiCXUWAl6IsN12W1vdxE5p5OeURh/c7Smoew6et24LZL9HrwI0
         Uc0nuRZ4+r4DCKl11quGxSoZxv5tLfr6LSsktM4oMnFrrNN2oT7KHdZjEl4FM4m4xnKL
         2wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712909252; x=1713514052;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGl9jdbv5Am2wxVTko9m/8o+kZf52GqNyMAe+a/ezhg=;
        b=DpMM1NF7jQ+cM4x88ezZtwd8MlW5VXMBoXnVKAVfPx61FB223BqienoVSZu43+NVel
         Sazlyp7NNCuAJ8Vl+cOreyebZUFW3Whq3awAf6TovQlsngTeMz6uM4BNLr5tjky4eBRa
         VAOhoHocIwv98k1pef3KNNz8SaH8tS23jwaMEGgaW3pkEk4OehDDF60ti+MjeDGZCPOW
         F03kVeMwL5U4syTpQZowkkm3PWhcqHvJv21zqHLJF6wMahJeshlMG2zdA7piSrtH2DtY
         9e/oRlHfB/7mRRwdNoVRIFHZn4yRrgBVvClRlUnMV0q6A8LfR7wiKdYImaX3M1K1qijN
         dPKg==
X-Forwarded-Encrypted: i=1; AJvYcCUC6vQM6kcw8SFsJczYYlNvA27DFRUq497QAYct1WnInJqanW0ZWULB6Vyj9XjeAjU0Cz1KDEtA4zaqGGAmEJpddCZUP1TPkyvZH0btcHfl
X-Gm-Message-State: AOJu0Yyplp62twKQW3l3A1OBw/WhmyN/Haze+2LKEPocnOtj+1bx6RmN
	95XXlTj/88Qgn7vsjWU/DoqRFjG7/2dODdEoBa4k2Pi+Zl+sq5GwAJ0HB5WpXTM=
X-Google-Smtp-Source: AGHT+IGkFTDo+PWyXaeyOSY2amADa59LduvcEJ+hSQBEwUy0nDRJvaJ0TqxG3cldc9JpbpHf0UsuAA==
X-Received: by 2002:a17:90a:8b09:b0:2a5:e1e7:b994 with SMTP id y9-20020a17090a8b0900b002a5e1e7b994mr1541409pjn.19.1712909251929;
        Fri, 12 Apr 2024 01:07:31 -0700 (PDT)
Received: from ?IPv6:2402:7500:5d1:35b0:d179:3a11:9628:3bf0? ([2402:7500:5d1:35b0:d179:3a11:9628:3bf0])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090a051000b002a2e4b593cdsm4338701pjh.51.2024.04.12.01.07.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2024 01:07:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 05/10] crypto: riscv - add vector crypto accelerated
 ChaCha20
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <tencent_C7B10C572AA62E84ABF1818F52904DFBCA05@qq.com>
Date: Fri, 12 Apr 2024 16:07:26 +0800
Cc: Eric Biggers <ebiggers@kernel.org>,
 Andy Chiu <andy.chiu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 ardb@kernel.org,
 christoph.muellner@vrull.eu,
 heiko@sntech.de,
 hongrong.hsu@sifive.com,
 linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 phoebe.chen@sifive.com
Message-Id: <36AECE24-69F7-4A95-A9C5-E1EFBE05DE9B@sifive.com>
References: <20240122002024.27477-6-ebiggers@kernel.org>
 <tencent_C7B10C572AA62E84ABF1818F52904DFBCA05@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010734_531355_FAC403AD 
X-CRM114-Status: GOOD (  16.09  )
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

On Apr 12, 2024, at 15:59, Yangyu Chen <cyy@cyyself.name> wrote:
> On 2024/1/22 08:19, Eric Biggers wrote:> From: Jerry Shih <jerry.shih@sifive.com>
>> 
>> Add an implementation of ChaCha20 using the Zvkb extension.  The
>> assembly code is derived from OpenSSL code (openssl/openssl#21923) that
>> was dual-licensed so that it could be reused in the kernel.
>> Nevertheless, the assembly has been significantly reworked for
>> integration with the kernel, for example by using a regular .S file
>> instead of the so-called perlasm, using the assembler instead of bare
>> '.inst', and reducing code duplication.
>> 
>> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
>> Co-developed-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>> ---
> 
> Hi, Jerry Shih and Eric Biggers,
> 
> Since this implementation is derived from OpenSSL, I have an issue on
> OpenSSL about this chacha20 implementation using Zvkb [1] and see a fixes
> PR by Jerry Shih [2].
> 
> I wonder will kernel need to port those fixes to handle the non-multiple
> block length of the chacha20 cipher? If yes, we should port it immediately
> to catch up with the v6.9 release if we can.
> 
> [1] https://github.com/openssl/openssl/issues/24070
> [2] https://github.com/openssl/openssl/pull/24097
> 
> Thanks,
> Yangyu Chen
> 

There is no non-multiple block size issue here. It's already handled by the gluing part.

https://github.com/torvalds/linux/blob/586b5dfb51b962c1b6c06495715e4c4f76a7fc5a/arch/riscv/crypto/chacha-riscv64-glue.c#L45-L53

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
