Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D0ED63939
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ena1Iwx0o9+WGrC71rOGxdwR9wb0ZZp+BHg/6jmLqs=; b=1gEKl/5JLbN+Vx
	SUWezvffmwaE6u4p6hUAlHFjNkf9CB0V7sRaMVcibbPFYIZ6CJqt4oeAq7ylPX1yx6mBTU4bkeUbr
	DyBuj50w8Rx9m79xikS+Z0dIHDoDp7UAU2bGZIv8yEm9vph8WzqvbGI9o6Ae4xBrlvCk5sBCvfPrp
	KVLLg92M4q7VeGPSvjuxf3afwzR2ibHoWP7qeshE7gUjGndz9OMVz8AmbCeOiQ0BNn2Gf9r0t9fG+
	dY4/+9+X/gnfpxxzmnkDJHWa/Vzv9hgGGgAkgajaEf96j5evH8uhTUQ9/yt4qtXqRkwxncLimnZ0h
	BGNn9GoQv717+SIwEwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlB8-0000000FS9A-2pvZ;
	Wed, 20 Nov 2024 13:55:34 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlB5-0000000FS8P-3H34
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 13:55:32 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso68327721fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 05:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732110930; x=1732715730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWo6MmMAnTgakCcBn1+jc6Kn4Hq1VkFACaiDY+zPG/w=;
        b=fwhLUtZQCs8uuQ72zE76CL46ASv3zCgBf/5o35XxdNpuNrfvwo1sI7Vxxdy2oilBC9
         qIhr1hnxTcO1GX8jPSbs8w5Q1v7l8TrAjLayPSOdEGtJ+HL4fZqtJGvyLOqdVk7VlluS
         E/i6oRG8CaTYM+2UWGvR8T5xFCQHmw/jbCvlEE8wHHseOWQt3AdQaFFp+2aci87UxUwJ
         Tjus567JFJ2/CnefY/r/izzEn2WQNnv7KBGUbTW78i3YidyUJ10QpFY0UtqKqm0JxqLE
         NikKnbW+oERDdRCAvNBntTl9doawAEC98YF7vq6fh8YKlBhFIofWknGmbHXqAK+pqnQ/
         GSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732110930; x=1732715730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWo6MmMAnTgakCcBn1+jc6Kn4Hq1VkFACaiDY+zPG/w=;
        b=f2xMvUUku359aY9IUN1Wrw+U22YV7g437q/ceMNLW/UVgBXADzXTgcOGwTHmLDd5rj
         2KgALsIJaoU2JjP5i1ouIUQVriOfRgWWIb7g+iAaOCcYXPPjwJ9vIYSwV8inaHWNBG6I
         3EAnl1ars2NQuJmqyX4wFIz4jz/rpcjcF+kgZcD3RSrOh9IZj4Qfol+I+mFUkRb8mptm
         PKiqsk6b6KZu9PVZ/ao3UoDSMQP/XDQ9+3+a/W7VkN//Gnf+rOTVFvMnC+exMXQw3E6z
         HsuZEynTfCCHDK88F6Pj66vkqEFNYn1+HEgH6FAaJLR2FyCNQMnEmkaLbA9l/fnLzQtL
         9Ieg==
X-Forwarded-Encrypted: i=1; AJvYcCVSqNsXney2PZ6u1L6SAa5ezXGQoBmKbwreBmmzZkXF3WouG8FMjj1RZnGRQ68R97ifZKsAWgjltdebSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRW4Nz/mjd0Aosyr6HN/iDV/K1mGyBBnQZAxsAba5+1Df7z8g
	fE48jlpd/s96ZIG8XOK9nSN8EHhUJ5UeWVZWQ127cFgkr5YGvynqyVLpoGel+YmGdMww1I4eeF5
	zsp1ouDe+e09AhYKckTi5FgIfHnrRLz6NztfC2g==
X-Google-Smtp-Source: AGHT+IGnkwgpl/fVHCnAI2JHFf0JszP0Rs1/hN3/HwVKLTkM8QFYKEB3KFhIrGPtwJ8EIhrJTpbnn92x9rsPQMasFgw=
X-Received: by 2002:a05:6512:3c97:b0:53b:163a:f279 with SMTP id
 2adb3069b0e04-53dc136b9ffmr2010773e87.53.1732110929980; Wed, 20 Nov 2024
 05:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com> <eb8f399b-fa09-47fd-8102-9b65b0839dd5@ghiti.fr>
