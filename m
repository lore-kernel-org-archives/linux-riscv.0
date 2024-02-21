Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F907C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBz9MvnL/Z5f4G9F90Vs6yavKlvKe5IY8ZfJWnhZjUw=; b=dVDJuHifmXdDgr
	Iyelo1OA9P/jrjsfdvCAD1owL+7oUf1azALn3xgNefsDmbH1+9mqFS7O0qC2BQc+LRnGiwIW5979a
	zfWdq+ekt7EMp1Ofls9ItzCNVjaDRsTO/XS9qYIkZ5+RsFpQI5fitN1muBQ5+RZUHzY9Gr7vIukSp
	NbbVEivaNWqvee8de8L3PEEs0wp3FF8YwQPwDXNggrI3nSIGMR8epM4xwM0TSoyhHTxQf8QRW044u
	HfdX46OXKrFfW4XEn4uxc7uTyVeKf7S+UuIJ4V5eo6I5n9qYC+9dcWYrXaJqklyf8HuURC0Ul1vXh
	PGVwgq6wzwGSGmKqACEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rct3l-00000002Sep-0W80;
	Wed, 21 Feb 2024 20:19:17 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rct3j-00000002SeF-02x1;
	Wed, 21 Feb 2024 20:19:16 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso7881065276.2;
        Wed, 21 Feb 2024 12:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708546753; x=1709151553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC0/jGGGg/HFaRyL81RjL7rrIVZv2xHBQs/cZSwhbtU=;
        b=XSqLWGyPK/xOUOwde6dG4ZB5zEAmVDKiouhGxCmr1QGSen2qcRVa4p1W4FN8lR4PAs
         C8V8K69YAFg5pT7R2ncj9y2Bwv2KALhB6JPZnZ3Em9sheWX8VqIh7TXWXn17pErgkYRG
         +fa7kxjMckWKbVEBkd6rD6xJb8HokO2sHxc2+urKAuA26VRNPKPwOAAnngcPKapc0IXa
         r7s4T8cK6Q0I9kk1rozaD4X809NQlZ7iZBrKDPELdAH6prHClFaav2otT5jua+U2s5f2
         hSKKlXRxY7w/z9D05X4afJQ4hnVK1kArSYbqi/0N2jzjX45k9ST9l2heWZKy6BbbMGSn
         /dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708546753; x=1709151553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC0/jGGGg/HFaRyL81RjL7rrIVZv2xHBQs/cZSwhbtU=;
        b=PbydvBq88mJQ35HLWdVGxRzApJgGxAjNSZagSiTGDBmY7BC0h7YshP7VfWb1q/EAh6
         AQDNeCztf+S0nl07nUIAY++YTyzlR1HSKYvaTUPDRVyu6ax4km9h8JPgZy91FtesojpG
         A5x0AVPLgc6Oag/xmgUhh/xAEo1fvt7pLxrfWhggXjp+InqlwCU/LRutak74SV+egeu0
         YwuAPNbgH3NPLNZ7dWk9J2nhYHp/TgIVRtKdtI5gQqSDNhPTkOtQ752Mq9QAnsJsBfMK
         sMBqVCdn+PvoUYX/MyD2BhoEfZMidTeleGApc3inwY+6zhhKUR2OQo5IyPvSlzdIS7u7
         7Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCXtNfHZINevkSfRJ2QLJtBZYr9oMS1GyhhoVeXka1pp2sCrZ+04Oqi844ZIP7yQcnbRScZZLDOYehSN2gELFarn/5FtogGAQ0rIOzVb9xHK97X5UtGKJF8YQdHb4ZsvjLebmlPOXjs5stgmtPwYAAzmBQ1MyZ8=
X-Gm-Message-State: AOJu0YyCZH6kN4vgyxhDK6lS6XVDX+x9LZUm3xGJ+qKS9YczKUSgeajC
	4XHwnGERAqV66HBiSyNW9z/TIZjZ3uWsUtkxqynYm1TyDddV0p9OYMbCMQkhFpalVEqxmUO644F
	6YxMjoNDRQBKGefozKzBR4hHxs/f8OG6FMdQ=
