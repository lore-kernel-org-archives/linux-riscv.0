Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D3C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT18pjDLXTz5KsMUlpdL5SgFvgR4bG7wJXezgZVqPPo=; b=AS46U3wwdi4+D5
	FsciDeF2uQeDa8MbHUMfBmiuYT+B/oUG3vAg+wc77aodkdb0Ilj2cr0/C988rU9xcR2gCpsQgdXDK
	BoBIHwUjrOyMKNkWuN4c1C/9a0spFadDi30f86D3bFEUqaiyB1x3OLIq/eQf9SfrBJuPKp2lvp9jV
	7lhCa7zBrlk7spgGcW7Mg62Jkv2FzREIBNaYuyk8faJSGzKrmlaLbNQXRWeWTjCDgNoCHjaNKofh5
	5IRn+ZpOUCmbOIInpF4/pr7TBDO6biaiahygWvV6B3bLAmBXucge6Zt5cmN4Fo4KFO7ZY0C1i2Qis
	j95BjDy5/t3PocBJQxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJbP-00000004KHZ-3vbY;
	Wed, 29 May 2024 13:44:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJbL-00000004KFW-3X7E;
	Wed, 29 May 2024 13:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1256760C64;
	Wed, 29 May 2024 13:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AE5C32782;
	Wed, 29 May 2024 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716990262;
	bh=VQgHFgqP/4XpqkYAK/f5SZ2pHbIQPnlx3L/xfDABSkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ldh1lFQNlkJoGyhqSYbTknan/c+BczYYSyD6Dl3BgcEUWCOZ87MwiAWLKR4tUy+N4
	 jUA6HeGMzjStli3t6Q5eBVfzUrSLfn/xpRvEfHXb4JRxbnSwbTYCrRU1ZRauZzLNkF
	 bWJrRc2F3r3bpb5TDf2V5A5jQaZKYH9JxWdqGMghLxaDhX0qM1APNyXASJO3LMaRWa
	 /dVznUDRS7a9lQvvbB93Zg92qPDAOlHv8prYAoxsWbDCdKffDpimglaSF/sDYZzhPI
	 aJrwp/+tL0PgjuOU6tY+ISPVNZv6Pvikg5s+C2tEdihX61SC5626QlZD0vHLZWIEz2
	 /USnH1kCu+D4Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b27afe214so467108e87.1;
        Wed, 29 May 2024 06:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFGaeIrJ1rVnO1o1kx8zB9f2eeLoKGAPWLGQ41mC4WDD4r/MpzDqhbvKlJ/VSTnAFigWITdGQKJ1sC+pQy7cFITeGF057HHtHk2+KdEHbqqXHQn7WjK8UydphU3ibGvpHN6wgA9Ieu2Zd5DJsGHFSVI8Xqcco=
X-Gm-Message-State: AOJu0YxR3Ty9VaSNtDVgEqhTUMe3E7W8yxnlE6VgRfkTgDJYuXbzkPAA
	8xhtarUuul8lCo/Ky6+jqVR2N/dtm8uXorfhfrCitu9KpTr3QyDAQ3F6ROK4+qDwaz+jSQVJ8sg
	Onu0VO3etPUaWBqM3z47Mve0RDA==
X-Google-Smtp-Source: AGHT+IG0Twsuzy3G15biXOtdBIc6ZH3RX7c1OUW5xcm5mEL/8kjZupd/YmgZJOtQEJePvqdfFd0WJ/312vXzKdPlv50=
X-Received: by 2002:a05:6512:2148:b0:52b:7a62:7600 with SMTP id
 2adb3069b0e04-52b7a627762mr1520e87.16.1716990261135; Wed, 29 May 2024
 06:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org> <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
 <86bk4pm8j1.wl-maz@kernel.org>
