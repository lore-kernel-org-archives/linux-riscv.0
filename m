Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9C2E8537A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMKbeAlldUKZwTBTgCu1Xe+6qQ/Szi+IVXCWp8V1+tM=; b=daX81l9R9tn9wn
	3adVAupn09AT08JPXu0xs75wWn5i6WtPeG/nPkeaa6+HEo79YXnZVdp98GRZjcvp3I8EeNsJKzXp2
	DMtIqHbvvFbGaqontN/EFDZ0mypSEgEUCqaIp0kb0IQoLMnERaHIHk2Msjo8ujT6ZLtfmA7PoILNt
	cYdiVTWb2uIuGQp5i2DOHGeJAmK0Vsvos682JLsCR+k8jUQ316L3jOpz3hx2TfyI/6l3k2gGHPg1N
	eXtczvos6lHQLESs/Yi5Y33gv5LNKIKRGqqrkKcHGjOMtOBR846hfdvDJe1VwJSF+dj8fnGTj1DPl
	MK6TfQjS+rdSluYiROCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hgL-00000002Lmo-3pGY;
	Fri, 03 Apr 2026 16:47:41 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hgJ-00000002LmQ-3dbK
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 16:47:40 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-682d981b025so289281eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 09:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234859; cv=none;
        d=google.com; s=arc-20240605;
        b=E7URkRjDl3EL5dN3HDiwCp1f5AtVD7lB3VwCAg8ACuc7X4XS6faqNeKAAfhZ07ChYt
         NBblH2T3kViE6NAViuZo8mNliB2XbDIWCaGmxw9+NHmhMiyxreFeFEPmV+M+z3f1avTG
         lHzprtc+YMM2ATjFLMbIM1Ehv0dB645EPZvtF+XvDI4xC8ecxxLXhjyyBce2VIEQfi9B
         mVyGaSVpe1x/YdougJQ/PYwGoDGYtLOdSXG7CyAHTbIRjuA/STtfFY9Kp9t0NV4mNkUO
         O3rVclyIccB8o3TBPMB35htBUy/xzr1s624V0me4Lk7qmMe4AbTwcTkam4stQaFELN+V
         1Asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yd/fcGpgiRLI6biLglbkJN32L6g92D+Cp9fisarR7TE=;
        fh=NwR5oj7n7CF0B7ftj3grNaf7mw/WfwZxd/WjYJ0rJHM=;
        b=jb4ZaayitD9nO0Jml33pYiqwihTNMIJQMPvaemNR6pMjCV3tz2/O+1csvFTO5kDmpn
         0UMxnCBVmttmMrZvRTwOiAj7Kwc785lw9diMUr/Pd32JQ3Tnrwb7x53d6iaVxxu3hDK8
         LX3zIjlNsmQDryRQTii3aKgR/uafm1kSdf5wrrt+xUWX2P22idkaqCPWnjG6+s4rtVu3
         13oXomz15oDMA6kn2GXnyF4fulkUTps5Rhp8jaH58A6qrr2ZH6PSSGuhfvnD8YlQZuzn
         b8xoJEGGMAWO47nlOZtTsB3KITgvcxm5u1IMkcFCrxQGsE65F1MPx26yTUpl2Sh1yolK
         dDIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775234859; x=1775839659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yd/fcGpgiRLI6biLglbkJN32L6g92D+Cp9fisarR7TE=;
        b=V84K6azEqBncecBC2c2ozOtEl2cCnFFDZIgmUhqMS+E8npxXmxVpFeeQ9qDGiyNF73
         2kSH01YyF/p+sHDG8l67EIRVjjWnJmf3a/8GRu6RbCADlzqkvO+BSI+iXMMwZlZNN74M
         ABVVPmaEuklQ/1ApcqV1uM3f3NWzaaWhe+2XElm34H4ISgXQgR3IYYXnHlR+5DzQJElY
         pK1ZiJtW5ZUOBUow0zJPFv+HdMyURR/xjhAJ/xp1IV/S97ucbSrJJCApzkY010rMw46Z
         B/cbKeQvQ9zTNeShwFRy6x0MAfy7f6HJk4ky5zUNj7rAbD2YcZVpI6MnwU6Yc/0f5m6n
         3OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234859; x=1775839659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yd/fcGpgiRLI6biLglbkJN32L6g92D+Cp9fisarR7TE=;
        b=PPfletx6HYQbF+LFftdHOr1JvbTjMY5JmuWEBUTaPXGVM5Un91IcWDTUjaavdsvIL5
         EkjRJwkVGF4AWHpRZRbcVf2OX6rES7p6lbhhJfsDkUdM4DSM/4vrl0Dx1go7CcWQbX2s
         3cuNrKiZT6mTMzLd7EQvk0jM2JSmPDPlH/wLw2iB2I87guYhH1EitnHaDfqTqpEAtwHX
         oMp/FWTsH3GfDERewm7RDNajSGa8sRifd0PB2/It0HH4y/Qf8galbpjZf5/cPA4MRRy4
         ev2+tiOx8dAodgqin+FbXf4DytQNxA1NM0oemd8Va5MEtl6cyFRLhlauREsmD4/LKq73
         m3mw==
