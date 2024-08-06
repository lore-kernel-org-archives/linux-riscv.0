Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEC7C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ggFp3WN/h82BVDkN1VWQfOB714P6Ir8LaEwKeRwXIs=; b=vG3Qnbi7dM7zaN
	trAZtJTP++bm6VGpi8RAE9qufQT8LlIeRpXR2EmUjxcUPTTru5xDL+cgThrvRs9nSaZlYEXE92uPh
	XtFGx0CanhXHJn112USd0WXvW2+1ahTHpnCPS9+4b0wf/L+HIUY4PtMinvJiOUtkA779GBY3PF77g
	HeIAzmrxAia6w/zhCst2c/d2TgeSMfKenHSk4/mAk47DevhqllCM1naTgQ1AKpTzKcJt4pEcCN/Cb
	0vsY1yKGFVYI8N9FgmkHRzsFm6eea6BZZH9AygB7RfDstjVaYJBmyGQAvddV/FIuMjnE2aUsclmaA
	LSpC/7Jdwh7iH0r7H1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbAf4-00000000LXN-4Btm;
	Tue, 06 Aug 2024 03:14:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbAf0-00000000LTF-2CmC
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 03:14:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4281faefea9so555835e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 20:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1722914092; x=1723518892; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnA0PeUHKuNbqiKyg0B4D4n1V2sk6W3EUvTsNvf0wVY=;
        b=eTSb9ncOVXhY6//Sv7rnPpuGb+XgBw2BMccfCu+sjayahStDh6HIfS7Z7A7jN6tpSC
         G9V6ghi4lHAmPF9A1Mn520Oo41IKzypxgvLu6/IlR40bK2lIksGKn82C22y7AOxkdPMR
         xaUltxfFw11l1EwABc6aJmzAoV8hPBIW1amPopWGdGg6rtxiES8oYHFlO2zi9zI/QfH+
         ymQTVpEZyvQJBl9NT7bDWN744auPSV56alltZZrOtsy2LY4RJWUj8aHpC8MjCqVNbM3Q
         ADZo/3aSZqaA//kXfCPWUwAGZFroqio50iIMWHchX678YBGtcGdf05/cKhx3iw9DACi+
         RFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722914092; x=1723518892;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnA0PeUHKuNbqiKyg0B4D4n1V2sk6W3EUvTsNvf0wVY=;
        b=eQfAkS0k80zqqEEb0WZy/jxmvVKIRJy2ABL+SKEUj8TVvqsFh3ok/+FB55SGXlA8xt
         xJQePz9HU74qBd8t7GJ3tv5Y9hq+f8ztLQL/KY0yRA1zItt5j3WrF5eYHYvPyD0Eu+7L
         hvZ9Kr5yGlYIZ5qWq8Nwoq6IXU60bUUSMYa4ZLmI7g4I/FK0e/UgLO/NYgSw6latSfu2
         tUd4LHPQOk1aTPXHK+X/Ym6FdHUYkQfPx3Y+ATd7e3Wc4OKV1IdGpfwUIgKPceblr8Or
         UrRXQPLjuw/f1r4aPQsqHm2BrAKN6fyQdnnJI6gLZtDOxI6c2TllI91fMe7WhJ3Mkf9x
         35lA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/ohGgeqx92se8ev1sImduJGnWiy+TzwXMiquac0vgS7BEU+QuC9NqCocr4W48TQiprKupVlGSJzWXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6wkAjvbw5gcSm/NSxo27S80ZGRAGitW6+Q6xYnScrnmfuwur1
	tGIRAUL6BO9VxeY/FnaUCK/h9o63X941qEZbv09t9RPzGgQmHTF8jhsg5PlV3So=
