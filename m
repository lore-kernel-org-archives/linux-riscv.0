Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A28C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnRwhhKNKgmNIY6J8XQnntDpZPniHYKTJGuB7+XTq54=; b=gQ242gqZ+0WULV
	ZnkeFqzgqzECbdkJLFlPZ+v8gXTwBIMV6wNedXMylH3afG2298kHGtPhwYTcvWaiWw42ekA1AH4oP
	F+SeppqJBs1xqH3r7x70tnFADxoItHzdUIUqMVCng6l98WuV54cwEwAe4nEQLfP0RQoqDfJ68yH4r
	PNf8qDpVuTootm9ddCx/tspg/P75ExkymsE9dH+bgUDg/fmWZTFQD5eKFjCVxumLx3Om9mb7+5iEi
	twGww6HfVqL42RRaaO7xWlfU/v99waTyLfufOrqG8LRh8vmBsYAqHXjeh38xTCs4vaHfe9jEQ+vH/
	ueD6Xd8lK4nNS69pJTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyseI-005YBo-2P;
	Tue, 16 May 2023 11:15:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyseF-005Y9J-1H
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 11:15:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3078c092056so7499063f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684235706; x=1686827706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoCpJAH0z2qhvEAjZCzfNnUqzIB2wxfKon1CpWBbdJ8=;
        b=ZhiTrSKYN63kswWHE9vTaCw+2FGddfcIitp5mG09y6YcnOURGd46p46finPdFAbxaD
         CPRgkWT36+fctUgusDd6ehOwURMS/MWY5mjAnb5qlVR8DXfeGTvy2Gi7cgwXZfFh41Fq
         XlifmMkZFeEQ9Z3deQibKYuJz77TmZsRI26EHLlQ+qffr/eL2y8hZu7pTbg4+O4SifrB
         HBIgBEIm0uXVA5zK2IV648UW9V/Gz1M3z1xm3fCDHqiU3wGA6nysyCkpD21fIMoUIFwy
         Kl4x8xyTJW/8hgKwJwdQcO9b3qkZK8gmu6uuUta/+LukjpoqiqiYNw62gPB3cHYLvV49
         4ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684235706; x=1686827706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoCpJAH0z2qhvEAjZCzfNnUqzIB2wxfKon1CpWBbdJ8=;
        b=FOrNWYsai1UDV8vyZh/e6F7mVfdX8ud1wUnAGu18pcYSwTrxNTk7bDw+MbQ3FGuuRN
         JiNz+9/PjIl6aXSJi0eXfNbrluYyzDFBBmc9si0R76NZ5UzrDoESXyBII63qZruU19Dl
         3LxQkkbchLKEuuYV/YFo6hcjd9auwh5s82AAXlg5F4D9pwmTFUDFALj3/+Rq4a9diTnr
         ULSEDWbm+hBufJHxUZGuZTF883hSNwWwEDX24s/u/axRZrZzOiNfv+bXKiqIkbB9iBbb
         n0WBK9qkYAJZsK+KL3I2VD4aRYdX5LLDrDhdvpUNiFWOREEg3il1XpF7c5sGvf/2a0gh
         N7jg==
X-Gm-Message-State: AC+VfDxCKBubVyjZsNR9+U2MEdJbdNxHOsXzYEDGbEHnbnk8kQjMQvZY
	TjVdZ4HKPGWn5VmHG6T5RE2GTeTI/4/bxEjeBmARhw==
X-Google-Smtp-Source: ACHHUZ6ne7jHNpkNUh0GL9MfcoLs24RtQ6qb4SlVgWklr3B6Ku66xAju7AcVG8p69sMkLlvTIV+cM8UdV5SiDktvV8c=
X-Received: by 2002:a5d:4d92:0:b0:306:26d6:dd7a with SMTP id
 b18-20020a5d4d92000000b0030626d6dd7amr25995644wru.32.1684235705796; Tue, 16
 May 2023 04:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <5902235c8f5046be9cbd7411955ec43e@EXMBX066.cuchost.com>
