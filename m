Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD9CD3424
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xFEml4rwXWzUVOrRu4uUIgRwlTkjBnIdWDBSUOjUs0=; b=rrWGXo7IDXPIqo
	marMl+6L2zVpD3Z6g3KOBPmd+91siIEzphi3OJhqXbGsRX66nZViMJmGXWrRRx6DPwdLx0FyLNbml
	vc3Y9Wfuwk9QSvFV46JSHj5zhFW1NS6jq3Akwj7Ggx8qcoA2f/qaFFpq/3M0rHtwASXPSDDBx/Kol
	BQ2heZTKNwx3+wKnyW4amrcoP2Ya3voakgoGovlNYMyDY6XJdJwYuXvwmPm7y6RCNIjoRrzcZHZAh
	UFERXh8DBCfpR9k3GabhdRvIhh93w0wCcESLSO9lW9meLj7Dlw8XA3Ghgnws2zr126BvmCXAYiR0+
	ydYh1ZjL6g1hFULO4MgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIo6O-00000007BKO-1tGC;
	Fri, 01 May 2026 13:40:20 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIo6K-00000007BJy-2rp2
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 13:40:18 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12c8d0945b3so7089c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 06:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777642815; cv=none;
        d=google.com; s=arc-20240605;
        b=QfnlplHx2t+WX6/DzuFE+eZDzyFvacANYKpf9SZmmWGEUV2m9YG5/V9pLUaqJe6NCV
         NEgZPlFQ/OITgOanTLNyYMeZjOeDJeq6MG1LyjQGRSFUzzyXF/MN13pwPwHHCXyak3ud
         M2DbgeeGl23hmMZUbxjA2G29/uctvngvN/dcW1TyGVqg0HXj0gY2FdCaD4A9hjtA28yp
         W0lhsKVqkre6gpU+gDaOoUcTHyeVn0DqTqvRZDsFTOyEPGqFlPLnyHSZUd8liWZm3M9z
         nEKXJfO4aGEsZrSf9hvsUCv9DFQsdLG2wOpe+LSPdM+J7/RIYvRbUWXKSB58Cg85AsQ8
         Mpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWwF5SlHc78cVQoxvPA+rRHxESIlao2hdxw6t7Rnvow=;
        fh=qCNR+Fr5KzwVxhJKmWzRL6qhMHwsOzn7Bdy2JEl5iSo=;
        b=dPAq/5M5tN0EfWdrXcPb1sU/EP+dXX/33lQHETJWPVuF8Za6dmv9XsIfIPxDHsRU3Y
         6PEu9W0/nKLi4bobgI9vtc21QkUgEzD/pdH9UTE2tKn8ShPGnPNwfWp6jEOhepK7+1KD
         w3suPDLXW1i3374EeJtVsmgnpHAOVRY8m9i9X2YoVZ+mAUIrxA8JKsoeoIDl9kfZTN+N
         zsNy716RYO21PxqeNvmXsTnFhnynATLI2v08XJy+q/CvQpABQvIlyclnZeH04VkMgAhb
         2Bm46zkNZVfxlHclyouiL9ds4BuE1DuMS0GwXg+ajzBwOoO/PsdxAmtqpx4jGANcOYjR
         MZlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777642815; x=1778247615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWwF5SlHc78cVQoxvPA+rRHxESIlao2hdxw6t7Rnvow=;
        b=H7uxKrhLr4xy5l80ct6Hd4k9d4OL7MUk07IswdYnNN3nDAUxSf+/dDHks4tG3FXT8e
         VIEhLCi+wQzutc9W+vaEjxiF3/M7V47Fk6394Rhkgy/ySfergRp7LT1LDuTfe+k+xANR
         Ydr5Sj81d+Nt0AcmnGEUGj7k2DxT4ch7GabtUWQ22njSUVQwB88Y/w44g9lqEPYHHO4i
         yxZ3/jCQfkSB+oYKr+kPijmnchhDOJS09Q2a2GmTuhHEoZll4DhHH2RNVshJvFpIOCcL
         p2iyI0tB4ENCm04SyhbmXa0xN2U0z/aH+7hUHDrHGD/Tcr9TA6acDpnJAaigFdZTSfn+
         2dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777642815; x=1778247615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWwF5SlHc78cVQoxvPA+rRHxESIlao2hdxw6t7Rnvow=;
        b=XrUR4/lEBpKAOCVJPTSMX0Q/StRF7N7W1DbT7U2dux0o6PGM+2MkqxVq9WlqBuDJtY
         toC7hLgT7SafuJMFjOvt7imf0PIYaoMNCqv9i68NqDddFWEkbTq55nnm2wZK7YUYgsPD
         LkjB8UnCk1sIH8tBVtpopyGuU4DNvDMkvO2+cv1NQlz6jFM4FNFnOpcLx3CC8fvLwRJW
         37kLS+/dy5+FJUBHicg1STSSupg7TAtAqsX/3Fanpj6b71Pv4wUwQIT1JLxs3QSU9dkr
         PPToCiXCZp0Z1b35kzS4zM/DE2FzyDLC3M2G1nmtKdMKKEyBtmmY1o9SNCdDgtddzer6
         aSPg==
