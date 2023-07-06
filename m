Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF117EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFYykPeSiuFNoSLwzgVpJgjV4znJYEfcl6ZExi0kE+c=; b=JzpmVkRAImehIQ
	YlGsrYZaDSyd7cvep6+kzWiHGG0gsL0sLpg3v33mmEILGB3+TwRf8tDLyvr4Jm2TfyRFVSxsGJ7Hh
	dpf1AI8Et8BFX2b1HZ7sjM7JJUBW+Lx1wq7dGy1MBOjhDerhCl0VizdybaatkX86rQwkSrYf73Qh6
	T8TV7mIXUwAcfmxMSD3vS4QMxkYYh79Ja3zS4XrZQEd+lCUV4DJaoePSoXPHvVAOxLISmW0zjuTDs
	JIlMnwoAAQz+RUO//JUmLUUMXSwdJkLJZmsJGbSZzb0V1cTOd3RNuVh2UHyTSCMnHdrldm0YPIT04
	aW+wBCjW6wPr4PCTbByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUl0-002WAW-0Z;
	Thu, 06 Jul 2023 19:35:14 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUkx-002W93-1q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 19:35:13 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso1673572e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688672106; x=1691264106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJb0tT5v6PFselQcra2E8iBWNOHEwGRQkGYRNRggtk0=;
        b=PvGnYWJHhj4WvRyhsNgheDIkauEwn6/iNIBYs/wbygmrSNi0xmT0h5/NLSevgYfprC
         DW0mNTVRMvvj+aPw7mC+AV4zhcsASi+hkaiDsXAZkzkf+Z+2UJJjwohlTScOhbMNSdME
         mr47Uqy8H6MINnTvdyCl1w3XhpdBSHENZSpKMwEadhFbfDM+zeGejDwi9iEJQCgaqLSN
         L4xbbHzz33ROw05NkWmTP+cdZ/QRsg/VQboOC805ZI+4tufbmUTbjrjvNKxX/X98Oj13
         RvB5CkJPLsaedPxMqpdE24uZX94gEV+Sg0kRz7kcHMdWHj3kbh10IiC9Eb8gvImuJ1rV
         hKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688672106; x=1691264106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJb0tT5v6PFselQcra2E8iBWNOHEwGRQkGYRNRggtk0=;
        b=R6YSiK9s/mYKykFVKVQ4vLKYWaIHiDVnclAg1rh53x95LOBUUyrG25da7LNKI+s+tq
         BcB7JQtoOTQuN/eRH2FVtWZYYMwOkVUEbnV7hqq0O3HokC3HsFWmas4mNs0iJiAO0+9c
         +gI+aEIJXe2gp4sUnFu+61pJuPk/k3N8pH6DxsFJuO+vbBP0pauXIR+xN7NsaurVyRxr
         2KsyQNN6qGS075aTtvIJxNcUGcR4h7FVhk9hywrQRaYQdJimCQSjp8NbEKt1VGsa3xpE
         JGbEmX9PqesFRK9gXXk0ZGxHR7DL4ZoyjyUMSsga4oyugW6n4FP+vVNEwVwaV37t5Cgc
         f5Lw==
X-Gm-Message-State: ABy/qLZDBtjgZVTEjqm0oOpIsdBShL0tWV2ewnWpRery21mLJJg5gjsC
	MxCUmfjZZ22pr1MYdsLUcwuovy5nNm+dl/8RyqE5ZA==
X-Google-Smtp-Source: APBJJlEiwB3zrVWoRSJyoWVS8+2c9Dd5aS5me6kgVvr1RCyWHsgrOefe0B9ojFn0k/KgRnYGHW7i7mTIbl76IWI8W+U=
X-Received: by 2002:a05:6512:1ca:b0:4f5:1418:e230 with SMTP id
 f10-20020a05651201ca00b004f51418e230mr2117287lfp.52.1688672106378; Thu, 06
 Jul 2023 12:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230705172931.1099183-1-evan@rivosinc.com> <20230706-dbdee6eba0c4a16084587b10@orel>
 <20230706-murkiness-oven-444f25924546@wendy>