X-Google-Smtp-Source: AGHT+IGoc6NJrzp0HaNuMdYWDlqDKUAt+5MvncZka3icw6yUOJNEnVFMF+vsFEP8NZyUYmLP7Hvhfg==
X-Received: by 2002:a05:600c:19c9:b0:428:f41:d467 with SMTP id 5b1f17b1804b1-428e6b014c5mr96923965e9.10.1722914091868;
        Mon, 05 Aug 2024 20:14:51 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e08012d7sm190760575e9.22.2024.08.05.20.14.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2024 20:14:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CABvJ_xhMAU+Ft-Ut2hMapO9dCSkz4M2PqxvdCrJS6eaSz02hLQ@mail.gmail.com>
Date: Tue, 6 Aug 2024 04:14:40 +0100
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <804B47DC-1A68-4219-8411-B3F7AF1B2D97@jrtc27.com>
References: <20240802075741.316968-1-vincent.chen@sifive.com>
 <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
 <CABvJ_xgcbyQKa1+U1MC7cLEB-SUzzNaWqKdXFp+13mni0YSvNw@mail.gmail.com>
 <87sevj5r45.ffs@tglx>
 <CABvJ_xhMAU+Ft-Ut2hMapO9dCSkz4M2PqxvdCrJS6eaSz02hLQ@mail.gmail.com>
To: Vincent Chen <vincent.chen@sifive.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_201454_651992_572F8CCC 
X-CRM114-Status: GOOD (  15.92  )
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

