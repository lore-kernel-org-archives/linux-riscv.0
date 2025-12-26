Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D970AE82CDE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 06:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHLV5Br/VjnH1feGTHkIyoUcvomb7VkknlpIv5/VLNQ=; b=SamIOfbSdtAZvH
	xkXXYXoEzhfRsqRW8dGjTLE29F+EAZ0Lnw0Kk+IFMtBABEP/OlW6czlI5FXykY05iefD5IddeqvfR
	Wp+NnYuOtYgZdE7SoQddADG+hCCkJyhb7NOocXZBFAO9dI5TOiydxm9QPHlis+K/zmpThSYcwSO/J
	fGSBdI/NOldFdjU3Uul1Um92PUALY8UiE3j1Mnh2gM9LZOEwdXJjSN54wxA4L+Sh8lZS+3PmP15zu
	oghCwB7V887QdU5sxveI+CvSaaSiI/gDR5PYSEMci03c3uj758stmBItviKArsu/q/KR277aN3iyI
	F4zniWQPLIv79fJcXoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1hY-00000000yQb-3RdC;
	Fri, 26 Dec 2025 06:53:28 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1hV-00000000yPx-2Oiq
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 06:53:27 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6467bed0d2fso4073247d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 22:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766732003; x=1767336803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In4D9uIw9WRI5SeupWLx7/A1v5eMK/I9jTjhCEC0gVE=;
        b=CyFSi3jreq/sZR5G0vnRnISDkZH54BuvfCtWJBt7amdkiubccx8d8iEnTXjy+8zrjF
         3DOZLa5k9rPKOFlpJYISj6utuVYwSjA2Z9+L2iYas5gn+YOsoLhzpog+K/U4qRm7EcWW
         +L4cFPW+J8z/W2YjtM+cbd/1EfoSMOregr3hYpcx3iACfoiPr76vXESMHqbz39fkf6qy
         iltI55Gb7WHgVvsc212E6RrSJePsulVzHFQNGVrfIuTfVID7nrqRIjH5Zm07akhWKktD
         qwDtatwX4WLreyihjBkZWefHm/JJOoJEUEYwUiRN83AvK6bqKav8zV1I/QKNMiZPm4ry
         I07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766732003; x=1767336803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=In4D9uIw9WRI5SeupWLx7/A1v5eMK/I9jTjhCEC0gVE=;
        b=OSi5CXSq+B5xp8gOyLVO2LSEZiPIABjXoeVg5k5xg7iP4p8AaqJEn5klDzulk/WRLW
         tGyeMYj8Fo8RsF0zc1jhuQTtldhSfNaibdfDZhGTq/z5FTMwlFEhK/02bHDt5fbYaNlz
         QlN/HfY8bdcrU9GMAqRwUEtCm2yvPftg98itCcpwcZL0knKjEePLalBwsUNBd/WprmDr
         4DUGZ5mvBrC6M/CpoXSkl54GLSGOdJK5Suax6R3W+NOvxCP5aVWwqufsH6yU66bi/plC
         kNGlyXr7Yd+Ue80T1QplzUZdxlKlT+uazzus3rJ2+P/wtEGPQL+mH3UjNMQ2ESGS3s1z
         w4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVtW00PpHtNrjO3I2Il6lUqHBND3aDNH93JcjYHW5CzMuGwkmUtA1S3O8aLg3/ClJJNvd/776ifspTKHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm5uBrqOfbD18gHLGL8NJ5QWTq872PkINPqMr1MPAx/hTOo3hw
	mftyY2cNybPEdz1KOBNu+bWkSKzagW6PXqvWC3qikpJGEIGtqBbXrrD2byjgFUFa+KHIwZTL+xu
	VWPnC5tle4b5+soi3QQC5mNvjciYs3ZrS0PYgXibLoQ==
