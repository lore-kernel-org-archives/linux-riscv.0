Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8799CAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 05:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDnEgi06umwRNn7PVHflO8rUaanYVbvHBPT/vfuge7A=; b=IWkDmr8r50K6cM
	XLjcNIe1fU9mwBdqsv5pQBErnv0yPuQvanYJ7ReL6tY4AEfjthQu4WHA86j2yFGTzQ8j+NjbQ/5WU
	UEIKDZ0LUHfjH9n8lm93mZ5o2Mwqa4n9cJMyvZ+pK7kvfg5ORVYVcAz4mRcS7WMtQXGGvannYbWBB
	UALNZLDa+xvT4/ZwkNKQaHh+Xkn+1ePPsqHEa2zb2G8qw0cx552tbCu+BXxVGyg/OhvJShpROsdA6
	0/KQBALqV40tasbVMc3rRV3oqoidSlXb9QFxZ6rsCophNtWE4ZyPOt929eMtOKd5PlfNwdsAImZS8
	Xhns+dLkjuAQ7okiJ49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxIR8-0000000DGav-3vK0;
	Sat, 13 Sep 2025 05:04:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxIR5-0000000DGZC-3vDB
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 05:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD10E43A25
	for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 05:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACAEC4CEF9
	for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 05:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757739870;
	bh=NsBrhjCbgwcv6TOH9wHnbRFiMp7v9AyhyhPf7J+3W0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QOpqe6YDfum7AQadumG3oelaFS3/wAJtA5tctn50YN1E2Xr1j/JvZNAdG6QAVRWbf
	 XivzQOYCGYAKG55AQKD0IQloc++1ZoRKTxW2kmI5kCw0gcZs5WjzBH+9tz+8ksu8Jm
	 VuxU3cwyUfd5yvOtNbUm3NUIegJXC8G6Z/h711fAGs46EqZ+GlL973txxYdRxAOgo0
	 yP4pglpcK1iee2JDqfY4OwCRbHr1URVvLDQtBBI8M8D9mEmhC6ySjlq+v28UW6/4Lt
	 ss+14BIkkdXmhytZusgDanwqrWekeglPUo2DHn4co0A+2qSYUJET2MaW/0/xr+tFB5
	 Ds8ElZfwMJodA==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso16066055e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 22:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXCsmIjF2ionwYEk+0McNepCf0tKhbApCmweC7iICBcVrUwRRXOA96Kt2sMVhijRc08OJ7+DCtseqRbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmnbJWASy1lxFDY4gM2AhpvOHnqplYTki54MoFj0aieBzIb/3l
	bF7x6Ay8Z7E17ArMOMJ0YwYOs4mH5ZxuoppQFiiMe3zIHtrD3e5UNAikSkYIfRi4llShiMppoiY
	jvUxRCf9DvZKF+hEhymU0Mr+2dW1EYAY=
X-Google-Smtp-Source: AGHT+IFBqVpnm7lRLVpUFGSo3qvUKavvjqz/GXMLn8IvosVS5fR8h0RKtXq5fuAF6dWZpyMz9d/tvDJXi/GTFC9Zp9A=
X-Received: by 2002:a05:600c:5251:b0:45f:28c9:c4aa with SMTP id
 5b1f17b1804b1-45f28c9c8cbmr2307625e9.9.1757739869033; Fri, 12 Sep 2025
 22:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250911184528.1512543-1-rabenda.cn@gmail.com> <20250911184528.1512543-4-rabenda.cn@gmail.com>
In-Reply-To: <20250911184528.1512543-4-rabenda.cn@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 13 Sep 2025 13:04:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQN71ekFURQLNEMjhcKQbYhpHU1vcNwm+Rx7eONPjz9Jg@mail.gmail.com>
X-Gm-Features: AS18NWBbpip28D6dSvULZTMJGPHyRhKbalh_uAdjJ70KBsVc__S9zGVR444ixV8
Message-ID: <CAJF2gTQN71ekFURQLNEMjhcKQbYhpHU1vcNwm+Rx7eONPjz9Jg@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: thead: add zfh for th1520
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_220432_014861_6FEDD362 
X-CRM114-Status: GOOD (  12.69  )
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