In-Reply-To: <20230706-murkiness-oven-444f25924546@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 6 Jul 2023 12:34:30 -0700
Message-ID: <CALs-Hssc6Uxf-6FKbye2n-CD0FWWE4xDmUWvN1NoKNFpn88SKg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_123511_834583_A9C6F7AD 
X-CRM114-Status: GOOD (  32.27  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCAzOjUz4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAwNiwgMjAyMyBhdCAxMDow
MTozMUFNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAwNSwgMjAy
MyBhdCAxMDoyOTozMUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiBJbiAvcHJvYy9j
cHVpbmZvLCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB3ZSBzaG93IGZvciBlYWNoIHByb2Nlc3Nv
ciBpcwo+ID4gPiBzcGVjaWZpYyB0byB0aGF0IGhhcnQ6IG1hcmNoaWQsIG12ZW5kb3JpZCwgbWlt
cGlkLCBwcm9jZXNzb3IsIGhhcnQsCj4gPiA+IGNvbXBhdGlibGUsIGFuZCB0aGUgbW11IHNpemUu
IEJ1dCB0aGUgSVNBIHN0cmluZyBnZXRzIGZpbHRlcmVkIHRocm91Z2ggYQo+ID4gPiBsb3dlc3Qg
Y29tbW9uIGRlbm9taW5hdG9yIG1hc2ssIHNvIHRoYXQgaWYgb25lIENQVSBpcyBtaXNzaW5nIGFu
IElTQQo+ID4gPiBleHRlbnNpb24sIG5vIENQVXMgd2lsbCBzaG93IGl0Lgo+ID4gPgo+ID4gPiBO
b3cgdGhhdCB3ZSB0cmFjayB0aGUgSVNBIGV4dGVuc2lvbnMgZm9yIGVhY2ggaGFydCwgbGV0J3Mg
cmVwb3J0IElTQQo+ID4gPiBleHRlbnNpb24gaW5mbyBhY2N1cmF0ZWx5IHBlci1oYXJ0IGluIC9w
cm9jL2NwdWluZm8uIFdlIGNhbm5vdCBjaGFuZ2UKPiA+ID4gdGhlICJpc2E6IiBsaW5lLCBhcyB1
c2VybW9kZSBtYXkgYmUgcmVseWluZyBvbiB0aGF0IGxpbmUgdG8gc2hvdyBvbmx5Cj4gPiA+IHRo
ZSBjb21tb24gc2V0IG9mIGV4dGVuc2lvbnMgc3VwcG9ydGVkIGFjcm9zcyBhbGwgaGFydHMuIEFk
ZCBhIG5ldyAiaGFydAo+ID4gPiBpc2EiIGxpbmUgaW5zdGVhZCwgd2hpY2ggcmVwb3J0cyB0aGUg
dHJ1ZSBzZXQgb2YgZXh0ZW5zaW9ucyBmb3IgdGhhdAo+ID4gPiBoYXJ0LiBUaGlzIG1hdGNoZXMg
d2hhdCBpcyByZXR1cm5lZCBpbiByaXNjdl9od3Byb2JlKCkgd2hlbiBxdWVyeWluZyBhCj4gPiA+
IGdpdmVuIGhhcnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5A
cml2b3NpbmMuY29tPgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2MjoK
PiA+ID4gIC0gQWRkZWQgbmV3ICJoYXJ0IGlzYSIgbGluZSByYXRoZXIgdGhhbiBhbHRlcmluZyBi
ZWhhdmlvciBvZiBleGlzdGluZwo+ID4gPiAgICAiaXNhIiBsaW5lIChDb25vciwgUGFsbWVyKQo+
ID4gPgo+ID4gPgo+ID4gPiBJIGJhc2VkIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBDb25vcidzIHJp
c2N2LWV4dGVuc2lvbnMtc3RyaW5ncyBicmFuY2gKPiA+ID4gZnJvbSBKdWx5IDNyZCwgc2luY2Ug
b3RoZXJ3aXNlIHRoaXMgY2hhbmdlIGdldHMgaG9wZWxlc3NseSBlbnRhbmdsZWQKPiA+ID4gd2l0
aCB0aGF0IHNlcmllcy4KPiA+ID4KPiA+ID4gSSB3YXMgdW5zdXJlIGlmIEkgY291bGQgc251Z2ds
ZSB0aGUgbmV3ICJoYXJ0IGlzYSIgbGluZSBpbiBqdXN0IGJlbG93Cj4gPiA+ICJpc2EiLiBBZXN0
aGV0aWNhbGx5IGl0IHdvdWxkIGJlIHF1aXRlIHBsZWFzaW5nLCBidXQgaXQgcnVucyB0aGUgcmlz
ayBvZgo+ID4gPiBicmVha2luZyBicml0dGxlIHVzZXJtb2RlIHBhcnNlcnMgdGhhdCBhcmUgYXNz
dW1pbmcgYSBzcGVjaWZpYyBsaW5lCj4gPiA+IG9yZGVyLiBTbyBJIHB1dCBpdCBhdCB0aGUgZW5k
Lgo+ID4KPiA+IEFjdHVhbGx5LCB0aGV5J3JlIHByb2JhYmx5IG9ubHkgYWVzdGhldGljYWxseSBw
bGVhc2luZyB3aGVuIHRoZXkgbWF0Y2guIElmCj4gPiB0aGVyZSBhcmUgZGlmZmVyZW5jZXMsIHRo
ZW4gSSdkIGd1ZXNzIGhhdmluZyB0aGVtIHNpZGUgYnkgc2lkZSwgYWxtb3N0IHRoZQo+ID4gc2Ft
ZSwgYnV0IGRpZmZlcmVudCwgd291bGQgbWFrZSB0aGVtIGV2ZW4gaGFyZGVyIHRvIGxvb2sgYXQg
dGhlbiB0aGV5Cj4gPiBhbHJlYWR5IGFyZS4gU28gSSB0aGluayBJJ2xsIGJlIGhhcHBpZXIgd2l0
aCB0aGVtIHNlcGFyYXRlZCBieSBhIGZldyBsaW5lcwo+ID4gYW55d2F5Lgo+Cj4gVGhpcyBsaXN0
IGlzIGV2ZW50dWFsbHkgZ29pbmcgdG8gYmUgc28gYmlnIHRoYXQgSSBkb24ndCB0aGluayBkb2lu
Zwo+IGJ5LWV5ZSBhbnl0aGluZyBpcyBnb2luZyB0byBiZSB1c2VmdWwsIHNvIGFlc3RoZXRpY3Mg
YmUgZGFtbmVkLgo+IFRoYXQgc2FpZCwgYSBwYXJzZXIgdGhhdCByZWxpZXMgb24gdGhlIG9yZGVy
IG9mIGluZGl2aWR1YWwgbGluZXMgbGlrZQo+IHRoYXQgbWlnaHQgZGVzZXJ2ZSB0byBiZSBicm9r
ZW4gOykKPgo+IEFueXdheSwgY2hhbmdlIGxvb2tzIGdvb2QgdG8gbWU6Cj4gUmV2aWV3ZWQtYnk6
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBJIHdhcyB0aGlu
a2luZyB0aGUgdWFiaSBkb2MgbWlnaHQgbmVlZCBhbiB1cGRhdGUgLSBzaG91bGQgd2UgYWRkIHRv
IGl0Cj4gdGhhdCAiaXNhIiBtZWFucyB0aGUgY29tbW9uIHNldCAmICJoYXJ0IGlzYSI/CgpJIGRp
ZCBkbyBhIGxpdHRsZSBzZWFyY2ggZm9yIGRvY3VtZW50YXRpb24gdG8gdXBkYXRlLCBidXQgZmFp
bGVkIHRvCmNvbWUgdXAgd2l0aCBhbnkuIFdoaWNoIGRvYyBhcmUgeW91IHRoaW5raW5nIG9mPwot
RXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
