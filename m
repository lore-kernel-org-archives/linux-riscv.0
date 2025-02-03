Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD78EC02194
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZ86cWd8IzpHzles/v3sFNz6dpv14UdLrpHRJfCkIuQ=; b=kiUrRQTiV80BPJ
	OIJbJloQAkWvN7Q9rlcd+HVJCcatyO+n+g52ArHrc9pftNVScXahN0AzNYrFd4ETHBGXzTKLuDqkS
	aE/hgqLglbB6OiDkD5WNyWVxbe6acqFRw+fgmEt3KBHdQwCqlw8MMitH+XiclrPLC3se6T826rTod
	SnPiPEr2hD1TKZt/deTA1g3iicITFWlRDLMSXOW8uPFtkHRUNOjVXVbMSzV12CIBgWwx3+eHxDu81
	OZsUPmA9XFAP9UQwRQuxQ/Rj74uBytI0dNnexMQwXNJaf9yAFBWPEqb9O0M4gUkmvaiHlFxZb8XBq
	sQKTMJtJ5jw4UBaCy7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4B3-0000000Gh0k-2Cwh;
	Mon, 03 Feb 2025 21:40:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf45t-0000000Gg4b-3Bc5
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 21:35:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eed29d17so2377447f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738618500; x=1739223300; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVYSR4bTXlgQ7T8K6H5ODWPt2kh41i9bq2tVocO56SE=;
        b=EFMesB9kpSmScfbkWok3dkitb9JPDf41UelkQ3UthXBTn6TLAV6u+/+XT1d6n2tbGM
         0m2lRn7C8AND0Jlqs0j7TIdj2Q1YoWw+uegc8W9tLlE9PMob+6U4ZTlT2bVSJbyJgXbl
         btoIV/qo7zinNeEcr0VlV7A5h3OpI1wDyp46tOO0LnTzxCKdofa1iv1GWBazC+7mG4sW
         ziOobMRv/YdC8k1zrNll09yMZbUa7N1+pxeJsMr5hwWryCRpoE79wmq9rZEwbPpoR9J1
         AsLkpkobczafzxjFU7WJ+uJ0xwtOQXWf1qBI30jVYNgkue86qPMqafW/Vv9KErZ1+LCK
         uqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738618500; x=1739223300;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVYSR4bTXlgQ7T8K6H5ODWPt2kh41i9bq2tVocO56SE=;
        b=LG6HvrssM8m2u2roGhi1tc0gm+z3roa4RCSEjWLtMDYudId5Ru2eHtFCe0jO8djJ9Y
         E+63UVQ97NF4lGyZvE0NrAWShOSM0oRi0W3AQmq3B6gWHCKpTBjF0lqC+LCMRIVRNAmC
         nXq7dfWmAArf/TeQwtnR4gi3tvP0wu3VGq86z7x8uII4Z4njKb1Ihoxr6UMZC+HIHDd1
         PxViutJhLXtW/IBVmvg0xQ8mu4TwCrd5Up0fspj8j/SjLgkkIUzzlpu0Xkwie1766dvi
         O7gxBmVP2q0MIOIF6hXRPmZoWvSR6uFG9ldaYTHTWp3ZAdG+PEUeulyDtRv5fQ8VfF7o
         LTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+YCPPa1G/zXiQndQKbp63gy8fMo+EZaSwC9N3M99fDBYvyTr8KW6Nqfp63mThOORQzDqrGEKl42YNag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzom2cu7RGZCWehklwqjHPgVGh1/4eZ4oEDwxepsIjyQOkKSEl
	mw5NqRzImfJBB8zpdtbUI2xg82k1VBOAReoeqJJ6Cmib8fax9TRaES2+lk/I1hA=
X-Gm-Gg: ASbGncsDo5LldMEqwP2c3/E2ATw5fRmb2TdBv9DIFuuJ4XGnx2QYLhdXXK7/ChevER4
	yt9dqtsqlyWdNn6Y2EjpKBfJTl4PI24ETrHJgdpWrm29Ujx7GJyHo+BAEoyRu969an1t3H5CfL1
	sug4aRehVzCxGCl8Y8jG4achgqh6QppUlaFMa6CM+vzE8k0tmhqQfN9qgetbbnfm/Uiptd+5F6l
	WSRWLj4kSGNV7VSXUFVNax6zPCepOAfz758kaSzEAzDqQ2qY8RMy5yKO1Ayx7vi6GwWfA9cOSmn
	ZswOEQQJjjKtsmo9qmKsbShrHnbe
X-Google-Smtp-Source: AGHT+IHfpCIkZ4S+T60Xm+ShuyczBSeqMnQAFidKEp87h9uGDJX9GaMIdbY+W/cp0bHu0LZmOAbquA==
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38c5209395cmr22749650f8f.35.1738618500120;
        Mon, 03 Feb 2025 13:35:00 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm166230485e9.13.2025.02.03.13.34.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:34:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Z6Ed6gYzdKhQQQVM@ghost>