In-Reply-To: <86bk4pm8j1.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 May 2024 08:44:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKOxYeNh026wmYH2JDYbR-FGjc=9gv-taB09pC4fyXKCA@mail.gmail.com>
Message-ID: <CAL_JsqKOxYeNh026wmYH2JDYbR-FGjc=9gv-taB09pC4fyXKCA@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_064423_996045_2893B7AF 
X-CRM114-Status: GOOD (  36.27  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTozM+KAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOSBNYXkgMjAyNCAwNjoxNTo1MiArMDEwMCwKPiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVl
LCBNYXkgMjgsIDIwMjQgYXQgMTA6MTHigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gQ29tbWl0IGQ5NzZjNmY0YjMyYyAoIm9mOiBwcm9wZXJ0eTog
QWRkIGZ3X2Rldmxpbmsgc3VwcG9ydCBmb3IKPiA+ID4gaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIp
IHRyaWVkIHRvIGRvIHdoYXQgaXQgc2F5cyBvbiB0aGUgdGluLAo+ID4gPiBidXQgZmFpbGVkIG9u
IGEgY291cGxlIG9mIHBvaW50czoKPiA+ID4KPiA+ID4gLSBpdCBjb25mdXNlcyBieXRlcyBhbmQg
Y2VsbHMuIE5vdCBhIGh1Z2UgZGVhbCwgZXhjZXB0IHdoZW4gaXQKPiA+ID4gICBjb21lcyB0byBw
b2ludGVyIGFyaXRobWV0aWMKPiA+ID4KPiA+ID4gLSBpdCBkb2Vzbid0IHJlYWxseSBoYW5kbGUg
YW55dGhpbmcgYnV0IGludGVycnVwdC1tYXBzIHRoYXQgaGF2ZQo+ID4gPiAgIHRoZWlyIHBhcmVu
dCAjYWRkcmVzcy1jZWxscyBzZXQgdG8gMAo+ID4gPgo+ID4gPiBUaGUgY29tYmluYXRpb25zIG9m
IHRoZSB0d28gbGVhZHMgdG8gc29tZSBzZXJpb3VzIGZ1biBvbiBteSBNMQo+ID4gPiBib3gsIHdp
dGggcGxlbnR5IG9mIFdBUk4tT04oKSBmaXJpbmcgYWxsIG92ZXIgdGhlIHNob3AsIGFuZAo+ID4g
PiBhbXVzaW5nIHZhbHVlcyBiZWluZyBnZW5lcmF0ZWQgZm9yIGludGVycnVwdCBzcGVjaWZpZXJz
Lgo+ID4gPgo+ID4gPiBBZGRyZXNzIGJvdGggaXNzdWVzIHNvIHRoYXQgSSBjYW4gYm9vdCBteSBt
YWNoaW5lcyBhZ2Fpbi4KPiA+ID4KPiA+ID4gRml4ZXM6IGQ5NzZjNmY0YjMyYyAoIm9mOiBwcm9w
ZXJ0eTogQWRkIGZ3X2Rldmxpbmsgc3VwcG9ydCBmb3IgaW50ZXJydXB0LW1hcCBwcm9wZXJ0eSIp
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+Cj4gPiA+
IENjOiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gQ2M6IFNhcmF2
YW5hIEthbm5hbiA8c2FyYXZhbmFrQGdvb2dsZS5jb20+Cj4gPiA+IENjOiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIGZpeCBwYXRjaCBi
dXQgdW5mb3J0dW5hdGVseSBpdCBicmVha3MgZm9yIFJJU0MtVi4KPiA+Cj4gPiA+IC0tLQo+ID4g
PiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwgMTYgKysrKysrKysrKysrKystLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5
LmMKPiA+ID4gaW5kZXggMWM4M2U2OGY4MDViLi45YWRlYmM2M2JlYTkgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gPiArKysgYi9kcml2ZXJzL29mL3Byb3BlcnR5
LmMKPiA+ID4gQEAgLTEzMjIsNyArMTMyMiwxMyBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9ub2Rl
ICpwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiA+ICAgICAg
ICAgYWRkcmNlbGxzID0gb2ZfYnVzX25fYWRkcl9jZWxscyhucCk7Cj4gPiA+Cj4gPiA+ICAgICAg
ICAgaW1hcCA9IG9mX2dldF9wcm9wZXJ0eShucCwgImludGVycnVwdC1tYXAiLCAmaW1hcGxlbik7
Cj4gPiA+IC0gICAgICAgaWYgKCFpbWFwIHx8IGltYXBsZW4gPD0gKGFkZHJjZWxscyArIGludGNl
bGxzKSkKPiA+ID4gKyAgICAgICBpbWFwbGVuIC89IHNpemVvZigqaW1hcCk7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIENoZWNrIHRoYXQgd2UgaGF2ZSBlbm91Z2gg
cnVud2F5IGZvciB0aGUgY2hpbGQgdW5pdCBpbnRlcnJ1cHQKPiA+ID4gKyAgICAgICAgKiBzcGVj
aWZpZXIgYW5kIGEgcGhhbmRsZS4gVGhhdCdzIHRoZSBiYXJlIG1pbmltdW0gd2UgY2FuIGV4cGVj
dC4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8
PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMgKyAxKSkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVy
biBOVUxMOwo+ID4gPiAgICAgICAgIGltYXBfZW5kID0gaW1hcCArIGltYXBsZW47Cj4gPiA+Cj4g
PiA+IEBAIC0xMzQ2LDggKzEzNTIsMTQgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFy
c2VfaW50ZXJydXB0X21hcChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gPiAgICAgICAgICAg
ICAgICAgaWYgKCFpbmRleCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHN1
cF9hcmdzLm5wOwo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoc3VwX2Fy
Z3MubnApOwo+ID4gPiArICAgICAgICAgICAgICAgLyoKPiA+ID4gKyAgICAgICAgICAgICAgICAq
IEFjY291bnQgZm9yIHRoZSBmdWxsIHBhcmVudCB1bml0IGludGVycnVwdCBzcGVjaWZpZXIKPiA+
ID4gKyAgICAgICAgICAgICAgICAqIChhZGRyZXNzIGNlbGxzLCBpbnRlcnJ1cHQgY2VsbHMsIGFu
ZCBwaGFuZGxlKS4KPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAgICAg
ICAgaW1hcCArPSBvZl9idXNfbl9hZGRyX2NlbGxzKHN1cF9hcmdzLm5wKTsKPiA+Cj4gPiBUaGlz
IGJyZWFrcyBmb3IgUklTQy1WIGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSAiI2FkZHJlc3MtY2VsbHMi
Cj4gPiBwcm9wZXJ0eSBpbiBpbnRlcnJ1cHQgY29udHJvbGxlciBEVCBub2RlIGFuZCBvZl9idXNf
bl9hZGRyX2NlbGxzKCkKPiA+IHJldHJpZXZlcyAiI2FkZHJlc3MtY2VsbHMiIGZyb20gdGhlIHBh
cmVudCBvZiBpbnRlcnJ1cHQgY29udHJvbGxlci4KPgo+IFRoYXQncyBhIGZlYXR1cmUsIG5vdCBh
IGJ1Zy4gI2FkZHJlc3MtY2VsbHMsIEFGQUlDVCwgYXBwbGllcyB0byBhbGwKPiBjaGlsZCBub2Rl
cyB1bnRpbCB5b3Ugc2V0IGl0IG90aGVyd2lzZS4KClRoYXQgbWF5IGJlIHN1cHBvcnRlZCBpbiBz
b21lIHBsYWNlcywgYnV0IG9ubHkgYmVjYXVzZSBvZiBidWdneSBEVHMKKHdlJ3JlIHRhbGtpbmcg
MjAwMCBlcmEpLiBDdXJyZW50IGR0YyBzaG91bGQgd2FybiBpZiBhbiBpbnRlcnJ1cHQKY29udHJv
bGxlciBub2RlIGRvZXNuJ3QgaGF2ZSAjYWRkcmVzcy1jZWxscyBBTkQgaXMgcmVmZXJyZWQgdG8g
YnkKaW50ZXJydXB0LW1hcC4KClRoZXJlJ3MgYWxzbyB0aGUgbm90aW9uIG9mIGRlZmF1bHQgcm9v
dCB2YWx1ZXMsIGJ1dCB0aGF0J3MgYnJva2VuIGFzCndlbGwuIGR0YyBhbmQgdGhlIGtlcm5lbCBk
b24ndCBldmVuIGFncmVlIG9uIHRoZSBkZWZhdWx0IGZvciBzb21lCmFyY2hlcy4gRm9ydHVuYXRl
bHksIHRoYXQncyBiZWVuIGEgZHRjIHdhcm5pbmcgbG9uZ2VyIHRoYW4gSSd2ZSB3b3JrZWQKb24g
RFQuCgoKPiA+IFRoZSBvZl9pcnFfcGFyc2VfcmF3KCkgbG9va3MgZm9yICIjYWRkcmVzcy1jZWxs
cyIgcHJvcGVydHkKPiA+IGluIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBEVCBub2RlIG9ubHkg
c28gd2Ugc2hvdWxkIGRvIGEKPiA+IHNpbWlsYXIgdGhpbmcgaGVyZSBhcyB3ZWxsLgo+Cj4gVGhp
cyBsb29rcyBtb3JlIGxpa2UgYSBvZl9pcnFfcGFyc2VfcmF3KCkgYnVnIHRoYW4gYW55dGhpbmcg
ZWxzZS4KCk5vcGUuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
