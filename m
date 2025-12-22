Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD33D711D5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wplyz/dkgxsT7xwrM/z8AqlKsJxTBe6fZU+bowMPnYQ=; b=pOpX/96ABP7DeU
	vd8qpVMIkj8MlSvJDgnh8lVJzECNvSwshIoeP0q1xMhKpsfAHQdX+acvy+Lu7ZnSDJv+Mln4SZTou
	LAsqNlf8ZaEugp8azvMXCzZg/ahiwFYgiqkfz1zplZlS9kmY1NKlZVlStjGryEtZGslLKU7O+hTAv
	xe5i+AV6v7rZDbmMM29XQGYrydGqyFkF6TtRDIRqXbijMSWz4hO0BAioL7YpvavnGd61yrWgHoTKL
	q4kSpUzGrghCV+ApPeKWwH7ypGPLHId3w4CXoqlvSbfGD4wf8+9kRwCWKt00B7mnv2O2qrXPOxUHR
	DygXj3LCe74WMYG0g+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcCO-0000000DWGb-1Lq1;
	Mon, 22 Dec 2025 09:27:28 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcCD-0000000DWFm-3nZW
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 09:27:26 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64669a2ecb5so3155728d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 01:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766395636; x=1767000436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9JR9FWj1NW5H0iyl0VHxuC1HgCMCwXIwoDdNUbZEwk=;
        b=v2qL4B/4SMErBrR5tw08dF/nAmKuNnJdET7xp0nEEF4wwU6KChkUBBEjgCIbT5Dnqg
         w2stPabH+ysFat9MB7bveR0qWhBcQtKCsCTULItDEEkt7vGUjg2nmGCHAoabtPVCEYZ3
         NBJGfIAsduqsPjHEdXonoamvwLvzyDxjCgG6sl59zK+9V9ydZ9NOD96qp0Mvfe+lfjdN
         lFBQpAcMGcT06rfhP9jaZOPYt8aCMHWUxse3uAqWXalU1x6SmT20+jodBuJrQNCtmOR3
         uDaQUxzDKm/FnLTAfneDng6357dVwcOpRVFk9QXcKQPMOIOVJp8+6dSmLzD76qEKCOG/
         fTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395636; x=1767000436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9JR9FWj1NW5H0iyl0VHxuC1HgCMCwXIwoDdNUbZEwk=;
        b=RfZxzi9MGn0VTCD79a5cQ4oSKGvTWawSHo8LMFyKd+thrUl/2OX1L9lXO0l3b1wU9a
         resO7V6dOjLAVeQWzxKhdhDTRiuuFPS/0h/DYoiGt7E/+ELnjn2fV+PiQCgVWGHtcKpI
         BBgO2KjyA2+rdwQSErOxJ9LmB378ootp5JUeRsuAUcc8VDKrab+xDQVxletlOcA3+yia
         jR8OHrM/hpPuuIuRGgtBdC3Y4n/8Ptw0fnd6sMT+34Q1konvcE3Xy8mEZbuA1RAMq2uB
         zrHMGS0n4CB050kmRGQ4pzNhTmh1au5xU3Et43eB+NstQMRMVeItKwyZz5ffC6AVekyM
         +WlA==
X-Forwarded-Encrypted: i=1; AJvYcCWTIBqsYcKEAEPiDV7hukNDISsC6Hof8kdedsWqqwS0QKldUBoWt+H19stlyqaZlP2BhYtMfRr9WdHxIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2898ZChyPaYOwuEGH5OGuO9b5I3yPlGPis5SG9XAcKLBayKdp
	oft1V8qmBnzFESTFfdZWSpnDitY4bbMcYJT/dDpSofKY9Wc1KuC8S0Mfw+bfS401QQdw62mYN14
	/vQdRY5scpr7pODcISa+yCWRxpa8SIOxjJKkOHh+dGQ==
