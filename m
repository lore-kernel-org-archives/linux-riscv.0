Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB43CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xub5cgK/t8FJnlsMDucgl3n0knRBONznNY0xfjkE34s=; b=iwusUqHIC/G8/z
	4KCHYOyi/A5jrOmDd2R810Q4Ve0FwqN4lXMAsXMKdgKzdEB5sn1/97haLNeqzqEGYz/AQ3U8fGhyZ
	QdVk2wnLpKQ2feVk4phHfhKkxrVkPnfqd+qQs3Nb0V6F+wLB09LMkeV5v1AJT1K2stLMuJQiOmtOM
	ZpnaQSX1VkIw3BkZEFZGGW0fMilNPVVB88BL779meZU2ulAN/JwPupH5uTDeaL/qWGmhcjMI7WSha
	PPeE1RYXcS+dLF7voSkvKWTo3vAFHI3+A0Y3eoILzLh3aUEbGZFnLgT6LdrHMyHVzugWItBcDZKHD
	4ZNPA+PAVeYugnutlivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOVE-0000000Fkt7-3Ykt;
	Wed, 10 Sep 2025 17:21:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOVB-0000000Fkqc-44By
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 17:21:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f6f434c96so7085206e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757524859; x=1758129659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4y7C8S2xJQZYsJ9c9ADBNgi86RVk7zzkb8x6ic0x2s=;
        b=dYzQb1gcot3XgSu8jg+LwVqAQKpXhj9Lynkc+ZA9S1E0BMwxFRdJEiTGJ4wcX5yMev
         zs2pSqO5qfPQCV6Nc5xQkfkg94YsqvcmIUl2OT91ICyhjidNxYD7fwvL7hZMBijJQFl4
         oV4WGroP1oY7wnOLI3sfyXMIKeWhgbAFgFGg7AW1nhDElVVL1AWC1iJXzScFj1/DfwxM
         Kg+wUkptdSq1Hb8/8bBZofyn2jp/coR7mu9xh07N61DMf1PH3PcfgERC+mtuycV+czhZ
         7F5LSL9wxdlIH4gjYoYgrhPvWDEp81k/YiXCaeLf/jg7d6Ll7UPjNF2Pe5lJQNEIxIeg
         OI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757524859; x=1758129659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4y7C8S2xJQZYsJ9c9ADBNgi86RVk7zzkb8x6ic0x2s=;
        b=UaXs3QY8pUM7o8TeREdfjuOFkQPC3VeY1ez3HiWsBE7ETTGYriBk92gaaIJoBcKEHC
         5+SLql75pG7FVZ2l+f8RHVncAzTd1AxPh5et8B+rzBeYVdoDm7zL8zGGjeyuWPLBS8Ep
         6dc3q5zaCi7plYQDpZgbQjx0kTHzL1J22qhT/n5D0UQfrj272kXH1dv8XBAvd5JA4bMf
         zzWXxmoUWziryfBtiIWxBm3+xvMZFjAgiTf9pWCj79NpIrIGONZewbwO7iPqtDwy5HTi
         l2bXtgTLdbtxMN0EPmG3jX8sCqJ/FO+J0JsJ/rZUUFA7CgfxyhDs6+IpC864hpzxp0wJ
         RMtw==
X-Forwarded-Encrypted: i=1; AJvYcCU3F7h0145Pa2vmopf3jslRV4U6ajIzoWAeHmdB2aVVvdXU+KZ5q1dh1uIdg45DLKSK4JuTRKuUF10PXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsw/WE6q1CxrWUu32HEkgvtYrrLVjwHlMz/4I2U0gj+nsR/onb
	naDefJoq3DOOwily61vKsD5HjefpuggBPDx1rmYUeSFlikD9fs1eItGuXdHv7mNhJSY3EboM5iW
	nkcSAAUelKi01039inG0LQabMAjhpazfe6WsuUV0UHg==
