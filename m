Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B214C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjrjsE4upLQw2Xx1ei+ojZKHyHUCVCxOYoa4imxfGX4=; b=NBRFukjaWab6EC
	fXV+8lX7UQgCXVsZuRgcbOhtpE2yn1AzfYYka37XOfXrYyPfZwYza0GMIO54EXOhXibTaaYQPUh/v
	xgUeh8RghsQA3hVLqaToEf7vywXOIy7n8viKdNDNptDMuiVemCvL8RAI6UxKBkla9sOpsSI54Gpjx
	SELsonD10OI2FzvmjdFi4TcyXcBYM4VfCTspur1JLamtkBsKSUbiMdHaSaRKMjyqX7A0ec4I0VhE3
	1wbQoejhzfRDjrMRDSREVWnJYonYYcNGg2itPE73e8aDddJg3vYlOcHV2lpSgOPGvM9EGEqTWFYFF
	AH0JjIfDFLwvPCyL08DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhcR-0000000At7D-3wRZ;
	Thu, 26 Jun 2025 08:06:03 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhV7-0000000As9j-0wBf
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 07:58:30 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e81826d5b72so515309276.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750924708; x=1751529508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=uaMBWRU3ZgW930P4pOagjjy9JENrzFYBWFgS23jt9QRvJF0nxO3vDQDF9Ak6sKGvcX
         kFYIxSCuVGw9BD1i6zDS07CawWi6PW7/uMqlOyB4vQ8o4dSdET9kYJVsp1dHXN3CQZtZ
         CcNAdBhbB/kYUse/WzZHHMUW4sn9UQNz83/t0omixtchy4qbBTtfU9fQLl5UOxyUooPD
         j5BBjfKBOj0D5Kb1BTL6t0Vu0twzCxRVARjnLAsjz2FwCePpB/UsFdZcWip1rCn7krT/
         HGiwvDdYR9rNpi9ezG91BZbQg8EHVkLcluDMCDT6jvaGgxGQptixUA0SzDywjBDZOLUh
         FV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924708; x=1751529508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=wrhKJBQhZrQOc20MkvBn8k1B5Ng3K780s2BC7WFNmC9h8WUFWMfCGy9J8iVbtBlpCN
         G8asxtB/Q0K6EmV/JQvycvLanRKA4dq8RxtTamXvjb3EyDeTVURHjwntJd/Ctv3kdEPj
         LuFPNzG9KbXenhwvOcAvXa4mn17MteGpYS3rgDwviUa9kxWdOqeYIP7T5w3Tvq9/45e9
         neWqWvuLzLhvFzfGahNYISEgLmPIuI+/jxE9/P9kyyH1RrPvBOwRWYpZ/TuXLBiQ2veS
         sqDljRihM1c8ZJmMUpGvUANv2nKDQ2miE7sPf1KLFYQphKU8pzl4pgEXknrgjJManjyt
         3OCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkEQ+66T2bekfZ/O1yqxURIJy4jvb4+QEdvBPioFs7tlt9YUCskhoH7Y76lzfWiiIT/cAvnDgpHc0XMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFoNQ3mqFcuF88LtKvtZAtKxHez2oy+ySzIxD96PIzzbqRTdED
	NeX3i4VJBXJIRIF5iqzzp7K3s7+OJ9P8nvsNnn2G/8VCcc4K8n4Y/3oa8DIgK+LyV+J7A6vM0WV
	oXe6+z8QHd9VYIh0nRvcEwOIabEctpyftP3HVMI/95A==
X-Gm-Gg: ASbGncu0nx3qUXCVRhjv6zoo+cjECDlOnmCfLFM8IoGZH1q9owdrFe6IwzqQG7JtdE0
	ibzNd3KyFoHlwvJFpphOZh8XiAhqyIr7rfDyJweoigJcp1OatvHV93B0Xh28OIgY9ABnk5b/swC
	4eStinTNbONM4JkpucDMkDPUG8Eo5fJHu+Gj6Jsm02IrA=
X-Google-Smtp-Source: AGHT+IEzDH0NRWqzIEote+KhgyU/fDNmW2VP0PKdVNT2yILrISQmmaVeujNnwl/coWmd3McvdKX6qUuA9VblGYbEEvI=
X-Received: by 2002:a05:690c:3391:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-71406e1ba1fmr85608977b3.38.1750924708356; Thu, 26 Jun 2025
 00:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com> <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
