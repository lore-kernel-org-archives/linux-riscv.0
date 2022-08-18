Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CCC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlFKitgjNmkp/PU/CbYwbnUwUIgL4+vzcFNpQbQ35vE=; b=fXDniZz5DSFdGh
	R+Xo6U9qnY8nS5EW02wm5ZawJM5xjLhhyJaH/6j2v9MErFoXE1CUgd8Vq5Fe/cI6TuKf7nI+PT13s
	tYnfqcW3Kd1O7MoDTjcznWARkXdrYlfcZsgwCOuyENYxmLdKmz11PeoDfVHj72sFBWiNmObok8f7R
	stZXTIxYYozkbx5k2/akMyLwYT30T++vU+M2e8dQiGFhci+HMABanziKGFBsTE+s5W/X+LrqN8vXf
	TFQa1BThzrqAX8gKbXYHzLhg6aEBYc40DVSGbe4/AAHzed8QCBMi2FnguvbSlelD+er/0as1QMXp8
	plaNLCV2Kf2QvjZ0h4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk0x-007riO-9Y; Thu, 18 Aug 2022 18:13:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk0v-007rdQ-3J
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 18:13:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso2989478wma.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=0q/rN1UhVKg8xFbv4kMLcaGViruZnB1ZSHrcYVNuXOU=;
        b=JhqR5mk1lpKnFsoZrf47GplJwweYIoEZzYyqIueaKe/hO8H8fp9Ri957zAAjuabE3G
         EBIeMfdU+Tlq49GPYPaAOXLPn25ErAs9ksFZaIhzkaEV0TOvvtLYF2zY7LHZzGTxRIKK
         8rzOIpcg12bWe/Roppjl7MDBVmD9UZZK+47nejehhjNrVBqviTQOP63uilXG/5CyYk7A
         uH0qyehdOoHcZZiscoeV+uVUrYuz4ieQ2ECauzqWKM4UJH653ZqWnqkSP4KozGuA4rso
         gmOSQMQs6NiGiJW3cbRdbrtUYxnH1ZNGpq8jiVJoh5YdjdjIEJ1IfbYliQ5XDmvKEtro
         KNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=0q/rN1UhVKg8xFbv4kMLcaGViruZnB1ZSHrcYVNuXOU=;
        b=J25BPthUP8dfz/fkPFJBzXcLHlQsGbOkiQtlMiOL/utscYnIrO4+wRyirslZkZ35OU
         lT+CDyceAOaPKDLAdR5e12AV5wF5mogVtOEmByXoM9b+QLciyDtgfr/+qUYOfUJhw8Lc
         68G6kzoS60V0S2OyUZEfgCS+Y3f7X2G61Ug986LIg4QpmaGdL/Nb/VSB27JgzRPcJplL
         0QIS3qnzYTLblqJZqLfhFJPURpUT/bQiQCayAOBsEvHs7e28FcclUhS96WWrcb5STeKg
         xuKSEhVCfxNG09ioXBhJQRi6lSukKzBM68w+33EvqWF1XY6JEo0dKmPQ+P19HnbcnzdT
         ysXQ==
X-Gm-Message-State: ACgBeo3NlcY/j9PaPK/JJxQEx8aig12QGYShOlXDIIXmMUVho07fFVwd
	ZM72D/M8yownk28Bh6UkhV7/6qxGgsGL0Q==
X-Google-Smtp-Source: AA6agR4dcEcpFx0WRw056/5oTz+oWDfG/TtYZ22NwvJidNC85Iq9v72kqqfvzCLYYEuxtjW1EWWBOw==
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id l20-20020a05600c1d1400b003a5e8baf394mr2611733wms.137.1660846375296;
        Thu, 18 Aug 2022 11:12:55 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id bj5-20020a0560001e0500b002206203ed3dsm2300920wrb.29.2022.08.18.11.12.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Aug 2022 11:12:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: dma-mapping: Use conventional cache operations for
 dma_sync*()
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220818165105.99746-1-s.miroshnichenko@yadro.com>
Date: Thu, 18 Aug 2022 19:12:54 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Samuel Holland <samuel@sholland.org>,
 linux-riscv@lists.infradead.org,
 linux@yadro.com,
 Palmer Dabbelt <palmer@dabbelt.com>
