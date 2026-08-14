Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F26C5CFDB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpMZsoZjQpCsrElfpia7PquaAkD3Aeq32LAg0FRfCcc=; b=EVH9AUBhRLfniD
	fUo6FvL2xYExMJ3bfJQ3FHpukD+6KklGFMg/lUu+m4ghfabwy3rlO0jTcsWlB43rbMlpMNydsZDke
	T4VI9XMIcVemZ1eQh/pSs3ujs2lciRQSncs84riy8KgufZP1LvG69L2tR2OKDzoYLsWIIgW/gQYYa
	QCgmLJNDlOs6R8CPDA94HJYEuNw7P7bQxhklR+dxqZxaN60JhnoEWOVIRWv+1cSH49pm5Exq8EOoV
	qZ0+XPvuCEJz9oAJa1zWmRhWnVPbt5wnwOJvlgFKFbADy2RTKXSnj83s7x8YJ8YfOPZCHGnDzIKq4
	IYWSlgPJXygEsT88WP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurpC-00000002hw3-2Pca;
	Fri, 14 Aug 2026 13:19:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurpA-00000002hvh-2ShN
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 13:19:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47db714766aso1271446f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 06:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786713591; cv=none;
        d=google.com; s=arc-20260327;
        b=brEibfy8I+hySimCVtJ5PaABfvPaR60OBdMVnigFv17vlI7fwTu9bjcyXxEptlUBwe
         EzkG6zoGwUg1Eg80FXY4vlMCsdV8c+GZ1qn0WL6p6nGT6nSGo+HpLqMyLG1kJd8r4uqA
         GW1RVOJlkl75GA2p9FSPCXt8jqwXehAfI8NjZSRfdoXu9duHzTn1Ot14bUcEGiy4q/vj
         2Z84w2hpIBSNIQrkOPa2+0FnGl1GwQUcFdEeprxzo5WTmjH0/GhiiI5YhvGuu0qZn0hD
         Q//VsmWW8KTcHGr0IswEvU98LlPLIlCZ/V8hYkNwjv3oxBtt7MsPy7F0xhuTKbcsWlYN
         Mkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cFFORb+fdn/egBqOSH1r4fo6sY/hus0yhO42qAXa+fA=;
        fh=JDfQp5/36q1LQkvvUNJEyVkFZUsgdrs4YSs+8iGpjzQ=;
        b=r5r2I12pGV70yBVyZcWLW4OmvL5IHDgwkcFdOjpMkUQUg1VBlmHszW6rDPpgV3W+o6
         v9LxZhTshUq4L9IZ2vSI+uHKf/NpRgbTrwxRQixU1B6Lh/LQzax1yCNzBr31XGCAutO4
         8BaYIMWEVHUB3iJ5ZnIuyAAmbaw7VqzLzt7YwU83H9zb51/5yw2CE7yKn5kon5FQ32hU
         x8RwHwm2EAyIe0kWuh5pWUYR+erep2ZIZIYVq1bNdxmPhk1eG6A1ts9AycMhEqRUWm2S
         E5xjssraXCFt5TSSyNl0SvBdQukmi/71TIZnHkfPLa0GWhmnmQ6iwuIdl/ooOxAY3SEn
         4WdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786713591; x=1787318391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFFORb+fdn/egBqOSH1r4fo6sY/hus0yhO42qAXa+fA=;
        b=cVtWEJOX2wjoXezbqdFBbBAe4pebQEhiV0MDTRioR2VjF6PqfUCgHi9T9HpbnEdIqg
         vYTEQKM5col+mEaM8b4/DuKP+SpA9b7di0ynWQat4y5L1d1EfRbximdzOEKXotGcIHxH
         wGJoEARol9jcTsJyjvxYJ24oFH0s+j2fm0gIAfSLzX3M7jNUEsyNLf2u6R7Zo6GNwhAc
         veu3lJtPsX9mF5V0LgaWinR5fu6YE3cTw7Q/I89l5Nma3gdAC8APXO0nJkghhJp25DPM
         ODHTHLrkyiQlgioVIIuZAD3Sa+u/uX0/uUFVXKhTbWaSfokl9KovhbNNt/+/6z8rziHW
         /PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713591; x=1787318391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFFORb+fdn/egBqOSH1r4fo6sY/hus0yhO42qAXa+fA=;
        b=alCK0sKilEIE8pKvOMj4Wg19GH3uifTvidMoh/c8PhMa+IxtHRtqqwI4OcQKuUQCBN
         s5hebStZAhgpDxZ7GPGkWVNFHjczbXHQwroMXTJrgN5YbFDD2UwaWxzNVMPcdjbzqpyl
         ZF6g3h1/sLm7in9ATQX3eop+YmbFANZv8xCgtpmsyLZFOixjKyOSMypnIZrCXvKGQdlt
         xM+HlromAbmgyvgfdoY+2zxBPJgetYm5s6SQnOnZ4jAW3rnDGo62r1m/kZfbSrJhv29/
         lmjPbvGnMVjM5K7qcSLQpJnc5sdRYWIZ8p22tbuSRKyC3Y1O9oHH55Y2IBPFZR8FnoQB
         LE/g==
