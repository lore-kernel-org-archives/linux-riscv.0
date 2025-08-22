Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747CDCA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iqp5gvuoInM4hbuz1XSaJRY4D8b0noP+zNP1Sa47Xqc=; b=weBVU40jMPeBDK
	0PBIWNCn9v2eak0fX96jwqP9xiyO0hi++lQsjoHwM0lqIJTgGTABWVYDpGXympQLcMfAXEjzuPPAH
	DPhfPFaqg3FW/O1zYOvfgHbPRjaKSGjWBP5oAXORrmMi2L7EkkXEv84DJcq3mxoqQ947pUtd8jrAf
	KlqgqRbjMU4qNdsx+1O/GhgpLrdyaDg1YjMCiS3Qs4uZs4oWN8ejmIN6QhQ8WP9XESubD0NMHTbwH
	AJdFD8cJb1uknSbqvolNAZHt4IYdwlpXyq1OG3om0n5V0BddQe9kVy4Cqib7ccuBppnHW4+zunOBE
	2ojP3pGNH0jknybzMteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTxC-000000035qj-1nqq;
	Fri, 22 Aug 2025 15:45:22 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPow-00000002HqC-2hsQ
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:20:35 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-88432d8fdd6so75262739f.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755861634; x=1756466434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/vfvb14CGNszwxeStpY4dH+U6nsuyg9PGBngcSjux8=;
        b=KK2zbnFj3YBe8ZWGOXZB6guhLRLZCwvOwAfyCLP9tKfKsbOmESounvmTMPDGHvGxWE
         e8H4j2tWGggcB8POPDf5evdS3X5lLDqeo9uoZ5UmDqItAtC84cwiOQGvemdEWqCCBgta
         /QwkyTYLjHsRjiM/JX/j7wA4VbFOhrG2SNS9N4nuMxZZpab7kgIP+poPjvWCS+REpf6l
         7B1nZ9J8E5zFA4iT0kGlUN1gNI9mbnzWuctRljpfZLLaOMNaKW0JYLkc7LI3zGk1a57/
         4qWniZkNmxspXdgaIY53apUs5xwH54cEtjga2YWfMHaavfVJkMHMTMxYJROcL1BXU6o/
         y7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861634; x=1756466434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/vfvb14CGNszwxeStpY4dH+U6nsuyg9PGBngcSjux8=;
        b=GKW53FvorAcsP5ciibJUo8PDBuqB9dyGd5V5swbTLwjetCWykEqyslngTkse+qxXHU
         /ANhu3kL7wB5QeDyOkXjyM24xFRnPYqTXKIGFTJXjyvaYhHu9RadP2cLOJ2HMH7vUGKM
         swYSNiWJtb3Jq8AfaTJk8toACvM8JZP0IfXExGHLwy2XhPdasBdQ/TOCO7MimAVfm7MC
         56FZsbCaMOLt171v7FtFUZ7QLTgEUegUmokIsSKeWNyw3/1p5d0Vevzk5f7YodtCyn96
         91/WnkwF3QM//sMeLF9JOyCgE9m6r5uz6PqAIUoevZxrRd841NtrVcLv5rJBOWy/+qdC
         HOzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjuO5hLxxn9sbE7piwghSBhfut06k4iQlfmsNmWz1vO0fQ6o1hKNuNvaBGUI2kUXH/L7YaeL31MN9+Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFM3Iz3S1e01kDTYdkeVn66XRjkenXs1EF9oZkRQerzzobTLtS
	iHUoebrz+8UH/EABGm8nK24M8wtYNWI7MQlZATbj7aFB0Il64TNVz1cIKk3w3oJ41PfIQfp7bzy
	DIJucDB8HFKLF5t3uJTJqG5jl2JduVLKCFkisQgw9Zg==
