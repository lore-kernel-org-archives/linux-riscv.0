Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03897C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+yGEZUzwIT0HhuAS1vq6L9Z4KZwLZOG3TZwC+/GpCI=; b=B3WpyUkBifEYRZ
	ygDI0ggglZUaeeQQZgPFD79DhBMemZ3qqmFR0/zQJ8aiFC3nE5uQmapQsENNot2jzLE/FoZo/4/4X
	aZ3iJbztPqsWICvVIO3PQ2GxldS3G99PVlTi7IhmspqVFlGtB82zlEnIT+H3kwulKamMd3hk8ri2F
	1KgSUNeqk+QcNDoCwwM/ZQ/wARaBOrvZ9KoxQoySApt+EbyxJWYNfKFawE+qddKwmkaJteAeOlwaa
	ZvtuiEKevwsnaX6N8R3BuVE4OZ3ALVF7XDB/KEVFvVX3nTp9Ugj4y1u5x3PijQ5Ok6rO0waFTdDO3
	W8ugzlaicAVSXpyeN85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dOa-00AKln-0G;
	Thu, 30 Nov 2023 09:31:44 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dOW-00AKky-05
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 09:31:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so657850b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 01:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701336697; x=1701941497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8OBcWs9lPOHMqo4r9Od8zwOOfWlpHAGN+FvmpBlGKI=;
        b=Y3Vlm1yaSNLl83pQvHVg+pPyDqMEtcdoeCtv7jq13DAqsKOXawU2bkR3dCVuNolJds
         338wbXzPaOJ8g/VvzgUBXeP3gi2kr6TNbkE0Nm+b4pgO+wmdFhfLdpZWZp1/mF8+GugI
         w2Eiwywj3gLjiwt+ogfjEkRhR5FQIDALz0qtxuLdCPjLbrML0LydaEPWINjao7DecwP/
         M+9X55XPavI8LN1eXWFOgBEBmmz/bpvaHo4u1aM1Itgu0QF9e01fMXVVMyCSdSRjgIxi
         zHAeGj6LEFE6lzZxc/4Uoegl5l6cvRLGfhYbpTWY0vBFrFKq9tdJxbY5XhAo04H9XUkH
         ahVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701336697; x=1701941497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8OBcWs9lPOHMqo4r9Od8zwOOfWlpHAGN+FvmpBlGKI=;
        b=lq8aAJoyo7Mn31TE/gw7Uj0+cEzeNn3eozId8uHw85LUyYj4IBlB0fj4ZPs8UXN8DN
         m+ul63Q3GEK4NFbwPsBKEb3IAe4Vj9sj8AtuJFomU+GPcN+vA7kC7+L6KyuCwlTIxpcS
         I7ffC1uOYLMvI9Uyh4DDP8kNdmzhvzOs0Eel4JI6CRICAOsB0yFh+rsK7lA8l+SdHf1c
         VjlCaVH4V62068+0oJ2I3uNVMxHTbiTKB0qWAZ9EqRn5E+6XC+8kd/CqPAqhZRAzeqON
         vPz9bxbTj9xGG4gj801isEPBc+vzqu5eOutoroa4p9kjpblx1fMIGIS1oY/DPj7QrJni
         T9SA==
X-Gm-Message-State: AOJu0YzMGKRFzyfETiEeBWc8S2p06Ipd5wZZe7kyRYLoojphJnC/YCLS
	/p11NK8M8iVJmzJRKz7K0TG6oQP0vgH35SQnrMsSNg==
X-Google-Smtp-Source: AGHT+IF3oL/DbPdKnDGhckZzmA5c9sL11ngMJCD23pKkyIij1ndLdvEWXMDzGlwxpmNWJO35Sc6QYX9lQMcvnyPWdfk=
X-Received: by 2002:a05:6a00:2296:b0:6cb:735c:67af with SMTP id
 f22-20020a056a00229600b006cb735c67afmr31018795pfe.0.1701336696772; Thu, 30
 Nov 2023 01:31:36 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Nov 2023 15:01:24 +0530
Message-ID: <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Anup Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_013140_074628_38BF9688 
X-CRM114-Status: GOOD (  20.89  )
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

