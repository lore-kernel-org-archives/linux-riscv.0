Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA6C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7O0USqcV4GxApgI4DWjTno5AqXuLLL/14j2ahoMbZE=; b=SszGXvTCiqpCxe
	gtWc4ikK1OpTx54lq/LUTi9W1AjFzLh77JLB/60llMz0u6k475R9rdTggCeDd2gZr6ynwAIy7Q0vZ
	p1XYKjNtu7XKUga7xLgbsX8NoiZvw99KSm9aisE0Jtwdk9FZFkTa6Pmxc+wpqwzrOdn5qesBfMqHU
	dyTOw9fXfALK4vvE50LSxMfUNL5OobkieN3I7oA7m4S4sKuZm+/s5X/0vwI0hcTru9rptegUqzfM/
	hm4iwzbmW05DIGCUDETF8AosFhtYXQuPKdeHBDQ4rmuJ9naWBPP+VInp9WFL5MsHjGeoIbOv9JPyJ
	NyWMabmiEcpqGwTW+jOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1UR-0000000Aaxy-0Mbx;
	Wed, 03 Jul 2024 15:01:47 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1UO-0000000AaxN-1mD4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 15:01:46 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-37636c38d6aso24287185ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1720018903; x=1720623703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMRUfX0BK5RBjLAn5mop5AxUgXep4kIReWk5vXaWLb0=;
        b=mzkBWwrtI9ZEtHztJHtSkVNP+ahNNbN6aW09vQ2x5xxlMGAMkdLPhGTBvJBBvCtSmy
         aT3d7UHdgJVBc4lXi76PVosJ1qWc4AVHpmsHOhsEoFYSqiLo3v4gS1/6rhYR7YkvLzwA
         mAU4gPgzo4ayXUOvWymyabI8mjp3Z+pdxtnhjDzaZFq5PLIoiGbkaYoxDYow6RdZjSN2
         GHp3LmbDV2pK1bRyFJdiG54gg9d9f6zTTMtvRDAHcfL/Fah5GAsMiCgJNSHBWvcJnik0
         9Sx1BjwUggszI59mHFtBEEyn2OmAbbY2FXAy3sxc6oxYCIrAPJLbnm8x8cZ2HgXqH/o0
         DtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018903; x=1720623703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMRUfX0BK5RBjLAn5mop5AxUgXep4kIReWk5vXaWLb0=;
        b=E7kiQlSGgyB57PA0CvrYLlbaS1xyutmUN72n6zv0gjPwVZhmvPznMc2wy/P1sGe1XL
         sc0Qf8mjwiFUCwLYsicXbGaTIa+j9MPgp5ZUIQGuiQPQJBKf3Wy9COtPB8JXwoW7uFxb
         4QVKbtWptMJfHETmr+mt1ZkwIPgYgdIcKcJc8tjEwnOF8SWSImq7kEjYNG9PSPv6e6MU
         iFEJQ8OzO/xXCfE6BKpDRUAqlzLtcS+bcYRKfJ0yU5cj9eIQBsciRxj4BSS5OAbCsQ/l
         sl1I3SYdTOTJGf6b9kTT372XeNC4VVawbZ8fNzD8yuQvgwoGYoJf+gyNBb8xVHhZKqLf
         e62A==
X-Forwarded-Encrypted: i=1; AJvYcCXX5QyLUj9HXvn9jF23JOKJpMTuMfgUMAdidPWcMjUN5+idSQwY1K3uuKUtAGvF+fRv3XzinWaQRGAwVhsu9XF2EZVPsRkHba8MbqJMNZp9
X-Gm-Message-State: AOJu0Yy4r8LzxOpaJIl8A9UmGlNr6BTKttTlYlUd28tHlqAht5mwhVp/
	UYWvKU7KJ0imK6r4SRYdBeJtgR7+bXfgwnbXOxNlZeuZR+/3fLLPXYwvtJJKsAolUJhZT1bCO5J
	0n+UFd38OaypGfrbPE6k+q3q4Bioldyy7KjDBPA==
X-Google-Smtp-Source: AGHT+IETCrkwSv5xSicIihR2RzWpeOpdhkDXVmmb5uw1WCus4A9jiedPBfm0YhdKSAsHd7Q858BqR4nVhY2tCwDWajA=
X-Received: by 2002:a05:6e02:180a:b0:382:8ae4:d292 with SMTP id
 e9e14a558f8ab-3828ae4d428mr15645585ab.13.1720018903058; Wed, 03 Jul 2024
 08:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240703072659.1427616-1-namcao@linutronix.de>
 <CAAhSdy0ZGD-p0iBVPqHF0RKTwvAAMWwYZ0ufioRrO75JzSh1qQ@mail.gmail.com> <20240703123327.CvOiP2Jb@linutronix.de>
