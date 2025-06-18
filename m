Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EB7C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 01:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7WsLHicEDHmnkUyHfUbtWql7lc07qH+Uv9/gvkbaeQ=; b=hhRWWxSrJ25WhT
	nF3TosltGWsG9VjhkA5ZRt7Cq7+GoudO6LhdlNXXz4npiKnYK8m/Avnk4SzFEdKJmEgIxzYDg3EB0
	sMqtUIATDDcKqXnYCOs90o9q0Ee8Eo/N2qSrZmJ1ANhAgDHSS0o0cr7v9b1PYVtkd4nPpsiqjJX3p
	Pu4RHBjptNywPLUckollZLL9yOqKnSn3bKICCrp8krmIsQQ0V3EZ4hcerVIKtWRHCcbUNFP0ty6s9
	JYvozWEr4H9JxqA2AXontl6p+XyD8eNCPlhqBpaEQ0BXkhWxHtQoeWhYMIV9lwo47hRuUp/Xudq3a
	NLtcuamYJdxmUZ/X7yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhO6-00000008jCm-0O5k;
	Wed, 18 Jun 2025 01:14:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhO2-00000008jC3-3ln9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 01:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAA154A830
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 01:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE23C4CEF9
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 01:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750209285;
	bh=h2YputM22TLsFmaGuZOmTSbK7C6G8IcXF/esgzdBeMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h2ORsYPKEf7Szaa3wjBCMWTtOLGDSCQvsfp9Bq5p3ne+H0+0t9jML5uuyaThHtceQ
	 Au5EvYAGNKSbukyDT5ZaoQXt92ToLL6dDSd+kVocG9cg3OtLfHAOj8WwGZ6tp2Mjx3
	 7DpgnMHpCU4SPSGkMwRC7AlzbZfuwYfEGHlCmUDvRSxL649gwsEjx61Jrujheo7rTp
	 qJ0m/s1OPMMJKW0Fm8sMTLdBFtzIuia2f/5YFBxLoaFla3VMVr7uCX2/29W+xwpeQU
	 QpXYUNz+RV2tVCo4jZsHYSPpdOFbcRPkh9Tj8SiJnNt/iCCptbBmLINW2ONw5bxPOp
	 1fkWuhAiISscA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553543ddfc7so6911565e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 18:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV0SmuGNwbW+QsS72UIaPCT7xp2xHDOHYJgi43n3JrwgCIy1RUGaIrmEuuDsgqDlcSifHD20qBGCEQ2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY74hfidBBZKpQvgQYOzz4c7oR+5ASlg9K2MNMrrsZoRppt2NS
	OJtGq95dJ8zxZ971qbio8bdCCUKbA+Ff00kOf8WrKNnyfG8o6GrmGksSoN+IN05M47+zOQZvaki
	6gLHrAyzsVBaFASeJKZiSNRcrtyfk2nM=
X-Google-Smtp-Source: AGHT+IE7MRJL1Yw0xIAiT0g6qe8cPzPnAw/z8vD2sHRVWPnU9T42hH7IJfTK5kp8NNXpkwOUOaUNXTzluaBXDYEml0s=
X-Received: by 2002:a05:6512:3b8b:b0:553:2ed1:ab1e with SMTP id
 2adb3069b0e04-553b6f4cc5cmr3710057e87.46.1750209284091; Tue, 17 Jun 2025
 18:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
 <CAK7LNATuk_tpDAq07e5oSU4FptRO_88Oxh2=W=3YmBotbGuU5g@mail.gmail.com> <20250617093523-e7f54d95-96d0-4411-92d6-dd80fe84ee98@linutronix.de>
