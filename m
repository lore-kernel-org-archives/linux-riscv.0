Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F222C2BA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46rEqfdspIdH5JHnlFfE7AYjwmS0oSAcAmHH0opgOS0=; b=iL0VQjqui7d/a8
	YFSP3VvaEQd17zmD+WW+vwOzTWt9/Xc4Fc7L0VtcJyqzsq3UXfspy5MBGU8wJGkrlPYZaiDznXP2/
	ppw98uoncOzBb0RproQAAv1AgkUiCLlcB76Y23kR1lHfo/uJLH/gpfp9AwRKKZhFvLeJZGcg8XmMV
	WKkql4ZaxZf6vgFrkh6UQsiYMbtgC2jFUkwsbUJ45u1UwPbj55EMxZkejUsXuM9y947HEmO7HP5yC
	NuW9CtyICWgfOKkQ5NBUJbLoZ/yDl7nuRC/Z1cjex2gtOMPIuySuqT100ssxPnPrH7mRVK9j/2FW+
	i6bCTl1ZwU/z/a8ncIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5DR-000000035JE-1ECO;
	Wed, 19 Jun 2024 23:59:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5DK-000000035FY-2vla
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:59:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c7e2382b94so51656a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718841582; x=1719446382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPIWffzVniZY30jt5CUBA5ztypiy6lkcOF4OsPdrjrA=;
        b=HetCYoGQhgLXhV+6esHKYGcjGQiD734UrVVgb8SffY3aspuJAejzLzDBeyEG3C/W/+
         0tcHPtm32wIxQ4HQEq2IOov0ZslWH2Xiq6cehC6T44vGpoIK8pZuknLBQlPYGOaMA+l/
         UvqMXfo5ReRtyrds4X0nR+zeTcuKNTVqYGTAWzYNSudsdnjpLjekIb71y8JYnpQSyDyC
         +fkFVaadWry2LZnuRKo3ChNPoaBCxGl3USxWyf2vsE6yanTmrXfhP3t1xlSM4FM/5U2a
         e1LIEkFjCJT8kJVZENCXJAwtg9jDq1tKFAEQACEV6Flz7d/8/eWr5IhXx17yfFTUqCyV
         q5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841582; x=1719446382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPIWffzVniZY30jt5CUBA5ztypiy6lkcOF4OsPdrjrA=;
        b=S/kAj+Ao/rvqiLwpLnjJc1t7uaQwA9mD7fsCxZMajjxPgiyeba63jFzUBDfD0DUZOZ
         sO6HuaS8JWpHMc5KW1pb7QlAHhldL5JAn5F2tR7pZIknJjFI1CxDDKDj/BykI3naNVKM
         6zkW93eDJbm5+932VQfOLtFg2zLaF4GYZ7sGfvDb/0od/js9swCFqQO5n7sXIe5q9yLW
         RfsKrEuosxCKT/b2mG69SPrdR3RbAoIminob6HyYGGmVzRxheaN/o9YiJs3T1JidKrRs
         cUkhJ/NaZW68PdvQ+deYKc6NGJwHymQhd8ibrimjuIamwDrBs5xXvyWfIVWqxLhLNxLo
         dKcw==
X-Forwarded-Encrypted: i=1; AJvYcCU2nPl7GvCjwCw03AK40NvN50B9ZjiRUzkyXFnz0L2jNAUFN7vY5GiWTAZUufMscWX2EMAH9I/LQ1ra0ureXHKQDbS9cehbqOzpjL87cq3A
X-Gm-Message-State: AOJu0YyVjkOGMySfWLjpOCoSvOriaD79Fo2+rOEX/v785DKmBLT0q3V4
	NQdW3xp3WR0j/QPeBzY8rQTJ50p0cuFDMeTpwaXQtvpDDz0RTWFNY7hDjD3Cce0xE1+jjppTGj/
	+sNwN53UYrfyYhIc3g9tX9+jpQeghzFvsGJaw
X-Google-Smtp-Source: AGHT+IGDy54gwmtH82mfmVUG3BVW+uVDtF6f1DEOMp25r37WxWLMBLNrcKUmvJJ5UTrM6dq2WaFLjtA2UFy1eXQ4iNI=
X-Received: by 2002:a17:90a:ead5:b0:2c4:e2cd:996d with SMTP id
 98e67ed59e1d1-2c7b5d95b07mr3787651a91.3.1718841581837; Wed, 19 Jun 2024
 16:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240616170553.2832-1-jszhang@kernel.org> <CANtDSir9O+B1mZx-k+j0+bHo03A653itida8f34frFaY2doM0Q@mail.gmail.com>
 <ZnL1OV1GQxV4nS2h@xhacker>