T24gNiBBdWcgMjAyNCwgYXQgMDI6NTYsIFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2
ZS5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgQXVnIDUsIDIwMjQgYXQgNDowOOKAr1BNIFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPj4gCj4+IE9uIE1vbiwgQXVn
IDA1IDIwMjQgYXQgMTA6NDMsIFZpbmNlbnQgQ2hlbiB3cm90ZToKPj4+IE9uIEZyaSwgQXVnIDIs
IDIwMjQgYXQgNzowM+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3Rl
Ogo+Pj4+IFNlY29uZGx5LCBjaGFuZ2luZyBjb21waWxhdGlvbiBvcmRlciBpbiBNYWtlZmlsZSB0
byBpbmZsdWVuY2UKPj4+PiB0aGUgcHJvYmUgb3JkZXIgd2lsbCBub3QgaGVscCBpbiBhbnkgd2F5
Lgo+Pj4+IAo+Pj4gSSB3YXMgY29uZnVzZWQgaGVyZS4gSWYgcG9zc2libGUsIGhvcGUgeW91IGNh
biBoZWxwIG1lIGNsYXJpZnkgaXQuCj4+PiBUaGUgZm9sbG93aW5nIGlzIHRoZSBiYWNrdHJhY2Ug
b2YgcmVhbGx5X3BvcmJlKCkgZHVtcGVkIGJ5IEdEQi4KPj4+ICMwICAweGZmZmZmZmZmODA5MjMx
OGEgaW4gcmVhbGx5X3Byb2JlICgpCj4+PiAjMSAgMHhmZmZmZmZmZjgwOTIzNTE2IGluIF9fZHJp
dmVyX3Byb2JlX2RldmljZS5wYXJ0LjAgKCkKPj4+ICMyICAweGZmZmZmZmZmODA1N2M4NTYgaW4g
ZHJpdmVyX3Byb2JlX2RldmljZSAoKQo+Pj4gIzMgIDB4ZmZmZmZmZmY4MDU3YzliYSBpbiBfX2Ry
aXZlcl9hdHRhY2ggKCkKPj4+ICM0ICAweGZmZmZmZmZmODA1N2FhYTQgaW4gYnVzX2Zvcl9lYWNo
X2RldiAoKQo+Pj4gIzUgIDB4ZmZmZmZmZmY4MDU3YzNlYSBpbiBkcml2ZXJfYXR0YWNoICgpCj4+
PiAjNiAgMHhmZmZmZmZmZjgwNTdiYzRhIGluIGJ1c19hZGRfZHJpdmVyICgpCj4+PiAjNyAgMHhm
ZmZmZmZmZjgwNTdkNzVhIGluIGRyaXZlcl9yZWdpc3RlciAoKQo+Pj4gIzggIDB4ZmZmZmZmZmY4
MDU3ZTgzYyBpbiBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlciAoKQo+Pj4gIzkgIDB4ZmZmZmZm
ZmY4MGEyNDU1ZSBpbiBpbXNpY19wbGF0Zm9ybV9kcml2ZXJfaW5pdCAoKQo+Pj4gIzEwIDB4ZmZm
ZmZmZmY4MDAwMjEyYyBpbiBkb19vbmVfaW5pdGNhbGwgKCkKPj4+ICMxMSAweGZmZmZmZmZmODBh
MDExODggaW4ga2VybmVsX2luaXRfZnJlZWFibGUgKCkKPj4+ICMxMiAweGZmZmZmZmZmODA5Mjhk
ODAgaW4ga2VybmVsX2luaXQgKCkKPj4+IAo+Pj4gQWNjb3JkaW5nIHRvIHRoaXMgcmVzdWx0LCB0
aGUgc291cmNlIHRvIGNhbGwgcmVhbGx5X3Byb2JlIGlzCj4+PiBkb19vbmVfaW5pdGNhbGwoKSwg
cmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0IGlzIEFQTElDIG9yIElNU0lDLiBUaGUKPj4+IGRvX29u
ZV9pbml0Y2FsbCgpIGZ1bmN0aW9uIGZvbGxvd3MgdGhlIHBsYWNlZCBvcmRlciBvZiB0aGUKPj4+
IGluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucyBpbiB0aGUgX19pbml0Y2FsbDYgc2VjdGlvbiB0byBp
bnZva2UgdGhlbS4KPj4+IFRoZSBjb21waWxlIG9yZGVyIGRldGVybWluZXMgdGhlIG9yZGVyIG9m
IHRoZSBfX2luaXRjYWxsNiBzZWN0aW9uLgo+Pj4gVGhlcmVmb3JlLCBJIHRyeSB0byBhZGp1c3Qg
dGhlIGNvbXBpbGUgb3JkZXIgdG8gaW5mbHVlbmNlIHRoZSBwcm9iZQo+Pj4gb3JkZXIgYmV0d2Vl
biBJTVNJQyBhbmQgQVBMSUMuIERvIEkgbWlzdW5kZXJzdGFuZCBzb21ldGhpbmc/Cj4+IAo+PiBU
aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0aGlzIG9yZGVyIGlzIHJldGFpbmVkLiBUaGUgbGlu
a2VyIGNhbiBmcmVlbHkKPj4gcmVvcmcgdGhlIHNlY3Rpb24uIFRoYXQncyB3aHkgd2UgaGF2ZSBk
ZWZlcnJlZCBwcm9iaW5nLiBJdCdzIG5laXRoZXIgYQo+PiBidWcgbm9yIGEgcHJvYmxlbSwgc28g
d2hhdCBhcmUgeW91IHRyeWluZyB0byBzb2x2ZT8KPj4gCj4gCj4gSGkgVGhvbWFzLAo+IEkgdW5k
ZXJzdGFuZCBub3cuIEkgZGlkbid0IHJlYWxpemUgdGhhdCB0aGUgbGlua2VyIGNvdWxkIGZyZWVs
eQo+IHJlb3JnYW5pemUgdGhpcyBzZWN0aW9uLiBUaGlzIHBhdGNoIHdvbuKAmXQgYWN0dWFsbHkg
YWRqdXN0IHRoZSBwcm9iZQo+IG9yZGVyLiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgZXhw
bGFuYXRpb24KCkFsc28gRllJIHlvdXIgcGF0Y2ggc3ViamVjdCBpcyBiYWNrd2FyZHMsIHdoaWNo
IGluaXRpYWxseSBjb25mdXNlZCBtZS4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