In-Reply-To: <20240703123327.CvOiP2Jb@linutronix.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jul 2024 20:31:31 +0530
Message-ID: <CAAhSdy3gZHnSwovxypY5vP438TNPj8h+miqtyBKhEUAdWj=htQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Fix plic_set_affinity() only enables
 1 cpu
To: Nam Cao <namcao@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, b.spranger@linutronix.de, 
	Christoph Hellwig <hch@lst.de>, Marc Zyngier <marc.zyngier@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_080144_782467_4BE156A9 
X-CRM114-Status: GOOD (  32.21  )
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

T24gV2VkLCBKdWwgMywgMjAyNCBhdCA2OjAz4oCvUE0gTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDU6Mjg6MjNQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDMsIDIwMjQgYXQgMTI6NTfigK9Q
TSBOYW0gQ2FvIDxuYW1jYW9AbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IHBsaWNf
c2V0X2FmZmluaXR5KCkgb25seSBlbmFibGVzIGludGVycnVwdCBmb3IgdGhlIGZpcnN0IHBvc3Np
YmxlIENQVSBpbgo+ID4gPiB0aGUgbWFzay4gVGhlIHBvaW50IGlzIHRvIHByZXZlbnQgYWxsIENQ
VXMgdHJ5aW5nIHRvIGNsYWltIGFuIGludGVycnVwdCwKPiA+ID4gYnV0IG9ubHkgb25lIENQVSBz
dWNjZWVkcyBhbmQgdGhlIG90aGVyIENQVXMgd2FzdGVkIHNvbWUgY2xvY2sgY3ljbGVzIGZvcgo+
ID4gPiBub3RoaW5nLgo+ID4gPgo+ID4gPiBIb3dldmVyLCB0aGVyZSBhcmUgdHdvIHByb2JsZW1z
IHdpdGggdGhhdDoKPiA+ID4gMS4gVXNlcnMgY2Fubm90IGVuYWJsZSBpbnRlcnJ1cHQgb24gbXVs
dGlwbGUgQ1BVcyAoZm9yIGV4YW1wbGUsIHRvIG1pbmltaXplCj4gPiA+IGludGVycnVwdCBsYXRl
bmN5KS4KPiA+Cj4gPiBXZWxsLCB5b3UgYXJlIGFzc3VtaW5nIHRoYXQgbXVsdGlwbGUgQ1BVcyBh
cmUgYWx3YXlzIGlkbGUgb3IgYXZhaWxhYmxlCj4gPiB0byBwcm9jZXNzIGludGVycnVwdHMuIElu
IG90aGVyIHdvcmRzLCBpZiB0aGUgc3lzdGVtIGlzIGxvYWRlZCBydW5uaW5nCj4gPiBzb21lIHdv
cmtsb2FkIG9uIGVhY2ggQ1BVIHRoZW4gcGVyZm9ybWFuY2Ugb24gbXVsdGlwbGUgQ1BVcwo+ID4g
d2lsbCBkZWdyYWRlIHNpbmNlIG11bHRpcGxlIENQVXMgd2lsbCB3YXN0ZWZ1bGx5IHRyeSB0byBj
bGFpbSBpbnRlcnJ1cHQuCj4gPgo+ID4gSW4gcmVhbGl0eSwgd2UgY2FuJ3QgbWFrZSBzdWNoIGFz
c3VtcHRpb25zIGFuZCBpdCBpcyBiZXR0ZXIgdG8gdGFyZ2V0IGEKPiA+IHBhcnRpY3VsYXIgQ1BV
IGZvciBwcm9jZXNzaW5nIGludGVycnVwdHMgKGp1c3QgbGlrZSB2YXJpb3VzIG90aGVyIGludGVy
cnVwdAo+ID4gY29udHJvbGxlcnMpLiBGb3IgYmFsYW5jaW5nIGludGVycnVwdCBwcm9jZXNzaW5n
IGxvYWQsIHdlIGhhdmUgc29mdHdhcmUKPiA+IGlycSBiYWxhbmNlcnMgcnVubmluZyBpbiB1c2Vy
LXNwYWNlIChvciBrZXJuZWwgc3BhY2UpIHdoaWNoIGRvIGEKPiA+IHJlYXNvbmFibHkgZmluZSBq
b2Igb2YgcGlja2luZyBhcHByb3ByaWF0ZSBDUFUgZm9yIGludGVycnVwdCBwcm9jZXNzaW5nLgo+
Cj4gVGhlbiB3ZSBzaG91bGQgbGVhdmUgdGhlIGpvYiBvZiBkaXN0cmlidXRpbmcgaW50ZXJydXB0
cyB0byB0aG9zZSB0b29scywKPiByaWdodD8gTm90IGFsbCB1c2UgY2FzZXMgd2FudCBtaW5pbWFs
bHkgd2FzdGVkIENQVSBjeWNsZXMuIEZvciBleGFtcGxlLCBpZgo+IGEgcGFydGljdWxhciBpbnRl
cnJ1cHQgZG9lcyBub3QgYXJyaXZlIHZlcnkgb2Z0ZW4sIGJ1dCB3aGVuIGl0IGRvZXMsIGl0Cj4g
bmVlZHMgdG8gYmUgaGFuZGxlZCBmYXN0OyBpbiB0aGlzIGV4YW1wbGUsIGNsZWFybHkgZW5hYmxp
bmcgdGhpcyBpbnRlcnJ1cHQKPiBmb3IgYWxsIENQVXMgaXMgc3VwZXJpb3IuCgpUaGlzIGlzIGEg
dmVyeSBzcGVjaWZpYyBjYXNlIHdoaWNoIHlvdSBhcmUgdHJ5aW5nIHRvIG9wdGltaXplIGFuZCBp
biB0aGUKcHJvY2VzcyBodXJ0aW5nIHBlcmZvcm1hbmNlIGluIG1hbnkgb3RoZXIgY2FzZXMuIFRo
ZXJlIGFyZSBtYW55IGhpZ2gKc3BlZWQgSU9zIChuZXR3b3JrLCBzdG9yYWdlLCBldGMpIHdoZXJl
IHJhdGUgb2YgaW50ZXJydXB0IGlzIGhpZ2ggc28gZm9yCnN1Y2ggSU8geW91ciBwYXRjaCB3aWxs
IGRlZ3JhZGUgcGVyZm9ybWFuY2Ugb24gbXVsdGlwbGUgQ1BVcy4KCj4KPiBCdXQgSSBhbSBzdXJl
IHRoZXJlIGFyZSB1c2VycyB3aG8gZG9uJ3QgdXNlIHNvbWV0aGluZyBsaWtlIGlycWJhbGFuY2Ug
YW5kCj4ganVzdCBsZXQgdGhlIHN5c3RlbSBkbyB0aGUgZGVmYXVsdCBiZWhhdmlvci4gU28gSSBz
ZWUgeW91ciBwb2ludCBvZiBub3QKPiB3YXN0aW5nIENQVSBjeWNsZXMuIFNvLCBob3cgYWJvdXQg
d2Uga2VlcCB0aGlzIHBhdGNoLCBidXQgYWxzbyBhZGQgYQo+ICJkZWZhdWx0IHBvbGljeSIgd2hp
Y2ggZXZlbmx5IGRpc3RyaWJ1dGVzIHRoZSBpbnRlcnJ1cHRzIHRvIGluZGl2aWR1YWxseQo+IENQ
VXMgKGJlc3QgZWZmb3J0IG9ubHkpLiBTb21ldGhpbmcgbGlrZSB0aGUgdW4tdGVzdGVkIHBhdGNo
IGJlbG93PwoKSSB3b3VsZCBzdWdnZXN0IGRyb3BwaW5nIHRoaXMgcGF0Y2ggYW5kIGZvciB0aGUg
c2FrZSBvZiBkaXN0cmlidXRpbmcKaW50ZXJydXB0cyBhdCBib290IHRpbWUgd2UgY2FuIGhhdmUg
dGhlIGJlbG93IGNoYW5nZS4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gTmFtCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1zaWZpdmUtcGxpYy5jCj4gaW5kZXggZjMwYmRiOTRjZWViLi45NTNmMzc1ODM1YjAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTMxMiw3ICszMTIsNyBAQCBzdGF0aWMg
aW50IHBsaWNfaXJxZG9tYWluX21hcChzdHJ1Y3QgaXJxX2RvbWFpbiAqZCwgdW5zaWduZWQgaW50
IGlycSwKPiAgICAgICAgIGlycV9kb21haW5fc2V0X2luZm8oZCwgaXJxLCBod2lycSwgJnBsaWNf
Y2hpcCwgZC0+aG9zdF9kYXRhLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYW5kbGVf
ZmFzdGVvaV9pcnEsIE5VTEwsIE5VTEwpOwo+ICAgICAgICAgaXJxX3NldF9ub3Byb2JlKGlycSk7
Cj4gLSAgICAgICBpcnFfc2V0X2FmZmluaXR5KGlycSwgJnByaXYtPmxtYXNrKTsKPiArICAgICAg
IGlycV9zZXRfYWZmaW5pdHkoaXJxLCBjcHVtYXNrX29mKGNwdW1hc2tfYW55X2Rpc3RyaWJ1dGUo
JnByaXYtPmxtYXNrKSkpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgoKUmVnYXJkcywKQW51
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
