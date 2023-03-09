Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E76EC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LUFXWsoOb1iCALUGeEEk1Mi3XMY6afFnFQg1JWnKmvY=; b=0RG+sllFdsSGOrjc4XhvN9/1lH
	FYQaPXlZZEPvMwNRwYTF2F7STOg3bUIbR+WZEM64U1Y4aWoADNh0FbF4jipt7fCA1mSx51hc4bfWl
	Njwwnw2UpzrBr6htnZHaDHBeXkMBTgIJhGRGYGnsOr9Un0yjfCtrsJ1Et7Gu/jqm05qVTsjkZRskL
	AJnR6WDo3mAsJ1qjrexonjqabBecvdXoEgsRjJtN8F6CycRm+p5To8P1G0d+8FqHq/id1j4AaYXS3
	Fm/cupwlibYc20HHfj1KbidG4fR6VVjJDjJh1umks5E0lB9AxlmcAY7qEf+cjY5//eTAWhQ6csjA2
	FDecpyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paLzo-00Bge4-0q; Thu, 09 Mar 2023 19:32:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paLzj-00Bgcw-AI
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 19:32:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id y11so3144985plg.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 11:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678390323;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlMbJ8RFUjqrNZ3nyQ3UxH3pIRl6kRtnRIdmgkJcEJU=;
        b=dGwrQCXfmXHVpty9DfuY6vuVeC+fUW29D5SVOs5Qn2qZmiOZHtiqt2IbTfDZVgp8cR
         24eVwxbOfjDMI36IcW+DwNypZChUZGOZwamdEAkqAzlYdz205bzwIUMTAegLK5N3SDF3
         QNe42QKdIiByZvS9cEJEZgk/R2tVtnewn7Mk80K6ncmAdOE2xIlNqOD/Gti/187aYatH
         XEYPd4dUDwdgl3ywvWf/gZv+9SAAT8iE5EYDzuubz+wjJwSdImHQPFj9LL87CxuMRiNg
         s+1re28ikCD7xxABQRkjCBfILRXbFyIOxfH1ycRfatrkQtS1WXEcQ1dJcfGh7E6wpUMw
         B9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678390323;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlMbJ8RFUjqrNZ3nyQ3UxH3pIRl6kRtnRIdmgkJcEJU=;
        b=pbDl5sliQ6XoqthoQ6sk753cR3s2tlFAmz1nhd6+NRdPak3J2g8iUI05KUMVRcP5nw
         eTd9LJw2Kr4C3lToQtRni34Zvx6He3UY2ACHfPvcMVt7Vl7cs0SJtmk+zaytwzt/yCTa
         9jWTHtpY+zyLkdhM3lWUqGaYZls4u6msRO21rs+QkTogmhjpZ9S/SqC7CQMDEgBh4Lxa
         FOt9K17mRbY9fC3MMvxCkfUJ5ylozkaNx8AoXCM6WWZRgIlziTn/+FHRCy5mk9NRDnhP
         jwwqYQ62PfKjAKJ+GHNWq+Mg3UHEeOBcBwOEgb9J3l7XTSHHI/XhiO1RtGP4BTdSFleW
         2VPQ==
X-Gm-Message-State: AO0yUKUc70n8QDSso6vOKbR6R2MUuO9yO4LjxDP4MW/BDXwcDgJtHfUs
	vzOXWgaMJsT3Q5rKEbo3KL3FTQ==
X-Google-Smtp-Source: AK7set/Bw35pT/jjTQF3n73tY439qRrS10p0cjFW8L2W8KJUM41sEW/vQaXrR9/mwQZZvNmKbGEQFQ==
X-Received: by 2002:a17:902:e752:b0:19e:748c:d419 with SMTP id p18-20020a170902e75200b0019e748cd419mr27236838plf.46.1678390322967;
        Thu, 09 Mar 2023 11:32:02 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id lh6-20020a170903290600b0019b0b6a1d5bsm17185plb.273.2023.03.09.11.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 11:32:02 -0800 (PST)
