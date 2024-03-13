Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54EC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc9JlRbsv8x9UD+n11IhSEI4wlw7TaC59VHKMbdk9I0=; b=XNg3hdS4AJowE+
	F0NoAMq93+atANkbbXzm4xJ1oGXZXUOv2zORG5j600csIQdZbGpbhEGGQmmZIwJtQbjik3kViQZfb
	Dmjxp7g051/hb67OVXvyAjtSG90VePf3ja4zMUm++YC/y/2m2mKY5k9uxR6O5zrQyzt1J+lCJQF0U
	GPa9LARl7MTl3+FxUXMjy9q4Ii38BpkgODZ8ygk9tqmquiRxLY7XxJ+RyPaMYw/HGBLY32dUMey3G
	jk+4JXcngR/JUA5qgLf1IKtnFkzaFtRdYEYNOIFCWa9j+ufOZsGpQ7WccvBYlYTqDa842h5KMFvIH
	lWulQoxts640uE8KtP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDbk-00000008SQu-3tfa;
	Wed, 13 Mar 2024 01:40:40 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDbh-00000008SQL-0s1a
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 01:40:38 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4757893276.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 18:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710294033; x=1710898833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw6iv5diMhPOmpAJTgJKliqyCfJiy2Sba1aMYIRAVAM=;
        b=auaYuPjezGOatbqyt9CUdmSNR+NIbie40HQX1Z0B683GWNX1OyzDAAGXM1H2zmfFEb
         p842etZqqHnWjacrasallPjIgY2ExkLFgMtKQ8fESfA3tDOya8DGtCac+phDRcLq23kG
         TaclWtjITsFpe5Q/c4RKuF1GBWLHrUoAism0a1lUO0thS7RnXzOh8qz8EKSPMF6sfrVL
         rROSXHGCkdw7nkhAmjjPX5SGWdsnQn3wXDSYwwnH5dMfs4Q6flDE3i1gyLaYKbwsiJFr
         J+L+bQ0tiHhCu7EbpDSLJruVOiXNdsNmHJaSbBLfDTU5IhadNi1OgCEDumWevKoefgMa
         yPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710294033; x=1710898833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw6iv5diMhPOmpAJTgJKliqyCfJiy2Sba1aMYIRAVAM=;
        b=a7hNxSv+oRG6vwm/O6Eu4RCBb/3ltSmRED+nBa8JTWpZ7oNXDD5vZcuOXe0xHWL4g3
         jaCPgIuM5MO182vkwuM+Nq0xPnDKhcS7ImNS18hPQy9PVca2A9qj251aqMtU9Ly0cXAd
         SD6gX/CePRc6fBIyfQG+ZDBhIxisUuxH+RHcRagcVy9ea0Mp4BUJ362HjLcqinDn1zKS
         8e6pmMys8/vwF6N1sWVGVTE4Z/mFw5Xq1ugptT6DsoNuGFcE2bEom3ulYrWXL7RAiVym
         fgKoaJCjPGUbEU696SzU187jV11wFbzs6M1OgMPpXyssoCMM73s1HlCwn9zVp7nChKek
         Tk6Q==
X-Gm-Message-State: AOJu0Yw/Bzrk9y2wKd2467fTbTa9m8DKVGDy+wUCSBlCK0OBAkaxzMWs
	Oob+Eg+TX7UoWPO1pNvoCVHh6w78+ORa023A20IuwS7hZyFyKFFO18PGkLSn0EgrVwoE1p9Qy+u
	fptqG0pZOv1LJHFAaCffZeFPz9srLboVLtn9Gzg==
X-Google-Smtp-Source: AGHT+IHniCyxovxT30wxzCRNd5HBkvXbQL55gnBguhjZFO2HMgJPYKLrBuRx+YyLYzIsi+kae65hjgiUpJXtZ3ziibI=
X-Received: by 2002:a5b:5ce:0:b0:dc6:4713:bbf1 with SMTP id
 w14-20020a5b05ce000000b00dc64713bbf1mr1175189ybp.21.1710294032737; Tue, 12
 Mar 2024 18:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240312123627.9285-1-andy.chiu@sifive.com> <20240312123627.9285-3-andy.chiu@sifive.com>
 <20240312-hardened-filled-01e6cafc9c5b@spud>
In-Reply-To: <20240312-hardened-filled-01e6cafc9c5b@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 13 Mar 2024 09:40:21 +0800
Message-ID: <CABgGipVdGsMJJQEA5iXX0UPz144GO5rU+NdB9+=wWR0KWDidCw@mail.gmail.com>
Subject: Re: [v1, 2/6] riscv: smp: fail booting up smp if inconsistent vlen is detected
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	Anup Patel <apatel@ventanamicro.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, 
	Yang Li <yang.lee@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Nam Cao <namcaov@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Evan Green <evan@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Frederik Haxel <haxel@fzi.de>, greentime.hu@sifive.com, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_184037_330173_56260427 
