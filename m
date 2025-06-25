Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBAEC7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBxJu7g+e9NLV2ELvGUqHiQFoV7yVTD343AhqgVJsZI=; b=1cGhYudUg2QPdc
	OXJcRBxx6wd1H21jQ+6O9iTa3eWEYc6j0Zs5rojcRLYPgaOfYVFN8a2/eUftyBPhbEjSV7V1NhB7m
	MzJ/IGdFbVDlwaM3lUx7mIagDhGjOKc2u3LmVIlau5vhOvbGC/PB7Mt4HDdKr3PcMAFTxash/5G6M
	qj230ai4WDnLiAxBxkOGPDIfygoBL1BcI5W6iMlUneMXKwyJiV4Pg0P5d/0LOZgSFbiAvdit6Ry5A
	ynN2K7T6it8XO3Bfo4zT2DS0tUjJlzeZeAUPoYfSLEvgd/LszdHYKJ1vFnzujJHAN7zPH+0NyEPCx
	0mEuZ1J45Wi4iv3H6xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNu8-00000008PI3-10gV;
	Wed, 25 Jun 2025 11:03:00 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMaR-000000089YO-1GC8;
	Wed, 25 Jun 2025 09:38:36 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-531a1d5519aso2000580e0c.3;
        Wed, 25 Jun 2025 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750844313; x=1751449113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=MMX98M6KrLDYxVOm/3wJw5p0TdecayDsSi9b6ta9q1xH0wW+YwRth1hOgcdYVNDcUS
         /cal/+WWrHcUguP402cHxJxRspO1wXWAsomnF5rYuL1s9ddshx2dIJrvKpscqk14/sjV
         ftH/e7MpHiCPcYfXUUuHZGVCKL4dIT4ihZealBZowq8ayvMF2nGs4N9YFB/t0N+Irp2b
         uviKPuqoK6ygTqJ9IvG+h2dmIOLkT3FD7tqT7c2qAL3NbJ+LmBxp9uOjEoQMY2ozSszj
         v5nznMplERzYnP/h/sX+R1EkU2AQsGTlk3BdWMMlsiXqv4/MyxTOSPCL5ztwLlRyma11
         v3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844313; x=1751449113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=GGTz2IbHTZapmnTJnijbHdIGtzHQq9b/jziEFQDCczCaQLY2MWLCSGZJWlpmG2cvUI
         h3qvRZSHff+1fx/Eoy2LkxEubXC67icB77xvStxkIQUdsaoEkQxAKafd1ZWNYlqF1hX9
         1MME8amYzcLijWlmqgyA8Rru4aZswEIGKXG+xdG8N6VHRaSrVTDiA2HAoFGBFJGV+QW2
         NgF38tCeqF4ri7mz8CJJELSI3FlVbnjNNRMYKnokFuLcmibEDQFvuUf6Sgguxd2h/xLE
         ktyFDoQoA3HuUyeUeV7ZQ2Hmg05p6aRCJfYH0MvHU5fVa38gdZDH3l+54nd7eGrwGLe0
         JSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUofGWUICViCTzNA6GEm+c2+vG1mlojz1EV+65VA+CHdk6LR4gShTeIhpQTPTA4crsU1XiUevPUD6rDEb0=@lists.infradead.org, AJvYcCWAoUlZtvr+DSm7/CY/fAO0267aWkYat+Ahe1ZsMmNdPj+VNQ/+DoJ/pPTo23+pnBuAn5o+ultUN5ybl/3GRqVv@lists.infradead.org
X-Gm-Message-State: AOJu0YzrM56BAfZyW4QimlU/oqvYxVtrU+niE+SLSjtFFQkdZ8Ac7Q6+
	37cF+c4dYxxegwwQt6gNln7I8+yXW1uSCCZ0zq56Mu2ZJ2EIYQuFenRphUK9GGIdzTg1gLFo3/v
	64knnat5E3t0pYG98SVJXVQbScw64hmM=