X-Forwarded-Encrypted: i=1; AJvYcCWgdrxzkUQBfAfxtkqueOMf9hHbmgh0F7fwm2rgVNmyu8pkeHdWpyRz1Tfxva+3dl8qPO7pyLiPptEhlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxFStepFXES9AK1WlTrFXp5g7lcz42lCZHd4TB0EVwOMRBKHDh
	W08OERZ1h3XGzRAEplgCbhV7Q0BNBGSLVlQnPl/c6hJbFNdhULYLncTD7lCf1Ek6UezYAhOT91X
	I46aYYCwl2mJ/NKAYeLNXe3wRRZ6XRLrqHAcs8g10hQ==
X-Gm-Gg: ATEYQzwGMe5HyOTSxeftNbKw4P7sbya+JVJIDWfepFUxODf3u4O4siqQer0TZopId2K
	Q6vshxnSCMr7S0Ks1TELukqF23w4hsPWcgNpLwRrI5BU8Shr1WY18yNLI3VSGYXrAsn4777YJ3s
	DT+ah6zDAJoByji7rhBH1NWTTPF/4EyJA5J7R3SHsh4gk2uT62Txz+zsCoCnmMOB8xvMMl1D70f
	X/91MYG6eiSaVPExvUkCr+36kiNcoN9GFRXEpZ9JTqh/kdhnHP8smxQKCo4upTjhDs6FLZTC7/C
	nl0xy9Xrj8YCHGPQlhZUIT45sYuDjWoYJD1/vm14K+2cJy8LtWF31SYBRmPBbp9+7JjnNxX3erL
	LhBgJ+Q5DtwtJwrasSfGw7kx0nw==
X-Received: by 2002:a05:6820:1799:b0:67e:1dd2:4102 with SMTP id
 006d021491bc7-6821f67891fmr1943718eaf.32.1775234858557; Fri, 03 Apr 2026
 09:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260204155309.763597-1-anup.patel@oss.qualcomm.com>
 <20260204155309.763597-2-anup.patel@oss.qualcomm.com> <603b0a16-4965-2689-d3ea-3f9db0cc49aa@kernel.org>
 <CAAhSdy28oPgzaaZj94F-MToTYT6WTWsiSVpuy0VzLkM_maSP0g@mail.gmail.com> <e8a5e3b7-b68a-8b92-192f-985a0559eb95@kernel.org>