In-Reply-To: <ZnL1OV1GQxV4nS2h@xhacker>
From: Cyril Bur <cyrilbur@tenstorrent.com>
Date: Thu, 20 Jun 2024 09:59:31 +1000
Message-ID: <CANtDSipLW3g558mqtRmdh4O_j0mKpz+f+zMAqoDAeDEmbxObCg@mail.gmail.com>
Subject: Re: [CAUTION - External Sender] Re: [PATCH 0/6] riscv: convert bottom
 half of exception handling to C
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165942_798728_ED33547D 
X-CRM114-Status: GOOD (  33.08  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMToyNeKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAwODoxNjo1OEFN
ICsxMDAwLCBDeXJpbCBCdXIgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAzOjIx
4oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+
ID4gRm9yIHJlYWRhYmlsaXR5LCBtYWludGFpbmFiaWxpdHkgYW5kIGZ1dHVyZSBzY2FsYWJpbGl0
eSwgY29udmVydCB0aGUKPiA+ID4gYm90dG9tIGhhbGYgb2YgdGhlIGV4Y2VwdGlvbiBoYW5kbGlu
ZyB0byBDLgo+ID4gPgo+ID4gPiBEdXJpbmcgdGhlIGNvbnZlcnNpb24sIEkgZm91bmQgQW50b24g
Zml4ZWQgYSBwZXJmb3JtYW5jZSBpc3N1ZQo+ID4gPiBhbmQgbXkgcGF0Y2hlcyB3aWxsIHRvdWNo
IHRoZSBzYW1lIGV4Y2VwdGlvbiBhc20gY29kZSwgc28gSSBpbmNsdWRlCj4gPiA+IEFudG9uJ3Mg
cGF0Y2ggZm9yIGNvbXBsZXRlbmVzcy4gSSBhbHNvIGNvb2tlZCBhIHNpbWlsYXIgcGF0Y2ggdG8g
YXZvaWQKPiA+ID4gY29ycnVwdGluZyB0aGUgUkFTIGluIHJldF9mcm9tX2ZvcmsoKSBwZXIgdGhl
IGluc3BpcmF0aW9uLgo+ID4gPgo+ID4gPiBNb3N0bHkgdGhlIGFzc2VtYmx5IGNvZGUgaXMgY29u
dmVydGVkIHRvIEMgaW4gYSByZWxhdGl2ZWx5Cj4gPiA+IHN0cmFpZ2h0Zm9yd2FyZCBtYW5uZXIu
Cj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIHRoZXJlIGFyZSB0d28gbW9kaWZpY2F0aW9ucyBJIG5lZWQg
dG8gbWVudGlvbjoKPiA+ID4KPiA+ID4gMS4gdGhlIENTUl9DQVVTRSByZWcgcmVhZGluZyBhbmQg
c2F2aW5nIGlzIG1vdmVkIHRvIHRoZSBDIGNvZGUKPiA+ID4gYmVjYXVzZSB3ZSBuZWVkIHRoZSBj
YXVzZSB0byBkaXNwYXRjaCB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nLAo+ID4gPiBpZiB3ZSBrZWVw
IHRoZSBjYXVzZSByZWFkaW5nIGFuZCBzYXZpbmcsIHdlIGVpdGhlciBwYXNzIGl0IHRvCj4gPiA+
IGRvX3RyYXBzKCkgdmlhLiAybmQgcGFyYW0gb3IgZ2V0IGl0IGZyb20gcHRfcmVncyB3aGljaCBh
biBleHRyYQo+ID4gPiBtZW1vcnkgbG9hZCBpcyBuZWVkZWQsIEkgZG9uJ3QgbGlrZSBhbnkgb2Yg
dGhlIHR3byBzb2x1dGlvbnMgYmVjYXNlCj4gPiA+IHRoZSBleGNlcHRpb24gaGFuZGxpbmcgc2l0
cyBpbiBob3QgY29kZSBwYXRoLCBldmVyeSBpbnN0cnVjdGlvbgo+ID4gPiBtYXR0ZXJzLgo+ID4g
Pgo+ID4gPiAyLlRvIGNvcGUgd2l0aCBTSUZJVkVfQ0lQXzQ1MyBlcnJhdGEsIGl0IGxvb2tzIGxp
a2Ugd2UgZG9uJ3QgbmVlZAo+ID4gPiBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gYW55IG1vcmUgYWZ0
ZXIgdGhlIGFzbS0+YyBjb252ZXJ0aW9uLiBKdXN0Cj4gPiA+IHJlcGxhY2UgdGhlIGV4Y3BfdmVj
dF90YWJsZSB0d28gZW50cmllcy4KPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gQW50b24gQmxhbmNo
YXJkICgxKToKPiA+ID4gICByaXNjdjogSW1wcm92ZSBleGNlcHRpb24gYW5kIHN5c3RlbSBjYWxs
IGxhdGVuY3kKPiA+ID4KPiA+IEkndmUgcmV0ZXN0ZWQgdGhpcyBwYXRjaCB3aXRoIHRoZSByZXN0
IG9mIHRoZSBzZXJpZXMgYXBwbGllZC4gSSBjYW4gY29uZmlybQo+ID4gdGhhdCB0aGUgcGVyZm9y
bWFuY2UgaW1wcm92ZW1lbnQgaXMgc3RpbGwgdGhlcmUuIERlZmluaXRlbHkgdGh1bWJzIHVwIG9u
IG15IGVuZC4KPgo+IFRoYW5rcyEgVGhlIDJuZCBwYXRjaCBpcyBpbnNwaXJlZCBieSBBbnRvbidz
IHBhdGNoLiBUaGUgcmVtYWluaW5ncwo+IGFyZSBqdXN0IHRvIGNvbnZlcnQgdGhlIGFzbSB0byBj
IGluIHN0cmFpZ2h0IGZvcndhcmQgc3R5bGUuCj4KPiBJZiBwb3NzaWJsZSwgY291bGQgeW91IHBs
ZWFzZSBhZGQgeW91ciBUZXN0ZWQtYnkgdGFnPyBPciBldmVuIGJldHRlcgo+IHJldmlldyB0aGUg
c2VyaWVzIDspCj4KSSBvbmx5IHNhdyB0aGlzIHJlc3BvbnNlIGFmdGVyIGhhdmluZyBhIGxvb2sg
YXQgMy82LiBJJ20gYSBsaXR0bGUKbmVydm91cyBhYm91dCBhIGZ1bGwgcmV2aWV3CmFzIEkgZG9u
J3Qga25vdyBhbGwgdGhlIHJpc2N2IGNhdGNoZXMgeWV0LgoKSSdsbCBzYXkgdGhhdCB0aGUgdGVz
dGluZyBvZiB0aGUgc2VyaWVzIHdhc24ndCBtYXNzaXZlLiBJIGp1c3QgYm9vdGVkCml0IGVub3Vn
aCB0byBleGVyY2lzZQp0aGF0IGNvZGVwYXRoIGFuZCBnZXQgc29tZSBudW1iZXJzLiBIYXZpbmcg
c2FpZCB0aGF0IEknbSBmaW5lIHB1dHRpbmcKYSBUZXN0ZWQtYnkKZm9yIHRoZSBzZXJpZXMsIGl0
IGRpZCBib290IHRvIHVzZXJzcGFjZSBhZnRlciBhbGwgOikuCgo+IFRoYW5rcwo+ID4KPiA+ID4g
SmlzaGVuZyBaaGFuZyAoNSk6Cj4gPiA+ICAgcmlzY3Y6IGF2b2lkIGNvcnJ1cHRpbmcgdGhlIFJB
Uwo+ID4gPiAgIHJpc2N2OiBjb252ZXJ0IGJvdHRvbSBoYWxmIG9mIGV4Y2VwdGlvbiBoYW5kbGlu
ZyB0byBDCj4gPiA+ICAgcmlzY3Y6IGVycmF0YTogcmVtb3ZlIEFMVF9JTlNOX0ZBVUxUIGFuZCBB
TFRfUEFHRV9GQVVMVAo+ID4gPiAgIHJpc2N2OiBlcnJhdGE6IHNpZml2ZTogcmVtb3ZlIE5PTU1V
IGhhbmRsaW5nCj4gPiA+ICAgcmlzY3Y6IHJlbW92ZSBhc21saW5rYWdlIGZyb20gdXBkYXRlZCBm
dW5jdGlvbnMKPiA+ID4KPiA+ID4gIGFyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyAg
ICAgICAgIHwgMjUgKysrKysrKy0tLQo+ID4gPiAgYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2Vy
cmF0YV9jaXBfNDUzLlMgfCAgNCAtLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20t
cHJvdG90eXBlcy5oICAgfCAgNyArLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJy
YXRhX2xpc3QuaCAgICAgIHwgMjEgKystLS0tLS0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Vu
dHJ5LlMgICAgICAgICAgICAgICAgIHwgNjEgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAgICAgICAgICAgIHwgIDQgKy0KPiA+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICAgIHwgNTcgKysrKysrKysr
KysrKysrKysrLS0tCj4gPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDk4
IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjQzLjAKPiA+ID4KPiA+ID4KPiA+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
