Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC66CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 02:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5Yy6Y9Tr/m1UI46g6SprEJu3+M+8C+o2w9ds9Pwnvk=; b=MTn7Bb7sVPIay9
	Tuv7VNRT5VchIsrrlckzmKKJtyA2f7AzLSTwmt0kiTdhfOLRL7WMY7y7t7ot3U7El2gHcMr++Vbut
	exBegWdZtbPFpkqeiS30MjLjnJJTI92dgsy8S64H5Ilh0/kj2qYmlsvAfXhIEdMlR6/tlyxznR1yF
	sZ1mXKMQZMaCXyglalt75u5yy8M/L88J21PUC8Xv8A+Cv9mEw6aTUC9LJBXO20puOPoCEI10Mb2S9
	9TbAVsNpoKZJ0GhecCN8Lk/TU1FocAJ0crBFrvS3ShF+Fy9khwz3vchbQvmAVdXroZJu3HDWyBPdO
	GGYkujQDL6OqsPavxAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur67t-0000000Dju0-0T88;
	Wed, 27 Aug 2025 02:43:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur66C-0000000DjYt-3UBG
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 02:41:22 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47052620a6so374248a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 19:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756262480; x=1756867280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjxEgqnJro7lL9LezaBDUakZcT0q5OR/PsDrwklypb4=;
        b=fl0kyVMlWNbytk37kwe0Ehg3N1iYiMe/RCrCUVQ1X+7AV8UfHC2dic0Q6jEVj6JB3x
         JPH4OYnWtXF0c5iclC/ZiMfYoAfvgHcL+/74qFBTkx4CQPkq8eh6lpSTkEN+EBDPg7C4
         3kdgWuSgeWhbqnnWFefQTjrxVQ4vFMasg5dJ4uJGWANYTXUKk9Pj53dDTV9qwjXyddcF
         0DgxSIWUpEhaeE8IluapasHgB6w0vaQhSpZkI1M1A5bbgE3aNJG26mVyKrbETAjSQum2
         PN7HQHjOdaLv1sFws+uPcefsUkrRmpdR91SsALnGtmSam8BVAVsQpouZZzZWgxStD9TW
         YnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756262480; x=1756867280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjxEgqnJro7lL9LezaBDUakZcT0q5OR/PsDrwklypb4=;
        b=N7+5QLjaShd4aKvSAUjX+a16qFy6f3xZK7wJ/Nk2kyh5nZFzP5v9ZJqSXT1Su5c+yt
         UllONlA+3eGb7CHCbmYs+6YGQMwHhyeRC6ldyPgH4VJaq88rumXYLtaLKyNZNn/5LV8E
         jqJvRNaXVzi0xJVWKwBN/oMLlt9HZJXOD/lkKa6j3gZ0s1Yv9nWpFaEbBVJC+i3gqLfw
         +yfT50/NS9yTxhh4yxM5fTn+jJHu4LjiuW58GE+og42TzaUnb13HnaCQo7MtcZ7J1RKa
         RMPNRQzDB6ARLtuVwRc8rn0x0YeVbqOah+eZioXykzGHV1FAtj0+aLASxY8ccKLTLrDU
         87Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUoAGkWi7aTrl205lrlkNkweZSgitm85sX1bXni4anuxk4HdUpCbps4ZEsfFOuXpWdVBhthzky/pbYoIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyotDDCvi7RDh46hO+27tjubeX+qLKmBH5CdC5L/++n9XSoskbm
	80nS+a80nPQYFRCCkLe0dtO4dZh01qZ1f37BL+kxkc87y07GS2QFaNY6AIlau7OU12klySZ55Rp
	JcdKuZL281vhQcMgF25QVihyVITJCDL6YiH+eRhLJ6Q==
X-Gm-Gg: ASbGncts2gtrR5KzbjmJZ3e1vXoXmCDElzQd3JEm5NF9CJA/xKmZaYC2Fr3jJ7SX+tb
	LTTqg3Fys7jsbfS+ESKqNJthgWJTK1NnRW0tLG5MTVFhwuINlomgJWZxlyNLqyrhoCsbE2zMyKQ
	Lbfy+OoMAdXrhgQi0bnDdN9jp8jGw95fEvnqoTDnqCJayrfpMFE48iDKqAL6tB5mZTO+TFhiPH3
	xzPudwhoYKyYcG7+gVsByEipXMf7XFzRfHRGKI7HKE8pxCeeq6fi3QWSIc=
X-Google-Smtp-Source: AGHT+IFPzhubzZRBaSf6ZK7EERQAGuZTZeLwtvw9GV2o/YId4xoUhbtPFhevcDJ7OY1DRqDVEbOGIVoPvPf8Q3kVeug=
X-Received: by 2002:a17:902:e548:b0:234:9fe1:8fc6 with SMTP id
 d9443c01a7336-248753a2436mr47264125ad.18.1756262479947; Tue, 26 Aug 2025
 19:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
 <20250826-dullness-seventy-c93e7c8479d0@spud> <CAPYmKFuZ5y=q-tpmgMzGFEy6y=UPDf5vLg4gS8VAEkAKBr6BmQ@mail.gmail.com>
