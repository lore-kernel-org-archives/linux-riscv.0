Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F8E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VBVbWbiVKLfuL8jKMTxE/0EBn2sLkt2PayM3xgZu5U=; b=xl59Ego7MYk7LK
	xwp3unsbW6Mfpc3zjY2QkoK4RvSAwBy2H6oE+kkpJzTDK0JSRtZwOspSTsWdJN4Ds7QE68d0i5GRg
	OskuPThbJdYu46dQjlIbSWsMyeVgZECUAeE0gpexeOcUybPDPhjC1BRAllqdKkbL2vSPmsCLSl+8+
	KtQgeGOxzHh4ucBivu9tRRwP148kuqzFCGPaAyDSMHx6zK89EO03wNKJa3x8hxMlbTkmgXiVQEBnF
	QfRgs+4KXFvswEGbJxsenwlGg5ZNxwefbuBxXOplqNmcfXTYCfs3LDtTOGtygi7YZyT3dsMnDMcmL
	4cxAYWFEfGxGCuj3yFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZpvx-00000002gqv-3hKf;
	Sun, 28 Dec 2025 12:31:41 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZpvt-00000002gqY-2Qx3
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 12:31:41 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-787da30c50fso74209867b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 04:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766925096; x=1767529896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFUKZn4JEgcN7upzMO/UdzXH12MA1Fvm3drRZqBFE/g=;
        b=fpL6yUnX57GfRSJfouCaNsr0yZKyVWP92n7CMIe+auBXYmKySGFXRGefwQO2cKmNrw
         9sAranyBmE8DzOi9TlQqaB81X8GSX1Ij2PRJMxmf4PrTWrGSo+zxSQoX30agJG7UV/D3
         u3hAJ0gb3p2IZRrQAHnU/R95EOXlaGom8GgesT010PDIBpcCfbl7hITgnZX0DPrVfmMx
         7jhUhsmYt87GZzDFw6yuZx0GQhTG/qtpC5Jz1+MCBEwNGNpZvGGZIwV3AFkruJkDaZwz
         lQdbE4k9RqfsxofvMuxLjKIQX2+3nY2dlQedlYpPCsG+D5b3MoGaHS+Hx/l7u0xNdW+2
         tHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766925096; x=1767529896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFUKZn4JEgcN7upzMO/UdzXH12MA1Fvm3drRZqBFE/g=;
        b=gQhgbukqi1e6Xla5sm3/B3KPe4MdJBMooCGg6wwW5BYi08RIMeYcGLtgXjDSHehJoD
         CfeNJlqAR6cHohMHASyXy/gb8Y/FbhumC+W+Ogf8bGwtcCOQAi8OBrLLQfJUDsMdFpeJ
         gxmNIoPJ0cljTIjhK8OUPPfjP6pX6Pbos2r5d0c2o10yPwPLjvKyFuxDhVuP+NIo6lFG
         nw+FTyoFdlSNgLvdJ0y59Y1GRG2fXvjuF2lJcwYSli5bxU/78EqS705iiw+nGFsisj5z
         PO1l8U88aekTusrXzJAv1NIKqx2ITHMVI90JsFxNPmEgdSGVTLKZaMzu4Hv16kH0AwiI
         Idyw==
X-Forwarded-Encrypted: i=1; AJvYcCVBpAanBQfd6Z1vnpd2sAwHuDlbC2At+Dyc3oxvkAok0luEqpo+Jyl6liOizKQE3Pb0qFhLhfIprbHgLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YziJ+pVja19n2CY6Z7tf9bYRc6d5jB+366YzcJSj4OUv7nqWJY6
	pXfcyf1xyMo0nEN9ZPk6g+26+kE2yN20YEre+bnI0UI6PTpaCJgCJfQVe9zyAiUUi2+q4MZ3gIX
	IdpVXg99MaSc+EmO6cLFsBOO93Qh0PEVHKFchEInJLA==
