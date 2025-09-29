Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D3CAC5B5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghqcOM7oeF4PylQ0agNVBPB/sp0av8UalLVcrfC5/xk=; b=Uaq0AA+qzqNQM2
	b/MAkxyeL/wxni/x3U+rE2Qcb8cKB13bem9dZm/6jvDSEPJCaC/WDK23FUAyF14KX1+f0zygtIoLW
	JSEKow+xILVszsRkmhzgStf0r8NCXg4/jd6gq232//u4bVzKCMyQe5UnRVzd8CqSHEMjDAY6m4Scg
	/GG1nW5yy9XU1qhTynwkF9Fl+wfvNrGJCqZ6phZcan//NT9nSPJc2hSe/+BMBV6Yad+sIkxD52yPG
	YcCtKiRpju8T3tjzOTlluGTVlfZ2O5cRagdq9vcpnCtJDO5kLPaRCWLrpTftryDgWOQ5fqcforkhl
	zFQZY9RSOWnwnHuVB37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EUD-00000002cAe-0eHg;
	Mon, 29 Sep 2025 14:04:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EUA-00000002c9z-13d8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 14:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C22224081F
	for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 14:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CB2C19422
	for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759154653;
	bh=0dqbplPk5+xdd940bMeF8GS6INexn40MMj7UgHcMuYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hh/wv5U+UHu8TgmC1Q86biB9ot8OrMNGUaMyP5tNt6djxPAn4XS1kcjxeiVbTjUmQ
	 1g9jt2ImDMdx94g5kp+17ng6oSJwOYqHM8K2+4TAEoU+Z3YWZdtO/xr/D+cG3+hHWD
	 bjf4Ul7YKJp+fogwLPsjIaYXgOevsljQ3dIMEWWLPRIVHdzp4dZJODu8ibOkVnCsE+
	 GMduY+QXyrzo54WqO3lzlj4ZIN+CVABNmBQpSR45+LZ09rjqIycHauLosyogKbpyJq
	 byIRgewu64kGjsw0h0q9P7gzafjaEwL/eZrrrmT38Pc/WJqoFzTwTMrXXa+UJHuwp2
	 3fIwIGz8XPfvw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-636255b92c9so3656351a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 07:04:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf86XtoCTCdYe3lx7G8Ha/OKPZpK+OowFZiHkom00UQQtD1pcm6jCAJkTIzE/hwQRBkIht3N2In+LncQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWeEwPxnADwZ6N7KF0wGDOB8zQzteN0rWcto7bOznVFejtOXsD
	I1SDvrE0mLtjSdyCaAJUDevL1I+lh75b279KYvkril+m3j7w8LZKc0QhRXc/x+el6ZTF2LP4fRK
	BmgCucDGPZ9sxUJIkgg2rouSZjZ7MmQ==
X-Google-Smtp-Source: AGHT+IGQUkv8sSQJZtMXHXl3vj5TRLZ6dy5UjadMrQjUPv9UeUy0QibDfpGKzf8eHPJCT+VBs3ytFI88Kxw5hSp2UIU=
X-Received: by 2002:a17:907:2d0e:b0:afd:d9e4:51e9 with SMTP id
 a640c23a62f3a-b34bf6638a0mr1764243366b.65.1759154651818; Mon, 29 Sep 2025
 07:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <aNPq42O1Ml3ppF2M@swlinux02> <20250926211023.GA2128495@bhelgaas>
In-Reply-To: <20250926211023.GA2128495@bhelgaas>
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Sep 2025 09:03:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+HDgghAQps5M0jV7ELxR=M7pRCuEKwgSMcJQfS3Ecsrg@mail.gmail.com>
X-Gm-Features: AS18NWAmQA2tJ--eCc8Z2eodRbVjVdQj6lT7kiA7TgSr-wS6_p_6i5Ndf_AUHzk
Message-ID: <CAL_Jsq+HDgghAQps5M0jV7ELxR=M7pRCuEKwgSMcJQfS3Ecsrg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] PCI: dwc: Skip failed outbound iATU and continue
To: Bjorn Helgaas <helgaas@kernel.org>, Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, ben717@andestech.com, inochiama@gmail.com, 
	thippeswamy.havalige@amd.com, namcao@linutronix.de, shradha.t@samsung.com, 
	randolph.sklin@gmail.com, tim609@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_070414_331185_74583247 
