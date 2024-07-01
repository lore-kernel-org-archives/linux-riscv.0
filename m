Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DB4C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgLlPpKSW3QpqHyvFFnZQ+QJXpQMELZggHg7HXhuT88=; b=EpYfEJ062eBwTH
	JTKXTpRmf+x9C8bVNyRS3Woi5FNauVJEhp17XlWOz2nNyl1vbFnzvu51RxTO/EHLOp0Ai48cWs5EC
	tat1BD6yySIje9TiOYiRAug5UGw06LzUq9dr+Box4kKY1l/HyKFMJv8FG6IeKOdz2fpOQt8klwyah
	bpxmnhpjibg9GRMH1rhUPUpvjdSzr0vWmdC4WnLM66GTZ73/fJGMX5fyu7SIkXIWX8qLoEaALmB1U
	kchRJ237ikYryQc9qeR0RUe9f3VEL44UpseXpNwrJatyd7hwNzezwAMOefd/xi3tTiHHYNAmLDySD
	CJ5RUs2lswzCQcV1Cfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGxI-00000003RmK-1Ioy;
	Mon, 01 Jul 2024 13:20:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGwu-00000003RWJ-0fvs
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 13:20:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f9d9b57b90so20663205ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719840003; x=1720444803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JlXB6PCJBCJcOxNO6yGwCWylVKjxywuZLsaK6U3OjY=;
        b=xxtfj34Lm1A6rQ0aQqAeshZpWO0lHIzo20kDvIBdfpChX47mL+S1jY+1rIj+Y0SDRH
         dqhaYp61J2TMUGAfFQnk9cyBFmmuW3BsX614yoWgHPvYYgTfkSuG87wE4nNqVPwGtDMU
         wQiXD/PYvTPh7v7gv246NHvzf+8ouIKnxNEciusCKLm+k3rMc7KF9RlFHqxBbQuM8q0z
         YxxDMy+ip7n0E5DAOCQFM20tez76l7s9+5jfCykAiPQRCXG1/NB5sIRX2M0UVg9hMQWq
         0Znoyo9760w4/amQEXeoGfKhRu8Sm8PEYeYmPaniYvf4XS+xxx3nyH/wSLXWiz8Cht0b
         VANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840003; x=1720444803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JlXB6PCJBCJcOxNO6yGwCWylVKjxywuZLsaK6U3OjY=;
        b=FiKPp3erbtz8CbXzBtGFmm3JU1Ub7uUSUY0qe/Q/qFkF1ZFu/+MLTjJjxR2SbNAeEL
         9kcYInE/bito2LfZEgoetqTDjK1mqGx/fTyKZN9YNcmHVkxDRbzOaa1oP+lokuIIEwdL
         ZRC72sng2QRUj77KOWUiccHUDIvq204IrvSaTdzTW1ZPaY8ibQoaj9FxVbpghenNs7VA
         dtS6hB/zulu2qKrinpHLuFCJ7Uj46rShrdNeNl0AgIRNaPn8HcHMM+EeCiEOWm+6XWFi
         BX8e25SGH1IpRCcfa3EXYqEMOjapxj7ureYAWovflten/mK8VTq9c6Nh3EO4zkEzFegY
         45mw==
X-Forwarded-Encrypted: i=1; AJvYcCWNQ9AfdfnrH8iRejBKbU+vv+5xmiduEIy9EEgopAiAoTzCK6vhVRGHaX37SWaYLHJdODsknAE/KgAPM7p33Tl0vsEip5sY6o5GEprGqJM2
X-Gm-Message-State: AOJu0Yyqg9eBD8ZFUxAORtC8iP9OxE00w/wBINbKaujwFo0bjhOt0Zu3
	6xKKUW173LzpoNz6vlOCD6sVhH7rXSgh1pOo9D1ozkE2VFxd+NF9NBxTA+GCOCq4iz2PdU34Gx5
	cahz6zFG3bGZJ3jEMOVqMCXdKnzq/xEenLNHtBQ==
