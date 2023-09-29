Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A39FCE7AF3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNi/gvNhv1mwP36OgMhrLDzRABd1T963dEWieKoA6KA=; b=jLjge9CyFYIzMk
	0xEw2zpmVPAtSamUSViEz/lXwSuIMvGSj5uWpK4M6Q5Bdk5iVsxMYduTtKyiNSkpz7zMHrVjuvEP2
	+S5COzCWsKXPfAO8bded3xjp6S4vy05No0xJ9rKzWutCj+jPS/DQFTefp5/SKxOM5AdkLWKztCzME
	jZAmUErIbg3Zzc3TI+5pBMJ9KicvWqUl3auxCIe9eHNKr0QviALl++8WY22ibQNuQm54ViAugome3
	I3J1ni4Nfrf7PRRNRq08HM84aqbhwtbUDqefvLBWbjKhSIrl4Brnkavz+2j3Dk7ZS6hGYyVPhOnZJ
	4XnsnKcfKgRCyMvIy8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKbk-008ZU3-25;
	Fri, 29 Sep 2023 21:01:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKbe-008ZT0-1l
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:01:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f737b8b69so12876164f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696021257; x=1696626057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=187HD4gBn36XDqZJcZdh6OqPHZPxl2IR6ZKEs5lHtAU=;
        b=hKUgrYX3HuIbwuYOywuF2wMKaxuPx/hEYIoaiK1IdGfgB8lHDXyM9+oPtmmcaveUtp
         aHA9kDAzUp1XJKrtA2qeAWC8sWgNTwVohi8gBpLQYr8BNA6iTMGLvCtTyrabX+d89xNu
         Vpw2xa9h/59J9Tf9m13oPRXZApFHoU1GiEg6X3KXS0OoCnR+jc5QGBshka11UJJKBluS
         W7re5w3p81YJFrkvrxBIrji+a24+UHFW+v8mHrqyYYFA+5gwbyqI8XwBXfKR6MqDc/y/
         F7aG2A5xI6axh9YYzZoS26YdHgkV2uIdfqMHV5xg67Ot7ew0qYyDY5HgjPkD8sgJmDcU
         wHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021257; x=1696626057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=187HD4gBn36XDqZJcZdh6OqPHZPxl2IR6ZKEs5lHtAU=;
        b=m7yuXrKnbKXv658YS7P/pCR4OKpY+5QgUPH1gQiBSMOFtiayBrlmw6KfyknegfSbYx
         dajRHdOmtojFjkPyEAnqDH6fryzDWUbqsOSz5Ev89/JeEyIlIendfq3El2UrhLkuSA8+
         GbMlukdleWM3SjcXM7d3FaG03xopClyRlZMLZWeI0j1Kcu3A46FT2tjFMctUXQ3uTDVD
         G/h+FPzQnQwp1pZv82SD2mn5occW3cMSTr3Ni/YPsuTcymBhNUJczByHAqBeUcHDCg7K
         NhH56K37109c+x9YC/aC5efDhPqTvq5FT5MNPUYMBEr2VacRepTYTTLQQOZ5BFZXPJhQ
         CMlw==
X-Gm-Message-State: AOJu0YxBd9QoN2Sbc3GN4eWHIs48VJ44Opl4nJ05Nrq3qIGa61I3T+VR
	Enz7AT+kHCn2JM6XrKRh7sFXz445JkMeIUAMfOU=
X-Google-Smtp-Source: AGHT+IEn5b33M5VNWmFOfShYcwTQtHJHZl8Azr+27+en/odENn1umR5EQxSbtqCOR/mg0cTW/5by6jAa30JiFNep9AE=
X-Received: by 2002:adf:d0c1:0:b0:320:28e:b638 with SMTP id
 z1-20020adfd0c1000000b00320028eb638mr4758101wrh.36.1696021257331; Fri, 29 Sep
 2023 14:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230908133923.2675053-1-houtao@huaweicloud.com>
 <20230908133923.2675053-4-houtao@huaweicloud.com> <97b0615e-a541-4856-ba70-be39bdcd8a8f@roeck-us.net>
 <CAJM55Z_76dsTxVEfaxif5H7Rdg_AQmjuscNuB2tLbZoVsWdgEQ@mail.gmail.com> <CA+V-a8u8EcFP_PmFB_KJ2t-x9Xn6EsFKeNR3AnfHse9OqApDkw@mail.gmail.com>
In-Reply-To: <CA+V-a8u8EcFP_PmFB_KJ2t-x9Xn6EsFKeNR3AnfHse9OqApDkw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 29 Sep 2023 14:00:45 -0700
Message-ID: <CAADnVQ+wyrfc0HDFZNh8KB=L8Hd-gNTCjzr=WhQbaGjVt7TKJQ@mail.gmail.com>
Subject: Re: [PATCH bpf 3/4] bpf: Ensure unit_size is matched with slab cache
 object size
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Guenter Roeck <linux@roeck-us.net>, 
	Hou Tao <houtao@huaweicloud.com>, bpf <bpf@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, 
	Hao Luo <haoluo@google.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Hou Tao <houtao1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_140102_590859_1D7C61AB 
