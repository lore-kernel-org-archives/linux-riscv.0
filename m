Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E88CC6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GhsnSp2fFS6rwPGbskKcEKlzS6COEMDvKZLHgJsXP+I=; b=PaRJEmvlZNyu+LBIToRE+rR7Ce
	iInQByBm5H6A1M6MdLasoFEXjtc3mAlcIGF+ThKfF2suKiyPbrgrSGVjb4HMY47620wui4+37fx57
	9u8KvC3mXLSEgf7yr7QwlY0z8by1Cp44KPSrKdqgjIFHZtJC0dCiTCmTgstKCbNL9bezcG0VKo+8e
	zmbuHh50s4GI8r/7ZfK31c2qR9r7MBpm3L6sqgO38xIQvOdIAXZKc3Uu/QFgWvU/89ttu6s05CXhp
	j6yPBcBCH1AXHld6vHOvD2g6wnbGnVB9lj9InNK1HNSdajaRoIpwBAx7EK2axKb6craT04PB/dEcE
	JbuSUJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe4d-002PHZ-33; Tue, 07 Mar 2023 20:38:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe4Z-002PGR-AJ
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:38:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y11so15492242plg.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678221488;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4pVPIBxZFbRe+0z/TqjOeVY6TDhB8oO2WRQrTNkFoA=;
        b=q1DMy1sYMLRf2p0wOGtXVs83umwGCTmQO8Cnj5qdp0ubXnVdS+MRPQqv8NjlIUCfon
         5FYlOj9+xAnDxm2Y0PdfQbOq/+4jvsHIDQCMRsRlbSSqhJtNTAJo4MkpxdPZCKVD1/bk
         YUikrsEMhmVKAEmqoWz9wlAkNBJVYARl/BSFfQAemJhdYIspuZ1rFzCNV7zaCCG2Lgoh
         Rg2HnxDMw5KvNgbcYlKnRGUmFgz+XsM3uXAoafcfTjVumcT1OGmTCsWhUrtYL2AkSxDv
         KJM7hLMNdK4Flu2DgtPHU5JC89+yRT2v2BaKWs/Adxx2L6H1fDgn0VySwOtatZLjlNv9
         RGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678221488;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4pVPIBxZFbRe+0z/TqjOeVY6TDhB8oO2WRQrTNkFoA=;
        b=J2T36YAXQXIXuzagtBTOgoVqqkGMsN0l8B8u89FEYw5cXB/tFbQRmW2ZC2BIkuZng7
         eOpxZGqLXvyF8Xmzl+2sIaj3wG1bvEFVMvsm4HUjCxXYRf1tUASWMOz4ajKRX1SfPChn
         +Dmcx3wMHTDsgOvYebZDzarmMPO329QC4o2VVxQSLiQHty39v4OAnmhyGpk2i8Pw7X4r
         zKzPKNiQOOnGoCqvqpAfFCOj5DihAZ+43E32M6MMLstdzTqjlpOddXQaprYc7f9JtYZ1
         NjfNKRhha5dZ7RdiDkPzLrfARBFjQa2oCiMXzab1xaBa8u/6poWKTafH/R59BcKcIp8g
         zT3A==
X-Gm-Message-State: AO0yUKUroiCpJySGOJAkCx7zr17ogQxWE+/5PHMbTGrVXQ3yDP2UXJPG
	kdudeAE79BVK4fI1bB3rIRYqMlcjC5mGjX+LB6Y=
X-Google-Smtp-Source: AK7set/YAnJDsK848wNQFNbQuD+sqUmvorRYW+wtE1xYowofOaEdyRjpq9CUDGRsWfvpzNQljIkQ7w==
X-Received: by 2002:a17:902:d544:b0:19d:387:6602 with SMTP id z4-20020a170902d54400b0019d03876602mr16408416plf.58.1678221487847;
        Tue, 07 Mar 2023 12:38:07 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709029a4700b0019abb539cddsm8788148plv.10.2023.03.07.12.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:38:07 -0800 (PST)
Date: Tue, 07 Mar 2023 12:38:07 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:37:15 PST (-0800)
Subject: Re: [PATCH] RISC-V: fix taking the text_mutex twice during sifive errata patching
In-Reply-To: <7a36c00d-01ca-4f40-8786-1ed9d1599956@spud>
CC: geert@linux-m68k.org, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, zeha@debian.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-e7cce7e4-ef9b-4b9b-ae32-1ca5253e84cc@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_123811_593566_5B1C1850 
X-CRM114-Status: GOOD (  24.13  )
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