X-Google-Smtp-Source: AGHT+IHeXah9reQSEczSkMc1gh4ya+lDIHjw1da05Vcus+GPt0uuucTKzU9b87d/TjzbJQQjm0gUeb92ihVZswCVo8w=
X-Received: by 2002:a17:902:f685:b0:1f7:d1d:21ea with SMTP id
 d9443c01a7336-1fadbc8edbdmr60435495ad.32.1719840003087; Mon, 01 Jul 2024
 06:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAEEvPLBZQnG2=-+P8rS3jE0HkZjfNZy+tcZTRMw9wuLnGudkug@mail.gmail.com>
 <20240701-fog-pagan-0a22fefaf297@spud>
In-Reply-To: <20240701-fog-pagan-0a22fefaf297@spud>
From: Robbin Ehn <rehn@rivosinc.com>
Date: Mon, 1 Jul 2024 15:19:51 +0200
Message-ID: <CAEEvPLDHUN87p3kJQmSm8tcEwENA+3xan6TEKJaJAy3NVDS5hw@mail.gmail.com>
Subject: Re: Vector on Banana Pi BPI-F3
To: Conor Dooley <conor@kernel.org>, riscv-port-dev@openjdk.org
Cc: Ludovic Henry <ludovic@rivosinc.com>, yangfei@iscas.ac.cn, 
	linux-riscv@lists.infradead.org, Hamlin Li <hamlin@rivosinc.com>, 
	Tony Printezis <tony@rivosinc.com>, caogui@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_062004_471817_37E87C61 
X-CRM114-Status: GOOD (  44.01  )
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

