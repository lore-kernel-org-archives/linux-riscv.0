Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5396C61DDE
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpq85Ed0P0vexWD86GYw81/vMgMr/jEYeMyDGStMSV8=; b=xfHQYMuxceOGuB
	Uc7LX7AgcKwvOhgnbqlkD+Wog1cHp3Z5yAgrnK9DHC8GvJZdvfZaqqtmGaV09MXtbN+kMUcF9Su2P
	XjA3Ac5+Jc+VxoFsIUwDTcBKC0SBiuY+IfIBejuC50vb1l/kQytJzYzt5Kt8OPk/yhCec2k7wapvZ
	Lwf1Iju9kBKRw1wK+xMBltUWKWI1eXjPFAuUylO/rbh0rd16pXuvRYX8aA3BhHZD2tSZdLcxEMWA7
	p95BLFwZKrwT4za4S0NyA3vSE6PzIbytOL2wiKY5Zo+qV/y5P0nSxZ/+RUTr6aFg4TqyKUWhFky31
	beRAwZaFMjBW39F+CxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gNb-00000007mzV-1Jub;
	Sun, 30 Aug 2026 14:19:27 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gNY-00000007mz5-3DnP
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 14:19:25 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2422835d50.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 07:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788099563; cv=none;
        d=google.com; s=arc-20260327;
        b=hq7TNxoY3ArET4NiopmIGyj6TfiApfSPsH/8Gn4Ekrjmup1pKWRUW+gC3ZUXFvq1sp
         4f7az/aZCEzfTiwiXQr+kdAaKzif3PodaN2LRPLVmQUcrNoK0j9sQlKJVfn/+Kd7ZZWb
         Rhq26kOCYHxXloQfNoh+Hjk2yUty40erhMXzbb5qpOwZMOfoqBevNiIURV6n93DR2Iwy
         n5gLFuvcSpfIVViip9H5WAARem4YeR15akpF4TUaTIawD/FNQneyEXaCPXFQc6cJgo+j
         5ZB1MK7HKwKF18UXwMYOQfgZsiWJkcwBnGnreCw6pKP0ywDxNlhiN1jZ2THHJKuBixMY
         EPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        fh=ujmjd7S+5TC86hghtKIUOcjh4TU8YikUo7fneMLZKWw=;
        b=Wcd+vNaQpo+Gn7c6sEB73I1VOTAdA5Pw9HTToRoNYcSSqa6sCuDO3yIJnqQhupL6/q
         NI8vQ05i35gyoan+KtmtsnamNYUgjKWnrGZKNVxjh8JDgzmOsr+38zbiB/thUiWoQhQE
         N16tgilfUTgx3w5Eihocw2APJkIlm2lAfCnGn2YBWmC9/hSEG5OwuIvFEX2j9DqKxhRj
         E/PUP1N9Wlmu1smvG8VKfyMdTW8PUOsaDb1To7OJyPkIJM2fObD8RriHJk7M6BmnC5mM
         VLT2P42A2pbMTUoK4jOLkYVmZqWWAjFDwfVtkTUGYlwlzqeOZQ5v1m95OHi9BeB/F6SH
         uaNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788099563; x=1788704363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        b=dkEdyTlax64oelDDP5Vr8HVbDeiMPp/4vTbP5bBWqEZ4omhvlUaCNIpzm4D/FhU1J8
         LY20C4P3t54jZM55CXTLU68eY5WO9acQe4PA4uXDX6UI/CIdypgsKilU9lMTYPitCYXw
         OaPz1iHWERA9IJSBpSzQwxSqoiqOCoAbR17ANasGZEC758tu2ORFwUUgKoLVixh4iZvO
         /OWRNDZc98KYFNfoRahem6bwGC8O7QbKGm6imRysUXUrfLRO6c1INMEcyInh9LvVqlYA
         FA6/snXuibPm31OfsxhTEUkNg5+HPQ45/8Nm12J7//OQkNJTGtJzH5gCo/m6HEHt9K0z
         jbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788099563; x=1788704363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        b=TNCAF5sVEotvL+7eeIsW/ZciiHVuEDzQ4oVg/Mj84aCBhhnmOMyAMVaZ8JsIzKEic3
         4XrvDumOWlnfbUxyphmL6q5EBgvO5giRW7aI00Ism7OMS4H80u3Lju5OJn1bZstGKeCg
         x1ZwWuHSTAZ6UhK9IP/Raem+pYQbOa6kJilkpqkK8YYVr5m2exucEwHNjeuKlGoIomKV
         GQDwIxp4CIi8cpfYQXHlYDWCZIl+vU26qcdIWGQJ7zgQHJgU+3PIJktBmDDkawfXnB54
         RMsUGsVboaPQEVhkVF2z243VRdkYOWO3l2Hw8Q84tA43XqOIUyswt14pifB39AmGfs7B
         9Xgg==
X-Forwarded-Encrypted: i=1; AKwUvBzPdh9bgWBZx5YOrYAQQ/DWnlZ0lWUYuDjWUtmyRnH3WV5nHynwOVBh9fjL+J9Opcwc5ItJvx0QNWu4Ww==@lists.infradead.org
X-Gm-Message-State: AFuF++mCvibqpPKFEXZUzNQm9ho/IMywuR8VuJa99QUtsl7zDI4IpbAR
	S8wG7Ei2b4chDRt4HzPsD/3e2NvvxhP9/4TuPfKw9snbM+hZ9gPB/T8uLgr7kulsfMteMC7YrSl
	boKEf+liVKtpE2FWmuwfjdICY6TnZjkw=
