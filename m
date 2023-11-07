Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2069C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjGCPEqMI3xbTvpSxPHfMy3ItZhunnRafrypaCBju3E=; b=3K6/4gx2fDb8Vt
	w3vqnHaucRLNn4KQ/CaiPhuvOJeQ1ntNkFXekt7XjIkQFzWxF+lFnmysjqhG1RAD18qChPA9II8qm
	bE0Br/2sfyURBraGoGVkmG3IO8LrJi8Fo1LSE93HmbhLAy1dyqek8r6/hGQTf4ciA9lqhOzbU6BWm
	aSrNaFFEYTh09mnJK5hpXK5NKMfzUkpJJ8E/zp7Jl1HS5gkP3nFdO7L7AajEQ7hQNnq4tKeip/7Al
	vH/X/hnAdnsblY11CRy7zPBEe+gKEiWAzrPcDs7n7cQoMd/ZJDtEG+icLnW5m4cW241ZJ7Cw3yMeM
	f/6Q33EQmn4E4r0oIauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0K6O-001CgJ-0u;
	Tue, 07 Nov 2023 11:18:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0K6L-001Cf9-1k
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 11:18:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6c398717726so2625383b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 03:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699355911; x=1699960711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7i6s0OZZc7pGu3HMoCBp0zLvXEyl8tx7Cy8jxttMkE=;
        b=Lui42z53OQGGd/VUTgdOsvcKtSTF2UKzFSVeiicbOKxXMv/0/lIARc0/3GUU0s0kwT
         4fnXtPz9yAWpUpw25eb+iFWNSvu/5BBMfsHUqu89+InqJ47OgTwf+eioX4cU/5YqqM5W
         39ZfkKdZUVqv3GLo/q//bhDtiggZt82FQhIbKh8Bbrxa9UpQVguSCj8397BO9E+PPXhn
         /4cNPRqBZJWFM2efcwHFMQ3zQIrAUnYCYrZAMPLR70XsHch4pUmW+q4P96anzjlgSWEG
         JKH5tY2SqGhjWpEjOumyFHqW7HIAp0vW56S5B+RMnYQh/0Ic8n9V7nj3Z2ds+gTKC5aT
         BLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355911; x=1699960711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7i6s0OZZc7pGu3HMoCBp0zLvXEyl8tx7Cy8jxttMkE=;
        b=vonFBL7gXeDlPnMUW5p2YUp03c/ATllPbBxB5P8C+v/sDvlQld5WndI8wtjKZYxpkN
         L2LEE7wxk67s+Qy/V+MZk691uZKOXGZhzgiKE+OqmkR8T/OXhnhgkYQy/cw6uk3azDkQ
         vZiLeg4cbHTVcZh+DR66WVc0qqKx2hMyRMn402LaYjq6v7tDcbhTJifhCDRL96R8F5aG
         lGXIKp1+lc4mar0hqeJmwdUghEWXLw7IIxlSi2S/kgtFrpVxYmEQTG7B7bbJFX7cLeE8
         ZdimB93i1lFSugxJ3xZf29DhYmuCY55ncb9WSd7DAhu1l3Vm8UGond7QrcZeN5ue2Zgz
         WtsQ==
X-Gm-Message-State: AOJu0YyUNam2EAh14+PXgrsx0vbExgdT9Gl5VfdkH61mZ0bqOw7D61q2
	NbwD2tMYYIpk2JEwyWoUPB70bGZPLLyHrOoKcBejfg==
X-Google-Smtp-Source: AGHT+IGJj6RQ2bUmWbYz8C93NA6gwg7kx/UtAq/bIX3BLPtMUeDBrcW8Nh1OuYUSHQFDcz9fDgHm15AgzSezenWlJi0=
X-Received: by 2002:a05:6a21:3393:b0:137:23f1:4281 with SMTP id
 yy19-20020a056a21339300b0013723f14281mr31891943pzb.12.1699355911510; Tue, 07
 Nov 2023 03:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
 <20231104105907.1365392-8-vincent.guittot@linaro.org> <20231107103808.GF18944@willie-the-truck>
In-Reply-To: <20231107103808.GF18944@willie-the-truck>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 7 Nov 2023 12:18:20 +0100
Message-ID: <CAKfTPtBb+qea61OH-B0L=MHJWnQMLL80EBR-nSHZtoWTbYeHhw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64/amu: Use capacity_ref_freq to set AMU ratio
To: Will Deacon <will@kernel.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, beata.michalska@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_031833_577341_A7282D9E 
X-CRM114-Status: GOOD (  27.33  )
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