X-Forwarded-Encrypted: i=1; AHgh+RrmOdMn1/9H3P0PMRcnm66TZfr7eWj3unQWZOf+MEawU8N9bHpQbnfitSN9wmTGvB+8HDj5qm1hDbbGRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy1qp4aPqvcDXU4U60zQ/kPsLw+Wdv+C1hfMJsK9nZyX8bynHN
	JVW/k2l5SQeEejtZkAJcmUBQYe9D7lskJszyifXV3G7WZShCheNHwXZHRVDjHBu3Wq3GoNFXq2y
	9Eyp0e6l9PyXM0MGv3TYOQ3feWlMsOsQ=
X-Gm-Gg: AR+sD13b5hYJYZXD/bxhxXtzHFXvb0L4xUHniZw6ndk3GNRW6nTODA+pmsPUrw7TKNK
	H2XMVKi/3NguvYKbhMUJcum3/5bM4NnwyG1JwXn5QQaFTTsVsUWCa+M8xL8EFv4LC+RifAhuDlc
	4GfAp1yvPHFPLHpaCUFV7+VksvZiZ/jqNz3n1bwE/1lRuF4L4DmFz9Om4huUgxFWt/QVZNAuWDM
	DE/U+1zVCbsnPGyqoOWvScLKCX2nflen2uA8+6J+Sj661ob0wz26lkb4UPFPVNauALmNKtGHqSV
	kz+aq0e6GF9J8U9cMC2ynWRCrrcKqu+Bmf1aPA/m97iHB7rUlMavg+ssB7Mc9mPl72pzkY0qQzS
	QTFRlAbnOkTlG/LuGpNlzPD3/SZ7xii3k4q+Vm2e0+9ZSx3EA0cwSw+LW4bkRo+Y=
X-Received: by 2002:a05:6000:184c:b0:481:314b:b041 with SMTP id
 ffacd0b85a97d-4816075f4f5mr8904884f8f.7.1786713590513; Fri, 14 Aug 2026
 06:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260814082742.148403-1-xiaofengmian@163.com> <20260814082742.148403-2-xiaofengmian@163.com>
In-Reply-To: <20260814082742.148403-2-xiaofengmian@163.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Aug 2026 14:19:23 +0100
X-Gm-Features: AcwNN1VfuW2ZxiW0sslPE9plFWXpQcsLKzplrhX6jKngypEds1famxZ9v3KPzfw
Message-ID: <CA+V-a8snwsAHGF6RSmS+uwurcW3oOsW=-=NXwioB9x8A4e-RLQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	Klara Modin <klara@kasm.eu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_061952_663749_A0262CAB 
X-CRM114-Status: GOOD (  15.99  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgOToyOeKAr0FNIFhpYW9mZW5nIFl1YW4gPHhpYW9mZW5n
bWlhbkAxNjMuY29tPiB3cm90ZToKPgo+IFdoZW4gQ09ORklHX1NUUklDVF9NT0RVTEVfUldYIGlz
IG5vdCBzZXQsIGV4ZWNtZW0gY2Fubm90IGNyZWF0ZQo+IHRlbXBvcmFyeSB3cml0YWJsZSBtYXBw
aW5ncyBmb3IgcmVhZC1vbmx5IGV4ZWN1dGFibGUgcGFnZXMuIEluIHRoaXMKPiBjYXNlLCB0aGUg
ZXhlY21lbSByYW5nZXMgbXVzdCBhbHJlYWR5IGhhdmUgd3JpdGFibGUgcGVybWlzc2lvbnMuCj4K
PiBDdXJyZW50bHkgRVhFQ01FTV9LUFJPQkVTIHVuY29uZGl0aW9uYWxseSB1c2VzIFBBR0VfS0VS
TkVMX1JFQURfRVhFQywKPiB3aGljaCBjYXVzZXMga3Byb2JlIGluc3RydWN0aW9uIHNsb3Qgd3Jp
dGVzIHRvIHRyaWdnZXIgcGFnZSBmYXVsdHMKPiBvbiBzeXN0ZW1zIHdoZXJlIENPTkZJR19TVFJJ
Q1RfTU9EVUxFX1JXWCBpcyBub3QgZW5hYmxlZC4KPgo+IEZpeCB0aGlzIGJ5IHVzaW5nIFBBR0Vf
S0VSTkVMX0VYRUMgd2hlbiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1gKPiBpcyBub3QgYXZhaWxh
YmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhb2ZlbmcgWXVhbiA8eGlhb2ZlbmdtaWFuQDE2My5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgpUZXN0ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywK
UHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jCj4gaW5kZXggODViZGNjZTYzYS4uYjA4NGE3MmU1ZCAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAg
LTE0NjIsNyArMTQ2Miw5IEBAIHN0cnVjdCBleGVjbWVtX2luZm8gX19pbml0ICpleGVjbWVtX2Fy
Y2hfc2V0dXAodm9pZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBbRVhFQ01FTV9LUFJPQkVT
XSA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5zdGFydCAgPSBWTUFMTE9D
X1NUQVJULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLmVuZCAgICA9IFZNQUxM
T0NfRU5ELAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLnBncHJvdCA9IFBBR0Vf
S0VSTkVMX1JFQURfRVhFQywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5wZ3By
b3QgPSBJU19FTkFCTEVEKENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCkgPwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfS0VSTkVMX1JFQURfRVhFQyA6Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9LRVJORUxfRVhF
QywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5hbGlnbm1lbnQgPSAxLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIH0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgW0VYRUNN
RU1fQlBGXSA9IHsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
