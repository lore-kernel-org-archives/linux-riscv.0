Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D4C10AB833
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSZm17asp4R+4JdqZA9yQO6y20UFl7Y0DgoGzJbMqRQ=; b=mkttDKwWoga7PX
	M5/vJSGpwgRKoDP4lpFJRFxxkhW9bnkhzZFngwaJGyE/GDQQw/4SoK7MVm37zg4I7YuiRwI3iTTss
	xM/wt0z+1y60ODRwyfwPY7lrMMgAd1HKJ23/+gWZYQrkhnDlUGyWP+8dI1NnZnsLDwGEXczBcBWZV
	HsBOxp6CS2equ/2f3DsalbpG8l8r2dT2j3daGO7ww+YTL1nz4fOY4MnaFNG8FMmDZwoVGEq/o/tZz
	yHIVubCkkmoJ4sjacafddRMEhSewz3qm86TwM0RnGQ7jD/Nzr2bRhUave7Yua+frUU0uVroHjf8QE
	e0Ww+Ub+XK8akxMIxm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tuw-00000006NG5-0BA6;
	Thu, 26 Mar 2026 23:15:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tut-00000006NEx-0Upn
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 23:15:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b0b260d309so16075ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 16:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774566905; cv=none;
        d=google.com; s=arc-20240605;
        b=TO7w9aI5EjqTqtdKCr5RaDsEReyPaaBk8EF0uS8Yp7Lt07qeiQfo4Mnc1cwKp3jhu1
         cE0cjaSQ9hltwM6rnJz+cYxnryWrXunOHrfcusHl85LT509G6da3/PkI/y7oh43L3Z+v
         gxAZVLVQ0ItnQmNXJko4r27GSfRsHQIpG8x1FUAELAq2sCIgNuhbhCA3zQurrMQkBJdn
         L7BikTSqWCpMeYwzWZfbhTKe8/mjoTP3XomMC9c/8UKdgphXEAXk3NTLrw9sS+qA/7Go
         ws14g3Cz0Zxy+Jxo6Ac+ZJ2aITN9ba2qrvbJbckecKaPbxBFnhMh0TvjLcMldvIpk3Mi
         QCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        fh=JYVgRqxJHnC224fDrN5lolkw9PrbJZiTmnfy+vFm/Es=;
        b=it7TAtjfmMKIks75ebjCUKB8ePIbawHWJYUIqsNPMzqnSjbbqUqUNBvf3ZKHEY+ing
         zD0GPBk9KKDht9RKHohhpQKGRNqmrQ49mLD7vleSBMJ3qdU3nUKY2adHCj89MeIVp3Jq
         oUSqnj7gJ0LjkoJHRlmWt+V7yUI5HAOreBSS95AUfRr62dj8F0w/TgsLcn0pq5rI8KXg
         PDef9GNaTnhe8InriDyJN7vD5paRXSDQQXKJuHCVUJhjBFsoXfCufuOOEDUvGuJDaFhf
         lL28TFXqcxaZS/1mPPPJaYdKE5scngSR1PxjhFlufVuO1utzznZuAY7v3Zxft0iJMlw5
         /Hag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774566905; x=1775171705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        b=nb+2poqmxMTxzY+aWm16UwryzfyaiiKzAs3fgRPS0qImcW8s3edwGjqQOvUK9JV//v
         ZzM/3mJT84tovSgXpgMQ7RfQ3FhNPJNxZHvQvPbCwzJ01rZDoLCw4e6uQ/yAZgPnu4m2
         oP4TnBveInN6j4ZMT3+Xqa3rso/yREZJQyWVf7QVy3jGXN1HgVNhwa8CLQGWtt9zPkkn
         5T/6crQ0MUGrwqruAXpVz0mYX8HM4XW4Fl8Bqrm7fADwPHWQv8VTZ/qzl7nTfM/sTwwp
         PvEu5ufWow0BUdBmZOBCDTBUcOdd9b+TncQYRyiIDyeKsXKnVEBZ8v1EJcc90TrYVZHi
         2A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566905; x=1775171705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2YD6pwogaEbBAngQ7jzL1Df9t10z5n8+TMyot+6ut0=;
        b=SHSLHxP+ZefBtzhnLs2GcgrC1ISaC+HeSrvK6rYZLmsHQ1Vbd8nZm/R4ugn+s0aEsa
         Nwkfr22a/BDMxsoM44vN+YuwpfsWQT4zLhhkN6knr0feeV/AoGQk4Mmo7aaVOgpTr1kh
         T7SO/9vGZJPaXdY0wb6U/dU/8Li1b5CZiJ2ngHioYRl2Tmm4+WekBrHPiBJxHwcL9ZDE
         XflyM05nKxVfaGFLw+grVRChEGWifDJTpESfUsPwYwfgoFteTFXWzKn1LR3HVqlBNOWG
         O2FLYACGTY1iA0UlF0fPiRR3dzZwGWPSPTELuCmr8TjjvQD/eGSn8EWuKCSwOaFGYFG5
         B99w==