X-Gm-Gg: AYBFou1/sejUMdPlKzi132z3IA09r+qbL4Rhzl6pxk564V98iZEC6du+WcQW5YTfXSh
	W5ScbOe1j11YOVdd42e/qyb6Mt8jv4tHpD4+5n500ACcp3kwQ9VRYkIqUw7Trkj2FFjZOebnkBx
	oey67WrtO+hQ8ObiIXjuPahnmGpZNGU7Inc12jsOTOgiDxZaIWUiB50J98vodmMR97mTG6I8uXQ
	9JrAuJyZCDNGBnNWxG01bhsiWDmhu1iistcZmKC5OvbUYOcPKHOX3NyBpp2UlRnFe8AUisxhH9C
	iN22HRARpsRrC9zyso7E7qcE0a3fDVTOkESrwUc0rFPL
X-Received: by 2002:a05:690c:e0d1:20b0:81e:ae6d:caed with SMTP id
 00721157ae682-85d6cbd5517mr53744887b3.34.1788099563185; Sun, 30 Aug 2026
 07:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com> <20260829212202.57db49ca@robin>
In-Reply-To: <20260829212202.57db49ca@robin>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 30 Aug 2026 16:19:11 +0200
X-Gm-Features: AcwNN1WNdWcyYR1PyOdxtYXwKqRQnAQhNWg1LwpDWL57H9UOvMPUEn5qfIfVDMw
Message-ID: <CALsPMBMHSMLnOzO+a3gOMzD6x-+8-8fr61MOr3GVH9_LoY_dQA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_071924_813068_FC2176E7 
X-CRM114-Status: GOOD (  14.69  )
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

T24gU3VuLCBBdWcgMzAsIDIwMjYgYXQgMzoyMuKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMjkgQXVnIDIwMjYgMTc6NDQ6MTggKzAy
MDAKPiBSb21hbiAnSGVkaW4nIFN0b3JvemhlbmtvIDxyb21ldXNtZWlzdGVyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKPiA+ICtyaXNjdl90bGJf
dHJhY2VfZmx1c2hfcGF0aChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY21hc2ssIHVuc2lnbmVkIGxv
bmcgc3RhcnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXpl
LCB1bnNpZ25lZCBsb25nIHN0cmlkZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGFzaWQsIGJvb2wgaGFzX21tLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IGVudW0gcmlzY3ZfdGxiX2ZsdXNoX3BhdGggcGF0aCkKPiA+ICt7Cj4gPiArICAgICBlbnVtIHJp
c2N2X3RsYl9mbHVzaF9zY29wZSBzY29wZTsKPiA+ICsKPiA+ICsgICAgIGlmICghdHJhY2Vfcmlz
Y3ZfdGxiX2ZsdXNoX3BhdGhfZW5hYmxlZCgpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4g
PiArCj4gPiArICAgICBzY29wZSA9IHJpc2N2X3RsYl9nZXRfZmx1c2hfc2NvcGUoc2l6ZSwgc3Ry
aWRlLCBoYXNfbW0pOwo+ID4gKyAgICAgdHJhY2VfcmlzY3ZfdGxiX2ZsdXNoX3BhdGgoc3RhcnQs
IHNpemUsIHN0cmlkZSwgYXNpZCwgaGFzX21tLCBjbWFzaywKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNjb3BlLCBwYXRoKTsKPgo+IGluc3RlYWQgb2YgdXNpbmcgdHdvIHN0
YXRpYyBjYWxscyB5b3UgY2FuIHVzZSB0aGUgbmV3Ogo+Cj4gICAgdHJhY2VfY2FsbF9fcmlzY3Zf
dGxiX2ZsdXNoX3BhdGgoKQo+Cj4gVGhhdCBpcyB0byBiZSB1c2VkIGluc3RlYWQgb2YgdGhlIHRy
YWNlXzxldmVudD4oKSBpZiBpdCdzIGJlaGluZCBhCj4gdHJhY2VfPGV2ZW50Pl9lbmFibGVkKCkg
Y2hlY2suIFRoYXQgaXMgYmVjYXVzZSB0aGUKPiB0cmFjZV9jYWxsX188ZXZlbnQ+KCkgd2lsbCBh
bHdheXMgdHJpZ2dlciB0aGUgdHJhY2UgZXZlbnQgbG9naWMgYmVjYXVzZQo+IGl0IHNob3VsZCBv
bmx5IGJlIGNhbGxlZCB3aGVuIHRoZSB0cmFjZSBldmVudCB3YXMgZW5hYmxlZC4KPgoKVGhhbmtz
LCBTdGV2ZS4gTWFrZXMgc2Vuc2UuIEknbGwgdXNlCnRyYWNlX2NhbGxfX3Jpc2N2X3RsYl9mbHVz
aF9wYXRoKCkgYWZ0ZXIgdGhlIGV4aXN0aW5nIGVuYWJsZWQgY2hlY2sgaW4KdjIuCgo+IC0tIFN0
ZXZlCj4KPgo+ID4gK30KPiA+ICsKCgoKLS0gCktpbmQgcmVnYXJkcywKUm9tYW4gU3Rvcm96aGVu
a28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