In-Reply-To: <20250617093523-e7f54d95-96d0-4411-92d6-dd80fe84ee98@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Jun 2025 10:14:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARr-ypWkNR52-my2WJFQ3b26EGV===J8b1MROLuf31oRw@mail.gmail.com>
X-Gm-Features: AX0GCFv7u6eSzDMgQ1fz3QLMoGrvpETTxg10qNUIysrWURln8hEL4ilzYDnFugA
Message-ID: <CAK7LNARr-ypWkNR52-my2WJFQ3b26EGV===J8b1MROLuf31oRw@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] kbuild: userprogs: also inherit byte order and
 ABI from kernel
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_181446_978025_43E90272 
X-CRM114-Status: GOOD (  24.64  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNDozOeKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE2LCAy
MDI1IGF0IDExOjQ5OjQxUE0gKzA5MDAsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiA+IE9uIFdl
ZCwgSnVuIDExLCAyMDI1IGF0IDQ6MzjigK9QTSBUaG9tYXMgV2Vpw59zY2h1aAo+ID4gPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBNYWtlIHN1cmUg
dGhlIGJ5dGUgb3JkZXIgYW5kIEFCSSBvZiB0aGUgdXNlcnByb2dzIG1hdGNoZXMgdGhlIG9uZSBv
ZiB0aGUKPiA+ID4ga2VybmVsLCBzaW1pbGFyIHRvIGhvdyB0aGUgYml0IHNpemUgaXMgaGFuZGxl
ZC4KPiA+ID4gT3RoZXJ3aXNlIHRoZSB1c2VycHJvZ3MgbWF5IG5vdCBiZSBleGVjdXRhYmxlLgo+
ID4gPiBUaGlzIGhhcHBlbnMgZm9yIGV4YW1wbGUgb24gcG93ZXJwYyBsaXR0bGUgZW5kaWFuLCBv
ciByaXNjdjMyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KPiA+ID4gLS0tCj4gPiA+ICBNYWtlZmls
ZSB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiA+
ID4gaW5kZXggYzQyOTNjZjkxZTk2OGNhOGVlNjQ0NTI4NDFmYjI2NmUyNGRmNjNmNi4uYjlhYTEw
NTgzMjFkYWJkM2IzZGQ1NjEwZTQ1YTI4MDdkZmEyNTdmNCAxMDA2NDQKPiA+ID4gLS0tIGEvTWFr
ZWZpbGUKPiA+ID4gKysrIGIvTWFrZWZpbGUKPiA+ID4gQEAgLTExMjksOCArMTEyOSw4IEBAIGlm
bmVxICgkKENPTkZJR19BUkNIX1ZNTElOVVhfTkVFRFNfUkVMT0NTKSwpCj4gPiA+ICBMREZMQUdT
X3ZtbGludXggICAgICAgICs9IC0tZW1pdC1yZWxvY3MgLS1kaXNjYXJkLW5vbmUKPiA+ID4gIGVu
ZGlmCj4gPiA+Cj4gPiA+IC0jIEFsaWduIHRoZSBiaXQgc2l6ZSBvZiB1c2Vyc3BhY2UgcHJvZ3Jh
bXMgd2l0aCB0aGUga2VybmVsCj4gPiA+IC1VU0VSRkxBR1NfRlJPTV9LRVJORUwgOj0gLW0zMiAt
bTY0IC0tdGFyZ2V0PSUKPiA+ID4gKyMgQWxpZ24gdGhlIGJpdCBzaXplLCBieXRlIG9yZGVyIGFu
ZCBhcmNoaXRlY3R1cmUgb2YgdXNlcnNwYWNlIHByb2dyYW1zIHdpdGggdGhlIGtlcm5lbAo+ID4g
PiArVVNFUkZMQUdTX0ZST01fS0VSTkVMIDo9IC1tMzIgLW02NCAtbWxpdHRsZS1lbmRpYW4gLW1i
aWctZW5kaWFuIC0tdGFyZ2V0PSUgLW1hcmNoPSUgLW1hYmk9JQo+ID4gPiAgS0JVSUxEX1VTRVJD
RkxBR1MgICs9ICQoZmlsdGVyICQoVVNFUkZMQUdTX0ZST01fS0VSTkVMKSwgJChLQlVJTERfQ1BQ
RkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCj4gPiA+ICBLQlVJTERfVVNFUkxERkxBR1MgKz0gJChm
aWx0ZXIgJChVU0VSRkxBR1NfRlJPTV9LRVJORUwpLCAkKEtCVUlMRF9DUFBGTEFHUykgJChLQlVJ
TERfQ0ZMQUdTKSkKPiA+Cj4gPgo+ID4gV2h5IGRpZG4ndCB5b3UgZG8gbGlrZSB0aGlzPwo+ID4K
PiA+IFVTRVJGTEFHU19GUk9NX0tFUk5FTCA6PSAkKGZpbHRlciAtbTMyIC1tNjQgLW1saXR0bGUt
ZW5kaWFuCj4gPiAtbWJpZy1lbmRpYW4gLS10YXJnZXQ9JSAtbWFyY2g9JSAtbWFiaT0lLCAkKEtC
VUlMRF9DUFBGTEFHUykKPiA+ICQoS0JVSUxEX0NGTEFHUykpCj4gPiBLQlVJTERfVVNFUkNGTEFH
UyAgKz0gJChVU0VSRkxBR1NfRlJPTV9LRVJORUwpCj4gPiBLQlVJTERfVVNFUkxERkxBR1MgKz0g
JChVU0VSRkxBR1NfRlJPTV9LRVJORUwpCj4KPiBUaGUgaWRlYSB3YXMgdG8ga2VlcCB0aGUgVVNF
UkZMQUdTX0ZST01fS0VSTkVMIGxpbmUgZnJlZSBvZiBjbHV0dGVyLCBhcyBpdCBpcwo+IHByb2Jh
Ymx5IGdvaW5nIHRvIGNoYW5nZSBtb3JlIG9mdGVuLiBUbyBpbXByb3ZlIHJldmlld2FiaWxpdHkg
YW5kIGdhaW4gc29tZQo+IGF2YWlsYWJsZSBob3Jpem9udGFsIHNwYWNlIGluIGNhc2UgaXQgc2hv
dWxkIGJlIG5lZWRlZCBhdCBzb21lIHBvaW50Lgo+Cj4gSWYgeW91IHByZWZlciB0aGUgb3RoZXIg
bGF5b3V0IEknbGwgYmUgaGFwcHkgdG8gc3dpdGNoIGl0IGFyb3VuZC4KCgokKGZpbHRlciAuLi4g
JChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykpCgppcyBkdXBsaWNhdGVkIGluIHRo
ZSB0d28gbGluZXMuCgpUaGF0IGlzIHRoZSByZWFzb24gZm9yIG15IHN1Z2dlc3Rpb24uCgoKCi0t
IApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