X-Forwarded-Encrypted: i=1; AJvYcCXiEu4I8BxKuZBjoT1XJ8nZ/3E4HqvjAnwLCrxx6a29fdVGAapfi4jlEB1I3TZDawbvMAgcjl2/no28LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdtLaLxQ/XWJKiPkiuAh4ONlPmBYY+48/tRlLzPPfhZJj5t5DL
	/DH9UQOGrh28OIwNu05M2Qr1+YDzAk9yWCkMGZJMv+GizJcy9DYfhFrclod8jt2DlNhxe0CGy7r
	Y42mSfsGH0H2jTJy3rPpa6EiMHYO2y/m6+aOcNqvl
X-Gm-Gg: ATEYQzxzwtYEZryRWHZNfRGJiw1DArEns6fqY/R2ydF1ePVIioFYXF70U2IUkO+vqZD
	yoHB2KDPFmZRkp3x+6Mb/mxNExxruPdW4oSUcIt9mZ2aPA0MDkuxj5hIs6UrV2aJLpxiP0kyjdj
	ClnpC9/BnrXadylkycrBlvPjtslD2+EIRtmVn822n5j8uCE5YYCAMhSgLpOdrUwTWy/MKv9qK+n
	Z75BzbfdCnwewTqxatsmGsEpnO8K2GchRYBHQPuzYkIyQTCgVTQfr2R3FkCE0VGv54UgJtF4UaX
	PmEGunI=
X-Received: by 2002:a17:902:ef46:b0:2b0:5193:1212 with SMTP id
 d9443c01a7336-2b0cc23f103mr1451505ad.4.1774566905014; Thu, 26 Mar 2026
 16:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <abxs-2rozL1tBEO1@google.com> <20260321234220.848859-1-irogers@google.com>
 <acW4Z2KJbyPZM1SG@google.com>
In-Reply-To: <acW4Z2KJbyPZM1SG@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Mar 2026 16:14:52 -0700
X-Gm-Features: AQROBzAygKd6oTfrEHZEo1yOPUniUJvjrCTN9i1V25cS3M3lNv5jNRoxNUpz8Kw
Message-ID: <CAP-5=fV54H9o4FjALZU3wzEjBjNgGBb6zhaRmrjhseT_noggZA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
To: Namhyung Kim <namhyung@kernel.org>
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, amadio@gentoo.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_161507_188152_C731E967 
X-CRM114-Status: GOOD (  28.90  )
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