T24gRnJpLCBTZXAgMTIsIDIwMjUgYXQgMjo0NuKAr0FNIEhhbiBHYW8gPHJhYmVuZGEuY25AZ21h
aWwuY29tPiB3cm90ZToKPgo+IHRoMTUyMCBzdXBwb3J0IFpmaCBJU0EgZXh0ZW5zaW9uIFsxXS4K
Pgo+IExpbms6IGh0dHBzOi8vb2NjLW9zcy1wcm9kLm9zcy1jbi1oYW5nemhvdS5hbGl5dW5jcy5j
b20vcmVzb3VyY2UvLzE3Mzc3MjE4Njk0NzIvJUU3JThFJTg0JUU5JTkzJTgxQzkxMCVFNCVCOCU4
RUM5MjBSMVM2JUU3JTk0JUE4JUU2JTg4JUI3JUU2JTg5JThCJUU1JTg2JThDJTI4eHJ2bSUyOV8y
MDI1MDEyNC5wZGYgWzFdCkFncmVlIHdpdGggQ29ub3IncyBhZHZpY2UuCgpMaW51cyBqdXN0IGhh
ZCBzb21lIGNvbW1lbnQgYWJvdXQgdGhlIExpbmsgdGFnIHVzYWdlOgpodHRwczovL3d3dy5waG9y
b25peC5jb20vbmV3cy9MaW51cy1Ub3J2YWxkcy1Oby1MaW5rLVRhZ3MKCldlIHNob3VsZCBiZSBj
YXJlZnVsIDotUAoKPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPHJhYmVuZGEuY25AZ21haWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDggKysrKy0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IGluZGV4IDdmMDc2ODhhYTk2NC4uMjA3NWJi
OTY5YzJmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0
c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gQEAgLTI2
LDcgKzI2LDcgQEAgYzkxMF8wOiBjcHVAMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlz
YS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWNjcnNlIiwgInppY250ciIs
ICJ6aWNzciIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiemlmZW5jZWkiLCAiemlocG0iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInppZmVuY2VpIiwgInppaHBtIiwgInpmaCIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAieHRoZWFkdmVjdG9yIjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICB0aGVhZCx2bGVuYiA9IDwxNj47Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDA+Owo+IEBAIC01Myw3ICs1Myw3IEBAIGM5MTBfMTogY3B1QDEgewo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIs
ICJmIiwgImQiLCAiYyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiemljY3JzZSIsICJ6aWNudHIiLCAiemljc3IiLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2VpIiwgInppaHBtIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6
aWhwbSIsICJ6ZmgiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInh0aGVhZHZlY3RvciI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdGhlYWQsdmxl
bmIgPSA8MTY+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiBAQCAtODAs
NyArODAsNyBAQCBjOTEwXzI6IGNwdUAyIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNj
dixpc2EtYmFzZSA9ICJydjY0aSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNh
LWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppY2Nyc2UiLCAiemljbnRyIiwg
InppY3NyIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ6aWZlbmNlaSIsICJ6aWhwbSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiemlmZW5jZWkiLCAiemlocG0iLCAiemZoIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ4dGhlYWR2ZWN0b3IiOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHRoZWFkLHZsZW5iID0gPDE2PjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8Mj47Cj4gQEAgLTEwNyw3ICsxMDcsNyBAQCBjOTEwXzM6IGNwdUAzIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9ICJydjY0aSI7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEi
LCAiZiIsICJkIiwgImMiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInppY2Nyc2UiLCAiemljbnRyIiwgInppY3NyIiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiemlmZW5jZWkiLCAi
emlocG0iLCAiemZoIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ4dGhlYWR2ZWN0b3IiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRoZWFkLHZs
ZW5iID0gPDE2PjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8Mz47Cj4gLS0KPiAy
LjQ3LjMKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