X-Gm-Gg: ASbGncvtleAKb6f3bUirWjl/p9UnamiYdm0Q+ivpVI9fQoWqVUQJWAAWPvTGVsnchPw
	xDGEaxG6ITWbXPD0l/blhO7Lz2DL3lNzo+OEkWXnKtRYWBjvpj73lW57sX6T5aj8fVfJ77aS0Od
	4r3dBS+hgGJoYUZnCOg7OETRhrRaea1vDyo6sXqq4j0WPiRSCNRIpOBhLzRG4VTq5sYDKqECSgL
	lbE5BX3
X-Google-Smtp-Source: AGHT+IH6sSUh2jwMrj6GuWBxvwwTPiTBYkovYilK1h5/YeKQYLbFNsHzLiFIEtHdGgUpX3elX/k9WeCcNC+wsnPHQ84=
X-Received: by 2002:a05:6e02:1885:b0:3e6:6a43:1890 with SMTP id
 e9e14a558f8ab-3e91fc26d9amr43027185ab.4.1755861633631; Fri, 22 Aug 2025
 04:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1754646071.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:50:21 +0530
X-Gm-Features: Ac12FXybuZh7H_EDZYZxjvBDpOJ1Lg5p3N7w9IhOsJAO1wqpnDrt-kCUdBS50To
Message-ID: <CAAhSdy1n+R5q3F4Fw4npz3gOGEWueYd0tDuPyzjE1stPATMdfQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] RISC-V: KVM: Allow zicbop/bfloat16 exts for guests
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_042034_688236_F972D167 
X-CRM114-Status: GOOD (  12.40  )
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

T24gRnJpLCBBdWcgOCwgMjAyNSBhdCA0OjAw4oCvUE0gPHpob3VxdWFuQGlzY2FzLmFjLmNuPiB3
cm90ZToKPgo+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4KPiBBZHZl
cnRpc2UgemljYm9wL2JmbG9hdDE2IGV4dGVuc2lvbnMgdG8gS1ZNIGd1ZXN0IHdoZW4gdW5kZXJs
eWluZwo+IGhvc3Qgc3VwcG9ydHMgaXQsIGFuZCBhZGQgdGhlbSB0byBnZXQtcmVnLWxpc3QgdGVz
dC4KPgo+IC0tLQo+IENoYW5nZSBzaW5jZSB2MToKPiAtIHVwZGF0ZSB6aWNib20vemljYm96L3pp
Y2JvcCBibG9jayBzaXplIHJlZ2lzdGVycyB0byBkZXBlbmQgb24gdGhlIGhvc3QgaXNhLgo+IC0g
dXBkYXRlIHRoZSByZWcgbGlzdCBmaWx0ZXJpbmcgaW4gY29weV9jb25maWdfcmVnX2luZGljZXMo
KSB0byB1c2UgdGhlIGhvc3QgaXNhLgo+IC0gYWRkIHJlZyBsaXN0IGZpbHRlcmluZyBmb3Igemlj
Ym9wLgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc1MDE2NDQxNC5n
aXQuemhvdXF1YW5AaXNjYXMuYWMuY24vCj4KPiBRdWFuIFpob3UgKDYpOgo+ICAgUklTQy1WOiBL
Vk06IENoYW5nZSB6aWNib20vemljYm96IGJsb2NrIHNpemUgdG8gZGVwZW5kIG9uIHRoZSBob3N0
IGlzYQo+ICAgUklTQy1WOiBLVk06IFByb3ZpZGUgVUFQSSBmb3IgWmljYm9wIGJsb2NrIHNpemUK
PiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaaWNib3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAg
UklTQy1WOiBLVk06IEFsbG93IGJmbG9hdDE2IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFppY2JvcCBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0
IHRlc3QKPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGJmbG9hdDE2IGV4dGVuc2lvbiB0
byBnZXQtcmVnLWxpc3QgdGVzdAoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE4CgpU
aGFua3MsCkFudXAKCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAg
ICAgICAgIHwgIDUgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAg
ICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKy0tLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgMjUgKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
