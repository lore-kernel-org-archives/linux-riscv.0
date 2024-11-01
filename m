Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D71AE6F06D
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yIk7gkj2DOui22rr/bnAze9SkPW8bWlMYMmtVWeKvY8=; b=bSoMf2V4zsR2r++fBspPhjlp2r
	mVXMOOsOq6LIcWnj0zk5UEugskwgo9Aqb0auD9MfeJjES1bci131DjvjEuI1q/j2NqI+VvthxNmLb
	oedkgLklfmkb/qF9FRfgx2FR7n8CB9RSaZ11H0jKHUb1Ad6Kdt4Bx1a/1bF2Et8aZbkuyWACBu1dH
	njn/R0mVFm9iJhXL8LKUYu+IQ8GR7bICbqg+WIBF42j15/f63YD41hLZzUxMDUvi+lvbjoa4ld17+
	y1941a+tbZuzxkU1QD9+9FNK+UeJ0TpHpxDgzttPxIxb4zqp2gS2rGFO3HolG5GmC0jAbpwZnqH31
	ApuaUuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uEY-00000007cDx-1Yjr;
	Fri, 01 Nov 2024 16:10:46 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u3T-00000007aDg-2Frs
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 15:59:21 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ed98536f95so1669928a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730476758; x=1731081558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7C7udYDSGtBe+UDNEgx3LKkpcEb5Jn+SrINvorUJ5I=;
        b=m3TcefzbesGW30OI89zAMEffCOZGbBN80Pwb1JfXdNSfTSKWrezq5CHe5sPoABKW3k
         Q5WDw9HjQuUI1f9T+KFZRixj8508c7ilzE3zdxc7Bv1TbYCtOAK1lRYQgNQPnmmdhcjn
         DrTFWB6/gMlpjQ4mH/kLAtom6AZiscNboKgevN8JYRl5u8Jp4ZwqFuTEwcp5b38S2zce
         F0c0cpatP6UP6Cnufj0BYY2rrjwXgMnLTI1DqxlbGhrVOqGJIAkvOTNh6/pSNN5xoG/W
         z/QmV8g9tlk02+0EuBk7uCFe3/OH/e21ChVpZxyH6C7BEIxbp1ARFkq0Lebpz9sfECA4
         z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730476758; x=1731081558;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7C7udYDSGtBe+UDNEgx3LKkpcEb5Jn+SrINvorUJ5I=;
        b=hyWHl6epIRhLDc86ARnvVRKzi0zEM4HDcgqDWET4sRYbP4hV+wrViOqBVdhF9NaF6e
         asSTL83TP6zzgFxSwRTBkE1ZbmfWzgElaM4PzEBl5Q7PCdZ7VB4RU1TtgRSIs86t169I
         cKHpsdqKwel3kfScyac6GN7jcmvGRrHyku6Fs4ffwyqJemwt4vagV4vHWYHAzPTQH4so
         WvwpBqpuS7yCNOHWmF+k3EV1VXkd1fo9W+BgQ+UTzEN+5TN+tKIcFGf57cMU4QOraIJu
         Qsf93UYrdAMfUu/b/DCGgvNAmOYYyK3qoqyRVpWKz7dQaq1oXNbQQ7IsWi61SeP3ntXm
         EjgA==
X-Forwarded-Encrypted: i=1; AJvYcCWr1DFP2TFOWZ9MqBQSyd/4kKL0AB52SBdSkKhgTxwEf1OntEXERAEqvV9FKzNZootv0IJgLXYr5WuJyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQEsXQ5Q2RXKfZXhBitJ//ckRv/xrvQaDWXust5xFMfKMYHoP
	m16wBI7BjJLpsX6nrFgJ5qYqv3FRmICyw8lPBCBiwDCg8VXRXRdazqDLA0VNnmb3Vul3n8aWwwb
	tqA==
X-Google-Smtp-Source: AGHT+IHdP6G2fJCdE/LEn9b4GNy3yTcluEwmDEOjmuidoXhD2Yg5GyJmi1fYyuRyUM0NRBeCXSVah99A4Vc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:5658:0:b0:7ea:d01a:e37a with SMTP id
 41be03b00d2f7-7ee44becc77mr9923a12.4.1730476757639; Fri, 01 Nov 2024 08:59:17
 -0700 (PDT)
Date: Fri, 1 Nov 2024 08:59:16 -0700
In-Reply-To: <ZyT2CB6zodtbWEI9@linux.dev>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
Message-ID: <ZyT61FF0-g8gKZfc@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_085919_620893_7D0378AF 
X-CRM114-Status: GOOD (  29.48  )
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

