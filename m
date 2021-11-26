Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A12AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/WxA8o6sWOLcP4BExww3hGRmYiZpaB18NeEcmD3afk=; b=t3V8Q9Wr56iEao
	EB2cpTBscYqmlIRZQQ4gx1OURypkPnu9MkgN/Z73Q8Lyhiwu6oAs5pdu1VRSGfb7YG+/sDoUwqCPK
	yNQfN/NLCRoPtu4ibcWUEK0fBkd5DKMdqBSILR1WiFWgSWW/Jvc7GngtpstwPEp9v46W/AnDlczFP
	sOj/fSPxeq7Tfb7GDOPScCAhYlcphcsxNr+uqjJeFROERkUntkjFrirMSVsfmCEG56CBM6Lnft4Nv
	j2FyXXQSF32zPgedjjfnqvKQvkTVWAtaDbpkaGaEp1d6uma6GMp1LCk1Z2+u2m5CoS1fo3Zb/55gZ
	HhxifrVz4C2TcVjBQA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqX46-009gE7-Oe; Fri, 26 Nov 2021 08:58:42 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqX43-009gDQ-Pe
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 08:58:41 +0000
Received: by mail-ua1-f41.google.com with SMTP id p2so17163090uad.11
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 00:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u0lBhcfAnaRE4bZpFJuFyiABanuMWgBjQpH4Ikk8Mt8=;
 b=uMZu39fcvfnkdj91Y1RUuIf+q8ffoUsJvGBCUxtIJIwaTE3aLTG0AO294nA2H0Qv6+
 Z8+bFBCCrKB5Pq/piqLhtgCMwcUtNjF7aLWRXbJHY/sCzWnCWW3IEbfGYmmvIKi9CWY0
 /2VeW++8b+aw8jPUXIGVGxGz9GCaKtW00KnlocM2jq9BgAPxo4jkqmWPvWNKg5uHZkBm
 xxtCRGMAUj23yLo2FEEP7bwppHExrl3CiyMwkWMluq3IM2XSAdncgGhKpAJKkEVL+xkx
 O3XecCnNGgRT4rqEKt9IUkzi5+VMqFdvSMTGaNnZslOKLxD3qyWyiuRumAnXEIDwBNpZ
 UMQw==
X-Gm-Message-State: AOAM530HH3ABfGKXYaoukP/h7PQqhGVYZHLpXLkHvOZuNQ1TOzWSDzTJ
 uTNYzlQoXXGQ8DSh4I7rk18luBMV42l8YQ==
X-Google-Smtp-Source: ABdhPJzDiuVjVhhXCOqnQFG8BsP/pqzTZRD26YQvT7UDIEtTk1QFkf4K13Ru4X7jWGefsFLr8Kyd1A==
X-Received: by 2002:a05:6102:d94:: with SMTP id
 d20mr15972039vst.12.1637917117737; 
 Fri, 26 Nov 2021 00:58:37 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id i56sm3117804vkr.25.2021.11.26.00.58.37
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 00:58:37 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 188so5505848vku.8
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 00:58:37 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id
 j19mr18403354vkd.7.1637917116905; 
 Fri, 26 Nov 2021 00:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20211125152233.162868-1-geert@linux-m68k.org>
 <161F972E-7972-4001-BE19-C88F81EF8047@jrtc27.com>
In-Reply-To: <161F972E-7972-4001-BE19-C88F81EF8047@jrtc27.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 09:58:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
Message-ID: <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive, plic: Fix
 number of interrupts
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Zhu <michael.zhu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_005839_858759_EA231736 
X-CRM114-Status: GOOD (  33.80  )
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

