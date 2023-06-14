Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DD8EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/n2BvzFJpNXgd0hBw4ZLlY8mV/DivKlfLP9x812axI=; b=yhiL4K9t7qehoh
	bGxYPVB6ZhSQas884MDuEZx4J6Isele1LTM0etZhIDWL3gtXMrRX3bkmcb3ssE3h61SNpc1aA9Xpe
	JJYFK0uc8Wgfwvht5jDC1iIy0TXvMnsWH8xV0/Z0T2E++oj0/ws/YeWWGqeDQG/IgdNGOPkQdXqH/
	lgjSOS2Mv1E/5mGS9TBUroH/ESjcfnTQbkC7pC3BOLJvt/ruPouOwEusE3Zq9XjFwEcPB4e2MJXzR
	yS5WO9fWr76rQ3cHQi0y/TRtUuVLJlQ5Wjf7x02uDm1hag5mAzTYkPzJjrv6R7JfkpKfzmpQfTgwY
	X2xk7QXgSYNg0DEtOZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ThF-00CGAE-2C;
	Wed, 14 Jun 2023 16:50:13 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ThB-00CG8A-1N
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 16:50:11 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f86a7f3a65so21519461cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686761406; x=1689353406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Xh6X95qQ4DKgCGH6vSh1zNOD+c5n9iWRwnQijGvBds=;
        b=dsskxX9aeYFjsrOcIx3DHDQpEY4ERJCKdwVqYZCSpgugbUzHGvRMkohghaw4/+u8Wy
         wcvIylrAGJmwAq/pVQUec7zDf/W41hOfu805hrZGAp1J2PDCKQOapMj/YEqVrF8MBicr
         OAEI+IV+qixaozNZGYSaH1Y5uF85sBn6W2AzMPJ6er4nKcP+RwiOuRs5VYOXaqUhFWUs
         7Kawvn2xj3fhcTXWZ8lLQrdqKk818nnwDp9OaprO2/kXgC3sWv6i14DRZeSuQ1p4mf4w
         2K+CFzY3gKpZIHeJDGQsz4fBXVzUIZkLfpdWGVZ8w/mP5vqAzZsW2zFFrbpkiR19z+V/
         K4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761406; x=1689353406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xh6X95qQ4DKgCGH6vSh1zNOD+c5n9iWRwnQijGvBds=;
        b=Uawp6KZp9sm52kix6yc2vnVHIalMQJRhumHSjhHw9bRLoXxVKDNPeUO9oMdWdmbfko
         cP43942iCgAF/lty8O4f1jEboJIbSzkZo1xLFejuqJqiKdIPlltU2WuEZW9QpVw4/GaV
         cBZIvBkH+cAmhboGOabER9rXNCylydWbcUulq2BmOrGvyoM14QsqS0NYNrDJIHNEQ5JI
         GCRCjFQd09JR4M2KDdrnN7Iy8tKeGmC8DtFqE+kc3cmqRwq2s06V9uAtvrklTnY+1kTW
         VbuNQd1Rvr4GPpeaVSYecUwa/blXqxKrS+PYqMNdRjgQWE0lS3iqbBawcqYLM57j2Is/
         EOeQ==
X-Gm-Message-State: AC+VfDzNVOfGAYf27fcCitb9BTGcDHyskQzS0cBuw64W0xC/1hVjAxAB
	YfSf6nmG77Q49jqmTId2QSCZMA==
X-Google-Smtp-Source: ACHHUZ66gdwAQVn8ETVVjnmelI9LapHpISswaU4wiKmZDwt9r7b0rzQ0VjaameNq5XrIkQhgzt3XBg==
X-Received: by 2002:a05:622a:354:b0:3f8:4905:9533 with SMTP id r20-20020a05622a035400b003f849059533mr2381471qtw.50.1686761406694;
        Wed, 14 Jun 2023 09:50:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id bb6-20020a05622a1b0600b003e1cf472b17sm4236320qtb.97.2023.06.14.09.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:50:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q9Th6-005A4Q-Ov;
	Wed, 14 Jun 2023 13:50:04 -0300
Date: Wed, 14 Jun 2023 13:50:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	iommu@lists.linux.dev, Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH v4 06/10] irqchip/riscv-imsic: Improve IOMMU DMA support
Message-ID: <ZInvvMZvrP4U/LL+@ziepe.ca>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-7-apatel@ventanamicro.com>
 <ZInSqC6b7RPD1nzX@ziepe.ca>
 <CAK9=C2XBObBGh2R2pxVgM0E1gFPBn4m7DKzoTxEmDdZ9V1QLrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XBObBGh2R2pxVgM0E1gFPBn4m7DKzoTxEmDdZ9V1QLrA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_095009_765134_7D6C42A5 
