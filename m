Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403DCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5el1BmEQb/Z2N4k0t3enM75oCrM0/agEwIw5uCbf8Jo=; b=KB3IxaHQutclwj
	XnF2TUkO+HjFQIQtLskn3LnzQN2b1DPNKl31WncQ4T8ZtKzruANa3ZwLIM9SsaSt7Kd8GELvk50Lb
	CFv0712tK3RhbyIFJeOOgHNKdbI0Vm4xLstCHQ+Fbwkh6wKPHjkZlSU+PYsr3xpmdNMKTnSO3YeiJ
	rEZ1YcPuezQOa3sbIwXTopTwHHqyMRck5HvD2LvGiINpyGykEV8oMqiL7CeXZGytXJxb64rnkbWkw
	Ic5cZEhs+tz88DyIBGQ480UK2CjMdOUaaSudidgo+q1LOy17aj/NKv11tS3sGEYETRY3LBaF3g5Cu
	Y3HRBjqEBtpb+keBD8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPLH-0000000419S-1nU9;
	Thu, 01 Aug 2024 06:31:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPLD-0000000418B-12EN
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 06:31:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so858664066b.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 23:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722493869; x=1723098669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtgOTmyz4Jo80Ebg+IqO3Y085ck8x5IgntpNpkonWA4=;
        b=nQ1h8op+4VhzPqTvhgjLZ1NAH6TNIQBQq84z/j/nKTjvWF7/4bUN8iobpOY4cnSW/U
         4Rz3JSHt0Smb4zvQ1L5zfvHRbR0K6H2Je2TbcSh2K3ruIqmTScDtlrOZR0strzZfq0qO
         +9t743mMsw2ajH3qg8yAw8+ynk3DDaKXQFMgbXe8By8TbQj8rfh9FFWNcwadZUwlmSL0
         mh2NK5tVgLlGF3mN9r4CkwaNW8W/Nr5TUxzrPJuHg+qvcwo6KFpAeBmyPlJLBxGmeflL
         qMjjtr8MWuAg3YqLmPm9Dt45nSSP/dRutKTKAuDziEYHMJLn1PlUzLtKOmZ5iTWLeDRZ
         1/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722493869; x=1723098669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtgOTmyz4Jo80Ebg+IqO3Y085ck8x5IgntpNpkonWA4=;
        b=cJDjCS7vTtd5FM35MyL9psKPV1GsyLN3QoXdjrBiNYCsQOl4+hRfjuJmPCS3+ULjM2
         NYM85jfdfNvprO7d3BnA96sGNvbFJMyzYaIEuWmWU02pjZeGeIDGuTET55wmInXSfgLa
         RJMsaHy6Qn0tQ2Hx/o9o2a2LKq0roJJ/qmb37ainOUUSc+7qrPg5bZu7sntnEPGiRpEi
         uQJrDt/aeCNIGmzT2vMfC5s1sMOGiQBLGT6TZ0g8pOQaedoOA8h+0OWcwPcP/6vjc7gj
         ZUYj7265wrpXN+J3Cqejqy0MgY+2PdKXcZ/d+N4Gl7w9VpUSDrI6u3P7IfAvSLYVlHsE
         4vYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9u5iTdPZBpXchGhhTGo1Q5HKDLxf21A33L1wcEelZ3nhqmw9U7vjRcstkoKJzVhYHplrla0Uf+V28fGi2/efJCC81Mf+m+w6/wgkFOmVE
X-Gm-Message-State: AOJu0YxKwYPkAadRbRX+7tAeyzt59a5sYkNSaPOTj4mGbwlo9w6Z9bJi
	WsHnH0+L2/Ak8vcEZNtwfZUUCwS1LpVWziIX2QeHJ+0BnFxwqPDYcC8vu9NBrDNrPtIMH1U2iFB
	/F1w8nJsQ1+OpIaCJH6UdnqNQkf6SlD1vINHkLA==