X-Gm-Message-State: AOJu0YyesYQH3bFBIsbLk2T8dCGYPPlOErWzxkMaY/YgqgXZ4HN7xXUN
	ySL++qv/4fm1DVAjCKskTKs46u79/gE4ODFAb2cl7U5vRayWY+c1mgqhAp1/eZg2BLX1lz7HIz6
	hksYrzLMG1uicqGVNVOblxqVExFcoSVRVB3TgT2GQ
X-Gm-Gg: AeBDieuCMsfFAxyFYA2ZHDsT0lyu1kgGJksdKS5R1lF24i3W9CuKBGe7lBEGGn72pZt
	FVTPxqX2tX7LUwerLaBh9H1aSt7VtsbZYq+whuY9DAxX8qemt9nfTyoz3yNMIm04fCUQLTDyueX
	BaLOqhzngr8WGfFySvhqiWl3r3NrSgi1tbIlgtWgya48Jkh684hucaonrEIoOEMOxjTiz4C0U4D
	SkSkjXSPOQp4ptTnEC/K9PP0ZKQrARuOrkUtqEcQPc52465n5T2yAvxq/TKqH8vbZ0jfVFwl9EE
	36zpKsHIxNP3M5oBjjGf2OqqJLdTcQ==
X-Received: by 2002:a05:7022:6b9d:b0:12d:c9c8:a75a with SMTP id
 a92af1059eb24-12df7b91788mr144088c88.0.1777642814302; Fri, 01 May 2026
 06:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-2-irogers@google.com> <177751952104.2274119.14762312333480941665.git-patchwork-notify@kernel.org>