In-Reply-To: <e8a5e3b7-b68a-8b92-192f-985a0559eb95@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 22:17:27 +0530
X-Gm-Features: AQROBzCgxdkNDQ3suqhKRRV9KCytYtmrrnUx1qrolNT_DoeDZPgRKtPsxGB4U-k
Message-ID: <CAAhSdy3DOsJrwgoBii5Un8iWU9SUS0k6xVw=FQVavhjHKMJDJg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Paul Walmsley <pjw@kernel.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, 
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_094739_922356_E0E5FA9A 
X-CRM114-Status: GOOD (  30.36  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA5OjI24oCvUE0gUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAzIEFwciAyMDI2LCBBbnVwIFBhdGVsIHdyb3RlOgo+
Cj4gPiBPbiBGcmksIEFwciAzLCAyMDI2IGF0IDE6NTXigK9QTSBQYXVsIFdhbG1zbGV5IDxwandA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgNCBGZWIgMjAyNiwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+ID4KPiA+ID4gPiBGcm9tOiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEluIFJJU0MtViwgdGhlcmUgaXMgbm8gQ1NSIHJl
YWQvd3JpdGUgaW5zdHJ1Y3Rpb24gd2hpY2ggdGFrZXMgQ1NSCj4gPiA+ID4gbnVtYmVyIHZpYSBy
ZWdpc3RlciBzbyBhZGQgY29tbW9uIGNzcl9yZWFkX251bSgpIGFuZCBjc3Jfd3JpdGVfbnVtKCkK
PiA+ID4gPiBmdW5jdGlvbnMgd2hpY2ggYWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBw
YXNzaW5nIENTUiBudW1iZXIKPiA+ID4gPiBhcyBwYXJhbWV0ZXIuIFRoZXNlIGNvbW1vbiBmdW5j
dGlvbnMgd2lsbCBiZSBmaXJzdCB1c2VkIGJ5IHRoZQo+ID4gPiA+IEFDUEkgQ1BQQyBkcml2ZXIg
YW5kIFJJU0MtViBQTVUgZHJpdmVyLgo+ID4gPiA+Cj4gPiA+ID4gQWxzbywgdGhlIFJJU0MtViBB
Q1BJIEZGSCBzcGVjaWZpY2F0aW9uIGFsbG93cyBhcmJpdHJhcnkgQ1NSIG51bWJlcgo+ID4gPiA+
IGFzIENQUEMgcmVnaXN0ZXIgYW5kIHRoZSBSSVNDLVYgU0JJIHNwZWNpZmljYXRpb24gYWxsb3dz
IGFyYml0cmFyeQo+ID4gPiA+IENTUiBudW1iZXIgYXMgUE1VIGhhcmR3YXJlIGNvdW50ZXIuIFRo
aXMgbWVhbnMgQUNQSSBDUFBDIGRyaXZlciBhbmQKPiA+ID4gPiBSSVNDLVYgUE1VIGRyaXZlciBu
byBsb25nZXIgbmVlZCB0byBkbyBzYW5pdHkgY2hlY2tzIG9uIENTUiBudW1iZXIKPiA+ID4gPiB3
aGljaCBhcmUgbm93IGRvbmUgYnkgdGhlIGNvbW1vbiBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dy
aXRlX251bSgpCj4gPiA+ID4gZnVuY3Rpb25zLgo+ID4gPgo+ID4gPiBJIHJlY2FsbCB0aGF0IHdo
ZW4gd2UgZGlzY3Vzc2VkIHRoaXMgcGF0Y2ggb24gYSBjYWxsIGEgZmV3IG1vbnRocyBhZ28sIGl0
Cj4gPiA+IHdhcyBicm91Z2h0IHVwIHRoYXQgaXQgc2VlbWVkIHVzZWZ1bCB0byByZXN0cmljdCB3
aGljaCBDU1JzIGNvdWxkIGJlIHJlYWQKPiA+ID4gb3Igd3JpdHRlbiBhdCBydW50aW1lLCBvbiBh
IHBlci12ZW5kb3IgYmFzaXMuICBUaGF0IHdheSwgdGhlIEZGSCBpbnRlcmZhY2UKPiA+ID4gY291
bGRuJ3QgYmUgdXNlZCB0byByZWFkIG9yIHdyaXRlIGN1c3RvbSBDU1JzIHRoYXQgaGFkIG5vdGhp
bmcgdG8gZG8gd2l0aAo+ID4gPiBDUFBDIG9yIFBNVSBmdW5jdGlvbnMuCj4gPiA+Cj4gPiA+IEFy
ZSB5b3Ugc3RpbGwgcGxhbm5pbmcgdG8gaW1wbGVtZW50IHRoYXQgY2hhbmdlPwo+ID4KPiA+IFRo
ZSBjdXJyZW50IGNzcl9yZWFkX251bSgpIGFuZCBjc3Jfd3JpdGVfbnVtKCkgb25seSBhbGxvd3MK
PiA+IEhQTSBjb3VudGVycyBhbmQgY3VzdG9tIENTUiBzcGFjZSAoYXMgZGVmaW5lZCBieSB0aGUg
UHJpdgo+ID4gc3BlYykgdG8gYmUgYWNjZXNzaWJsZSB2aWEgQUNQSSBGRkguIFRoZSBBQ1BJIEZG
SCBpbnRlcmZhY2UKPiA+IGlzIHZlcnkgZmxleGlibGUgYW5kIGFsbG93cyB2ZW5kb3JzIHRvIHNw
ZWNpZnkgdGhlIENTUiBudW1iZXIKPiA+IGluIHRoZSBBQ1BJIHRhYmxlIGl0c2VsZiBzbyB3ZSBk
b24ndCBuZWVkIHRvIGNvbXBpbGUga2VybmVsIG9uCj4gPiBwZXItdmVuZG9yIGJhc2lzLgo+ID4K
PiA+IEluIG90aGVyIHdvcmRzLCB0aGUgY3VycmVudCBhcHByb2FjaCBhbGxvd3Mgc2FtZSBMaW51
eCBrZXJuZWwKPiA+IGltYWdlIGZvciBtdWx0aXBsZSB2ZW5kb3IgZXZlbiBpZiB0aGV5IHVzZSBj
dXN0b20gQ1NScyBpbiB0aGVpcgo+ID4gQUNQSSBGRkggaW50ZXJmYWNlLgo+Cj4gSSB1bmRlcnN0
YW5kIHRoYXQgcGFydC4gIFRoZSBwYXJ0IHRoYXQgSSBkb24ndCBsaWtlIGlzIHRoYXQgd2l0aCB0
aGlzCj4gcGF0Y2gsIHRoZSBGRkggaW50ZXJmYWNlIGNvdWxkIGFsc28gYmUgdXNlZCB0byByZWFk
IGFuZCB3cml0ZSBjdXN0b20gQ1NScwo+IHRoYXQgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggQ1BQ
QyBvciBQTVUgZnVuY3Rpb25zLiAgVGhhdCBkb2Vzbid0IHNlZW0KPiBsaWtlIGEgZ29vZCBpZGVh
LiAgV2hhdCBJIGhhZCBpbiBtaW5kIHdhcyB0byBhZGQgYSB3YXkgdG8gcmVzdHJpY3QgdGhlCj4g
Y3VzdG9tIENTUnMgdGhhdCB0aGUga2VybmVsIHdvdWxkIGFsbG93IEZGSCB0byB1c2UsIHZpYSBh
IG1lY2hhbmlzbSBvdGhlcgo+IHRoYW4gdGhlIEFDUEkgdGFibGUgLSBlLmcuLCBzeXNmcywgb3Ig
dGhlIGtlcm5lbCBjb21tYW5kIGxpbmUsIGV0Yy4KPgoKV2UgY2FuJ3QgdXNlIEZGSCBpbnRlcmZh
Y2UgdG8gcmVhZCBhbmQgd3JpdGUgY3VzdG9tIENTUnMKZnJvbSBhbnkgcGFydCBvZiB0aGUga2Vy
bmVsLiBUaGlzIGlzIGJlY2F1c2UgQUNQSSBGRkggZW5jb2RpbmcKaXMgc3BlY2lmaWMgdG8gYSBz
dWJzeXN0ZW0uIEN1cnJlbnRseSwgUklTQy1WIEFDUEkgRkZIIGVuY29kaW5nCmlzIG9ubHkgZGVm
aW5lZCBmb3IgTFBJIHN0YXRlcyBhbmQgQ1BQQyByZWdpc3RlcnMuIE91dCBvZiB0aGVzZSwKb25s
eSBDUFBDIEZGSCBlbmNvZGluZyBhbGxvd3Mgc3BlY2lmeWluZyBjdXN0b20gQ1NScy4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