X-Gm-Gg: AY/fxX6QdQKClMA9ImCP6KWldiit/+KGVYvnnGGu/9iwGHie4uS5qr8G1zQYrEeDRov
	tX0Xirvf5dIHCPHRX5tYxS0DOnTQSDBjz5e2TZPqairCuKwOj17JEFS4pKPHYHOAnJr/iyixVPC
	ynb6jTpQI8FPuvNhC80bescnpR6oJ20s7+8uS68f2cnnYXxkLbqL3WW+JaYFkg2zAW9zplk66vv
	sTfkOF8XAX7bRKMeykeMImBlSBstVvnCHztFMtOIzoIwxjTSRFe26n7niD7LJe/eedKs8OtlWZT
	Y399FGF3R3gfDekKECYk/xZ6g64BCgBCaEo5Bc+L
X-Google-Smtp-Source: AGHT+IEykdaZ4Rha9W0iaPgKCHo3kRALkhoNrPmt5lxv9NvuluuvBnDgd6routLnDG3edhTl56BVVI71jDU66ZvrElQ=
X-Received: by 2002:a05:690e:1a08:b0:644:5bba:e497 with SMTP id
 956f58d0204a3-6466a871e61mr13684712d50.38.1766732003513; Thu, 25 Dec 2025
 22:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com> <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
 <20251220-repacking-football-c79e660e788a@spud> <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
 <20251222-dimmer-wooing-db29fe925498@spud>
