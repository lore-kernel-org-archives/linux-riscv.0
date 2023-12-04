Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0746C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywuOAuML2ZHSoZcpbMj4MQrIVG0nUvrBMVexea47Na0=; b=m4/kFKCHxUGn7/
	AO91DGzZTMlT4QdunHByqRxBu9A5W8VwV/aM0qJ61wzvhfuygSao1dkp5Q6kyRxGuSZOa6JEzZEOx
	ZI9kDtixfCRmGxt/KH7/IlD25RJaCInZhLip7ummKzuBZyoInkjnyZHL50hIwMU+WWNmIAJP+1FJd
	JG/UtcDErFEQGTgjARuEc2EYkc51tLyRYi6AU9eCh6Nc9FKCDLe0wNJThlL0tUbBAs6IJh3s2XF/w
	i9TSjWEwmO+V1IK3d7/+lWgVnwz8AJ2Mjhgmcp4SyzHiPn7tVAUp4A4Vlds34xIiMgzkTt8PI4o+3
	jmZ0qzDpvLRtuJbLBAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAESq-005R6C-1G;
	Mon, 04 Dec 2023 19:18:44 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAESm-005R5a-3B
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 19:18:42 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d87a8228e0so954882a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701717520; x=1702322320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWNzZv699g9WmaMge8Xt2XGWr8M2fBvBoGU1E608xn8=;
        b=lqS+HGCHQ9aqQ/RWxTNmaBfmJzKTSB44GeZCuuAAzkWkf/9qMyik4ojA+pJgyQmQRT
         fpv7jfzYRQBlbRXUjfI0UikVv7GwHJ5jvPLQnpsdfW/XOz5sIGQbbtUjD29leez+iKCj
         KN4yGRGoptlEXX4I3XbCrcZzrzPQhqzQP7pXscq9Ao71sFlx45w3+Ia4wauP3EgWINqq
         LgYgdkPKf4i71THGpdKoxBgkK6cnSzZhSNKpZpVeQnwLPvZUN1batoKRmU8xChGAZMQO
         3klKeqNCVActQyTwoKOtjTzaaIYl0ohkqIq96kBqyKEWErOyLsUaYDW+a9/ZKZdQs8Wz
         aNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701717520; x=1702322320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWNzZv699g9WmaMge8Xt2XGWr8M2fBvBoGU1E608xn8=;
        b=g9KbuwQHMk7BoRZ+BIdZRZH48tqGL6R6fTXZyHpQcO7K9Tlrm+FfWmVIycvYmeTBJE
         IwhX6CcVg1fNHLZmm3Kz4mymwf/gpfMjlJKi4wut4FGd4/pB3perAtyhEJasLoAtY+Ku
         Puwe9DP4BAHxwVzqvruc+/9VjMl3pZNRllRH3YlkVwC3+qA3HDVNT763W2GdEwsce1Wn
         PKNbR43pV3JKL2yzQz2nwaxH7xHZ1Ohi1t0jbPtlrkYwpw8o79tPib6bYICv3CBIlNDn
         atY4PZFV8kzv7VieY0eLdabfM0+zX0kztdD8XWBcnsgURuBNTqOJMKkeNrjn0hLXD6fD
         tGYg==
X-Gm-Message-State: AOJu0Yw3acJp78zbsDXHFB0zNyuOyM/xyK2O1lSdyrBFej8VK4e1avVT
	FkaMu+72038yc+MNfYTGQKLgZ40dIk/1JDVytsA/mA==
X-Google-Smtp-Source: AGHT+IHyqGlUNEc09zfk+7C7spFR2KrAlLytNjHQMZMVaTcBh0jkMo0aAva0Taxeji7L30FkvzDde4ybRx0p4piiiZw=
X-Received: by 2002:a9d:4d02:0:b0:6d8:75a8:8455 with SMTP id
 n2-20020a9d4d02000000b006d875a88455mr2668679otf.50.1701717519644; Mon, 04 Dec
 2023 11:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20231130133630.192490507@infradead.org> <20231130134204.026354676@infradead.org>
In-Reply-To: <20231130134204.026354676@infradead.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Dec 2023 11:18:03 -0800
Message-ID: <CABCJKufv1z0-+an7iws8J2v-c_Jg1Nfu47Um9rhCnVLxQfC6ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cfi: Flip headers
To: Peter Zijlstra <peterz@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, jpoimboe@kernel.org, 
	joao@overdrivepizza.com, mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_111841_081978_5825FF95 
X-CRM114-Status: UNSURE (   9.26  )
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

T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNTo0M+KAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBOb3JtYWwgaW5jbHVkZSBvcmRlciBpcyB0aGF0IGxp
bnV4L2Zvby5oIHNob3VsZCBpbmNsdWRlIGFzbS9mb28uaCwgQ0ZJIGhhcyBpdAo+IHRoZSB3cm9u
ZyB3YXkgYXJvdW5kLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2Zp
LmggfCAgICAzICsrLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jZmkuYyAgICAgIHwgICAgMiArLQo+
ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9jZmkuaCAgIHwgICAgMyArKy0KPiAgYXJjaC94ODYva2Vy
bmVsL2NmaS5jICAgICAgICB8ICAgIDQgKystLQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL0tidWls
ZCAgIHwgICAgMSArCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvY2ZpLmggICAgfCAgICA1ICsrKysr
Cj4gIGluY2x1ZGUvbGludXgvY2ZpLmggICAgICAgICAgfCAgICAxICsKPiAgNyBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKTG9va3MgZ29vZCB0byBtZSwg
dGhhbmtzIQoKUmV2aWV3ZWQtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUu
Y29tPgoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
