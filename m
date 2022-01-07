Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F900C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLEsfT7cM1aJLLN5QtwkXxxGSJCamQ5EhoMF6ml1cIs=; b=Ypmnr4a3nKUJhh
	dPFyPISzXlXRbHeMSWO9y6WmTvkQ1QGtdPaWhRTZAnVOWUCJ4eS2QtuylRCwLaEOsQ1mUiGIHTHo0
	18dSXXBCQQOwv9CjLZNmULUZupI5jyu6/8vSh14W9/8n4htcQnU8K0EkaKec1rg/TigIMcq2+Eex2
	tiwBql6Yb+BPHylqoemntjK9/oHpyRi/qwkWxhIpWcoDLczNxNdy2IUb2sTd6S2e4UZX02oCaIc+6
	zxWkoYNdKeqwZHPEGMZxCjIV7Dx6A7d8jBVTtHnPmBqlmRasbR9qa6mAnDuOUpCa/1JpImHprDMGg
	hE12E6OiBR44udG37fEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5lCC-002zva-Qi; Fri, 07 Jan 2022 09:06:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5lCA-002zuM-GC
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 09:05:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u13so13171970lff.12
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rWfVPaOXlttmkAnqDO5xiEwBAZSXcfEI3Fk7/LgIeBQ=;
 b=WMEWvvB+eu+TpWmqZ+1LqwtcFqJJfkG/f5KGdFktartz+GRVCazHr3UukUAzIcHQx5
 Cvl1xx8J8ItemuiGgLFYHkg4k2OE17xymjvHtZJbs+XdWHr4MCXFPqpLxkQOHW2noaOM
 AlABV72ht3q+LI4bw+mMuZyCrjToCaOF5Tbb+19L9Or93k/XDXh8g9qjkEChkO6SM8Qb
 qd3TZBGMM7givZYc11g2qf08PDt+YcKvGZWdTRayttyCXJsiMBlelRfOs5UY2HHUTAaT
 WdxN6L+mIgRXzN1gUx//M0LrEm4yMXaAj6SEKGNlzu8+QR6QOzp/nzE26bcVZMkv5mzJ
 Tzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rWfVPaOXlttmkAnqDO5xiEwBAZSXcfEI3Fk7/LgIeBQ=;
 b=7lUm/gc2D+JcvyuQC+P5TIkgM1IHZRDJ7xVrD9zhZgwH6QU0qWLfF+8aPivJgFTgpE
 P5QI9Ep/5EjBw50iFqTqHS3HCxz6r3VDMnYUmWRudk6rS9VxuQO9PbmBjKoDK5hFQ65J
 CdTt9ePeAjpqj14k1DmiipAQJbjZRIkxah00kVImGhr5sVDQQ2QB+U3zFr+gV8qRhksT
 +QH+X5/aKjqpRlB6TZdgCPbLcSO9c3kAyT5AQUjz3MZeQjVvGDkrbulQuAeMOm9PgF3i
 TcPvURUO0VfZA/FQ13WvgQUm/QJmXOjZRfprKolw5yiTGpYxc5DYCbdIXh70dzcHNoah
 31Mw==
X-Gm-Message-State: AOAM531SiEXCnLDdBHD3qG9rjOh5f6KEteYMmmFWUEHUQJlBADLtIKFQ
 fY4m8txNkyYodaCMfLDB+GI6Puga7C8pPEK3xq8eRw==
X-Google-Smtp-Source: ABdhPJx+zCx8fuW1g/G9qrXfZqnFLDa/z/ojGkcpJJwtkBwqV1hzJYS0oOObDvwb22hWaTUa6BiBQct3lat5XiekI0Y=
X-Received: by 2002:a2e:5756:: with SMTP id r22mr50324919ljd.71.1641546353703; 
 Fri, 07 Jan 2022 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
 <20220107002135.B6397C36AE0@smtp.kernel.org>
In-Reply-To: <20220107002135.B6397C36AE0@smtp.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 7 Jan 2022 17:05:43 +0800
Message-ID: <CANXhq0rNDZ2b70mRtZ83STkYpzfBaErxzvUPkCVd_ZWEU5NvMw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: sifive: Fix W=1 kernel build warning
To: Stephen Boyd <sboyd@kernel.org>
Cc: lee.jones@linaro.org, linux-clk <linux-clk@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_010558_635986_423E248E 
X-CRM114-Status: GOOD (  16.06  )
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

T24gRnJpLCBKYW4gNywgMjAyMiBhdCA4OjIxIEFNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBRdW90aW5nIFpvbmcgTGkgKDIwMjItMDEtMDUgMjE6NTg6MjgpCj4g
PiBUaGlzIGNvbW1pdCByZXZlcnRzIGNvbW1pdCA0ODdkYzdiYjZhMGMgKCJjbGs6IHNpZml2ZTog
ZnU1NDAtcHJjaToKPiA+IERlY2xhcmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19m
dTU0MCcgd2hlcmUgaXQncyB1c2VkIikuCj4gPiBGb3IgZml4aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKSBhYm91dCDigJhwcmNpX2Nsa19mdTU0MOKAmSBkZWZpbmVkCj4gPiBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0sIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhl
IEMgZmlsZQo+ID4gb2YgZnU1NDAgYW5kIGZ1NzQwIGRvZXNuJ3QgdXNlIHRoZXNlIHZhcmlhYmxl
cywgYnV0IHRoZXkgaW5jbHVkZXMgdGhlCj4gPiBoZWFkZXIgZmlsZXMuIFdlIGNvdWxkIHJlZmlu
ZSB0aGUgY29kZSBieSBtb3ZpbmcgdGhlIGRlZmluaXRpb24gb2YgdGhlc2UKPiA+IHZhcmlhYmxl
cyBpbnRvIGZ1NTQwIGFuZCBmdTc0MCBpbXBsZW1lbnRhdGlvbiByZXNwZWN0aXZlbHkgaW5zdGVh
ZCBvZgo+ID4gY29tbW9uIGNvcmUgY29kZSwgdGhlbiB3ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSB0
aGUgU29Dcy1kZXBlbmRlbnQgZGF0YQo+ID4gaW4gdGhlaXIgb3duIGltcGxlbWVudGF0aW9uLgo+
ID4KPiA+IENoYW5nZWQgaW4gdjM6Cj4gPiAgLSBSZWJhc2Ugb24gdjUuMTYtcmM4Cj4gPiAgLSBB
ZGQgZml4ZXMgdGFnCj4KPiBXaGVyZT8KPgoKT29wcywgSSBtZXNzZWQgdXAgb24gbXkgbG9jYWwg
ZW5kLiBQbGVhc2UgYWxsb3cgbWUgdG8gcmVzZW5kIHRoZSB2MyBhZ2Fpbi4KCj4gPgo+ID4gQ2hh
bmdlZCBpbiB2MjoKPiA+ICAtIE1vdmUgZGVmaW5pdGlvbiBvZiB2YXJpYWJsZSB0byBDIGZpbGUg
ZnJvbSBoZWFkZXIKPgo+IFBsZWFzZSByZW1vdmUgdGhlIGNoYW5nZWxvZyBieSBwdXR0aW5nIGl0
IGJlbG93IHRoZSB0cmlwbGUgZGFzaC4KPgoKVGhhbmtzIGZvciB5b3VyIHRpcHMuCgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmMgIHwgIDYgKysrKystCj4gPiAgZHJpdmVy
cy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaCAgfCAgNiArLS0tLS0KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
