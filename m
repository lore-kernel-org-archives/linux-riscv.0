Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A75C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vi2nBixPYR1fRQvydFpF1ID5orFqysxW90O6V+YLNWs=; b=TABUXTFPHQ3bZRPv4vldRXney0
	QPzAEkvLdknxgIcgrbkKLX8QwGTVpDgTAUX7sD9srnGSShnGvdbynS0Qy7J2ZGpxOK6c4as4vfpXD
	Yy20+n3X6R1FfHm4TJXq4WC+qbTGmo39k6tDfUCAxrsunaMEwYzm1g22UU2eb6kFfvKVt6E+tmzgU
	+Gd+Ap+f0/KoQelp13AsjP5LZt+B2A8jiPyPB3m8C6bXGKO8EvJdCDcnKy4TONMmlCh6fftR6yOWf
	FJAiw3hvtn/obwb597Yfi5Rr1XTjCKCklEMcCVBL96ehI6M/WCufPC1+HO5g1NNpfpY7AWtahUkg2
	oNpxez7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIfa-005qkr-1g;
	Wed, 02 Aug 2023 20:42:10 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIfV-005qiM-12
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:42:09 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a741f46fadso152298b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 13:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1691008913; x=1691613713;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOTW7tSWYTyx7UDF6T+TXg8EIzNOXTAibUlBcE38vs8=;
        b=NG+5rMrhgt8ajv9MPHJRkksDamIASvOjqTTUPHyRoobNVDQSWi0PwWWph2HSzMcdMl
         A9HE9kmImry6AtWp2gUbGM/jK8r16N1j7DiuzIHODeQu+mzVZ4Nc5x80Zx5JkiFmSnHO
         uOPUvvmMKURIHUCoWtfp9Rlg7pLfP0EZa3t0rZOpEmSucSQRceq09vtlxx1NioyJNNkD
         4fSrS7ibFXvZGGzqE3oJeBJyMSPtz7hFdkn4SO1BzNbBZRtfBvnbzCIbSBnhKY/50gMF
         g9/Y7yRXXe9yhQWo6eyNbq0BU8fTMdr0BTKZOgC0cNhC2TxijnG1xbfqy5nF/bsinVyn
         22ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691008913; x=1691613713;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOTW7tSWYTyx7UDF6T+TXg8EIzNOXTAibUlBcE38vs8=;
        b=HLpL8v4KV1yFzt3U6kmhsE0GoXyNE5ldEG2yZXCF5i2wSyApn91mW5tmU/R2SXN2Bf
         DLmi4Q+RbwibJ9lfJP7AkKofJa55duFFyvTqabhwg06iXwdR3GC+DL12DOvvdy5N0E88
         bAtoIIskzxYGeP+HjTY+b+Zt7BOxJz6eZ20+CN/5CqsVPE1EDsxsV3iKO578KmbC5Ss5
         xXMra1JTvdIxBQsoLTrwOCd+cakeqkrzJFu8syQ3ZSb/9vYKefqWFDRB4Hu0H9Kkzssd
         Q0FU20B9leYBlDocqrwWbJCAe3joZFrROBIOkflwsuz9v+rPJpJFGox/mff0eKmu1ZjR
         Ynvw==
X-Gm-Message-State: ABy/qLabiVlyu1nJGYsEMgog8/6p/vDcJcbqDCGKmIc6K+KrOQ4324g7
	WbmJWAJaW+IpOjOEWMeJ05P6sA==
X-Google-Smtp-Source: APBJJlEXOupr/w6qEt7CH3EMjhe/cVyQh8/dfxz/mVjhJayN0odRX4LdG0uM3l2H+YiBj1QobSkLpg==
X-Received: by 2002:a05:6808:21aa:b0:3a3:dc0e:4d0f with SMTP id be42-20020a05680821aa00b003a3dc0e4d0fmr20856581oib.22.1691008913338;
        Wed, 02 Aug 2023 13:41:53 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l4-20020a63be04000000b0055386b1415dsm10930827pgf.51.2023.08.02.13.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 13:41:52 -0700 (PDT)
Date: Wed, 02 Aug 2023 13:41:52 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Aug 2023 13:41:50 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
In-Reply-To: <202308021335.8010D08B@keescook>
CC: justinstitt@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  ndesaulniers@google.com, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-93dd039a-f342-4239-a0a8-f1e31f7d8b5e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_134205_570031_91398A24 
X-CRM114-Status: GOOD (  12.47  )
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

On Wed, 02 Aug 2023 13:36:03 PDT (-0700), keescook@chromium.org wrote:
> On Wed, Aug 02, 2023 at 12:21:58AM +0000, Justin Stitt wrote:
>> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>>
>> Favor not copying strings onto stack and instead use strings directly.
>> This avoids hard-coding sizes and buffer lengths all together.
>>
>> Link: https://github.com/KSPP/linux/issues/90
>> Cc: linux-hardening@vger.kernel.org
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>
> I like it! ;)
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks, I just queue it up for fixes (might take a bit to build test, 
I'm a bit backed up).

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

If you wanted to take it for some hardening thing, though -- otherwise 
it'll likely end up on my fixes later today.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
