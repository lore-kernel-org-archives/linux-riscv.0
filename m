Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC8C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6p3a9FUurgYt6uhWjrwGzbe95JhORb1d97FzE0sc+hM=; b=N1/TDizFHKRP645VBuot4b2dL7
	2H7XXeyy99WdJgoph8aZ7zsh3zqgtB4Sgwmp2isfBDzxC4TdJ1mNeCWf3uySRy6rQIrD1Sfi+BSIw
	RzWf591Q3kUU26XTmj8hglfcWKOVs7pPjgkufQWdtAqVJP5b6kmHlofZqNw3L8gYO4BEuGhtXvUUJ
	xuWUCFRMtZ+wLhnZ9nwe6WYjsl7Oq0GWfoLsjfsswv/KaLzxwnjq6yftrn3w2T23RziqzmCXtDVUi
	LWFkwouHVw81yyEAzPiu5d6SbEMLzpJuQmWY3SPr+2dM/NtIYDjzfIxiVjSVasUczA8jap84hoUqq
	wbvHUxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhf5-00000003ql7-1Aun;
	Wed, 05 Feb 2025 15:49:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhf2-00000003qkK-3zpJ
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 15:49:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f01fe1ce8so30614465ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738770596; x=1739375396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEF5l/p5C324GLPPrgYPBLACvzIojLaAWSwDxUoWGzM=;
        b=fYuO2CgYRt3CgwKZnhP0vXAF69Kzf1qkHmC8bmPqLyrFYO+2+ahyN9x8s/gxh7+vQH
         X8AfISr7lm7iEHNwYgbXUThe4m7ys//CVPjpU60HJQ1lIawSSRbDt9+8hL8fLx0kXqSn
         BOtlpqa1t0EERz+XmcyOXpGieCFyhJBrxu7wnF3EtTNhUI2du5w5/soty5CAe91mZjf5
         8hwj39SIjkulYDS9jZI/+9nLMc4PEfS2AuXyjWLJHLRidck5wmtz92cR1j+iQ9zsX7FH
         eIoVa/jtZ3isowWbCOlxXKeaIvtW3VKb9BjmbBudylWKMFfT6qL7rvmEX6UOmvs4aftq
         aiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770596; x=1739375396;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEF5l/p5C324GLPPrgYPBLACvzIojLaAWSwDxUoWGzM=;
        b=WfQ1k2o7lRCjj64q2VhrbcbEl8w/CIUE0EWr2FAVK205UCje+TpbfAynYZpgrW5ndt
         Lw/HNlxBrcuTSr8KzQwGuKzUc6JJ5PO7uaMe9YrgAr5xSMcy6tS0KKPAUVGiI+5yvx4s
         JtNpmzExBGyUFnKTGstPtpi265TgOBO/ZdLnGERSS09t3QGorDK1XbTGFIRLJRIiRzyg
         v63LDmBqFIX5evkV35mLrYry4MvsehD9Ie7XXOAAujJMmzKyLecpr80xn7MSme0KIXWv
         ZLRrgUCkKSj+sLHylhjUBFxUImAps+feLpQynfumAEgrvpn9BJaoMx0UZn8WSg1xsltC
         AAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/1M/nDcGGY0LtYx2YQf3WeHTRDhUa8DMBZX2vEXZg6JtHEvdge0eoLDb6BueQHCg06mDUKxw5q2iJsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwInDhjIXp9aKfYXmFLkMCAbw+Hg3EJUEUL+ZatCsmsM+04S9ux
	vAf8z4mSgRWF9sjFrrUJ2i6XaqAjRBiCNKQn5++QGucUZzUMSUphs1Bka80D7e0=
X-Gm-Gg: ASbGncuPKioD+epUk9U35lZwKlkxV0HjIhAYsKyGG2PPmBXzECnKwd5dHhgy/zXKE+3
	1d/tH1detLxpqlxLSyGvQjPRY5NVnmUoJVelzKiDzjDLmgZJ4yKrCq2466tsT1/RDtbV2B4eeVT
	PREHFf0LN+FvGT4zANSY0CT0W0+yoTZKoaIHJLSVxDpongTM1/VROQoGP0ClomNZQYT3AnNVbxH
	dTThpp1WDFya+VLxjsyr/EX3ZXnPAsUxXkH5tQyKDnzl5KkJav29QvLI95YIrsGp5DAW53PFXSv
	G5EDgFmYlOfP
