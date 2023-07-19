Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C91C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGH++2AJs1Ch8SfO0Nx0KekfF9aenM4C54XRwJQX4Ws=; b=Y0+gxhhd8wk14b
	GQgNfmUvD6eD0MbwPeXAL2NMgHNRBnfUKx0uFQLuezYfQHHJcpWGL1XOd9iub5RfJv4rCT0OCFe8l
	Oin0b4r0e3CMfWoDkCDgez4kS8kDanD/B+vwJFm77V9hUApmw0DGQKpE5oAD8aKcC6rP//sBxtjq6
	wyN0RB+CCjyIDQzULtmsT/QwFBjXOQwfIjGu8OY+/+D6gPYkKuM9kB/TjJ+CAWCsQi2UkMQSeIauk
	VSZJPDiRu6fFyssjK34XDlfcP0UrXcOvpxTZqXWavbpX0XygS2A4c1f+PXSIRkl1ea4yEFSfgLpt9
	pNCZvv36KvGfcqMLFcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFc6-0096I0-10;
	Wed, 19 Jul 2023 22:25:42 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFc4-0096HW-16
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 22:25:41 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4036bd4fff1so113501cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 15:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689805537; x=1690410337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSSA1lN7n0KjTsg7oA72TG3EKvc6npW9RST/+V7gA5w=;
        b=LJjIuORo74r6AjqcGXyZ+9OMOdZWWUtRe+mycw+xl1CutWmM9d7KO0p6ZSO9pplE8Q
         wyXRDrsnDRqxZkZnnYmfH2t/huF/g/bMS1elj2dLHGY46pfBK1cqFffEpp5Rp8Vn+akJ
         7ikye3sFRzJwUe5R8s+kvuXZLtgiYsQFSPFGjplgy+rdQtrItfsyiuZsguHd35BRpVdU
         Ld+LV6gJN+HED/FMuusQrnHsrdfXfyaM4I3qwLNeZJNWuUwtRLPQrrAYm4yejtWMpJBj
         jrDD2/4msJOx/UFJLS9s7C8oKM6zlCPF5wSRED5d65WNpEaXMx/D76pVseyqjBUgJuNS
         eqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689805537; x=1690410337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSSA1lN7n0KjTsg7oA72TG3EKvc6npW9RST/+V7gA5w=;
        b=FrrRm0WWJsfSY/BGDFlQp1ycLQlgo/+ZWmZBTtmI7Lq9SXW12ZLEGQgP3zgu3mMKgq
         nq+4H3th7Rbdho307zIVzFpUEMpGk7eFwH/gWWeCZLRB4cRKclE3GlSZ8hqcOhqPtV78
         9TcYD/QxKsXYY/Jt63tlX/YHmTLRr7cIXmQMpXq9cUDsgrCWoW07BtGQzQ2pb8PSZJxS
         eQlI1a14oh/Up56zqsNHRUFECh2AkJs7vIi0eORQrhnHDwWlzhQ4Ev4F8f/4t0r1h7AV
         8ET6aziMQvbjFKEDzJpMlO4T1PRLMIsyarWbvMhBZGx96WzgqNgluSxaZzltU5UYpry+
         I6Gg==
X-Gm-Message-State: ABy/qLZhR5HCSxJKLOWdYUQTfEvKWN+0fV1L8gh2g8unUqYlHe3qqAut
	9+O0jyiD789CSaW15blfI3YHHOyE/nTfB3nYapZYGw==
X-Google-Smtp-Source: APBJJlEwzjIsuWCIUPIJLiT0PXKD5KoIKHegCghCmNQYU/5mCiPeokHdSgbQU1HUsC+nd1R9ML5FmJIJjdAvN8pxiVU=
X-Received: by 2002:ac8:4e53:0:b0:3f6:97b4:1a4d with SMTP id
 e19-20020ac84e53000000b003f697b41a4dmr40544qtw.23.1689805537020; Wed, 19 Jul
 2023 15:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230719113542.2293295-1-apatel@ventanamicro.com> <20230719113542.2293295-3-apatel@ventanamicro.com>
