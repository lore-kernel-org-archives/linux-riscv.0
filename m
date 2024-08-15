Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E08C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kC0LLWotTcueeJ+wbu+oPnPCXXL93qDEM9QwrSq09s=; b=2FKrerMTmoSS4/
	k62SwmXz3s6obQH0IIwjaMHefZoC96Da4NUzWcaClJ0rp7n7IFNY+uY0JERFm6TVSS3Fs4dR0gJxb
	IxPTDIXEIfYuYOJgEfnNjozIUAVioje3qK3vBQZ5Owx+KPRshfU/iG7eUmpJ1jSt4YJYssTXDeub4
	SdQIUmKXlIIXgAoJPyfEFar2rwG004hwPa7VE4hj11sIANxZubYaZQg9Me4zw9i3kaz5MVHuGU8Ek
	OPZo/XDY3m0YkA9uAYpeuAQ1CgBVjrb5743NGM74JXwZNdyY9ptuqQ/mgtWjKKmn4skT91aq7WPOn
	1FXA2KyfZgsgBuHP23Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secnJ-0000000ARKm-0JiK;
	Thu, 15 Aug 2024 15:53:45 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secnC-0000000ARKK-1dOE
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 15:53:43 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5bec4f71751so671425a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723737216; x=1724342016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZmB4KQjYVPTh/aZQ/7s8sXUMF65fWMG6B2GFw71RUE=;
        b=Fn9T/j9pQQs3BHOpNne4g46mLDQ7SI/JTKQub1CJEdxOUQVZnaByGUp0Ju4o5r5vnc
         2EEiLJ8OnJneQ1vBlnDFI2RuzoCLpY3v2xAyRB0p2rK5KH4ILnf8fVpFxLhYROOFP5Tv
         6/F2AkELL5dwB+CgGqNKcA1h93mdkLCq3rsQUNRZ18LYgiQXx84BS2V/w7BceMhHLQkT
         qZ57phqSFhoy/DyM3k481szIizuCRBTLG+LXeotJaqxoCc6Vo2eAYD3oXwx5japkYEUs
         ih8EYzVdINXzsDbMnOU+nh3DgmtOxC3TpBFs/alk2ecse3DKqOoxgv+35nOU9IhAyRFX
         zUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737216; x=1724342016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZmB4KQjYVPTh/aZQ/7s8sXUMF65fWMG6B2GFw71RUE=;
        b=b1ol1LjKMVheSMizwCHPOeWyLkhgbDytKEkJ8Rmc9gR+RKBjgqmwfeAiqLhN8OG6hT
         KcCctPngQ3RWRjLgHhgqIjr7zEkk55PdoI3KyNhNoxzHBtdOjsQJWIFcvmWt4zQob2Ia
         4jubRAGpBWBwk7ZOfVH0nuQlZz7YGZ3C8wXUT11uvg4n7GalBgrQ/BnM3e3o6rEmgMGU
         G7ZUJ5fytPo8eUIAOZClCBQSO7YtQUqdU2di5Xfef5PqJr6aHArY+Mkl7zPvDW1pgbAO
         2RBB3vjVCAsGc3OOA6rsjQECxB/h8dwMMvztP9kVTLBT818NFxln+vOlRY7losmX4Qut
         xCng==
X-Forwarded-Encrypted: i=1; AJvYcCVIlfgyOyth4CrW5Kc/eUukBydbKAHDjLR8PQER0Mn+KMDAxgfGuDTfwJ/gEc6bdEM85RMsTRxQmaGk7BqozscRb9HRQ/c461decJajepCY
X-Gm-Message-State: AOJu0YyH2RTqKCeXuasiXSzx+VBSdfXdRFNToQDVY4lPqsqiPtJ+K/j/
	fp2FZlt2rjwW18JobWxZRUXm/4GSMy4T3dJwdIDqyuwkok5je3DCPEdeXESm1YEpxgYVmlHL5xD
	lcrxY0EMbi/KQgVbKF19stz4Dywf773fq3c7ZmqkEN8O7I2iJbA4=
X-Google-Smtp-Source: AGHT+IHxkHjdR0Bka34b01bTPscZFfcYjGFbrkKYDNQXiZxcTVLGsR5lN4i7dy7DFgSmdQDBor8i7crc3gu1aYqT9FA=
X-Received: by 2002:a05:6402:27c9:b0:5b4:cd20:f13c with SMTP id
 4fb4d7f45d1cf-5bea1c73ea6mr4137542a12.16.1723737215796; Thu, 15 Aug 2024
 08:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com> <7902c26a-d719-45ad-85d5-61ce6bbc9459@sifive.com>