X-Google-Smtp-Source: AGHT+IH3LQerluMYb9fAN1mFFrYm7uBDz1sUFvXpU3AHFaytahksdyc6iEy7q2HkrUujPZEoOh6XClpzAjLcebGmCEk=
X-Received: by 2002:a25:a543:0:b0:dc7:497e:cddf with SMTP id
 h61-20020a25a543000000b00dc7497ecddfmr380363ybi.33.1708546753425; Wed, 21 Feb
 2024 12:19:13 -0800 (PST)
MIME-Version: 1.0
References: <20240220235415.GP4163@brightrain.aerifal.cx> <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx> <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx> <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx> <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx> <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
 <20240221190639.GU4163@brightrain.aerifal.cx> <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
In-Reply-To: <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Wed, 21 Feb 2024 12:18:37 -0800
Message-ID: <CAMe9rOoUO-D7Uoj9s3eq+w9pJBZ=iucEDpU4hqtJYtPmW5T4dQ@mail.gmail.com>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "dalias@libc.org" <dalias@libc.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>, 
	"musl@lists.openwall.com" <musl@lists.openwall.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "broonie@kernel.org" <broonie@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"debug@rivosinc.com" <debug@rivosinc.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"shuah@kernel.org" <shuah@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>, 
	"oleg@redhat.com" <oleg@redhat.com>, "fweimer@redhat.com" <fweimer@redhat.com>, 
	"keescook@chromium.org" <keescook@chromium.org>, "james.morse@arm.com" <james.morse@arm.com>, 
	"ebiederm@xmission.com" <ebiederm@xmission.com>, "will@kernel.org" <will@kernel.org>, 
	"brauner@kernel.org" <brauner@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ardb@kernel.org" <ardb@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "sorear@fastmail.com" <sorear@fastmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_121915_077369_3CD3A50A 
