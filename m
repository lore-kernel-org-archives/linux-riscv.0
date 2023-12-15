Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38475C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1enTIhe3SCICy8DQTY77hjl3OHyY0ru0TXaxAnThAdk=; b=gEhnav+sIooTyi
	5RDDK6ZX6q/JAk21GT9Z33fYmYE8ZelSe2CHCXU2NWj9ppYEsmA/39WBDNwCN1UYnADX9WeO0m1CQ
	g1DjlA0famrzCFi81whdlLLMToue6RKaGF4COeUYunRgL82d5GdE9INWitWQIAD857jl03xrSFapB
	nXdza4a+ANCDj6suhHNzN+PsE5Q34/hoGHYYAgT8EnwiCoi6dztNDJn26b1sXDPRsG9tzWzI3xinD
	8p/yTS0udQJMPPlOX9ZZ6jJzkExADJmLiD/zrcP+HWRV3Z2avtCdciLOzIyYu5koMWIX5qTmc38ry
	GpXL6K6LQshf3azLMkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBz0-0045I2-10;
	Fri, 15 Dec 2023 17:28:18 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEByx-0045Fr-1h
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 17:28:17 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso19548621fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 09:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702661292; x=1703266092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJgdaQfVEOqTf6cuulaJ0BP/0PqG9vdbBBj+6Nf4OLQ=;
        b=OlEddmORTigjQHK7RnW5W2f6Y6cV6RABEmqDvL7ZTRrs6OGoe4XDhWOhG9aoIj1o5/
         liQ5a+j9MYB5qQW8p0svSN7ylJxYDvL6w7fEPW0u8qyc5t9gfKJK1KanMbsB3nFN/9gP
         7JfRdgjmfYdiSDyG6v6PCLDri7KZwszX9RNLO/ykogEGGp6ECIPjE20h1ogTv22NlGnB
         MHclGhYKKSnaL9XtDF1E5JqqBxhRcwdWpbdMNTm3fLFLxOU2eo1sA/7CwiBiDcTqz55p
         HzHuQ38VJB9Q1WrNKDw5sB/6UkJXoU65HcKiabECrA9BYkr34JDw5RAUWNevrf+52C8A
         Cnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661292; x=1703266092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJgdaQfVEOqTf6cuulaJ0BP/0PqG9vdbBBj+6Nf4OLQ=;
        b=qDGAgR5l+cOBYq4iU1+KMZPISLpgd1NdUvXC/KoPW80h5RjL8p3c4HvJM73b+ki8wD
         QviBOVczjZQDzoTVxJWYcYzgFSFNKkrH9LT+48qZq3/kvyFrEZVZ2imskMsAebrWqKKX
         1+fdyv+FvN8z2/YV43o/Cps1K13MgGdXELdXHNDtWT4XW+wR+OtWXQbIC4tB1kuFMzAC
         mlEuYf+0hG5+u4F+F2kzoGzWm2ZRSh9krvzvM4Xpn05ZMkbhIQOjQF48wTyAN/Is7qr1
         gcbmvxF1F1NGY4dKo4uOpY2F8xKKFBSQ22ja5wMM77m9bnD/RxUCoSnfh3tm3o1mzUp3
         nxYg==
X-Gm-Message-State: AOJu0YxD4er/4jd8GJrGyidSXN4YpLDJogzLZbEtg9mNHYWYrJv3kwvA
	DpT3g3DoGOGwIJAVJYQhYlIh2UJS9vRaPjBu3F1Cmw==
X-Google-Smtp-Source: AGHT+IHKYDeE58bHo7Yl9+9lemxIyPXLPvC9cNQ8Niqe6fY5V8Hzg+SDAeHsy8YyZnBE7APvju7Ja/+sP0nqPq3dyiQ=
X-Received: by 2002:a05:6512:2354:b0:50a:a872:3b1c with SMTP id
 p20-20020a056512235400b0050aa8723b1cmr8848174lfu.27.1702661292417; Fri, 15
 Dec 2023 09:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com> <20231212-optimize_checksum-v12-2-419a4ba6d666@rivosinc.com>
In-Reply-To: <20231212-optimize_checksum-v12-2-419a4ba6d666@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 15 Dec 2023 09:27:36 -0800
Message-ID: <CALs-HsvjFhBnD=8HgcW3EStMioa7P1FvrJ_yGsXLHjUSEcm6ew@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] riscv: Add static key for misaligned accesses
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_092815_779592_140BA1C5 
X-CRM114-Status: UNSURE (   7.58  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgNToxOOKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU3VwcG9ydCBzdGF0aWMgYnJhbmNoZXMgZGVwZW5k
aW5nIG9uIHRoZSB2YWx1ZSBvZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+IFRoaXMgd2lsbCBiZSB1
c2VkIGJ5IGEgbGF0ZXIgcGF0Y2ggaW4gdGhlIHNlcmllcy4gQWxsIGNwdXMgbXVzdCBiZQo+IGNv
bnNpZGVyZWQgImZhc3QiIGZvciB0aGlzIHN0YXRpYyBicmFuY2ggdG8gYmUgZmxpcHBlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpS
ZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
