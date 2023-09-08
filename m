Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BEDEE57EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH6fh6G8E7B8WP1p0qsebV8wcEiI69XBsWB9eXFUwm4=; b=e44zD0eTfIs/G7
	7vcd9MC44bxtWOalipaRX2dyuYYtdhNZPXVgGuQnYgf5xg6c1oIOjAiEhBF1BEb1m7i/jz2rFc08F
	g/eIrlU9ijfyk2nHlWzDXETjdaSOMWSSDGzbYXLvNFdCbbh+L2VykWkdGUyspBv/tA0UJNPZ0ensk
	6gVTIL9oDYdWlUOAF4iGS3AO1EPe7pdA1l1W4wqItdiYeWqwrMKJMX3oyfWeA+r6ckTshNQIxeQUZ
	rxgnbqBX/HBI3U3rvtMGxB9o0yiNEVmaGruI89eyrwcN+zE3T+LG6rqqtI8dX9gQKu0Do3q16eGTB
	E7zq22HdT63ij9/W7exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYvP-00Dc9e-1X;
	Fri, 08 Sep 2023 10:41:19 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYvM-00Dc8r-00
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 10:41:17 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-58fba83feb0so18614027b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694169673; x=1694774473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGzW1Gsz6nFeulWPUu5AH12nWhKzRRmn3Tj1YKt22hc=;
        b=GjEQRVZ7HScLM108pfGAzZT6kC5fYXtyv6//kgBaPfWQxhlLEBkMPlUn+cawmrkbIM
         XZPQMoU/7/RVYjlwAyZniuqh604Rp5kP8G9cXfle7prwLY8CF80vRTUzUWe/xaJkg2vj
         DtJo/E6FFtlN1ujT+6k2SKgubESkK3xTbjgK9+iqqpJ1/GktVQ+rDF3XuJE5+yiFWxn6
         yVZ5XKA1AXTl3VwbviKFpsUTyLxr08KNLlST4di+B7MAJKjRqSacwkwfJz/G2GE75Vw+
         bt5cNK8wEc/BGm5dtAEGwgMO1EuiHgi2QXd0sEh1RJ+d+MJJBek6dmttk/nC2dhFwrd4
         K0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694169673; x=1694774473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGzW1Gsz6nFeulWPUu5AH12nWhKzRRmn3Tj1YKt22hc=;
        b=kqqdJ3+yg81y4xLvkTiPnKRVp8MkCEXcc8F4jXoHxxpYMbI8PlzzliDd9Uxl2pmIw7
         lT1eSY03iq64ftL7tWIqeDoEcBN+He5hYG0WHrB1CcOf1XOo3Uj73vJRqYx6IAqKTRj3
         AFq0m0i04RYBT/lJCiySIjCiPm2K25hyNIR6Fjk6Xy8NyYc4VCvg34XZfRLZVHeZKuO+
         HT+8mwvlC688N+tOYZ/dwclBwUdlQdYdn2jf7RTO4iQ2SWoj47FPN6tR/r/JJp0SAFeW
         05u9t2MJYURbXz5DZzjlt957JHgcU0L/tSZY2faMqyoVeifkRg+DXIl2krmZq2EsKgds
         5tzg==
X-Gm-Message-State: AOJu0Yx6lzVBSIATU1h4u7IXWjT/Kg1BLj+U+3cyO62hkvaT43/4m8WF
	FPqiG6jqmliM+107G+Sw7pVMEp6tUuIFn7tZ6KwEF1ZMxWPC2+VBupQ=
X-Google-Smtp-Source: AGHT+IF6rwnNU+XqC+wcXUFyvM1oC64hNO07qjBFEtIkD2cenu0xbaTRBvPawtOx+Jz8TQCmLbUd8CK9kX8IPGIgmns=
X-Received: by 2002:a81:5f8b:0:b0:59b:a28:389d with SMTP id
 t133-20020a815f8b000000b0059b0a28389dmr2617270ywb.19.1694169672736; Fri, 08
 Sep 2023 03:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
In-Reply-To: <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 8 Sep 2023 18:41:00 +0800
Message-ID: <CAHh=Yk8R02NXK33aogQeJQB6x88B_gpbnjHj9wRrJEbDQf67Aw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, geert+renesas@glider.be, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_034116_108813_2CA42333 
X-CRM114-Status: GOOD (  28.27  )
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