T24gVHVlLCA3IE5vdiAyMDIzIGF0IDExOjM4LCBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIFNhdCwgTm92IDA0LCAyMDIzIGF0IDExOjU5OjA3QU0gKzAxMDAsIFZp
bmNlbnQgR3VpdHRvdCB3cm90ZToKPiA+IFVzZSB0aGUgbmV3IGNhcGFjaXR5X3JlZl9mcmVxIHRv
IHNldCB0aGUgcmF0aW8gdGhhdCBpcyB1c2VkIGJ5IEFNVSBmb3IKPiA+IGNvbXB1dGluZyB0aGUg
YXJjaF9zY2FsZV9mcmVxX2NhcGFjaXR5KCkuCj4gPiBUaGlzIGhlbHBzIHRvIGtlZXAgZXZlcnl0
aGluZyBhbGlnbmVkIHVzaW5nIHRoZSBzYW1lIHJlZmVyZW5jZSBmb3IKPiA+IGNvbXB1dGluZyBD
UFVzIGNhcGFjaXR5Lgo+ID4KPiA+IFRoZSBkZWZhdWx0IHZhbHVlIG9mIHRoZSByYXRpbyAoc3Rv
cmVkIGluIHBlcl9jcHUoYXJjaF9tYXhfZnJlcV9zY2FsZSkpCj4gPiBlbnN1cmVzIHRoYXQgYXJj
aF9zY2FsZV9mcmVxX2NhcGFjaXR5KCkgcmV0dXJucyBtYXggY2FwYWNpdHkgdW50aWwgaXQgaXMK
PiA+IHNldCB0byBpdHMgY29ycmVjdCB2YWx1ZSB3aXRoIHRoZSBjcHUgY2FwYWNpdHkgYW5kIGNh
cGFjaXR5X3JlZl9mcmVxLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgR3VpdHRvdCA8
dmluY2VudC5ndWl0dG90QGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2tlcm5l
bC90b3BvbG9neS5jICB8IDI2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVy
cy9iYXNlL2FyY2hfdG9wb2xvZ3kuYyAgfCAxMiArKysrKysrKysrKy0KPiA+ICBpbmNsdWRlL2xp
bnV4L2FyY2hfdG9wb2xvZ3kuaCB8ICAxICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2tlcm5lbC90b3BvbG9neS5jIGIvYXJjaC9hcm02NC9rZXJuZWwvdG9wb2xvZ3kuYwo+ID4gaW5k
ZXggODE3ZDc4OGNkODY2Li42MTVjMWEyMDEyOWYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0
L2tlcm5lbC90b3BvbG9neS5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC90b3BvbG9neS5j
Cj4gPiBAQCAtODIsNyArODIsMTIgQEAgaW50IF9faW5pdCBwYXJzZV9hY3BpX3RvcG9sb2d5KHZv
aWQpCj4gPiAgI3VuZGVmIHByX2ZtdAo+ID4gICNkZWZpbmUgcHJfZm10KGZtdCkgIkFNVTogIiBm
bXQKPiA+Cj4gPiAtc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGxv
bmcsIGFyY2hfbWF4X2ZyZXFfc2NhbGUpOwo+ID4gKy8qCj4gPiArICogRW5zdXJlIHRoYXQgYW11
X3NjYWxlX2ZyZXFfdGljaygpIHdpbGwgcmV0dXJuIFNDSEVEX0NBUEFDSVRZX1NDQUxFIHVudGls
Cj4gPiArICogdGhlIENQVSBjYXBhY2l0eSBhbmQgaXRzIGFzc29jaWF0ZWQgZnJlcXVlbmN5IGhh
dmUgYmVlbiBjb3JyZWN0bHkKPiA+ICsgKiBpbml0aWFsaXplZC4KPiA+ICsgKi8KPiA+ICtzdGF0
aWMgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgbG9uZywgYXJjaF9tYXhfZnJl
cV9zY2FsZSkgPSAgMVVMIDw8ICgyICogU0NIRURfQ0FQQUNJVFlfU0hJRlQpOwo+Cj4gVGhpcyBk
b2Vzbid0IHNlZW0gdG8gbWF0Y2ggdGhlIGNvbW1lbnQ/IFNDSEVEX0NBUEFDSVRZX1NDQUxFIGRv
ZXNuJ3QgaGF2ZQo+IHRoZSAnMiAqJyBtdWx0aXBsaWVyLgoKVGhlIGNvbW1lbnQgaW4gZnJlcV9p
bnZfc2V0X21heF9yYXRpbygpIHNheXM6CgoqIFdlIHVzZSBhIGZhY3RvciBvZiAyICogU0NIRURf
Q0FQQUNJVFlfU0hJRlQgLT4gU0NIRURfQ0FQQUNJVFlfU0NBTEXCsgoqIGluIG9yZGVyIHRvIGVu
c3VyZSBhIGdvb2QgcmVzb2x1dGlvbiBmb3IgYXJjaF9tYXhfZnJlcV9zY2FsZSBmb3IKKiB2ZXJ5
IGxvdyByZWZlcmVuY2UgZnJlcXVlbmNpZXMgKGRvd24gdG8gdGhlIEtIeiByYW5nZSB3aGljaCBz
aG91bGQKKiBiZSB1bmxpa2VseSkuCgpUaGVuIHRoZXJlIGlzIGEgICIgICogYXJjaF9tYXhfZnJl
cV9zY2FsZSkgPj4gU0NIRURfQ0FQQUNJVFlfU0hJRlQiCndoZW4gY29tcHV0aW5nIHRoZSBzY2Fs
ZSB3aGljaCBicmluZ3MgdGhlIHJlc3VsdCBiYWNrIHRvClNDSEVEX0NBUEFDSVRZX1NISUZUCgo+
Cj4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHU2NCwgYXJjaF9jb25zdF9jeWNsZXNfcHJldik7
Cj4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHU2NCwgYXJjaF9jb3JlX2N5Y2xlc19wcmV2KTsK
PiA+ICBzdGF0aWMgY3B1bWFza192YXJfdCBhbXVfZmllX2NwdXM7Cj4gPiBAQCAtMTEyLDE0ICsx
MTcsMTQgQEAgc3RhdGljIGlubGluZSBib29sIGZyZXFfY291bnRlcnNfdmFsaWQoaW50IGNwdSkK
PiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIGludCBmcmVxX2lu
dl9zZXRfbWF4X3JhdGlvKGludCBjcHUsIHU2NCBtYXhfcmF0ZSwgdTY0IHJlZl9yYXRlKQo+ID4g
K3ZvaWQgZnJlcV9pbnZfc2V0X21heF9yYXRpbyhpbnQgY3B1LCB1NjQgbWF4X3JhdGUpCj4gPiAg
ewo+ID4gLSAgICAgdTY0IHJhdGlvOwo+ID4gKyAgICAgdTY0IHJhdGlvLCByZWZfcmF0ZSA9IGFy
Y2hfdGltZXJfZ2V0X3JhdGUoKTsKPiA+Cj4gPiAgICAgICBpZiAodW5saWtlbHkoIW1heF9yYXRl
IHx8ICFyZWZfcmF0ZSkpIHsKPiA+IC0gICAgICAgICAgICAgcHJfZGVidWcoIkNQVSVkOiBpbnZh
bGlkIG1heGltdW0gb3IgcmVmZXJlbmNlIGZyZXF1ZW5jeS5cbiIsCj4gPiArICAgICAgICAgICAg
IFdBUk5fT05DRSgxLCAiQ1BVJWQ6IGludmFsaWQgbWF4aW11bSBvciByZWZlcmVuY2UgZnJlcXVl
bmN5LlxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgY3B1KTsKPiA+IC0gICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICAgICAgIH0K
PiA+Cj4gPiAgICAgICAvKgo+ID4gQEAgLTEzOSwxMiArMTQ0LDEyIEBAIHN0YXRpYyBpbnQgZnJl
cV9pbnZfc2V0X21heF9yYXRpbyhpbnQgY3B1LCB1NjQgbWF4X3JhdGUsIHU2NCByZWZfcmF0ZSkK
PiA+ICAgICAgIHJhdGlvID0gZGl2NjRfdTY0KHJhdGlvLCBtYXhfcmF0ZSk7Cj4gPiAgICAgICBp
ZiAoIXJhdGlvKSB7Cj4gPiAgICAgICAgICAgICAgIFdBUk5fT05DRSgxLCAiUmVmZXJlbmNlIGZy
ZXF1ZW5jeSB0b28gbG93LlxuIik7Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgcGVyX2Nw
dShhcmNoX21heF9mcmVxX3NjYWxlLCBjcHUpID0gKHVuc2lnbmVkIGxvbmcpcmF0aW87Cj4gPiAr
ICAgICBXUklURV9PTkNFKHBlcl9jcHUoYXJjaF9tYXhfZnJlcV9zY2FsZSwgY3B1KSwgKHVuc2ln
bmVkIGxvbmcpcmF0aW8pOwo+Cj4gV2h5IGlzIFdSSVRFX09OQ0UoKSBub3cgbmVlZGVkPwoKdGhl
IHRpY2sgY2FuIGFscmVhZHkgdXNlIGl0LiBXZSB3YW50IHRvIG1ha2Ugc3VyZSB0byB1c2UgZWl0
aGVyIHRoZQpvbGQgb3IgdGhlIG5ldyBvbmUgYnV0IG5vdCBhbiBpbnRlcm1lZGlhdGUgdmFsdWUK
Cj4KPiA+IC0gICAgIHJldHVybiAwOwo+ID4gKyAgICAgcmV0dXJuOwo+Cj4gUG9pbnRsZXNzICdy
ZXR1cm47JyBzdGF0ZW1lbnQuCgpmYWlyIGVub3VnaAoKPgo+IFdpbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