In-Reply-To: <20251222-dimmer-wooing-db29fe925498@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 26 Dec 2025 14:53:10 +0800
X-Gm-Features: AQt7F2rBtU4YKSmnk202JjvlyhsDSwcTDORz2f5ucxaceC-cTv-SHH-Q_N8lHTA
Message-ID: <CAH1PCMbane4uN=N0UPRDG9x9NUbD9SYsbH+NnP-gzU6Bo8L2wQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_225325_885160_12671E53 
X-CRM114-Status: GOOD (  46.07  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNDozNuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWlucmljaCwgU2FtdWVsLAo+Cj4gT24gU3VuLCBEZWMgMjEs
IDIwMjUgYXQgMDE6MTA6MTVBTSArMDEwMCwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiA+
IE9uIDEyLzIxLzI1IDAwOjIzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgRGVj
IDE5LCAyMDI1IGF0IDEwOjAzOjI0QU0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+ID4g
SGksIENvbm9yIGFuZCBIZWlucmljaAo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBEZWMgMTgsIDIw
MjUgYXQgODo1NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMDk6MDc6MTRBTSArMDEw
MCwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiA+ID4gPiA+ID4gT24gMTIvMTcvMjUgMDg6
MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNwZWNpZmljYWxs
eSwgSSBtdXN0IGFkaGVyZSB0bwo+ID4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgKGFuZCBjcHVzLnlhbWwgZm9yCj4gPiA+
ID4gPiA+ID4gcHJvcGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3aGljaCBzdGFuZHMgZm9yIHRo
ZSBleHRlbnNpb24gU3YzOSkuIElmIEkKPiA+ID4gPiA+ID4gPiBhZGQgZXh0ZW5zaW9uIHN0cmlu
Z3MgdGhhdCBhcmUgbm90IHlldCBkZWZpbmVkIGluIHRoZXNlIHNjaGVtYXMsIHN1Y2ggYXMKPiA+
ID4gPiA+ID4gPiBzdXBtLCBydW5uaW5nICdtYWtlIGR0YnNfY2hlY2sgVz0zJyBmYWlscyB3aXRo
OiAnc3VwbScgaXMgbm90IG9uZSBvZgo+ID4gPiA+ID4gPiA+IFsnaScsICdtJywgJ2EnLCAuLi5d
LCBmb2xsb3dlZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQuIgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJZiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGlzIGluY29tcGxldGUKPiA+ID4gPiA+ID4gd2l0aCBy
ZXNwZWN0IHRvIHJhdGlmaWVkIGV4dGVuc2lvbnMsIEkgZ3Vlc3MgdGhlIHJpZ2h0IGFwcHJvYWNo
IGlzIHRvIGFtZW5kCj4gPiA+ID4gPiA+IGl0IGFuZCBub3QgdG8gY3VydGFpbCB0aGUgQ1BVIGRl
c2NyaXB0aW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFic29sdXRlbHkuIElmIHRoZSBjcHUgc3Vw
cG9ydHMgc29tZXRoaW5nIHRoYXQgaXMgbm90IGRvY3VtZW50ZWQsIHRoZW4KPiA+ID4gPiA+IHBs
ZWFzZSBkb2N1bWVudCBpdCByYXRoZXIgdGhhbiBvbWl0IGZyb20gdGhlIGRldmljZXRyZWUuCj4g
PiA+ID4KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIE1heSBJIGNsYXJpZnkgb25lIHRo
aW5nPyBCb3RoIG9mIHlvdSBtZW50aW9uZWQKPiA+ID4gPiBkb2N1bWVudCB0aGVtLCBnaXZlbiB0
aGUgYW1vdW50IG9mIG1pc3NpbmcgZXh0ZW5zaW9ucywgaXMgaXQgYWNjZXB0YWJsZSBpZgo+ID4g
PiA+IEkgc3VibWl0IGEgcHJlcmVxdWlzaXRlIHBhdGNoIHRoYXQgb25seSBkb2N1bWVudHMgdGhl
c2Ugc3RyaW5ncyBpbgo+ID4gPiA+IHJpc2N2L2V4dGVuc2lvbnMueWFtbCBwbHVzIHRoZSBuZWNl
c3NhcnkgaHdwcm9iZSBleHBvcnQ/IExlYXZpbmcgdGhlIGFjdHVhbAo+ID4gPiA+IHVzYWdlIG9m
IHRoZXNlIGV4dGVuc2lvbnMgKG5hbWVkIGZlYXR1cmVzKSB0byB0aGUgZnV0dXJlIHBhdGNoZXMu
Cj4gPiA+ID4KPiA+ID4gPiBUbyBwcm92aWRlIHNvbWUgY29udGV4dCBvbiB3aHkgSSBhc2s6IEkn
dmUgaW52ZXN0aWdhdGVkIHRoZSBjb21taXRzICYgbGttbAo+ID4gPiA+IGhpc3Rvcnkgb2YgUklT
Qy1WIGV4dGVuc2lvbnMgc2luY2UgdjYuNSwgYW5kIEkgc3VtbWFyaXplZCB0aGUgY3VycmVudCBz
dGF0dXMKPiA+ID4gPiByZWdhcmRpbmcgdGhlIFJWQTIzIHByb2ZpbGUgaGVyZToKPiA+ID4gPiBb
MV0gc3RhdHVzIGluIHY2LjE4IChpbmMuIHY2LjE5LXJjMSk6Cj4gPiA+ID4gaHR0cHM6Ly9kb2N1
bGFyeHUuZ2l0aHViLmlvL3J2YTIzL2xpbnV4LWtlcm5lbC1jb3ZlcmFnZS5odG1sCj4gPiA+ID4g
WzJdIHN1cHBvcnQgZXZvbHV0aW9uIHNpbmNlIHY2LjU6Cj4gPiA+ID4gaHR0cHM6Ly9kb2N1bGFy
eHUuZ2l0aHViLmlvL3J2YTIzL3J2YTIzLWtlcm5lbC1zdXBwb3J0LWV2b2x1dGlvbi5odG1sCj4g
PiA+ID4KPiA+ID4gPiBTdHJpY3RseSBkZXNjcmliaW5nIHRoZSBTcGFjZW1pVCBYMTAwL0szIChv
ciBhbnkgY29yZSkgYXMgUlZBMjMtY29tcGxpYW50Cj4gPiA+ID4gcmVxdWlyZXMgYWRkaW5nIHRo
ZXNlIGV4dGVuc2lvbnMgdGhhdCBhcmUgY3VycmVudGx5IG1pc3NpbmcgZnJvbQo+ID4gPiA+IHRo
ZSBrZXJuZWwgYmluZGluZ3M6Cj4gPiA+ID4gUlZBMjNVNjQ6IFppY2NpZiwgWmljY2Ftb2EsIFpp
Y2Nsc20sIFphNjRycwo+ID4gPiA+IFJWQTIzUzY0OiBTczFwMTMsIFNzY2NwdHIsIFNzdHZlY2Qs
IFNzdHZhbGEsIFNzY291bnRlcmVudywgU3N1NjR4bCwKPiA+ID4gPiAgICAgICAgICAgIFNoYSwg
U2hjb3VudGVyZW53LCBTaHZzdHZhbGEsIFNodHZhbGEsIFNodnN0dmVjZCwgU2h2c2F0cGEsIFNo
Z2F0cGEKPiA+ID4KPiA+ID4KPiA+ID4gPiBQbHVzICdTdXBtJywgJ1ppYzY0YicsICdTc3N0YXRl
ZW4nLCAnQicgd2hlcmUgdGhlIGtlcm5lbCBzdXBwb3J0cyB0aGVtIGJ1dAo+ID4gPiA+IHRoZXkg
YXJlIG5vdCBsaXRlcmFsbHkgZG9jdW1lbnRlZCBpbiB5YW1sLgo+ID4gPgo+ID4gPiBJIGRvbid0
IHRoaW5rIFN1cG0gaXMgc3VpdGFibGUgZm9yIGRldmljZXRyZWUsIGRvZXNuJ3QgaXQgZGVzY3Jp
YmUKPiA+ID4gd2hhdCB0aGUga2VybmVsL3VzZXJzcGFjZSBhcmUgY2FwYWJsZSBvZiByYXRoZXIg
dGhhbiBoYXJkd2FyZT8KPiA+ID4gWmljNjRiIGRvZXNuJ3Qgc291bmQgbGlrZSBoYXJkd2FyZSBk
ZXNjcmlwdGlvbiAoc28gbm90IHJlYWxseSBzdWl0YWJsZQo+ID4gPiBmb3IgZGV2aWNldHJlZSBl
aXRoZXIpIGJ1dCBibG9jayBzaXplIGluZm9ybWF0aW9uIGlzIGFscmVhZHkgcmVwcmVzZW50ZWQK
PiA+ID4gYnkgc29tZSBleGlzdGluZyBwcm9wZXJ0aWVzIChzZWUgcmlzY3YsY2JvKi1ibG9jay1z
aXplIGluIHJpc2N2L2NwdXMueWFtbCkKPiA+ID4gYW5kIGR1cGxpY2F0aW5nIHRoYXQgaW5mb3Jt
YXRpb24gaXMgbm90IHJlYWxseSBhIGdyZWF0IGlkZWEuCj4gPiA+Cj4gPiA+IEknbGwgYWRtaXQg
dGhhdCBJIGRvIG5vdCByZWFsbHkgdW5kZXJzdGFuZCBTeHN0YXRlZW4gYW5kIGhvdyB0aGV5IHdv
cmssCj4gPiA+IGJ1dCBteSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IGtub3dpbmcgYWJvdXQgU21z
dGF0ZWVuIGlzIHN1ZmZpY2llbnQgYW5kCj4gPiA+IGltcGxpZWQgU3N0YXRlZW4sIGJ1dCBoYXZp
bmcgU3NzdGF0ZWVuIGRlZmluZWQgc2VlbXMgaGFybWxlc3MgYW5kCj4gPiA+IHBvc3NpYmxlLiBJ
IHRoaW5rIGt2bSBpcyB0aGUgb25seSB1c2VyIG9mIHRoaXMgYXQgdGhlIG1vbWVudCwgc28KPiA+
ID4gcHJvYmFibHkgd29ydGggQ0NpbmcgQW51cCBhbmQgbWF5YmUgRHJldyBKb25lcyBvbiB0aGUg
cGF0Y2ggYWRkaW5nCj4gPiA+IFNzc3RhdGVlbiB0byBtYWtlIHN1cmUgaXQgbWFrZXMgc2Vuc2Uu
Cj4gPgo+ID4gU3VwbSBpcyBkZXNjcmliZWQgaW4KPiA+Cj4gPiBSSVNDLVYgUG9pbnRlciBNYXNr
aW5nCj4gPiBWZXJzaW9uIDEuMCwgMTAvMjAyNDogUmF0aWZpZWQKPiA+IGh0dHBzOi8vcmF3Lmdp
dGh1YnVzZXJjb250ZW50LmNvbS9yaXNjdi9yaXNjdi1qLWV4dGVuc2lvbi9tYXN0ZXIvempwbS1z
cGVjLnBkZgo+ID4KPiA+IFRoZSBpbnRlcnByZXRhdGlvbiB0YWtlbiBieSBRRU1VIGhhcyBiZWVu
Ogo+ID4KPiA+ICogU3VwbSBpbXBsaWVzIFNzbnBtIGFuZCBTbW5wbQo+ID4gKiBSVkEyMyBjYXBh
YmxlIG1hY2hpbmUgbW9kZWxzIGRpc3BsYXkgaXQgaW4gdGhlIGRldmljZS10cmVlCj4gPgo+ID4g
SWYgU3VwbSBpcyBub3Qgc2hvd24gaW4gdGhlIGRldmljZS10cmVlLCBzb2Z0d2FyZSBtaWdodCBh
c3N1bWUgdGhhdCB0aGUKPiA+IHN5c3RlbSBkb2VzIG5vdCBzdXBwb3J0IHBvaW50ZXIgbWFza2lu
ZyBpbiB1c2VyIG1vZGUgYW5kIGlzIG5vdCBSVkEyMwo+ID4gY29tcGxpYW50Lgo+ID4KPiA+IEhl
bmNlIEkgd291bGQgc3VnZ2VzdDoKPiA+Cj4gPiBJZiB0aGUgWDEwMCBjb3JlcyBoYXZlIFNzbnBt
IGFuZCBTbW5wbSwgYWRkIFN1cG0gdG8gdGhlIGRldmljZS10cmVlLgo+ID4KPiA+IElmIHRoZSBr
ZXJuZWwgZG9lcyBub3Qgc3VwcG9ydCB1c2VyIHNwYWNlIHBvaW50ZXIgbWFza2luZywgdGhlIGtl
cm5lbCBzaG91bGQKPiA+IGZpbHRlciBvdXQgU3VwbSBhbmQgbm90IGFubm91bmNlIGl0LCBuZWl0
aGVyIGluIC9wcm9jL2NwdWluZm8gbm9yIHZpYQo+ID4gaHdwcm9iZS4KPgo+IFNhbXVlbCBzZWVt
cyB0byBoYXZlIHNvbWUgc3BlY2lmaWMgdGhvdWdodHMgb24gaG93IHRoaXMgd29ya3MsIGdpdmVu
IGhlCj4gZGlkbid0IGJsaW5kbHkgaW1wbGVtZW50IHNzbnBtIGFuZCBzbW5wbSwgYnV0IGhhcyBt
YWRlIHN1cG0gYmUgbW9kZQo+IGRlcGVuZGVudCBhbmQgbm90IHBlcm1pdHRlZCBpbiBkdCwgaG9w
ZWZ1bGx5IGhlIHNlZXMgdGhpcy4KPgo+IFBlcnNvbmFsbHkgSSdtIG5vdCBjb252aW5jZWQgdGhh
dCBwdXR0aW5nIHN1cG0gaW4gZHQgbWFrZXMgc2Vuc2UsIGJ1dAo+IGluc3RlYWQgdGhlIGtlcm5l
bCBzaG91bGQgaW1wbHkgaXQgaWYgdGhlIHN4bnBtIGV4dGVuc2lvbiBtYXRjaGluZyB0aGUKPiBt
b2RlIHRoZSBrZXJuZWwgaXMgb3BlcmF0aW5nIGluIGlzIHByZXNlbnQgYW5kIFJJU0NWX0lTQV9T
VVBNIGlzIHNldCBpbgo+IEtjb25maWcuIFRoYXQncyBlZmZlY3RpdmVseSBob3cgaXQgd29ya3Mg
YXQgcHJlc2VudCwgZXhjZXB0IGl0J2QgaW52b2x2ZQo+IHByb21vdGluZyBSSVNDVl9JU0FfU1VQ
TSB0byBhICJyZWFsIiBleHRlbnNpb24gaW5zdGVhZCBvZiBiZWluZyBhIG1hY3JvLgo+IEEgdmFs
aWRhdGUgY2FsbGJhY2sgc2hvdWxkIGVhc2lseSBiZSBhYmxlIHRvIGhhbmRsZSBjaGVja2luZyB0
aGUKPiBtb2RlIGFuZCB3aGV0aGVyIHRoZSBLY29uZmlnIG9wdGlvbiBpcyBzZXQuCgpIaSwgQ29u
b3IKCkFzIHdlIHdhaXQgZm9yIFNhbXVlbCB0byBzaGFyZSBoaXMgb3BpbmlvbiwgbWF5YmUgSSBj
YW4gc3VibWl0IGEgcGF0Y2ggaW4KKEkgYWxyZWFkeSBoYXZlIGl0KQpteSBuZXh0IHZlcnNpb24g
b3IgYXMgaW4gYSBkaWZmZXJlbnQgcGF0Y2hzZXQgdG8gaW1wbGVtZW50IHdoYXQgeW91IHN1Z2dl
c3RlZC4KIC0gQXNzaWduIFJJU0NWX0lTQV9FWFRfU1VQTSBhIHN0YW5kYWxvbmUgZXh0IG51bWJl
ciBpbiBod2NhcC5oCiAtIEltcGxlbWVudCBhIHJpc2N2X2V4dF9zdXBtX3ZhbGlkYXRlKCkgYW5k
IHB1dCBpdCBpbiB0aGUgY2FsbGJhY2sgb2YgYm90aAogICAgc3NucG0gYW5kIHNtbnBtLgogLSBL
Y29uZmlnIHdpbGwgYmUga2VwdCBhcyBhIHRvcCBsZXZlbCBnYXRla2VlcGVyLCBubyBjaGFuZ2Uu
CiAtIGR0LWJpbmRpbmcgZW50cnkgZm9yIHN1cG0gd2lsbCBub3QgYmUgYWRkZWQuCgpUaGUgb25s
eSByZWFzb24gc3VwcG9ydCBtZSB0byBhZGQgc3VtcCBpbnRvIHRvIHRoZSBkdCBiaW5kaW5nCihl
eHRlbnNpb25zLnlhbWwpIGlzIGl0J3Mgbm93IGEgbWFuZGF0b3J5IGV4dGVuc2lvbiByZXF1aXJl
ZCBieSBSVkEyM1U2NC4KSG93ZXZlciwgYXMgeW91IGV4cGxhaW5lZCwgdGhhdCBsb2dpYyBzZWVt
cyBub3Qgc3Ryb25nIGVub3VnaC4KClRoYW5rIHlvdS4KQmVzdCByZWdhcmRzLApHdW9kb25nIFh1
Cgo+IFRoYXQgd2F5IGl0IHdvdWxkIGdldCBleHBvc2VkIHRvIHVzZXJzcGFjZSB1c2luZyB0aGUg
YWN0dWFsIG1lY2hhbmlzbXMsCj4gcmVhZGluZyB0aGUgZGV2aWNldHJlZSBpdHNlbGYgZnJvbSB1
c2Vyc3BhY2UgaXMgbm90IGEgdmFsaWQgd2F5IG9mCj4gY2hlY2tpbmcgd2hhdCBleHRlbnNpb25z
IGFyZSB1c2FibGUgYWZ0ZXIgYWxsLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