X-Gm-Gg: AY/fxX6fmhS3T5LQf6b5GUJQJbN7Dm2p1a13s+le7bRP99xMN0syw+XkCNflpXvcGHk
	l1BxFRZCIkci9BGaXezOfmSi4Dfl0YDXLZTFoqQkQtkmkk3j1k4B5dKjr+FRHAgdekHaSq1BkYc
	QgROaTi6x17P4sjQtwT98oInNp6PjGKBUuDGY0ydp1ujDOdHfgJDCnGc7YVOhzgxmT6mStY+DPm
	rz+9gEnZR4YO8l7HjAahd0gKMYh1d1j8z7h6S2hpVjrZVxNZgoea92Ev2uqNRL/O8etxd3udBjq
	LaPiux2Oln6Cv+C0SnfYV7EomzV7r7W3d9JacHnlTWcn
X-Google-Smtp-Source: AGHT+IGzNeLi2mvtbJJSxEBXitpFJh8gimq1x4runQxUrx42Uz4iKaNci7NxYvfC5KuXG0hI1tM7gav+zCDbXUEmfic=
X-Received: by 2002:a05:690c:6705:b0:78d:7307:76a4 with SMTP id
 00721157ae682-78fb3f045a4mr526106307b3.11.1766925096099; Sun, 28 Dec 2025
 04:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com> <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
In-Reply-To: <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 20:31:24 +0800
X-Gm-Features: AQt7F2oYtYgUrqLg8Kz0ZEXIdh7PslchN-MDNsVvmqkVIj5_6sJ9gxOL_QcWcvs
Message-ID: <CAH1PCMauCHQ==Fyb1pHzWtkNOCnpRoJ_8KE0zJBC4B6X8TzweA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
To: Alex Elder <elder@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_043137_877272_4F143945 
X-CRM114-Status: GOOD (  23.77  )
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

