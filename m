Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8695CC71135
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzBAn45mdMrqL2fVNHrIc/qUlS8zcc1vILsEhqnXWOQ=; b=V5ac5hsWDe0yaj
	JJmk+20oQCSVjaFRJWcsLBBx/g2SL2lx6P93x0oXOYvzIcNoi23jIp7z3n3gM5mQ03y5Le8gmumzP
	lKsPewSXDdPR0Gs1qaJAjkzsTOROe2AsBcdpFbFGXCBxemhAylA4OyZVFNVTbw8MSkQJdqEEcMRI1
	/HG2Mze7wAJBQp9FBw6+oHlEarC7biWxeCMdEFmn+Jfkc3xMM/RjIiGEYifCFDbb1Yamqaem65tvH
	UMdGABHRW10t/yKhvEdlI1Nq0VlJgnDaQaA2FVfzrCRD0TrFOjYEtvbBzYe7HeTGqWqxX9/TNo7jz
	MYNCd0gJI23pRP+kRJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRU-00000002bqW-3iEG;
	Sun, 15 Jun 2025 15:38:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRS-00000002bq6-0daE
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 15:38:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441ab63a415so41786055e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 08:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001920; x=1750606720; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=kaD3JCO1WDYuTHpr/HulxGM0XugCLl+b7Wv05iy5QnNTdxwRomCOH6d9YOgVjf4TVc
         0i+quQdUsRswIrvImuxtWzP0Cn9ab/GuLPw91kCzj/cc1VKNhcvUqUn4ZNtiIbpfibEb
         wl3Qb30vzXe4OdbM9+pgTwHV95+xNTldmjvWw6DfZ3u3Uz2NxJ4lQAVUpmFECh/Y4hIH
         KhLpJYJMBgaFlXClF2l9Z4utQMG8e5TjJGhb759YS8DkOHUnqUlh8IP7MfkyxIAB1oKR
         j1OTnWuXrkU2EiJL6LFovGvfrgpQqRbcwvJo9txaD6Tuc+FuMZ+xfkmwA7iDDvvwstvz
         uaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001920; x=1750606720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=NERBEze7Z5BozIt5O6T9JFgF8IQ4GtFinIcN+yBB03hqWN/ZmsPsDE2/HlAcwYe3v0
         bGZO11zEe98w53Qy2FLBx/EJjEMp9ywhwWssQavL4EEgk2B1dR2yViOrpJbHRgcE93Eo
         XIYcSv4C3j/L5Fv4VbtihsBThmRaK3oCz8Z6bNUH93/sa10nsrysDYnhF11cyC3O00Ik
         9dd8/joUNiMTiPkqXxtsP675RrbhJLYrHL8DmD2rL7fE3vsE7t15TK6SzHHgz3TExmqi
         OSVr5HwNZD/iCd0gOmKIuzvvpgw6VUnKH1FyhM/Jdf03FjqkpqfR3CGO98/XhDxBB44w
         DqPg==
X-Forwarded-Encrypted: i=1; AJvYcCWVjWIIt++eT3ZvpxxI80V1Iz35pnHsecBlqMaEx4rZHED4J9RVk/flSJG/kAmDs3G1Jw3+y2eBIHmcxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNw4312xBF3z+7dDX8YBlqtC88hVwXhwwqjMKK8h85rsA5LyI
	JAijNiCaj+2PfkXXRIVKQtJ2drBNvhcRpJj/xnQT0tig/a6s7jlbmHFp
