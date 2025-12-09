Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA60D1CDC6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 03:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahCFs9+jUHFf434pSX55brxrXl1G++BFQSMdV2JBKN0=; b=YdtaL233NVtM/8
	fOn8VHts7PY5Tj78AbeSY2fDY3Q6NLnQyuram1/hF5G+Vcvs9t+OXBV8L3crFO4aPIYbrabmpk4MO
	+2whuyS0puxfymbk1C7JwdqYTzbPeCRmq76wZHtcVix0+nJHexOYHk/AYnDwvNroM6+q9+EvxTZo9
	MCeZPt3pfjpGbUHGH/s2M72uGR8PPGaRS3Ct4c3p7eIpwBFTEsXUrvlzwyhm9TI5QNLzCd+/TA8to
	fhCivW8FYGJScPynW+gJA3nqu8hNciJyd4mYIl+jTVgYu1gzWL2gNFISTGScChfld59ZPcTWzVr1w
	frkOh5CRkyRwH2bsEPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSosF-0000000Dms7-3R3K;
	Tue, 09 Dec 2025 03:58:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSosD-0000000Dmrh-1nAG
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 03:58:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37ba781a6c3so40495201fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 19:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765252727; x=1765857527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68/wGPpw31Zsca7N/+VQlyekwf34nB7RqEj959Ic/fA=;
        b=TG9jfB1zDeN1aSH3HcQR2Ca4gUaqWiANyQ1Qul8iBt2ZiF7KoRjjowbK3LVs0nXYOH
         zVwaMVVQs6Z1jXy4Iwvc349GCXy2TP+ynSB2KVwMHV7jaIvOinDxcqadec953OLssaSi
         VNnoOuITfMW7+ap6u8z6ziTfGTKHjuh7O+BecMsxpYtB7kiODkcG6VxLUWciZ1AHw0ms
         uucNdH+uRWG1lHWjaedrnzwVi/DskBYD27w5+Qys4aATkohobF5iBmNpRbiMAIth4hxN
         fKOnOyVacoTBbhg29D5YM0+W1YL7rBd56OcTtRxahxFtZ5VNL8OQ9iW4SkxRFbxdZDTd
         pafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765252727; x=1765857527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68/wGPpw31Zsca7N/+VQlyekwf34nB7RqEj959Ic/fA=;
        b=ZRHvNQcmL8MSLxex6WREkqex9/9lx5/CDLgseRpGwx7LBd/ZRQMqqgZTLozAIy+3iv
         efD+obEYhidHtzsHG/9ih8p8dE1/yYeRPceUDYXZlb7C5PMHDcP1NbCddJYg2NTYiYUU
         Fiwlk/ZWM2FJTQZz+szXRW86tr6NMtczYH8tvBX1C1qgbqXwujekS2CymQfjxfSf0scW
         B+Vzzi7S3Q/rMSZZb8KWiLOjTN4XM7ut1VibVqRERK/6sdnEWGZoztjOMLn32+ANMlDa
         SRSq+9FXQw+Yk2WEOGyjKJOE8UIgC551EqAxaGecnaRtQ5NgnZM1BZiNYwj0ajxk9zWb
         jlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeill6XjfiPic2X+Seepmk0ADMICZ5U8obd3SwXgqXwZV6THVwO8fJqVN+9/KcO6CzlAguyWzGRDSedQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhDuKyPIfK7S6zsQ+/QLAG+wb5BkVjBTX7c7BXqrMMFBOfTJ80
	lqUhNfxlyWSZNmtSwY1DvBGVo9oB1uGvc7S9U/QWCEoNmF8pQ8EGqfD7eaTCA3mk9g4bNR7o+4t
	oIqwmn5D5gTI04yqCf8DexZf569MBsVEfc0JQO2i72Q==
X-Gm-Gg: ASbGncvzh2yGTtVxd6Eo/qvDEq9naYKNe9ih4YvhQY0ej3Ycuhab87xseS3zGiU5kiR
	i/IOiPQfvrEu40+bmYjqFvMSJYeY3knuDfx+DjB8zoMolF3umU4iHlrHnlCrWT3xnuIJR/LJjQ9
	NbTb+gHfk1aZM/0bD024dJEo5h9UgnJ0w5nZM03GZ2PGlzVWCxlbZU3dzy/MZ8jKVfX6c427Kle
	07KOmw8S2uywRdx2ZrLp0AFmSHs3r1+Hn+dybm2GmOPXVU0XTKhP8XNS/XA5pel/PqM6AC9P4FU
	+Yo+f/kduabeowaRqY7vwJrEIIXjXTKSU0bdxAvAaUvpoIATRaB0yNmiOE4=
X-Google-Smtp-Source: AGHT+IH53WqkegnmUuZtSz3OxfPTw0gXTVMOxw+PpQSsNiistyltCGiN5RmD6N+zp9c/bk3NrIul642oWgUASFoHLMY=
X-Received: by 2002:a2e:a9a9:0:b0:378:ea85:7f06 with SMTP id
 38308e7fff4ca-37ed83c443amr26245881fa.36.1765252727360; Mon, 08 Dec 2025
 19:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
 <20251202053119.GA1416@sol> <80cb6553-af8f-4fce-a010-dff3a33c3779@iscas.ac.cn>
 <20251202063103.GA100366@sol>
In-Reply-To: <20251202063103.GA100366@sol>
From: Jerry Shih <jerry.shih@sifive.com>
Date: Tue, 9 Dec 2025 11:58:35 +0800
X-Gm-Features: AQt7F2pLuo8DbBX8z9TNAwyIqxu_BbB3rPdB4AVoLwpPolWPdQVYum8-_cu6fbk
Message-ID: <CABO+C-DAuguO4svhi4o5ZgybizzgnADRbzJWZNBTb4-096c10g@mail.gmail.com>
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
To: Eric Biggers <ebiggers@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_195849_488232_7DBC5595 
X-CRM114-Status: GOOD (  18.75  )
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

