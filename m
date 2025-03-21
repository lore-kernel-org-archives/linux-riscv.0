Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F94CC35FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZREhJaNHRsg1HC3XA6zpgTC2QHpsi1Rj7wBiScyw3/w=; b=LRsLzHkCD7W4+7
	TD5RIeQkpc/HKyAILw6T2ng2+RrwAX1RoYKkZg2uMgoPom2DBqUoEMXcB0icklTEb+7RwLJ4Xq8yt
	zwWVHgI41sfyMYbO45GZZponYDJyOrMNviNRwke+euvvv2fNP7I4vXZhRjXydJQAwpG//i9tqrELU
	vmlnHQikMCTQnBZK0SbeQDS+OYHL1x565IZ3zNABbFoPPDsMFfbUR2aTtGCkVZbcwoAPWScj1jZM7
	FXboqdRbZj/0kDx10TkqglLt0ZDTSUs+qMAdKfYF0DS0YRehwhoo21TxYkTbs9t1GAdMS30Lw/IEc
	EkBPh/MhXiBM0pl40UIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXRW-0000000ECk2-0uzQ;
	Fri, 21 Mar 2025 08:09:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX9m-0000000EA0R-2zY4
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 07:51:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913290f754so216600f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742543465; x=1743148265; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhIkdGys04hj0FOCl78FUSdH2+gL7DQzkmTGKMi3P1w=;
        b=C2Ab77+BIkZ3P18aqtj9OmGb+92iGK7sX/uywkJ/hb+hTNbQM+BMnAqnPiqd0I3N11
         A9DxipiDIomE9wJ3EE4Gn9i62Sk5ypsT0r1aNWSQqak+QmjMf2eoRTfcTe36xLyTPYGG
         fKqcMjvdsjESPafD6kI3gLYKgeHW5ijt6CElSnpsm5rcR1AO8bnbH0bxh+c+jENxQtMw
         6mY8WqLKMLnlsjyop8yLvtWQfyE5Ae+QB4u2QQyBzV885kuG4jdWsjRdjF49JBerLYUY
         ivvMZZoHDr3JwxmEdNwLl9VUX1ngsvSGmabWO7oSGYvE0Xe9tc6EkTGoIkFc7NwMW69q
         RTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742543465; x=1743148265;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhIkdGys04hj0FOCl78FUSdH2+gL7DQzkmTGKMi3P1w=;
        b=D5VYbsSVdwq5oEJM2/2zr5OfAhZc0mfS/ugqX+27IYtoVifoUx0A9sfOQGtCIAh6FY
         9JdMJalu2YT1s3lc2CNnbjwXlJm4AuSJlFRxuOPeDVuiAJV+aqj/9sNshqrPmNAAlI6R
         gOL9ydU+XeRaUufPXLV7HhMEIf1nPnnopveB5PkyYkts+bUeK3pS2xj601R0DcKItz+/
         ZZ7f+mcb2Y4Ga221Unh0ztmQ82b5GZwUANth2UbWf/LTplLfFpj9EZZ1hytpPdGKMuv7
         5Ef7tYEfSMlKzZC7ZzPjDiPSRYKcs1HhNny1c+EES6YqQRT4oOR3eB8bh5H7HKovQm/g
         TMCg==
X-Forwarded-Encrypted: i=1; AJvYcCU0rCsD7VFC+vi88KVLBBX81KOsCz7dXR0iHTvODYH7mBwn++K09QBVlRY6PNRJS+44Juk7+3/kjK3v1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuls2lEc4TjRGIrMt+G6b0h4m7Fi+UjLChc8FjXghMz2upCE/F
	khrHXsn4kQf6F3KCMuDZPnqIxl55ryR2eHsqIFdP7TCpaK5kJA31PGP/2T3Lg6E=
X-Gm-Gg: ASbGnctM32dm4lFZS7+LkIMb6s4rNod4p3X1khDKbYGeXvRHDupW/gOY9/UJFDxmD96
	+TdaxaCXL7noUZDYzovIiap+o+a9h5ULThsNRJ3BjwdUuxnyEYMqvdZ6biV9+Vf1RaWAv490Fjz
	nbz0Gm931bWiVmjKwnMvFEDPzohGp7UrMIukGlJdH323NHyjGnnmjSUQrQk+uOnTTWMSi5+UBSy
	GsqzWNDT0ePA1bzXlxKz3ADn+k/y3BDAbiG3Tx6TfcHbFGbGxMPwAj0OGVm8FdJVX8DLGh+PEF5
	9IBUynEHOjxK/GDZPnJyIrkrTxtJ9se1SOd4xOOddMGAY3LvcsJ4wqA8/J0oxT/tcGKq350Jqee
	eTkRZ