Date: Thu, 09 Mar 2023 11:32:02 -0800 (PST)
X-Google-Original-Date: Thu, 09 Mar 2023 11:31:13 PST (-0800)
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on clock driver
In-Reply-To: <CAJM55Z_HGt3iu=trv0v_VzyO3NkVo+aiEaT9vxRURz-MvrbCOg@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, hal.feng@starfivetech.com,
  linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, sboyd@kernel.org,
  mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ben.dooks@sifive.com, daniel.lezcano@linaro.org,
  tglx@linutronix.de, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emil.renner.berthing@canonical.com
Message-ID: <mhng-2dfa0262-dc88-4256-bce9-d7d9bfbd2ba9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_113207_602418_450ED303 
X-CRM114-Status: GOOD (  29.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwOSBNYXIgMjAyMyAxMDoxOTowNiBQU1QgKC0wODAwKSwgZW1pbC5yZW5uZXIuYmVy
dGhpbmdAY2Fub25pY2FsLmNvbSB3cm90ZToKPiBPbiBUaHUsIDkgTWFyIDIwMjMgYXQgMTk6MTEs
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgTWFy
IDA5LCAyMDIzIGF0IDAzOjA2OjEzUE0gKzAxMDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3Rl
Ogo+PiA+ICBPbiBUaHUsIDkgTWFyIDIwMjMgYXQgMTA6NDQsIEhhbCBGZW5nIDxoYWwuZmVuZ0Bz
dGFyZml2ZXRlY2guY29tPiB3cm90ZToKPj4KPj4gPiA+IFRoZSBBT04gY2xvY2sgZHJpdmVyIHBy
b3ZpZGVzIGNsb2NrcyBmb3IgZ21hYzAgd2hpY2ggaXMgdXNlZCBmcmVxdWVudGx5Lgo+PiA+ID4g
U28gSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlIGNvbnZlbmllbnQgaWYgd2Ugc2V0ICJkZWZhdWx0
IHkiIGhlcmUuCj4+Cj4+ID4gWW91J3JlIHJpZ2h0IHRoYXQgaWYgd2UgZGVmYXVsdCB5IGZvciB0
aGUgZXRoZXJuZXQgZHJpdmVyIHRoZW4gdGhlIGFvbgo+PiA+IGNsb2NrL3Jlc2V0IHNob3VsZCBh
bHNvIGRlZmF1bHQgeS4gUGVyc29uYWxseSBJIGRvbid0IHRoaW5rIHdlIHNob3VsZAo+PiA+IGRl
ZmF1bHQgeSBmb3IgZXZlcnkgZXRoZXJuZXQgZHJpdmVyIHRoYXQgbWlnaHQgYmUgdXNlZCBvbiBz
b21lCj4+ID4gc3VwcG9ydGVkIHJpc2MtdiBwbGF0Zm9ybSwgYnV0IEkgc2VlIG5vdyB0aGF0Cj4+
ID4gYXJjaC9yaXNjdi9jb25maWcvZGVmY29uZmlnIGFscmVhZHkgY29udGFpbnMgQ09ORklHX01B
Q0I9eSwKPj4gPiBDT05GSUdfRTEwMDBFPXksIENPTkZJR19SODE2OT15IGFuZCBDT05GSUdfTUlD
Uk9TRU1JX1BIWT15LCBzbyBtYXliZQo+PiA+IEknbSB3cm9uZyBvciBqdXN0IHRvbyBsYXRlLgo+
Pgo+PiBUaGUgZGVmY29uZmlnIHJlYWxseSBuZWVkcyBhIGdvb2QgYml0IG9mIGNsZWFudXAgKG9u
ZSBvZiB0aGUgbWFueSB0aGluZ3MKPj4gdGhhdCBJIGFtIHRlbGxpbmcgbXlzZWxmIEkgd2lsbCBk
byBhcyBwYXJ0IG9mIGtjb25maWcuc29jcyBjbGVhbnVwKS4KPj4KPj4gdy5yLnQgZGVmY29uZmln
IFBhbG1lciBzYWlkIGl0IHByZXR0eSB3ZWxsIGVhcmxpZXIgb24gSVJDOiAiZGVmY29uZmlnCj4+
IHNob3VsZCBiZSB1c2VmdWwgZm9yIGtlcm5lbCBkZXZzLCB3aGljaCBtZWFucyBpdCBzaG91bGQg
Ym9vdCBvbiB0aGUKPj4gY29tbW9uIGRldiBib2FyZHMiLgo+Pgo+PiBJTU8sIHRoYXQgbWVhbnMg
ZW5vdWdoIHRvIGJvb3QgYW4gaW5pdHJhbWZzIGFuZCBwb2tlIHRoZSB0aGluZyB0byBzZWUKPj4g
dGhhdCBpdCBpcyBhbGl2ZSwgc286IGV0aGVybmV0ICYgc2VyaWFsLCBhbmQgdGhlIGNsb2Nrcy9y
ZXNldHMvcGluY3RybAo+PiBzdHVmZiByZXF1aXJlZCB0byBnZXQgdGhvc2UgZ29pbmcgY2FuIGFs
bCBiZSBzZXQgdG8geSBpbiBkZWZjb25maWcuCj4+Cj4+IEluIHRoZSBkcml2ZXIgS2NvbmZpZyBl
bnRyaWVzLCB0byBtZSwgaXQncyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUuCj4+IEkgZ3Vlc3MsIGFu
c3dlciB0aGUgcXVlc3Rpb24gIldpbGwgeW91ciBjdXN0b21lcidzIGJvYXJkIGdldCB0byB0aGUK
Pj4gcG9pbnQgd2hlcmUgaXQgY2FuIGxvYWQgYSBtb2R1bGUgaXRob3V0IGJ1aWxkaW5nIHRoaXMg
aW50byB0aGUga2VybmVsPyIuCj4+IElmIHRoZSBhbnN3ZXIgdG8gdGhhdCBxdWVzdGlvbiBpcyB5
ZXMsIHRoZW4gZG9uJ3QgbWFrZSBpdCBkZWZhdWx0IHkuCj4+Cj4+IFRoYXQncyBteSDigqwwLjAy
IQo+Cj4gQ29vbC4gRGVmYXVsdGluZyB0byBtIGluIHRoZSBLY29uZmlnIGZvciBhbnl0aGluZyB0
aGF0IGNhbiBiZSBsb2FkZWQKPiBsYXRlciBpcyBleGFjdGx5IHdoYXQgSSB3YXMgdHJ5aW5nIHRv
IHNheSwgZXhjZXB0IEkgbWl4ZWQgaW4gdGhlCj4gZGVmY29uZmlnIGZvciBubyBnb29kIHJlYXNv
bi4gVGhhdCBtZWFucyBib3RoIHRoZSBhb24gY2xvY2tzIGFuZAo+IGR3bWFjLXN0YXJmaXZlIHNo
b3VsZCBkZWZhdWx0IHRvIG0gaW4gS2NvbmZpZy4gVGhlIEpINzExMCAoVmlzaW9uRml2ZQo+IDIp
IGJvb3RzIGp1c3QgZmluZSBsaWtlIHRoYXQgYW5kIGJyaW5ncyB1cCBhb24gY2xvY2tzIGFuZCBl
dGhlcm5ldAo+IGFmdGVyIGxvYWRpbmcgdGhlIG1vZHVsZXMuCgpUaGF0IHNlZW1zIHByZXR0eSBy
ZWFzb25hYmxlIHRvIG1lLiAgSXQncyBub3QgbGlrZSBkZWZjb25maWcgb3IgS2NvbmZpZyAKZGVm
YXVsdHMgb3Igd2hhdGV2ZXIgYXJlIHRoZSBvbmx5IHRoaW5ncyB3ZSdyZSBnb2luZyB0byB0ZXN0
LCBidXQgaXQncyAKd2F5IGVhc2llciBmb3IgZm9sa3MgdHJ5aW5nIHBva2UgYXJvdW5kIHdpdGgg
dGhlc2UgZGV2IGJvYXJkcyBpZiB0aGV5IApib290IGRlZmNvbmZpZy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
