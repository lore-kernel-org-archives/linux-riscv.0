Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683F4CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/qoMRE1vi11Zuhe4l1j99YSHLSz5fh33wcsaq+ocs00=; b=Ep2kzU0JLIBE4SheYD4ru50QMH
	vM4/OUrAPVB4BUXYd6+3fvwt1BugLEexCCPAq1aW4MSOFfUT58RYo2icvpOKLzfxG690ZkGltG04j
	OUl9S/4lMXaYWsu3hPsUxcfiu/NVUzWjHZoMeJi4rE/eKLc1I5mMpmlYVwlmZT93NL2ljMFlfEOHO
	Sub27aOLiAyfYrs9r3GxZrwr2ge62eCS8+yd8f4s5sP5pgBls6uNtAGBOtmNM0oOJn65f1nwdB7xv
	b2xQ+cqEgtJgUHEJHDuq3oxojMgcSFKEwUfayuj5YoQTK3Em31MEQK6dvIi2buDTNcb51EbOaxkPL
	5H6etwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nq-00000008OAm-2QTd;
	Tue, 09 Sep 2025 16:02:42 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvybA-00000007T3x-2TK3
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 13:41:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e751508f3aso481640f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757425285; x=1758030085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGCVFLl/bZU4VqXRso3PPgDeP8aVgDKQ3+zbC69nRRQ=;
        b=VP6L4AOYTI/d15F9D5eDBhOYG5jeFa4W432UIhGKA015u/viHYrL/Bc1JoEyf1w076
         +aSmK6yarnG4P78QVG4xFxgrHICWIJADOabMkJW03gMTQY+ZCVMGcX0KPtR8ByEbCWck
         Ph0KlzJGLqa+9MaCOfAa6Awjc8g3F33pD/KZKaF11ZtBlqufurb6ShVkS0t52Vvu458D
         zLqzo3FS7ia1nZv09/EpmXPtrIEWLMB0OMkUp8MQw385D+jbBhchDBFKm1V2zTuH33ZW
         je2p0duEiokhj96eYv5AOdvk4DMVswsyzHdzKoaQtkUYwDiRUFwiPXHYVdyEgW7uEOpK
         QHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425285; x=1758030085;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vGCVFLl/bZU4VqXRso3PPgDeP8aVgDKQ3+zbC69nRRQ=;
        b=Fuybm8wOG20eYKXUH9RytlTgaemb2+EJ77PpxcMsDXnktT9tjsSG6SWJ4rZpjd05ms
         EN4uTSk4ftHtCSd7va52GtdLMya4c13YzHFuvOBVbwT5TwvyBdD8vPFvMFBGbbqcoxp6
         fkeJEUIwPgRe8cDKP0wF2eCNfvh9HcRSwzbsNSv0AEjoOBYRR2OCGEPpX0MCd84nn1JE
         g5NpCTxz4bhabsIhxp5J9KXxiurN2oNxzLmT3CLb/69WbVeKtK6YjPiuzZniKesPpKxc
         cMCj5kpb0hGPeb81MNBUquTkvUYp+GdAYipcEUsTMoXSRkEsB9TE2OMnKICpoVYwOlye
         M5yw==
X-Forwarded-Encrypted: i=1; AJvYcCVuAO4IlG9+A9oVsDOh8FVJc6F6HcJ5WjHon2Vnep0O6GilwuMhx8/HqOc0tF9jvnqZmBVGrp1B4ofe5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2ZCKbSy2K4LQvX9q1UWUnQ85TwKnhITO7GS5VYIsGkjv0HA4
	vq1OiFvoBWNYxd+iMwcwCv/JMuiWLdyxloVPPA1kwBY0ExE2W5GVdNNGGLDe4M0fzPyCIEloLNv
	qUV9fk9aDlGVqJcY5hQ==
