Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB45EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xT8XzbahqA1tCArp73V9VY+AZuaxGaFm9KMtdPeCbAI=; b=ejMuqqhzqcpUbH
	mMDCjlvM8j8C/NFU2UHhtRwzZxwi5lly+V9bWmAktGP9h0Kxs1rw6W48TYMm+uqg0CfhvirOgniDW
	BEu+dhUYfzTNckyTKVjDcYpia/h15AhUy48VwzrPAdJFL7kjfreocxJoL6qBfgc6so1lzJlLk9gEp
	+f7k8YaE2l86DfrE9Q9AAiPLtKa7qxBxjSHsKXTUFGVL51F4dkK3Se6ly9MyWCYOXdyD8MokkfErt
	hs1iaxvsJU2yXcemdqLnF6gLArAcUtkdzotukWf4hLQyZCFuHBjRl4URb+SZQF5Ptyvq90oyibvRn
	wDNAagOFayQ11nr42tOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHoAd-005ASP-0Q;
	Fri, 07 Jul 2023 16:18:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHoAa-005ARC-24
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 16:18:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so2827547a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688746730; x=1691338730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwphiLKBiEsc7end01Y8mmEBaeTtS1uM+mpDszrjNwU=;
        b=kLJvIcllBwq3yuN7T4W5b/a9y5XRFLkSDvzTLkaIXA5rjr3sDKw+zwZB9eXr3Wo+Rm
         CnegdWjDjTi1vU7Au9bDR1xfGmtpynB4ocTa4raBPAmzXOetWr/X8lWdxQEUZ30Y5cqg
         nssvL/k0HrWueSeLqFJ7k7URhQNdosToSXpYGj3BWNjVkw9VB+HD3G2EyCu8/51Q55Lg
         wfa4k2NL4mxqjsu/BvDlFJ9se/xU3aCf69Iw0DSBAC7Wjhd2me8Tcuq/eOhRa0qXio2u
         bZpQRprslU43SNWWy8AmwP3J/bKbj9CPy0WMnUgwoK2m+Lqm+YuPKzhJ2ejG7pixXfIK
         yF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688746730; x=1691338730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwphiLKBiEsc7end01Y8mmEBaeTtS1uM+mpDszrjNwU=;
        b=DbdvhRNvVn4pi07G0zTP8ZG26DZ4TKZhnIhcVTr9IR/GyMvJ0s9C1URQa5Uxa1rwEm
         MTWjKtnKR00reGcx0c2NIGvI6aj88S6CwapsXgpO7ktcWO+fpoiZTHzxQwb1lzKQ0Zdk
         9+9hYHX791PcW1IBNCL+59dckJLqLGcOywThsZemXWpG4OuyRM6bpExDUBt91xSdN/bK
         Co6WrLSBvNL5eNf3rslAJ0/LUsXWltAzGvfH9m/rOjz9xf35BsBCgOBNQhQIKgLl6dJW
         ZyKKVVhhZzwSoPW/GPMffLjqMsyQD1GS6g140D9+4Gi31rkTz4DU8EIhyDzcVnEL5QRE
         +eVA==
X-Gm-Message-State: ABy/qLa2eq2Ra79uHF49gFyc9grgStDl2ihar0RXwdZKZ5KMJMAjeyYQ
	SrQdWwpa9Bu8sel+ZxaHOjeVTCc0DVGiP7xUybQq/Q==