X-Gm-Gg: ASbGncsLh+uSqGXUbjCBjX68sZxFNYH4d2G5lx9Z1JEARWARQENyCRxIa5RaxDAAbr5
	hN4FoWTLV/eP1wcp4fqpyrNy0mZvPpdcionBVsvTKu7ntU/qscF/ib6rIY03CygbVCHoXWZwWni
	6y5EN6NVLJskdnrZy9hPGZ8hhAdKM1XOowZckkL9ws76ylxbpS3eKxUyzIs6bshmZF/s1S8w9dl
	jAKJH/fhPA8ZftqlqQQ9tzJFMqhzp0L8SYl82WCtfjfhJJ3fl1pKyeL1mq0nIKvnMc6tu6Yc/3J
	GTlKKKSHuyFxTLc0Ygv0pnJYsbf7jCgHy3dCZWnZAvxKAJkODlSmCjnsYPCy5spvzr1vpmE7MBF
	PxrMhXg==
X-Google-Smtp-Source: AGHT+IGoVcAhO+1NBubftFooLD3lc7sYs3mbVA5mxnraWLvf7WIREXdSgu30kDJRwmw5ULOGEm+IRA==
X-Received: by 2002:a05:600c:3584:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4533cac908fmr58103055e9.30.1750001920409;
        Sun, 15 Jun 2025 08:38:40 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm114934925e9.2.2025.06.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:39 -0700 (PDT)
Message-ID: <5478c3df766079f4139ba1dfffa2f938ab4a9259.camel@gmail.com>
Subject: Re: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Yu Yuan
 <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang
 <huangze@whut.edu.cn>,  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:38:52 +0200
In-Reply-To: <20250611082452.1218817-4-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-4-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_083842_208028_56FA0214 
X-CRM114-Status: GOOD (  11.09  )
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

VGhhbmtzIGZvciB0aGUgcGF0Y2gsIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNjoy
NCArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBBZGQgVVNCIGNvbnRyb2xsZXIgbm9kZSBm
b3IgY3YxOHh4IGFuZCBlbmFibGUgaXQgZm9yIEh1YXNoYW4gUGkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KClN1Y2Nlc3NmdWxseSB0ZXN0
ZWQgaW4gaG9zdCBtb2RlIG9uIE1pbGstViBEdW8gTW9kdWxlIDAxIEVWQjoKClRlc3RlZC1ieTog
QWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0K
PiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE0ICsrKysrKysrKysrKysrCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9jdjE4MTJoLWh1YXNoYW4tcGkuZHRzIHzCoCA0ICsrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MHguZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNp
Cj4gaW5kZXggNjVlY2VhYTVkMmY4Li4zZWEzYTFhZjEwM2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+IEBAIC00MjgsNSArNDI4LDE5IEBAIGRtYWM6IGRtYS1j
b250cm9sbGVyQDQzMzAwMDAgewo+IMKgCQkJc25wcyxkYXRhLXdpZHRoID0gPDI+Owo+IMKgCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiDCoAkJfTsKPiArCj4gKwkJdXNiOiB1c2JANDM0MDAwMCB7
Cj4gKwkJCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMC11c2IiOwo+ICsJCQlyZWcgPSA8MHgw
NDM0MDAwMCAweDEwMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjbGsgQ0xLX0FYSTRfVVNCPiwgPCZj
bGsgQ0xLX0FQQl9VU0I+Owo+ICsJCQljbG9jay1uYW1lcyA9ICJvdGciLCAidXRtaSI7Cj4gKwkJ
CWctbnAtdHgtZmlmby1zaXplID0gPDMyPjsKPiArCQkJZy1yeC1maWZvLXNpemUgPSA8NTM2PjsK
PiArCQkJZy10eC1maWZvLXNpemUgPSA8NzY4IDUxMiA1MTIgMzg0IDEyOCAxMjg+Owo+ICsJCQlp
bnRlcnJ1cHRzID0gPFNPQ19QRVJJUEhFUkFMX0lSUSgxNCkgSVJRX1RZUEVfTEVWRUxfSElHSD47
Cj4gKwkJCXBoeXMgPSA8JnVzYnBoeT47Cj4gKwkJCXBoeS1uYW1lcyA9ICJ1c2IyLXBoeSI7Cj4g
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwkJfTsKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
