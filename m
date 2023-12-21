Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01727C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6F0wvESbRQ91Q4HwGGe8eX0k1XigjbQ/3e2QCTLdsM=; b=IY2jZ0bwFqd49o
	UEUKgFWPzJmUPsZCm7TH/kujnlLjspbJFYOD0/Csfc2DeiwLNzctLiYLUb5jaWmwpmQqCAK0wtzOl
	j2c2fBKRaeXbnD7D6MLVCQBwMOzVQu5IgZ7Oj4KxtuKkls9BnHhGDi64vaZxXRL6lV60QeotsFu49
	cyQoYJDC+VN/HdgywDNOzCPrpI22umkjR6N8ANj6xQ+zZVZVbTMuWMPRN8f+EM3C/oHe/KsWygRh3
	G6F3vFFlBD0/Rg9rW/RgHZE9oX1aHDy0gFRZraOgARhFt7dsi1GV4sXMnWj2ak5xBCOONzPE323ZE
	GSsiYsmYlef7VPapUoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGNFE-003jJ9-33;
	Thu, 21 Dec 2023 17:54:04 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGNFB-003jHd-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 17:54:02 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2cca502e642so5767311fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703181236; x=1703786036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyvnsyjEDwsUuLwMHfYUDOCjkLXxDADJ3gDmnw3h4uw=;
        b=EGHDzw5Q/pU3BQHCwQ9Y7+a3XnbbDMBhLgokMcLtVdBir7bh1gGFn0q5Zgf7g/ybio
         IsDD+mZob4C1J7/XLDOYXwBK3Gc0Ts3dxVrloZitrrQ6xO3EUYe+IqLkE6MjGN+a3r2w
         Zq2NpgMidTGfq8/br8icgGSkvsXR/XnDdjydlswR5i4SZV8b25vzO3IRY5VLoRIm0sT/
         wqq25DVp+erBn44S+tfBfRj/FmrHgsuTpa024w8fNpWlnkpxKbwKzrpMmr/jyGGsvis1
         ybu9ynN95sgAyIfEGoHlWhkaQKqTrQu9asjuSXAIM9jh2oLzhzcE7IgYk9HovFEZlRlE
         pdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703181236; x=1703786036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyvnsyjEDwsUuLwMHfYUDOCjkLXxDADJ3gDmnw3h4uw=;
        b=Bxq7/ovOxC92xXRqUIErcW9JmalUUaAVOVA+aUcw15tvmpJfVpJQKhKKI7rgJQvGnd
         T4s3b9Kz5RhDoUJQ0OIVvSnV3fxscaEgzYfikpwOHzV5z+cE7J9PoGAYBGrpt9I8+ian
         kNW23/aVQwqDFU+9JkkSOD1X/shhupx9jjtB4Ze8AnL6xFb/ccDwWKNaQZdFTM9Ptq2g
         3ofAJzuX8TP7BkZxULeoYr7QqxTATLda8B6iX8Xgrc2Q8ulPt7ZACkzlaH0qtqOgOHlw
         tRjpc5o82uY1cqD9r/k0zgRRT9zZfWvRjB4olMM4mr2uDj/qv+7QX6DSlK1UtLwjP0B7
         v87Q==
X-Gm-Message-State: AOJu0Yy3ywo7SXwlxM3ygfycvo/BrDM9JqiHE8AnYYj1OkdARcMExivn
	ru3JSS23fKQ+ex2v3ABl2zLCjy8EjhvvzZ4PVJBV+w==
X-Google-Smtp-Source: AGHT+IE2ge4UK3B/28OyNJsYgBRrO+CoJIShGaRLGYuzONOCc/uFJ0mOz6/3Iza3du7r74b7GPBwMBxm/piGxU/FSfY=
X-Received: by 2002:a05:6512:60d:b0:50e:5e48:2282 with SMTP id
 b13-20020a056512060d00b0050e5e482282mr412065lfe.146.1703181236297; Thu, 21
 Dec 2023 09:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com> <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
In-Reply-To: <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 21 Dec 2023 09:53:19 -0800
Message-ID: <CALs-HstooJ5z9T_M48jwQGbxiUdL-B8eFqqsi4-6TMrMJtz7mg@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] riscv: Add static key for misaligned accesses
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_095401_343464_4038035C 
X-CRM114-Status: UNSURE (   8.07  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMzozN+KAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU3VwcG9ydCBzdGF0aWMgYnJhbmNoZXMgZGVwZW5k
aW5nIG9uIHRoZSB2YWx1ZSBvZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+IFRoaXMgd2lsbCBiZSB1
c2VkIGJ5IGEgbGF0ZXIgcGF0Y2ggaW4gdGhlIHNlcmllcy4gQWxsIGNwdXMgbXVzdCBiZQo+IGNv
bnNpZGVyZWQgImZhc3QiIGZvciB0aGlzIHN0YXRpYyBicmFuY2ggdG8gYmUgZmxpcHBlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpZ
b3UgZGlkbid0IHBpY2sgdXAgbXkgdGFnIGZyb20gdGhlIGxhc3Qgc3Bpbiwgc28gaGVyZSBpdCBp
cyBhZ2FpbjoKClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