X-Gm-Gg: ASbGncuB3IVXyxHXQTG28ZGt08Xe2TiNu2x1JxGVXUEPuvTTq/qLtaOvMSFjiGxtD2S
	O3iH5DhUmF3dxCEZzygDnnnSPYNyiCszYDwrt/M74gz2jHqC/+kRPubEiTb7SfstL25/R+pO/I1
	pmYeyVeY7UT3rwNBefSnAaVxN2EdUPs9ax4ASdB5eRHS0=
X-Google-Smtp-Source: AGHT+IHFsEjf8mVqrGJlOglZXBqK+LXUAHLKDnHRegX9xwHltPGn1BuflQtnpCujXSYlVduWzyct2ogezPY53n9zi2Q=
X-Received: by 2002:a05:6122:2516:b0:530:81ac:51be with SMTP id
 71dfb90a1353d-532ef6cc1e4mr985532e0c.8.1750844313457; Wed, 25 Jun 2025
 02:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com> <20250624162503.78957-1-ioworker0@gmail.com>
In-Reply-To: <20250624162503.78957-1-ioworker0@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 21:38:21 +1200
X-Gm-Features: Ac12FXwzgBA5qA6Bu1rSIUYx-JEmY2u59OAGcqCQlCXMv4jDK2aouZ9-YNF9zfQ
Message-ID: <CAGsJ_4x+YaF3bVjMuNv2iJtdoD2-GgGsbJA__cpxb7U5YtK9ig@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	ying.huang@intel.com, zhengtangquan@oppo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_023835_360789_885B60E8 
X-CRM114-Status: GOOD (  33.93  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgNDoyN+KAr0FNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNS82LzI0IDIzOjM0LCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToKPiA+IE9uIDI0LjA2LjI1IDE3OjI2LCBMYW5jZSBZYW5nIHdyb3RlOgo+ID4+IE9u
IDIwMjUvNi8yNCAyMDo1NSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4+IE9uIDE0LjAy
LjI1IDEwOjMwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4+Pj4gRnJvbTogQmFycnkgU29uZyA8di1z
b25nYmFvaHVhQG9wcG8uY29tPgo+ID4+IFsuLi5dCj4gPj4+PiBkaWZmIC0tZ2l0IGEvbW0vcm1h
cC5jIGIvbW0vcm1hcC5jCj4gPj4+PiBpbmRleCA4OWU1MWE3YTk1MDkuLjg3ODY3MDRiZDQ2NiAx
MDA2NDQKPiA+Pj4+IC0tLSBhL21tL3JtYXAuYwo+ID4+Pj4gKysrIGIvbW0vcm1hcC5jCj4gPj4+
PiBAQCAtMTc4MSw2ICsxNzgxLDI1IEBAIHZvaWQgZm9saW9fcmVtb3ZlX3JtYXBfcHVkKHN0cnVj
dCBmb2xpbyAqZm9saW8sCj4gPj4+PiBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiA+Pj4+ICAgICNlbmRp
Zgo+ID4+Pj4gICAgfQo+ID4+Pj4gKy8qIFdlIHN1cHBvcnQgYmF0Y2ggdW5tYXBwaW5nIG9mIFBU
RXMgZm9yIGxhenlmcmVlIGxhcmdlIGZvbGlvcyAqLwo+ID4+Pj4gK3N0YXRpYyBpbmxpbmUgYm9v
bCBjYW5fYmF0Y2hfdW5tYXBfZm9saW9fcHRlcyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gPj4+PiAr
ICAgICAgICAgICAgc3RydWN0IGZvbGlvICpmb2xpbywgcHRlX3QgKnB0ZXApCj4gPj4+PiArewo+
ID4+Pj4gKyAgICBjb25zdCBmcGJfdCBmcGJfZmxhZ3MgPSBGUEJfSUdOT1JFX0RJUlRZIHwgRlBC
X0lHTk9SRV9TT0ZUX0RJUlRZOwo+ID4+Pj4gKyAgICBpbnQgbWF4X25yID0gZm9saW9fbnJfcGFn
ZXMoZm9saW8pOwo+ID4+Pgo+ID4+PiBMZXQncyBhc3N1bWUgd2UgaGF2ZSB0aGUgZmlyc3QgcGFn
ZSBvZiBhIGZvbGlvIG1hcHBlZCBhdCB0aGUgbGFzdCBwYWdlCj4gPj4+IHRhYmxlIGVudHJ5IGlu
IG91ciBwYWdlIHRhYmxlLgo+ID4+Cj4gPj4gR29vZCBwb2ludC4gSSdtIGN1cmlvdXMgaWYgaXQg
aXMgc29tZXRoaW5nIHdlJ3ZlIHNlZW4gaW4gcHJhY3RpY2UgOykKPiA+Cj4gPiBJIGNoYWxsZW5n
ZSB5b3UgdG8gd3JpdGUgYSByZXByb2R1Y2VyIDpQIEkgYXNzdW1lIGl0IG1pZ2h0IGJlIGRvYWJs
ZQo+ID4gdGhyb3VnaCBzaW1wbGUgbXJlbWFwKCkuCj4gPgo+ID4+Cj4gPj4+Cj4gPj4+IFdoYXQg
cHJldmVudHMgZm9saW9fcHRlX2JhdGNoKCkgZnJvbSByZWFkaW5nIG91dHNpZGUgdGhlIHBhZ2Ug
dGFibGU/Cj4gPj4KPiA+PiBBc3N1bWluZyBzdWNoIGEgc2NlbmFyaW8gaXMgcG9zc2libGUsIHRv
IHByZXZlbnQgYW55IGNoYW5jZSBvZiBhbgo+ID4+IG91dC1vZi1ib3VuZHMgcmVhZCwgaG93IGFi
b3V0IHRoaXMgY2hhbmdlOgo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL21tL3JtYXAuYyBiL21tL3Jt
YXAuYwo+ID4+IGluZGV4IGZiNjNkOTI1NmYwOS4uOWFlYWU4MTFhMzhiIDEwMDY0NAo+ID4+IC0t
LSBhL21tL3JtYXAuYwo+ID4+ICsrKyBiL21tL3JtYXAuYwo+ID4+IEBAIC0xODUyLDYgKzE4NTIs
MjUgQEAgc3RhdGljIGlubGluZSBib29sCj4gPj4gY2FuX2JhdGNoX3VubWFwX2ZvbGlvX3B0ZXMo
dW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+ICAgICAgIGNvbnN0IGZwYl90IGZwYl9mbGFncyA9IEZQ
Ql9JR05PUkVfRElSVFkgfCBGUEJfSUdOT1JFX1NPRlRfRElSVFk7Cj4gPj4gICAgICAgaW50IG1h
eF9uciA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKPiA+PiAgICAgICBwdGVfdCBwdGUgPSBwdGVw
X2dldChwdGVwKTsKPiA+PiArICAgIHVuc2lnbmVkIGxvbmcgZW5kX2FkZHI7Cj4gPj4gKwo+ID4+
ICsgICAgLyoKPiA+PiArICAgICAqIFRvIGJhdGNoIHVubWFwLCB0aGUgZW50aXJlIGZvbGlvJ3Mg
UFRFcyBtdXN0IGJlIGNvbnRpZ3VvdXMKPiA+PiArICAgICAqIGFuZCBtYXBwZWQgd2l0aGluIHRo
ZSBzYW1lIFBURSBwYWdlIHRhYmxlLCB3aGljaCBjb3JyZXNwb25kcyB0bwo+ID4+ICsgICAgICog
YSBzaW5nbGUgUE1EIGVudHJ5LiBCZWZvcmUgY2FsbGluZyBmb2xpb19wdGVfYmF0Y2goKSwgd2hp
Y2ggZG9lcwo+ID4+ICsgICAgICogbm90IHBlcmZvcm0gYm91bmRhcnkgY2hlY2tzIGl0c2VsZiwg
d2UgbXVzdCB2ZXJpZnkgdGhhdCB0aGUKPiA+PiArICAgICAqIGFkZHJlc3MgcmFuZ2UgY292ZXJl
ZCBieSB0aGUgZm9saW8gZG9lcyBub3QgY3Jvc3MgYSBQTUQgYm91bmRhcnkuCj4gPj4gKyAgICAg
Ki8KPiA+PiArICAgIGVuZF9hZGRyID0gYWRkciArIChtYXhfbnIgKiBQQUdFX1NJWkUpIC0gMTsK
PiA+PiArCj4gPj4gKyAgICAvKgo+ID4+ICsgICAgICogQSBmYXN0IHdheSB0byBjaGVjayBmb3Ig
YSBQTUQgYm91bmRhcnkgY3Jvc3MgaXMgdG8gYWxpZ24gYm90aAo+ID4+ICsgICAgICogdGhlIHN0
YXJ0IGFuZCBlbmQgYWRkcmVzc2VzIHRvIHRoZSBQTUQgYm91bmRhcnkgYW5kIHNlZSBpZiB0aGV5
Cj4gPj4gKyAgICAgKiBhcmUgZGlmZmVyZW50LiBJZiB0aGV5IGFyZSwgdGhlIHJhbmdlIHNwYW5z
IGFjcm9zcyBhdCBsZWFzdCB0d28KPiA+PiArICAgICAqIGRpZmZlcmVudCBQTUQtbWFuYWdlZCBy
ZWdpb25zLgo+ID4+ICsgICAgICovCj4gPj4gKyAgICBpZiAoKGFkZHIgJiBQTURfTUFTSykgIT0g
KGVuZF9hZGRyICYgUE1EX01BU0spKQo+ID4+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Cj4g
PiBZb3Ugc2hvdWxkIG5vdCBiZSBtZXNzaW5nIHdpdGggbWF4X25yID0gZm9saW9fbnJfcGFnZXMo
Zm9saW8pIGhlcmUgYXQKPiA+IGFsbC4gZm9saW9fcHRlX2JhdGNoKCkgdGFrZXMgY2FyZSBvZiB0
aGF0Lgo+ID4KPiA+IEFsc28sIHdheSB0b28gbWFueSBjb21tZW50cyA7KQo+ID4KPiA+IFlvdSBt
YXkgb25seSBiYXRjaCB3aXRoaW4gYSBzaW5nbGUgVk1BIGFuZCB3aXRoaW4gYSBzaW5nbGUgcGFn
ZSB0YWJsZS4KPiA+Cj4gPiBTbyBzaW1wbHkgYWxpZ24gdGhlIGFkZHIgdXAgdG8gdGhlIG5leHQg
UE1ELCBhbmQgbWFrZSBzdXJlIGl0IGRvZXMgbm90Cj4gPiBleGNlZWQgdGhlIHZtYSBlbmQuCj4g
Pgo+ID4gQUxJR04gYW5kIGZyaWVuZHMgY2FuIGhlbHAgYXZvaWRpbmcgZXhjZXNzaXZlIGNvbW1l
bnRzLgo+Cj4gVGhhbmtzISBIb3cgYWJvdXQgdGhpcyB1cGRhdGVkIHZlcnNpb24gYmFzZWQgb24g
eW91ciBzdWdnZXN0aW9uOgo+Cj4gZGlmZiAtLWdpdCBhL21tL3JtYXAuYyBiL21tL3JtYXAuYwo+
IGluZGV4IGZiNjNkOTI1NmYwOS4uMjQxZDU1YTkyYTQ3IDEwMDY0NAo+IC0tLSBhL21tL3JtYXAu
Ywo+ICsrKyBiL21tL3JtYXAuYwo+IEBAIC0xODQ3LDEyICsxODQ3LDI1IEBAIHZvaWQgZm9saW9f
cmVtb3ZlX3JtYXBfcHVkKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBwYWdlICpwYWdlLAo+
Cj4gIC8qIFdlIHN1cHBvcnQgYmF0Y2ggdW5tYXBwaW5nIG9mIFBURXMgZm9yIGxhenlmcmVlIGxh
cmdlIGZvbGlvcyAqLwo+ICBzdGF0aWMgaW5saW5lIGJvb2wgY2FuX2JhdGNoX3VubWFwX2ZvbGlv
X3B0ZXModW5zaWduZWQgbG9uZyBhZGRyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBmb2xpbyAqZm9saW8sIHB0ZV90ICpwdGVwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZm9saW8gKmZvbGlvLCBwdGVfdCAqcHRlcCwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCj4gIHsKPiAgICAgICAgIGNvbnN0IGZwYl90IGZwYl9mbGFncyA9IEZQ
Ql9JR05PUkVfRElSVFkgfCBGUEJfSUdOT1JFX1NPRlRfRElSVFk7Cj4gKyAgICAgICB1bnNpZ25l
ZCBsb25nIG5leHRfcG1kLCB2bWFfZW5kLCBlbmRfYWRkcjsKPiAgICAgICAgIGludCBtYXhfbnIg
PSBmb2xpb19ucl9wYWdlcyhmb2xpbyk7Cj4gICAgICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldChw
dGVwKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIExpbWl0IHRoZSBiYXRjaCBzY2FuIHdp
dGhpbiBhIHNpbmdsZSBWTUEgYW5kIHdpdGhpbiBhIHNpbmdsZQo+ICsgICAgICAgICogcGFnZSB0
YWJsZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgdm1hX2VuZCA9IHZtYS0+dm1fZW5kOwo+ICsg
ICAgICAgbmV4dF9wbWQgPSBBTElHTihhZGRyICsgMSwgUE1EX1NJWkUpOwo+ICsgICAgICAgZW5k
X2FkZHIgPSBhZGRyICsgKHVuc2lnbmVkIGxvbmcpbWF4X25yICogUEFHRV9TSVpFOwo+ICsKPiAr
ICAgICAgIGlmIChlbmRfYWRkciA+IG1pbihuZXh0X3BtZCwgdm1hX2VuZCkpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKPiArCgpJIGhhZCBhIHNpbWlsYXIgY2hlY2sgaW4gZG9fc3dh
cF9wYWdlKCkgZm9yIGJvdGggZm9yd2FyZCBhbmQgYmFja3dhcmQKb3V0LW9mLWJvdW5kcyBwYWdl
IHRhYmxlcywgYnV0IEkgZm9yZ290IHRvIGFkZCBpdCBmb3IgdGhpcyB1bm1hcCBwYXRoLgoKdGhp
cyBpcyBkb19zd2FwX3BhZ2UoKToKCiAgICAgICAgaWYgKGZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8p
ICYmIGZvbGlvX3Rlc3Rfc3dhcGNhY2hlKGZvbGlvKSkgewogICAgICAgICAgICAgICAgaW50IG5y
ID0gZm9saW9fbnJfcGFnZXMoZm9saW8pOwogICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBp
ZHggPSBmb2xpb19wYWdlX2lkeChmb2xpbywgcGFnZSk7CiAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGZvbGlvX3N0YXJ0ID0gYWRkcmVzcyAtIGlkeCAqIFBBR0VfU0laRTsKICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZm9saW9fZW5kID0gZm9saW9fc3RhcnQgKyBuciAqIFBBR0Vf
U0laRTsKCiAgICAgICAgICAgICAgICBwdGVfdCAqZm9saW9fcHRlcDsKICAgICAgICAgICAgICAg
IHB0ZV90IGZvbGlvX3B0ZTsKCiAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZm9saW9fc3Rh
cnQgPCBtYXgoYWRkcmVzcyAmIFBNRF9NQVNLLAp2bWEtPnZtX3N0YXJ0KSkpCiAgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gY2hlY2tfZm9saW87CiAgICAgICAgICAgICAgICBpZiAodW5saWtl
bHkoZm9saW9fZW5kID4gcG1kX2FkZHJfZW5kKGFkZHJlc3MsIHZtYS0+dm1fZW5kKSkpCiAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gY2hlY2tfZm9saW87CiAgICAgICB9CgpTbyBtYXliZSBz
b21ldGhpbmcgbGlrZSBmb2xpb19lbmQgPiBwbWRfYWRkcl9lbmQoYWRkcmVzcywgdm1hLT52bV9l
bmQpPwoKVGhhbmtzCkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