X-CRM114-Status: GOOD (  23.15  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgODo1OeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAwODozNjoyM1BNICsw
ODAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiBDdXJyZW50bHkgd2Ugb25seSBzdXBwb3J0IFZlY3Rv
ciBmb3IgU01QIHBsYXRmb3JtcywgdGhhdCBpcywgYWxsIFNNUAo+ID4gY29yZXMgaGF2ZSB0aGUg
c2FtZSB2bGVuYi4gSWYgd2UgaGFwcGVuIHRvIGRldGVjdCBhIG1pc21hdGNoaW5nIHZsZW4sIGl0
Cj4gPiBpcyBiZXR0ZXIgdG8ganVzdCBmYWlsIGJvb3R0aW5nIGl0IHVwIHRvIHByZXZlbnQgZnVy
dGhlciByYWNlL3NjaGVkdWxpbmcKPiA+IGlzc3Vlcy4KPiA+Cj4gPiBGaXhlczogNzAxNzg1OGVi
MmQ3ICgicmlzY3Y6IEludHJvZHVjZSByaXNjdl92X3ZzaXplIHRvIHJlY29yZCBzaXplIG9mIFZl
Y3RvciBjb250ZXh0IikKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+Cj4KPiBSZXBvcnRlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjQwMjI4LXZpY2luaXR5LWNvcm5zdGFsay00YjhlYjVmZTU3MzBAc3B1ZC8KPiBjYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+Cj4gSSBhY3R1YWxseSB0aG91Z2h0IEkgaGFkIHNlbnQgYSBw
YXRjaCBmb3IgdGhpcywgYnV0IEkgZG9uJ3Qgc2VlbSB0bwo+IGhhdmUuIEkgZGlkIHdyaXRlIG9u
ZSwgc28gSSBndWVzcyBJIGp1c3QgZGlkIG5vdCBzZW5kIGl0Lgo+Cj4gPiAtLS0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3NtcGJvb3QuYyB8IDE0ICsrKysrKysrKy0tLS0tCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4g
PiBpbmRleCA0MjM2YTY5YzM1Y2IuLmExNThmYTlmMjY1NiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2hlYWQuUwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4g
PiBAQCAtMTY1LDkgKzE2NSwxNSBAQCBzZWNvbmRhcnlfc3RhcnRfc2JpOgo+ID4gICNlbmRpZgo+
ID4gICAgICAgY2FsbCAuTHNldHVwX3RyYXBfdmVjdG9yCj4gPiAgICAgICBzY3NfbG9hZF9jdXJy
ZW50Cj4gPiAtICAgICB0YWlsIHNtcF9jYWxsaW4KPiA+ICsgICAgIGNhbGwgc21wX2NhbGxpbgo+
ID4gICNlbmRpZiAvKiBDT05GSUdfU01QICovCj4gPgo+ID4gKy5hbGlnbiAyCj4gPiArLkxzZWNv
bmRhcnlfcGFyazoKPiA+ICsgICAgIC8qIFdlIGxhY2sgU01QIHN1cHBvcnQgb3IgaGF2ZSB0b28g
bWFueSBoYXJ0cywgc28gcGFyayB0aGlzIGhhcnQgKi8KPiA+ICsgICAgIHdmaQo+ID4gKyAgICAg
aiAuTHNlY29uZGFyeV9wYXJrCj4gPiArCj4gPiAgLmFsaWduIDIKPiA+ICAuTHNldHVwX3RyYXBf
dmVjdG9yOgo+ID4gICAgICAgLyogU2V0IHRyYXAgdmVjdG9yIHRvIGV4Y2VwdGlvbiBoYW5kbGVy
ICovCj4gPiBAQCAtMTgxLDEyICsxODcsNiBAQCBzZWNvbmRhcnlfc3RhcnRfc2JpOgo+ID4gICAg
ICAgY3NydyBDU1JfU0NSQVRDSCwgemVybwo+ID4gICAgICAgcmV0Cj4gPgo+ID4gLS5hbGlnbiAy
Cj4gPiAtLkxzZWNvbmRhcnlfcGFyazoKPiA+IC0gICAgIC8qIFdlIGxhY2sgU01QIHN1cHBvcnQg
b3IgaGF2ZSB0b28gbWFueSBoYXJ0cywgc28gcGFyayB0aGlzIGhhcnQgKi8KPiA+IC0gICAgIHdm
aQo+ID4gLSAgICAgaiAuTHNlY29uZGFyeV9wYXJrCj4gPiAtCj4gPiAgU1lNX0NPREVfRU5EKF9z
dGFydCkKPiA+Cj4gPiAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5lbCkKPgo+IFdoeSBkb2Vz
IHRoaXMgY2hhbmdlPyBUaGVyZSdzIG5vIG1lbnRpb24gb2Ygd2h5IGluIHRoZSBjb21taXQgbWVz
c2FnZS4KCk9rLCBJIHdpbGwgYWRkIHNvbWUgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLgoKVGhpcyBkaXJlY3RzIHRoZSBjb3JlIHRvIHNlY29uZGFyeV9wYXJrIHdoZW5ldmVyIHNt
cF9jYWxsaW4oKSBmYWlsbHMKYW5kIHJldHVybnMuIFNvIHdlIGRvbid0IGhhdmUgdG8gcmUtd3Jp
dGUgdGhlIGluZmluaXR5IGxvb3AgaW4gdGhlIGMKZnVuY3Rpb24uCgo+Cj4gVGhhbmtzLAo+IENv
bm9yLgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
