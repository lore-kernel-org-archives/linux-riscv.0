Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEF7E732F0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efNcYXmjOiIaTuDUsRWuw7LHq8/unRpqUWEo3WPLK2g=; b=BDWc0B+nwsEzlr
	aiTIj0opHVAOAelVsw7BQveifWAOr2kL/qHWwo7ajiN3Vuf62T+xBVe+NzV1JfSaIrG6svuuI2Hpw
	e+vLvZ9/r25Nc2CmpntEMnHEBjHZJRDAGyyYOz1lsig80MULJoVtJm3T6GQn6WUOGJX+m2O42TyXe
	JrZPr5Qg2b/xsU/Q/T2MVZhOzE8+jWj5XHEiTotDufFk2PstSRlr2dWh3Z93PqM9kUAv78l11Ct50
	iuA7WNXCY4+pOPpnSU17rINu74KJ3umHoUauCtTeHj6kXbP/nr4qzuQO80/LtJLF5h5sW+KbiTXzk
	/wZQQZYE78+Qv/AVv7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qluCD-006CAD-2S;
	Thu, 28 Sep 2023 16:49:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qluCA-006C4q-0A
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 16:49:00 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c131ddfeb8so203629581fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695919732; x=1696524532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44e7JjlG+WtSY93eeg23R+ddrkmidvGwWHPd503fikU=;
        b=Ma8KlS0j1/X8CUmpEFCHVo4DvJ7aDyxVAviYozgb6z+iNLn0dPZV7G0X1KZSahgrJa
         gNJOaQr87IpqmlXN3fPI3SGImfyRy5D/EU3ASaVluNKljF5vk6fBIXt9bk3zYvALOWsh
         X4yGq0j+4EqeVwnIpDaY9ZgTH5Em9I3dgM8ET3OlMigm7pHw+Cr7tlkNoSYkLANs/eYV
         fSLz+QnzY7JUW+znh7DI7dW73RPMXnucDpiW6SgEJ9jz2xMx0+sBi4Bj8ySx+DmaUL2s
         o8TWXgKCA732voglXNCpKwGqxrbYZkf4x6fDw6EFsU/JXSUyI67zFGHM5FsSLSB1Mu5c
         5dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695919732; x=1696524532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44e7JjlG+WtSY93eeg23R+ddrkmidvGwWHPd503fikU=;
        b=ShShO50JQcKE9f7hKRm/BR8B/NKYlqDi5mrGNgYQhTOn5nZ0QVEHbKl0O339pdcutr
         VvZM845lY9pIbTbElZ5m7R9QSfah4eh0pI7IPZeb6R3tFkTYBBTrNzQ58e7pARGKVxpW
         L3SPYLQlRbGlTc8f6txY0cltWl8qeAC8KpLh0XG6oJqv7LydUdT+M97iknXNaJ/lIdg4
         wSJeF7FkyhU012QPl/vsL2U7hoQ7qNUTt6PbnhZqgIGP5KkKI1OHVDs7OWcya1jN3ocW
         J2VQzSb7brfATt3959wUxw3pg38OfhxGIohFAi5OMo4hNMWllwykDXYBT3Sao7jHCMUd
         r/nA==
X-Gm-Message-State: AOJu0YyTI23t2VHcHzac+YqRssQixTJ2MWkXcUGrYA9sZ3ER+pr+IR0v
	spu6ONQoKGH4iJGKJoaihx6wsti6Nfe9JRQbC62T3g==
X-Google-Smtp-Source: AGHT+IEbRkCHOMBJe/ei0e9obPh+BFrfZpzCUXl6IIFyZN3ZHbEtYGUXGWXMnvH1SMQHZBjXtN75+lOrtiDzacUgCcA=
X-Received: by 2002:a2e:b00e:0:b0:2c0:32d7:8962 with SMTP id
 y14-20020a2eb00e000000b002c032d78962mr1673135ljk.1.1695919732494; Thu, 28 Sep
 2023 09:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com> <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
 <10997d30-e6b7-4a24-a43e-e22679e8d450@rivosinc.com>