T24gU2F0LCBOb3YgMTgsIDIwMjMgYXQgMTI6MznigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlh
bWFAb3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gVGhlIHRpbWVyIHJlZ2lzdGVycyBvZiBhY2xpbnQg
ZG9uJ3QgZm9sbG93IHRoZSBjbGludCBsYXlvdXQgYW5kIGNhbgo+IGJlIG1hcHBlZCBvbiBhbnkg
ZGlmZmVyZW50IG9mZnNldC4gQXMgc2cyMDQyIHVzZXMgc2VwYXJhdGVkIHRpbWVyCj4gYW5kIG1z
d2kgZm9yIGl0cyBjbGludCwgaXQgc2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIGhh
dmUKPiBzZXBhcmF0ZWQgcmVnaXN0ZXJzLgo+Cj4gVGhlIHByZXZpb3VzIHBhdGNoIGludHJvZHVj
ZWQgYSBuZXcgdHlwZSBvZiBULUhFQUQgYWNsaW50IHRpbWVyIHdoaWNoCj4gaGFzIGNsaW50IHRp
bWVyIGxheW91dC4gQWx0aG91Z2ggaXQgaGFzIHRoZSBjbGludCB0aW1lciBsYXlvdXQsIGl0Cj4g
c2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIHVzZXMgdGhlIHNlcGFyYXRlZCBtdGlt
ZSBhbmQgbXRpbWVjbXAKPiByZWdzLiBTbyBhIEFCSSBjaGFuZ2UgaXMgbmVlZGVkIHRvIG1ha2Ug
dGhlIHRpbWVyIGZpdCB0aGUgYWNsaW50IHNwZWMuCj4KPiBUbyBtYWtlIFQtSEVBRCBhY2xpbnQg
dGltZXIgbW9yZSBjbG9zZXIgdG8gdGhlIGFjbGludCBzcGVjLCB1c2UKPiByZWdzLW5hbWVzIHRv
IHJlcHJlc2VudCB0aGUgbXRpbWVjbXAgcmVnaXN0ZXIsIHdoaWNoIGNhbiBhdm9pZCBoYWNrCj4g
Zm9yIHVuc3VwcG9ydCBtdGltZSByZWdpc3RlciBvZiBULUhFQUQgYWNsaW50IHRpbWVyLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2suY29tPgo+IEZp
eGVzOiA0NzM0NDQ5ZjczMTEgKCJkdC1iaW5kaW5nczogdGltZXI6IEFkZCBTb3BoZ28gc2cyMDQy
IENMSU5UIHRpbWVyIikKPiBMaW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJt
YWlsL29wZW5zYmkvMjAyMy1PY3RvYmVyLzAwNTY5My5odG1sCj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LWFjbGludC9ibG9iL21haW4vcmlzY3YtYWNsaW50LmFkb2MKClRo
ZSByYXRpZmllZCBQcml2IHYxLjEyIHNwZWNpZmljYXRpb24gZGVmaW5lcyBwbGF0Zm9ybSBzcGVj
aWZpYyBNLW1vZGUgdGltZXIKcmVnaXN0ZXJzIHdpdGhvdXQgZGVmaW5pbmcgYW55IGxheW91dCBv
ZiBtdGltZSBhbmQgbXRpbWVjbXAgcmVnaXN0ZXJzLgooUmVmZXIsICIzLjIuMSBNYWNoaW5lIFRp
bWVyIFJlZ2lzdGVycyAobXRpbWUgYW5kIG10aW1lY21wKSIpCgpUaGUgInRoZWFkLGM5MDAtYWNs
aW50LW10aW1lciIgY2FuIGJlIHRob3VnaHQgb2YgYXMgaXMgb25lIHBvc3NpYmxlCmltcGxlbWVu
dGF0aW9uIG9mICJyaXNjdixtdGltZXIiIGRlZmluZWQgYnkgdGhlIFByaXYgdjEuMTIgc3BlY2lm
aWNhaXRvbi4KCklmIGl0IGlzIG5vdCB0b28gbGF0ZSB0aGVuIEkgc3VnZ2VzdCBtYWtpbmcgdGhp
cyBiaW5kaW5nIGludG8gZ2VuZXJpYwoicmlzY3YsbXRpbWVyIiBiaW5kaW5nLgoKUmVnYXJkcywK
QW51cAoKPiAtLS0KPiAgLi4uL3RpbWVyL3RoZWFkLGM5MDAtYWNsaW50LW10aW1lci55YW1sICAg
ICAgIHwgNDIgKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy90aW1lci90aGVhZCxjOTAwLWFjbGludC1tdGltZXIueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci90aGVhZCxjOTAwLWFjbGludC1t
dGltZXIueWFtbAo+IGluZGV4IGZiZDIzNTY1MGU1Mi4uMDUzNDg4ZmIxMjg2IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci90aGVhZCxjOTAwLWFj
bGludC1tdGltZXIueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aW1lci90aGVhZCxjOTAwLWFjbGludC1tdGltZXIueWFtbAo+IEBAIC0xNyw3ICsxNywyMCBA
QCBwcm9wZXJ0aWVzOgo+ICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLWFjbGludC1tdGltZXIK
Pgo+ICAgIHJlZzoKPiAtICAgIG1heEl0ZW1zOiAxCj4gKyAgICBvbmVPZjoKPiArICAgICAgLSBp
dGVtczoKPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1USU1FIFJlZ2lzdGVycwo+ICsgICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogTVRJTUVDTVAgUmVnaXN0ZXJzCj4gKyAgICAgIC0gaXRlbXM6
Cj4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBNVElNRUNNUCBSZWdpc3RlcnMKPiArCj4gKyAg
cmVnLW5hbWVzOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAt
IGNvbnN0OiBtdGltZQo+ICsgICAgICAgICAgLSBjb25zdDogbXRpbWVjbXAKPiArICAgICAgLSBp
dGVtczoKPiArICAgICAgICAgIC0gY29uc3Q6IG10aW1lY21wCj4KPiAgICBpbnRlcnJ1cHRzLWV4
dGVuZGVkOgo+ICAgICAgbWluSXRlbXM6IDEKPiBAQCAtMjgsOCArNDEsMzQgQEAgYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0g
cmVnCj4gKyAgLSByZWctbmFtZXMKPiAgICAtIGludGVycnVwdHMtZXh0ZW5kZWQKPgo+ICthbGxP
ZjoKPiArICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6
Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29uc3Q6IHRoZWFkLGM5MDAt
YWNsaW50LW10aW1lcgo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAg
ICByZWc6Cj4gKyAgICAgICAgICBpdGVtczoKPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjog
TVRJTUVDTVAgUmVnaXN0ZXJzCj4gKyAgICAgICAgcmVnLW5hbWVzOgo+ICsgICAgICAgICAgaXRl
bXM6Cj4gKyAgICAgICAgICAgIC0gY29uc3Q6IG10aW1lY21wCj4gKyAgICBlbHNlOgo+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIHJlZzoKPiArICAgICAgICAgIGl0ZW1zOgo+ICsgICAg
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBNVElNRSBSZWdpc3RlcnMKPiArICAgICAgICAgICAgLSBk
ZXNjcmlwdGlvbjogTVRJTUVDTVAgUmVnaXN0ZXJzCj4gKyAgICAgICAgcmVnLW5hbWVzOgo+ICsg
ICAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAgIC0gY29uc3Q6IG10aW1lCj4gKyAgICAgICAg
ICAgIC0gY29uc3Q6IG10aW1lY21wCj4gKwo+ICBleGFtcGxlczoKPiAgICAtIHwKPiAgICAgIHRp
bWVyQGFjMDAwMDAwIHsKPiBAQCAtMzksNSArNzgsNiBAQCBleGFtcGxlczoKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY3B1M2ludGMgNz4sCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JmNwdTRpbnRjIDc+Owo+ICAgICAgICByZWcgPSA8MHhhYzAwMDAwMCAweDAwMDEw
MDAwPjsKPiArICAgICAgcmVnLW5hbWVzID0gIm10aW1lY21wIjsKPiAgICAgIH07Cj4gIC4uLgo+
IC0tCj4gMi40Mi4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