X-Google-Smtp-Source: AGHT+IE/mmAbQTOt8MvZZNGslJ2H2GmSSbN9MpzaubBetSPclclKq6OgKdnhJfvpCbHxNnnHv8DltcQ3KGr2Jow=
X-Received: from wrwa18.prod.google.com ([2002:a5d:53d2:0:b0:3d7:c499:56f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f87:b0:3d7:df92:5e31 with SMTP id ffacd0b85a97d-3e641e3b09amr11045695f8f.16.1757425285136;
 Tue, 09 Sep 2025 06:41:25 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:41:24 +0000
In-Reply-To: <202509082009.4A8DC97BD2@keescook>
Mime-Version: 1.0
References: <20250908-distill-lint-1ae78bcf777c@spud> <202509082009.4A8DC97BD2@keescook>
Message-ID: <aMAuhKfrYRlkTHSy@google.com>
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
From: Alice Ryhl <aliceryhl@google.com>
To: Kees Cook <kees@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Matthew Maurer <mmaurer@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064128_645907_708653C7 
X-CRM114-Status: GOOD (  29.80  )
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

T24gTW9uLCBTZXAgMDgsIDIwMjUgYXQgMDg6MTE6NDhQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIE1vbiwgU2VwIDA4LCAyMDI1IGF0IDAyOjEyOjM1UE0gKzAxMDAsIENvbm9yIERvb2xl
eSB3cm90ZToKPiA+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gPiAKPiA+IFRoZSBrZXJuZWwgdXNlcyB0aGUgc3RhbmRhcmQgcnVzdGMgdGFyZ2V0cyBm
b3Igbm9uLXg4NiB0YXJnZXRzLCBhbmQgb3V0Cj4gPiBvZiB0aG9zZSBvbmx5IDY0LWJpdCBhcm0n
cyB0YXJnZXQgaGFzIGtjZmkgc3VwcG9ydCBlbmFibGVkLiBGb3IgeDg2LCB0aGUKPiA+IGN1c3Rv
bSA2NC1iaXQgdGFyZ2V0IGVuYWJsZXMga2NmaS4KPiA+IAo+ID4gVGhlIEhBVkVfQ0ZJX0lDQUxM
X05PUk1BTElaRV9JTlRFR0VSU19SVVNUQyBjb25maWcgb3B0aW9uIHRoYXQgYWxsb3dzCj4gPiBD
RklfQ0xBTkcgdG8gYmUgdXNlZCBpbiBjb21iaW5hdGlvbiB3aXRoIFJVU1QgZG9lcyBub3QgY2hl
Y2sgd2hldGhlciB0aGUKPiA+IHJ1c3RjIHRhcmdldCBzdXBwb3J0cyBrY2ZpLiBUaGlzIGJyZWFr
cyB0aGUgYnVpbGQgb24gcmlzY3YgKGFuZAo+ID4gcHJlc3VtYWJseSAzMi1iaXQgYXJtKSB3aGVu
IENGSV9DTEFORyBhbmQgUlVTVCBhcmUgZW5hYmxlZCBhdCB0aGUgc2FtZQo+ID4gdGltZS4KPiA+
IAo+ID4gT3JkaW5hcmlseSwgYSBydXN0Yy1vcHRpb24gY2hlY2sgd291bGQgYmUgdXNlZCB0byBk
ZXRlY3QgdGFyZ2V0IHN1cHBvcnQKPiA+IGJ1dCB1bmZvcnR1bmF0ZWx5IHJ1c3RjLW9wdGlvbiBm
aWx0ZXJzIG91dCB0aGUgdGFyZ2V0IGZvciByZWFzb25zIGdpdmVuCj4gPiBpbiBjb21taXQgNDZl
MjRhNTQ1Y2RiNCAoInJ1c3Q6IGthc2FuL2tidWlsZDogZml4IG1pc3NpbmcgZmxhZ3Mgb24gZmly
c3QKPiA+IGJ1aWxkIikuIEFzIGEgcmVzdWx0LCBpZiB0aGUgaG9zdCBzdXBwb3J0cyBrY2ZpIGJ1
dCB0aGUgdGFyZ2V0IGRvZXMgbm90LAo+ID4gZS5nLiB3aGVuIGJ1aWxkaW5nIGZvciByaXNjdiBv
biB4ODZfNjQsIHRoZSBidWlsZCB3b3VsZCByZW1haW4gYnJva2VuLgo+ID4gCj4gPiBJbnN0ZWFk
LCBtYWtlIEhBVkVfQ0ZJX0lDQUxMX05PUk1BTElaRV9JTlRFR0VSU19SVVNUQyBkZXBlbmQgb24g
dGhlIG9ubHkKPiA+IHR3byBhcmNoaXRlY3R1cmVzIHdoZXJlIHRoZSB0YXJnZXQgdXNlZCBzdXBw
b3J0cyBpdCB0byBmaXggdGhlIGJ1aWxkLgo+IAo+IEknbSBnZW5lcmFsbHkgZmluZSB3aXRoIHRo
aXMsIGJ1dCBub3JtYWxseSB3ZSBkbyBhcmNoLXNwZWNpZmljIHN0dWZmCj4gb25seSBpbiBhcmNo
LyRhcmNoL0tjb25maWcsIGFuZCBleHBvc2Ugc29tZSBraW5kIG9mCj4gQVJDSF9IQVNfQ0ZJX0lD
QUxMX05PUk1BTElaRV9JTlRFR0VSUyB0aGF0IHdvdWxkIGdldCB0ZXN0ZWQgaGVyZS4gU2hvdWxk
Cj4gd2UgZG8gdGhhdCBoZXJlIHRvbz8KCkknbSB0aGlua2luZyBpbiB0aGlzIGNhc2UgaXQgbWFr
ZXMgc2Vuc2UgdG8ga2VlcCB0aGlzIHBhdGNoIHNpbXBsZSBhcwppdCdzIGEgZml4LiBPbmNlIHJ1
c3RjIHN1cHBvcnRzIGNmaSBvbiByaXNjdiAod2hpY2ggc2hvdWxkIHJlYWxseSBqdXN0CmJlIGNo
YW5naW5nIHRoZSB0YXJnZXQgdG8gbGlzdCBpdCBhcyBzdXBwb3J0ZWQpLCB3ZSBjYW4gcmVvcmdh
bml6ZSBpdCB0bwptYXRjaCB3aGF0IHlvdSdyZSBkZXNjcmliaW5nIGF0IHRoYXQgcG9pbnQuCgo+
ID4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IEZpeGVzOiBjYTYyN2U2MzY1NTFlICgi
cnVzdDogY2ZpOiBhZGQgc3VwcG9ydCBmb3IgQ0ZJX0NMQU5HIHdpdGggUnVzdCIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4g
LS0tCj4gPiBDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+ID4g
Q0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPiBDQzogQWxleGFuZHJl
IEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+ID4gQ0M6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVs
Lm9yZz4KPiA+IENDOiBBbGV4IEdheW5vciA8YWxleC5nYXlub3JAZ21haWwuY29tPgo+ID4gQ0M6
IEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21haWwuY29tPgo+ID4gQ0M6IEdhcnkgR3VvIDxnYXJ5
QGdhcnlndW8ubmV0Pgo+ID4gQ0M6ICJCasO2cm4gUm95IEJhcm9uIiA8Ympvcm4zX2doQHByb3Rv
bm1haWwuY29tPgo+ID4gQ0M6IEJlbm5vIExvc3NpbiA8bG9zc2luQGtlcm5lbC5vcmc+Cj4gPiBD
QzogQW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPgo+ID4gQ0M6IEFsaWNl
IFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPgo+ID4gQ0M6IFRyZXZvciBHcm9zcyA8dG1ncm9z
c0B1bWljaC5lZHU+Cj4gPiBDQzogRGFuaWxvIEtydW1tcmljaCA8ZGFrckBrZXJuZWwub3JnPgo+
ID4gQ0M6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgo+ID4gQ0M6IFNhbWkgVG9sdmFuZW4g
PHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPgo+ID4gQ0M6IE1hdHRoZXcgTWF1cmVyIDxtbWF1cmVy
QGdvb2dsZS5jb20+Cj4gPiBDQzogIlBldGVyIFppamxzdHJhIChJbnRlbCkiIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4KPiA+IENDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiBDQzog
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gQ0M6IHJ1c3QtZm9yLWxpbnV4QHZn
ZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgYXJjaC9LY29uZmlnIHwgMSArCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL0tjb25m
aWcgYi9hcmNoL0tjb25maWcKPiA+IGluZGV4IGQxYjRmZmQ2ZTA4NTYuLjg4MGNkZGZmNWVkYTcg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL0tjb25maWcKPiA+ICsrKyBiL2FyY2gvS2NvbmZpZwo+ID4g
QEAgLTkxNyw2ICs5MTcsNyBAQCBjb25maWcgSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lOVEVH
RVJTX1JVU1RDCj4gPiAgCWRlZl9ib29sIHkKPiA+ICAJZGVwZW5kcyBvbiBIQVZFX0NGSV9JQ0FM
TF9OT1JNQUxJWkVfSU5URUdFUlNfQ0xBTkcKPiA+ICAJZGVwZW5kcyBvbiBSVVNUQ19WRVJTSU9O
ID49IDEwNzkwMAo+ID4gKwlkZXBlbmRzIG9uIEFSTTY0IHx8IFg4Nl82NAo+ID4gIAkjIFdpdGgg
R0NPVi9LQVNBTiB3ZSBuZWVkIHRoaXMgZml4OiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5n
L3J1c3QvcHVsbC8xMjkzNzMKPiA+ICAJZGVwZW5kcyBvbiAoUlVTVENfTExWTV9WRVJTSU9OID49
IDE5MDEwMyAmJiBSVVNUQ19WRVJTSU9OID49IDEwODIwMCkgfHwgXAo+ID4gIAkJKCFHQ09WX0tF
Uk5FTCAmJiAhS0FTQU5fR0VORVJJQyAmJiAhS0FTQU5fU1dfVEFHUykKPiA+IC0tIAo+ID4gMi40
Ny4yCj4gPiAKPiAKPiAtLSAKPiBLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