X-Gm-Gg: ASbGncuj2Bc3B1Q31ZQSgK9Qt5NCTkYQzbDUrdWDrdUYj+9xE296rUNJqn+xWRSiixt
	fysWn3YPFe5Bz+DDxIam0kYDUayPEmz0lD5KDL6OtBIt39KsJi1IFDAnR77/yJyU/CzuzGVmy6e
	kDUL7R6rxHt1Ao8UMOV4/q4RJ3aHBcXRP3O0ff/T8hX0ylgFSz+hIpmW96a9pRGR0W3z26ElhNp
	XuF1Nuxe13cCMzMWjk=
X-Google-Smtp-Source: AGHT+IEMC5CgIT7ZKhbb9e4OnXDYYVwccWgf2cqpuCV1m2eXMNd148ZBrJvXPaZEKu+blEhZhrwZCup0EV+3UQHRlvM=
X-Received: by 2002:a05:6512:33d2:b0:560:95c0:a523 with SMTP id
 2adb3069b0e04-56262667e77mr5945448e87.35.1757524859373; Wed, 10 Sep 2025
 10:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
In-Reply-To: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 10 Sep 2025 22:50:47 +0530
X-Gm-Features: Ac12FXyVWt78cRqW1T3y7uW90ELz685Wecbof4GuJH9AJDtvZCte0fSBKlzx1OU
Message-ID: <CAK9=C2UnN0VFnGCRSHaYrwzjHFu-PfWpWkBzNfJNW9wwM8UOvw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] riscv: Handle synchronous hardware error exception
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: xueshuai@linux.alibaba.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, james.morse@arm.com, tony.luck@intel.com, 
	cleger@rivosinc.com, hchauhan@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_102102_041995_B891830C 