In-Reply-To: <7902c26a-d719-45ad-85d5-61ce6bbc9459@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Aug 2024 21:23:23 +0530
Message-ID: <CAK9=C2W1dNx5D9dUCDA1-iTGbPQz_utEjzcmOOaoPCHw_sSPpA@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_085338_453062_76A0EE15 
X-CRM114-Status: GOOD (  19.06  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgODozM+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI0LTA4LTE1
IDk6MzAgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCA3
OjAy4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA+IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3
cm90ZToKPiA+Pj4gWWVzLiBTbyB0aGUgcmlzY3YgdGltZXIgaXMgbm90IHdvcmtpbmcgb24gdGhp
cyB0aGluZyBvciBpdCBzdG9wcwo+ID4+PiBzb21laG93Lgo+ID4+Cj4gPj4gVGhhdCdzIGNvcnJl
Y3QuIFdpdGggdGhlIChmaXJtd2FyZSkgZGV2aWNldHJlZSB0aGF0IEVtaWwgaXMgdXNpbmcsIHRo
ZSBPcGVuU0JJCj4gPj4gZmlybXdhcmUgZG9lcyBub3QgaGF2ZSBhIHRpbWVyIGRldmljZSwgc28g
aXQgZG9lcyBub3QgZXhwb3NlIHRoZSAob3B0aW9uYWxbMV0pCj4gPj4gU0JJIHRpbWUgZXh0ZW5z
aW9uLCBhbmQgc2JpX3NldF90aW1lcigpIGRvZXMgbm90aGluZy4KPiA+Cj4gPiBPcGVuU0JJIHVz
ZXMgcGxhdGZvcm0gc3BlY2lmaWMgTS1tb2RlIHRpbWVyIChtdGltZSBhbmQgbXRpbWVjbXApIHRv
Cj4gPiBwcm92aWRlIFNCSSB0aW1lIGV4dGVuc2lvbiB0byBMaW51eC4KPiA+Cj4gPiBUaGUgUklT
Qy1WIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiAodjEuMTAgb3IgaGlnaGVyKSByZXF1aXJlcyBw
bGF0Zm9ybSB0bwo+ID4gcHJvdmlkZSBhIE0tbW9kZSB0aW1lciAobXRpbWUgYW5kIG10aW1lY21w
KS4KPiA+Cj4gPiBUaGlzIHBsYXRmb3JtIG5vdCBoYXZpbmcgYW55IE0tbW9kZSB0aW1lciBpcyB5
ZXQgYW5vdGhlciBSSVNDLVYgc3BlYwo+ID4gdmlvbGF0aW9uIGJ5IHRoaXMgcGxhdGZvcm0uCj4K
PiBZb3UndmUgbWlzdW5kZXJzdG9vZCBoZXJlLiBBbGx3aW5uZXIgRDEgKFQtSEVBRCBDOTA2KSBf
ZG9lc18gaGF2ZSBhbiBNLW1vZGUKPiB0aW1lciAoYSBDTElOVCkuIEl0IGlzIGp1c3Qgb21pdHRl
ZCBmcm9tIGRldmljZXRyZWUgdGhhdCBFbWlsIGhhcHBlbnMgdG8gYmUKPiB1c2luZywgc28gT3Bl
blNCSSBpc24ndCB1c2luZyBpdC4KPgo+IEN1cnJlbnRseSBPcGVuU0JJIGFsbG93cyB0aGUgc3lz
dGVtIHRvIGJvb3Qgd2l0aG91dCBhIHRpbWVyIGRldmljZSwgYW5kIHRoZSBTQkkKPiBzcGVjaWZp
Y2F0aW9uIGRvZXMgbm90IG1hbmRhdGUgdGhlIHRpbWUgZXh0ZW5zaW9uLiBJZiBjb25zZW5zdXMg
aXMgdGhhdCBlaXRoZXIKPiBvZiB0aGVzZSBzaG91bGQgY2hhbmdlLCB0aGF0J3MgZmluZSwgYnV0
IGN1cnJlbnRseSBJIHNlZSBub3RoaW5nIGluIGVpdGhlciB0aGUKPiBwcml2aWxlZ2VkIHNwZWMg
bm9yIHRoZSBTQkkgc3BlYyB0aGF0IGd1YXJhbnRlZXMgdGhlIGF2YWlsYWJpbGl0eSBvZiBzb21l
IHRpbWVyCj4gdG8gdGhlIGtlcm5lbCBpbiBTLW1vZGUuCj4KClRoZSBTQkkgdGltZSBpcyBjZXJ0
YWlubHkgb3B0aW9uYWwgaGVuY2UgT3BlblNCSSBkb2VzIG5vdCBoYW5nIG9yIGNyYXNoIGlmCml0
IGNhbid0IHByb3ZpZGUgU0JJIHRpbWUgdG8gc3VwZXJ2aXNvciBzb2Z0d2FyZS4KCk15IGNvbW1l
bnQgaXMgZnJvbSB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBwZXJzcGVjdGl2ZToKCjEpIFBy
aXYgdjEuMTAgc2F5cyAiUGxhdGZvcm1zIHByb3ZpZGUgYSByZWFsLXRpbWUgY291bnRlciwgZXhw
b3NlZCBhcyBhCm1lbW9yeS1tYXBwZWQgbWFjaGluZS1tb2RlIHJlZ2lzdGVyLCBtdGltZS4iIGlu
IHNlY3Rpb24gIjMuMS4xNSBNYWNoaW5lClRpbWVyIFJlZ2lzdGVycyAobXRpbWUgYW5kIG10aW1l
Y21wKSIuCgoyKSBTaW1pbGFyIHN0YXRlbWVudCBpbiBQcml2IHYxLjExIHNlY3Rpb24gIjMuMS4x
MCBNYWNoaW5lIFRpbWVyIFJlZ2lzdGVycwoobXRpbWUgYW5kIG10aW1lY21wKSIKCjMpIFNpbWls
YXIgc3RhdGVtZW50IGluIFByaXYgdjEuMTIgc2VjdGlvbiAiMy4yLjEgTWFjaGluZSBUaW1lciBS
ZWdpc3RlcnMKKG10aW1lIGFuZCBtdGltZWNtcCkiCgpCdXQgc2luY2UgdGhlIE0tbW9kZSB0aW1l
ciB3YXMgb21pdHRlZCBmcm9tIHRoZSBEVCwgSSB0aGluayB0aGUgRFQgd2FzCmFsd2F5cyBpbmNv
bXBsZXRlIGZyb20gdGhlIE0tbW9kZSBwZXJzcGVjdGl2ZS4KClJlZ2FyZHMsCkFudXAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