X-CRM114-Status: GOOD (  26.53  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTE6MjLigK9BTSBFZGdlY29tYmUsIFJpY2sgUAo8cmlj
ay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMDI0LTAyLTIxIGF0
IDE0OjA2IC0wNTAwLCBkYWxpYXNAbGliYy5vcmcgd3JvdGU6Cj4gPiBEdWUgdG8gYXJiaXRyYXJp
bHkgbmVzdGFibGUgc2lnbmFsIGZyYW1lcywgbm8sIHRoaXMgZG9lcyBub3Qgc3VmZmljZS4KPiA+
IEFuIGludGVycnVwdGVkIG9wZXJhdGlvbiB1c2luZyB0aGUgbG9jayBjb3VsZCBiZSBhcmJpdHJh
cmlseSBkZWxheWVkLAo+ID4gZXZlbiBuZXZlciBleGVjdXRlIGFnYWluLCBtYWtpbmcgYW55IGNh
bGwgdG8gZGxvcGVuIGRlYWRsb2NrLgo+Cj4gRG9oISBZZXAsIGl0IGlzIG5vdCByb2J1c3QgdG8g
dGhpcy4gVGhlIG9ubHkgdGhpbmcgdGhhdCBjb3VsZCBiZSBkb25lCj4gd291bGQgYmUgYSB0aW1l
b3V0IGluIGRsb3BlbigpLiBXaGljaCB3b3VsZCBtYWtlIHRoZSB3aG9sZSB0aGluZyBqdXN0Cj4g
YmV0dGVyIHRoYW4gbm90aGluZy4KPgo+ID4KPiA+ID4KPiA+Cj4gPiBJdCdzIGZpbmUgdG8gdHVy
biBSRFNTUCBpbnRvIGFuIGFjdHVhbCBlbXVsYXRlZCByZWFkIG9mIHRoZSBTU1AsIG9yCj4gPiBh
dAo+ID4gbGVhc3QgYW4gZW11bGF0ZWQgbG9hZCBvZiB6ZXJvIHNvIHRoYXQgdW5pbml0aWFsaXpl
ZCBkYXRhIGlzIG5vdCBsZWZ0Cj4gPiBpbiB0aGUgdGFyZ2V0IHJlZ2lzdGVyLgo+Cj4gV2UgY2Fu
J3QgaW50ZXJjZXB0IFJEU1NQLCBidXQgaXQgYmVjb21lcyBhIE5PUCBieSBkZWZhdWx0LiAoZGlz
Y2xhaW1lcgo+IHg4Ni1vbmx5IGtub3dsZWRnZSkuCj4KPiA+ICBJZiBkb2luZyB0aGUgbGF0dGVy
LCBjb2RlIHdvcmtpbmcgd2l0aCB0aGUKPiA+IHNoYWRvdyBzdGFjayBqdXN0IG5lZWRzIHRvIGJl
IHByZXBhcmVkIGZvciB0aGUgcG9zc2liaWxpdHkgdGhhdCBpdAo+ID4gY291bGQgYmUgYXN5bmMt
ZGlzYWJsZWQsIGFuZCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlLgo+ID4KPiA+IEkgaGF2ZSBub3Qg
bG9va2VkIGF0IGFsbCB0aGUgaW5zdHJ1Y3Rpb25zIHRoYXQgYmVjb21lICNVRCBidXQgSQo+ID4g
c3VzcGVjdCB0aGV5IGFsbCBoYXZlIHJlYXNvbmFibGUgdHJpdmlhbCB3YXlzIHRvIGltcGxlbWVu
dCBhCj4gPiAiZGlzYWJsZWQiIHZlcnNpb24gb2YgdGhlbSB0aGF0IHVzZXJzcGFjZSBjYW4gYWN0
IHVwb24gcmVhc29uYWJseS4KPgo+IFRoaXMgd291bGQgaGF2ZSB0byBiZSB0aG91Z2h0IHRocm91
Z2ggZnVuY3Rpb25hbGx5IGFuZCBwZXJmb3JtYW5jZQo+IHdpc2UuIEknbSBub3Qgb3Bwb3NlZCBp
ZiBjYW4gY29tZSB1cCB3aXRoIGEgZnVsbHkgZmxlc2hlZCBvdXQgcGxhbi4gSG93Cj4gc2VyaW91
cyBhcmUgeW91IGluIHB1cnN1aW5nIG11c2wgc3VwcG9ydCwgaWYgd2UgaGFkIHNvbWV0aGluZyBs
aWtlCj4gdGhpcz8KPgo+IEhKLCBhbnkgdGhvdWdodHMgb24gd2hldGhlciBnbGliYyB3b3VsZCB1
c2UgdGhpcyBhcyB3ZWxsPwoKQXNzdW1pbmcgdGhhdCB3ZSBhcmUgdGFsa2luZyBhYm91dCBwZXJt
aXNzaXZlIG1vZGUsICBpZiBrZXJuZWwgY2FuCnN1cHByZXNzIFVELCB3ZSBkb24ndCBuZWVkIHRv
IGRpc2FibGUgU0hTVEsuICAgR2xpYmMgY2FuIGVuYWJsZQpBUkNIX1NIU1RLX1NVUFBSRVNTX1VE
IGluc3RlYWQuCgo+IEl0IGlzIHByb2JhYmx5IHdvcnRoIG1lbnRpb25pbmcgdGhhdCBmcm9tIHRo
ZSBzZWN1cml0eSBzaWRlIChhcyBNYXJrCj4gbWVudGlvbmVkIHRoZXJlIGlzIGFsd2F5cyB0ZW5z
aW9uIGluIHRoZSB0cmFkZW9mZnMgb24gdGhlc2UgZmVhdHVyZXMpLAo+IHBlcm1pc3NpdmUgbW9k
ZSBpcyBzZWVuIGJ5IHNvbWUgYXMgc29tZXRoaW5nIHRoYXQgd2Vha2VucyBzZWN1cml0eSB0b28K
PiBtdWNoLiBBcHBzIGNvdWxkIGNhbGwgZGxvcGVuKCkgb24gYSBrbm93biB1bnN1cHBvcnRlZCBE
U08gYmVmb3JlIGRvaW5nCj4gUk9QLiBJIGRvbid0IGtub3cgaWYgeW91IGhhdmUgYW55IG11c2wg
dXNlcnMgd2l0aCBzcGVjaWZpYyBzaGFkb3cgc3RhY2sKPiB1c2UgY2FzZXMgdG8gYXNrIGFib3V0
IHRoaXMuCgoKCi0tIApILkouCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
