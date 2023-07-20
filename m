Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F8EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWbqsj89d/CUrm5zhEZx9CkL9xdNjxo/Uu0nME8Lmh8=; b=1eYDuyorIdNebN
	Ce1oPJFOV4V4/YEz6IWsaVU3iMzkNyAwGof39+2AXfu+7f5SWFsCK37Te5EkZv77bEecgkA1QW6mw
	9o2Lutg0kDslh9W414Cvz2CYjkDOZ7b8iIZiuKQwydMRwnwfzvQzMbF3z/GUICfkVPl2VJcweiX2l
	mradRfsqk2tB3hrcMF95l/yzdWHIx8BqrnKw7MO0Q960Akx0j7vk1M/yuxEaAmGqbQpk0R2QubLFd
	6RlPjY3s+qgjCdseBe0inuvTrxcvtB7GzezfuMm0f/JpeeJcHA6VvyImLxcm9arP/DQe0MPUbAFCK
	QjECrrhUtosZYxd0hWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM6c-009osx-2T;
	Thu, 20 Jul 2023 05:21:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM6a-009osJ-1u
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 05:21:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262fa79e97fso151028a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689830495; x=1690435295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SQgXWoGajTcWFTKGi9R9oxzeRnmHyz4yfoIz0S9pgc=;
        b=HmHMmt3O0Tj+GD66l08Cspkp+ONN/PyKQ3sSpCL4WPOamq7x6SDOK9jImIC9gc8zwR
         sSrODzM2nIWed481xfjZJ2/osRk8VZKuIubFJwKPtu6wX+3h36Q2HwoSdLkcq0hFkMsp
         gqKe6nxrr1RXqSvDFLxWNrO9xfQqrlRDy6nuLMzwLoW2Xihy4Le3sezHWtcGayg2iKdD
         xjYgUitcQB3BV3LldMJesSjfPt5yw94+VvqZPXsUpEVyr1rx3j1gIm4bS+JxdY8xYzDK
         k5fBNF1q373ux99RNT4/1w/CkN9C1dlt/x5wAxj2Z89DC4T5Ptdq0gTFuVoLHMEkeEHw
         ggzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689830495; x=1690435295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SQgXWoGajTcWFTKGi9R9oxzeRnmHyz4yfoIz0S9pgc=;
        b=URMbjRTWxBWmN6CGQvgHissDux55odv2XMNx0Fccegr8gr6aqMyLsMsawnmKpR4IYU
         cJkrIl2qQ5KcJEFvr2o5wImI8R2Aer7zz5KACRT7/QnlxHcAqUuNPFUdXotQzwORQRzO
         W7URC/rpjm0nj025uRw8NuawJkBZslZTzop2C60RRcWkwolko67K9p2jGEw6DTYAv3Ss
         D63zmG6cnw81UxainlpQRZXwbhDPFi68J6hhmbEeC0vpRu00YokB18oDFxdgGqVoJVKN
         G8s7eXk6gb43DctjilpuRWnFr2pkKmh9gNt302wPCtfr++9HHXeC9f6UrTzbJxD1HvNQ
         kAbw==
X-Gm-Message-State: ABy/qLZ8kF8uRBdHp3Pw91NWSKxYb2eNhrFxpR7AtjGWDvghxTC4XgJd
	gdI0I20T+GUB2MV7ahXHkIAH67BvWBt/XTLsRhOUTg==
X-Google-Smtp-Source: APBJJlGf6CZynpBr6gdOp1scWXRhKuZ7KBAu5pHHukIFDVk7dldWRf2mAYhgpBTeIr8+LZjjszi5vmm//lP6e2vf08Q=
X-Received: by 2002:a17:90a:c17:b0:262:c974:6057 with SMTP id
 23-20020a17090a0c1700b00262c9746057mr15079847pjs.32.1689830494221; Wed, 19
 Jul 2023 22:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
 <20230719113542.2293295-3-apatel@ventanamicro.com> <CAGETcx9xHSFSX1bOA8H04gXVN_Lh0HgvoC3xKesCzCEdW1dGMw@mail.gmail.com>