X-CRM114-Status: GOOD (  38.26  )
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

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgNDoxMOKAr1BNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAyNCwgMjAyNSBhdCAwODo1ODoxMVBN
ICswODAwLCBSYW5kb2xwaCBMaW4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAw
OTo0MjoyM0FNIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCAy
MywgMjAyNSBhdCAwNzozNjo0M1BNICswODAwLCBSYW5kb2xwaCBMaW4gd3JvdGU6Cj4gPiA+ID4g
UHJldmlvdXNseSwgb3V0Ym91bmQgaUFUVSBwcm9ncmFtbWluZyBpbmNsdWRlZCByYW5nZSBjaGVj
a3MKPiA+ID4gPiBiYXNlZCBvbiBoYXJkd2FyZSBsaW1pdGF0aW9ucy4gSWYgYSBjb25maWd1cmF0
aW9uIGRpZCBub3QgbWVldAo+ID4gPiA+IHRoZXNlIGNvbnN0cmFpbnRzLCB0aGUgbG9vcCB3b3Vs
ZCBzdG9wIGltbWVkaWF0ZWx5Lgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaCB1cGRhdGVzIHRo
ZSBiZWhhdmlvciB0byBlbmhhbmNlIGZsZXhpYmlsaXR5LiBJbnN0ZWFkCj4gPiA+ID4gb2Ygc3Rv
cHBpbmcgYXQgdGhlIGZpcnN0IGlzc3VlLCBpdCBub3cgbG9ncyBhIHdhcm5pbmcgd2l0aAo+ID4g
PiA+IGRldGFpbHMgb2YgdGhlIGFmZmVjdGVkIHdpbmRvdyBhbmQgcHJvY2VlZHMgdG8gcHJvZ3Jh
bSB0aGUKPiA+ID4gPiByZW1haW5pbmcgaUFUVSBlbnRyaWVzLgo+ID4gPiA+Cj4gPiA+ID4gVGhp
cyBlbmFibGVzIHBhcnRpYWwgY29uZmlndXJhdGlvbiB0byBjb21wbGV0ZSBpbiBjYXNlcyB3aGVy
ZQo+ID4gPiA+IHNvbWUgaUFUVSB3aW5kb3dzIG1heSBub3QgbWVldCByZXF1aXJlbWVudHMsIGlt
cHJvdmluZyBvdmVyYWxsCj4gPiA+ID4gY29tcGF0aWJpbGl0eS4KPiA+ID4KPiA+ID4gSXQncyBu
b3QgcmVhbGx5IGNsZWFyIHdoeSB0aGlzIGlzIG5lZWRlZC4gIEkgYXNzdW1lIGl0J3MgcmVsYXRl
ZAo+ID4gPiB0byBkcm9wcGluZyBxaWxhaV9wY2llX291dGJvdW5kX2F0dV9hZGRyX3ZhbGlkKCku
Cj4gPgo+ID4gWWVzLCBJIHdhbnQgdG8gZHJvcCB0aGUgcHJldmlvdXMgYXR1X2FkZHJfdmFsaWQg
ZnVuY3Rpb24uCj4gPgo+ID4gPiBJIGd1ZXNzIGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoKSBt
dXN0IHJldHVybiBhbiBlcnJvciBmb3Igb25lCj4gPiA+IG9mIHRoZSBRaUxhaSByYW5nZXM/ICBX
aGljaCBvbmUsIGFuZCB3aGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0/Cj4gPiA+IEkgc3RpbGwg
c3VzcGVjdCBzb21ldGhpbmcgd3JvbmcgaW4gdGhlIGRldmljZXRyZWUgZGVzY3JpcHRpb24uCj4g
Pgo+ID4gVGhlIG1haW4gaXNzdWUgaXMgbm90IHRoZSByZXR1cm5lZCBlcnJvcjsganVzdCBuZWVk
IHRvIGF2b2lkCj4gPiB0ZXJtaW5hdGluZyB0aGUgcHJvY2VzcyB3aGVuIHRoZSBjb25maWd1cmF0
aW9uIGV4Y2VlZHMgdGhlCj4gPiBoYXJkd2FyZeKAmXMgZXhwZWN0ZWQgbGltaXRzLgo+ID4KPiA+
IFRoZXJlIGFyZSB0d28gbWV0aG9kcyB0byBmaXggdGhlIGlzc3VlIG9uIHRoZSBRaWxhaSBTb0M6
Cj4gPgo+ID4gMS4gU2ltcGx5IHNraXAgdGhlIGVudHJpZXMgdGhhdCBkbyBub3QgbWF0Y2ggdGhl
IGRlc2lnbndhcmUgaGFyZHdhcmUKPiA+IGlBVFUgbGltaXRhdGlvbnMuICBBbiBlcnJvciB3aWxs
IGJlIHJldHVybmVkLCBidXQgaXQgY2FuIGJlIGlnbm9yZWQuCj4gPiBPbiB0aGUgUWlsYWkgU29D
LCB0aGUgaUFUVSBsaW1pdGF0aW9uIGlzIHRoZSA0R0IgYm91bmRhcnkuIFFpbGFpIFNvQwo+ID4g
b25seSBuZWVkIHRvIGNvbmZpZ3VyZSBpQVRVIHN1cHBvcnQgdG8gdHJhbnNsYXRlIGFkZHJlc3Nl
cyBiZWxvdyB0aGUKPiA+ICIzMi1iaXRzIiBhZGRyZXNzIHJhbmdlLiBBbHRob3VnaCA2NC1iaXRz
IGFkZHJlc3NlcyBkbyBub3QgbWF0Y2ggdGhlCj4gPiBkZXNpZ253YXJlIGhhcmR3YXJlIGlBVFUg
bGltaXRhdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY29uZmlndXJlCj4gPiA2NC1iaXRzIGFk
ZHJlc3Nlcywgc2luY2UgdGhlIGNvbm5lY3Rpb24gaXMgaGFyZC13aXJlZC4KPiA+Cj4gPiAyLiBT
ZXQgdGhlIGRldmljZXRyZWUgb25seSAyIHZpZXdwb3J0IGZvciBpQVRVIGFuZCBmb3JjZSB1c2lu
Zwo+ID4gZGV2aWNldHJlZSB2YWx1ZS4gIFRoaXMgaXMgYSB3b3JrYXJvdW5kIGluIHRoZSBkZXZp
Y2V0cmVlLCBidXQgdGhlCj4gPiBmaXggbG9naWMgaXMgbm90IGVhc3kgdG8gZG9jdW1lbnQuICBJ
bnN0ZWFkLCB3ZSBzaG91bGQgZW5mb3JjZSB0aGUKPiA+IHVzZSBvZiB0aGUgdmlld3BvcnQgZGVm
aW5lZCBpbiB0aGUgZGV2aWNldHJlZSBhbmQgbW9kaWZ5IHRoZQo+ID4gZGVzaWdud2FyZSBnZW5l
cmljIGNvZGUgYWNjb3JkaW5nbHkg4oCUIHVzaW5nIHRoZSB2aWV3cG9ydCB2YWx1ZXMgZnJvbQo+
ID4gdGhlIGRldmljZXRyZWUgaW5zdGVhZCBvZiByZWFkaW5nIHRoZW0gZnJvbSB0aGUgZGVzaWdu
d2FyZQo+ID4gcmVnaXN0ZXJzLiAgU2luY2Ugb25seSB0d28gdmlld3BvcnRzIGFyZSBhdmFpbGFi
bGUgZm9yIGlBVFUsIHdlCj4gPiBzaG91bGQgcmVzZXJ2ZSBvbmUgZm9yIHRoZSBjb25maWd1cmF0
aW9uIHJlZ2lzdGVycyBhbmQgdGhlIG90aGVyIGZvcgo+ID4gMzItYml0IGFkZHJlc3MgYWNjZXNz
LiAgVGhlcmVmb3JlLCByZXZlcnNlIGxvZ2ljIHN0aWxsIG5lZWRzIHRvIGJlCj4gPiBhZGRlZCB0
byB0aGUgZGVzaWdud2FyZSBnZW5lcmljIGNvZGUuCj4gPgo+ID4gTWV0aG9kIDIgYWRkcyBleGNl
c3NpdmUgY29tcGxleGl0eSB0byB0aGUgZGVzaWdud2FyZSBnZW5lcmljIGNvZGUuCj4gPiBJbnN0
ZWFkLCBkaXJlY3RseSBjb25maWd1cmluZyB0aGUgaUFUVSBhbmQgcmVwb3J0aW5nIGFuIGVycm9y
IHdoZW4KPiA+IHRoZSBjb25maWd1cmF0aW9uIGV4Y2VlZHMgdGhlIGhhcmR3YXJlIGlBVFUgbGlt
aXRhdGlvbnMgaXMgYSBzaW1wbGVyCj4gPiBhbmQgbW9yZSBlZmZlY3RpdmUgYXBwcm9hY2ggdG8g
YXBwbHlpbmcgdGhlIGZpeC4KPgo+IEkgZG9uJ3Qga25vdyB0aGUgRGVzaWduV2FyZSBpQVRVIGRl
c2lnbiB2ZXJ5IHdlbGwsIHNvIEkgZG9uJ3Qga25vdyBpZgo+IHRoaXMgaXNzdWUgaXMgc29tZXRo
aW5nIHVuaXF1ZSB0byBRaWxhaSBvciBpZiBpdCdzIHNvbWV0aGluZyB0aGF0Cj4gY291bGQgYmUg
aGFuZGxlZCB2aWEgZGV2aWNldHJlZS4KCkkgYmVsaWV2ZSBpdCBzaG91bGQgcHJvYmFibHkgYmUg
aGFuZGxlZCBpbiB0aGUgRFQuIFRoZSBpQVRVIGlzCnByb2dyYW1tZWQgYmFzZWQgb24gdGhlIGJy
aWRnZSB3aW5kb3cgcmVzb3VyY2VzIHdoaWNoIGFyZSBpbiB0dXJuCmJhc2VkIG9uIERUIHJhbmdl
cyBhbmQgZG1hLXJhbmdlcy4gSWYgdGhlcmUncyBhIGZhaWx1cmUsIHRoZW4KcmFuZ2VzL2RtYS1y
YW5nZXMgaXMgd3JvbmcuIE9yIHRoZSBkcml2ZXIgY291bGQgYWRqdXN0IHRoZSBicmlkZ2UKd2lu
ZG93IHJlc291cmNlcyBiZWZvcmUgcHJvZ3JhbW1pbmcgdGhlIGlBVFUuCgpQbGVhc2UgcHJvdmlk
ZSB3aGF0IHRoZSBEVCBsb29rcyBsaWtlIChmb3IgcmFuZ2VzL2RtYS1yYW5nZXMpIGFuZAp3aGVy
ZSBwcm9ibGVtIGVudHJ5IGlzLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