T24gRnJpLCBOb3YgMDEsIDIwMjQsIE9saXZlciBVcHRvbiB3cm90ZToKPiBIZXksCj4gCj4gT24g
RnJpLCBOb3YgMDEsIDIwMjQgYXQgMDc6NDg6MDBBTSAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNv
biB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDAxLCAyMDI0LCBNYXJrIEJyb3duIHdyb3RlOgo+ID4g
PiBPbiBXZWQsIE9jdCAwOSwgMjAyNCBhdCAwODo0OTo0MkFNIC0wNzAwLCBTZWFuIENocmlzdG9w
aGVyc29uIHdyb3RlOgo+ID4gPiA+IFJldHVybiBhIHVpbnQ2NF90IGZyb20gdmNwdV9nZXRfcmVn
KCkgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGNhbGxlciBwcm92aWRlCj4gPiA+ID4gYSBwb2ludGVy
IHRvIHN0b3JhZ2UsIGFzIG5vbmUgb2YgdGhlIHZjcHVfZ2V0X3JlZygpIHVzYWdlIGluIEtWTSBz
ZWxmdGVzdHMKPiA+ID4gPiBhY2Nlc3NlcyBhIHJlZ2lzdGVyIGxhcmdlciB0aGFuIDY0IGJpdHMs
IGFuZCB2Y3B1X3NldF9yZWcoKSBvbmx5IGFjY2VwdHMgYQo+ID4gPiA+IDY0LWJpdCB2YWx1ZS4g
IElmIGEgdXNlIGNhc2UgY29tZXMgYWxvbmcgdGhhdCBuZWVkcyB0byBnZXQgYSByZWdpc3RlciB0
aGF0Cj4gPiA+ID4gaXMgbGFyZ2VyIHRoYW4gNjQgYml0cywgdGhlbiBhIHV0aWxpdHkgY2FuIGJl
IGFkZGVkIHRvIGFzc2VydCBzdWNjZXNzIGFuZAo+ID4gPiA+IHRha2UgYSB2b2lkIHBvaW50ZXIs
IGJ1dCB1bnRpbCB0aGVuLCBmb3JjaW5nIGFuIG91dCBwYXJhbSB5aWVsZHMgdWdseSBjb2RlCj4g
PiA+ID4gYW5kIHByZXZlbnRzIGZlZWRpbmcgdGhlIG91dHB1dCBvZiB2Y3B1X2dldF9yZWcoKSBp
bnRvIHZjcHVfc2V0X3JlZygpLgo+ID4gPiAKPiA+ID4gVGhpcyBjb21taXQsIHdoaWNoIGlzIGlu
IHRvZGF5J3MgLW5leHQgYXMgNWM2YzdiNzFhNDVjOWMsIGJyZWFrcyB0aGUKPiA+ID4gYnVpbGQg
b24gYXJtNjQ6Cj4gPiA+IAo+ID4gPiBhYXJjaDY0L3BzY2lfdGVzdC5jOiBJbiBmdW5jdGlvbiDi
gJhob3N0X3Rlc3Rfc3lzdGVtX29mZjLigJk6Cj4gPiA+IGFhcmNoNjQvcHNjaV90ZXN0LmM6MjQ3
Ojk6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYdmNwdV9nZXRfcmVn
4oCZCj4gPiA+ICAgMjQ3IHwgICAgICAgICB2Y3B1X2dldF9yZWcodGFyZ2V0LCBLVk1fUkVHX0FS
TV9QU0NJX1ZFUlNJT04sICZwc2NpX3ZlcnNpb24pOwo+ID4gPiAgICAgICB8ICAgICAgICAgXn5+
fn5+fn5+fn5+Cj4gPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhYXJjaDY0L3BzY2lfdGVzdC5j
OjE4Ogo+ID4gPiBpbmNsdWRlL2t2bV91dGlsLmg6NzA1OjI0OiBub3RlOiBkZWNsYXJlZCBoZXJl
Cj4gPiA+ICAgNzA1IHwgc3RhdGljIGlubGluZSB1aW50NjRfdCB2Y3B1X2dldF9yZWcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1aW50NjRfdCBpZCkKPiA+ID4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fgo+ID4gPiBBdCB0b3AgbGV2ZWw6Cj4gPiA+IGNjMTogbm90
ZTogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLVduby1nbnUtdmFyaWFibGUt
c2l6ZWQtdHlwZS1ub3QtYXQKPiA+ID4gLWVuZOKAmSBtYXkgaGF2ZSBiZWVuIGludGVuZGVkIHRv
IHNpbGVuY2UgZWFybGllciBkaWFnbm9zdGljcwo+ID4gPiAKPiA+ID4gc2luY2UgdGhlIHVwZGF0
ZXMgZG9uZSB0byB0aGF0IGZpbGUgZGlkIG5vdCB0YWtlIGFjY291bnQgb2YgNzJiZTVhYTZiZTQK
PiA+ID4gKCJLVk06IHNlbGZ0ZXN0czogQWRkIHRlc3QgZm9yIFBTQ0kgU1lTVEVNX09GRjIiKSB3
aGljaCBoYXMgYmVlbiBtZXJnZWQKPiA+ID4gaW4gdGhlIGt2bS1hcm02NCB0cmVlLgo+ID4gCj4g
PiBCdWdnZXIuICBJbiBoaW5kc2lnaHQsIGl0J3Mgb2J2aW91cyB0aGF0IG9mIGNvdXJzZSBhcmNo
IHNlbGZ0ZXN0cyB3b3VsZCBhZGQgdXNhZ2UKPiA+IG9mIHZjcHVfZ2V0X3JlZygpLgo+ID4gCj4g
PiBVbmxlc3Mgc29tZW9uZSBoYXMgYSBiZXR0ZXIgaWRlYSwgSSdsbCBkcm9wIHRoZSBzZXJpZXMg
ZnJvbSBrdm0teDg2LCBwb3N0IGEgbmV3Cj4gPiB2ZXJzaW9uIHRoYXQgYXBwbGllcyBvbiBsaW51
eC1uZXh0LCBhbmQgdGhlbiByZS1hcHBseSB0aGUgc2VyaWVzIGp1c3QgYmVmb3JlIHRoZQo+ID4g
djYuMTMgbWVyZ2Ugd2luZG93IChyaW5zZSBhbmQgcmVwZWF0IGFzIG5lZWRlZCBpZiBtb3JlIHZj
cHVfZ2V0X3JlZygpIHVzZXJzIGNvbWUKPiA+IGFsb25nKS4KPiAKPiBDYW4geW91IGluc3RlYWQg
anVzdCBwdXNoIG91dCBhIHRvcGljIGJyYW5jaCBhbmQgbGV0IHRoZSBhZmZlY3RlZAo+IG1haW50
YWluZXJzIGRlYWwgd2l0aCBpdD8gVGhpcyBpcyB0aGUgdXN1YWwgd2F5IHdlIGhhbmRsZSBjb25m
bGljdHMKPiBiZXR3ZWVuIHRyZWVzLi4uCgpUaGF0J2Qgd29yayB0b28sIGJ1dCBhcyB5b3Ugbm90
ZSBiZWxvdywgZG9pbmcgdGhhdCBub3cgdGhyb3dzIGEgd3JlbmNoIGluIHRoaW5ncwpiZWNhdXNl
IGVzc2VudGlhbGx5IGFsbCBhcmNoIG1haW50YWluZXJzIHdvdWxkIG5lZWQgbWVyZ2UgdGhhdCB0
b3BpYyBicmFuY2gsCm90aGVyd2lzZSBsaW51eC1uZXh0IHdvdWxkIGVuZCB1cCBpbiB0aGUgc2Ft
ZSBzdGF0ZS4KCj4gPiBUaGF0IHdvdWxkIGJlIGEgZ29vZCBvcHB1cnR1bml0eSB0byBkbyB0aGUg
JChBUkNIKSBkaXJlY3Rvcnkgc3dpdGNoWypdIHRvbywgZS5nLgo+ID4gaGF2ZSBhICJzZWxmdGVz
dHNfbGF0ZSIgb3Igd2hhdGV2ZXIgdG9waWMgYnJhbmNoLgo+IAo+IFRoZSByaWdodCB0aW1lIHRv
IGRvIEtWTS13aWRlIGNoYW5nZXMgKGV2ZW4gc2VsZnRlc3RzKSBpcyAqZWFybHkqIGluIHRoZQo+
IGRldmVsb3BtZW50IGN5Y2xlLCBub3QgbGFzdCBtaW51dGUuIEl0IGdpdmVzIHVzIHBsZW50eSBv
ZiB0aW1lIHRvIGlyb24gb3V0Cj4gdGhlIHdyaW5rbGVzLgoKWWVhaCwgdGhhdCB3YXMgdGhlIG9y
aWdpbmFsIHBsYW4sIHRoZW4gdGhlIHN0dXBpZCBzdHJpY3QgYWxpYXNpbmcgYnVnIGhhcHBlbmVk
LAphbmQgSSBob25lc3RseSBmb3Jnb3QgdGhlIHZjcHVfZ2V0X3JlZygpIGNoYW5nZXMgd291bGQg
bmVlZCB0byBiZSBjb25zdW1lZCBieQpvdGhlciBhcmNoaXRlY3R1cmVzLgoKT3RoZXIgdGhhbiBs
ZXR0aW5nIG1lIGZvcmdldCBhYm91dCB0aGlzIG1lc3MgYSBmZXcgd2Vla3MgZWFybGllciwgdGhl
cmUncyBubwpnb29kIHJlYXNvbiB0byBmb3JjZSB0aGlzIGludG8gNi4xMy4gIFNvLCBJJ2xsIGRy
b3AgdGhlIHNlcmllcyBmcm9tIDYuMTMsIHBvc3QKbmV3IHZlcnNpb25zIG9mIHRoZSB0aGlzIGFu
ZCB0aGUgJChBUkNIKSBzZXJpZXMganVzdCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdywKYW5kIHRo
ZW4gZWl0aGVyIHNlbmQgYSBwdWxsIHJlcXVlc3QgdG8gUGFvbG8gZm9yIDYuMTQgYXMgc29vbiBh
cyB0aGUgNi4xMyBtZXJnZQp3aW5kb3cgY2xvc2VzLCBvciBhc2svYnJpYmUgUGFvbG8gdG8gYXBw
bHkgZXZlcnl0aGluZyBkaXJlY3RseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