T24gVHVlLCBEZWMgMiwgMjAyNSBhdCAyOjMy4oCvUE0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgRGVjIDAyLCAyMDI1IGF0IDAyOjI0OjQ2UE0g
KzA4MDAsIFZpdmlhbiBXYW5nIHdyb3RlOgo+ID4gT24gMTIvMi8yNSAxMzozMSwgRXJpYyBCaWdn
ZXJzIHdyb3RlOgo+ID4gPiBPbiBUdWUsIERlYyAwMiwgMjAyNSBhdCAwMToyNTowN1BNICswODAw
LCBWaXZpYW4gV2FuZyB3cm90ZToKPiA+ID4+IEluIGNoYWNoYV96dmtiLCBhdm9pZCB1c2luZyB0
aGUgczAgcmVnaXN0ZXIsIHdoaWNoIGlzIHRoZSBmcmFtZSBwb2ludGVyLAo+ID4gPj4gYnkgcmVh
bGxvY2F0aW5nIEtFWTAgdG8gdDUuIFRoaXMgbWFrZXMgc3RhY2sgdHJhY2VzIGF2YWlsYWJsZSBp
ZiBlLmcuIGEKPiA+ID4+IGNyYXNoIGhhcHBlbnMgaW4gY2hhY2hhX3p2a2IuCj4gPiA+Pgo+ID4g
Pj4gTm8gZnJhbWUgcG9pbnRlciBtYWludGVuZW5jZSBpcyBvdGhlcndpc2UgcmVxdWlyZWQgc2lu
Y2UgdGhpcyBpcyBhIGxlYWYKPiA+ID4+IGZ1bmN0aW9uLgo+ID4gPiBtYWludGVuZW5jZSA9PiBt
YWludGVuYW5jZQo+ID4gPgo+ID4gT3VjaC4uLiBJIHN3ZWFyIEkgc3BlY2lmaWNhbGx5IGNoZWNr
ZWQgdGhpcyBiZWZvcmUgc2VuZGluZywgYnV0Cj4gPiBhcHBhcmVudGx5IGRpZG4ndCBzZWUgdGhp
cy4gVGhhbmtzIGZvciB0aGUgY2F0Y2guCj4gPgo+ID4gPj4gIFNZTV9GVU5DX1NUQVJUKGNoYWNo
YV96dmtiKQo+ID4gPj4gICAgYWRkaSAgICAgICAgICAgIHNwLCBzcCwgLTk2Cj4gPiA+PiAtICBz
ZCAgICAgICAgICAgICAgczAsIDAoc3ApCj4gPiA+IEkga25vdyBpdCdzIGFubm95aW5nLCBidXQg
d291bGQgeW91IG1pbmQgYWxzbyBjaGFuZ2luZyB0aGUgOTYgdG8gODgsIGFuZAo+ID4gPiBkZWNy
ZWFzaW5nIGFsbCB0aGUgb2Zmc2V0cyBieSA4LCBzbyB0aGF0IHdlIGRvbid0IGxlYXZlIGEgaG9s
ZSBpbiB0aGUKPiA+ID4gc3RhY2sgd2hlcmUgczAgdXNlZCB0byBiZT8gIExpa2V3aXNlIGF0IHRo
ZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLgo+ID4KPiA+IE5vIGNhbiBkby4gU3RhY2sgYWxpZ25tZW50
IG9uIFJJU0MtViBpcyAxNiBieXRlcywgYW5kIDgwIHdvbid0IGZpdC4KPiA+Cj4KPiBIbW0sIGlu
dGVyZXN0aW5nLiAgSXQgc2hvdWxkbid0IGFjdHVhbGx5IG1hdHRlciwgc2luY2UgdGhpcyBkb2Vz
bid0IGNhbGwKPiBhbnkgb3RoZXIgZnVuY3Rpb24sIGJ1dCB3ZSBtaWdodCBhcyB3ZWxsIGxlYXZl
IGl0IGF0IDk2IHRoZW4uICBJIGRvbid0Cj4gdGhpbmsgdGhpcyB3YXMgY29uc2lkZXJlZCB3aGVu
IGFueSBvZiB0aGUgUklTQy1WIGNyeXB0byBjb2RlIHdhcwo+IHdyaXR0ZW4sIGJ1dCBmb3J0dW5h
dGVseSB0aGlzIGlzIHRoZSBvbmx5IG9uZSB0aGF0IHVzZXMgdGhlIHN0YWNrLgo+Cj4gQW55d2F5
LCBJIGd1ZXNzIEknbGwgYXBwbHkgdGhpcyBhcy1pcyB0aGVuLgo+Cj4gLSBFcmljCgpUaGUgMTYt
Ynl0ZSBzdGFjayBhbGlnbm1lbnQgaXMgaW4gUklTQy1WIGNhbGxpbmcgY29udmVudGlvbjoKaHR0
cHM6Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMjQvMTIvcmlzY3YtY2FsbGluZy5w
ZGYKSXQgc2F5czoKSW4gdGhlIHN0YW5kYXJkIFJJU0MtViBjYWxsaW5nIGNvbnZlbnRpb24sIHRo
ZSBzdGFjayBncm93cyBkb3dud2FyZAphbmQgdGhlIHN0YWNrIHBvaW50ZXIgaXMgYWx3YXlzIGtl
cHQgMTYtYnl0ZSBhbGlnbmVkLgoKLUplcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
