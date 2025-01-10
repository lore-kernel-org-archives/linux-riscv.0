Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7832E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 23:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ay4ZqMU4NlaAidI0aAOfMtUX84mR4qAJFa2CZQoYG8=; b=LKf44eAEx7e2uL
	76i+PJizxuEPRKUsddr95cMLUQRIPvvSCFjHKFQTGqEnQGTnFv/Ydw8pcaaI9+N1QNSNhE8ucysqo
	hMUvrVjSIEjc2TphyrfKTrPqNH2JCsvsaMsUpdlOtcOTpLsMVcYCDP1SiYQvfs5OK+r1FEKZLj4ID
	fpDbv/cUpwgDLErRSpTvaMeN1GiCTZhRY0sWhMwgu+pHsi4eSqT9y1gSetFPYh4ny08EeVm4kmPu5
	W3H38cE7e7mqtoFWwh6QiNmFR6l17JD6tSPvhWPrLW3zlY0rdhZEJYK+8PEnGhJM64Q/y45dHbARo
	IkYQkgSulXCNn+aijfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWON5-0000000HGpB-1S42;
	Fri, 10 Jan 2025 23:24:55 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWON3-0000000HGoU-13LF
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 23:24:54 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-84a1ce51187so75644839f.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 15:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736551491; x=1737156291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+SjCp51VyP6GzGq5teBicdgUcduwA5OqOX8nMmSrGMM=;
        b=GEK468XD74Ugyt47Wzct2FiI0/f6XNMNTf7yVMJW5P5an81A9hJc48hyIo3sVOpiaF
         TuSfI+FGeHm7CfngTZ7/gJ8Y9Q7U1FzVUEjXoXauhfr1iyKMlJcfSuocl1PPiIOfupvM
         WEsw0hxKZRhS0xr3ZdrV+NjeXNEKFvvle6+RFEEyXvd8GYEHJVRD1iZNK2qko/k2dnOQ
         npW/E224+ty1MGejO8f58E0WGtmL9+557bWKilgqDRbapvCh085+gqC0pdCEK56rrCDv
         eX36auAoKYrmUfc2ymrA7qITswQl9svuV3qj0blMOH7KzQaarE/FKtgZaOI1eql9D79l
         B4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736551491; x=1737156291;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SjCp51VyP6GzGq5teBicdgUcduwA5OqOX8nMmSrGMM=;
        b=uWE5URd5aydcXt2SQ63eFEGVpQxB6zO+ZM3N0ichS1DX8JWwHSmL2mXJF2XtKzykAA
         82LkNEbvSGjP6Fl7wg1KptMuUj5CdzZYYh7Hkd+03nH/w/hs/Nh/mEoyj1nOhk1JRI0+
         EuyIyzxoDQu6t4vNwuzaKvR++/puN6sayL1aM/OgvN7jJzHfRHxNmAppxgPI19nSntRY
         tQLYFnizw5szDAs2s/oN0lxrrtHu7VuRGJ1+4HFwauWSLX7q9CN/8H/me5JfViZ90iOH
         X0tIqPKnPLT0WBcQC1IIk7E1GvBqG+yvXIiFwFpN7uSZLrFD5zkDQnIk6htYNQIQHOpk
         E4DA==
X-Forwarded-Encrypted: i=1; AJvYcCU1KmK1ii4ACFHHhTT8lGgSFj69s8YM5BN6S4e/s5+8sOhfoDvL8dzlY1M7rZa8bm6syt30qKfGijqrDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Pq0j1fFFbNsVbK2Q9VJvdDJ2wwALPUovBzGuYut+HU9nQ1Cv
	/eutrcHRSzBcJl1ey3JEU2Jr7zZbE4i2LdkoI/XjLoTX70U3lg44oJlvrfrR6hg=
X-Gm-Gg: ASbGncvvJZh7Uv4IN/bC7jsPM+e+mS1onbPK8mG/ZFX1MFnz0FdjLjB1Xnrd+zST2sC
	+hZMHURPXJXQyn07KcRJGgGnhlbhJhLg255IktXZGD0W1NxTPOAXmMzVAnIsPiMOCuCMtCTxJNt
	u647MNocmciDDagVy5j0AGBoKN8eW7z8+rRQIBvpPErv9mu+QO7Hpj61sspKMLi8x8Pg/xmAl+C
	aY4NyMUris4IJ60K+ewofsThO8PP1xSD+rcS4U18avo0IomRaUyd0peL8jl5cbZz/D8ixlnCapb
	g8SO
X-Google-Smtp-Source: AGHT+IFnLUyPrnYBBe92X4rwhtK25h1zVqhYbmHNT0fZHuKmBld5PyaTYcos/pwpc7H1OLYSIEgaZw==
X-Received: by 2002:a05:6602:36c8:b0:84c:b404:f21f with SMTP id ca18e2360f4ac-84ce018d1a7mr1065030139f.13.1736551491667;
        Fri, 10 Jan 2025 15:24:51 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b718a36sm1132519173.108.2025.01.10.15.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:24:51 -0800 (PST)
Message-ID: <69426339-fb89-49d8-b23c-764f953428be@sifive.com>
Date: Fri, 10 Jan 2025 17:24:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] riscv: add Firmware Feature (FWFT) SBI extensions
 definitions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-2-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
In-Reply-To: <20250106154847.1100344-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_152453_335885_5F2EC822 
X-CRM114-Status: UNSURE (   6.68  )
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

T24gMjAyNS0wMS0wNiA5OjQ4IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gVGhlIEZpcm13
YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQgb2YgdGhlIFNC
SSAzLjAKPiBzcGVjaWZpY2F0aW9uLiBBZGQgU0JJIGRlZmluaXRpb25zIHRvIHVzZSB0aGlzIGV4
dGVuc2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAyOCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspCgpSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5j
b20+ClRlc3RlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