X-Google-Smtp-Source: APBJJlGNXWN5iR0lxERw28DBQHWKhrGGYB0EGkwrVdX0DNT38+8FUlx2ZocVTPj1M0RsuZ0At5riiFSUnWNrWNAhazs=
X-Received: by 2002:aa7:cf96:0:b0:51d:7fa6:62ca with SMTP id
 z22-20020aa7cf96000000b0051d7fa662camr4182986edx.14.1688746730201; Fri, 07
 Jul 2023 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFZren0Q19DimwQaETCLz64D4bZQC5B2N=i3SAWHygkTQ@mail.gmail.com>
 <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
 <20230707-attach-conjuror-306d967347ce@wendy> <ZKfsSsdiso0W8mW6@sunil-laptop>
 <CAN3iYbMhQU5Ng4r6_rQDnLmit1GCmheC5T49rsUP5NgHFEXsHA@mail.gmail.com>
 <ZKgLKvBoWKSxzm6r@sunil-laptop> <CAN3iYbOe+i4jVhz0sSQwVQ2PMB7UvaTPyN_sLtZj0uiOD2emDA@mail.gmail.com>
 <20230707-gargle-enjoyable-f9f7f87fc7ea@spud>
In-Reply-To: <20230707-gargle-enjoyable-f9f7f87fc7ea@spud>
From: =?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>
Date: Sat, 8 Jul 2023 00:18:39 +0800
Message-ID: <CAN3iYbObSC_g=+oN6mxCp_OAzLVcw7nnt_iud1-p_XBdYQ9hjQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_091856_684248_0F9EEBF7 
X-CRM114-Status: GOOD (  25.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@esmil.dk, rafael@kernel.org, lpieralisi@kernel.org, cuiyunhui@bytedance.com, Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, allen-kh.cheng@mediatek.com, Dong Wei <Dong.Wei@arm.com>, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, jdelvare@suse.com, Paul Walmsley <paul.walmsley@sifive.com>, jrtc27@jrtc27.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, ron minnich <rminnich@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdWwgOCwgMjAyMyBhdCAxMjowN+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXksCj4KPiBPbiBGcmksIEp1bCAwNywgMjAyMyBhdCAxMTo1
Njo0OFBNICswODAwLCDokZvlo6vlu7ogd3JvdGU6Cj4gPiBPbiBGcmksIEp1bCA3LCAyMDIzIGF0
IDg6NTXigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gPiBPbiBGcmksIEp1bCAwNywgMjAyMyBhdCAwODowNTo0OFBNICswODAwLCDokZvlo6vl
u7ogd3JvdGU6Cj4gPiA+ID4gSGkgU3VuaWwsCj4gPiA+ID4KPiA+ID4gPiBGcm9tIFN1bmlsOgo+
ID4gPiA+IElNTywgaWYgdGhlIHF1ZXN0aW9uIGlzIGdlbmVyaWMgbGlrZSAiSXMgVUVGSSBtYW5k
YXRvcnkgZm9yIFJJU0MtVj8iLAo+ID4gPiA+IHRoZSBhbnN3ZXIgd2lsbCBiZSBzb2xpZCAibm8i
IGJlY2F1c2Ugd2UgY2FuIHVzZSBEVCB3aXRob3V0IFVFRkkuIEJ1dCBpZgo+ID4gPiA+IHlvdSBh
c2sgd2hldGhlciBVRUZJIGlzIG1hbmRhdG9yeSBmb3IgQUNQSSBzdXBwb3J0IG9uIFJJU0MtViwg
dGhlbiB0aGUKPiA+ID4gPiBhbnN3ZXIgd2lsbCBiZSAieWVzIi4KPiA+ID4gPiAtLS0tIFdoeSBV
RUZJIGlzIG1hbmRhdG9yeSBmb3IgQUNQSSBzdXBwb3J0IG9uIFJJU0MtVj8gIEFzIHdlIGtub3cs
IG9uIFg4NiwKPiA+ID4gPiBBQ1BJIHdvcmtzIHdlbGwgd2l0aG91dCBVRUZJLiBJcyB0aGVyZSBh
bnkgbGltaXRhdGlvbiBvbiBSSVNDLVYKPiA+ID4gPiBhcmNoaXRlY3R1cmU/Cj4gPiA+IFllcywg
dGhlIGxpbWl0YXRpb24gaXMgUklTQy1WIGNhbiBub3QgdXNlIElBLVBDIEJJT1MuIFBsZWFzZSBz
ZWUKPiA+ID4gc2VjdGlvbiA1LjIuNSBhbmQgMTUgaW4gQUNQSSBzcGVjLgo+ID4gPgo+ID4gPiBJ
IGRvbid0IGhhdmUgbXVjaCB0byBhZGQgdG8gQXJkJ3MgcmVhc29ucy4KPiA+ID4KPiA+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FNajFrWEZacmVuMFExOURpbXdRYUVU
Q0x6NjRENGJaUUM1QjJOPWkzU0FXSHlna1RRQG1haWwuZ21haWwuY29tLwo+ID4gPgo+Cj4gPiBJ
IGRvbid0IHRoaW5rIHRoYXQncyB0aGUgbGltaXRhdGlvbiBvbiBSSVNDLVYuIEJUVywgaG93IGRv
ZXMgT1NQTSBmaW5kIHRoZQo+ID4gUlNEUCBvbiBBUk0gc3lzdGVtcz8gRG9lcyBpdCBtZWV0IDUu
Mi41Pwo+ID4KPiA+IEhlcmUgYXJlCj4gPiAxLiBQdXJwb3NlOiBwdXJwb3NlIGlzIHRvIHByb3Zp
ZGUgYW5vdGhlciBvcHRpb24gb24gRmlybXdhcmUgU29sdXRpb247IE91cgo+ID4gcHVycG9zZSBp
cyBOT1QgdG8gYmFuIFVFRkkuCj4gPiAyLiBCb3RoIEFSTSBhbmQgUklTQy1WIHN0YXJ0cyBmcm9t
IFVCT09UIHNvbHV0aW9uLCBhbmQgdGhhdCdzIGNsb3NlIHRvCj4gPiBjb3JlYm9vdCwgc28gd2Ug
d291bGQgbGlrZSB0byBlbmFibGUgZmxleGlibGUgYW5kIHJpY2ggZWNvc3lzdGVtLgo+ID4gMy4g
V2UgZG9uJ3QgbGlrZSB0byBwdXNoIGNvcmVib290IGFuZCBVRUZJIHRvZ2V0aGVyLCBzbyB3ZSBk
b24ndCBwbGFuIHRvCj4gPiBlbmFibGUgVUVGSSBpbiBjb3JlYm9vdChtYXliZSBmcm9tIFVib290
KTsgYmVjYXVzZSB0aGF0IG1ha2VzIHRoZSBzb2x1dGlvbgo+ID4gY29tcGxleC4KPiA+IDQuIEkg
dGhpbmsgd2Ugc2hvdWxkIGZpeCB0aGUgcmVxdWVzdCBhbmQgcHJvYmxlbSwgYmFubmluZyBvciBw
cm90ZWN0aW5nCj4gPiBzb21ldGhpbmcgaXMgTk9UIHRoZSBnb2FsIG9mIHVzLgo+ID4KPiA+IEkg
dGhpbmsgdGhlIHNvbHV0aW9uIGlzIGZvciBib3RoIFJJU0MtViBhbmQgQVJNLCBhbmQgYWxzbyBp
dCB3b3JrcyBvbiBYODYKPiA+IGlmIGl0J3MgZG9uZS4KPiA+IExldCBtZSBrbm93IHdoYXQgdGhl
IHByb2JsZW0gYW5kIGltcGFjdCBpcywgcGxlYXNlLgo+Cj4gSWYgeW91IGFyZSBnb2luZyB0byBr
ZWVwIGFyZ3VpbmcgdGhpcywgcGxlYXNlIHN0b3Agc2VuZGluZyB0b3AtcG9zdGVkCj4gSFRNTCB0
byB0aGUgbWFpbGluZyBsaXN0LiBJdCBtYWtlcyBpdCBpbXBvc3NpYmxlIGZvciB0aG9zZSBub3Qg
aW4gdGhlIENDCj4gbGlzdCB0byBmb2xsb3cgYWxvbmcuCgpUaGFua3MgQ29ub3IsIEkgd2lsbCBm
b2xsb3cgdGhlIHJ1bGVzLgoKPgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
