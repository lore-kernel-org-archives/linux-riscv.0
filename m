Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD1C7619A
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Apr 2023 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0Uz/dbLStxecN+habvLoLU1Be3cSm+VowFdwBuLUiU=; b=FpCuogP5hxfH9n
	3//dZktJRb43J8VhdPb83LypCIALK5xLIDHcY7QIlwA79yTI+sSJMmsOwnZ21j1GFZDKNUgL7u4uI
	fqdnPXtH0AHXx9GDVl2bw456wsRyT0IEJqWZ+TDlmrqUY6X+EX1jWRTGaUw4Kx4WqqLZSW7AHo45T
	ovbhaEiKwCeudKoBW2ACAkabBAEgI6ECCo85xWettmb1pHpJ7LZDaTNdHOuCT3dtw0QQooc+qwN0g
	zHMxsZgbQ+pV+FpGrU3Ok3SmqSEl5W1/g8ZVhfWJVPwuTZrC2rx9N4civjEm6vHHe3jJg6ALv+VsJ
	QnFdLu/i4q5nmabyCT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnfUP-00CD9i-16;
	Sat, 15 Apr 2023 12:58:49 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnfUL-00CD8b-0I;
	Sat, 15 Apr 2023 12:58:46 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-552ae3e2cbeso6512717b3.13;
        Sat, 15 Apr 2023 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681563521; x=1684155521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccV6fJmLsZscVpXweMcEv4sovH+IDrkvejv50k6gs/U=;
        b=BSOaYfaXyd5Wb+epLfvjrJB5ddMbSfuRSPgkDv/0OOsO8ij2hFGojnuviqXm0GCrkP
         ID2hBr77xwAaGcKnrXJiZAUdBojhzD8cglmd8qXgd51iUqdS7A9NAWUQz0MUF5ZcciE8
         AWz1SY3aKamn3My6fXKs/8E5eqVabut4SfZKc0c5sbIlrZyG34ztRaxzO3zCWgWJeeks
         vL5yfHXHE0t7DNIuTqx162KoYvLaNpuXLEhcNNNv20NmCKzlwGF6mcKsLN10ua6WOBit
         5o9zCg+9j1R+WkmMZNRoFuK0k+WfhwAjMsbRMXWBbGHiHnx9KcILf1NV5DEtKeNZyNxV
         c60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681563521; x=1684155521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccV6fJmLsZscVpXweMcEv4sovH+IDrkvejv50k6gs/U=;
        b=Zqhtu9IHNvRoV4dbA4xMGLbpFyH15G9AAIWS+l1cj6hI9YP4l0zuuc4ybhjZcgYNHT
         ea7AzlGmckk1HvEln+tBTWPvhvnf535c4/3HoFdlDYEBdqiv21n5ch1az0Nxz8zkL5VY
         +vWUrEubSn//FNmBUzZD/wcOSDxHhIWvkgtZSxcg+Hz5dJ+p+NpbVu0cCaFj4FymQw4Y
         w+XrVsx/G4wU6EIRcRRNDAE51T6t9YMxTvVNtbxhkEe4xJe3Y/UCJy9Xu6SG6Iz0ridF
         dtffSpqDb55/d+iqewIUGrHzPdTL04gAbGH4iNBJ8XapmqYdmdvBOYV1U9a75sHbF0od
         FzLg==
X-Gm-Message-State: AAQBX9eT0QfAS52OyudaIkaP6h1ad2s8r2pWqKqxA1v82m4t6vVBsnhA
	c1wzW4yiXlGvqGYF7z1s4QSCS/d/39ZiM4z85Q==
X-Google-Smtp-Source: AKy350bkbiaOTV48G/m6wg5f7oTu79ZcJL2xRJuRL2it4F9Xsb2JgTwgmruSWgxfXHK3zLR53InjScARyCku/VQAIuk=
X-Received: by 2002:a81:b245:0:b0:54f:b721:5325 with SMTP id
 q66-20020a81b245000000b0054fb7215325mr5587058ywh.1.1681563521186; Sat, 15 Apr
 2023 05:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230414225551.858160935@linutronix.de> <20230414232310.382005483@linutronix.de>