T24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMzo1MeKAr1BNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1hciAyMSwgMjAyNiBhdCAwNDo0MjoxOFBN
IC0wNzAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gbGlidW53aW5kIHN1cHBvcnQgZXhpc3RzIGZv
ciAiLS1jYWxsLWdyYXBoIGR3YXJmIiwgaG93ZXZlciwgbGlidW53aW5kCj4gPiBzdXBwb3J0IGhh
cyBiZWVuIG9wdC1pbiByYXRoZXIgdGhhbiBvcHQtb3V0IHNpbmNlIExpbnV4IHY2LjEzIGFzIGxp
YmR3Cj4gPiBpcyBwcmVmZXJyZWQgLSBjb21taXQgMTNlMTdjOWZmNDkxMTlhYSAoInBlcmYgYnVp
bGQ6IE1ha2UgbGlidW53aW5kCj4gPiBvcHQtaW4gcmF0aGVyIHRoYW4gb3B0LW91dCIpLiBBIHBy
b2JsZW0gd2l0aCB0aGUgbGliZHcgc3VwcG9ydCB3YXMKPiA+IHRoYXQgaXQgd2FzIHNsb3csIGFu
IGlzc3VlIGZpeGVkIGluIExpbnV4IHY3LjAgaW4gY29tbWl0IDZiMjY1OGIzZjM2YQo+ID4gKCJw
ZXJmIHVud2luZC1saWJkdzogRG9uJ3QgZGlzY2FyZCBsb2FkZWQgRUxGL0RXQVJGIGFmdGVyIGV2
ZXJ5Cj4gPiB1bndpbmQiKS4gQXMgc3VjaCBsaWJ1bndpbmQgc3VwcG9ydCBpcyBub3cgdW5uZWNl
c3NhcnkuCj4gPgo+ID4gVGhlIHBhdGNoIHNlcmllczoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyNjAzMDUyMjE5MjcuMzIzNzE0NS0xLWlyb2dlcnNAZ29vZ2xlLmNvbS8KPiA+
IGxvb2tlZCB0byBtYWtlIHRoZSBsaWJ1bndpbmQgc3VwcG9ydCBpbiBwZXJmIHNpbWlsYXIgdG8g
dGhlIGxpYmR3Cj4gPiBzdXBwb3J0LCBhbGxvdyBjcm9zcy1hcmNoaXRlY3R1cmUgdW53aW5kaW5n
LCBldGMuIFRoaXMgd2FzIG1vdGl2YXRlZAo+ID4gYnkgdGhlIHBlcmYgcmVncyBjb252ZW50aW9u
cyBiZWluZyBhbHRlcmVkIGJ5IHRoZSBhZGRpdGlvbiBvZiB4ODYgQVBYCj4gPiBzdXBwb3J0Ogo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDIwOTA3MjA0Ny4yMTgwMzMyLTEt
ZGFwZW5nMS5taUBsaW51eC5pbnRlbC5jb20vCj4gPiBJdCBpcyBuZWNlc3NhcnkgdG8gdHJhbnNs
YXRlIHRoZSBsaWJyYXJ5J3Mgbm90aW9uIG9mIHJlZ2lzdGVycyB0byB0aGUKPiA+IHBlcmYgcmVn
aXN0ZXIgY29udmVudGlvbiBzbyB0aGF0IHRoZSBzdGFjayB1bndpbmRpbmcgc3RhdGUgY2FuIGJl
Cj4gPiBpbml0aWFsaXplZC4gT24gdGhpcyBzZXJpZXMgaXQgd2FzIHN0YXRlZCB0aGF0IHJlbW92
aW5nIGxpYnVud2luZAo+ID4gc3VwcG9ydCBmcm9tIHBlcmYgc2hvdWxkIGJlIGFuIG9wdGlvbiwg
cmF0aGVyIHRoYW4gdXBkYXRpbmcgc3VwcG9ydDoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvYWJ4cy0ycm96TDF0QkVPMUBnb29nbGUuY29tLwo+ID4gVGhpcyB3YXMgYWxzbyB3aGF0
IG1vdGl2YXRlZCBtYWtpbmcgbGlidW53aW5kIG9wdC1pbiByYXRoZXIgdGhhbgo+ID4gb3B0LW91
dC4KPiA+Cj4gPiBHaXZlbiB0aGF0IDcgbWlub3IgcmVsZWFzZXMgaGF2ZSBoYXBwZW5lZCB3aXRo
IGxpYnVud2luZCAiZGVwcmVjYXRlZCIKPiA+IGJ5IG1ha2luZyBpdCBvcHQtaW4sIGxldCdzIHJl
bW92ZSB0aGUgbGlidW53aW5kIHN1cHBvcnQuIFRoZXJlIGRvZXNuJ3QKPiA+IGFwcGVhciB0byBi
ZSBhbnkgZGlzYWdyZWVtZW50IHRvIHRoaXMgb24gdGhlIG1haWxpbmcgbGlzdC4KPgo+IEknbSBu
b3Qgc3VyZSBpZiB3ZSB3YW50IHRvIHJlbW92ZSBpdCBub3cuICBJIHRoaW5rIHdlIG5lZWQgbW9y
ZSB0aW1lIHRvCj4gdmVyaWZ5IGxpYmR3IHVud2luZGluZyBpcyBzdGFibGUgYW5kIGZhc3QgZW5v
dWdoLiAgQWxzbyBtYXliZSB3ZSBjYW4KPiBhZGQgYnVpbGQtIG9yIHJ1bi10aW1lIHdhcm5pbmcg
d2hlbiBwZW9wbGUgdHJ5IHRvIHVzZSBsaWJ1bndpbmQuCgpJJ3ZlIGhhZCBpc3N1ZXMgd2l0aCBv
bGQgdmVyc2lvbnMgb2YgbGliZHcsIGJ1dCBwcmVzdW1hYmx5IHRoZQpkaXN0cmlidXRpb25zIHdv
bid0IHVwZGF0ZSBwZXJmIHdpdGhvdXQgbGliZHcuIEdpdmVuIHdlJ3JlIHdhaXRpbmcKc2hvdWxk
IHdlIGxhbmQgdGhlIGNsZWFudXAgaW46Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
NjAzMDUyMjE5MjcuMzIzNzE0NS0xLWlyb2dlcnNAZ29vZ2xlLmNvbS8KV2UgaGF2ZSB0ZXN0IGNv
dmVyYWdlLgoKVGhhbmtzLApJYW4KCj4gVGhhbmtzLAo+IE5hbWh5dW5nCj4KPiA+Cj4gPiBJYW4g
Um9nZXJzICgyKToKPiA+ICAgcGVyZiBidWlsZDogUmVtb3ZlIGxpYnVud2luZCBzdXBwb3J0Cj4g
PiAgIHRvb2xzIGJ1aWxkOiBSZW1vdmUgbGlidW53aW5kIGZlYXR1cmUgdGVzdHMKPiA+Cj4gPiAg
dG9vbHMvYnVpbGQvZmVhdHVyZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgIDMxIC0KPiA+
ICB0b29scy9idWlsZC9mZWF0dXJlL3Rlc3QtbGlidW53aW5kLWFhcmNoNjQuYyAgfCAgMjcgLQo+
ID4gIHRvb2xzL2J1aWxkL2ZlYXR1cmUvdGVzdC1saWJ1bndpbmQtYXJtLmMgICAgICB8ICAyOCAt
Cj4gPiAgLi4uL3Rlc3QtbGlidW53aW5kLWRlYnVnLWZyYW1lLWFhcmNoNjQuYyAgICAgIHwgIDE3
IC0KPiA+ICAuLi4vZmVhdHVyZS90ZXN0LWxpYnVud2luZC1kZWJ1Zy1mcmFtZS1hcm0uYyAgfCAg
MTcgLQo+ID4gIC4uLi9mZWF0dXJlL3Rlc3QtbGlidW53aW5kLWRlYnVnLWZyYW1lLmMgICAgICB8
ICAxNyAtCj4gPiAgdG9vbHMvYnVpbGQvZmVhdHVyZS90ZXN0LWxpYnVud2luZC14ODYuYyAgICAg
IHwgIDI4IC0KPiA+ICB0b29scy9idWlsZC9mZWF0dXJlL3Rlc3QtbGlidW53aW5kLXg4Nl82NC5j
ICAgfCAgMjggLQo+ID4gIHRvb2xzL2J1aWxkL2ZlYXR1cmUvdGVzdC1saWJ1bndpbmQuYyAgICAg
ICAgICB8ICAyOCAtCj4gPiAgdG9vbHMvcGVyZi9Eb2N1bWVudGF0aW9uL3BlcmYtY2hlY2sudHh0
ICAgICAgIHwgICAxIC0KPiA+ICB0b29scy9wZXJmL0RvY3VtZW50YXRpb24vcGVyZi1jb25maWcu
dHh0ICAgICAgfCAgIDQgKy0KPiA+ICB0b29scy9wZXJmL0RvY3VtZW50YXRpb24vcGVyZi1yZWNv
cmQudHh0ICAgICAgfCAgIDIgKy0KPiA+ICB0b29scy9wZXJmL01ha2VmaWxlLmNvbmZpZyAgICAg
ICAgICAgICAgICAgICAgfCAxNjMgKy0tLQo+ID4gIHRvb2xzL3BlcmYvTWFrZWZpbGUucGVyZiAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMyAtCj4gPiAgdG9vbHMvcGVyZi9hcmNoL2FybS91dGls
L0J1aWxkICAgICAgICAgICAgICAgIHwgICAxIC0KPiA+ICB0b29scy9wZXJmL2FyY2gvYXJtL3V0
aWwvdW53aW5kLWxpYnVud2luZC5jICAgfCAgNTAgLS0KPiA+ICB0b29scy9wZXJmL2FyY2gvYXJt
NjQvdXRpbC9CdWlsZCAgICAgICAgICAgICAgfCAgIDEgLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9h
cm02NC91dGlsL3Vud2luZC1saWJ1bndpbmQuYyB8ICAxNyAtCj4gPiAgdG9vbHMvcGVyZi9hcmNo
L2xvb25nYXJjaC91dGlsL0J1aWxkICAgICAgICAgIHwgICAxIC0KPiA+ICAuLi4vYXJjaC9sb29u
Z2FyY2gvdXRpbC91bndpbmQtbGlidW53aW5kLmMgICAgfCAgODIgLS0KPiA+ICB0b29scy9wZXJm
L2FyY2gvbWlwcy91dGlsL0J1aWxkICAgICAgICAgICAgICAgfCAgIDEgLQo+ID4gIHRvb2xzL3Bl
cmYvYXJjaC9taXBzL3V0aWwvdW53aW5kLWxpYnVud2luZC5jICB8ICAyMiAtCj4gPiAgdG9vbHMv
cGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9CdWlsZCAgICAgICAgICAgIHwgICAxIC0KPiA+ICAuLi4v
cGVyZi9hcmNoL3Bvd2VycGMvdXRpbC91bndpbmQtbGlidW53aW5kLmMgfCAgOTIgLS0KPiA+ICB0
b29scy9wZXJmL2FyY2gveDg2L3V0aWwvQnVpbGQgICAgICAgICAgICAgICAgfCAgIDEgLQo+ID4g
IHRvb2xzL3BlcmYvYXJjaC94ODYvdXRpbC91bndpbmQtbGlidW53aW5kLmMgICB8IDExNSAtLS0K
PiA+ICB0b29scy9wZXJmL2J1aWx0aW4tY2hlY2suYyAgICAgICAgICAgICAgICAgICAgfCAgIDEg
LQo+ID4gIHRvb2xzL3BlcmYvYnVpbHRpbi1yZXBvcnQuYyAgICAgICAgICAgICAgICAgICB8ICAg
NCArLQo+ID4gIHRvb2xzL3BlcmYvdGVzdHMvbWFrZSAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiAtCj4gPiAgdG9vbHMvcGVyZi91dGlsL0J1aWxkICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA1IC0KPiA+ICB0b29scy9wZXJmL3V0aWwvY2FsbGNoYWluLmMgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KPiA+ICB0b29scy9wZXJmL3V0aWwvZHNvLmggICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDYgLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC9saWJ1bndpbmQvYXJtNjQuYyAgICAg
ICAgICAgICB8ICA0MCAtCj4gPiAgdG9vbHMvcGVyZi91dGlsL2xpYnVud2luZC94ODZfMzIuYyAg
ICAgICAgICAgIHwgIDQxIC0KPiA+ICB0b29scy9wZXJmL3V0aWwvbWFwcy5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNDcgKy0KPiA+ICB0b29scy9wZXJmL3V0aWwvbWFwcy5oICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDYgLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC90aHJlYWQuYyAgICAg
ICAgICAgICAgICAgICAgICB8ICA0MCArLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC90aHJlYWQuaCAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCj4gPiAgdG9vbHMvcGVyZi91dGlsL3Vud2luZC1s
aWJ1bndpbmQtbG9jYWwuYyAgICAgIHwgODMyIC0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIHRvb2xz
L3BlcmYvdXRpbC91bndpbmQtbGlidW53aW5kLmMgICAgICAgICAgICB8ICA5MiAtLQo+ID4gIHRv
b2xzL3BlcmYvdXRpbC91bndpbmQuaCAgICAgICAgICAgICAgICAgICAgICB8ICA0MSArLQo+ID4g
IDQxIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5MTkgZGVsZXRpb25zKC0pCj4g
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2J1aWxkL2ZlYXR1cmUvdGVzdC1saWJ1bndpbmQt
YWFyY2g2NC5jCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2J1aWxkL2ZlYXR1cmUvdGVz
dC1saWJ1bndpbmQtYXJtLmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvYnVpbGQvZmVh
dHVyZS90ZXN0LWxpYnVud2luZC1kZWJ1Zy1mcmFtZS1hYXJjaDY0LmMKPiA+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgdG9vbHMvYnVpbGQvZmVhdHVyZS90ZXN0LWxpYnVud2luZC1kZWJ1Zy1mcmFtZS1h
cm0uYwo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9idWlsZC9mZWF0dXJlL3Rlc3QtbGli
dW53aW5kLWRlYnVnLWZyYW1lLmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvYnVpbGQv
ZmVhdHVyZS90ZXN0LWxpYnVud2luZC14ODYuYwo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29s
cy9idWlsZC9mZWF0dXJlL3Rlc3QtbGlidW53aW5kLXg4Nl82NC5jCj4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHRvb2xzL2J1aWxkL2ZlYXR1cmUvdGVzdC1saWJ1bndpbmQuYwo+ID4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvYXJtL3V0aWwvdW53aW5kLWxpYnVud2luZC5jCj4g
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGlsL3Vud2luZC1s
aWJ1bndpbmQuYwo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvbG9vbmdh
cmNoL3V0aWwvdW53aW5kLWxpYnVud2luZC5jCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3BlcmYvYXJjaC9taXBzL3V0aWwvdW53aW5kLWxpYnVud2luZC5jCj4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL3V0aWwvdW53aW5kLWxpYnVud2luZC5jCj4g
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC94ODYvdXRpbC91bndpbmQtbGli
dW53aW5kLmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi91dGlsL2xpYnVud2lu
ZC9hcm02NC5jCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvdXRpbC9saWJ1bndp
bmQveDg2XzMyLmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi91dGlsL3Vud2lu
ZC1saWJ1bndpbmQtbG9jYWwuYwo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3V0
aWwvdW53aW5kLWxpYnVud2luZC5jCj4gPgo+ID4gLS0KPiA+IDIuNTMuMC45NTkuZzQ5N2ZmODFm
YTktZ29vZwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
