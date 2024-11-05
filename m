Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB03AD1CA26
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKqQtQVdUGK5DE+99w/jNiDaFv9PPW0N6sxhcGv/6fc=; b=Vt8ADMjAwwfuQ5
	rtylT6Vca79NaC0lB0xIGfUih+K36JhJBUn/VZDTi05VKvAHjPl3mHEkasX3LwRW3JbbfmOnP9dqF
	28Se9lqKwndn4n5+rox0Ng67HZVvjxob0WjzhRZ3y8ayrwGYtfYkjXkuCrfGt25HuZ66t8zJCXy0a
	snxog7QG7G3Pn9cFdz6u1hzcJ2xEy1BejmFdAmDX8V4J1OGT7LVrUWnhfTXXe9ZqyXReLMZWIIKcY
	YIW5Kw/mJlWi8X4uM5wvwEa+9tEI0nYHoujf5CFOFUrZjHg0C7gAmFTC8nh9cYnYqDhCR354JcUeK
	1cjd9WgM4vjdbRGpyFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BrA-0000000FvDN-1Zrh;
	Tue, 05 Nov 2024 05:11:56 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Br7-0000000FvCf-3njP
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 05:11:55 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a6c1cfcb91so10146395ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 21:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1730783512; x=1731388312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l5esNem8PBBNIAd06UP9heND5ENpGUkBH0v3nolocY=;
        b=bhgDsnIuYp3kcB1yHURG66g901POAKqGFYh+suMTAT/zW1c6OJZjvaeGQGYYKX5RTC
         AXfd0FGyFe4bqcoQ51HZkPZRvjMCnEWlqz+eBn44CCaaFNszsN1EfAroQ8mAJCn3ptp4
         aRZuEBhW3z0oAXcPX8dhz3K+KEyl8jJMJiP9UffiUwRwGnPPYfdGa7xxqjQ9nOs7zBz+
         sujz1Ulb2TIJOOyChMbPW0Tk9QLCXEXaZQb+zleXA8Gl7Pd5bhdf/T+127566PuQXWgF
         CYci/g7yipARmEjY0M/1j3yYeNyJIaPkSb6GUUHQiNXwdMmyoFLX/Kx2wd3r9nWmGpHr
         rEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730783512; x=1731388312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8l5esNem8PBBNIAd06UP9heND5ENpGUkBH0v3nolocY=;
        b=Zd41Wx3vsFC+T5TnI2DEqtEGmSkD1Q48AhxGOj1c8zD+VjZUa4Gm9Qftv4TKUtNP8L
         Rb80V1NxeKXRy0/dfG3HB9+gm25goNTVi3MK3YiI3zGGg3w/nOpImvCQPZtidBH5S9bQ
         xko620dFqLDXU1gb8BtlWCY6BFQQwT8uPAzJlCacbiEyD6q8fZRybcfUQT6mLcJln1XM
         2F+flPGLepR5fiStNmyOPoNGaX8hOqJVV/4XIWDzwpZfWVd4gkE0HFQuv2dn+l9I15hW
         KYeAad7TPi5an03k9vwULd6u/QVo56mSGRD4QcH3paPNqF619v4aa78w0Eg0zLEXiQwS
         RHRg==
X-Forwarded-Encrypted: i=1; AJvYcCWf16XFSrO33La7EimkQ7MzSHixYkDUgDuJ1A7wN5p/avRP8rAUb5gWF4XXfjTzb4zOSfMjaaGJJC/auQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaIWaVobgLoKXCJRByWQWKP6FPrQv3iLFnOuXmnnh0gmoZn94I
	Z6Jtn9hfa/FNsPYkIobzVdC6Jjc2lRPAcjIxfwUx/SfO1NkD/N857kbkbVYUhvV+OTQV5BmnuCT
	nIV03u0YKufspMqcJy8l1Gd7QPaqpUGgIGvgJSQ==
X-Google-Smtp-Source: AGHT+IGEudYnCi3xjKq3yQuyp0LPEhZYmxUddO6fuja49PgBoSWrtEJM9MPf9ivcp3qpb4s6OoJ/iT+dNNtaTMkeEdw=
X-Received: by 2002:a05:6e02:3f83:b0:3a6:c320:7ed with SMTP id
 e9e14a558f8ab-3a6c3200a55mr86555625ab.10.1730783512341; Mon, 04 Nov 2024
 21:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20241029085542.30541-1-yongxuan.wang@sifive.com>
