Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC53C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 19:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTfRWvblxhZFieS3HnJQQnL9Jf0qvN0Edf+s8s5xmiU=; b=x4eeVooHbXVrrZ
	EYcN1GZ/ibOATjZrDe0JO+QoYZY+1vy4ZmLh4G2dORM6QHO/TBDjuCadDZjmk1OFrNqFXseIvXd6r
	fiL1N1PsvWVZUngOz5AQhKGxq8G+OZDTdRmtajM/Acrm+h2UnTVITsCXeLFuYFtazvfA9cX5DidHJ
	+gzuS1/6l0WiSePyejKnDLb6EmFnAPMedoFXoFJ/6fKjJGpKCgA9pGShBcDQjyfq/vFe6hNx73qzh
	76pE9rQPlMk0N0wsHXScq44XzWPgXcTS7TZmyDp/53C72R5jKAbc6D15sl4yXvyvee3BcHcqUrMKM
	F6mc7vJfJj0unpZknVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tSf-00AwZm-I2; Thu, 15 Dec 2022 19:00:05 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5tSc-00AwXH-LO
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 19:00:04 +0000
Received: by mail-pg1-x530.google.com with SMTP id r18so212656pgr.12
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 11:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9ls2j7Ywe5JCV1Zd3x2Q8hIHEGMMPFJOgwMgtP3Dbw=;
        b=WEPLllNGalHFpRc9XaNskiy3ODgxZnDG+XM3aTqr4+gMdZxy/pSF6X4C4Q03DmDbBe
         X9Ad1j3cHI/S6nmQQAvk4F1eWrpzwGJnOZxsWqrG/4eLBR2Fhw0gRPjPcG5oCttP3Ffl
         0L6zfbOLV1n8dzAIqaOQn5oMlZNutGT/e1dl5vGmT094yr3OOSXGkn3NGwsS03JMK0LF
         AIZO5sludl0usHa4K8v10QKMVhQJeJm4vnam0pmJG+hAUjGsMm03Z5aGzHakt/gkFpYP
         WccAuzs3hpP7Bjl961AMn6BpEBYwx4EohuN9UUrfGPp+a9ylh1spkKGLmF7dMVnj+FHQ
         PkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9ls2j7Ywe5JCV1Zd3x2Q8hIHEGMMPFJOgwMgtP3Dbw=;
        b=DKaoISom+MfhqHpMHcfqnvsY7VWwAyTSze2PHhtVzoAUCHQHorydFPEC5zESOhPeNx
         ti/0paqPAMN6aTLlBD3fSxLCaVEpzOTh5V1EiGuxyiXp5rt9YfGDJmUupt3CKyxoTTh+
         IM7mVKi5YL35yN2/yahF05X2gvkLcROuS+A5uBPsnkxehY5AnL+7CtZR/0ez9z6isv2a
         IZQ1tJay+uP+KlNEpGgYDroyfhjrwhjWaas+f40iI3AW/cfBF8EJFQPB9KPPqpuS9MNd
         BGENTfCA3UyON3rJ70z2iIYP2VC9CX6Fy1NKEemZrXkgbJerZE9XPLlD19IFixbunAfy
         Yvnw==
X-Gm-Message-State: ANoB5pns6g8UmG6bPwi+OG+oyMUgAYBw3lBCd5st5pPUjHwryfWrm+IN
	zpqkVQy2HsjgTPiaxaIl26oJNMtTVNdY0sODiqH1rqojX8s=
X-Google-Smtp-Source: AA0mqf57OKqhwBqhmheBunoBC/INxpIpRZ2JKwqXmCHsHVoCpXHZcynAkGWQcQiKsXXsHKYf04AFAazh73lA3n8iP10=
X-Received: by 2002:a63:417:0:b0:478:6f31:d40c with SMTP id
 23-20020a630417000000b004786f31d40cmr32133147pge.16.1671130800746; Thu, 15
 Dec 2022 11:00:00 -0800 (PST)
