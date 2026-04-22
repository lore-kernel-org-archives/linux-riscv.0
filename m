Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC5EF94CCD
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+9/0smKDqVkNgaf2J0WOl3oA/+Eny/rUfZbzM9jk9VM=; b=qHWOmxey3hLhrKSRf09F/pSrSe
	ujlIJoWOu+/1yCekEI7F+BAa3nuFTSuTNYZOF2Bvhzh94oBiOUqhYlmCROcV13dZ3GqXn3qR1/nc5
	Eov+gpOJ6/W+WFGFu7c3oUoWDxY7q9xOqGBybjfhXsiHuzwBY6zCUj+V+MpVDducXvNGHKqDPx5bK
	XEplydB15cK9Zwhk9X7a23hM0nJcJ+WRioB2duM60GUDrPAkoYUm++Jxju0NLPLAIxewHawoaBucu
	FQ/gUZTrA6EG+JqmBUIU7rllZqL3viV6JbNF7qikdiCsHaGDSnlefCzAblLohScj0B5foFNvbkBds
	KY4CP3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQr3-00000009eIA-41C3;
	Wed, 22 Apr 2026 06:14:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQr1-00000009eHp-3hbq
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 06:14:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ba8472c1613so471645066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 23:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776838470; cv=none;
        d=google.com; s=arc-20240605;
        b=d6mMjLY71YAIhFwsYylgdUwLdH6hvoLq8AyBvk8Hdyyknzft/L0ORrYsL3u9yigIys
         i8mCtBPleEBirDyYsT65dpJQD1/bdPZjagbPfzZGsFu8n1oNBVzP4CoFtwc3iZ3VObqc
         O2jvsCdNaLGPrdYW0zkcM0DGSQKSf5go+CQ6ugPEmVAIXZaMQyJNTamJAvVJhJ+LvRrG
         WyZ/zgY/1VSJOc6qu/MPUDyOzCOG82l6JVV6QaNWBFei4JT56CC99svMwBes/w0ZrCV6
         RTvqgq7CQmBqREah+BqTZajU7M6F+0jHOsTsEoSaL/gKsbDXV5qQMpCNPW2OqkgW5+98
         Umiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        fh=38iO1akwxEOJaO3Ec8K28NgLU8nyBrOBVQDpiQ103jM=;
        b=FKPy5vclB3f6CokX/C+D9ExlFVTRyYQNaJI7GNTI2IKmzGgmLZ8jXp0xaCKFVUZEFR
         /bXG0IHFKuA1GXTqawCnFzWgwbGRJ/hUm1to3tyOvhBF/xSIx0GmT16KMD7Jqv4i2Lod
         dZqDsdRnYFM+HDve4RLOd0hhvrqy44leXhUZho0DauipmWpaWl+e/sf8yS4M5CQSfGea
         cXbzB9p9a4WSsCIEzrJo2tYJp92VgB8T1ybHRAYNgBAVBnyjM5cBAczUk9v57PS7TTDB
         0Tlo+0ex7j2JFW1/rLfvfIjcUgDnfkoCauqaul5L+/z2Pal8mDUV349u1jwEjBJBQ7LX
         G1uQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776838470; x=1777443270; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=RjwCh8sNGbkJzQ20LOFLKDkzzyq0YTqllmtxQKZrZrEBQrkf9f1BDgBZrMnFqIi6Su
         16/LxSxdM2vOFUXM5jupsB0YZl8UUDi/xq6Cukkb+EIXTAG1kSFUY6zNJvTP7moAKofm
         mNQ3zROyR06IIGE+kiMb0UiXWYPlj3JQmkfG1qZGmEt+qESnisgFKau/ZyyEFKTxHgFt
         8+uYKUTt0dzFI/KpCnlgFgwdu94McDzLSBk/R8Ymlab7BfS96/ZT4BWd22eu+n8390so
         l9o6Lh/tdufRNHKvXqbSFyMnhKnAJD6m88cE4Y7PFYPM2HGi7BX4wG1XMFz2dJyuoAQv
         xT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838470; x=1777443270;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7E2q6exx7PW87rgGpHFPg1laXVtt9+bH8xKH5r59iw=;
        b=AoGlg2ppLrwSS5QLtevjss+W5/RNqyee+V5dC+NYYgIQkU1RNf3RhkWXjGlFxPpyyV
         5nbIeP4ZdFEscCY98MiplODgt71XXkmk7wVGtcPsMjt/4G3ABtX0hF4RqdP7alO/kALm
         QoUVEkknYpAWD+fLEhdKzl2ZXNIiKpqSNaxqX8hwr8kSA0LIz2X7lQhVC8jraWsutZLI
         3xMapv/Au2lf8GTX1OlhKryuebl1rO3ns4a78ZW4r++1jGKNAOryTx+RW+KuIVgIPtgD
         sO01WHHW5NHzjvpZKJP3XHU2LkDpC+kOn/YRkvAg6D5GyA60aDP0mZ81OoGIw1b69ZNE
         RLjA==