X-Gm-Gg: AY/fxX4wYLiT/qQ087YWoVJmwtQ9ELNuCRybpaduUSep9KiEojkIUURDuDl0Fmxd+Lm
	tZcQkA8YwswxP8LtQGzc+kntD0h6DiLQX2gt3r2Ba5XvY7xv14pLhidGja9OqRfy5zPORW5tpBM
	1UnxxBJiJOGixrdM/HQWPKgxVieK2hr8NBJufiiu5BCdPuqNoFLXZszIEDaI48yqAoM5UwYpmRZ
	TMMFgrV4SRSqDnCFjDJIMGemJloP6T8SmtIE6Wz7ctXrTh0UdofWFnEnSllb70Cd4CTx/je2/sO
	fnnUjWn9Jo+cZx8Hktps5oAKuAK2/HlqcZeE03RIM2Ix
X-Google-Smtp-Source: AGHT+IEopdaH4VEXup08bA/QV1AhBuiIpBK4mPcZpQfYrRFDnvPhOVpgLeIitUz/0ef9xzGYyIV1deEuXbqK8/M1Otw=
X-Received: by 2002:a53:d056:0:10b0:645:527b:bc25 with SMTP id
 956f58d0204a3-646632e04d3mr8907715d50.43.1766395636333; Mon, 22 Dec 2025
 01:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com> <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com> <aUYOgl8ffcJ0Xfwg@pie>
In-Reply-To: <aUYOgl8ffcJ0Xfwg@pie>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 17:27:04 +0800
X-Gm-Features: AQt7F2rD9S1VFl45xvpftmdWgFdR_R_Ul403nTlRAGDTs5jIW1Osdpar_Os9kF0
Message-ID: <CAH1PCMb7aUNt7VnYiZF=_V4nVziM-A0JpAqmU26ezwgk36=kKQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Yao Zi <me@ziyao.cc>
Cc: Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_012718_323046_8A0BDC2A 
X-CRM114-Status: GOOD (  26.24  )
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

