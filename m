Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88D5EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJbj/d+dwj8lVKq8oDmDvtPSbcuDOYgUEmlFBBcsEZs=; b=z/eA51KRUF/M8a
	SvwnoFZcjRI9Gz3kdArsFqnhUPbJ0SMQqbkzja1T44oViA5dVSZeM7noMiHflNUMg0jQ1VvUgQmeN
	MQboRc01B5baHxiPINFGV/Fbbqn6zYvoF7mpJKIu+jHfVpoHMiyhMdcJgE8quj44Mue9BUF49RHZN
	dP+B8t0dj44ES0knYZTu2Mx+fn/20GMMgmAx2i7lPzATJ2f+j/OJTo7w9fUIC6S95PzDMqL8D0OEI
	TAGLIKJGCmp2W/WJ8tKvtf2yOroriHKSpb2bT5/5ernURi6njJapFzRXiMCunJOx3UcrtVkNdW1Wo
	egBEi16Kbq4ihsvlO7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDL9U-007TfX-1v;
	Sun, 25 Jun 2023 08:31:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDL9P-007TeR-2q
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 08:31:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-311275efaf8so1876934f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687681873; x=1690273873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zulwu5Ka4QRyyzBozREdwsGz6HjqchCHL6fXDsTMKzw=;
        b=QW5XIerK545NXTIxba0OoBPzgB2WmwB3lmtN+sfYnZbAi6zuVXMKWInuvQHxyWz7QI
         t/OqZW1OUAl35aV46jxUn+XXiJI4YCGiUxbYgfJ9Xa4Ez8IjBy/jfYnJwgnlErT2naB0
         gstCq4b1ZsRR8FcSPLIo8c000Jq421mBnaR57plMQSwvmWVc8roc6FhahrYrlcu/7qTx
         pky8dv0IYewuY1a0wfds8jKHi6n7c4zdnCveH053/ycgQC1xCG8CuMXu5JavzBkxHOCD
         BNYlGEX2J+eIB8/rt/gFIWXl2wxSU7US2rAtLEr/ipRbCVdndOU6qQEKMzxcPs5lFiG3
         5grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687681873; x=1690273873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zulwu5Ka4QRyyzBozREdwsGz6HjqchCHL6fXDsTMKzw=;
        b=l2LsWY45gMu/Im2WjGyk41kWV/wQDrLdQ7bsFXkIr7bJfpZhYwuKX2mNer11Y3IRRI
         2in02qz51qP/HJ5R3LudO5/uFdTET03KUz3HbCbQmUzYdemRCepCMZy83w3xZpIkCTwC
         e995GPbxRmiCMCQytCRCSqPBpabhbkKFTTqXtE52xSBjNHoCI71EI7eQzbAkIfzIYDqI
         G18gdK2XYE/OidCKokoK2Zc31jtSAQ4Mm2eTEaxz1fpjG995S3dy4o5SevwZ3UNHZ8+F
         abJyGxb6P52AffmR1X+vEd0YkEcWb42Sm4kTl3TsGI4nyDJxHon08X7cA5keuyxzSWA6
         9ZZQ==
X-Gm-Message-State: AC+VfDzVbQI68/xWk3raSkLEjaOPe7euaRkIN6qRiLpDnPlBOxQP97Hu
	EhDPawIfQ9PjutgaUgzQ3WiAXUe0K3bdERR7Katf5g==
X-Google-Smtp-Source: ACHHUZ61tzMCEGJ8vHNHAQaPB0C/RSl9ncoLF+n4T3q6vhJx+GdBPTuFi+c/felvlRNRSeDkoMjuyt1j/ueQykBMKxE=
X-Received: by 2002:a5d:4c8a:0:b0:313:e55f:b78c with SMTP id
 z10-20020a5d4c8a000000b00313e55fb78cmr1652709wrs.21.1687681873230; Sun, 25
 Jun 2023 01:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com> <87o7l6mgxg.fsf@meer.lwn.net>