X-CRM114-Status: GOOD (  21.51  )
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMzowNOKAr1BNIFJ1aWRvbmcgVGlhbgo8dGlhbnJ1aWRv
bmdAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3IgaGFuZGxpbmcgc3luY2hyb25vdXMgaGFyZHdhcmUg
ZXJyb3JzCj4gb24gUklTQy1WLCBsYXlpbmcgdGhlIGdyb3VuZHdvcmsgZm9yIG1vcmUgcm9idXN0
IGtlcm5lbC1tb2RlIGVycm9yIHJlY292ZXJ5Lgo+Cj4gMS4gQmFja2dyb3VuZAo+IEhhcmR3YXJl
IGVycm9yIHJlcG9ydGluZyBtZWNoYW5pc21zIHR5cGljYWxseSBmYWxsIGludG8gdHdvIGNhdGVn
b3JpZXM6Cj4gYXN5bmNocm9ub3VzIGFuZCBzeW5jaHJvbm91cy4KPgo+IC0gQXN5bmNocm9ub3Vz
IGVycm9ycyAoZS5nLiwgbWVtb3J5IHNjcnViYmluZyBlcnJvcnMpIHJlcG90ZWQgYnkgYSBhc3lu
Y2hyb25vdXMKPiBleGNlcHRpb25zIG9yIGEgaW50ZXJydXB0LCBhcmUgdXN1YWxseSBoYW5kbGVk
IGJ5IEdIRVMgc3Vic3lzdGVtcy4gRm9yIGluc3RhbmNlLAo+IEFSTSB1c2VzIFNERUksIGFuZCBh
IHNpbWlsYXIgU1NFIHNwZWNpZmljYXRpb24gaXMgYmVpbmcgcHJvcG9zZWQgZm9yIFJJU0MtVi4K
PiAtIFN5bmNocm9ub3VzIGVycm9ycyAoZS5nLiwgcmVhZGluZyBwb2lzb25lZCBkYXRhKSBjYXVz
ZSB0aGUgcHJvY2Vzc29yIGNvcmUgdG8KPiB0YWtlIGEgcHJlY2lzZSBleGNlcHRpb24uIFRoaXMg
aXMga25vd24gYXMgYSBTeW5jaHJvbm91cyBFeHRlcm5hbCBBYm9ydCAoU0VBKQo+IG9uIEFSTSwg
YSBNYWNoaW5lIENoZWNrIEV4Y2VwdGlvbiAoTUNFKSBvbiB4ODYsIGFuZCBpcyBkZXNpZ25hdGVk
IGFzIHRyYXAgd2l0aAo+IG1jYXVzZSAxOSBvbiBSSVNDLVYuCj4KPiBEaXNjdXNzaW9ucyB3aXRo
aW4gdGhlIFJWSSBQUlMgVEcgaGF2ZSBhbHJlYWR5IGxlZCB0byBwcm9wb3NhbHNbMF0gdG8gVUVG
SSBmb3IKPiBzdGFuZGFyZGl6aW5nIHR3byBub3RpZmljYXRpb24gbWV0aG9kcywgU1NFIGFuZCBI
YXJkd2FyZSBFcnJvciBFeGNlcHRpb24sCj4gb24gUklTQy1WLgo+IFRoaXMgc2VyaWVzIGZvY3Vz
ZXMgb24gaW1wbGVtZW50aW5nIEhhcmR3YXJlIEVycm9yIEV4Y2VwdGlvbiBub3RpZmljYXRpb24g
dG8KPiBoYW5kbGUgc3luY2hyb25vdXMgZXJyb3JzLiBIaW1hbnNodSBDaGF1aGFuIGhhcyBhbHJl
YWR5IHN0YXJ0ZWQgd29ya2luZyBvbiBTU0VbMV0uCj4KPiAyLiBNb3RpdmF0aW9uCj4gV2hpbGUg
YSBzeW5jaHJvbm91cyBoYXJkd2FyZSBlcnJvcnMgb2NjdXJyaW5nIGluIGtlcm5lbCBjb250ZXh0
IChlLmcuLCBkdXJpbmcKPiBnZXRfdXNlciwgcHV0X3VzZXIsIENvVywgZXRjLikuIFRoZSBrZXJu
ZWwgcmVxdWlyZXMgYSBmaXh1cCBtZWNoYW5pc20gKHZpYQo+IGV4dGFibGUpIHRvIHJlY292ZXIg
ZnJvbSBzdWNoIGVycm9ycyBhbmQgcHJldmVudCBhIHN5c3RlbSBwYW5pYy4gSG93ZXZlciwgdGhl
Cj4gQVBFSS9HSEVTIHN1YnN5c3RlbSwgYmVpbmcgYXN5bmNocm9ub3VzLCBjYW5ub3QgZGlyZWN0
bHkgbGV2ZXJhZ2UgdGhlIHN5bmNocm9ub3VzCj4gZXh0YWJsZSBmaXh1cCBwYXRoLgo+Cj4gQnkg
aGFuZGxpbmcgdGhlIHN5bmNocm9ub3VzIGV4Y2VwdGlvbiBkaXJlY3RseSwgd2UgZW5hYmxlIHRo
ZSB1c2Ugb2YgdGhpcyBmaXh1cAo+IG1lY2hhbmlzbSwgYWxsb3dpbmcgdGhlIGtlcm5lbCB0byBn
cmFjZWZ1bGx5IHJlY292ZXIgZnJvbSBoYXJkd2FyZSBlcnJvcnMKPiBlbmNvdW50ZXJlZCBkdXJp
bmcga2VybmVsIGV4ZWN1dGlvbi4gVGhpcyBicmluZ3MgUklTQy1WJ3MgZXJyb3IgaGFuZGxpbmcK
PiBjYXBhYmlsaXRpZXMgY2xvc2VyIHRvIHRoZSByb2J1c3RuZXNzIGZvdW5kIG9uIEFSTVsyXSBh
bmQgeDg2WzNdLgo+Cj4gMy4gV2hhdCBUaGlzIFBhdGNoIFNlcmllcyBEb2VzCj4gVGhpcyBpbml0
aWFsIHNlcmllcyBsYXlzIHRoZSBmb3VuZGF0aW9uYWwgaW5mcmFzdHJ1Y3R1cmUuIEl0IHByaW1h
cmlseToKPiAtIEludHJvZHVjZXMgYSBuZXcgZXhjZXB0aW9uIGhhbmRsZXIgZm9yIHN5bmNocm9u
b3VzIGhhcmR3YXJlIGVycm9ycyAobWNhdXNlPTE5KS4KPiAtIEVzdGFibGlzaGVzIHRoZSBjb3Jl
IGV4Y2VwdGlvbiBwYXRoLCB3aGljaCBpcyBhIHByZXJlcXVpc2l0ZSBmb3Iga2VybmVsCj4gICBj
b250ZXh0IGVycm9yIHJlY292ZXJ5Lgo+Cj4gUGxlYXNlIG5vdGUgdGhhdCB0aGlzIHZlcnNpb24g
ZG9lcyBub3QgeWV0IGltcGxlbWVudCB0aGUgZnVsbCBrZXJuZWwgZml4dXAgbG9naWMKPiBmb3Ig
cmVjb3ZlcnkuIFRoYXQgZnVuY3Rpb25hbGl0eSBpcyBwbGFubmVkIGZvciB0aGUgbmV4dCBmb3Jt
YWwgdmVyc2lvbi4KPgo+IFNvbWUgYWRhcHRhdGlvbnMgZm9yIEdIRVMgYXJlIGluY2x1ZGVkLCBi
YXNlZCBvbiB0aGUgd29yayBmcm9tIEhpbWFuc2h1IENoYXVoYW5bMV0KPgo+IDQuIEZ1dHVyZSBQ
bGFucwo+IC0gSW1wbGVtZW50IGZ1bGwga2VybmVsIGZpeHVwIHN1cHBvcnQgdG8gaGFuZGxlIGFu
ZCByZWNvdmVyIGZyb20gZXJyb3JzIGluCj4gICBzb21lIGtlcm5lbCBjb250ZXh0WzJdLgo+IC0g
QWRkIHN1cHBvcnQgZm9yIGhhbmRsaW5nICJkb3VibGUgdHJhcCIgc2NlbmFyaW9zLgo+Cj4gNS4g
VGVzdGluZyBNZXRob2RvbG9neQo+Cj4gdGVzdCBwcm9ncmFtOiByYXMtdG9vbHM6IGh0dHBzOi8v
a2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FlZ2wvcmFz
LXRvb2xzLwo+IHFlbXU6IGh0dHBzOi8vZ2l0aHViLmNvbS93aW50ZXJkZGQvcWVtdQo+IG9mZmNp
YWwgb3BlbnNiaSBhbmQgZWRrMjoKPgo+IC0gUnVuIHFlbXU6Cj4gcWVtdS1zeXN0ZW0tcmlzY3Y2
NCAtTSB2aXJ0LHBmbGFzaDA9cGZsYXNoMCxwZmxhc2gxPXBmbGFzaDEsYWNwaT1vbixhaWE9YXBs
aWMtaW1zaWMKPiAgLWNwdSBtYXggLW0gNjRHIC1zbXAgNjQgLWRldmljZSB2aXJ0aW8tZ3B1LXBj
aSAtZnVsbC1zY3JlZW4gLWRldmljZSBxZW11LXhoY2kKPiAgLWRldmljZSB1c2Ita2JkIC1kZXZp
Y2UgdmlydGlvLXJuZy1wY2kKPiAgLWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxhc2gwLGRyaXZlcj1m
aWxlLHJlYWQtb25seT1vbixmaWxlbmFtZT1SSVNDVl9WSVJUX0NPREUuZmQKPiAgLWJsb2NrZGV2
IG5vZGUtbmFtZT1wZmxhc2gxLGRyaXZlcj1maWxlLGZpbGVuYW1lPVJJU0NWX1ZJUlRfVkFSUy5m
ZAo+ICAtYmlvcyBmd19keW5hbWljLmJpbiAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRl
dj1uZXQwCj4gIC1uZXRkZXYgdXNlcixpZD1uZXQwLGhvc3Rmd2Q9dGNwOjoyMjIzLToyMgo+ICAt
a2VybmVsIEltYWdlIC1pbml0cmQgcm9vdGZzCj4gIC1hcHBlbmQgInJkaW5pdD0vc2Jpbi9pbml0
IGVhcmx5Y29uIHZlcmJvc2UgZGVidWcgc3RyaWN0X2Rldm1lbT0wIG5va2FzbHIiCj4gIC1tb25p
dG9yIHRlbG5ldDoxMjcuMC4wLjE6NTU1NyxzZXJ2ZXIsbm93YWl0IC1ub2dyYXBoaWMKPgo+IC0g
UnVuIHJhcy10b29sczoKPiAuL2VpbmpfbWVtX3VjIC1qIC1rIHNpbmdsZSAmCj4gJCAwOiBzaW5n
bGUgICB2YWRkciA9IDB4N2ZmZjg2ZmY0NDAwIHBhZGRyID0gMTA3ZDExYjQwMAo+Cj4gLSBJbmpl
Y3QgcG9pc29uCj4gdGVsbmV0IGxvY2FsaG9zdCA1NTU3Cj4gcG9pc29uX2VuYWJsZSBvbgo+IHBv
aXNvbl9hZGQgMHgxMDdkMTFiNDAwCj4KPiAtIFJlYWQgcG9pc29uCj4gZWNobyB0cmlnZ2VyID4g
Li90cmlnZ2VyX3N0YXJ0Cj4gJCB0cmlnZ2VyaW5nIC4uLgo+ICQgc2lnbmFsIDcgY29kZSAzIGFk
ZHIgMHg3ZmZmODZmZjQ0MDAKPgo+IFswXTogaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNo
LXBycy90b3BpYy9yaXNjX3ZfcmFzX3JlbGF0ZWRfZWNycy8xMTM2ODU2NTMKPiBbMV06IGh0dHBz
Oi8vcGF0Y2hldy5vcmcvbGludXgvMjAyNTAyMjcxMjM2MjguMjkzMTQ5MC0xLWhjaGF1aGFuQHZl
bnRhbmFtaWNyby5jb20vCj4gWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQx
MjA5MDI0MjU3LjM2MTg0OTItMS10b25ndGlhbmdlbkBodWF3ZWkuY29tLwo+IFszXTogaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvOWRkMTgzNWVjZGE1Yjk2YWM4OGMxNjZm
NGE4NzM4NmYzZTcyN2JkOS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9jb3JlLmMjTDE1MTQKPgo+
IEhpbWFuc2h1IENoYXVoYW4gKDIpOgo+ICAgcmlzY3Y6IERlZmluZSBpb3JlbWFwX2NhY2hlIGZv
ciBSSVNDLVYKPiAgIHJpc2N2OiBEZWZpbmUgYXJjaF9hcGVpX2dldF9tZW1fYXR0cmlidXRlIGZv
ciBSSVNDLVYKPgo+IFJ1aWRvbmcgVGlhbiAoMyk6Cj4gICBhY3BpOiBJbnRyb2R1Y2UgU1NFIGFu
ZCBIRUUgaW4gSEVTVCBub3RpZmljYXRpb24gdHlwZXMKPiAgIHJpc2N2OiBJbnRyb2R1Y2UgSEVT
VCBIRUUgbm90aWZpY2F0aW9uIGhhbmRsZXJzIGZvciBBUEVJCj4gICByaXNjdjogQWRkIEhhcmR3
YXJlIEVycm9yIEV4Y2VwdGlvbiB0cmFwIGhhbmRsZXIKPgoKSGltYW5zaHUgaGFkIGFscmVhZHkg
c2VudC1vdXQgUkZDIHYxIHdheSBiYWNrIGluIEZlYiAyMDI1IFsxXSB3aGljaApkaWQgbm90IHJl
Y2VpdmUgYW55IGNvbW1lbnRzIG9yIGZlZWRiYWNrLgoKSW5zdGVhZCBvZiBzZW5kaW5nIG91dCBh
IGhhbGYtYmFrZWQgc2VyaWVzLCBpdCB3aWxsIGJlIGhlbHBmdWwgaWYgeW91CmNhbiByZXZpZXcg
SGltYW5zaHUncyBzZXJpZXMuCgpSZWdhcmRzLApBbnVwCgpbMV0gaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9saW51eC8yMDI1MDIyNzEyMzYyOC4yOTMxNDkwLTEtaGNoYXVoYW5AdmVudGFuYW1pY3JvLmNv
bS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