X-Forwarded-Encrypted: i=1; AFNElJ9xI+mQfzOu2+T8qIq6orWUXlmgiM4Wfm4xa4KAndA0JrD/oPErDXAsZSzoz9zxxMv9b2/iwPQbaLAikQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhfRisUP1ImOA3xk+7u5TK2TnduCCAIuyvvmRoZw1WRJIxYkRX
	QCebp3u94aFdWyBPirjvbOAIxaz3yMkXpIWQx72gRa+TXJVGhq2iUl/iAwOFv3SA/uAEyf92FYf
	8/JCG8EbxbH7k0e3DS8tI4xmYibHqfVg=
X-Gm-Gg: AeBDieuspD17r6Sd1w16j0bZd1MK50DhGHjDwMi6EYP793elmuP1kQAHayQsugXKvho
	wtFOM7oDPq/05fHle3BbJqoPqvUiN3d9uwxalfKMxLBsor7p2ZCIuUxEb0gIc5c4OyKHRHvLHmD
	tesPmhHzfSHhyI6/s2a2kJY+Ub63gU8LY+EgbiucTl17LWXTFTx598J5aT5tgaETqLgWZKtQqAD
	sVdJHgkshYw2i74o1s0fdCowpn2R57/iuKgHoxZl48h1rjN6vM+u2/k/ZQmfm1uP9CmypH/I0pN
	T8Frl/Ul8VzREUQ=
X-Received: by 2002:a17:907:1588:b0:ba9:3162:182 with SMTP id
 a640c23a62f3a-ba9316201a6mr261303166b.19.1776838469610; Tue, 21 Apr 2026
 23:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net> <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org> <aeevr6Zj3Pwm9wux@aurel32.net>
In-Reply-To: <aeevr6Zj3Pwm9wux@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:44:14 +0530
X-Gm-Features: AQROBzCenitl4Odlgd_JfKGymltQZPnNxQ-FB_fBcOyLvkgF7DPs6UdEgDyDJDo
Message-ID: <CANAwSgSCo-mESo6=KSc08oUzTWAgzpYu0JaW5KqmnCNiPYHjxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, Anand Moon <linux.amoon@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_231431_961890_C6304FC5 
X-CRM114-Status: GOOD (  24.22  )
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