In-Reply-To: <20230719113542.2293295-3-apatel@ventanamicro.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 19 Jul 2023 15:25:01 -0700
Message-ID: <CAGETcx9xHSFSX1bOA8H04gXVN_Lh0HgvoC3xKesCzCEdW1dGMw@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] of: property: Add fw_devlink support for msi-parent
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_152540_384645_585C1AA4 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNDozNuKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgYWxsb3dzIGZ3X2RldmxpbmsgdG8gY3JlYXRl
IGRldmljZSBsaW5rcyBiZXR3ZWVuIGNvbnN1bWVycyBvZgo+IGEgTVNJIGFuZCB0aGUgc3VwcGxp
ZXIgb2YgdGhlIE1TSS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCAzMiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYyBiL2RyaXZlcnMvb2Yv
cHJvcGVydHkuYwo+IGluZGV4IGRkYzc1Y2Q1MDgyNS4uZTQwOTZiNzlhODcyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+
IEBAIC0xMzI1LDYgKzEzMjUsMzcgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2Vf
aW50ZXJydXB0cyhzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ICAgICAgICAgcmV0dXJuIG9mX2ly
cV9wYXJzZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3MpID8gTlVMTCA6IHN1cF9hcmdzLm5wOwo+
ICB9Cj4KPiArc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfbXNpX3BhcmVudChzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9uYW1lLCBpbnQgaW5kZXgpCj4gK3sKPiArICAgICAg
IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3VwX2FyZ3M7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm1zaV9ucDsKPiArCj4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX09GX0lS
USkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAgICAgIGlmIChzdHJj
bXAocHJvcF9uYW1lLCAibXNpLXBhcmVudCIpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKPiArCj4gKyAgICAgICBtc2lfbnAgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCBwcm9wX25hbWUs
IDApOwo+ICsgICAgICAgaWYgKG1zaV9ucCkgewo+ICsgICAgICAgICAgICAgICBpZiAoIW9mX3By
b3BlcnR5X3JlYWRfYm9vbChtc2lfbnAsICIjbXNpLWNlbGxzIikpIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoaW5kZXgpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9mX25vZGVfcHV0KG1zaV9ucCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIG1zaV9ucDsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAg
ICAgICBvZl9ub2RlX3B1dChtc2lfbnApOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChv
Zl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwgcHJvcF9uYW1lLCAiI21zaS1jZWxscyIsIGlu
ZGV4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdXBfYXJncykp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAgICAgIHJldHVybiBzdXBf
YXJncy5ucDsKPiArfQo+ICsKCkknbSBhbWF6ZWQgYnkgdGhlIGRpZmZlcmVudCB3YXlzIHlvdSBj
aG9vc2UgdG8gd2FzdGUgcGVvcGxlJ3MgdGltZS4KRGlkIHlvdSBldmVuIHNjcm9sbCB1cCB0byBz
ZWUgaG93IHRoZSBvdGhlciBwcm9wZXJ0aWVzIGFyZSBoYW5kbGVkPwoKV2h5IGNhbid0IHRoaXMg
YmUgaGFuZGxlZCB1c2luZyBERUZJTkVfU0lNUExFX1BST1AgbWFjcm8/CgotU2FyYXZhbmEKCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwcGxpZXJfYmluZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGlu
Z3NbXSA9IHsKPiAgICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9jbG9ja3MsIH0sCj4gICAg
ICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfaW50ZXJjb25uZWN0cywgfSwKPiBAQCAtMTM1OSw2
ICsxMzkwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdXBwbGllcl9iaW5kaW5ncyBvZl9zdXBw
bGllcl9iaW5kaW5nc1tdID0gewo+ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX3JlZ3Vs
YXRvcnMsIH0sCj4gICAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfZ3BpbywgfSwKPiAgICAg
ICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9ncGlvcywgfSwKPiArICAgICAgIHsgLnBhcnNlX3By
b3AgPSBwYXJzZV9tc2lfcGFyZW50LCB9LAo+ICAgICAgICAge30KPiAgfTsKPgo+IC0tCj4gMi4z
NC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