SGkgSmVzc2ljYSwKCk9uIFRodSwgTm92IDI1LCAyMDIxIGF0IDU6MDggUE0gSmVzc2ljYSBDbGFy
a2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPiBPbiAyNSBOb3YgMjAyMSwgYXQgMTU6MjIs
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gVG8g
aW1wcm92ZSBodW1hbiByZWFkYWJpbGl0eSBhbmQgZW5hYmxlIGF1dG9tYXRpYyB2YWxpZGF0aW9u
LCB0aGUgdHVwbGVzCj4gPiBpbiAiaW50ZXJydXB0cy1leHRlbmRlZCIgcHJvcGVydGllcyBzaG91
bGQgYmUgZ3JvdXBlZCB1c2luZyBhbmdsZQo+ID4gYnJhY2tldHMuICBBcyB0aGUgRFQgYmluZGlu
Z3MgbGFjayBhbiB1cHBlciBib3VuZCBvbiB0aGUgbnVtYmVyIG9mCj4gPiBpbnRlcnJ1cHRzLCB0
aHVzIGFzc3VtaW5nIG9uZSwgcHJvcGVyIGdyb3VwaW5nIGlzIGN1cnJlbnRseSBmbGFnZ2VkIGFz
Cj4gPiBhbiBlcnJvci4KClJvYjogSXMgdGhpcyBhIGJ1ZyBpbiB0aGUgdG9vbGluZyB0aGF0IHNo
b3VsZCBiZSBmaXhlZD8KUmVnYXJkbGVzcywgc3BlY2lmeWluZyBhIHJlYWwgdXBwZXIgbGltaXQg
aXMgYWx3YXlzIGEgZ29vZCBpZGVhLgoKPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyB0aGUgbWlzc2lu
ZyAibWF4SXRlbXMiLCBsaW1pdGluZyBpdCB0byA5IGludGVycnVwdHMKPiA+IChvbmUgaW50ZXJy
dXB0IGZvciBhIHN5c3RlbSBtYW5hZ2VtZW50IGNvcmUsIGFuZCB0d28gaW50ZXJydXB0cyBwZXIg
Y29yZQo+ID4gZm9yIG90aGVyIGNvcmVzKSwgd2hpY2ggc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9y
IG5vdy4KPgo+IFRoaXMgaXMgU2lGaXZl4oCZcyBJUCwgc28gaXMgdGhpcyBhY3R1YWxseSB0cnVl
PyBJIHdvdWxkIGltYWdpbmUgaXTigJlzCj4ganVzdCBwYXJhbWV0ZXJpc2VkIGFuZCBjb3VsZCBi
ZSBnZW5lcmF0ZWQgd2l0aCBhcyBtYW55IHRhcmdldHMgYXMgZml0Cj4gaW4gdGhlIE1NSU8gc3Bh
Y2UsIGFuZCB0aGF0IHRoaXMgaXMgdGh1cyBpbmFjY3VyYXRlLiBCZXNpZGVzLCBzdWNoIGEKClll
cywgdGhpcyBpcyBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkLiAgSSBqdXN0IHVzZWQgdGhlIG1heGlt
dW0gdmFsdWUKY3VycmVudGx5IGluIHVzZS4KCmRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBs
aWMuYyBoYXMgI2RlZmluZSBNQVhfQ09OVEVYVFMgMTU4NzIsCndoaWNoIG1hdGNoZXMgdGhlIHZh
bHVlIG9mIENPTlRFWFRfUEVSX0hBUlQgYW5kIHRoZSBhdmFpbGFibGUgYWRkcmVzcwpzcGFjZSBp
biB0aGUgZHJpdmVyIGFuZCBpbiBbMV0uCldvdWxkIHlvdSBiZSBtb3JlIGNvbWZvcnRhYmxlIHdp
dGggIm1heEl0ZW1zOiAxNTg3MiI/Ck9yIGRvIHlvdSBwcmVmZXIgc2V0dGluZyB0aGUgbWF4aW11
bSBiYXNlZCBvbiB0aGUgY29tcGF0aWJsZSB2YWx1ZQooMiBmb3IgazIxMCwgOSBmb3IgZnU1NDAs
IDQgZm9yIGpoNzEwMFsyXSk/Cgo+IGZ1bmN0aW9uIGNoYW5nZSBzaG91bGQgYmUgbWFkZSBzZXBh
cmF0ZWx5IGZyb20gdGhlIGdyb3VwaW5nIGNoYW5nZS4KCk9LLCB3aWxsIHNwbGl0IGluIHYyLgoK
PiBUaGUgc2FtZSBnb2VzIGZvciB5b3VyIGVxdWl2YWxlbnQgc2lmaXZlLGNsaW50MCBwYXRjaC4K
Ck9LLgoKPiA+IEdyb3VwIHRoZSB0dXBsZXMgaW4gdGhlIGV4YW1wbGUuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+IC0t
LQo+ID4gLi4uL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgICAg
ICB8IDEyICsrKysrKy0tLS0tLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
c2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gaW5kZXggMDhkNWE1N2NlMDBmZjQ0Ni4uMTk4YjM3
M2Y5ODRmMzQzOCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
c2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gQEAgLTYxLDYgKzYxLDcgQEAgcHJvcGVydGllczoK
PiA+Cj4gPiAgIGludGVycnVwdHMtZXh0ZW5kZWQ6Cj4gPiAgICAgbWluSXRlbXM6IDEKPiA+ICsg
ICAgbWF4SXRlbXM6IDkKPiA+ICAgICBkZXNjcmlwdGlvbjoKPiA+ICAgICAgIFNwZWNpZmllcyB3
aGljaCBjb250ZXh0cyBhcmUgY29ubmVjdGVkIHRvIHRoZSBQTElDLCB3aXRoICItMSIgc3BlY2lm
eWluZwo+ID4gICAgICAgdGhhdCBhIGNvbnRleHQgaXMgbm90IHByZXNlbnQuIEVhY2ggbm9kZSBw
b2ludGVkIHRvIHNob3VsZCBiZSBhCgpbMV0gaHR0cHM6Ly9zdGF0aWMuZGV2LnNpZml2ZS5jb20v
VTU0LU1DLVJWQ29yZUlQLnBkZgpbMl0gVGhlIFBMSUMgbWVtb3J5IG1hcCBpbgogICAgaHR0cHM6
Ly9naXRodWIuY29tL3N0YXJmaXZlLXRlY2gvSkg3MTAwX0RvY3MvYmxvYi9tYWluL3ZpY191N19t
YW51YWxfd2l0aF9jcmVhdGl2ZWNvbW1vbnMucGRmCiAgICBpbmRpY2F0ZSBvdGhlciB2YWx1ZXMg
b2YgRU5BQkxFX1BFUl9IQVJUIGFuZCBDT05URVhUX1BFUl9IQVJUPwogICAgSXMgbWVtb3J5IHRo
ZSBtYXAgY29ycmVjdD8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