X-Google-Smtp-Source: AGHT+IGCKaJ30FgEU9oUZBdt1y3mH+iUXfyse7Ifs2EUpNCPkcgPwDdhg+BBqKki8Uxjaui4Z+qh19h6sLlMzePfjC4=
X-Received: by 2002:a17:906:ba82:b0:a72:8d2f:859c with SMTP id
 a640c23a62f3a-a7daf562837mr70124066b.33.1722493868606; Wed, 31 Jul 2024
 23:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com> <20240731-56ba72420d7f745dacb66fd8@orel>
 <CAHVXubjrrWVnw1ufXRJh_5N9M5UiOVZseb0C78fjLaYhNKF7eA@mail.gmail.com> <20240731-676154f31336c78bafea57d0@orel>
In-Reply-To: <20240731-676154f31336c78bafea57d0@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 1 Aug 2024 08:30:57 +0200
Message-ID: <CAHVXubhUVi=Ryc4fF+7Z12h7p1aQtVwHfD6YGfw676aijjw5Rg@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_233111_468010_18472637 
X-CRM114-Status: GOOD (  29.36  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNjoxNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDU6NTI6
NDZQTSBHTVQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEhpIERyZXcsCj4gPgo+ID4gT24g
V2VkLCBKdWwgMzEsIDIwMjQgYXQgNDoxMOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1bCAzMSwgMjAyNCBhdCAw
OToyMzo1NEFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiA+IHJpc2N2IGRvZXMg
bm90IGhhdmUgbHIgaW5zdHJ1Y3Rpb25zIG9uIGJ5dGUgYW5kIGhhbGZ3b3JkIGJ1dCB0aGUKPiA+
ID4gPiBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNlcyBzdWNoIGF0b21pY3Mg
cHJvdmlkZWQgYnkgdGhlCj4gPiA+ID4gWmFiaGEgZXh0ZW5zaW9uLCBzbyB0aG9zZSBzaXplcyBh
cmUgbGVnaXRpbWF0ZS4KPiA+ID4KPiA+ID4gV2UgY3VycmVudGx5IGFsd2F5cyBjb21lIHRvIF9f
Y21wd2FpdCgpIHRocm91Z2ggc21wX2NvbmRfbG9hZF9yZWxheGVkKCkKPiA+ID4gYW5kIHF1ZXVl
ZF9zcGluX2xvY2tfc2xvd3BhdGgoKSBhZGRzIGFub3RoZXIgaW52b2NhdGlvbi4KPiA+Cj4gPiBh
dG9taWNfY29uZF9yZWFkX3JlbGF4ZWQoKSBhbmQgc21wX2NvbmRfbG9hZF9hY3F1aXJlKCkgYWxz
byBjYWxsCj4gPiBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoKQo+ID4KPiA+IEFuZCBoZXJlIGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjExLXJjMS9zb3VyY2Uva2VybmVsL2xvY2tp
bmcvcXNwaW5sb2NrLmMjTDM4MCwKPiA+IHRoZSBzaXplIHBhc3NlZCBpcyAxLgo+Cj4gT2gsIEkg
c2VlLgo+Cj4gPgo+ID4gPiBIb3dldmVyLCBpc24ndAo+ID4gPiB0aGUgcmVhc29uIHdlJ3JlIGhp
dHRpbmcgdGhlIEJVSUxEX0JVRygpIGJlY2F1c2UgdGhlIHN3aXRjaCBmYWlscyB0byBmaW5kCj4g
PiA+IGEgY2FzZSBmb3IgMTYsIG5vdCBiZWNhdXNlIGl0IGZhaWxzIHRvIGZpbmQgY2FzZXMgZm9y
IDEgb3IgMj8gVGhlIG5ldwo+ID4gPiBpbnZvY2F0aW9uIHBhc3NlcyBhIHBvaW50ZXIgdG8gYSBz
dHJ1Y3QgbWNzX3NwaW5sb2NrLCB3aGljaCBsb29rcyBsaWtlCj4gPiA+IGl0IGhhcyBzaXplIDE2
LiBXZSBuZWVkIHRvIGVuc3VyZSB0aGF0IHdoZW4gcHRyIHBvaW50cyB0byBhIHBvaW50ZXIgdGhh
dAo+ID4gPiB3ZSBwYXNzIHRoZSBzaXplIG9mIHVpbnRwdHJfdC4KPiA+Cj4gPiBJIGd1ZXNzIHlv
dSdyZSByZWZlcmluZyB0byB0aGlzIGNhbGwgaGVyZQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuMTEtcmMxL3NvdXJjZS9rZXJuZWwvbG9ja2luZy9xc3BpbmxvY2suYyNM
NTUxLAo+ID4gYnV0IGl0J3MgYSBwb2ludGVyIHRvIGEgcG9pbnRlciwgd2hpY2ggd2lsbCB0aGVu
IHBhc3MgYSBzaXplIDguCj4KPiBBaCwgbWlzc2VkIHRoYXQgJyYnLi4uCj4KPiA+Cj4gPiBBbmQg
dGhlIGJ1aWxkIGVycm9yIHRoYXQgSSBnZXQgaXMgdGhlIGZvbGxvd2luZzoKPiA+Cj4gPiBJbiBm
dW5jdGlvbiAnX19jbXB3YWl0JywKPiA+ICAgICBpbmxpbmVkIGZyb20gJ3F1ZXVlZF9zcGluX2xv
Y2tfc2xvd3BhdGgnIGF0Cj4gPiAuLi9rZXJuZWwvbG9ja2luZy9xc3BpbmxvY2suYzozODA6MzoK
PiA+IC4vLi4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjUxMDo0NTogZXJyb3I6IGNh
bGwgdG8KPiA+ICdfX2NvbXBpbGV0aW1lX2Fzc2VydF8yJyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0
ZSBlcnJvcjogQlVJTERfQlVHCj4gPiBmYWlsZWQKPiA+ICAgNTEwIHwgICAgICAgICBfY29tcGls
ZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLAo+ID4gX19jb21waWxldGltZV9hc3NlcnRfLCBf
X0NPVU5URVJfXykKPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCj4gPiAuLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDo0OTE6
MjU6IG5vdGU6IGluIGRlZmluaXRpb24gb2YKPiA+IG1hY3JvICdfX2NvbXBpbGV0aW1lX2Fzc2Vy
dCcKPiA+ICAgNDkxIHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJlZml4ICMjIHN1ZmZpeCgp
Owo+ID4gICAgICAgICAgXAo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn4KPiA+IC4vLi4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjUxMDo5OiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8KPiA+ICdfY29tcGlsZXRpbWVfYXNzZXJ0Jwo+ID4gICA1MTAg
fCAgICAgICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csCj4gPiBfX2NvbXBp
bGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ID4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn4KPiA+IC4uL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybwo+ID4gJ2NvbXBpbGV0aW1lX2Fzc2VydCcKPiA+ICAgIDM5
IHwgI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0
KCEoY29uZCksIG1zZykKPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAuLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5o
OjU5OjIxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8KPiA+ICdCVUlMRF9CVUdfT05fTVNH
Jwo+ID4gICAgNTkgfCAjZGVmaW5lIEJVSUxEX0JVRygpIEJVSUxEX0JVR19PTl9NU0coMSwgIkJV
SUxEX0JVRyBmYWlsZWQiKQo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn4KPiA+IC4uL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjM3NjoxNzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mCj4gPiBtYWNybyAnQlVJTERfQlVHJwo+ID4gICAzNzYgfCAg
ICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7Cj4gPgo+ID4gd2hpY2ggcG9pbnRzIHRvIHRoZSBm
aXJzdCBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoKSBJIG1lbnRpb25lZCBhYm92ZS4KPiA+Cj4KPiBP
SywgeW91J3ZlIGdvdCBtZSBzdHJhaWdodGVuZWQgb3V0IG5vdywgYnV0IGNhbiB3ZSBvbmx5IGFk
ZCB0aGUgZmFsbGJhY2sKPiBmb3Igc2l6ZXMgMSBhbmQgMiBhbmQgbGVhdmUgdGhlIGRlZmF1bHQg
YXMgYSBCVUlMRF9CVUcoKT8KClllcywgc3VyZSwgSSdsbCBkbyB0aGF0LgoKVGhhbmtzLAoKQWxl
eAoKPgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
