Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3968C77B61
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 00:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTDkXHJDV53Z5qLS5DogK8FWPJEuB57vIIMQqwCHaGw=; b=izKYuPuGY29U/F
	ntklSgXg7cHdDBY8vDS4vWL8x3WXfqmMssCvlQ1UsVqiSb1R6N9Ib6ZqqPSB3mAsrO61BPtKUzLTk
	dEdBP6KoKDn+HUmkDJYfzLu5cnBEGpJsOw9snlmKnTfSxuw9IgnRzhqHKtJGITugn1P90+W756AJi
	lj0fTo8BaUl20+874roplVcDiZScssFG6ZaeCbo5uXD3KZ3Wa6Hw8nvIYCcD6Hn3dC1+n5s+zB9KZ
	HK05B9PzsNOApf/rA/LTjJXzqO7E8ol3uhzF70nPkgFQIO8MuqGwR4A7yT7nQVLCbCpGUJZ15QxTX
	qPcQqRAZRKdqfRTGrVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psY9M-00ByTb-25;
	Sat, 29 Apr 2023 00:09:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psY9J-00ByTF-39
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 00:09:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94ed7e49541so64079366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 17:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682726952; x=1685318952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YACjJPQ/4k1aGg00TusYEm4/EfglatXgozInXtXCNs=;
        b=SQ5eYdcFQO3/wJ5rk4LVICZ7B/62jU/u7PDjWZ05ZdYIKnoQqK+HOuAm+9JRs5idiE
         +UfwuDu3xngSiByLixXFjKo95lBNUwx09gJcJXnqpL12kragLWKuVovdLtIKHsSQnGgk
         9uE9RW9glPI9eJhsDFoy0wa7K0hdXubYRqPCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682726952; x=1685318952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YACjJPQ/4k1aGg00TusYEm4/EfglatXgozInXtXCNs=;
        b=d17C+Zhk/W0FM9usg0UYkS1ZBMSgNdxhXnfABd1vXHGBUZCFHZN5upJVArWRtWyVOD
         Q9JxdUE45g27M46czE0UyX8RPxnRMJpCBoFMWw22sJBYu4JhEnbOQo1ssnFHfWiOIhTb
         arWsKHKM8RP5RtMi6dBsPvzwVED/LLacPo9jCiQNv2F+KAZgjaOPsc3rvyI+Pqm4X6KL
         BLXsy6OvlWe3ABlZiTsI8pedmEsqOsszkCpBjQvSfrWMYUURQb1HDRU6u9GiKSF/ukbG
         JEp1QEH22DyvKGKAfmUXZuqRPBe0R4PPhwwDUXcjlRb8rLRLMduwUFqSDxq7xrxWpWlU
         3Osw==
X-Gm-Message-State: AC+VfDzvUjTuF9+JkDmhW8qDZIwaIJtnOmWRvomVgAz9XOrOqWrbc3wB
	CEo6TA3psc/vqmGantVYJ11FBrPnyABCxRUXLetctB5d
X-Google-Smtp-Source: ACHHUZ7u6uLfq+S38qPzm2c/KWzHu8OpvmMY7JPViqnrc/XnLn7d3kmWReKTfgXtRUV96l/uKVfW6Q==
X-Received: by 2002:a17:907:a06:b0:94f:6c6c:e17c with SMTP id bb6-20020a1709070a0600b0094f6c6ce17cmr6155832ejc.60.1682726951766;
        Fri, 28 Apr 2023 17:09:11 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090694d500b0094efe88a037sm11840289ejy.9.2023.04.28.17.09.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 17:09:11 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bbdbso430088a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 17:09:10 -0700 (PDT)
X-Received: by 2002:aa7:d416:0:b0:504:80d8:a034 with SMTP id
 z22-20020aa7d416000000b0050480d8a034mr337676edq.40.1682726950671; Fri, 28 Apr
 2023 17:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-57198db1-de34-4dca-be9f-989b1137503e@palmer-ri-x1c9>
In-Reply-To: <mhng-57198db1-de34-4dca-be9f-989b1137503e@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Apr 2023 17:08:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivud6jefN+UKa4zkAf4dkapyh4iRazyUVgXTzqRntOMg@mail.gmail.com>
Message-ID: <CAHk-=wivud6jefN+UKa4zkAf4dkapyh4iRazyUVgXTzqRntOMg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.4 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_170914_024742_D6B25A13 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgOTowOeKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdCB0YWdzL3Jpc2N2LWZvci1saW51cy02LjQt
bXcxCgpVZ2gsIHNvIHRoaXMgY29uZmxpY3RlZCBwcmV0dHkgbmFzdGlseSBpbiBhcmNoL3Jpc2N2
L21tL2luaXQuYyBiZXR3ZWVuIGNvbW1pdHMKCiAgZWY2OWQyNTU5ZmU5ICgicmlzY3Y6IE1vdmUg
ZWFybHkgZHRiIG1hcHBpbmcgaW50byB0aGUgZml4bWFwIHJlZ2lvbiIpCiAgODU4OWUzNDZiYmI2
ICgicmlzY3Y6IE1vdmUgdGhlIGxpbmVhciBtYXBwaW5nIGNyZWF0aW9uIGluIGl0cyBvd24gZnVu
Y3Rpb24iKQoKYW5kIHdoaWxlIEkgZGlkIHRyeSB0byBtYWtlIHNlbnNlIG9mIGl0IGFsbCwgYW5k
IGdlbmVyYXRlZCB3aGF0IGxvb2tzCmxpa2UgYSBzYW5lIHJlc29sdXRpb24gdG8gbWUsIEkgZGlk
ICpub3QqIGRvIHNvbWUga2luZCBvZiBidWlsZCBjaGVjaywKbXVjaCBsZXNzIGNhbiBJIHRlc3Qg
YW55dGhpbmcuCgpTby4uIENhdmVhdCBlbXB0b3IuIEkgbWF5IG9yIG1heSBub3QgaGF2ZSBnb3R0
ZW4gdGhhdCBjb25mbGljdCByaWdodCwKYW5kIHlvdSBzaG91bGQgbW9zdCBkZWZpbml0ZWx5IGRv
dWJsZS1jaGVjayBpdCB2ZXJ5IGNhcmVmdWxseS4KCiAgICAgICAgICAgICAgICAgIExpbnVzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
