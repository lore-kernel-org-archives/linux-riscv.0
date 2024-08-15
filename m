Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67580C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=b0jvNHUCrSKDBGrYhzvXPZj9+S64VpAWmOWkKSqOsqE=; b=csDTeiseA3hsu7dBMNWLsv67ET
	LtzI69EmDOnpIAw/55C20mpPcGTpvIunoVkghzjVW0E6BvR9mnawj7mOGWReVQqTHjSKh9ou5NSu1
	L3XI9GmBUuPqt4yrrHI6w8IJuc5504pv6WyDpdt79t1t2lmFcBaO3uvt5e1xqWthZKV5E2vTcetUl
	XPE6NClwnMWgKESaJRx+C5/RKqZmHM5C+3A1O5ys6mDSjACNEk6JocFrPawVyibRF2K3TACbJY4sj
	nYT7xNif4l0AqqnePPSsAe994pAPAe07MQ/OMlK1HBgH/b1GCMivRptfIOvPaznKxUMVDO53u/s4d
	IPkVCNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sed8v-0000000AU9P-1ezl;
	Thu, 15 Aug 2024 16:16:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sec51-0000000AK3l-1r1f
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 15:08:05 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F92A3F366
	for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723734475;
	bh=O7Gj4FPw3G7uLAU4MEGR/F0KrwTcd+1Rxuwc21U9P1U=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wQJT5lrqEKK7bwMEepHVYnOfk/d2rpGQAxTYcpCkwpmAaiwiVXmeg0Jl7HZO6THoj
	 g7dTKEFT4Kqh01TKDvIYtlg9lRgq7O32xHc4g6vPM/7T3esp5cVQbTu/zRybZLXxVS
	 g4/RsK56vUYmEF7jDPFQxrUpGErEV9E4is1t5KAuKaF6AWxuF68UOgIDKfu0wCE+kk
	 nq0EPQANskYGQmUqem7LcvayssRfLR2InhEYxutVI9lT3Xma4Ts9eKV6UKPcGar2oE
	 7HPXaE2wHrYaEOQv+sTR8cnqVToBltU4PV6BFtH9MwceFaOEeXem3taKr2k/ZiQeTJ
	 c5JKZuszJf+xQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-44fe49fa389so11149051cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 08:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723734474; x=1724339274;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O7Gj4FPw3G7uLAU4MEGR/F0KrwTcd+1Rxuwc21U9P1U=;
        b=uNvSiN9c/8WQDV4wzY5ObLvtUdzXX5CtNZIOd33gN14K5DLBDZH5su1Z4VnlK9vm5l
         YCxYaZAmmunS5ockcgU2FqBFJqBMgM2y4FOHfkkii99SfkVQQjs9NvXub0K9OlykFi93
         LRIwH5VXzpOdmqZG6S9luZj8elmh291pnkHL++ZzEcGDWTCTVxHJ4YQ1q8D7UkB6n67u
         mDu6sNbuE7V0itBRuBgBZuzhU6cW0iYOctNupzT76ZPDyUMXtebMczXTqFccR4f/MowF
         oZmyPrl3xrwagSStOtydX+R+/3UbTNMjNzSjAx8j7koGU2R4pa1ucCYOO0EGpY5S/5TX
         IZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnmaf3i11paOUcKk4LPfHvkGlrIIqjDMC+cqLwuV8UcKl4CImrYZp6ts3vEccUtkmja9VHfkMRELHdtUfI7wofBBPbyaw7cVVCbDtt3G3r
X-Gm-Message-State: AOJu0YyxEnpdx9NKM0qCu1uslvtLR8EekTGQ72aEFczt3nZckrcFlgoZ
	VtOG1JY0d74z4NkaDQ0HxHh+dv58p++ab/H+dXyL8WANVEY5z3NquxKIKgp9/Gh94DoSIG0k4L1
	HeZ+zXU5z4FhmaQ4qajbYHaKH/vRXQ6NpocYmJS4WYd1uhF2cDiGzJjlZ0gyTff37bA9yLsTYKd
	DVVPD/VOreIYC5GYpzLny+pMgo+XSZHigk1ybkb5BHX30yXHbmwA3teVVNwKbjUjoy
X-Received: by 2002:ac8:1199:0:b0:453:6c9f:ec5a with SMTP id d75a77b69052e-4536c9fef86mr16626281cf.22.1723734474059;
        Thu, 15 Aug 2024 08:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEQrMUB6uwmlpoSPzE4Q46pTqZ42Lh5kb+mFo2U+8h2TWgZ0fwtNPmKmP2B+Kwln77U5qhE7GkLX7KM8FZ/xk=