In-Reply-To: <20241029085542.30541-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Nov 2024 10:41:41 +0530
Message-ID: <CAAhSdy022PTmMZ90OxRxSOiR9nKept+tKVj8XrqbekkM209eYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_211154_165844_061E077E 
X-CRM114-Status: GOOD (  20.55  )
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

T24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMjoyNeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSW4gdGhlIHNlY3Rpb24gIjQuNyBQcmVjaXNl
IGVmZmVjdHMgb24gaW50ZXJydXB0LXBlbmRpbmcgYml0cyIKPiBvZiB0aGUgUklTQy1WIEFJQSBz
cGVjaWZpY2F0aW9uIGRlZmluZXMgdGhhdDoKPgo+ICJJZiB0aGUgc291cmNlIG1vZGUgaXMgTGV2
ZWwxIG9yIExldmVsMCBhbmQgdGhlIGludGVycnVwdCBkb21haW4KPiBpcyBjb25maWd1cmVkIGlu
IE1TSSBkZWxpdmVyeSBtb2RlIChkb21haW5jZmcuRE0gPSAxKToKPiBUaGUgcGVuZGluZyBiaXQg
aXMgY2xlYXJlZCB3aGVuZXZlciB0aGUgcmVjdGlmaWVkIGlucHV0IHZhbHVlIGlzCj4gbG93LCB3
aGVuIHRoZSBpbnRlcnJ1cHQgaXMgZm9yd2FyZGVkIGJ5IE1TSSwgb3IgYnkgYSByZWxldmFudAo+
IHdyaXRlIHRvIGFuIGluX2NscmlwIHJlZ2lzdGVyIG9yIHRvIGNscmlwbnVtLiIKPgo+IFVwZGF0
ZSB0aGUgYXBsaWNfd3JpdGVfcGVuZGluZygpIHRvIG1hdGNoIHRoZSBzcGVjLgo+Cj4gRml4ZXM6
IGQ4ZGQ5ZjExM2UxNiAoIlJJU0MtVjogS1ZNOiBGaXggQVBMSUMgc2V0aXBudW1fbGUvYmUgd3Jp
dGUgZW11bGF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4u
d2FuZ0BzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hl
bkBzaWZpdmUuY29tPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTMu
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gdjI7Cj4gLSBhZGQgZml4ZXMgdGFnIChBbnVwKQo+IC0g
Zm9sbG93IHRoZSBzdWdnZXN0aW9uIGZyb20gQW51cAo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9h
aWFfYXBsaWMuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYyBi
L2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4gaW5kZXggZGE2ZmYxYmFkZTBkLi5mNTlkMWMw
YzhjNDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IEBAIC0xNDMsNyArMTQzLDcgQEAgc3RhdGljIHZv
aWQgYXBsaWNfd3JpdGVfcGVuZGluZyhzdHJ1Y3QgYXBsaWMgKmFwbGljLCB1MzIgaXJxLCBib29s
IHBlbmRpbmcpCj4gICAgICAgICBpZiAoc20gPT0gQVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0hJ
R0ggfHwKPiAgICAgICAgICAgICBzbSA9PSBBUExJQ19TT1VSQ0VDRkdfU01fTEVWRUxfTE9XKSB7
Cj4gICAgICAgICAgICAgICAgIGlmICghcGVuZGluZykKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIHNraXBfd3JpdGVfcGVuZGluZzsKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG5vc2tpcF93cml0ZV9wZW5kaW5nOwo+ICAgICAgICAgICAgICAgICBpZiAoKGlycWQtPnN0YXRl
ICYgQVBMSUNfSVJRX1NUQVRFX0lOUFVUKSAmJgo+ICAgICAgICAgICAgICAgICAgICAgc20gPT0g
QVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0xPVykKPiAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIHNraXBfd3JpdGVfcGVuZGluZzsKPiBAQCAtMTUyLDYgKzE1Miw3IEBAIHN0YXRpYyB2b2lk
IGFwbGljX3dyaXRlX3BlbmRpbmcoc3RydWN0IGFwbGljICphcGxpYywgdTMyIGlycSwgYm9vbCBw
ZW5kaW5nKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gc2tpcF93cml0ZV9wZW5kaW5n
Owo+ICAgICAgICAgfQo+Cj4gK25vc2tpcF93cml0ZV9wZW5kaW5nOgo+ICAgICAgICAgaWYgKHBl
bmRpbmcpCj4gICAgICAgICAgICAgICAgIGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9Q
RU5ESU5HOwo+ICAgICAgICAgZWxzZQo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