SGkgU2h1d2VpLAoKT24gVHVlLCAyMSBBcHIgMjAyNiBhdCAyMjo0MSwgQXVyZWxpZW4gSmFybm8g
PGF1cmVsaWVuQGF1cmVsMzIubmV0PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjAyNi0wNC0yMSAx
NjoxMCwgU2h1d2VpIFd1IHdyb3RlOgo+ID4gSGkgQXVyZWxpZW4sCj4gPgo+ID4gVGhhbmtzIGZv
ciB5b3VyIGFkZGl0aW9uLgo+ID4KPiA+IE9uIFR1ZSBBcHIgMjEsIDIwMjYgYXQgNToxNiBBTSBD
U1QsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiBIaSBBbmFuZCwKPiA+ID4KPiA+ID4gT24g
MjAyNi0wNC0xNiAxNzowNywgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4+IEFmdGVyIHJldmlld2lu
ZyB0aGUgQmFuYW5hIFBpIEYzIHNjaGVtYXRpY3MsIEkgY29uZmlybWVkIHRoYXQgQnVjazEgYW5k
IEJ1Y2syCj4gPiA+PiBCb3RoIHN1cHBseSB0aGUgQ09SRV8wVjkgd2l0aCAwLjlWwrExJSByYWls
LiBUbyByZXNvbHZlIHRoZSByZXN0cmljdGlvbiBlcnJvcnMsCj4gPiA+PiBJIGV4cGFuZGVkIHRo
ZSB2b2x0YWdlIHJhbmdlIGluIHRoZSBEVFMgdG8gNTAwLDAwMOKAkzk1MCwwMDAgwrVWLgo+ID4g
Pj4Kc29ycnkgSSB3YXMgd3JvbmcgZnJvbSB0aGUgZG9jIGJlbG93IDEuMi4xIENPUkUgUG93ZXIg
RGVzaWduCgpUaGUgdHlwaWNhbCBjb3JlIHZvbHRhZ2UgaXMgMC45IFYgdG8gMS4wNSBWLiBBY3R1
YWwgdm9sdGFnZSBpcwpkeW5hbWljYWxseSByZWd1bGF0ZWQgYnkKdGhlICoqcmVtb3RlLXNlbnNl
IGR5bmFtaWMgdm9sdGFnZSoqIGFkanVzdG1lbnQgY2lyY3VpdCBpbnNpZGUgUDEuClAxIEJVQ0sx
IGFuZCBCVUNLMiBtdXN0IGJlIGNvbWJpbmVkIHRvIHN1cHBseSB0aGUgY29yZSByYWlsLgoKWzFd
IGh0dHBzOi8vd3d3LnNwYWNlbWl0LmNvbS9jb21tdW5pdHkvZG9jdW1lbnQvaW5mbz9ub2RlcGF0
aD1oYXJkd2FyZS9rZXlfc3RvbmUvazEvazFfaHcvazFfaHdfZGVzaWduX2d1aWRlLm1kJmxhbmc9
ZW4KCj4gPiA+PiBBZGRpdGlvbmFsbHksIEkgdXBkYXRlZCB0aGUgRFRTIHRvIG1hcCB0aGUgc2Vj
b25kIENQVSBjbHVzdGVyIChjb3JlcyA04oCTNykKPiA+ID4+IHRvIEJ1Y2syIHRvIGJldHRlciBh
bGlnbiB3aXRoIHRoZSBoYXJkd2FyZSdzIHBvd2VyIGRpc3RyaWJ1dGlvbi4KPiA+ID4KPiA+ID4g
QWN0dWFsbHkgdGhlIG91dHB1dCBvZiBCdWNrMSBhbmQgQnVjazIgYXJlIGNvbm5lY3RlZCB0b2dl
dGhlciwgc28gdGhleQo+ID4gPiBzaG91bGQgYWx3YXlzIGJlIGNvbmZpZ3VyZWQgd2l0aCB0aGUg
c2FtZSBvdXRwdXQgdm9sdGFnZS4gQW5kIGJvdGgKPiA+ID4gY2x1c3RlcnMgc2hvdWxkIGJlIG1h
cHBlZCB0byBib3RoIG91dHB1dHMuCj4gPgo+ID4gWW91IGFyZSByaWdodCwgSSByZWNlaXZlZCB0
aGUgc2FtZSByZXNwb25zZSBmcm9tIHRoZSBvZmZpY2lhbCBkZXZlbG9wZXJzLgo+ID4KPiA+IFRo
ZXJlZm9yZSwgSSdtIHdvbmRlcmluZyBpZiBhbiBhZGRpdGlvbmFsIHJlZ3VsYXRvci1jb3VwbGVk
LXdpdGg6IHByb3BlcnR5Cj4gPiBkZWZpbml0aW9uIGlzIGFsc28gbmVlZGVkIGhlcmU/Cj4KY29y
cmVjdC4KPiBZZXMsIEkgdGhpbmsgdGhpcyBpcyB0aGUgd2F5IHRvIGdvLiBJIGV2ZW4gd29uZGVy
IGlmIHRoaXMgc2hvdWxkbid0IGJlIGEKPiBmaXggd2l0aCBDYzogc3RhYmxlLiBUaGlzIGFsc28g
aGFzIHRvIGJlIGRvbmUgZm9yIHRoZSBNaWxrLVYgSnVwaXRlcgo+IGJvYXJkLCBJIGhhdmVuJ3Qg
Y2hlY2tlZCB0aGUgb3RoZXIgYm9hcmRzIHlldCwgYnV0IEkgZ3Vlc3MgdGhleSBhbGwgdXNlCj4g
dGhlIHNhbWUgc2NoZW1hdGljcyBhdCB0aGF0IHRoZSBQTUlDIGxldmVsLgo+Cj4gUmVnYXJkcwo+
IEF1cmVsaWVuCj4KPiAtLQo+IEF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAgICAgICAg
ICBHUEc6IDQwOTZSLzFEREQ4QzlCCj4gYXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAg
ICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKClRoYW5rcwotQW5hbmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