X-Received: by 2002:ac8:1199:0:b0:453:6c9f:ec5a with SMTP id
 d75a77b69052e-4536c9fef86mr16625871cf.22.1723734473624; Thu, 15 Aug 2024
 08:07:53 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Aug 2024 11:07:53 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <87h6blnaf1.ffs@tglx> <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
 <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 11:07:53 -0400
Message-ID: <CAJM55Z9kKqs-kMubsGsRkS6E2Y4ur1MmwD+1XFvGP=UVNrJvRg@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Samuel Holland <samuel.holland@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_080759_823955_50C5786F 
X-CRM114-Status: GOOD (  18.71  )
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

U2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gT24gMjAyNC0wOC0xNSA5OjE2IEFNLCBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNzo0MeKAr1BNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFRodSwgQXVnIDE1
IDIwMjQgYXQgMDg6MzIsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4+PiBPbiAyMDI0LTA4LTE1
IDg6MTYgQU0sIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiA+Pj4+IFllcy4gU28gdGhlIHJpc2N2
IHRpbWVyIGlzIG5vdCB3b3JraW5nIG9uIHRoaXMgdGhpbmcgb3IgaXQgc3RvcHMKPiA+Pj4+IHNv
bWVob3cuCj4gPj4+Cj4gPj4+IFRoYXQncyBjb3JyZWN0LiBXaXRoIHRoZSAoZmlybXdhcmUpIGRl
dmljZXRyZWUgdGhhdCBFbWlsIGlzIHVzaW5nLCB0aGUgT3BlblNCSQo+ID4+PiBmaXJtd2FyZSBk
b2VzIG5vdCBoYXZlIGEgdGltZXIgZGV2aWNlLCBzbyBpdCBkb2VzIG5vdCBleHBvc2UgdGhlIChv
cHRpb25hbFsxXSkKPiA+Pj4gU0JJIHRpbWUgZXh0ZW5zaW9uLCBhbmQgc2JpX3NldF90aW1lcigp
IGRvZXMgbm90aGluZy4KPiA+Pgo+ID4+IFNpZ2guIERvZXMgUklTQ1YgcmVhbGx5IGhhdmUgdG8g
cmVwZWF0IGFsbCBtaXN0YWtlcyB3aGljaCBoYXZlIGJlZW4gbWFkZQo+ID4+IGJ5IHg4NiwgQVJN
IGFuZCBvdGhlcnMgYmVmb3JlPyBJdCdzIGtub3duIGZvciBkZWNhZGVzIHRoYXQgdGhlIGtlcm5l
bAo+ID4+IHJlbGllcyBvbiBhIHdvcmtpbmcgdGltZXIuLi4KPiA+Cj4gPiBNeSBhcG9sb2dpZXMg
Zm9yIHRoZSBkZWxheSBpbiBmaW5kaW5nIGEgZml4IGZvciB0aGlzIGlzc3VlLgo+ID4KPiA+IEFs
bW9zdCBhbGwgUklTQy1WIHBsYXRmb3JtcyAoZXhjZXB0IHRoaXMgb25lKSBoYXZlIFNCSSBUaW1l
ciBhbHdheXMKPiA+IGF2YWlsYWJsZSBhbmQgTGludXggdXNlcyBhIGJldHRlciB0aW1lciBvciBT
c3RjIGV4dGVuc2lvbiB3aGVuZXZlcgo+ID4gaXQgaXMgYXZhaWxhYmxlLgo+Cj4gU28gdGhpcyBp
cyB0aGUgaW1tZWRpYXRlIHNvbHV0aW9uOiBhZGQgdGhlIENMSU5UIHRvIHRoZSBmaXJtd2FyZSBk
ZXZpY2V0cmVlIHNvCj4gdGhhdCB0aGUgU0JJIHRpbWUgZXh0ZW5zaW9uIHdvcmtzLCBhbmQgTGlu
dXggd2lsbCBib290IHdpdGhvdXQgYW55IGNvZGUgY2hhbmdlcywKPiBhbGJlaXQgd2l0aCBhIGhp
Z2hlci1vdmVyaGVhZCBjbG9ja2V2ZW50IGRldmljZS4KCkJ1dCB0aGlzIHdpbGwgbWVhbiB0aGF0
IHlvdSBjYW4ndCB1cGRhdGUgeW91ciBrZXJuZWwgdG8gdjYuOSBvciBuZXdlciB3aXRob3V0CnJl
Zmxhc2hpbmcgT3BlblNCSSBhbmQgdS1ib290LiBUaGF0J3Mgc3RpbGwgYSByZWdyZXNzaW9uIHJp
Z2h0PwoKL0VtaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