SGV5LCB0aGFua3MgZm9yIGNoaW1pbmcgaW4hCgpPbiBNb24sIEp1bCAxLCAyMDI0IGF0IDI6MDni
gK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gWW8sCj4KPiBP
biBNb24sIEp1bCAwMSwgMjAyNCBhdCAxMTowODozMUFNICswMjAwLCBSb2JiaW4gRWhuIHdyb3Rl
Ogo+ID4gVGhlcmUgc2VlbXMgdG8gYmUgYSBsYXJnZSBpbnRlcmVzdCBpbiBydW5uaW5nIG9wZW5q
ZGsgd2l0aCB2ZWN0b3Igb24KPiA+IHRoaXMgYm9hcmQgb3V0LW9mLXRoZS1ib3guCj4gPiBUaGUg
dmVuZG9yIGtlcm5lbCBoYXZlIHZlY3RvciBmcm9tIDYuNCBiYWNrLXBvcnRlZCB3aXRob3V0IGh3
cHJvYmUuCj4gPiBBbmQgRllJOiB0aGUgdmVuZG9yIGtlcm5lbCBmb3IgazIzMCBoYXMgVEhFQUQg
dmVjdG9yIHBhdGNoZXMuCj4gPiBCb3RoIGRvIHRoZSByaWdodCB0aGluZyBkdXJpbmcgY29udGV4
dCBzd2l0Y2hlcyAoc291cmNlcyBoYXZlIGJlZW4gY2hlY2tlZCkuCj4gPgo+ID4gSXQgc2VlbXMg
bGlrZSB3ZSBoYXZlIHRocmVlIG9wdGlvbnMsIGFueW1vcmU/Cj4gPgo+ID4gQToKPiA+IEtlZXAg
d2hhdCB3ZSBkbzogaS5lLiBubyBod3Byb2JlIG5vIFYuCj4gPiBEb3duc2lkZSBubyBWIChkZWZh
dWx0KSBvbiBjb250ZW1wb3JhcnkgYm9hcmRzLgo+ID4gSGVuY2Ugbm8gViBjb3ZlcmFnZSBpbiBD
SSB0ZXN0aW5nIGFuZCBkaXNhcHBvaW50ZWQgZWFybHkgYWRvcHRlcnMuCj4KPiBVcHNpZGU6IHBy
ZXNzdXJlIG9uIHZlbmRvcnMgbm90IHRvIHNoaXAgb2xkLCBoZWF2aWx5IG1vZGlmaWVkIGtlcm5l
bHMuCj4gSSdkIGJlIHByZXR0eSB2b2NpZmVyb3VzIGFib3V0IHB1c2hpbmcgdGhlIGJsYW1lIG9u
IHRoZSB2ZW5kb3JzIHdlcmUgSQo+IGluIHlvdXIgc2hvZXMhIFRoZXJlJ3Mgc29tZSB3b3JrIGlu
IHByb2dyZXNzIGZvciBtYWlubGluZSBzcGFjZW1pdCBrMQo+IHN1cHBvcnQgdGhhdCB3b3VsZCBh
bGxvdyB5b3UgdG8gZ2V0IHNvbWV0aGluZyB1c2FibGUgZm9yIENJIGFsdGhvdWdoCj4gb2J2aW91
c2x5IHRoZXNlIHRoaW5ncyBtb3ZlIHNsb3dseS4gUGFsbWVyIGRpZCBtZW50aW9uIHRoYXQgaWYg
dGhpcwo+IGJvYXJkIGlzIGhlbHBmdWwgZm9yIGNvbXBpbGVyIHRlc3RpbmcgdGhhdCBzb21lIG9m
IHRoZSBSaXZvcyBmb2xrcyBtaWdodAo+IHdvcmsgb24gc3VwcG9ydCBmb3IgaXQgaW4gbWFpbmxp
bmUgdGhvdWdoLCB3aGljaCB3b3VsZCBiZSBuZWF0Li4uCgpZZXMsIEkga25vdyBhYm91dCB0aGUg
bWFpbmxpbmUgZWZmb3J0LCBJIGRpZG4ndCBtZW50aW9uIHRoYXQgYmVjYXVzZQppZiB0aGF0IHdv
cmsgaXMgbm90IHBpY2tlZCB1cCBieSB0aGUgdmVuZG9yLCBtb3N0IHdpbGwgcHJvYmFibHkgc3Rp
Y2sKd2l0aCB0aGUgdmVuZG9yIGtlcm5lbC4KCj4KPiA+IEI6Cj4gPiBFbmFibGUgaXQgZm9yIHRy
aXBsZXQgbXZlbmRvcmlkL21hcmNoaWQvbWltcGxpZC4KPiA+IE9ubHkgViBmb3IgdGhpcyBzcGVj
aWZpYyBib2FyZCwgb3RoZXIgYm9hcmRzIGFuZC9vciB1cGRhdGVzIHRvIHRoaXMKPiA+IGJvYXJk
IHJlcXVpcmUgbmV3IGJpbmFyaWVzLgo+Cj4gQW5kLCBkZXBlbmRpbmcgb24gaW1wbGVtZW50YXRp
b24sIG1heSBicmVhayBpZiB0aGUga2VybmVsIHJ1bm5pbmcgb24gdGhlCj4gYm9hcmQgZG9lc24n
dCBzdXBwb3J0IHZlY3Rvci4gWW91J2QgbmVlZCB0byBjaGVjayBod2NhcCBhbmQgdGhlIHRyaXBs
ZXQuCj4gbSppZCBhbGwgY29tZSBmcm9tIHRoZSBDUFUsIHNvIHlvdSBjYW4ndCBiZSBzdXJlIHRo
YXQgdGhlIHZhbHVlcyB0aGVyZQo+IHdpbGwgdW5pcXVlbHkgaWRlbnRpZnkgYSBzcGVjaWZpYyBi
b2FyZCBvciBTb0MgZm9yIHlvdSBhbnl3YXkuIElmIHlvdQo+IHdhbnQgdG8gc3VwcG9ydCB0aGUg
Y2FuIG9mIHdvcm1zIHlvdSdyZSBvcGVuaW5nIHRoZXJlIHdpdGggbSppZCBzdHVmZgo+IGZvciB2
ZW5kb3Iga2VybmVscywgdGhlbiBnbyBmb3IgaXQuIElmIHlvdSBzdGFydCBpdCBmb3IgdmVjdG9y
IG9uIG9uZQo+IGJvYXJkLCB3aGVyZSBkbyB5b3UgZHJhdyBhIGxpbmUgaW4gdGVybXMgb2YgZWl0
aGVyIGV4dGVuc2lvbiBvciBib2FyZHM/Cj4KPiA+IEM6Cj4gPiBFbmFibGUgaXQgZm9yIGJvYXJk
cyB3aXRoIFYgaW4gaHdjYXAuCj4gPiBEb3duc2lkZSBib2FyZHMgZmFsc2UgcmVwb3J0aW5nIFYg
KDEuMCksIHN1Y2ggYXMgSzIzMCBzbWFsbC1DUFUgYW5kIFRIRUFELAo+Cj4gV2h5IGRvZXMgdGhl
IHNtYWxsIEsyMzAgQ1BVIGZhbHNlbHkgcmVwb3J0IHRoYXQ/IERvZXMgaXQgaGF2ZSBubyB2ZWN0
b3IKPiBhbmQgcmVwb3J0IHRoYXQgaXQgZG9lcz8gT3IgZG9lcyBpdCBzdXBwb3J0IDAuNyBsaWtl
IHRoZSBvdGhlciBULWhlYWQKPiBzdHVmZj8gSSBzdXBwb3NlIHRoZSBsYXR0ZXIgZ2l2ZW4gdGhl
eSB0aGUgcGF0Y2hlcyB5b3Ugc2F5IHRoZWlyIGtlcm5lbAo+IGhhcy4KCklmIHlvdSBhcmUgcnVu
bmluZyBvbiB0aGUgc21hbGwgQ1BVMCAobm8gVikgSSB3YXMgdG9sZCBod2NhcCBzdGlsbCByZXBv
cnRlZCBWICE/Ck15IGJvYXJkIGp1c3QgcnVucyB0aGUgYmlnIENQVTEgY29yZSB3aXRoIFYgMS4w
LCBzbyBJIGhhdmUgbm90IHZlcmlmaWVkIHRoaXMuCgo+Cj4gT25lIHRoaW5nIHRoYXQgd2UgZGlk
IGluIHRoZSBrZXJuZWwgd2FzLCB3aGVuIHBhcnNpbmcgYSBkZXZpY2V0cmVlLCB0bwo+IGlnbm9y
ZSB2IGluIHJpc2N2LGlzYSB3aGVyZSB0aGUgQ1BVIHZlbmRvciB3YXMgVC1IZWFkIGFuZCB0aGUg
YXJjaGlkIHdhcwo+IDB4MC4gSXQgd2Fzbid0IG1lYW50IHRvIGJlIGEgcGVyZmVjdCBkZXRlY3Rp
b24gb2YgaW5jb3JyZWN0IGRldmljZXRyZWVzLAo+IGJ1dCBhIHNpbXBsZSBiZXN0LWVmZm9ydCBh
dHRlbXB0IHRvIGhhbmRsZSB2ZW5kb3IgcHJvdmlkZWQgZHRicyBmb3IKPiBWZWN0b3IgMC43IGRl
dmljZXMuIEJlc3QtZWZmb3J0IGlzIGZpbmUgaW4gdGhpcyBjYXNlLCBjb3MgdWx0aW1hdGVseSBp
dAo+IGlzbid0IHRoZSBrZXJuZWwncyBwcm9ibGVtIGlmIHNvbWVvbmUgaGFzIGluY29ycmVjdGx5
IGRlc2NyaWJlZCB0aGVpcgo+IGhhcmR3YXJlLiBHdW8gUmVuIGNsYWltZWQgdGhhdCBubyB2ZWN0
b3IgMS4wIGRldmljZXMgaGF2ZSBhIDB4MCBtYXJjaGlkLAo+IGJ1dCBJIGRvIG5vdCBrbm93IGlm
IHRoZXJlIGFyZSB2ZWN0b3IgMC43IGRldmljZXMgd2l0aCBhIG5vbi16ZXJvIG1hcmNoaWQuCj4K
CkFzIHdlIGFyZSB0YWxraW5nIGFib3V0IGtlcm5lbHMgd2l0aG91dCBod3Byb2JlLCB1c2Vyc3Bh
Y2UgY2FuIG9ubHkKZ2V0IGl0IGlmIGl0J3MgcmVwb3J0ZWQgdmlhIHByb2MuICg/KQoobXkgazIz
MCBrZXJuZWwgZm9yIGV4YW1wbGUgZG9lcyBub3QpCgo+IEknZCBiZSB2ZXJ5IGN1cmlvdXMgYXMg
dG8gd2hhdCB0aGUgc21hbGwgY3B1IHJlcG9ydHMgZm9yIG1hcmNoaWQvbWltcGlkLAo+IHRvIHNl
ZSBpZiB0aGF0IHJ1bGUgd291bGQgc3RpbGwgaG9sZCB0cnVlLiBJZiB0aGV5IGhhcHBlbnMgdG8g
YmUgbm9uLXplcm8sCj4gbWFpbmxpbmUgd291bGRuJ3QgZXZlbiBydW4gb24gaXQsIGV2ZW4gaWdu
b3JpbmcgdmVjdG9yLCB3aXRob3V0IGVpdGhlciBhbgo+IE9wZW5TQkkgYW5kIGRldmljZXRyZWUg
cmVwbGFjZW1lbnQgb3Iga2VybmVsIGNoYW5nZXMsIHNvIHRoZSBjb3VydGVzeQo+IGRpc2FibGlu
ZyBvZiB2ZWN0b3Igd291bGRuJ3QgZXZlbiB0cmlnZ2VyLiBXaGF0IGl0IHdvdWxkIG1lYW4sIGlz
IGEKPiBzaW1pbGFyIGFwcHJvYWNoIHRvIGRpc2FibGUgdmVjdG9yIG9uIDAuNyBkZXZpY2VzIHdv
dWxkbid0IHN1ZmZpY2UgZm9yCj4geW91Lgo+Cj4gPiBuZWVkcyB0byBiZSBoYW5kbGVkLCBzYWZl
IGZldGNoIHZzZXR2bGkgYW5kIHZzZXR2bGkgdjEuMCBjaGVjayBjYW4gZml4Cj4gPiB0aG9zZSB0
d28gZXhhbXBsZXMuCj4gPiBJZiB3ZSBtaXNzIGEgYm9hcmQgb3IgYSBuZXcgYm9hcmQgY29tZXMg
b3V0IHdlIG1heSBsYWNrIHByb3BlciBjaGVjayB0aHVzIGNyYXNoLgo+Cj4gV2l0aCBteSBvbmx5
IG1haW5saW5lIG1hdHRlcnMgYmxpbmtlcnMgb24sIHRoYXQncyBhbm90aGVyIHRpY2sgaW4gdGhl
Cj4gInByZXNzdXJlIG9uIHZlbmRvcnMgdG8gbm90IHNoaXAgb2xkLCBoZWF2aWx5IG1vZGlmaWVk
IGtlcm5lbHMiIGJveCEKPgo+ID4gSW4gUFJzOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5q
ZGsvamRrL3B1bGwvMTk0NzIKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuamRrL2pkay9wdWxs
LzE5Njc5Cj4gPgo+ID4gT3B0aW9ucyBBIHdhcyB1c2VkLgo+ID4KPiA+IFRoZSBxdWVzdGlvbiBp
cyBpZiB3ZSBjYW4gcmVjb25zaWRlciBkdWUgdG8gdGhlIGJlbmVmaXRzIGFuZCB1c2UKPiA+IGFu
b3RoZXIgb3B0aW9uIGFsbG93aW5nIFYgdG8gYXV0b21hdGljYWxseSB3b3JrPwo+Cj4gSSB0aGlu
ayB3aGV0aGVyIHlvdSByZWNvbnNpZGVyIGlzbid0IHJlYWxseSBhIHRvcGljIGZvciBsa21sLCBp
dCBzZWVtcwo+IG1vcmUgbGlrZSBhIHBvbGljeSBkZWNpc2lvbiBmb3IgeW91ciBwcm9qZWN0IGFz
IHRoZXJlJ3Mgbm90IGEgbWFnaWMgYnVsbGV0Cj4gd2UgY2FuIG9mZmVyIHlvdSB0aGF0IGNhbiBi
ZSBzdXJlIG5vdCB0byBicmVhayBpZiB5b3UgaW50ZW50IHN1cHBvcnRpbmcKPiAicmFuZG9tIiB2
ZW5kb3Iga2VybmVscy4KClllcywgd3JvbmcgbGlzdCA6KSBBbmQgSSB5ZXMgdGhhdCdzIG15IG9w
aW5pb24gYWxzby4KQnV0IGFzIGl0IHdpbGwgc2lnbmljYW50IG1ha2UgbGlmZSBlYXNpZXIgZm9y
IG1hbnksIEknbSB3aWxsaW5nIHRvIGxldCBpdCBzbGlkZS4KCkFkZGVkIHRoZSBjb3JyZWN0IGxp
c3QsIGJ1dCBJJ2xsIGtlZXAgbGttbCBpZiBhbnlvbmUgZWxzZSB3YW50cyB0byBjaGltZSBpbi4K
ClRoYW5rcywgUm9iYmluCgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