X-Google-Smtp-Source: AGHT+IHUmrYCzENxX4gtpHt6Z7EYDLhXL5NzJJrm70zCOwtBKMkO6XCbLWbJF3K01CHLL2vXmPs+9Q==
X-Received: by 2002:a17:903:22cf:b0:216:4c88:d93a with SMTP id d9443c01a7336-21f17f30666mr53671915ad.48.1738770595971;
        Wed, 05 Feb 2025 07:49:55 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f018162e2sm36808905ad.121.2025.02.05.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:49:55 -0800 (PST)
Date: Wed, 05 Feb 2025 07:49:55 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 07:49:53 PST (-0800)
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic functions
In-Reply-To: <17E9A830-AE5C-41F5-AC07-2BD9C70739BB@jrtc27.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, samuel.holland@sifive.com,
  Conor Dooley <conor@kernel.org>, arikalo@gmail.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Will Deacon <will@kernel.org>, peterz@infradead.org,
  boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>, yury.norov@gmail.com,
  linux@rasmusvillemoes.dk, parri.andrea@gmail.com, leobras@redhat.com, guoren@kernel.org,
  ericchancf@google.com, linux-kernel@vger.kernel.org, djordje.todorovic@htecgroup.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jrtc27@jrtc27.com
Message-ID: <mhng-50508e34-b5cc-4dad-b4d4-7d2bac5a74d8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_074956_992850_9D7BE89C 
X-CRM114-Status: GOOD (  27.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwMyBGZWIgMjAyNSAxMzozNDo0OCBQU1QgKC0wODAwKSwganJ0YzI3QGpydGMyNy5j
b20gd3JvdGU6Cj4gT24gMyBGZWIgMjAyNSwgYXQgMTk6NTAsIENoYXJsaWUgSmVua2lucyA8Y2hh
cmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+PiAKPj4gT24gTW9uLCBGZWIgMDMsIDIwMjUgYXQg
MDE6MzA6NDhQTSAtMDYwMCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+PiBIaSBDaGFybGllLAo+
Pj4gCj4+PiBPbiAyMDI1LTAyLTAzIDE6MTIgUE0sIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4+
PiBPbiBTdW4sIEZlYiAwMiwgMjAyNSBhdCAwODowODo1MFBNICswMDAwLCBDb25vciBEb29sZXkg
d3JvdGU6Cj4+Pj4+IE9uIFNhdCwgRmViIDAxLCAyMDI1IGF0IDAxOjA0OjI1UE0gKzAxMDAsIEFs
ZWtzYW5kYXIgUmlrYWxvIHdyb3RlOgo+Pj4+Pj4gT24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgNDoy
M+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4+
Pj4gCj4+Pj4+Pj4+IEZyb206IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+Pj4+Pj4+PiAK
Pj4+Pj4+Pj4gVXNlIG9ubHkgTFIvU0MgaW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVudCBhdG9taWMg
ZnVuY3Rpb25zLgo+Pj4+Pj4+IAo+Pj4+Pj4+IEluIHRoZSBwcmV2aW91cyBwYXRjaCB5b3UgbWVu
dGlvbiB0aGF0IHRoaXMgaXMgdG8gc3VwcG9ydCBNSVBTIFA4NzAwLiBDYW4KPj4+Pj4+PiB5b3Ug
ZXhwYW5kIG9uIHdoeSB0aGlzIGNoYW5nZSBpcyByZXF1aXJlZD8gVGhlIGRhdGFzaGVldCBhdCBb
MV0gc2F5czoKPj4+Pj4+PiAKPj4+Pj4+PiAiVGhlIFA4NzAwIGNvcmUgaXMgY29uZmlndXJlZCB0
byBzdXBwb3J0IHRoZSBSVjY0R0NaYmFfWmJiIChHID0gSU1BRkQpCj4+Pj4+Pj4gU3RhbmRhcmQg
SVNBLiBJdCBpbmNsdWRlcyB0aGUgUlY2NEkgYmFzZSBJU0EsIE11bHRpcGx5IChNKSwgQXRvbWlj
IChBKSwKPj4+Pj4+PiBTaW5nbGUtUHJlY2lzaW9uIEZsb2F0aW5nIFBvaW50IChGKSwgRG91Ymxl
IChEKSwgQ29tcHJlc3NlZCAoQykgUklTQy1WCj4+Pj4+Pj4gZXh0ZW5zaW9ucywgYXMgd2VsbCBh
cyB0aGUgYXMgd2VsbCBhcyB0aGUgYml0LW1hbmlwdWxhdGlvbiBleHRlbnNpb25zCj4+Pj4+Pj4g
KFpiYSkgYW5kIChaYmIpIgo+Pj4+Pj4+IAo+Pj4+Pj4+IFRoZSAiQSIgZXh0ZW5zaW9uIGlzIGEg
cGFydCBvZiAiRyIgd2hpY2ggaXMgbW9zdGx5IGFzc3VtZWQgdG8gZXhpc3QgaW4KPj4+Pj4+PiB0
aGUga2VybmVsLiBBZGRpdGlvbmFsbHksIGhhdmluZyB0aGlzIGJlIGEgY29tcGlsYXRpb24gZmxh
ZyB3aWxsIGNhdXNlCj4+Pj4+Pj4gdHJhcHMgb24gZ2VuZXJpYyBrZXJuZWxzLiBXZSBnZW5lcmFs
bHkgdHJ5IHRvIHB1c2ggZXZlcnl0aGluZyB3ZSBjYW4KPj4+Pj4+PiBpbnRvIHJ1bnRpbWUgZmVh
dHVyZSBkZXRlY3Rpb24gc2luY2UgdGhlcmUgYXJlIHNvIG1hbnkgcG9zc2libGUgdmFyaWFudHMK
Pj4+Pj4+PiBvZiByaXNjdi4KPj4+Pj4+PiAKPj4+Pj4+PiBFeHByZXNzaW5nIG5vdCBiZWluZyBh
YmxlIHRvIHBlcmZvcm0gYSBmZWF0dXJlIGxpa2UgdGhpcyBpcyBub3JtYWxseQo+Pj4+Pj4+IGJl
dHRlciBleHByZXNzZWQgYXMgYW4gZXJyYXRhLiBUaGVuIGdlbmVyaWMga2VybmVscyB3aWxsIGJl
IGFibGUgdG8KPj4+Pj4+PiBpbmNsdWRlIHRoaXMsIGFuZCBhbnlib2R5IHdobyBkb2Vzbid0IHdh
bnQgdG8gaGF2ZSB0aGUgZXh0cmEgbm9wcwo+Pj4+Pj4+IGludHJvZHVjZWQgY2FuIGRpc2FibGUg
dGhlIGVycmF0YS4gQSBzaW1pbGFyIGFwcHJvYWNoIHRvIHdoYXQgSSBwb2ludGVkCj4+Pj4+Pj4g
b3V0IGxhc3QgdGltZSBzaG91bGQgd29yayBoZXJlIHRvbyAoYnV0IHdpdGggbW9yZSBwbGFjZXMg
dG8gcmVwbGFjZSkKPj4+Pj4+PiBbMl0uCj4+Pj4+Pj4gCj4+Pj4+Pj4gWzFdIGh0dHBzOi8vbWlw
cy5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjQvMTEvUDg3MDBfRGF0YV9TaGVldC5wZGYKPj4+
Pj4+PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9aMi1VTmZ3Y0FRWVpxVkJVQGdo
b3N0L1QvCj4+Pj4+PiAKPj4+Pj4+IFNvIGZhciB3ZSBoYXZlbid0IGZvdW5kIGEgd2F5IHRvIGRv
IHRoaXMgdXNpbmcgZXJyYXRhLgo+Pj4+PiAKPj4+Pj4gWW91IG1lYW4gdXNpbmcgYWx0ZXJuYXRp
dmVzPyBOb3QgaW1wbGVtZW50aW5nIEEsIGJ1dCBpbnN0ZWFkCj4+Pj4+IGltcGxlbWVudGluZyBa
YWxyc2MsIGlzIG5vdCBhbiBlcnJhdHVtLiBJdCdzIGEgZGVzaWduIGRlY2lzaW9uLgo+Pj4+IAo+
Pj4+IFdlIGNvdWxkIGRvIHRoZSBzYW1lIHRoaW5nIHdlIGRvIHdpdGggbWlzYWxpZ25lZCBhY2Nl
c3MgZGV0ZWN0aW9uIGFuZAo+Pj4+IHJ1biBzb21lIGluc3RydWN0aW9ucyB0byBkZXRlcm1pbmUg
aWYgdGhlc2UgaW5zdHJ1Y3Rpb25zIGFyZSBiZWluZwo+Pj4+IGVtdWxhdGVkLiAgSWYgdGhleSBh
cmUgYmVpbmcgZW11bGF0ZWQsIHBhdGNoIGFsbCBvZiB0aGUgcGxhY2VzIHRvIHVzZQo+Pj4+IHph
bHJzYy4KPj4+IAo+Pj4gSXMgdGhlIGltcGxpY2F0aW9uIGhlcmUgdGhhdCB0aGUgcmlzY3YsaXNh
LWV4dGVuc2lvbnMgbGlzdCBwYXNzZWQgdG8gdGhlIGtlcm5lbAo+Pj4gd2lsbCBjb250YWluICJh
IiwgZXZlbiB0aG91Z2ggdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgaXQsIGJlY2F1c2Ug
QU1PcyBhcmUKPj4+IGVtdWxhdGVkIGluIE0tbW9kZT8KPj4+IAo+Pj4gSWYgdGhhdCBpcyBub3Qg
dGhlIGNhc2UsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHJ1bnRpbWUgZGV0ZWN0aW9uLiBUaGUgYWx0
ZXJuYXRpdmUKPj4+IGVudHJ5IGNhbiBjaGVjayBSSVNDVl9JU0FfRVhUX1pBQU1PICh3aGljaCB3
b3VsZCBiZSBpbXBsaWVkIGJ5IFJJU0NWX0lTQV9FWFRfYSkKPj4+IGluIHRoZSBJU0EgYml0bWFw
IGxpa2Ugbm9ybWFsLgo+PiAKPj4gVGhhdCB3b3VsZCBiZSBtdWNoIGJldHRlciEgSSB3YXMgdW5k
ZXIgdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgdXNlY2FzZQo+PiBmb3IgdGhpcyBwYXRjaCB3YXMg
dGhhdCB0aGV5IHdlcmUgcGFzc2luZyBpbiAiYSIgYW5kIHdhbnRpbmcgdG8gb25seSBnZXQKPj4g
emFscnNjLiBXZSBzaG91bGQgYmUgYWJsZSB0byBjaGVjawo+PiBSSVNDVl9JU0FfRVhUX1pBQU1P
L1JJU0NWX0lTQV9FWFRfWkFMUlNDIHRvIGdldCB0aGUgaW5mb3JtYXRpb24gd2l0aG91dAo+PiBy
dW50aW1lIGRldGVjdGlvbi4KPgo+IEluIExMVk0gYXQgbGVhc3QgLW1jcHU9bWlwcy1wODcwMCBl
bmFibGVzIHRoZSBmdWxsIEEgZXh0ZW5zaW9uLi4uCgpTbyB0aGVuIEkgdGhpbmsgd2UgbmVlZCBz
b21lIGhlbHAgZnJvbSB0aGUgSFcgdmVuZG9yIGhlcmUuICAKU3BlY2lmaWNhbGx5OiBkbyB0aGVz
ZSBzeXN0ZW1zIGltcGxlbWVudCBBIHZpYSBNLW1vZGUgdHJhcHMgKGllLCB3aXRoIGEgCnBlcmZv
cm1hbmNlIHBlbmFsdHkpIG9yIGlzIHRoZXJlIHNvbWV0aGluZyBmdW5jdGlvbmFsIGVycmF0dW0g
aW4gdGhlIEEgCmltcGxlbWVudGF0aW9uLgoKSWYgaXQncyBqdXN0IGEgcGVyZm9ybWFuY2UgdGhp
bmcgdGhlbiB3ZSBuZWVkIHNvbWUgYmVuY2htYXJrIGp1c3RpZnlpbmcgCnRoZSBleHRyYSB3b3Jr
LCB3aGljaCBtZWFucyBzb21lIGhhcmR3YXJlIHdlIGNhbiBwb2ludCBhdCB0byBydW4gdGhlIApi
ZW5jaG1hcmsuICBQcm9iYWJseSBhbHNvIGJlc3QgdG8gc2hpbSB0aGlzIGluIHZpYSBhbHRlcm5h
dGl2ZXMsIHNvIHdlIApjYW4ga2VlcCBtdWx0aS12ZW5kb3Iga2VybmVscyB3b3JraW5nLgoKSWYg
aXQncyBhIGZ1bnRpb25hbCBpc3N1ZSB0aGVuIHdlIG5lZWQgdG8ga25vdyB3aGF0J3MgYWN0dWFs
bHkgYnJva2VuLgoKRWl0aGVyIHdheSB0aGlzIHNob3VsZCBiZSBleHBvc2VkIHRvIHVzZXJzcGFj
ZS4KCj4KPiBKZXNzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