In-Reply-To: <CAGETcx9xHSFSX1bOA8H04gXVN_Lh0HgvoC3xKesCzCEdW1dGMw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Jul 2023 10:51:22 +0530
Message-ID: <CAK9=C2W+3pOWL36ZPme1LpHz5PEBVdKWv+kR7DYKmRyw1AymMA@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] of: property: Add fw_devlink support for msi-parent
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_222136_633750_06DBF134 
X-CRM114-Status: GOOD (  22.47  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMzo1NeKAr0FNIFNhcmF2YW5hIEthbm5hbiA8c2FyYXZh
bmFrQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNDozNuKA
r0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBU
aGlzIGFsbG93cyBmd19kZXZsaW5rIHRvIGNyZWF0ZSBkZXZpY2UgbGlua3MgYmV0d2VlbiBjb25z
dW1lcnMgb2YKPiA+IGEgTVNJIGFuZCB0aGUgc3VwcGxpZXIgb2YgdGhlIE1TSS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5j
Cj4gPiBpbmRleCBkZGM3NWNkNTA4MjUuLmU0MDk2Yjc5YTg3MiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gKysrIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBA
QCAtMTMyNSw2ICsxMzI1LDM3IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2lu
dGVycnVwdHMoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ICAgICAgICAgcmV0dXJuIG9mX2ly
cV9wYXJzZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3MpID8gTlVMTCA6IHN1cF9hcmdzLm5wOwo+
ID4gIH0KPiA+Cj4gPiArc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfbXNpX3BhcmVu
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIGludCBpbmRleCkKPiA+ICt7
Cj4gPiArICAgICAgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3VwX2FyZ3M7Cj4gPiArICAgICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNpX25wOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoIUlTX0VO
QUJMRUQoQ09ORklHX09GX0lSUSkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4g
PiArCj4gPiArICAgICAgIGlmIChzdHJjbXAocHJvcF9uYW1lLCAibXNpLXBhcmVudCIpKQo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKwo+ID4gKyAgICAgICBtc2lfbnAgPSBv
Zl9wYXJzZV9waGFuZGxlKG5wLCBwcm9wX25hbWUsIDApOwo+ID4gKyAgICAgICBpZiAobXNpX25w
KSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobXNpX25w
LCAiI21zaS1jZWxscyIpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoaW5kZXgp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobXNpX25w
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gbXNpX25wOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICBvZl9u
b2RlX3B1dChtc2lfbnApOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIGlmIChvZl9w
YXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwgcHJvcF9uYW1lLCAiI21zaS1jZWxscyIsIGluZGV4
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnN1cF9hcmdzKSkK
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJu
IHN1cF9hcmdzLm5wOwo+ID4gK30KPiA+ICsKPgo+IEknbSBhbWF6ZWQgYnkgdGhlIGRpZmZlcmVu
dCB3YXlzIHlvdSBjaG9vc2UgdG8gd2FzdGUgcGVvcGxlJ3MgdGltZS4KPiBEaWQgeW91IGV2ZW4g
c2Nyb2xsIHVwIHRvIHNlZSBob3cgdGhlIG90aGVyIHByb3BlcnRpZXMgYXJlIGhhbmRsZWQ/Cj4K
PiBXaHkgY2FuJ3QgdGhpcyBiZSBoYW5kbGVkIHVzaW5nIERFRklORV9TSU1QTEVfUFJPUCBtYWNy
bz8KCkRFRklORV9TSU1QTEVfUFJPUCgpIGlzIG5vdCBzdWl0YWJsZSBmb3IgbXNpLXBhcmVudCBi
ZWNhdXNlIHdlCmhhdmUgYSBzcGVjaWFsIGNhc2Ugd2hlcmUgZm9yIGEgc2luZ2xlIE1TSSBwYXJl
bnQgdGhlICIjbXNpLWNlbGxzIgpwcm9wZXJ0eSB3b24ndCBiZSBwcmVzZW50IGluIHRoZSBzdXBw
bGllciBEVCBub2RlLgoKVGhlIG9mX21zaV9nZXRfZG9tYWluKCkgZnVuY3Rpb24gYWxzbyBoYW5k
bGVzIHRoaXMgc3BlY2lhbCBjYXNlCnNlcGFyYXRlbHkuCgpSZWdhcmRzLApBbnVwCgoKPgo+IC1T
YXJhdmFuYQo+Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdXBwbGllcl9iaW5kaW5ncyBvZl9z
dXBwbGllcl9iaW5kaW5nc1tdID0gewo+ID4gICAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2Vf
Y2xvY2tzLCB9LAo+ID4gICAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfaW50ZXJjb25uZWN0
cywgfSwKPiA+IEBAIC0xMzU5LDYgKzEzOTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1cHBs
aWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gPiAgICAgICAgIHsgLnBh
cnNlX3Byb3AgPSBwYXJzZV9yZWd1bGF0b3JzLCB9LAo+ID4gICAgICAgICB7IC5wYXJzZV9wcm9w
ID0gcGFyc2VfZ3BpbywgfSwKPiA+ICAgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW9z
LCB9LAo+ID4gKyAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfbXNpX3BhcmVudCwgfSwKPiA+
ICAgICAgICAge30KPiA+ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