In-Reply-To: <87o7l6mgxg.fsf@meer.lwn.net>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Sun, 25 Jun 2023 10:31:02 +0200
Message-ID: <CAHVXubhk2xf59XbNiRYKdr4J1yadpeX0KMgW1cFMR4GRN97MYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
To: Jonathan Corbet <corbet@lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_013116_147192_5433D6DC 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Song Shuai <songshuaishuai@tinylab.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSm9uYXRoYW4sCgpPbiBGcmksIEp1biAyMywgMjAyMyBhdCAzOjQ04oCvUE0gSm9uYXRoYW4g
Q29yYmV0IDxjb3JiZXRAbHduLm5ldD4gd3JvdGU6Cj4KPiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyaXRlczoKPgo+ID4gVGhpcyBkb2N1bWVudCBkZXNjcmliZXMg
dGhlIGNvbnN0cmFpbnRzIGFuZCByZXF1aXJlbWVudHMgb2YgdGhlIGVhcmx5Cj4gPiBib290IHBy
b2Nlc3MgaW4gYSBSSVNDLVYga2VybmVsLgo+Cj4gU29tZSBxdWljayBjb21tZW50cy4uLgo+Cj4g
PiArVGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0czoKPiA+ICsKPiA+ICsgICogYCRhMGAgdG8gY29u
dGFpbiB0aGUgaGFydGlkIG9mIHRoZSBjdXJyZW50IGNvcmUuCj4gPiArICAqIGAkYTFgIHRvIGNv
bnRhaW4gdGhlIGFkZHJlc3Mgb2YgdGhlIGRldmljZXRyZWUgaW4gbWVtb3J5Lgo+Cj4gU2luZ2xl
IGBiYWNrdGlja2AgcXVvdGVzIGFyZSBwcm9iYWJseSBub3QgZG9pbmcgd2hhdCB5b3Ugd2FudC4g
IElmCj4geW91J3JlIGxvb2tpbmcgZm9yIGl0IHRvIHJlbmRlciBpbiBhIG1vbm9zcGFjZSBmb250
LCB1c2UgYGBkb3VibGVgYAo+IHF1b3RlcyBpbnN0ZWFkLiAgQnV0IEknZCBhbHNvIGVuY291cmFn
ZSB5b3UgdG8ga2VlcCB0aGF0IHRvIGEgbWluaW11bSB0bwo+IGF2b2lkIG92ZXJseSBjbHV0dGVy
aW5nIHRoZSBwbGFpbi10ZXh0IGRvY3VtZW50LgoKSW5kZWVkLCB0aGUgcmVuZGVyaW5nIGlzIGJl
dHRlciB3aXRoIGRvdWJsZSBxdW90ZXMsIHRoYW5rcy4KCj4KPiBbLi4uXQo+Cj4gPiArVmlydHVh
bCBtYXBwaW5nIGluc3RhbGxhdGlvbgo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiA+ICsKPiA+ICtUaGUgaW5zdGFsbGF0aW9uIG9mIHRoZSB2aXJ0dWFsIG1hcHBpbmcgaXMgZG9u
ZSBpbiAyIHN0ZXBzIGluIHRoZSBSSVNDLVYga2VybmVsOgo+ID4gKwo+ID4gKzEuIDpjOmZ1bmM6
YHNldHVwX3ZtYCBpbnN0YWxscyBhIHRlbXBvcmFyeSBrZXJuZWwgbWFwcGluZyBpbgo+Cj4gUGxl
YXNlIGRvbid0IHVzZSA6YzpmdW5jOi4gIElmIHlvdSBqdXN0IHdyaXRlIHNldHVwX3ZtKCksIGFs
bCB0aGUgcmlnaHQKPiBtYWdpYyB3aWxsIGhhcHBlbi4KClRoZSBtYWdpYyBpbmRlZWQgaGFwcGVu
cyB3aXRoIHZpcnRfdG9fcGh5cygpL3BoeXNfdG9fdmlydCgpLCBidXQgbm90CndpdGggc2V0dXBf
dm0oKTogaXMgdGhlcmUgc29tZXRoaW5nIHdlIHNob3VsZCBkbyB3aGVuIGRlY2xhcmluZyB0aG9z
ZQpmdW5jdGlvbnM/Cgo+Cj4gPiArICAgOmM6dmFyOmBlYXJseV9wZ19kaXJgIHdoaWNoIGFsbG93
cyBkaXNjb3Zlcnkgb2YgdGhlIHN5c3RlbSBtZW1vcnkuIE9ubHkgdGhlCj4KPiBXZSBhbHNvIHJl
YWxseSBqdXN0IGRvbid0IHVzZSA6Yzp2YXI6IGF0IGFsbC4gIEtlcm5lbGRvYyBkb2Vzbid0Cj4g
Y3VycmVudGx5IGtub3cgYWJvdXQgZ2xvYmFsIHZhcmlhYmxlcy4uLnBlcmhhcHMgaXQgc2hvdWxk
IGJ1dCB0aGF0J3Mgbm90Cj4gdGhlIHdheSBvZiB0aGluZ3Mgbm93LgoKT2ssIG5vdGVkLCBJIHJl
bW92ZSB0aG9zZSAiYzpYWFgiLgoKVGhhbmtzCgo+Cj4gVGhhbmtzLAo+Cj4gam9uCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
