Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97156C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdV5zudzuKJQDphh5AR+OdHO0RklmelJpC3BFhJuNTo=; b=N6yCnaPGBq8eMq
	73Xor1uhfZETl+PHSnL0lAlr5/g0Fr6b1HZOaMVbM5ftgoHjPp1akOLYSXGMpYCv6mEhUpBHrey8V
	egvektBZjyETL5wfQiCmFT4RQF/44vOu07p0uM5d6n/VKiadQEO2UheQ2gw38abfl2UnjM/r0eKd8
	usa/lS/3HsoQTjkxgjMlSHlfq4CRhCh47MUNMHxFhTw7eiOeB7dPE18My2tqgGoF7iRLfrJzrAYeF
	0QKlfqeflJ1PCMYh193w/QqZxGwGR6DFKrnG5lAU3NkZlXiw8uyTSVkhTbYeC/O79U/HIHCl8oXpB
	XcPN3L498DGHFimEoesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxpu-00AGz4-0p;
	Wed, 03 Jan 2024 09:46:54 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxpq-00AGxj-1o;
	Wed, 03 Jan 2024 09:46:52 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbdc7ff087fso6186548276.2;
        Wed, 03 Jan 2024 01:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704275208; x=1704880008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhhQFZaZR4+J27tLwPbBpD9wwAmji8BYJHqOMirIeI=;
        b=WEDgFhFpQFiFAkAuLvhIDJlUDXVkf0THLmNP6cLFcunkPLNx4zgr7+SCCI1W6Nzthp
         F6mn5GRjCE1WhIc3oTs0NKNi3rrPrtBrPA049w40xn7BK46QqZ/IsddelduNmqqsarjH
         I/CZlP9NSvqTS5S+O13pBcPCbtktPhmkFXDU3YanH2o2rpqQzILIXVaDOr0xWGn2iXut
         zhGXs4zlkItSJF2ZnElmy7CwLZbHmV72prni43Rcauf9S66QNaceDie0jvCISsZU3kHI
         6/2p+Yc1M9ndj8oRf51LKBsrH527lDLCRyy0KgoW4lHgjZMxHdkr7d+oi0zOFRePcdQy
         9Cag==
X-Gm-Message-State: AOJu0Yzpp0Sde5be5iJ1IMgKtB8uEqLqaZIC0zZLKRKciE6Cnlk6FZo1
	tA3y5qrwKxunV0SF3bkFHBtRwlcxCZEJJA==
X-Google-Smtp-Source: AGHT+IGNEFVgcVJxzTaUXxL0lU/ZrASQZE03FC7E3cUA2ymTdRlaZVCA9ZDCyEDBp+RLsYN1FpANug==
X-Received: by 2002:a25:f802:0:b0:db7:dacf:6ff6 with SMTP id u2-20020a25f802000000b00db7dacf6ff6mr8861710ybd.126.1704275208426;
        Wed, 03 Jan 2024 01:46:48 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id d11-20020a25eb0b000000b00dbcbfccfcc5sm10506884ybs.5.2024.01.03.01.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 01:46:47 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5f3da7ba2bfso12035217b3.3;
        Wed, 03 Jan 2024 01:46:47 -0800 (PST)
X-Received: by 2002:a81:80c1:0:b0:5e8:6aba:9d18 with SMTP id
 q184-20020a8180c1000000b005e86aba9d18mr14346275ywf.35.1704275207623; Wed, 03
 Jan 2024 01:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20240103015240.1065284-1-pvorel@suse.cz>
In-Reply-To: <20240103015240.1065284-1-pvorel@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2024 10:46:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Message-ID: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christophe Lyon <christophe.lyon@linaro.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_014650_623012_6175B4AF 
X-CRM114-Status: GOOD (  19.72  )
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

SGkgUGV0ciwKCkNDIG90aGVyIHVDbGludXggYXJjaCBsaXN0cwoKT24gV2VkLCBKYW4gMywgMjAy
NCBhdCAyOjUy4oCvQU0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgo+IFVDTElO
VVggaXMgYnJva2VuIGluIExUUCBhbmQgbm9ib2R5IHJlYWxseSBjYXJlcy4gQWN0dWFsbHkgSSBk
YXJlIHRvCj4gc2F5IFVDTElOVVggaXMgZGVhZC4gVGhlcmVmb3JlIEkgcHJlcGFyZWQgcGF0Y2hz
ZXQgdG8gcmVtb3ZlIFVDTElOVVgKPiBmcm9tIExUUC4gV2UgaGF2ZSBiZWVuIGFjdGl2ZWx5IHJl
bW92aW5nIFVDTElOVVggZnJvbSBMVFAgZHVyaW5nIHJld3JpdGUKPiB0ZXN0cyB0byBuZXcgTFRQ
IEFQSS4gVGhpcyByZW1vdmVzIHRoZSByZXN0IGZyb20gdGhlIG9sZCB0ZXN0cyAod2hpY2gKPiB3
aWxsIGJlIHNvb25lciBvciBsYXRlciByZXdyaXR0ZW4gdG8gbmV3IEFQSSkuCj4KPiBCZWNhdXNl
IHRoZSBwYXRjaHNldCBpcyBxdWl0ZSBiaWcsIEkgZGlkIG5vdCB3YW50IHRvIHNlbmQgaXQgdG8g
bWFpbGluZwo+IGxpc3RzIChidXQgSSBjYW4gZG8gaXQgaWYgeW91IHdhbnQpLgo+Cj4gQ2FuIHlv
dSBwbGVhc2UgaGF2ZSBsb29rIGF0IG15IGZvcmsgb24gZ2l0bGFiLCBicmFuY2g6IHJlbW92ZS1V
Q0xJTlVYCj4gaHR0cHM6Ly9naXRsYWIuY29tL3BldmlrL2x0cC8tL2NvbW1pdHMvcmVtb3ZlLVVD
TElOVVg/cmVmX3R5cGU9aGVhZHMKPgo+IEJ1aWxkIHRlc3Q6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L3BldmlrL2x0cC9hY3Rpb25zL3J1bnMvNzM5MjQ3MDIxNQoKVGhhbmtzIGZvciB5b3VyIHNlcmll
cyEKCkkgc2VlIHlvdSBvbmx5IENDZWQgbGludXgtbTY4aywgYnV0IEFGQUlLLCB1Q2xpbnV4IGlz
IG5vdCByZXN0cmljdGVkCnRvIG02OGsvY29sZGZpcmUsIGJ1dCBhbHNvIGF2YWlsYWJsZSBvbiBh
cm0zMiwgcmlzY3YsIHNoLCBhbmQgeHRlbnNhLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