In-Reply-To: <10997d30-e6b7-4a24-a43e-e22679e8d450@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 28 Sep 2023 09:48:16 -0700
Message-ID: <CALs-HssAAgbdUuoCyPEdjs+8yH+a8Gzz7jCpMre-6k21aE_sdQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_094858_305615_EF994270 
X-CRM114-Status: GOOD (  33.33  )
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

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMTI6NDnigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDI2LzA5LzIwMjMgMjM6NDMsIEV2YW4g
R3JlZW4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCA4OjAz4oCvQU0gQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Pgo+ID4+IFNpbmNlIGNv
bW1pdCA2MWNhZGI5ICgiUHJvdmlkZSBuZXcgZGVzY3JpcHRpb24gb2YgbWlzYWxpZ25lZCBsb2Fk
L3N0b3JlCj4gPj4gYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJjaGl0ZWN0
dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCj4gPj4gbWFudWFsLCBpdCBpcyBzdGF0ZWQgdGhhdCBt
aXNhbGlnbmVkIGxvYWQvc3RvcmUgbWlnaHQgbm90IGJlIHN1cHBvcnRlZC4KPiA+PiBIb3dldmVy
LCB0aGUgUklTQy1WIGtlcm5lbCB1QUJJIGRlc2NyaWJlcyB0aGF0IG1pc2FsaWduZWQgYWNjZXNz
ZXMgYXJlCj4gPj4gc3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCBmb3IgUy1tb2RlCj4gPj4gaGFuZGxpbmcgb2YgbWlzYWxpZ25lZCBh
Y2Nlc3NlcyBhcyB3ZWxsIHN1cHBvcnQgZm9yIHByY3RsKFBSX1VOQUxJR04pLgo+ID4+Cj4gPj4g
SGFuZGxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaW4ga2VybmVsIGFsbG93cyBmb3IgYSBmaW5lciBn
cmFpbiBjb250cm9sCj4gPj4gb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzZXMgYmVoYXZpb3IsIGFu
ZCB0aGFua3MgdG8gdGhlIHByY3RsIGNhbGwsIGNhbgo+ID4+IGFsbG93IGRpc2FibGluZyBtaXNh
bGlnbmVkIGFjY2VzcyBlbXVsYXRpb24gdG8gZ2VuZXJhdGUgU0lHQlVTLiBVc2VyCj4gPj4gc3Bh
Y2UgY2FuIHRoZW4gb3B0aW1pemUgaXRzIHNvZnR3YXJlIGJ5IHJlbW92aW5nIHN1Y2ggYWNjZXNz
IGJhc2VkIG9uCj4gPj4gU0lHQlVTIGdlbmVyYXRpb24uCj4gPj4KPiA+PiBDdXJyZW50bHksIHRo
aXMgc2VyaWVzIGlzIHVzZWZ1bCBmb3IgcGVvcGxlIHRoYXQgdXNlcyBhIFNCSSB0aGF0IGRvZXMK
PiA+PiBub3QgaGFuZGxlZCBtaXNhbGlnbmVkIHRyYXBzLiBJbiBhIG5lYXIgZnV0dXJlLCB0aGlz
IHNlcmllcyB3aWxsIG1ha2UKPiA+PiB1c2UgYSBTQkkgZXh0ZW5zaW9uIFsxXSBhbGxvd2luZyB0
byByZXF1ZXN0IGRlbGVnYXRpb24gb2YgdGhlCj4gPj4gbWlzYWxpZ25lZCBsb2FkL3N0b3JlIHRy
YXBzIHRvIHRoZSBTLW1vZGUgc29mdHdhcmUuIFRoaXMgZXh0ZW5zaW9uIGhhcwo+ID4+IGJlZW4g
c3VibWl0dGVkIGZvciByZXZpZXcgdG8gdGhlIHJpc2N2IHRlY2gtcHJzIGdyb3VwLiBBbiBPcGVu
U0JJCj4gPj4gaW1wbGVtZW50YXRpb24gZm9yIHRoaXMgc3BlYyBpcyBhdmFpbGFibGUgYXQgWzJd
Lgo+ID4KPiA+IEZvciBteSBvd24gZWR1Y2F0aW9uLCBob3cgZG9lcyB0aGUgbmV3IFNCSSBjYWxs
IGJlaGF2ZSB3aXRoIHJlc3BlY3QgdG8KPiA+IG11bHRpcGxlIGhhcnRzPyBEb2VzIGEgY2FsbCB0
byBjaGFuZ2UgYSBmZWF0dXJlIHBlcmZvcm0gdGhhdCBjaGFuZ2UKPiA+IGFjcm9zcyBhbGwgaGFy
dHMsIG9yIGp1c3QgdGhlIGhhcnQgdGhlIFNCSSBjYWxsIHdhcyBtYWRlIG9uPyBJZiB0aGUKPiA+
IGFuc3dlciBpcyAiYWxsIGhhcnRzIiwgd2hhdCBpZiBub3QgYWxsIGhhcnRzIGFyZSBleGFjdGx5
IHRoZSBzYW1lLCBhbmQKPiA+IHNvbWUgY2FuIGVuYWJsZSB0aGUgZmVhdHVyZSBzd2l0Y2ggd2hp
bGUgb3RoZXJzIGNhbm5vdD8gQWxzbyBpZiB0aGUKPiA+IGFuc3dlciBpcyAiYWxsIGhhcnRzIiwg
ZG9lcyBpdCBhbHNvIGFwcGx5IHRvIGhvdHBsdWdnZWQgY3B1cywgd2hpY2gKPiA+IG1heSBub3Qg
aGF2ZSBldmVuIGV4aXN0ZWQgYXQgYm9vdCB0aW1lPwo+Cj4gRGVwZW5kaW5nIG9uIHRoZSBmZWF0
dXJlLCB0aGV5IGNhbiBiZSBlaXRoZXIgZ2xvYmFsIChhbGwgaGFydHMpIG9yCj4gbG9jYWwgKGNh
bGxpbmcgaGFydCkuIFRoZSBtZWRlbGVnIHJlZ2lzdGVyIGlzIHBlciBoYXJ0IGFuZCB0aHVzCj4g
bWlzYWxpZ25lZCBsb2FkL3N0b3JlIGRlbGVnYXRpb24gZm9yIFMtbW9kZSBpcyBhbHNvIHBlciBo
YXJ0LgoKV2Ugc2hvdWxkIHByb2JhYmx5IHN0YXRlIHRoaXMgaW4gdGhlIHNwZWMgdXBkYXRlIHRo
ZW4sIGJvdGggZ2VuZXJhbGx5CmFuZCBmb3IgZWFjaCBzcGVjaWZpYyBmZWF0dXJlIGFkZGVkLiBP
dGhlcndpc2UgZmlybXdhcmUgd3JpdGVycyBhcmUKbGVmdCBub3Qga25vd2luZyBpZiB0aGV5J3Jl
IHN1cHBvc2VkIHRvIHNwcmVhZCBhIGZlYXR1cmUgYWNyb3NzIHRvIGFsbApjb3JlcyBvciBub3Qu
Cgo+Cj4KPiA+Cj4gPiBXaGF0IGhhcHBlbnMgaWYgYSBoYXJ0IGdvZXMgdGhyb3VnaCBhIGNvbnRl
eHQgbG9zcyBldmVudCwgbGlrZQo+ID4gc3VzcGVuZC9yZXN1bWU/IElzIHRoZSBzZXR0aW5nIGV4
cGVjdGVkIHRvIGJlIHN0aWNreSwgb3IgaXMgdGhlIGtlcm5lbAo+ID4gZXhwZWN0ZWQgdG8gcmVw
bGF5IHRoZXNlIGNhbGxzPwo+Cj4gVGhhdCBpcyBhIGdvb2QgcXVlc3Rpb24gdGhhdCB3ZSBkaWQg
bm90IGFjdHVhbGx5IGNsYXJpZmllZCB5ZXQuIFRoYW5rcwo+IGZvciByYWlzaW5nIGl0ICEKCk5v
IHByb2JsZW0hIFRoaXMgbWF5IGFsc28gbmVlZCB0byBiZSBzcGVjaWZpZWQgcGVyLWZlYXR1cmUg
aW4gdGhlCnNwZWMuIEkgaGF2ZSBhIHZhZ3VlIGh1bmNoIHRoYXQgaXQncyBiZXR0ZXIgdG8gYXNr
IHRoZSBrZXJuZWwgdG8gZG8gaXQKb24gcmVzdW1lLCB0aG91Z2ggaWRlYWxseSB3ZSdkIGhhdmUg
dGhlIHRlcm1pbm9sb2d5IChhbmQgSSBkb24ndCB0aGluawp3ZSBkbz8pIHRvIHNwZWNpZnkgZXhh
Y3RseSB3aGljaCBwb2ludHMgY29uc3RpdHV0ZSBhIGNvbnRleHQgbG9zcy4KTW9zdGx5IEknbSBy
ZW1lbWJlcmluZyB0aGUgeDg2IGFuZCBBUk0gdHJhbnNpdGlvbiBmcm9tIFMzLCB3aGVyZSBsb3Rz
Cm9mIGZpcm13YXJlIGNvZGUgcmFuIGF0IHJlc3VtZSwgdG8gUzBpeC1saWtlIHBvd2VyIHN0YXRl
cywgd2hlcmUKdGhpbmdzIHJlc3VtZWQgZGlyZWN0bHkgaW50byB0aGUgT1MgYW5kIHRoZXkgaGFk
IHRvIGZpZ3VyZSBvdXQgaG93IHRvCmRvIGl0IHdpdGhvdXQgZmlybXdhcmUuIFRoZSB2YWd1ZSBo
dW5jaCBpcyB0aGF0IGtlZXBpbmcgdGhlIGxhdW5kcnkKbGlzdCBvZiB0aGluZ3MgZmlybXdhcmUg
bXVzdCBkbyBvbiByZXN1bWUgbG93IG1pZ2h0IGtlZXAgdXMgZnJvbQpnZXR0aW5nIGluIFMwaXgn
cyB3YXksIGJ1dCBpdCdzIGFsbCBzbyBzcGVjdWxhdGl2ZSBpdCdzIGhhcmQgdG8ga25vdwppZiBp
dCdzIHJlYWxseSBhIHVzZWZ1bCBodW5jaCBvciBub3QuCgotRXZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