MIME-Version: 1.0
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com> <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com> <Y5qByfCtpV0uNID3@bruce.bluespec.com>
 <877cysx4yf.fsf@all.your.base.are.belong.to.us> <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
 <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org> <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
In-Reply-To: <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
From: Andrew Pinski <pinskia@gmail.com>
Date: Thu, 15 Dec 2022 10:59:47 -0800
Message-ID: <CA+=Sn1nH-b8OigfFBNKT_ECr5DL-jJ5XU+H9pA9g5gF=8YQNMQ@mail.gmail.com>
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Florian Weimer <fweimer@redhat.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Darius Rad <darius@bluespec.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org, atishp@atishpatra.org, 
	guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	libc-alpha@sourceware.org, christoph.muellner@vrull.eu, 
	Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_110002_742772_E284AC22 
X-CRM114-Status: GOOD (  26.20  )
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

T24gVGh1LCBEZWMgMTUsIDIwMjIgYXQgMTA6NTcgQU0gVmluZWV0IEd1cHRhIDx2aW5lZXRnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTIvMTUvMjIgMDc6MzMsIFJpY2hhcmQgSGVu
ZGVyc29uIHdyb3RlOgo+ID4gT24gMTIvMTUvMjIgMDQ6MjgsIEZsb3JpYW4gV2VpbWVyIHZpYSBM
aWJjLWFscGhhIHdyb3RlOgo+ID4+ICogQmrDtnJuIFTDtnBlbDoKPiA+Pgo+ID4+Pj4gRm9yIFNW
RSwgaXQgaXMgaW4gZmFjdCBkaXNhYmxlZCBieSBkZWZhdWx0IGluIHRoZSBrZXJuZWwuICBXaGVu
IGEKPiA+Pj4+IHRocmVhZAo+ID4+Pj4gZXhlY3V0ZXMgdGhlIGZpcnN0IFNWRSBpbnN0cnVjdGlv
biwgaXQgd2lsbCBjYXVzZSBhbiBleGNlcHRpb24sIHRoZQo+ID4+Pj4ga2VybmVsCj4gPj4+PiB3
aWxsIGFsbG9jYXRlIG1lbW9yeSBmb3IgU1ZFIHN0YXRlIGFuZCBlbmFibGUgVElGX1NWRS4gRnVy
dGhlciB1c2UKPiA+Pj4+IG9mIFNWRQo+ID4+Pj4gaW5zdHJ1Y3Rpb25zIHdpbGwgcHJvY2VlZCB3
aXRob3V0IGV4Y2VwdGlvbnMuICBBbHRob3VnaCBTVkUgaXMKPiA+Pj4+IGRpc2FibGVkIGJ5Cj4g
Pj4+PiBkZWZhdWx0LCBpdCBpcyBlbmFibGVkIGF1dG9tYXRpY2FsbHkuICBTaW5jZSB0aGlzIGlz
IGRvbmUKPiA+Pj4+IGF1dG9tYXRpY2FsbHkKPiA+Pj4+IGR1cmluZyBhbiBleGNlcHRpb24gaGFu
ZGxlciwgdGhlcmUgaXMgbm8gb3Bwb3J0dW5pdHkgZm9yIG1lbW9yeQo+ID4+Pj4gYWxsb2NhdGlv
bgo+ID4+Pj4gZXJyb3JzIHRvIGJlIHJlcG9ydGVkLCBhcyB0aGVyZSBhcmUgaW4gdGhlIEFNWCBj
YXNlLgo+ID4+Pgo+ID4+PiBHbGliYyBoYXMgYW4gU1ZFIG9wdGltaXplZCBtZW1jcHksIHJpZ2h0
PyBEb2Vzbid0IHRoYXQgbWVhbiB0aGF0IHByZXR0eQo+ID4+PiBtdWNoIGFsbCBwcm9jZXNzZXMg
b24gYW4gU1ZFIGNhcGFibGUgc3lzdGVtIHdpbGwgZW5hYmxlIFNWRQo+ID4+PiAobGF6aWx5KT8g
SWYKPiA+Pj4gc28sIHRoYXQncyBjbG9zZSB0byAiZW5hYmxlZCBieSBkZWZhdWx0IiAodW5sZXNz
IFNWRSBpcyBkaXNhYmxlZCBzeXN0ZW0KPiA+Pj4gd2lkZSkuCj4gPj4KPiA+PiBZZXMsIHNlZSBz
eXNkZXBzL2FhcmNoNjQvbXVsdGlhcmNoL21lbWNweS5jOgo+ID4+Cj4gPj4gICAgc3RhdGljIGlu
bGluZSBfX3R5cGVvZiAoX19yZWRpcmVjdF9tZW1jcHkpICoKPiA+PiAgICBzZWxlY3RfbWVtY3B5
X2lmdW5jICh2b2lkKQo+ID4+ICAgIHsKPiA+PiAgICAgIElOSVRfQVJDSCAoKTsKPiA+PiAgICAg
ICAgIGlmIChzdmUgJiYgSEFWRV9BQVJDSDY0X1NWRV9BU00pCj4gPj4gICAgICAgIHsKPiA+PiAg
ICAgICAgICBpZiAoSVNfQTY0RlggKG1pZHIpKQo+ID4+ICAgICAgICAgICAgcmV0dXJuIF9fbWVt
Y3B5X2E2NGZ4Owo+ID4+ICAgICAgICAgIHJldHVybiBfX21lbWNweV9zdmU7Cj4gPj4gICAgICAg
IH0KPiA+PiAgICAgICAgIGlmIChJU19USFVOREVSWCAobWlkcikpCj4gPj4gICAgICAgIHJldHVy
biBfX21lbWNweV90aHVuZGVyeDsKPiA+PiAgICAgICAgIGlmIChJU19USFVOREVSWDIgKG1pZHIp
IHx8IElTX1RIVU5ERVJYMlBBIChtaWRyKSkKPiA+PiAgICAgICAgcmV0dXJuIF9fbWVtY3B5X3Ro
dW5kZXJ4MjsKPiA+PiAgICAgICAgIGlmIChJU19GQUxLT1IgKG1pZHIpIHx8IElTX1BIRUNEQSAo
bWlkcikpCj4gPj4gICAgICAgIHJldHVybiBfX21lbWNweV9mYWxrb3I7Cj4gPj4gICAgICAgICBy
ZXR1cm4gX19tZW1jcHlfZ2VuZXJpYzsKPiA+PiAgICB9Cj4gPj4gICAgQW5kIHRoZSBfX21lbWNw
eV9zdmUgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgdXNlcyBTVkUuCj4gPj4KPiA+PiBJZiB0aGVy
ZSB3ZXJlIGEgcHJjdGwgdG8gc2VsZWN0IHRoZSB2ZWN0b3Igd2lkdGggYW5kIGVuYWJsZSB0aGUg
dmVjdG9yCj4gPj4gZXh0ZW5zaW9uLCB3ZSdkIGhhdmUgdG8gcGljayBhIHdpZHRoIGluIGdsaWJj
IGFueXdheS4KPiA+Cj4gPiBUaGVyZSAqaXMqIGEgcHJjdGwgdG8gYWRqdXN0IHRoZSBTVkUgdmVj
dG9yIHdpZHRoLCBidXQgZ2xpYmMgZG9lcyBub3QKPiA+IG5lZWQgdG8gc2VsZWN0IGJlY2F1c2Ug
U1ZFIGR5bmFtaWNhbGx5IGFkanVzdHMgdG8gdGhlIGN1cnJlbnRseQo+ID4gZW5hYmxlZCB3aWR0
aC4gIFRoZSBrZXJuZWwgc2VsZWN0cyBhIGRlZmF1bHQgd2lkdGggdGhhdCBmaXRzIHdpdGhpbgo+
ID4gdGhlIGRlZmF1bHQgc2lnbmFsIGZyYW1lIHNpemUuCj4gPgo+ID4gVGhlIG90aGVyIHRoaW5n
IG9mIG5vdGUgZm9yIFNWRSBpcyB0aGF0LCB3aXRoIHRoZSBkZWZhdWx0IGZ1bmN0aW9uIEFCSQo+
ID4gYWxsIG9mIHRoZSBTVkUgc3RhdGUgaXMgY2FsbC1jbG9iYmVyZWQsIHdoaWNoIGFsbG93cyB0
aGUga2VybmVsIHRvCj4gPiBkcm9wIGluc3RlYWQgb2Ygc2F2ZSBzdGF0ZSBhY3Jvc3Mgc3lzdGVt
IGNhbGxzLiAgKFRoZXJlIGlzIGEgc2VwYXJhdGUKPiA+IHZlY3RvciBmdW5jdGlvbiBjYWxsIEFC
SSB3aGVuIFNWRSB0eXBlcyBhcmUgdXNlZC4pCj4KPiBGb3IgdGhlIFJWIHBzQUJJLCBpdCBpcyBz
aW1pbGFyIC0gYWxsIFYgcmVncyBhcmUKPiBjYWxsZXItc2F2ZWQvY2FsbC1jbG9iYmVyZWQgWzFd
IGFuZCBzeXNjYWxscyBhcmUgbm90IHJlcXVpcmVkIHRvCj4gcHJlc2VydmUgViByZWdzIFsyXQo+
IEhvd2V2ZXIgbGFzdCBJIGNoZWNrZWQgQVJNIGRvY3VtZW50YXRpb24gdGhlIEFCSSBkb2Mgc2Vl
bWVkIHRvIHN1Z2dlc3QKPiB0aGF0IHNvbWUgKHBhcnRzKSBvZiB0aGUgU1ZFIHJlZ3MgYXJlIGNh
bGxlZS1zYXZlZCBbM10KClllcyB0aGUgbG93ZXIgNjQgYml0cyB3aGljaCBvdmVybGFwIHdpdGgg
dGhlIGZsb2F0aW5nIHBvaW50IHJlZ2lzdGVycy4KClRoYW5rcywKQW5kcmV3IFBpbnNraQoKCj4K
PiA+Cj4gPiBTbyB3aGlsZSBzdHJjcHkgbWF5IGVuYWJsZSBTVkUgZm9yIHRoZSB0aHJlYWQsIHRo
ZSBuZXh0IHN5c2NhbGwgbWF5Cj4gPiBkaXNhYmxlIGl0IGFnYWluLgo+Cj4gTmV4dCBzeXNjYWxs
IGNvdWxkIHRyYXNoIHRoZW0sIGJ1dCB3aWxsIGl0IGRpc2FibGUgU1ZFID8gRGVzcGl0ZQo+IHN5
c2NhbGwvZnVuY3Rpb24tY2FsbCBjbG9iYmVycywgdXNpbmcgViBpbiB0aWdodCBsb29wcyBzdWNo
IGFzIG1lbSovc3RyKgo+IHN0aWxsIGlzIGEgd2luLgo+Cj4KPiBbMV0KPiBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNhYmktZG9jL2Jsb2IvbWFzdGVyL3Jpc2N2
LWNjLmFkb2MKPiBbMl0KPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytdi1zcGVjL2Js
b2IvbWFzdGVyL2NhbGxpbmctY29udmVudGlvbi5hZG9jCj4gWzNdCj4gaHR0cHM6Ly9naXRodWIu
Y29tL0FSTS1zb2Z0d2FyZS9hYmktYWEvYmxvYi8yOTgyYTlmM2I1MTJhNWJmZGM5ZTNmZWE1ZDNi
Mjk4ZjkxNjVjMzZiL2FhcGNzNjQvYWFwY3M2NC5yc3QjdGhlLWJhc2UtcHJvY2VkdXJlLWNhbGwt
c3RhbmRhcmQKPiBTZWMgNi4xLjMgIi4uLi4gSW4gb3RoZXIgY2FzZXMgaXQgbmVlZCBvbmx5IHBy
ZXNlcnZlIHRoZSBsb3cgNjQgYml0cyBvZgo+IHo4LXoxNSIKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