In-Reply-To: <177751952104.2274119.14762312333480941665.git-patchwork-notify@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 1 May 2026 06:40:01 -0700
X-Gm-Features: AVHnY4KQG76L9-eiDfSTD9th9EISToR4aG1cbsq7cW-9DamRRCiSLZEy-fBzqqY
Message-ID: <CAP-5=fVLcfx6_T-o7mJ650K3SX+N+T3YYOY+ibZKJGT8V56NVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
To: namhyung@kernel.org
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_064016_720113_B599F39E 
X-CRM114-Status: GOOD (  17.43  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgODoyNuKAr1BNIDxwYXRjaHdvcmstYm90K2xpbnV4LXJp
c2N2QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGVsbG86Cj4KPiBUaGlzIHNlcmllcyB3YXMgYXBw
bGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVzKQo+IGJ5IE5hbWh5dW5nIEtpbSA8bmFtaHl1
bmdAa2VybmVsLm9yZz46CgpIaSwKCldpbGwgdGhlc2UgcGF0Y2hlcyBtZXJnZSBpbnRvIHRoZSB2
Ny4xLXJjIHNlcmllcyBhbmQgdGhlbiBiYWNrIGludG8KcGVyZi10b29scy1uZXh0PyBJIGRvbid0
IHNlZSB0aGVtIGluIHBlcmYtdG9vbHMtbmV4dDoKaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rv
b2xzL3BlcmYvdXRpbC9saWJ1bndpbmQ/aD1wZXJmLXRvb2xzLW5leHQKCk5vcm1hbGx5IGNoYW5n
ZXMgbGlrZSB0aGlzIGdvIGZyb20gcGVyZi10b29scy1uZXh0IHRvIHBlcmYtdG9vbHMgYW5kCnRo
ZW4gaW50byBMaW51cycgdHJlZS4KClRoYW5rcywKSWFuCgoKPiBPbiBTdW4sIDEyIEFwciAyMDI2
IDE5OjQ3OjU4IC0wNzAwIHlvdSB3cm90ZToKPiA+IEN1cnJlbnRseSwgYm90aCBsaWJkdyBhbmQg
bGlidW53aW5kIGRlZmluZSAndW53aW5kX19nZXRfZW50cmllcycuIFRoaXMKPiA+IGNhdXNlcyBh
IGR1cGxpY2F0ZSBzeW1ib2wgYnVpbGQgZmFpbHVyZSB3aGVuIGJvdGggYXJlIGNvbXBpbGVkIGlu
dG8KPiA+IHBlcmYuCj4gPgo+ID4gVGhpcyBjb21taXQgcmVmYWN0b3JzIHRoZSBEV0FSRiB1bndp
bmQgcG9zdC1wcm9jZXNzaW5nIHRvIGJlCj4gPiBjb25maWd1cmFibGUgYXQgcnVudGltZSB2aWEg
dGhlIC5wZXJmY29uZmlnIGZpbGUgb3B0aW9uCj4gPiAndW53aW5kLnN0eWxlJywgb3IgdXNpbmcg
dGhlIGFyZ3VtZW50ICctLXVud2luZC1zdHlsZScgaW4gdGhlIGNvbW1hbmRzCj4gPiAncGVyZiBy
ZXBvcnQnLCAncGVyZiBzY3JpcHQnIGFuZCAncGVyZiBpbmplY3QnLCBpbiBhIHNpbWlsYXIgbWFu
bmVyIHRvCj4gPiB0aGUgYWRkcjJsaW5lIG9yIHRoZSBkaXNhc3NlbWJsZXIgc3R5bGUuCj4gPgo+
ID4gWy4uLl0KPgo+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW3Y0LDEv
OF0gcGVyZiB1bndpbmQ6IFJlZmFjdG9yIGdldF9lbnRyaWVzIHRvIGFsbG93IGR5bmFtaWMgbGli
ZHcvbGlidW53aW5kIHNlbGVjdGlvbgo+ICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+ICAgLSBb
djQsMi84XSBwZXJmIGJ1aWxkIGxvb25nYXJjaDogUmVtb3ZlIHJlZmVyZW5jZSB0byBtaXNzaW5n
IGZpbGUKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzg0MWRiZjQ4NzFjNQo+
ICAgLSBbdjQsMy84XSB0b29scyBidWlsZDogRGVkdXBsaWNhdGUgdGVzdC1saWJ1bndpbmQgZm9y
IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzCj4gICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gICAt
IFt2NCw0LzhdIHBlcmYgYnVpbGQ6IEJlIG1vcmUgcHJvZ3JhbW1hdGljIHdoZW4gc2V0dGluZyB1
cCBsaWJ1bndpbmQgdmFyaWFibGVzCj4gICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gICAtIFt2
NCw1LzhdIHBlcmYgdW53aW5kLWxpYnVud2luZDogTWFrZSBsaWJ1bndpbmQgcmVnaXN0ZXIgcmVh
ZGluZyBjcm9zcyBwbGF0Zm9ybQo+ICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+ICAgLSBbdjQs
Ni84XSBwZXJmIHVud2luZC1saWJ1bndpbmQ6IE1vdmUgZmx1c2gvZmluaXNoIGFjY2VzcyBvdXQg
b2YgbG9jYWwKPiAgICAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiAgIC0gW3Y0LDcvOF0gcGVyZiB1
bndpbmQtbGlidW53aW5kOiBSZW1vdmUgbGlidW53aW5kLWxvY2FsCj4gICAgIChubyBtYXRjaGlu
ZyBjb21taXQpCj4gICAtIFt2NCw4LzhdIHBlcmYgdW53aW5kLWxpYnVud2luZDogQWRkIFJJU0Mt
ViBsaWJ1bndpbmQgc3VwcG9ydAo+ICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+Cj4gWW91IGFy
ZSBhd2Vzb21lLCB0aGFuayB5b3UhCj4gLS0KPiBEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgo+
IGh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