In-Reply-To: <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 26 Jun 2025 15:58:17 +0800
X-Gm-Features: Ac12FXzAOZiKHwn50uOUxMMWJ46pZGPTTL9IzHlqGbLf3HaSvxr5iudx5ZkTgoQ
Message-ID: <CAH1PCMZp9pr3SKYroyDfY-p5X=ojY5ZPt8_m7xXLejEzH07QOA@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_005829_261845_DFFB2A56 
X-CRM114-Status: GOOD (  19.11  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTE6MjHigK9BTSBWaXZpYW4gV2FuZyA8d2FuZ3J1aWth
bmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gT24gNi8yNC8yNSAyMDoyMSwgR3VvZG9uZyBYdSB3
cm90ZToKPiA+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDY6MDTigK9QTSBWaXZpYW4gV2FuZyA8
d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+ID4+IFVBUlQgZGV2aWNlcyBpbiBTcGFj
ZW1pdCBLMSB1c2UgZG1hLWJ1cyBETUEgdHJhbnNsYXRpb25zLiBNb3ZlIHRoZXNlCj4gPj4gbm9k
ZXMgdW5kZXIgZG1hLWJ1cyB0byByZWZsZWN0IHRoaXMgZmFjdC4KPiAuLi4KPiA+Pgo+ID4+IC0g
ICAgICAgICAgICAgICBzZWNfdWFydDE6IHNlcmlhbEBmMDYxMjAwMCB7Cj4gPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS11YXJ0IiwgImludGVsLHhz
Y2FsZS11YXJ0IjsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZjA2
MTIwMDAgMHgwIDB4MTAwPjsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPDQzPjsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8
MTQ4NTcwMDA+Owo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJlZy1zaGlmdCA9IDwyPjsK
PiA+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWctaW8td2lkdGggPSA8ND47Cj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gInJlc2VydmVkIjsgLyogZm9yIFRFRSB1c2Fn
ZSAqLwo+ID4+IC0gICAgICAgICAgICAgICB9Owo+ID4+IC0KPiA+IEFyZSB5b3Ugc3VyZSBzZWNf
dWFydDEgc2hvdWxkIGJlIHBsYWNlZCB1bmRlciB0aGUgZG1hX2J1cz8gUGxlYXNlIGRvdWJsZQo+
ID4gY2hlY2suIElmIHNlY191YXJ0MSBhbmQgb3RoZXIgcGVyaXBoZXJhbHMgc3VwcG9ydGVkIGJ5
IHRoZSBzZWN1cmUgRE1BCj4gPiAoYmFzZSBhZGRyZXNzOiAweEYwNjAwMDAwKSBzaGFyZSB0aGUg
c2FtZSBhZGRyZXNzIG1hcHBpbmcgYXMgZG1hX2J1cywgYW5kCj4gPiBpZiB0aGV5IGNhbiBiZSBh
Y2Nlc3NlZCBieSB0aGUgbGludXgga2VybmVsIGluIHNvbWUgY2FzZXMgKGFzIHNheWluZwo+ID4g
J3Jlc2VydmVkJyksIHRoZW4gdGhhdCBtYWtlcyBzZW5zZS4gSWYgbm90LCBiZXR0ZXIgbm90IG1v
dmUgdGhlbS4KPgo+IEhpIEd1b2RvbmcsCj4KPiBJIGhhdmUgY29uZmlybWVkIHdpdGggU3BhY2Vt
aVQgdGhhdCBzZWNfdWFydDEgdXNlcyBkcmFtX3JhbmdlNCwgYS5rLmEuCj4gZG1hLWJ1cywgd2hp
Y2ggaXMgc2FtZSBhcyB0aGUgcmVzdCBvZiB0aGUgVUFSVHMuCj4KPiBBbHNvLCBzZWNfdWFydDEg
aXMgdXNhYmxlIGluIGUuZy4gTGludXgsIGJ1dCBvbmx5IGlmIG5vIFRFRSBpcyBpbiB1c2UuCj4g
VXNpbmcgc3RhdHVzID0gInJlc2VydmVkIiBpcyB0aGUgc2FmZSBjaG9pY2UgaGVyZS4gUGxhdGZv
cm1zIHRoYXQgZG8gbm90Cj4gcnVuIGEgVEVFIChvciBhbnl0aGluZyBzaW1pbGFyIHRoYXQgd291
bGQgZGlzYWJsZSBhY2Nlc3MgdG8gdGhlCj4gMHhmMDAwXzAwMDAgdG8gMHhmZmZmX2ZmZmYgcmFu
Z2UpIGFuZCB3aXNoaW5nIHRvIGVuYWJsZSB1c2Ugb2Ygc2VjX3VhcnQxCj4gY2FuIGNoYW5nZSB0
aGUgc3RhdHVzIHRvICJva2F5Ii4KPgoKT2ssIHdpdGggdGhhdCBjb25maXJtZWQsIEknZCBzYXkg
dGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEd1b2RvbmcgWHUgPGd1
b2RvbmdAcmlzY3N0YXIuY29tPgoKVGhhbmtzLgoKPiBWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5n
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