In-Reply-To: <eb8f399b-fa09-47fd-8102-9b65b0839dd5@ghiti.fr>
From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 21:55:18 +0800
Message-ID: <CAHibDyzOWrKwEZ_7K2f2MY9DFn4sD5QjDEQ42u8DTaftN6Fuvw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_055531_825239_85F4055F 
X-CRM114-Status: GOOD (  17.39  )
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

SGkgQWxleGFuZHJlLAoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4KSSB3aWxsIHNlbmQgYSB0
eXBvIGZpeCBpbiB0aGUgUkZDIHYzIHBhdGNoZXMKCkJlc3QgcmVnYXJkcywKTWF4IEhzdQoKT24g
VGh1LCBOb3YgMTQsIDIwMjQgYXQgMTI6MTXigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hp
dGkuZnI+IHdyb3RlOgo+Cj4gSGkgTWF4LAo+Cj4gT24gMjAvMDkvMjAyNCAwOTozOSwgTWF4IEhz
dSB3cm90ZToKPiA+IEFkZCBhbiBlbnRyeSBmb3IgdGhlIFN2dWt0ZSBleHRlbnNpb24gdG8gdGhl
IHJpc2N2LGlzYS1leHRlbnNpb25zCj4gPiBwcm9wZXJ0eS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTog
U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXggSHN1IDxtYXguaHN1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDcgKysrKysr
Kwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gPiBpbmRleCBhMDZkYmM2YjQ5Mjg5NTg3MDQ4NTVjODk5MzI5MWIwMzZlM2QxYTYzLi5k
Zjk2YWVhNWU1M2E3MGIwY2I4OTA1MzMyNDY0YTQyYTI2NGU1NmU2IDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAo+ID4gQEAgLTE3MSw2ICsxNzEsMTMgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAg
ICAgICAgbWVtb3J5IHR5cGVzIGFzIHJhdGlmaWVkIGluIHRoZSAyMDE5MTIxMyB2ZXJzaW9uIG9m
IHRoZSBwcml2aWxlZ2VkCj4gPiAgICAgICAgICAgICAgIElTQSBzcGVjaWZpY2F0aW9uLgo+ID4K
PiA+ICsgICAgICAgIC0gY29uc3Q6IHN2dWt0ZQo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoK
PiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3Z1a3RlIHN1cGVydmlzb3ItbGV2ZWwgZXh0
ZW5zaW9ucyBmb3IgbWFraW5nIHVzZXItbW9kZQo+Cj4KPiBzL2V4dGVuc2lvbnMvZXh0ZW5zaW9u
Cj4KPgo+ID4gKyAgICAgICAgICAgIGFjY2Vzc2VzIHRvIHN1cGVydmlzb3IgbWVtb3J5IHJhaXNl
IHBhZ2UgZmF1bHRzIGluIGNvbnN0YW50IHRpbWUsCj4gPiArICAgICAgICAgICAgbWl0aWdhdGlu
ZyBhdHRhY2tzIHRoYXQgYXR0ZW1wdCB0byBkaXNjb3ZlciB0aGUgc3VwZXJ2aXNvcgo+ID4gKyAg
ICAgICAgICAgIHNvZnR3YXJlJ3MgYWRkcmVzcy1zcGFjZSBsYXlvdXQsIGFzIFBSIzE1NjQgb2Yg
cmlzY3YtaXNhLW1hbnVhbC4KPiA+ICsKPiA+ICAgICAgICAgICAtIGNvbnN0OiB6YWNhcwo+ID4g
ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICAgICAgICAgICAgICAgVGhlIFphY2FzIGV4
dGVuc2lvbiBmb3IgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zCj4g
Pgo+Cj4gWW91J2xsIG5lZWQgYSBuZXcgdmVyc2lvbiBmb3IgdGhlIHByb3BlciBjb21taXQgc2hh
MSBvbmNlIGl0IGdldHMKPiByYXRpZmllZCBhbnl3YXksIHNvIHdpdGggdGhlIHR5cG8gZml4ZWQs
IHlvdSBjYW4gYWRkOgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KPgo+IFRoYW5rcywKPgo+IEFsZXgKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