SGkgVXdlLAoKU29ycnkgaXQncyBzbyBsb25nIGFnby4KCkkgaGF2ZSBjb21wbGV0ZWQgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIHRoZSBuZXcgdmVyc2lvbiwgYnV0IHRoZXJlIGlzCm9uZSB0aGluZyBh
Ym91dCB0aGlzIGxldHRlciB0aGF0IEkgc3RpbGwgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZC4KClV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IOaWvCAyMDIz
5bm0MeaciDMw5pelIOmAseS4gCDkuIvljYg2OjE35a+r6YGT77yaCj4KPiBPbiBNb24sIEphbiAz
MCwgMjAyMyBhdCAwNTozMjoyOVBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gVGhlIGBm
cmFjYCB2YXJpYWJsZSByZXByZXNlbnRzIHRoZSBwdWxzZSBpbmFjdGl2ZSB0aW1lLCBhbmQgdGhl
IHJlc3VsdCBvZgo+ID4gdGhpcyBhbGdvcml0aG0gaXMgdGhlIHB1bHNlIGFjdGl2ZSB0aW1lLiBU
aGVyZWZvcmUsIHdlIG11c3QgcmV2ZXJzZSB0aGUKPiA+IHJlc3VsdC4KPiA+Cj4gPiBUaGUgcmVm
ZXJlbmNlIGlzIFNpRml2ZSBGVTc0MC1DMDAwIE1hbnVhbFswXS4KPiA+Cj4gPiBbMF06IGh0dHBz
Oi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS8xYTgyZTYwMC0xZjkzLTRmNDEtYjJkOC04
NmVkOGIxNmFjYmFfZnU3NDAtYzAwMC1tYW51YWwtdjFwNi5wZGYKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBpbmRleCA2MmI2YWNjNjM3M2QuLmE1ZWRhMTY1ZDA3
MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gKysrIGIvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRpYyBpbnQg
cHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNl
ICpwd20sCj4gPiAgICAgICBmcmFjID0gRElWNjRfVTY0X1JPVU5EX0NMT1NFU1QobnVtLCBzdGF0
ZS0+cGVyaW9kKTsKPiA+ICAgICAgIC8qIFRoZSBoYXJkd2FyZSBjYW5ub3QgZ2VuZXJhdGUgYSAx
MDAlIGR1dHkgY3ljbGUgKi8KPiA+ICAgICAgIGZyYWMgPSBtaW4oZnJhYywgKDFVIDw8IFBXTV9T
SUZJVkVfQ01QV0lEVEgpIC0gMSk7Cj4gPiArICAgICBmcmFjID0gKDFVIDw8IFBXTV9TSUZJVkVf
Q01QV0lEVEgpIC0gMSAtIGZyYWM7Cj4KPiBUaGUgc2FtZSBwcm9ibGVtIGV4aXN0cyBpbiBwd21f
c2lmaXZlX2dldF9zdGF0ZSgpLCBkb2Vzbid0IGl0Pwo+Cj4gQXMgZml4aW5nIHRoaXMgaXMgYW4g
aW50ZXJydXB0aXZlIGNoYW5nZSBhbnlob3csIHRoaXMgaXMgdGhlIG9wcG9ydHVuaXR5Cj4gdG8g
YWxpZ24gdGhlIGRyaXZlciB0byB0aGUgcnVsZXMgdGVzdGVkIGJ5IFBXTV9ERUJVRy4KPgo+IFRo
ZSBwcm9ibGVtcyBJIHNlZSBpbiB0aGUgZHJpdmVyIChvbmx5IGNoZWNrZWQgcXVpY2tseSwgc28g
SSBtaWdodCBiZQo+IHdyb25nKToKPgo+ICAtIHN0YXRlLT5wZXJpb2QgIT0gZGRhdGEtPmFwcHJv
eF9wZXJpb2QgaXNuJ3QgbmVjZXNzYXJpbHkgYSBwcm9ibGVtLiBJZgo+ICAgIHN0YXRlLT5wZXJp
b2QgPiBkZGF0YS0+cmVhbF9wZXJpb2QgdGhhdCdzIGZpbmUgYW5kIHRoZSBkcml2ZXIgc2hvdWxk
Cj4gICAgY29udGludWUKPgpJIHN0aWxsIGRvbuKAmXQgcXVpdGUgdW5kZXJzdGFuZCB0aGUgZGVz
Y3JpcHRpb24gb2YgdGhpcyBwYXJhZ3JhcGguCgpzdGF0ZS0+cGVyaW9kICE9IGRkYXRlLT5hcHBy
b3hfcGVyaW9kIHNlZW1zIHRvIGJlIHVzZWQgdG8gY29tcGFyZSB0aGUKcmVzdWx0cyBvZiB0aGUg
cHJldmlvdXMgYW5kIG5leHQgdHdvIHRpbWVzLgoKSSdtIHVuc3VyZSB3aGF0IHRvIGRvIGlmIEkg
cmVwbGFjZSB0aGUgY29uZGl0aW9uYWwgZXhwcmVzc2lvbiB3aXRoCnNvbWV0aGluZyBlbHNlLgoK
SW4gYWRkaXRpb24sIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbWVhbmluZyBvZiB0aGlzLgoiaWYg
c3RhdGUtPnBlcmlvZCA+IGRkYXRhLT5yZWFsX3BlcmlvZCB0aGF0J3MgZmluZSwgYW5kIHRoZSBk
cml2ZXIKc2hvdWxkIGNvbnRpbnVlIgoKQXQgcHJlc2VudCwgbXkgbmV3IHZlcnNpb24gb2YgdGhl
IGltcGxlbWVudGF0aW9uIGhhcyBwYXNzZWQgdGhlIHRlc3QKb2YgdGhlIHB3bV9hcHBseV9zdGF0
ZV9kZWJ1ZygpIGZ1bmN0aW9uLgoKV291bGQgeW91IHN1Z2dlc3QgSSBzZW5kIHRoZSBuZXcgaW1w
bGVtZW50YXRpb24gdmVyc2lvbiBiZWZvcmUKY29udGludWluZyB0aGUgZGlzY3Vzc2lvbj8KClRo
YW5rIHlvdSBhZ2FpbiBmb3IgZXZlcnl0aGluZyB5b3XigJl2ZSBkb25lLgoKPiAgLSBmcmFjID0g
RElWNjRfVTY0X1JPVU5EX0NMT1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiAgICBpcyB3cm9u
ZyBmb3IgdHdvIHJlYXNvbnM6Cj4gICAgaXQgc2hvdWxkIHJvdW5kIGRvd24gYW5kIHVzZSB0aGUg
cmVhbCBwZXJpb2QuCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPgo+IC0tCj4gUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAg
ICAgICB8Cj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0
cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