T24gVHVlLCAwNyBNYXIgMjAyMyAxMjoxNzoyMiBQU1QgKC0wODAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFR1ZSwgTWFyIDA3LCAyMDIzIGF0IDA5OjEzOjAxUE0gKzAxMDAsIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToKPj4gSGkgQ29ub3IsCj4+IAo+PiBPbiBUaHUsIE1hciAyLCAyMDIz
IGF0IDY6NDXigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+
IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+ID4KPj4g
PiBDaHJpcyBwb2ludGVkIG91dCB0aGF0IHNvbWUgYm9uZWhlYWQsICpjb3VnaCogbWUgKmNvdWdo
KiwgYWRkZWQgdHdvCj4+ID4gbXV0ZXhfbG9ja3MoKSB0byB0aGUgU2lGaXZlIGVycmF0YSBwYXRj
aGluZy4gVGhlIHNlY29uZCB3YXMgbWVhbnQgdG8KPj4gPiBoYXZlIGJlZW4gYSBtdXRleF91bmxv
Y2soKS4KPj4gPgo+PiA+IFJlcG9ydGVkLWJ5OiBDaHJpcyBIb2ZzdGFlZHRsZXIgPHplaGFAZGVi
aWFuLm9yZz4KPj4gPiBGaXhlczogOTQ5M2U2ZjNjZTAyICgiUklTQy1WOiB0YWtlIHRleHRfbXV0
ZXggZHVyaW5nIGFsdGVybmF0aXZlIHBhdGNoaW5nIikKPj4gPiBTaWduZWQtb2ZmLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+PiAKPj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQo+PiAKPj4gVGhpcyBmaXhlcyB0aGUgY3Jhc2ggSSBzZWUgKHdpdGggImVhcmx5
Y29uIGtlZXBfYm9vdGNvbiIpIG9uIFN0YXJMaWdodCwKPj4gYW5kIHdoaWNoIEkndmUganVzdCBi
aXNlY3RlZCB0byBhZm9yZW1lbnRpb25lZCBjb21taXQsIHNvCj4+IFRlc3RlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPj4gCj4+IFlvdSBtYXkgd2Fu
dCB0byBpbmNsdWRlIChhIHBhcnQgb2YpIHRoZSBjcmFzaCBsb2cgYmVsb3cgaW4geW91cgo+PiBw
YXRjaCBkZXNjcmlwdGlvbiwgdG8gbWFrZSBpdCBlYXNpZXIgZm9yIGFmZmVjdGVkIHBlb3BsZSB0
byBmaW5kCj4+IHRoZSBmaXguCj4KPiBUaGVyZSB3YXMgbm8gY3Jhc2ggbG9nIHdoZW4gQ2hyaXMg
cG9pbnRlZCBpdCBvdXQgb24gSVJDICYgSSBuZXZlciBhc2tlZAo+IGlmIHRoZXkgaGFkIGhpdCBp
dCBpbiBhIHJ1bm5pbmcgc3lzdGVtLgo+IElmIHRoZXJlJ3MgYSB2MiBmb3Igd2hhdGV2ZXIgcmVh
c29uLCBJJ2xsIGluY29ycG9yYXRlIHRoZSBzcGxhdC4KPiBBcG9sb2dpZXMgZm9yIHRoZSBpbmNv
bnZlbmllbmNlIGNhdXNlZCBieSBteSBib25laGVhZGVkbmVzcyEKPiBJJ2QgaG9wZWQgdGhhdCB0
aGlzIHdvdWxkIG1ha2UgUGFsbWVyJ3Mgc2Vjb25kIFBSLCBidXQgaXQgd2FzIG5vdCB0bwo+IGJl
IDooCgpTb3JyeSBhYm91dCB0aGF0LCB0aGVyZSB3YXMganVzdCB0b28gbXVjaCBnb2luZyBvbiBp
biB0aGUgc2Vjb25kIGhhbGYgb2YgCnRoZSBtZXJnZSB3aW5kb3cgYW5kIEkgd2FzIHRyeWluZyB0
byBkaWcgdGhyb3VnaCBzdHVmZi4gIEknZCBhY3R1YWxseSAKdGhvdWdoIHlvdSB3ZXJlIHRhbGtp
bmcgYWJvdXQgdGhlIG90aGVyIG11dGV4IHBhdGNoICh0aGUgdGV4dF9tdXRleCBvbmUpIAp3aGVu
IHlvdSBwaW5nZWQgaXQsIEkgZm9yZ290IHRoZXJlIHdlcmUgdHdvLgoKSSBqdXN0IHF1ZXVlZCB0
aGlzIHVwLCBpdCdzIHRlc3RpbmcgYnV0IEkgZG91YnQgaXQnbGwgdHJpcCBhbnl0aGluZy4gIEl0
IApzaG91bGQgYmUgaW4gZml4ZXMgc29vbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
