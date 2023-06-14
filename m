Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F758EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBiUknmd+UhFKJgU9naHuM6UiTxJgXuvYDKmervHbUI=; b=3OMd0O6DueA7GN
	e89u3YJM7jStBimAMUZgndp9FpoTpvbwpfVvO4R6rGeNj/3Qte+k2SwZorSiU/VK9F300mirOKts5
	obFrtzyswDps6rNpfH5EPLMguZzLfa5ElN8/jnlMqFVTk14HGKDdwYgA7QKPXtsI/GaOLLXW9k9ox
	90JVn7cNU26xi3u4XHvPR2BXb+OnSqwTxCZc4RfVkk2MG/Z/hbyO+oVRWLvb6VrrheeUFHceLB/gU
	Y5wUv0krsiWIwk5Sr2uIIfRwpz9gDy0gHWkwIbbb9lBm8gxt32ddGz6QEyeeIVQ2BJrC4XlffUbqs
	pU2Vi3cc2Qu9czLrSVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TCH-00CBTI-0c;
	Wed, 14 Jun 2023 16:18:13 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TCE-00CBS9-0l
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 16:18:11 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-43b2fb0afa6so1044830137.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686759486; x=1689351486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqZ5IpvvmpQbJ1zzadm9lsilhVlagwH9wED8wa6qKyk=;
        b=XOfu1eYFWRpySp+RiCt0aA1jZbJR83Le9ctjs32cZySjS+GuH51iRYEtWpVlMPTqW9
         U5gItI0/rvhDWXWBSa0SMZNqwdysynD6LhqX84SvnNkBk+zWvV8ArIMnrYWTWVyqDojM
         GtdYN+TehUP1b9mwBeN1snu5Rk6tHA0eq6V1W4DblADlIddcAJllqCWZaW34CZUeoP5S
         TTglt7Hz5thFncRnDsOg0zxzAcyov99SLxk0pbhPTP4R5jh19C1aNmE1wcx93UxEx6fJ
         7K37K/Da6eQVnx2tYotE/7pD43Rj1+5vBMOVTKvvPIr20KNj1FRJUOceFPeUhutwO5X7
         qovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686759486; x=1689351486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqZ5IpvvmpQbJ1zzadm9lsilhVlagwH9wED8wa6qKyk=;
        b=FaPDC+ODiU2KAKIqQdo7nR72/Gx8H8yfFsidhGOEJtS04j5OSyiuliPRj6eK4hg+Wf
         mLUA1SrRLMVvOSBxSvAzsI1n/GmGtsVPjNZc+5oZQERXRbm89RegoZuwExdJgrxzy+QP
         aUqxPp/x2cP9p1dZg6PgU9C5y8OZFJeuqt+stiizQ/b3AASE0kxVjQKnh6CUMBuHB7Jf
         suDFuIearBN3W8AzeVWhYfxKiAjfovlsFcYy3gHWF3hWXA9p9bbBTadO0dVcc9Q4xpeR
         a1vErTh343ovZ2nO1kT1+OLdh020UglZJc26JVFTJnXNIBNNvGuDaWZ/fpBgCe+2LoDd
         q3hA==
X-Gm-Message-State: AC+VfDwgye/s36zh5dF6jP0griGpHluBwlEu0jXR+NoZgS1VgzaXSWTY
	g40Ubrnquly+7Yeg6dK7FYq9SyuvARUpubQ8+R1R2g==
X-Google-Smtp-Source: ACHHUZ4T7QMUba26lRFayVBzKQdCxI1brJ81aRWNBFfCUqmdZDfLVwDazHkjAEg8Z171WQ5oQkD4ady8X/LpgmJXumY=
X-Received: by 2002:a67:d088:0:b0:43b:2f4d:2467 with SMTP id
 s8-20020a67d088000000b0043b2f4d2467mr7412759vsi.29.1686759485808; Wed, 14 Jun
 2023 09:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-7-apatel@ventanamicro.com> <ZInSqC6b7RPD1nzX@ziepe.ca>