In-Reply-To: <5902235c8f5046be9cbd7411955ec43e@EXMBX066.cuchost.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 16 May 2023 13:14:55 +0200
Message-ID: <CAHVXubg-v=Xe4LQ-bTbf3=FN4cpdBU+xrX7qm8GnUNrmvKDkSQ@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Song Shuai <suagrfillet@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, "anup@brainfault.org" <anup@brainfault.org>, 
	"palmer@rivosinc.com" <palmer@rivosinc.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Mason Huo <mason.huo@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_041519_439779_E5C4EC9E 
X-CRM114-Status: GOOD (  33.26  )
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

SGkgSmVlSGVuZywKCk9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDExOjU14oCvQU0gSmVlSGVuZyBT
aWEKPGplZWhlbmcuc2lhQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gSGkgU29uZywKPgo+
IFRoYW5rcyBmb3IgdGhlIGludmVzdGlnYXRpb24uIEluZGVlZCwgdGhlIGV4cG9zdXJlIG9mIHRo
ZSBQTVAgcmVzZXJ2ZWQgcmVnaW9uIHRvIHRoZSBrZXJuZWwgcGFnZSB0YWJsZSBpcyBjYXVzaW5n
IHRoZSBwcm9ibGVtLgo+IEhlcmUgaXMgdGhlIHNpbWlsYXIgcmVwb3J0OiBodHRwczovL2dyb3Vw
cy5nb29nbGUuY29tL3UvMC9hL2dyb3Vwcy5yaXNjdi5vcmcvZy9zdy1kZXYvYy9JVFh3YUtmQTZ6
OAoKSU1PLCB3ZSBzaG91bGQgZGlzY3VzcyB0aGUga2VybmVsIHJlbGF0ZWQgc3R1ZmYgb24gdGhl
IGxpbnV4IHJpc2N2IE1MLApJJ20gbm90IHN1YnNjcmliZWQgdG8gdGhlIGdyb3VwIGFib3ZlIGFu
ZCB5b3UgZGlkIG5vdCBhbnN3ZXIgbXkgbGFzdApkaXJlY3QgZW1haWxzIHJlZ2FyZGluZyB0aGlz
IHByb2JsZW0gZWl0aGVyLgoKVGhhbmtzLAoKQWxleAoKPgo+IFRoYW5rcwo+IFJlZ2FyZHMKPiBK
ZWUgSGVuZwo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogU29uZyBT
aHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4gU2VudDogVHVlc2RheSwgTWF5IDE2LCAy
MDIzIDU6MjQgUE0KPiA+IFRvOiBhbGV4Z2hpdGlAcml2b3NpbmMuY29tOyByb2JoQGtlcm5lbC5v
cmc7IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+OyBhbnVwQGJyYWluZmF1
bHQub3JnOwo+ID4gcGFsbWVyQHJpdm9zaW5jLmNvbTsgSmVlSGVuZyBTaWEgPGplZWhlbmcuc2lh
QHN0YXJmaXZldGVjaC5jb20+OyBMZXlmb29uIFRhbiA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNo
LmNvbT47IE1hc29uIEh1bwo+ID4gPG1hc29uLmh1b0BzdGFyZml2ZXRlY2guY29tPjsgUGF1bCBX
YWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPjsgQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT47IEd1bwo+ID4gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+
IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCj4gPiBTdWJqZWN0OiBCdWcgcmVwb3J0OiBrZXJuZWwgcGFuaWNlZCB3aGVuIHN5
c3RlbSBoaWJlcm5hdGVzCj4gPgo+ID4gRGVzY3JpcHRpb24gb2YgcHJvYmxlbToKPiA+Cj4gPiBU
aGUgbGF0ZXN0IGhpYmVybmF0aW9uIHN1cHBvcnRbMV0gb2YgUklTQy1WIExpbnV4IHByb2R1Y2Vk
IGEga2VybmVsIHBhbmljLgo+ID4gVGhlIGVudGlyZSBsb2cgaGFzIGJlZW4gcG9zdGVkIGF0IHRo
aXMgbGluazogaHR0cHM6Ly90ZXJtYmluLmNvbS9zcGhsIC4KPiA+Cj4gPiBIb3cgcmVwcm9kdWNp
YmxlOgo+ID4KPiA+IFlvdSBjYW4gcmVwcm9kdWNlIGl0IHdpdGggdGhlIGZvbGxvd2luZyBzdGVw
IDoKPiA+Cj4gPiAxLiBwcmVwYXJlIHRoZSBlbnZpcm9ubWVudCB3aXRoCj4gPiAtIFFlbXUtdmly
dCB2OC4wLjAgKHdpdGggT3BlblNiaSB2MS4yKQo+ID4gLSBMaW51eCB2Ni40LXJjMQo+ID4KPiA+
IDIuIHN0YXJ0IHRoZSBRZW11IHZpcnQKPiA+IGBgYHNoCj4gPiAkIGNhdCB+LzhfcmlzY3Yvc3Rh
cnRfbGF0ZXN0LnNoCj4gPiAjIS9iaW4vYmFzaAo+ID4gL2hvbWUvc29uZy84X3Jpc2N2LzNfYWNw
aS9xZW11L29vby91c3IvbG9jYWwvYmluL3FlbXUtc3lzdGVtLXJpc2N2NjQgXAo+ID4gLXNtcCAy
IC1tIDRHIC1ub2dyYXBoaWMgLW1hY2hpbmUgdmlydCBcCj4gPiAta2VybmVsIC9ob21lL3Nvbmcv
OV9saW51eC9saW51eC8wMF9ydl90ZXN0L2FyY2gvcmlzY3YvYm9vdC9JbWFnZSBcCj4gPiAtYXBw
ZW5kICJyb290PS9kZXYvdmRhIHJvIGVheWx5Y29uPXVhcnQ4MjUwLG1taW8sMHgxMDAwMDAwMAo+
ID4gZWFybHlfaW9yZW1hcF9kZWJ1ZyBjb25zb2xlPXR0eVMwIGxvZ2xldmVsPTggbWVtYmxvY2s9
ZGVidWcKPiA+IG5vX2NvbnNvbGVfc3VzcGVuZCBhdWRpdD0wIDMiIFwKPiA+IC1kcml2ZSBmaWxl
PS9ob21lL3NvbmcvOF9yaXNjdi9mZWRvcmEvc3RhZ2U0LWRpc2suaW1nLGZvcm1hdD1yYXcsaWQ9
aGQwIFwKPiA+IC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIFwKPiA+IC1kcml2
ZSBmaWxlPS9ob21lL3NvbmcvOF9yaXNjdi9mZWRvcmEvYWRpc2sucWNvdzIsZm9ybWF0PXFjb3cy
LGlkPWhkMSBcCj4gPiAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMSBcCj4gPiAt
Z2RiIHRjcDo6MTIzNiAjLVMKPiA+IGBgYAo+ID4gMy4gZXhlY3V0ZSBoaWJlcm5hdGlvbgo+ID4K
PiA+IGBgYHNoCj4gPiBzd2Fwb24gL2Rldi92ZGIyICMgdGhpcyBpcyBteSBzd2FwIGRpc2sKPiA+
Cj4gPiBlY2hvIGRpc2sgPiAvc3lzL3Bvd2VyL3N0YXRlCj4gPiBgYGAKPiA+Cj4gPiA0LiBUaGVu
IHlvdSB3aWxsIGVuY291bnRlciB0aGUga2VybmVsIHBhbmljIGxvZ2dlZCBpbiB0aGUgYWJvdmUg
bGluawo+ID4KPiA+Cj4gPiBPdGhlciBJbmZvcm1hdGlvbjoKPiA+Cj4gPiBBZnRlciBteSBpbml0
aWFsIGFuZCBpbmNvbXBsZXRlIGRpZy11cCwgdGhlIGNvbW1pdCAoMzMzNTA2OGY4NzIxCj4gPiAi
cmlzY3Y6IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nIilbMl0K
PiA+IGlzIGNsb3NlbHkgcmVsYXRlZCB0byB0aGlzIHBhbmljLiBUaGlzIGNvbW1pdCB1c2VzIHJl
LWRlZmluZWQKPiA+IGBNSU5fTUVNQkxPQ0tfQUREUmAgdG8gZGlzY292ZXIgdGhlIGVudGlyZSBz
eXN0ZW0gbWVtb3J5Cj4gPiBhbmQgZXh0ZW5kcyB0aGUgYHZhX3BhX29mZnNldGAgZnJvbSBga2Vy
bmVsX21hcC5waHlzX2FkZHJgIHRvCj4gPiBgcGh5c19yYW1fYmFzZWAgZm9yIGxpbmVhciBtZW1v
cnkgbWFwcGluZy4KPiA+Cj4gPiBJZiB0aGUgZmlybXdhcmUgZGVsaXZlcmVkIHRoZSBmaXJtd2Fy
ZSBtZW1vcnkgcmVnaW9uIChsaWtlOiBhIFBNUAo+ID4gcHJvdGVjdGVkIHJlZ2lvbiBpbiBPcGVu
U2JpKSB3aXRob3V0ICJuby1tYXAiIHByb3ByaWV0eSwKPiA+IHRoaXMgY29tbWl0IHdpbGwgcmVz
dWx0IGluIGZpcm13YXJlIG1lbW9yeSBiZWluZyBkaXJlY3RseSBtYXBwZWQgYnkKPiA+IGBjcmVh
dGVfbGluZWFyX21hcHBpbmdfcGFnZV90YWJsZSgpYC4KPiA+Cj4gPiBXZSBjYW4gc2VlIHRoZSBt
YXBwaW5nIHZpYSBwdGR1bXAgOgo+ID4gYGBgYwo+ID4gLS0tWyBMaW5lYXIgbWFwcGluZyBdLS0t
Cj4gPiAweGZmNjAwMDAwMDAwMDAwMDAtMHhmZjYwMDAwMDAwMjAwMDAwIDB4MDAwMDAwMDA4MDAw
MDAwMCAyTSBQTUQgRCBBIEcKPiA+IC4gLiBXIFIgViAtLS0tLS0tLS0tLS0tIHRoZSBmaXJtd2Fy
ZSBtZW1vcnkKPiA+IDB4ZmY2MDAwMDAwMDIwMDAwMC0weGZmNjAwMDAwMDBjMDAwMDAgMHgwMDAw
MDAwMDgwMjAwMDAwIDEwTSBQTUQgRCBBIEcgLiAuIC4gUiBWCj4gPiAweGZmNjAwMDAwMDBjMDAw
MDAtMHhmZjYwMDAwMDAxMDAwMDAwIDB4MDAwMDAwMDA4MGMwMDAwMCA0TSBQTUQgRCBBIEcgLiAu
IFcgUiBWCj4gPiAweGZmNjAwMDAwMDEwMDAwMDAtMHhmZjYwMDAwMDAxNjAwMDAwIDB4MDAwMDAw
MDA4MTAwMDAwMCA2TSBQTUQgRCBBIEcgLiAuIC4gUiBWCj4gPiAweGZmNjAwMDAwMDE2MDAwMDAt
MHhmZjYwMDAwMDQwMDAwMDAwIDB4MDAwMDAwMDA4MTYwMDAwMCAxMDAyTSBQTUQgRCBBCj4gPiBH
IC4gLiBXIFIgVgo+ID4gMHhmZjYwMDAwMDQwMDAwMDAwLTB4ZmY2MDAwMDEwMDAwMDAwMCAweDAw
MDAwMDAwYzAwMDAwMDAgM0cgUFVEIEQgQSBHIC4gLiBXIFIgVgo+ID4gLS0tWyBNb2R1bGVzL0JQ
RiBtYXBwaW5nIF0tLS0KPiA+IC0tLVsgS2VybmVsIG1hcHBpbmcgXS0tLQo+ID4gMHhmZmZmZmZm
ZjgwMDAwMDAwLTB4ZmZmZmZmZmY4MGEwMDAwMCAweDAwMDAwMDAwODAyMDAwMDAgMTBNIFBNRCBE
IEEgRyAuIFggLiBSIFYKPiA+IDB4ZmZmZmZmZmY4MGEwMDAwMC0weGZmZmZmZmZmODBjMDAwMDAg
MHgwMDAwMDAwMDgwYzAwMDAwIDJNIFBNRCBEIEEgRyAuIC4gLiBSIFYKPiA+IDB4ZmZmZmZmZmY4
MGMwMDAwMC0weGZmZmZmZmZmODBlMDAwMDAgMHgwMDAwMDAwMDgwZTAwMDAwIDJNIFBNRCBEIEEg
RyAuIC4gVyBSIFYKPiA+IDB4ZmZmZmZmZmY4MGUwMDAwMC0weGZmZmZmZmZmODE0MDAwMDAgMHgw
MDAwMDAwMDgxMDAwMDAwIDZNIFBNRCBEIEEgRyAuIC4gLiBSIFYKPiA+IDB4ZmZmZmZmZmY4MTQw
MDAwMC0weGZmZmZmZmZmODE4MDAwMDAgMHgwMDAwMDAwMDgxNjAwMDAwIDRNIFBNRAo+ID4gYGBg
Cj4gPgo+ID4gSW4gdGhlIGhpYmVybmF0aW9uIHByb2Nlc3MsIGBzd3N1c3Bfc2F2ZSgpYCBjYWxs
cwo+ID4gYGNvcHlfZGF0YV9wYWdlcygmY29weV9ibSwgJm9yaWdfYm0pYCB0byBjb3B5IHRoZXNl
IHR3byBtZW1vcnkKPiA+IGJpdG1hcHMsCj4gPiB0aGUgT29wcyhsb2FkIGFjY2VzcyBmYXVsdCkg
b2NjdXJyZWQgd2hpbGUgY29weWluZyB0aGUgcGFnZSBvZgo+ID4gUEFHRV9PRkZTRVQgKHdoaWNo
IG1hcHMgdGhlIGZpcm13YXJlIG1lbW9yeSkuCj4gPgo+ID4gSSBhbHNvIGRpZCB0d28gb3RoZXIg
dGVzdHM6Cj4gPiBUZXN0MToKPiA+Cj4gPiBUaGUgaGliZXJuYXRpb24gd29ya3Mgd2VsbCBpbiB0
aGUga2VybmVsIHdpdGggdGhlIGNvbW1pdCAzMzM1MDY4Zjg3MjEKPiA+IHJldmVydGVkIGF0IGxl
YXN0IGluIHRoZSBjdXJyZW50IGVudmlyb25tZW50Lgo+ID4KPiA+IFRlc3QyOgo+ID4KPiA+IEkg
YnVpbHQgYSBzaW1wbGUga2VybmVsIG1vZHVsZSB0byBzaW11bGF0ZSB0aGUgYWNjZXNzIG9mIHRo
ZSB2YWx1ZSBvZgo+ID4gYFBBR0VfT0ZGU0VUYCBhZGRyZXNzLCBhbmQgdGhlIHNhbWUgcGFuaWMg
b2NjdXJyZWQgd2l0aCB0aGUgbG9hZAo+ID4gYWNjZXNzIGZhdWx0Lgo+ID4gU28gaGliZXJuYXRp
b24gc2VlbXMgbm90IHRoZSBvbmx5IGNhc2UgdG8gdHJpZ2dlciB0aGlzIHBhbmljLgo+ID4KPiA+
IEZpbmFsbHksIHNob3VsZCB3ZSBhbHdheXMgbGVhdmUgdGhlIGZpcm13YXJlIG1lbW9yeSB3aXRo
Cj4gPiBgTUVNQkxPQ0tfTk9NQVBgIGZsYWcgYnkgc29tZSBlZmZvcnRzIGZyb20gTGludXggb3Ig
T3BlblNiaSAoYXQgbGVhc3QKPiA+IGluIHRoZSBjdXJyZW50IGVudmlyb25tZW50KSBvciBhbnkg
b3RoZXIgc3VnZ2VzdGlvbnM/Cj4gPgo+ID4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25n
Lgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDMzMDA2NDMyMS4x
MDA4MzczLTUtamVlaGVuZy5zaWFAc3RhcmZpdmV0ZWNoLmNvbQo+ID4gWzJdOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjMwMzI0MTU1NDIxLjI3MTU0NC00LWFsZXhnaGl0aUByaXZvc2lu
Yy5jb20KPiA+Cj4gPiAtLQo+ID4gVGhhbmtzLAo+ID4gU29uZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