Message-Id: <1B438F95-364E-4125-B2EE-D673E0B4BEB3@jrtc27.com>
References: <20220818165105.99746-1-s.miroshnichenko@yadro.com>
To: Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_111305_200374_31951CA0 
X-CRM114-Status: GOOD (  27.67  )
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

T24gMTggQXVnIDIwMjIsIGF0IDE3OjUxLCBTZXJnZWkgTWlyb3NobmljaGVua28gPHMubWlyb3No
bmljaGVua29AeWFkcm8uY29tPiB3cm90ZToKPiAKPiBTdXBwb3J0IG9mIGFyY2hfc3luY19kbWFf
Zm9yX3tkZXZpY2UsY3B1fSgpIGZvciBSSVNDLVYgd2FzIGFkZGVkIHJlY2VudGx5Lgo+IAo+IEN1
cnJlbnRseSwgZm9yX2NwdShGUk9NX0RFVklDRSkgdXNlcyB0aGUgZmx1c2ggKHdyaXRlYmFjayBw
bHVzIGludmFsaWRhdGUpCj4gY2FjaGUgb3BlcmF0aW9uLCB3aGljaCBjYW4gb3ZlcndyaXRlIHRo
ZSBkYXRhIChyZWNlaXZlZCBmcm9tIGEgZGV2aWNlIHZpYQo+IERNQSkgd2l0aCBkaXJ0eSBjYWNo
ZSBsaW5lcy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBpbnZhbCB0byBhdm9pZCBkYXRhCj4gY29ycnVw
dGlvbnMuCj4gCj4gVGhlIHNhbWUgZ29lcyBmb3IgZm9yX2NwdShCSURJUkVDVElPTkFMKSwgaXQg
d2FzIGFsc28gZmx1c2hpbmcgdGhlIGNhY2hlLAo+IGJ1dCBpdCBpcyBjYWxsZWQgYWZ0ZXIgdGhl
IGRldmljZSBoYWQgb3duZWQgdGhlIGJ1ZmZlci4gU28gaW4gb3JkZXIgdG8gbm90Cj4gbG9vc2Ug
dGhlIHJlY2VpdmVkIGRhdGEsIHN0aWNrIHRvIHRoZSBpbnZhbCBoZXJlIGFzIHdlbGwuCj4gCj4g
QXMgb2YgZm9yX2RldmljZShGUk9NX0RFVklDRSksIGFjY29yZGluZyB0byB0aGUgaW5zcGlyYXRp
b25hbCBkaXNjdXNzaW9uCj4gYWJvdXQgbWF0Y2hpbmcgdGhlIERNQSBBUEkgYW5kIGNhY2hlIG9w
ZXJhdGlvbnMgWzFdLCB0aGUgaW52YWwgb3IgYSBuby1vcAo+IHNob3VsZCBiZSBoZXJlLCBhbmQg
dGhpcyB3b3VsZCByZXNvbmF0ZSB3aXRoIG1vc3Qgb3RoZXIgYXJjaGVzLiBCdXQgaW4gYQo+IGxh
dGVyIGRpc2N1c3Npb24gWzJdIGl0IHdhcyBkZWNpZGVkIHRoYXQgdGhlIGNsZWFuICh3aGljaCBp
cyB1c2VkIG5vdykgaXMKPiBpbmRlZWQgcHJlZmVyYWJsZSBhbmQgc2FmZXIsIHRob3VnaCBzbG93
ZXIuIFRoZSBhcm02NCBoYXMgYmVlbiByZWNlbnRseQo+IGNoYW5nZWQgaW4gdGhlIHNhbWUgd2F5
IFszXS4KCkZsdXNoIGlzIGFsd2F5cyBhIHZhbGlkIHdheSB0byBpbXBsZW1lbnQgaW52YWxpZGF0
ZSwgYW5kIGlmIGl0IGRvZXMgbm90CndvcmsgdGhlbiB5b3UgaGF2ZSBidWdzIGVsc2V3aGVyZSwg
c2luY2UgdGhlIENQVSBpcyBmcmVlIHRvIHdyaXRlIG91dAp0aGUgZGlydHkgY2FjaGUgbGluZXMg
YXQgYW55IHBvaW50IGJlZm9yZSBhbiBpbnZhbGlkYXRlLiBTbyB3aGlsc3QgaXTigJlzCm1vcmUg
ZWZmaWNpZW50IHRvIHVzZSBpbnZhbGlkYXRlIGFuZCBoaW50IHRvIHRoZSBjb3JlIHRoYXQgaXQg
ZG9lcyBub3QKbmVlZCB0byBkbyBhbnkgd3JpdGluZywgaXQgaXMgbm8gbW9yZSBjb3JyZWN0LCBh
bmQgdGhpcyB0aGlzIHBhdGNoCmRlc2NyaXB0aW9uIGlzIG1pc2d1aWRlZC4gWW91IGV2ZW4gbWln
aHQgd2lzaCB0byB1c2UgdGhlIGZhY3QgdGhhdCBpdAppcyBjdXJyZW50bHkgYSBmbHVzaCBhcyBh
IGNvbnZlbmllbnQgc2FuaXRpc2VyIGZvciB3aGF0ZXZlciBpcwpjdXJyZW50bHkgdmlvbGF0aW5n
IHRoZSBub24tY29oZXJlbnQgRE1BIHJ1bGVzIGFuZCBmaXggdGhhdCBiZWZvcmUgaXTigJlzCnN3
aXRjaGVkIHRvIGludmFsaWRhdGUgYW5kIHBhcGVycyBvdmVyIHRoZSBpc3N1ZSAoYXQgbGVhc3Qg
aW4gd2hhdGV2ZXIKaW1wbGVtZW50YXRpb24geW914oCZcmUgcnVubmluZyBvbikuCgpKZXNzCgo+
IFsxXSBkbWFfc3luY18qX2Zvcl9jcHUgYW5kIGRpcmVjdGlvbj1UT19ERVZJQ0UKPiBMaW5rOiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC81LzE4Lzk3OQo+IAo+IFsyXSBDYWNoZSBtYWludGVu
YW5jZSBmb3Igbm9uLWNvaGVyZW50IERNQSBpbiBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UoKQo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYwNjE1MjE1MC5HQTMxNTY4
QHdpbGxpZS10aGUtdHJ1Y2svCj4gCj4gWzNdIGNvbW1pdCBjNTBmMTFjNjE5NmYgKCJhcm02NDog
bW06IERvbid0IGludmFsaWRhdGUgRlJPTV9ERVZJQ0UgYnVmZmVycyBhdCBzdGFydCBvZiBETUEg
dHJhbnNmZXIiKQo+IAo+IEZpeGVzOiAxNjMxYmExMjU5ZDYgKCJyaXNjdjogQWRkIHN1cHBvcnQg
Zm9yIG5vbi1jb2hlcmVudCBkZXZpY2VzIHVzaW5nIHppY2JvbSBleHRlbnNpb24iKQo+IFNpZ25l
ZC1vZmYtYnk6IFNlcmdlaSBNaXJvc2huaWNoZW5rbyA8cy5taXJvc2huaWNoZW5rb0B5YWRyby5j
b20+Cj4gLS0tCj4gYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyB8IDIgKy0KPiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5v
bmNvaGVyZW50LmMKPiBpbmRleCBjZDIyMjUzMDRjODIuLjJhOGY2MTI0MDIxZiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gKysrIGIvYXJjaC9yaXNjdi9t
bS9kbWEtbm9uY29oZXJlbnQuYwo+IEBAIC00NSw3ICs0NSw3IEBAIHZvaWQgYXJjaF9zeW5jX2Rt
YV9mb3JfY3B1KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKPiAJCWJyZWFrOwo+IAlj
YXNlIERNQV9GUk9NX0RFVklDRToKPiAJY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiAtCQlBTFRf
Q01PX09QKGZsdXNoLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiArCQlB
TFRfQ01PX09QKGludmFsLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiAJ
CWJyZWFrOwo+IAlkZWZhdWx0Ogo+IAkJYnJlYWs7Cj4gLS0gCj4gMi4zNy4yCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