X-CRM114-Status: GOOD (  19.93  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMToyNOKAr1BNIExhZCwgUHJhYmhha2FyCjxwcmFiaGFr
YXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyOSwgMjAyMyBhdCA3
OjUy4oCvUE0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gR3VlbnRlciBSb2VjayB3cm90ZToKPiA+ID4gSGks
Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDA4LCAyMDIzIGF0IDA5OjM5OjIyUE0gKzA4MDAsIEhv
dSBUYW8gd3JvdGU6Cj4gPiA+ID4gRnJvbTogSG91IFRhbyA8aG91dGFvMUBodWF3ZWkuY29tPgo+
ID4gPiA+Cj4gPiA+ID4gQWRkIGV4dHJhIGNoZWNrIGluIGJwZl9tZW1fYWxsb2NfaW5pdCgpIHRv
IGVuc3VyZSB0aGUgdW5pdF9zaXplIG9mCj4gPiA+ID4gYnBmX21lbV9jYWNoZSBpcyBtYXRjaGVk
IHdpdGggdGhlIG9iamVjdF9zaXplIG9mIHVuZGVybHlpbmcgc2xhYiBjYWNoZS4KPiA+ID4gPiBJ
ZiB0aGVzZSB0d28gc2l6ZXMgYXJlIHVubWF0Y2hlZCwgcHJpbnQgYSB3YXJuaW5nIG9uY2UgYW5k
IHJldHVybgo+ID4gPiA+IC1FSU5WQUwgaW4gYnBmX21lbV9hbGxvY19pbml0KCksIHNvIHRoZSBt
aXNtYXRjaCBjYW4gYmUgZm91bmQgZWFybHkgYW5kCj4gPiA+ID4gdGhlIHBvdGVudGlhbCBpc3N1
ZSBjYW4gYmUgcHJldmVudGVkLgo+ID4gPiA+Cj4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBBbGV4ZWkg
U3Rhcm92b2l0b3YgPGFzdEBrZXJuZWwub3JnPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEhvdSBU
YW8gPGhvdXRhbzFAaHVhd2VpLmNvbT4KPiA+ID4KPiA+ID4gV2l0aCB0aGlzIHBhdGNoIGluIHBs
YWNlLCBJIHNlZSB0aGUgZm9sbG93aW5nIGJhY2t0cmFjZSBvbiByaXNjdiBzeXN0ZW1zLgo+ID4g
Pgo+ID4gPiBbICAgIDIuOTUzMDg4XSBicGZfbWVtX2NhY2hlWzBdOiB1bmV4cGVjdGVkIG9iamVj
dCBzaXplIDEyOCwgZXhwZWN0IDk2Cj4gPiA+IFsgICAgMi45NTM0ODFdIFdBUk5JTkc6IENQVTog
MCBQSUQ6IDEgYXQga2VybmVsL2JwZi9tZW1hbGxvYy5jOjUwNyBicGZfbWVtX2FsbG9jX2luaXQr
MHgzMjYvMHgzMmUKPiA+ID4gWyAgICAyLjk1MzY0NV0gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPiA+
IFsgICAgMi45NTM3MzZdIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVk
IDYuNi4wLXJjMi0wMDI0NC1nMjdiYmY0NWVhZTljICMxCj4gPiA+IFsgICAgMi45NTM3OTBdIEhh
cmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+ID4gWyAgICAyLjk1Mzg1NV0g
ZXBjIDogYnBmX21lbV9hbGxvY19pbml0KzB4MzI2LzB4MzJlCj4gPiA+IFsgICAgMi45NTM4OTFd
ICByYSA6IGJwZl9tZW1fYWxsb2NfaW5pdCsweDMyNi8weDMyZQo+ID4gPiBbICAgIDIuOTUzOTA5
XSBlcGMgOiBmZmZmZmZmZjgwMTZjYmQyIHJhIDogZmZmZmZmZmY4MDE2Y2JkMiBzcCA6IGZmMjAw
MDAwMDAwMGJkMjAKPiA+ID4gWyAgICAyLjk1MzkyMF0gIGdwIDogZmZmZmZmZmY4MWMzOTI5OCB0
cCA6IGZmNjAwMDAwMDJlODAwNDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+IFsgICAgMi45
NTM5MzBdICB0MSA6IGZmZmZmZmZmYmJiYWJiYzMgdDIgOiA2MzVmNmQ2NTZkNWY2NjcwIHMwIDog
ZmYyMDAwMDAwMDAwYmRjMAo+ID4gPiBbICAgIDIuOTUzOTQwXSAgczEgOiBmZmZmZmZmZjgxMjFj
N2RhIGEwIDogMDAwMDAwMDAwMDAwMDAzNyBhMSA6IGZmZmZmZmZmODFhOTMwNDgKPiA+ID4gWyAg
ICAyLjk1Mzk0OV0gIGEyIDogMDAwMDAwMDAwMDAwMDAxMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDEg
YTQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+IFsgICAgMi45NTM5NTldICBhNSA6IDAwMDAwMDAw
MDAwMDAwMDAgYTYgOiBmZmZmZmZmZjgxYzRmZTA4IGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4g
PiBbICAgIDIuOTUzOTY4XSAgczIgOiAwMDAwMDAwMDAwMDAwMDBiIHMzIDogMDAwMDAwMDAwMDAw
MDAwMCBzNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gWyAgICAyLjk1Mzk3N10gIHM1IDogMDAw
MDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAxMDAgczcgOiBmZjVmZmZmZmZmZmQzMTI4
Cj4gPiA+IFsgICAgMi45NTM5ODZdICBzOCA6IGZmZmZmZmZmODFjM2QxZjggczkgOiAwMDAwMDAw
MDAwMDAwMDYwIHMxMDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPiBbICAgIDIuOTUzOTk2XSAgczEx
OiAwMDAwMDAwMDAwMDAwMDYwIHQzIDogMDAwMDAwMDA2NWE2MWIzMyB0NCA6IDAwMDAwMDAwMDAw
MDAwMDkKPiA+ID4gWyAgICAyLjk1NDAwNV0gIHQ1IDogZmZmZmZmZmZkZTE4MDAwMCB0NiA6IGZm
MjAwMDAwMDAwMGJiMDgKPiA+ID4gWyAgICAyLjk1NDAxNF0gc3RhdHVzOiAwMDAwMDAwMjAwMDAw
MTIwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDMKPiA+
ID4gWyAgICAyLjk1NDA0N10gWzxmZmZmZmZmZjgwMTZjYmQyPl0gYnBmX21lbV9hbGxvY19pbml0
KzB4MzI2LzB4MzJlCj4gPiA+IFsgICAgMi45NTQwODddIFs8ZmZmZmZmZmY4MGUxMTQyNj5dIGJw
Zl9nbG9iYWxfbWFfaW5pdCsweDFjLzB4MzAKPiA+ID4gWyAgICAyLjk1NDA5N10gWzxmZmZmZmZm
ZjgwMDAyODVlPl0gZG9fb25lX2luaXRjYWxsKzB4NWMvMHgyMzgKPiA+ID4gWyAgICAyLjk1NDEw
NV0gWzxmZmZmZmZmZjgwZTAxMWFlPl0ga2VybmVsX2luaXRfZnJlZWFibGUrMHgyOWEvMHgzMGUK
PiA+ID4gWyAgICAyLjk1NDExNV0gWzxmZmZmZmZmZjgwYzAzMTJjPl0ga2VybmVsX2luaXQrMHgx
ZS8weDExMgo+ID4gPiBbICAgIDIuOTU0MTI0XSBbPGZmZmZmZmZmODAwMDNkODI+XSByZXRfZnJv
bV9mb3JrKzB4YS8weDFjCj4gPiA+Cj4gPiA+IENvcHlpbmcgcmlzY3YgbWFpbnRhaW5lcnMgYW5k
IG1haWxpbmcgbGlzdCBmb3IgZmVlZGJhY2sgLyBjb21tZW50cy4KPiA+Cj4gPiBJZiBpdCBtYWtl
cyBhIGRpZmZlcmVuY2UgSSBhbHNvIHNlZSB0aGlzIHdpdGggNi42LXJjMyBvbiBteSBOZXpoYSBi
b2FyZAo+ID4gKEFsbHdpbm5lciBEMSksIGJ1dCBub3Qgb24gbXkgVmlzaW9uRml2ZSAyIChKSDcx
MTApIHJ1bm5pbmcgdGhlIHNhbWUga2VybmVsLgo+ID4KPgo+IEFkZGluZyBvbmUgbW9yZSBSSVND
LVYgYm9hcmQgKFJlbmVzYXMgUlovRml2ZSkgdG8gbGlzdCB3aGVyZSBJIHNlZSB0aGlzIGlzc3Vl
OgoKQ291bGQgeW91IHBsZWFzZSBoZWxwIHRlc3QgdGhlIHByb3Bvc2VkIGZpeDoKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L25ldGRldmJwZi9wYXRjaC8yMDIzMDkyODEwMTU1
OC4yNTk0MDY4LTEtaG91dGFvQGh1YXdlaWNsb3VkLmNvbS8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