In-Reply-To: <CAPYmKFuZ5y=q-tpmgMzGFEy6y=UPDf5vLg4gS8VAEkAKBr6BmQ@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 27 Aug 2025 10:41:08 +0800
X-Gm-Features: Ac12FXywUMzcZzcq7obnXHI4n0aD8CBNXv6CPZzr0eD00j5rqXvalTtJvc8l_Wo
Message-ID: <CAPYmKFu52h_n_NkD=LhVscjp-RWvai8eAO29D=ZXTtXgB_Msbw@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/4] riscv: Add Zalasr ISA exntesion support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_194120_870967_82B33821 
X-CRM114-Status: GOOD (  23.44  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMTA6MjbigK9BTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBDb25vciwKPgo+IE9uIFdlZCwgQXVnIDI3LCAyMDI1
IGF0IDE6NDbigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFR1ZSwgQXVnIDI2LCAyMDI1IGF0IDEwOjU3OjM2UE0gKzA4MDAsIFh1IEx1IHdyb3Rl
Ogo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFphbGFzciBJU0EgZXh0ZW5z
aW9uLCB3aGljaCBzdXBwbGllcyB0aGUKPiA+ID4gcmVhbCBsb2FkIGFjcXVpcmUvc3RvcmUgcmVs
ZWFzZSBpbnN0cnVjdGlvbnMuCj4gPiA+Cj4gPiA+IFRoZSBzcGVjaWZpY2F0aW9uIGNhbiBiZSBm
b3VuZCBoZXJlOgo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtemFsYXNyL2Js
b2IvbWFpbi9jaGFwdGVyMi5hZG9jCj4gPgo+ID4gV2h5IGlzIHRoaXMgYW4gUkZDPwo+Cj4gVGhl
cmUgaXMgc3RpbGwgc29tZSBjb2RlIHVzaW5nIGZlbmNlIHRvIHNpbXVsYXRlIHJlYWwKPiBsb2Fk
LWFjcXVpcmUvc3RvcmUtcmVsZWFzZSBpbnNucy4gRm9yIGV4YW1wbGUsIFJJU0NWX0FDUVVJUkVf
QkFSUklFUgo+IGFuZCBSSVNDVl9SRUxFQVNFX0JBUlJJRVIsIGV0Yy4gSSB3aWxsIHJlc2VuZCBh
IGZvcm1hbCBwYXRjaCBzZXJpZXMKPiBhZnRlciBJIG1vZGlmeSB0aGVtLgoKT3IgbWF5YmUgSSB3
aWxsIHNraXAgc3VjaCBjb2RlIGFzIHRoZXkgaGF2ZSBkaWZmZXJlbnQgc2VtYW50aWNzIHdpdGgK
bG9hZC1hY3F1aXJlL3N0b3JlLXJlbGVhc2UgYXMgdGhlcmUgaXMgbm8gbmVlZCB0byBsb2FkIG9y
IHN0b3JlIGFueQpkYXRhLgoKPgo+ID4gSXMgdGhlIFJGQyB0YWcgcmVsYXRlZCB0byBob3cgeW91
IGhhdmUgbm90IENDZWQgYWxsIHJlbGV2YW50IG1haWxpbmcKPiA+IGxpc3RzIGFuZCBtYWludGFp
bmVycz8KPgo+IFNvcnJ5IGFib3V0IHRoaXMuIEkgd2lsbCByZWNoZWNrIHRoZSBtYWludGFpbmVy
IGxpc3QgbmV4dCB0aW1lLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFh1IEx1Cj4KPiA+Cj4gPiBDaGVl
cnMsCj4gPiBDb25vci4KPiA+Cj4gPiA+Cj4gPiA+IFh1IEx1ICg0KToKPiA+ID4gICByaXNjdjog
YWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmFsYXNyCj4gPiA+ICAgZHQtYmluZGluZ3M6
IHJpc2N2OiBBZGQgWmFsYXNyIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiA+ID4gICByaXNj
djogSW5zdHJvZHVjZSBaYWxhc3IgaW5zdHJ1Y3Rpb25zCj4gPiA+ICAgcmlzY3Y6IFVzZSBaYWxh
c3IgZm9yIHNtcF9sb2FkX2FjcXVpcmUvc21wX3N0b3JlX3JlbGVhc2UKPiA+ID4KPiA+ID4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA1ICsrCj4gPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgICAgICAgICAgfCA3OSArKysr
KysrKysrKysrKysrLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAg
ICAgICAgICAgICAgfCAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVm
LmggICAgICAgICAgICAgfCA3OSArKysrKysrKysrKysrKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgMSArCj4gPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4g
LS0KPiA+ID4gMi4yMC4xCj4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