X-Google-Smtp-Source: AGHT+IGwi45hePFM2TZdMOTyXUgfdngf4+B913tg/H8YfeoX7CrwBIY2Kj9KlDmHfMfV0eRC+zYKag==
X-Received: by 2002:a5d:598b:0:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-3997f93046emr899094f8f.10.1742543464931;
        Fri, 21 Mar 2025 00:51:04 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb06b9sm18758395e9.36.2025.03.21.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:51:04 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 21 Mar 2025 08:51:04 +0100
Message-Id: <D8LS3S6B9Y09.ZH6AQOD6UXRI@ventanamicro.com>
Subject: Re: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>
 <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
 <CAKC1njQHu1UeSSApWHXedEURBezuQL1BDcrpsSfi=D0JmDFX8A@mail.gmail.com>
In-Reply-To: <CAKC1njQHu1UeSSApWHXedEURBezuQL1BDcrpsSfi=D0JmDFX8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_005106_749118_E3CBFC29 
X-CRM114-Status: GOOD (  27.38  )
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

MjAyNS0wMy0yMFQxNToyOTo1NS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDI6MjXigK9QTSBSYWRpbSBLcsSNbcOhxZkg
PHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Cj4+IDIwMjUtMDMtMTRUMTQ6Mzk6
NDQtMDc6MDAsIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4gPiBUaGlzIHBh
dGNoIGNyZWF0ZXMgYSBjb25maWcgZm9yIHNoYWRvdyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5n
IHBhZCBpbnN0cgo+PiA+IHN1cHBvcnQuIFNoYWRvdyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5n
IGluc3RyIHN1cHBvcnQgY2FuIGJlIGVuYWJsZWQgYnkKPj4gPiBzZWxlY3RpbmcgYENPTkZJR19S
SVNDVl9VU0VSX0NGSWAuIFNlbGVjdGluZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYCB3aXJlcwo+
PiA+IHVwIHBhdGggdG8gZW51bWVyYXRlIENQVSBzdXBwb3J0IGFuZCBpZiBjcHUgc3VwcG9ydCBl
eGlzdHMsIGtlcm5lbCB3aWxsCj4+ID4gc3VwcG9ydCBjcHUgYXNzaXN0ZWQgdXNlciBtb2RlIGNm
aS4KPj4gPgo+PiA+IElmIENPTkZJR19SSVNDVl9VU0VSX0NGSSBpcyBzZWxlY3RlZCwgc2VsZWN0
IGBBUkNIX1VTRVNfSElHSF9WTUFfRkxBR1NgLAo+PiA+IGBBUkNIX0hBU19VU0VSX1NIQURPV19T
VEFDS2AgYW5kIERZTkFNSUNfU0lHRlJBTUUgZm9yIHJpc2N2Lgo+PiA+Cj4+ID4gUmV2aWV3ZWQt
Ynk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVw
YWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gPiAtLS0KPj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+ID4gQEAgLTI1MCw2ICsy
NTAsMjYgQEAgY29uZmlnIEFSQ0hfSEFTX0JST0tFTl9EV0FSRjUKPj4gPiArY29uZmlnIFJJU0NW
X1VTRVJfQ0ZJCj4+ID4gKyAgICAgZGVmX2Jvb2wgeQo+PiA+ICsgICAgIGJvb2wgInJpc2N2IHVz
ZXJzcGFjZSBjb250cm9sIGZsb3cgaW50ZWdyaXR5Igo+PiA+ICsgICAgIGRlcGVuZHMgb24gNjRC
SVQgJiYgJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFyY2g9cnY2NGltYV96aWNmaXNzKQo+PiA+
ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPj4gPiArICAgICBzZWxlY3QgQVJD
SF9IQVNfVVNFUl9TSEFET1dfU1RBQ0sKPj4gPiArICAgICBzZWxlY3QgQVJDSF9VU0VTX0hJR0hf
Vk1BX0ZMQUdTCj4+ID4gKyAgICAgc2VsZWN0IERZTkFNSUNfU0lHRlJBTUUKPj4gPiArICAgICBo
ZWxwCj4+ID4gKyAgICAgICBQcm92aWRlcyBDUFUgYXNzaXN0ZWQgY29udHJvbCBmbG93IGludGVn
cml0eSB0byB1c2Vyc3BhY2UgdGFza3MuCj4+ID4gKyAgICAgICBDb250cm9sIGZsb3cgaW50ZWdy
aXR5IGlzIHByb3ZpZGVkIGJ5IGltcGxlbWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4+ID4gKyAg
ICAgICBiYWNrd2FyZCBlZGdlIGFuZCBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgZm9yIGZvcndh
cmQgZWRnZSBpbiBwcm9ncmFtLgo+PiA+ICsgICAgICAgU2hhZG93IHN0YWNrIHByb3RlY3Rpb24g
aXMgYSBoYXJkd2FyZSBmZWF0dXJlIHRoYXQgZGV0ZWN0cyBmdW5jdGlvbgo+PiA+ICsgICAgICAg
cmV0dXJuIGFkZHJlc3MgY29ycnVwdGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNr
cy4KPj4gPiArICAgICAgIEluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFs
bCBpbmRpcmVjdCBicmFuY2hlcyBtdXN0IGxhbmQKPj4gPiArICAgICAgIG9uIGEgbGFuZGluZyBw
YWQgaW5zdHJ1Y3Rpb24gZWxzZSBDUFUgd2lsbCBmYXVsdC4gVGhpcyBtaXRpZ2F0ZXMgYWdhaW5z
dAo+PiA+ICsgICAgICAgSk9QIC8gQ09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVu
YWJsZWQgdG8gdXNlIGl0LCBhbmQgb2xkIHVzZXItCj4+ID4gKyAgICAgICBzcGFjZSBkb2VzIG5v
dCBnZXQgcHJvdGVjdGlvbiAiZm9yIGZyZWUiLgo+PiA+ICsgICAgICAgZGVmYXVsdCB5Cj4+Cj4+
IEEgaGlnaCBsZXZlbCBxdWVzdGlvbiB0byBraWNrIG9mZiBteSByZXZpZXc6Cj4+Cj4+IFdoeSBh
cmUgbGFuZGluZyBwYWRzIGFuZCBzaGFkb3cgc3RhY2tzIG1lcmdlZCB0b2dldGhlcj8KPj4KPj4g
QXBhcnQgZnJvbSBhZGRpbmcgYnVpbGQgZmxleGliaWxpdHksIHdlIGNvdWxkIGFsc28gc3BsaXQg
dGhlIHBhdGNoZXMKPj4gaW50byB0d28gaXNvbGF0ZWQgc2VyaWVzLCBiZWNhdXNlIHRoZSBmZWF0
dXJlcyBhcmUgaW5kZXBlbmRlbnQuCj4KPiBTdHJpY3RseSBmcm9tIENQVSBleHRlbnNpb25zIHBv
aW50IG9mIHZpZXcgdGhleSBhcmUgaW5kZXBlbmRlbnQgZmVhdHVyZXMuCj4gQWx0aG91Z2ggZnJv
bSBhIHVzYWJpbGl0eSBwb2ludCBvZiB2aWV3IHRoZXkgY29tcGxlbWVudCBlYWNoIG90aGVyLiBB
IHVzZXIKPiB3YW50aW5nIHRvIGVuYWJsZSBzdXBwb3J0IGZvciBjb250cm9sIGZsb3cgaW50ZWdy
aXR5IHdvdWxkbid0IGJlIGVuYWJsaW5nCj4gb25seSBsYW5kaW5nIHBhZCBhbmQgbGVhdmluZyBy
ZXR1cm4gZmxvdyBvcGVuIGZvciBhbiBhdHRhY2tlciBhbmQgdmljZS12ZXJzYS4KPiBUaGF0J3Mg
d2h5IEkgZGVmaW5lZCBhIHNpbmdsZSBDT05GSUcgZm9yIENGSS4KPgo+IEZyb20gb3JnYW5pemlu
ZyBwYXRjaGVzIGluIHRoZSBwYXRjaCBzZXJpZXMsIHNoYWRvdyBzdGFjayBhbmQgbGFuZGluZwo+
IHBhZCBwYXRjaGVzIGRvIG5vdCBjcm9zcyBpbnRvIGVhY2ggb3RoZXIgYW5kIGFyZSBkaWZmZXJl
bnQgZnJvbSBlYWNoCj4gb3RoZXIgZXhjZXB0IGR0LWJpbmRpbmdzLCBod3Byb2JlLCBjc3IgZGVm
aW5pdGlvbnMuIEkgY2FuIHNlcGFyYXRlIHRoZW0KPiBvdXQgYXMgd2VsbCBpZiB0aGF0J3MgZGVz
aXJlZC4KCkl0IHdvdWxkIGJlIG15IHByZWZlcmVuY2UsIGJ1dCBpdCdzIHRoZSBtYWludGFpbmVy
J3MgY2FsbC4KCkkgdGhpbmsgdGhhdCBsYW5kaW5nIHBhZHMgY291bGQgYmUgbWVyZ2VkIGVhcmxp
ZXIgaWYgdGhleSB3ZXJlIHBvc3RlZApzZXBhcmF0ZWx5LCBidXQgdGhpcyBzZXJpZXMgaXMgYWxy
ZWFkeSBvbiB2MTIsIHNvIEkgZG9uJ3Qgd2FudCB0byBmb3JjZQphbnl0aGluZy4KCj4gRnVydGhl
cm1vcmUsIEkgZG8gbm90IHNlZSBhbiBpbXBsZW1lbnRhdGlvbiBvbmx5IGltcGxlbWVudGluZyB6
aWNmaWxwCj4gd2hpbGUgbm90IGltcGxlbWVudGluZyB6aWNmaXNzLiBUaGVyZSBpcyBhIGNhc2Ug
b2YgYSBub21tdSBjYXNlIHdoZXJlCj4gb25seSB6aWNmaWxwIG1pZ2h0IGJlIGltcGxlbWVudGVk
IGFuZCBubyB6aWNmaXNzLiBIb3dldmVyIHRoYXQncyB0aGUgY2FzZQo+IHdoaWNoIGlzIGFueXdh
eXMgcmlzY3YgbGludXgga2VybmVsIGlzIG5vdCBhY3RpdmVseSBiZWluZyB0ZXN0ZWQuIElJUkMs
Cj4gaXQgd2FzIChub21tdSBsaW51eCkgY29uc2lkZXJlZCB0byBiZSBwaGFzZWQgb3V0L25vdCBz
dXBwb3J0ZWQgYXMgd2VsbC4KPgo+IFdlIGNvdWxkIGhhdmUgdHdvIGRpZmZlcmVudCBjb25maWdz
IGJ1dCBJIGRvbid0IHNlZSB3aGF0IHdvdWxkIHNlcnZlCj4gYXBhcnQgZnJvbSB0aGUgYWJpbGl0
eSB0byBidWlsZCBzdXBwb3J0IGZvciBsYW5kaW5nIHBhZCBhbmQgc2hhZG93IHN0YWNrCj4gZGlm
ZmVyZW50bHkuIEFzIEkgc2FpZCBmcm9tIGEgdXNhYmlsaXR5IHBvaW50IG9mIHZpZXcgYm90aCBm
ZWF0dXJlcwo+IGFyZSBjb21wbGltZW50aW5nCj4gdG8gZWFjaCBvdGhlciByYXRoZXIgdGhhbiBz
dGFuZGluZyBvdXQgYWxvbmUgYW5kIHByb3ZpZGluZyBmdWxsIHByb3RlY3Rpb24uCj4KPiBBIGtl
cm5lbCBpcyBidWlsdCB3aXRoIHN1cHBvcnQgZm9yIGVuYWJsaW5nIGJvdGggZmVhdHVyZXMgb3Ig
bm9uZS4gU3VyZSB1c2VyCj4gY2FuIHVzZSBlaXRoZXIgb2YgdGhlIHByY3RsIHRvIGVuYWJsZSBl
aXRoZXIgb2YgdGhlIGZlYXR1cmVzIGluIHdoYXRldmVyCj4gY29tYmluYXRpb24gdGhleSBzZWUg
Zml0LgoKWWVhaCwgaXQgd2lsbCBiZSByYXJlLCBidXQgaWYgZm9yIHNvbWUgcmVhc29uIG9uZSBm
ZWF0dXJlIGNhbm5vdCBiZQp1c2VkLCB0aGVuIGhhdmluZyBqdXN0IG9uZSBpcyBiZXR0ZXIgdGhh
biBub25lLgpXZSBjYW4gZWFzaWx5IGFkZCBjb21waWxlIG9wdGlvbnMgbGF0ZXIgYW5kIGlmIHdl
IHN0YXJ0IHdpdGggc2VwYXJhdGUKa2VybmVsIHBhcmFtZXRlcnMsIHRoZW4gdGhlIHVzZXJzIHdv
bid0IGV2ZW4gbm90aWNlIGEgZGlmZmVyZW5jZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