Date: Mon, 3 Feb 2025 21:34:48 +0000
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Conor Dooley <conor@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>,
 Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
Message-Id: <17E9A830-AE5C-41F5-AC07-2BD9C70739BB@jrtc27.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud> <Z6EVIPc_t6zMU9qb@ghost>
 <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com> <Z6Ed6gYzdKhQQQVM@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_133501_809556_C59797CB 
X-CRM114-Status: GOOD (  22.23  )
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

T24gMyBGZWIgMjAyNSwgYXQgMTk6NTAsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgRmViIDAzLCAyMDI1IGF0IDAxOjMwOjQ4UE0gLTA2
MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBIaSBDaGFybGllLAo+PiAKPj4gT24gMjAyNS0w
Mi0wMyAxOjEyIFBNLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBPbiBTdW4sIEZlYiAwMiwg
MjAyNSBhdCAwODowODo1MFBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+Pj4gT24gU2F0
LCBGZWIgMDEsIDIwMjUgYXQgMDE6MDQ6MjVQTSArMDEwMCwgQWxla3NhbmRhciBSaWthbG8gd3Jv
dGU6Cj4+Pj4+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDQ6MjPigK9BTSBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+Pj4gCj4+Pj4+Pj4gRnJvbTogQ2hh
by15aW5nIEZ1IDxjZnVAbWlwcy5jb20+Cj4+Pj4+Pj4gCj4+Pj4+Pj4gVXNlIG9ubHkgTFIvU0Mg
aW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVudCBhdG9taWMgZnVuY3Rpb25zLgo+Pj4+Pj4gCj4+Pj4+
PiBJbiB0aGUgcHJldmlvdXMgcGF0Y2ggeW91IG1lbnRpb24gdGhhdCB0aGlzIGlzIHRvIHN1cHBv
cnQgTUlQUyBQODcwMC4gQ2FuCj4+Pj4+PiB5b3UgZXhwYW5kIG9uIHdoeSB0aGlzIGNoYW5nZSBp
cyByZXF1aXJlZD8gVGhlIGRhdGFzaGVldCBhdCBbMV0gc2F5czoKPj4+Pj4+IAo+Pj4+Pj4gIlRo
ZSBQODcwMCBjb3JlIGlzIGNvbmZpZ3VyZWQgdG8gc3VwcG9ydCB0aGUgUlY2NEdDWmJhX1piYiAo
RyA9IElNQUZEKQo+Pj4+Pj4gU3RhbmRhcmQgSVNBLiBJdCBpbmNsdWRlcyB0aGUgUlY2NEkgYmFz
ZSBJU0EsIE11bHRpcGx5IChNKSwgQXRvbWljIChBKSwKPj4+Pj4+IFNpbmdsZS1QcmVjaXNpb24g
RmxvYXRpbmcgUG9pbnQgKEYpLCBEb3VibGUgKEQpLCBDb21wcmVzc2VkIChDKSBSSVNDLVYKPj4+
Pj4+IGV4dGVuc2lvbnMsIGFzIHdlbGwgYXMgdGhlIGFzIHdlbGwgYXMgdGhlIGJpdC1tYW5pcHVs
YXRpb24gZXh0ZW5zaW9ucwo+Pj4+Pj4gKFpiYSkgYW5kIChaYmIpIgo+Pj4+Pj4gCj4+Pj4+PiBU
aGUgIkEiIGV4dGVuc2lvbiBpcyBhIHBhcnQgb2YgIkciIHdoaWNoIGlzIG1vc3RseSBhc3N1bWVk
IHRvIGV4aXN0IGluCj4+Pj4+PiB0aGUga2VybmVsLiBBZGRpdGlvbmFsbHksIGhhdmluZyB0aGlz
IGJlIGEgY29tcGlsYXRpb24gZmxhZyB3aWxsIGNhdXNlCj4+Pj4+PiB0cmFwcyBvbiBnZW5lcmlj
IGtlcm5lbHMuIFdlIGdlbmVyYWxseSB0cnkgdG8gcHVzaCBldmVyeXRoaW5nIHdlIGNhbgo+Pj4+
Pj4gaW50byBydW50aW1lIGZlYXR1cmUgZGV0ZWN0aW9uIHNpbmNlIHRoZXJlIGFyZSBzbyBtYW55
IHBvc3NpYmxlIHZhcmlhbnRzCj4+Pj4+PiBvZiByaXNjdi4KPj4+Pj4+IAo+Pj4+Pj4gRXhwcmVz
c2luZyBub3QgYmVpbmcgYWJsZSB0byBwZXJmb3JtIGEgZmVhdHVyZSBsaWtlIHRoaXMgaXMgbm9y
bWFsbHkKPj4+Pj4+IGJldHRlciBleHByZXNzZWQgYXMgYW4gZXJyYXRhLiBUaGVuIGdlbmVyaWMg
a2VybmVscyB3aWxsIGJlIGFibGUgdG8KPj4+Pj4+IGluY2x1ZGUgdGhpcywgYW5kIGFueWJvZHkg
d2hvIGRvZXNuJ3Qgd2FudCB0byBoYXZlIHRoZSBleHRyYSBub3BzCj4+Pj4+PiBpbnRyb2R1Y2Vk
IGNhbiBkaXNhYmxlIHRoZSBlcnJhdGEuIEEgc2ltaWxhciBhcHByb2FjaCB0byB3aGF0IEkgcG9p
bnRlZAo+Pj4+Pj4gb3V0IGxhc3QgdGltZSBzaG91bGQgd29yayBoZXJlIHRvbyAoYnV0IHdpdGgg
bW9yZSBwbGFjZXMgdG8gcmVwbGFjZSkKPj4+Pj4+IFsyXS4KPj4+Pj4+IAo+Pj4+Pj4gWzFdIGh0
dHBzOi8vbWlwcy5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjQvMTEvUDg3MDBfRGF0YV9TaGVl
dC5wZGYKPj4+Pj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1oyLVVOZndjQVFZ
WnFWQlVAZ2hvc3QvVC8KPj4+Pj4gCj4+Pj4+IFNvIGZhciB3ZSBoYXZlbid0IGZvdW5kIGEgd2F5
IHRvIGRvIHRoaXMgdXNpbmcgZXJyYXRhLgo+Pj4+IAo+Pj4+IFlvdSBtZWFuIHVzaW5nIGFsdGVy
bmF0aXZlcz8gTm90IGltcGxlbWVudGluZyBBLCBidXQgaW5zdGVhZAo+Pj4+IGltcGxlbWVudGlu
ZyBaYWxyc2MsIGlzIG5vdCBhbiBlcnJhdHVtLiBJdCdzIGEgZGVzaWduIGRlY2lzaW9uLgo+Pj4g
Cj4+PiBXZSBjb3VsZCBkbyB0aGUgc2FtZSB0aGluZyB3ZSBkbyB3aXRoIG1pc2FsaWduZWQgYWNj
ZXNzIGRldGVjdGlvbiBhbmQKPj4+IHJ1biBzb21lIGluc3RydWN0aW9ucyB0byBkZXRlcm1pbmUg
aWYgdGhlc2UgaW5zdHJ1Y3Rpb25zIGFyZSBiZWluZwo+Pj4gZW11bGF0ZWQuICBJZiB0aGV5IGFy
ZSBiZWluZyBlbXVsYXRlZCwgcGF0Y2ggYWxsIG9mIHRoZSBwbGFjZXMgdG8gdXNlCj4+PiB6YWxy
c2MuCj4+IAo+PiBJcyB0aGUgaW1wbGljYXRpb24gaGVyZSB0aGF0IHRoZSByaXNjdixpc2EtZXh0
ZW5zaW9ucyBsaXN0IHBhc3NlZCB0byB0aGUga2VybmVsCj4+IHdpbGwgY29udGFpbiAiYSIsIGV2
ZW4gdGhvdWdoIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IGl0LCBiZWNhdXNlIEFNT3Mg
YXJlCj4+IGVtdWxhdGVkIGluIE0tbW9kZT8KPj4gCj4+IElmIHRoYXQgaXMgbm90IHRoZSBjYXNl
LCB0aGVyZSBpcyBubyBuZWVkIGZvciBydW50aW1lIGRldGVjdGlvbi4gVGhlIGFsdGVybmF0aXZl
Cj4+IGVudHJ5IGNhbiBjaGVjayBSSVNDVl9JU0FfRVhUX1pBQU1PICh3aGljaCB3b3VsZCBiZSBp
bXBsaWVkIGJ5IFJJU0NWX0lTQV9FWFRfYSkKPj4gaW4gdGhlIElTQSBiaXRtYXAgbGlrZSBub3Jt
YWwuCj4gCj4gVGhhdCB3b3VsZCBiZSBtdWNoIGJldHRlciEgSSB3YXMgdW5kZXIgdGhlIGFzc3Vt
cHRpb24gdGhhdCB0aGUgdXNlY2FzZQo+IGZvciB0aGlzIHBhdGNoIHdhcyB0aGF0IHRoZXkgd2Vy
ZSBwYXNzaW5nIGluICJhIiBhbmQgd2FudGluZyB0byBvbmx5IGdldAo+IHphbHJzYy4gV2Ugc2hv
dWxkIGJlIGFibGUgdG8gY2hlY2sKPiBSSVNDVl9JU0FfRVhUX1pBQU1PL1JJU0NWX0lTQV9FWFRf
WkFMUlNDIHRvIGdldCB0aGUgaW5mb3JtYXRpb24gd2l0aG91dAo+IHJ1bnRpbWUgZGV0ZWN0aW9u
LgoKSW4gTExWTSBhdCBsZWFzdCAtbWNwdT1taXBzLXA4NzAwIGVuYWJsZXMgdGhlIGZ1bGwgQSBl
eHRlbnNpb24uLi4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