In-Reply-To: <ZInSqC6b7RPD1nzX@ziepe.ca>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Jun 2023 21:47:53 +0530
Message-ID: <CAK9=C2XBObBGh2R2pxVgM0E1gFPBn4m7DKzoTxEmDdZ9V1QLrA@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] irqchip/riscv-imsic: Improve IOMMU DMA support
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_091810_279647_12CE3997 
X-CRM114-Status: GOOD (  23.49  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgODoxNuKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDA5OjA0OjExUE0gKzA1
MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSBoYXZlIGEgc2VwYXJhdGUgUklTQy1WIElNU0lD
IE1TSSBhZGRyZXNzIGZvciBlYWNoIENQVSBzbyBjaGFuZ2luZwo+ID4gTVNJIChvciBJUlEpIGFm
ZmluaXR5IHJlc3VsdHMgaW4gcmUtcHJvZ3JhbW1pbmcgb2YgTVNJIGFkZHJlc3MgaW4KPiA+IHRo
ZSBQQ0llIChvciBwbGF0Zm9ybSkgZGV2aWNlLgo+ID4KPiA+IEN1cnJlbnRseSwgdGhlIGlvbW11
X2RtYV9wcmVwYXJlX21zaSgpIGlzIGNhbGxlZCBvbmx5IG9uY2UgYXQgdGhlCj4gPiB0aW1lIG9m
IElSUSBhbGxvY2F0aW9uIHNvIElPTU1VIERNQSBkb21haW4gd2lsbCBvbmx5IGhhdmUgbWFwcGlu
Zwo+ID4gZm9yIG9uZSBNU0kgcGFnZS4gVGhpcyBtZWFucyBpb21tdV9kbWFfY29tcG9zZV9tc2lf
bXNnKCkgY2FsbGVkCj4gPiBieSBpbXNpY19pcnFfY29tcG9zZV9tc2lfbXNnKCkgd2lsbCBhbHdh
eXMgdXNlIHRoZSBzYW1lIE1TSSBwYWdlCj4gPiBpcnJlc3BlY3RpdmUgdG8gdGFyZ2V0IENQVSBN
U0kgYWRkcmVzcy4gSW4gb3RoZXIgd29yZHMsIGNoYW5naW5nCj4gPiBNU0kgKG9yIElSUSkgYWZm
aW5pdHkgZm9yIGRldmljZSB1c2luZyBJT01NVSBETUEgZG9tYWluIHdpbGwgbm90Cj4gPiB3b3Jr
Lgo+Cj4gWW91IGRpZG4ndCBhbnN3ZXIgbXkgcXVlc3Rpb24gZnJvbSBsYXN0IHRpbWUgLSB0aGVy
ZSBzZWVtcyB0byBiZSBubwo+IGlvbW11IGRyaXZlciBoZXJlIHNvIHdoeSBhcmUgeW91IG1lc3Np
bmcgd2l0aCBpb21tdV9kbWFfcHJlcGFyZV9tc2koKT8KPgo+IFRoaXMgcGF0aCBpcyBvbmx5IGZv
ciBwbGF0Zm9ybXMgdGhhdCBoYXZlIElPTU1VIGRyaXZlcnMgdGhhdCB0cmFuc2xhdGUKPiB0aGUg
TVNJIHdpbmRvdy4gWW91IHNob3VsZCBhZGQgdGhpcyBjb2RlIHRvIGxpbmsgdGhlIGludGVycnVw
dAo+IGNvbnRyb2xsZXIgdG8gdGhlIGlvbW11IGRyaXZlciB3aGVuIHlvdSBpbnRyb2R1Y2UgdGhl
IGlvbW11IGRyaXZlciwKPiBub3QgaW4gdGhpcyBzZXJpZXM/Cj4KPiBBbmQsIGFzIEkgc2FpZCBi
ZWZvcmUsIEknZCBsaWtlIHRvIE5PVCBzZWUgbmV3IHVzZXJzIG9mCj4gaW9tbXVfZG1hX3ByZXBh
cmVfbXNpKCkgc2luY2UgaXQgaXMgYSB2ZXJ5IHByb2JsZW1hdGljIEFQSS4KPgo+IFRoaXMgaGFj
a2luZyBvZiBpdCBoZXJlIGlzIG5vdCBtYWtpbmcgaXQgYmV0dGVyIDooCgpJIG1pc3VuZGVyc3Rv
b2QgeW91ciBwcmV2aW91cyBjb21tZW50cy4KCldlIGNhbiBjZXJ0YWlubHkgZGVhbCB3aXRoIHRo
aXMgbGF0ZXIgd2hlbiB0aGUgSU9NTVUKZHJpdmVyIGlzIGF2YWlsYWJsZSBmb3IgUklTQy1WLiBJ
IHdpbGwgZHJvcCB0aGlzIHBhdGNoIGluIHRoZQpuZXh0IHJldmlzaW9uLgoKUmVnYXJkcywKQW51
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