X-CRM114-Status: GOOD (  27.86  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMDk6NDc6NTNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEp1biAxNCwgMjAyMyBhdCA4OjE24oCvUE0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDA5OjA0
OjExUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+IFdlIGhhdmUgYSBzZXBhcmF0ZSBS
SVNDLVYgSU1TSUMgTVNJIGFkZHJlc3MgZm9yIGVhY2ggQ1BVIHNvIGNoYW5naW5nCj4gPiA+IE1T
SSAob3IgSVJRKSBhZmZpbml0eSByZXN1bHRzIGluIHJlLXByb2dyYW1taW5nIG9mIE1TSSBhZGRy
ZXNzIGluCj4gPiA+IHRoZSBQQ0llIChvciBwbGF0Zm9ybSkgZGV2aWNlLgo+ID4gPgo+ID4gPiBD
dXJyZW50bHksIHRoZSBpb21tdV9kbWFfcHJlcGFyZV9tc2koKSBpcyBjYWxsZWQgb25seSBvbmNl
IGF0IHRoZQo+ID4gPiB0aW1lIG9mIElSUSBhbGxvY2F0aW9uIHNvIElPTU1VIERNQSBkb21haW4g
d2lsbCBvbmx5IGhhdmUgbWFwcGluZwo+ID4gPiBmb3Igb25lIE1TSSBwYWdlLiBUaGlzIG1lYW5z
IGlvbW11X2RtYV9jb21wb3NlX21zaV9tc2coKSBjYWxsZWQKPiA+ID4gYnkgaW1zaWNfaXJxX2Nv
bXBvc2VfbXNpX21zZygpIHdpbGwgYWx3YXlzIHVzZSB0aGUgc2FtZSBNU0kgcGFnZQo+ID4gPiBp
cnJlc3BlY3RpdmUgdG8gdGFyZ2V0IENQVSBNU0kgYWRkcmVzcy4gSW4gb3RoZXIgd29yZHMsIGNo
YW5naW5nCj4gPiA+IE1TSSAob3IgSVJRKSBhZmZpbml0eSBmb3IgZGV2aWNlIHVzaW5nIElPTU1V
IERNQSBkb21haW4gd2lsbCBub3QKPiA+ID4gd29yay4KPiA+Cj4gPiBZb3UgZGlkbid0IGFuc3dl
ciBteSBxdWVzdGlvbiBmcm9tIGxhc3QgdGltZSAtIHRoZXJlIHNlZW1zIHRvIGJlIG5vCj4gPiBp
b21tdSBkcml2ZXIgaGVyZSBzbyB3aHkgYXJlIHlvdSBtZXNzaW5nIHdpdGggaW9tbXVfZG1hX3By
ZXBhcmVfbXNpKCk/Cj4gPgo+ID4gVGhpcyBwYXRoIGlzIG9ubHkgZm9yIHBsYXRmb3JtcyB0aGF0
IGhhdmUgSU9NTVUgZHJpdmVycyB0aGF0IHRyYW5zbGF0ZQo+ID4gdGhlIE1TSSB3aW5kb3cuIFlv
dSBzaG91bGQgYWRkIHRoaXMgY29kZSB0byBsaW5rIHRoZSBpbnRlcnJ1cHQKPiA+IGNvbnRyb2xs
ZXIgdG8gdGhlIGlvbW11IGRyaXZlciB3aGVuIHlvdSBpbnRyb2R1Y2UgdGhlIGlvbW11IGRyaXZl
ciwKPiA+IG5vdCBpbiB0aGlzIHNlcmllcz8KPiA+Cj4gPiBBbmQsIGFzIEkgc2FpZCBiZWZvcmUs
IEknZCBsaWtlIHRvIE5PVCBzZWUgbmV3IHVzZXJzIG9mCj4gPiBpb21tdV9kbWFfcHJlcGFyZV9t
c2koKSBzaW5jZSBpdCBpcyBhIHZlcnkgcHJvYmxlbWF0aWMgQVBJLgo+ID4KPiA+IFRoaXMgaGFj
a2luZyBvZiBpdCBoZXJlIGlzIG5vdCBtYWtpbmcgaXQgYmV0dGVyIDooCj4gCj4gSSBtaXN1bmRl
cnN0b29kIHlvdXIgcHJldmlvdXMgY29tbWVudHMuCj4gCj4gV2UgY2FuIGNlcnRhaW5seSBkZWFs
IHdpdGggdGhpcyBsYXRlciB3aGVuIHRoZSBJT01NVQo+IGRyaXZlciBpcyBhdmFpbGFibGUgZm9y
IFJJU0MtVi4gSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBpbiB0aGUKPiBuZXh0IHJldmlzaW9uLgoK
Tm90IG9ubHkganVzdCB0aGlzIHBhdGNoIGJ1dCB0aGUgY2FsbHMgdG8gaW9tbXVfZG1hX3ByZXBh
cmVfbXNpKCkgYW5kCnJlbGF0ZWQgQVBJcyBpbiB0aGUgcHJpb3IgcGF0Y2ggdG9vLiBBc3N1bWUg
dGhlIE1TSSB3aW5kb3cgaXMgZGlyZWN0bHkKdmlzaWJsZSB0byBETUEgd2l0aG91dCB0cmFuc2xh
dGlvbi4KCldoZW4geW91IGNvbWUgd2l0aCBhbiBpb21tdSBkcml2ZXIgd2UgY2FuIGRpc2N1c3Mg
aG93IGJlc3QgdG8gcHJvY2VlZC4KClRoYW5rcywKSmFzb24KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