SGksIEFsZXgKCk9uIFNhdCwgRGVjIDI3LCAyMDI1IGF0IDU6MjjigK9BTSBBbGV4IEVsZGVyIDxl
bGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMjIvMjUgNzowNCBBTSwgR3VvZG9u
ZyBYdSB3cm90ZToKPiA+IEFkZCBkZXNjcmlwdGlvbnMgZm9yIGZpdmUgbmV3IGV4dGVuc2lvbnM6
IFNzY2NwdHIsIFNzY291bnRlcmVudywgU3N0dmFsYSwKPiA+IFNzdHZlY2QsIGFuZCBTc3U2NHhs
LiBUaGVzZSBleHRlbnNpb25zIGFyZSByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMKPiA+IFZl
cnNpb24gMS4wIChjb21taXQgYjFkODA2NjA1Zjg3ICJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRl
LiIpLgo+ID4KPiA+IFRoZXkgYXJlIGludHJvZHVjZWQgYXMgbmV3IGV4dGVuc2lvbiBuYW1lcyBm
b3IgZXhpc3RpbmcgZmVhdHVyZXMgYW5kCj4gPiByZWd1bGF0ZSBpbXBsZW1lbnRhdGlvbiBkZXRh
aWxzIGZvciBSSVNDLVYgUHJvZmlsZSBjb21wbGlhbmNlLiBBY2NvcmRpbmcKPiA+IHRvIFJJU0Mt
ViBQcm9maWxlcyBWZXJzaW9uIDEuMCBhbmQgUlZBMjMgUHJvZmlsZXMgVmVyc2lvbiAxLjAsIHRo
ZWlyCj4gPiByZXF1aXJlbWVudCBzdGF0dXMgYXJlOgo+ID4KPiA+ICAgLSBTc2NjcHRyOiBNYW5k
YXRvcnkgaW4gUlZBMjBTNjQsIFJWQTIyUzY0LCBSVkEyM1M2NAo+ID4gICAtIFNzY291bnRlcmVu
dzogTWFuZGF0b3J5IGluIFJWQTIyUzY0LCBSVkEyM1M2NAo+ID4gICAtIFNzdHZhbGE6IE1hbmRh
dG9yeSBpbiBSVkEyMFM2NCwgUlZBMjJTNjQsIFJWQTIzUzY0Cj4gPiAgIC0gU3N0dmVjZDogTWFu
ZGF0b3J5IGluIFJWQTIwUzY0LCBSVkEyMlM2NCwgUlZBMjNTNjQKPiA+ICAgLSBTc3U2NHhsOiBP
cHRpb25hbCBpbiBSVkEyMFM2NCwgUlZBMjJTNjQ7IE1hbmRhdG9yeSBpbiBSVkEyM1M2NAo+Cj4g
QWdhaW4sIEkgZGlkIG5vdCB2ZXJpZnkgeW91ciBzdGF0ZW1lbnRzIGFib3V0IHdoZXJlIHRoZXNl
IGFyZQo+IG9wdGlvbmFsIGFuZCBtYW5kYXRvcnksIGJ1dCBJIGFzc3VtZSB0aGV5J3JlIGNvcnJl
Y3QuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpBcyBtZW50aW9uZWQgaW4gbXkgcmVzcG9uc2Ug
dG8gcGF0Y2ggOCwgdGhlIHJlcXVpcmVtZW50IHN0YXR1cyBmb3IgdGhlc2UKZXh0ZW5zaW9ucyBp
cyBjbGVhcmx5IGRlZmluZWQgaW4gdGhlIFJJU0MtViBQcm9maWxlcyBzcGVjaWZpY2F0aW9uKHMp
IHdoaWNoCkkgbWVudGlvbmVkIGFib3ZlLgoKSSBoYXZlIHZlcmlmaWVkIHRoZXNlIGRldGFpbHMg
YWdhaW5zdCB0aGUgb2ZmaWNpYWwgZG9jdW1lbnQgdG8gZW5zdXJlCmFjY3VyYWN5LgoKVGhlIGV4
dGVuc2lvbiBkZXNjcmlwdGlvbnMgYXJlIGluY2x1ZGVkIGluIHRoZSBjb21taXQgbWVzc2FnZSB0
byBwcm92aWRlCm5lY2Vzc2FyeSBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uLgoKPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+IHYy
OiBOZXcgcGF0Y2guCj4gPiAtLS0KPiA+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBp
bmRleCBhNmI5ZDdlM2VkZjg2ZWNmYjExN2JhNzJlMjk1ZWYwOTdiZGM5ODMxLi5lZDdhODhjMGFi
M2I3ZGM3YWQ0YTRkMmZkMzAwZDZmYjMzZWYwNTBjIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
ID4gQEAgLTE2MCwxMiArMTYwLDI2IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgIGJl
aGF2aW91cmFsIGNoYW5nZXMgdG8gaW50ZXJydXB0cyBhcyBmcm96ZW4gYXQgY29tbWl0IGNjYmRk
YWIKPiA+ICAgICAgICAgICAgICAgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzQyIGZyb20gcmlzY3Yv
amhhdXNlci0yMDIzLVJDNCIpIG9mIHJpc2N2LWFpYS4KPiA+Cj4gPiArICAgICAgICAtIGNvbnN0
OiBzc2NjcHRyCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgICAgICAg
VGhlIHN0YW5kYXJkIFNzY2NwdHIgZXh0ZW5zaW9uIGZvciBtYWluIG1lbW9yeSAoY2FjaGVhYmls
aXR5IGFuZAo+ID4gKyAgICAgICAgICAgIGNvaGVyZW5jZSkgaGFyZHdhcmUgcGFnZS10YWJsZSBy
ZWFkcywgYXMgcmF0aWZpZWQgaW4gUklTQy1WCj4gPiArICAgICAgICAgICAgUHJvZmlsZXMgVmVy
c2lvbiAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4NyAoIlVwZGF0ZWQgdG8KPiA+ICsgICAg
ICAgICAgICByYXRpZmllZCBzdGF0ZS4iKQo+ID4gKwo+ID4gICAgICAgICAgIC0gY29uc3Q6IHNz
Y29mcG1mCj4gPiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gICAgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgU3Njb2ZwbWYgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIGNvdW50
IG92ZXJmbG93Cj4gPiAgICAgICAgICAgICAgIGFuZCBtb2RlLWJhc2VkIGZpbHRlcmluZyBhcyBy
YXRpZmllZCBhdCBjb21taXQgMDFkMWRmMCAoIkFkZCBhYmlsaXR5Cj4gPiAgICAgICAgICAgICAg
IHRvIG1hbnVhbGx5IHRyaWdnZXIgd29ya2Zsb3cuICgjMikiKSBvZiByaXNjdi1jb3VudC1vdmVy
Zmxvdy4KPiA+Cj4gPiArICAgICAgICAtIGNvbnN0OiBzc2NvdW50ZXJlbncKPiA+ICsgICAgICAg
ICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3Njb3VudGVy
ZW53IGV4dGVuc2lvbiBmb3Igc3VwcG9ydCB3cml0YWJsZSBlbmFibGVzCj4gPiArICAgICAgICAg
ICAgaW4gc2NvdW50ZXJlbiBmb3IgYW55IHN1cHBvcnRlZCBjb3VudGVyLCBhcyByYXRpZmllZCBp
biBSSVNDLVYKCkhlcmUsIEkgdXNlZCB0aGUgYWJicmV2aWF0ZWQgdmVyc2lvbi4gU2VlIGJlbG93
LgoKPiA+ICsgICAgICAgICAgICBQcm9maWxlcyBWZXJzaW9uIDEuMCwgd2l0aCBjb21taXQgYjFk
ODA2NjA1Zjg3ICgiVXBkYXRlZCB0bwo+ID4gKyAgICAgICAgICAgIHJhdGlmaWVkIHN0YXRlLiIp
Cj4KPiBNYXliZSB5b3Ugc2hvdWxkIGp1c3QgY29weSB0aGUgdGV4dCBmcm9tIHRoZSBSVkEyMyBz
cGVjaWZpY2F0aW9uCj4gZm9yIGFsbCBvZiB0aGVzZS4gIFNvIHNvbWV0aGluZyBsaWtlOgo+Cj4g
ICAgRm9yIGFueSBocG1jb3VudGVyIHRoYXQgaXMgbm90IHJlYWQtb25seSB6ZXJvLCB0aGUgY29y
cmVzcG9uZGluZwo+ICAgIGJpdCBpbiBzY291bnRlcmVuIG11c3QgYmUgd3JpdGFibGUuICBUaGlz
IHdhcyByYXRpZmllZCBpbiB0aGUKPiAgICBSSVNDLVYgUHJvZmlsZXMgc3BlY2lmaWNhdGlvbiB2
ZXJzaW9uIDEuMCwgd2l0aCBjb21taXQgLi4uCj4KCkFzIHlvdSBub3RpY2VkLCB0aGUgUlZBMjMg
UHJvZmlsZSB2MS4wIHByb3ZpZGVzIHR3byB2ZXJzaW9ucyBvZiBleHBsYW5hdGlvbgpmb3IgU3Nj
b3VudGVyZW53OgoiU3Njb3VudGVyZW53OiBGb3IgYW55IGhwbWNvdW50ZXIgdGhhdCBpcyBub3Qg
cmVhZC1vbmx5IHplcm8sIHRoZSBjb3JyZXNwb25kaW5nCmJpdCBpbiBzY291bnRlcmVuIG11c3Qg
YmUgd3JpdGFibGUiCiJTc2NvdW50ZXJlbnc6IFN1cHBvcnQgd3JpdGVhYmxlIGVuYWJsZXMgZm9y
IGFueSBzdXBwb3J0ZWQgY291bnRlciIKCkJSLApHdW9kb25nIFh1Cgo+ID4gKwo+ID4gICAgICAg
ICAgIC0gY29uc3Q6IHNzbnBtCj4gPiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gICAg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3NucG0gZXh0ZW5zaW9uIGZvciBuZXh0LW1vZGUgcG9p
bnRlciBtYXNraW5nIGFzCj4gPiBAQCAtMTc4LDYgKzE5MiwyNCBAQCBwcm9wZXJ0aWVzOgo+ID4g
ICAgICAgICAgICAgICByYXRpZmllZCBhdCBjb21taXQgM2Y5ZWQzNCAoIkFkZCBhYmlsaXR5IHRv
IG1hbnVhbGx5IHRyaWdnZXIKPiA+ICAgICAgICAgICAgICAgd29ya2Zsb3cuICgjMikiKSBvZiBy
aXNjdi10aW1lLWNvbXBhcmUuCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDogc3N0dmFsYQo+ID4g
KyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBT
c3R2YWxhIGV4dGVuc2lvbiBmb3Igc3R2YWwgcHJvdmlkZXMgYWxsIG5lZWRlZCB2YWx1ZXMKPiA+
ICsgICAgICAgICAgICBhcyByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAs
IHdpdGggY29tbWl0IGIxZDgwNjYwNWY4Nwo+ID4gKyAgICAgICAgICAgICgiVXBkYXRlZCB0byBy
YXRpZmllZCBzdGF0ZS4iKQo+Cj4gT3IgYWx0ZXJuYXRpdmUgdG8gdGhlIGZ1bGwgdGV4dCBpbiB0
aGUgc3BlYywgeW91IGNvdWxkIGNvcHkgb3Zlcgo+IHRoZSBhYmJyZXZpYXRlZCBkZXNjcmlwdGlv
biBsaXN0ZWQgaW4gdGhlIGdsb3NzYXJ5IGF0IHRoZSBlbmQKPiBpbnN0ZWFkLiAgU29tZXRoaW5n
IGxpa2U6Cj4KPiAgICBzdHZhbCBwcm92aWRlcyBhbGwgbmVlZGVkIHZhbHVlcy4gIFRoaXMgd2Fz
IHJhdGlmaWVkIGluLi4uCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLUFsZXgKPgo+ID4gKwo+ID4gKyAgICAgICAgLSBjb25zdDogc3N0dmVjZAo+ID4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc3R2ZWNk
IGV4dGVuc2lvbiBmb3Igc3R2ZWMgc3VwcG9ydHMgRGlyZWN0IG1vZGUgYXMKPiA+ICsgICAgICAg
ICAgICByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAsIHdpdGggY29tbWl0
IGIxZDgwNjYwNWY4Nwo+ID4gKyAgICAgICAgICAgICgiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0
ZS4iKQo+ID4gKwo+ID4gKyAgICAgICAgLSBjb25zdDogc3N1NjR4bAo+ID4gKyAgICAgICAgICBk
ZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc3U2NHhsIGV4dGVu
c2lvbiBmb3IgVVhMRU49NjQgbXVzdCBiZSBzdXBwb3J0ZWQsIGFzCj4gPiArICAgICAgICAgICAg
cmF0aWZpZWQgaW4gUklTQy1WIFByb2ZpbGVzIFZlcnNpb24gMS4wLCB3aXRoIGNvbW1pdCBiMWQ4
MDY2MDVmODcKPiA+ICsgICAgICAgICAgICAoIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3RhdGUuIikK
PiA+ICsKPiA+ICAgICAgICAgICAtIGNvbnN0OiBzdmFkZQo+ID4gICAgICAgICAgICAgZGVzY3Jp
cHRpb246IHwKPiA+ICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFN2YWRlIHN1cGVydmlzb3It
bGV2ZWwgZXh0ZW5zaW9uIGZvciBTVy1tYW5hZ2VkIFBURSBBL0QKPiA+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