T24gU2F0LCBEZWMgMjAsIDIwMjUgYXQgMTA6NDjigK9BTSBZYW8gWmkgPG1lQHppeWFvLmNjPiB3
cm90ZToKPgo+IE9uIEZyaSwgRGVjIDE5LCAyMDI1IGF0IDEwOjAzOjI0QU0gKzA4MDAsIEd1b2Rv
bmcgWHUgd3JvdGU6Cj4gPiBIaSwgQ29ub3IgYW5kIEhlaW5yaWNoCj4gPgo+ID4gT24gVGh1LCBE
ZWMgMTgsIDIwMjUgYXQgODo1NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgRGVjIDE3LCAyMDI1IGF0IDA5OjA3OjE0QU0gKzAx
MDAsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4gPiA+ID4gT24gMTIvMTcvMjUgMDg6MTEs
IEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gPiBTcGVjaWZpY2FsbHksIEkgbXVzdCBh
ZGhlcmUgdG8KPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgKGFuZCBjcHVzLnlhbWwgZm9yCj4gPiA+ID4gPiBwcm9wZXJ0aWVz
IGxpa2UgJ3Jpc2N2LHN2MzknIHdoaWNoIHN0YW5kcyBmb3IgdGhlIGV4dGVuc2lvbiBTdjM5KS4g
SWYgSQo+ID4gPiA+ID4gYWRkIGV4dGVuc2lvbiBzdHJpbmdzIHRoYXQgYXJlIG5vdCB5ZXQgZGVm
aW5lZCBpbiB0aGVzZSBzY2hlbWFzLCBzdWNoIGFzCj4gPiA+ID4gPiBzdXBtLCBydW5uaW5nICdt
YWtlIGR0YnNfY2hlY2sgVz0zJyBmYWlscyB3aXRoOiAnc3VwbScgaXMgbm90IG9uZSBvZgo+ID4g
PiA+ID4gWydpJywgJ20nLCAnYScsIC4uLl0sIGZvbGxvd2VkIGJ5ICJVbmV2YWx1YXRlZCBwcm9w
ZXJ0aWVzIGFyZSBub3QgYWxsb3dlZC4iCj4gPiA+ID4KPiA+ID4gPiBJZiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGlzIGluY29tcGxldGUK
PiA+ID4gPiB3aXRoIHJlc3BlY3QgdG8gcmF0aWZpZWQgZXh0ZW5zaW9ucywgSSBndWVzcyB0aGUg
cmlnaHQgYXBwcm9hY2ggaXMgdG8gYW1lbmQKPiA+ID4gPiBpdCBhbmQgbm90IHRvIGN1cnRhaWwg
dGhlIENQVSBkZXNjcmlwdGlvbi4KPiA+ID4KPiA+ID4gQWJzb2x1dGVseS4gSWYgdGhlIGNwdSBz
dXBwb3J0cyBzb21ldGhpbmcgdGhhdCBpcyBub3QgZG9jdW1lbnRlZCwgdGhlbgo+ID4gPiBwbGVh
c2UgZG9jdW1lbnQgaXQgcmF0aGVyIHRoYW4gb21pdCBmcm9tIHRoZSBkZXZpY2V0cmVlLgo+ID4K
Pgo+IC4uLgo+Cj4gPiBTdHJpY3RseSBkZXNjcmliaW5nIHRoZSBTcGFjZW1pVCBYMTAwL0szIChv
ciBhbnkgY29yZSkgYXMgUlZBMjMtY29tcGxpYW50Cj4gPiByZXF1aXJlcyBhZGRpbmcgdGhlc2Ug
ZXh0ZW5zaW9ucyB0aGF0IGFyZSBjdXJyZW50bHkgbWlzc2luZyBmcm9tCj4gPiB0aGUga2VybmVs
IGJpbmRpbmdzOgo+ID4gUlZBMjNVNjQ6IFppY2NpZiwgWmljY2Ftb2EsIFppY2Nsc20sIFphNjRy
cwo+ID4gUlZBMjNTNjQ6IFNzMXAxMywgU3NjY3B0ciwgU3N0dmVjZCwgU3N0dmFsYSwgU3Njb3Vu
dGVyZW53LCBTc3U2NHhsLAo+ID4gICAgICAgICAgIFNoYSwgU2hjb3VudGVyZW53LCBTaHZzdHZh
bGEsIFNodHZhbGEsIFNodnN0dmVjZCwgU2h2c2F0cGEsIFNoZ2F0cGEKPiA+IFBsdXMgJ1N1cG0n
LCAnWmljNjRiJywgJ1Nzc3RhdGVlbicsICdCJyB3aGVyZSB0aGUga2VybmVsIHN1cHBvcnRzIHRo
ZW0gYnV0Cj4KPiBQbGVhc2Ugbm90ZSBCIGlzIGp1c3QgdGhlIGFiYnJldmlhdGlvbiBvZiAiemJh
IiwgInpiYiIsIGFuZCAiemJzIiwgYWxsCj4gb2YgdGhlbSBoYXZlIGJlZW4gZG9jdW1lbnRlZCBp
biBleHRlbnNpb25zLnlhbWwuCj4KClllcywgWWFvIFppLiBJJ2xsIGluY2x1ZGUgJ0InIGluIG15
IG5leHQgdmVyc2lvbiwgYW5kIGFkZCB0aGUgc2NoZW1hIGNoZWNrLgpUaGFua3MuCgpCUiwKR3Vv
ZG9uZyBYdQoKPiA+IHRoZXkgYXJlIG5vdCBsaXRlcmFsbHkgZG9jdW1lbnRlZCBpbiB5YW1sLgo+
ID4KPiA+IElzIHRoaXMgYXBwcm9hY2ggYWNjZXB0YWJsZSB0byB5b3U/IElmIHNvLCBJIHdpbGwg
cHJvY2VlZCB3aXRoIHN1Ym1pdHRpbmcgdGhlbS4KPiA+Cj4gPiBUaGFuayB5b3UgdmVyeSBtdWNo
Lgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IEd1b2RvbmcgWHUKPiA+Cj4KPiBSZWdhcmRzLAo+
IFlhbyBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