In-Reply-To: <20230414232310.382005483@linutronix.de>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 15 Apr 2023 08:58:30 -0400
Message-ID: <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
Subject: Re: [patch 19/37] x86/smpboot: Switch to hotplug core state synchronization
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	David Woodhouse <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_055845_157447_F011C3D8 
X-CRM114-Status: GOOD (  27.03  )
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

T24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNzo0NOKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IFRoZSBuZXcgQVAgc3RhdGUgdHJhY2tpbmcgYW5kIHN5
bmNocm9uaXphdGlvbiBtZWNoYW5pc20gaW4gdGhlIENQVSBob3RwbHVnCj4gY29yZSBjb2RlIGFs
bG93cyB0byByZW1vdmUgcXVpdGUgc29tZSB4ODYgc3BlY2lmaWMgY29kZToKPgo+ICAgMSkgVGhl
IEFQIGFsaXZlIHN5bmNocm9uaXphdGlvbiBiYXNlZCBvbiBjcHVtYXNrcwo+Cj4gICAyKSBUaGUg
ZGVjaXNpb24gd2hldGhlciBhbiBBUCBjYW4gYmUgYnJvdWdodCB1cCBhZ2Fpbgo+Cj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gLS0tCj4gIGFyY2gveDg2L0tjb25maWcgICAgICAgICAgIHwgICAgMQo+ICBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS9zbXAuaCB8ICAgIDcgKwo+ICBhcmNoL3g4Ni9rZXJuZWwvc21wLmMgICAgICB8
ICAgIDEKPiAgYXJjaC94ODYva2VybmVsL3NtcGJvb3QuYyAgfCAgMTU5ICsrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3g4Ni94ZW4vc21wX2h2bS5j
ICAgICB8ICAgMTYgKy0tLQo+ICBhcmNoL3g4Ni94ZW4vc21wX3B2LmMgICAgICB8ICAgMzkgKysr
KysrLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAxNTEgZGVsZXRp
b25zKC0pCj4KPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4gKysrIGIvYXJjaC94ODYvS2NvbmZp
Zwo+IEBAIC0yNzIsNiArMjcyLDcgQEAgY29uZmlnIFg4Ngo+ICAgICAgICAgc2VsZWN0IEhBVkVf
VU5TVEFCTEVfU0NIRURfQ0xPQ0sKPiAgICAgICAgIHNlbGVjdCBIQVZFX1VTRVJfUkVUVVJOX05P
VElGSUVSCj4gICAgICAgICBzZWxlY3QgSEFWRV9HRU5FUklDX1ZEU08KPiArICAgICAgIHNlbGVj
dCBIT1RQTFVHX0NPUkVfU1lOQ19GVUxMICAgICAgICAgICBpZiBTTVAKPiAgICAgICAgIHNlbGVj
dCBIT1RQTFVHX1NNVCAgICAgICAgICAgICAgICAgICAgICBpZiBTTVAKPiAgICAgICAgIHNlbGVj
dCBJUlFfRk9SQ0VEX1RIUkVBRElORwo+ICAgICAgICAgc2VsZWN0IE5FRURfUEVSX0NQVV9FTUJF
RF9GSVJTVF9DSFVOSwo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NtcC5oCj4gKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vc21wLmgKPiBAQCAtMzgsNiArMzgsOCBAQCBzdHJ1Y3Qgc21w
X29wcyB7Cj4gICAgICAgICB2b2lkICgqY3Jhc2hfc3RvcF9vdGhlcl9jcHVzKSh2b2lkKTsKPiAg
ICAgICAgIHZvaWQgKCpzbXBfc2VuZF9yZXNjaGVkdWxlKShpbnQgY3B1KTsKPgo+ICsgICAgICAg
dm9pZCAoKmNsZWFudXBfZGVhZF9jcHUpKHVuc2lnbmVkIGNwdSk7Cj4gKyAgICAgICB2b2lkICgq
cG9sbF9zeW5jX3N0YXRlKSh2b2lkKTsKPiAgICAgICAgIGludCAoKmNwdV91cCkodW5zaWduZWQg
Y3B1LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKTsKPiAgICAgICAgIGludCAoKmNwdV9kaXNh
YmxlKSh2b2lkKTsKPiAgICAgICAgIHZvaWQgKCpjcHVfZGllKSh1bnNpZ25lZCBpbnQgY3B1KTsK
PiBAQCAtOTAsNyArOTIsOCBAQCBzdGF0aWMgaW5saW5lIGludCBfX2NwdV9kaXNhYmxlKHZvaWQp
Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIF9fY3B1X2RpZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICB7
Cj4gLSAgICAgICBzbXBfb3BzLmNwdV9kaWUoY3B1KTsKPiArICAgICAgIGlmIChzbXBfb3BzLmNw
dV9kaWUpCj4gKyAgICAgICAgICAgICAgIHNtcF9vcHMuY3B1X2RpZShjcHUpOwo+ICB9Cj4KPiAg
c3RhdGljIGlubGluZSB2b2lkIHBsYXlfZGVhZCh2b2lkKQo+IEBAIC0xMjIsOCArMTI1LDYgQEAg
dm9pZCBuYXRpdmVfc21wX2NwdXNfZG9uZSh1bnNpZ25lZCBpbnQgbQo+ICBpbnQgY29tbW9uX2Nw
dV91cCh1bnNpZ25lZCBpbnQgY3B1bnVtLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKTsKPiAg
aW50IG5hdGl2ZV9jcHVfdXAodW5zaWduZWQgaW50IGNwdW51bSwgc3RydWN0IHRhc2tfc3RydWN0
ICp0aWRsZSk7Cj4gIGludCBuYXRpdmVfY3B1X2Rpc2FibGUodm9pZCk7Cj4gLWludCBjb21tb25f
Y3B1X2RpZSh1bnNpZ25lZCBpbnQgY3B1KTsKPiAtdm9pZCBuYXRpdmVfY3B1X2RpZSh1bnNpZ25l
ZCBpbnQgY3B1KTsKPiAgdm9pZCBobHRfcGxheV9kZWFkKHZvaWQpOwo+ICB2b2lkIG5hdGl2ZV9w
bGF5X2RlYWQodm9pZCk7Cj4gIHZvaWQgcGxheV9kZWFkX2NvbW1vbih2b2lkKTsKPiAtLS0gYS9h
cmNoL3g4Ni9rZXJuZWwvc21wLmMKPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc21wLmMKPiBAQCAt
MjY5LDcgKzI2OSw2IEBAIHN0cnVjdCBzbXBfb3BzIHNtcF9vcHMgPSB7Cj4gICAgICAgICAuc21w
X3NlbmRfcmVzY2hlZHVsZSAgICA9IG5hdGl2ZV9zbXBfc2VuZF9yZXNjaGVkdWxlLAo+Cj4gICAg
ICAgICAuY3B1X3VwICAgICAgICAgICAgICAgICA9IG5hdGl2ZV9jcHVfdXAsCj4gLSAgICAgICAu
Y3B1X2RpZSAgICAgICAgICAgICAgICA9IG5hdGl2ZV9jcHVfZGllLAo+ICAgICAgICAgLmNwdV9k
aXNhYmxlICAgICAgICAgICAgPSBuYXRpdmVfY3B1X2Rpc2FibGUsCj4gICAgICAgICAucGxheV9k
ZWFkICAgICAgICAgICAgICA9IG5hdGl2ZV9wbGF5X2RlYWQsCj4KPiAtLS0gYS9hcmNoL3g4Ni9r
ZXJuZWwvc21wYm9vdC5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3NtcGJvb3QuYwo+IEBAIC01
Nyw2ICs1Nyw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9wZ3RhYmxlLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9vdmVyZmxvdy5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2NwdWhvdHBsdWcuaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2FjcGkuaD4K
PiAgI2luY2x1ZGUgPGFzbS9jYWNoZWluZm8uaD4KPiBAQCAtMTAxLDkgKzEwMiw2IEBAIEVYUE9S
VF9QRVJfQ1BVX1NZTUJPTChjcHVfZGllX21hcCk7Cj4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9T
VExZKHN0cnVjdCBjcHVpbmZvX3g4NiwgY3B1X2luZm8pOwo+ICBFWFBPUlRfUEVSX0NQVV9TWU1C
T0woY3B1X2luZm8pOwo+Cj4gLS8qIEFsbCBvZiB0aGVzZSBtYXNrcyBhcmUgaW5pdGlhbGl6ZWQg
aW4gc2V0dXBfY3B1X2xvY2FsX21hc2tzKCkgKi8KPiAtc3RhdGljIGNwdW1hc2tfdmFyX3QgY3B1
X2luaXRpYWxpemVkX21hc2s7Cj4gLXN0YXRpYyBjcHVtYXNrX3Zhcl90IGNwdV9jYWxsb3V0X21h
c2s7Cj4gIC8qIFJlcHJlc2VudGluZyBDUFVzIGZvciB3aGljaCBzaWJsaW5nIG1hcHMgY2FuIGJl
IGNvbXB1dGVkICovCj4gIHN0YXRpYyBjcHVtYXNrX3Zhcl90IGNwdV9zaWJsaW5nX3NldHVwX21h
c2s7Cj4KPiBAQCAtMTY5LDggKzE2Nyw4IEBAIHN0YXRpYyB2b2lkIHNtcF9jYWxsaW4odm9pZCkK
PiAgICAgICAgIGludCBjcHVpZCA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPgo+ICAgICAgICAgLyoK
PiAtICAgICAgICAqIElmIHdha2VuIHVwIGJ5IGFuIElOSVQgaW4gYW4gODI0ODlEWCBjb25maWd1
cmF0aW9uCj4gLSAgICAgICAgKiBjcHVfY2FsbG91dF9tYXNrIGd1YXJhbnRlZXMgd2UgZG9uJ3Qg
Z2V0IGhlcmUgYmVmb3JlIGFuCj4gKyAgICAgICAgKiBJZiB3YWtlbiB1cCBieSBhbiBJTklUIGlu
IGFuIDgyNDg5RFggY29uZmlndXJhdGlvbiB0aGUgYWxpdmUKPiArICAgICAgICAqIHN5bmNocm9u
aXphdGlvbiBndWFyYW50ZWVzIHdlIGRvbid0IGdldCBoZXJlIGJlZm9yZSBhbgo+ICAgICAgICAg
ICogSU5JVF9kZWFzc2VydCBJUEkgcmVhY2hlcyBvdXIgbG9jYWwgQVBJQywgc28gaXQgaXMgbm93
IHNhZmUgdG8KPiAgICAgICAgICAqIHRvdWNoIG91ciBsb2NhbCBBUElDLgo+ICAgICAgICAgICoK
PiBAQCAtMjE2LDE3ICsyMTQsNiBAQCBzdGF0aWMgdm9pZCBhcF9jYWxpYnJhdGVfZGVsYXkodm9p
ZCkKPiAgICAgICAgIGNwdV9kYXRhKHNtcF9wcm9jZXNzb3JfaWQoKSkubG9vcHNfcGVyX2ppZmZ5
ID0gbG9vcHNfcGVyX2ppZmZ5Owo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgd2FpdF9mb3JfbWFzdGVy
X2NwdShpbnQgY3B1KQo+IC17Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogV2FpdCBmb3IgcmVs
ZWFzZSBieSBjb250cm9sIENQVSBiZWZvcmUgY29udGludWluZyB3aXRoIEFQCj4gLSAgICAgICAg
KiBpbml0aWFsaXphdGlvbi4KPiAtICAgICAgICAqLwo+IC0gICAgICAgV0FSTl9PTihjcHVtYXNr
X3Rlc3RfYW5kX3NldF9jcHUoY3B1LCBjcHVfaW5pdGlhbGl6ZWRfbWFzaykpOwo+IC0gICAgICAg
d2hpbGUgKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgY3B1X2NhbGxvdXRfbWFzaykpCj4gLSAgICAg
ICAgICAgICAgIGNwdV9yZWxheCgpOwo+IC19Cj4gLQo+ICAvKgo+ICAgKiBBY3RpdmF0ZSBhIHNl
Y29uZGFyeSBwcm9jZXNzb3IuCj4gICAqLwo+IEBAIC0yNDcsMTEgKzIzNCwxMCBAQCBzdGF0aWMg
dm9pZCBub3RyYWNlIHN0YXJ0X3NlY29uZGFyeSh2b2lkCj4gICAgICAgICBjcHVfaW5pdF9leGNl
cHRpb25faGFuZGxpbmcoKTsKPgo+ICAgICAgICAgLyoKPiAtICAgICAgICAqIFN5bmMgcG9pbnQg
d2l0aCB3YWl0X2NwdV9pbml0aWFsaXplZCgpLiBTZXRzIEFQIGluCj4gLSAgICAgICAgKiBjcHVf
aW5pdGlhbGl6ZWRfbWFzayBhbmQgdGhlbiB3YWl0cyBmb3IgdGhlIGNvbnRyb2wgQ1BVCj4gLSAg
ICAgICAgKiB0byByZWxlYXNlIGl0Lgo+ICsgICAgICAgICogU3luYyBwb2ludCB3aXRoIHRoZSBo
b3RwbHVnIGNvcmUuIFNldHMgdGhlIHN5bmMgc3RhdGUgdG8gQUxJVkUKPiArICAgICAgICAqIGFu
ZCB3YWl0cyBmb3IgdGhlIGNvbnRyb2wgQ1BVIHRvIHJlbGVhc2UgaXQuCj4gICAgICAgICAgKi8K
PiAtICAgICAgIHdhaXRfZm9yX21hc3Rlcl9jcHUocmF3X3NtcF9wcm9jZXNzb3JfaWQoKSk7Cj4g
KyAgICAgICBjcHVocF9hcF9zeW5jX2FsaXZlKCk7Cj4KPiAgICAgICAgIGNwdV9pbml0KCk7Cj4g
ICAgICAgICByY3VfY3B1X3N0YXJ0aW5nKHJhd19zbXBfcHJvY2Vzc29yX2lkKCkpOwo+IEBAIC0y
ODUsNyArMjcxLDYgQEAgc3RhdGljIHZvaWQgbm90cmFjZSBzdGFydF9zZWNvbmRhcnkodm9pZAo+
ICAgICAgICAgc2V0X2NwdV9vbmxpbmUoc21wX3Byb2Nlc3Nvcl9pZCgpLCB0cnVlKTsKPiAgICAg
ICAgIGxhcGljX29ubGluZSgpOwo+ICAgICAgICAgdW5sb2NrX3ZlY3Rvcl9sb2NrKCk7Cj4gLSAg
ICAgICBjcHVfc2V0X3N0YXRlX29ubGluZShzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ICAgICAgICAg
eDg2X3BsYXRmb3JtLm5taV9pbml0KCk7Cj4KPiAgICAgICAgIC8qIGVuYWJsZSBsb2NhbCBpbnRl
cnJ1cHRzICovCj4gQEAgLTczNiw5ICs3MjEsMTAgQEAgc3RhdGljIHZvaWQgaW1wcmVzc19mcmll
bmRzKHZvaWQpCj4gICAgICAgICAgKiBBbGxvdyB0aGUgdXNlciB0byBpbXByZXNzIGZyaWVuZHMu
Cj4gICAgICAgICAgKi8KPiAgICAgICAgIHByX2RlYnVnKCJCZWZvcmUgYm9nb21pcHNcbiIpOwo+
IC0gICAgICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkKPiAtICAgICAgICAgICAgICAgaWYg
KGNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjcHVfY2FsbG91dF9tYXNrKSkKPiArICAgICAgIGZvcl9l
YWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKPiArICAgICAgICAgICAgICAgaWYgKGNwdW1hc2tfdGVz
dF9jcHUoY3B1LCBjcHVfb25saW5lX21hc2spKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJv
Z29zdW0gKz0gY3B1X2RhdGEoY3B1KS5sb29wc19wZXJfamlmZnk7CgpUaGlzIHNob3VsZCBiZSB0
aGUgc2FtZSBhcyBmb3JfZWFjaF9vbmxpbmVfY3B1KCkuCgotLQpCcmlhbiBHZXJzdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
