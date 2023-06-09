Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39C0C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0y3UDrfuryDr7K7FNciaSrjBr0CIk09fbb9EMAIvZWw=; b=ahkesf6jJwMU+3
	JsZhRBHTTs/DttZNDf/JQf+Cv9Ef6ICuwhEoLEFul8JLoxPnQKViRD1cqCxDLzaWlW9Kl1NBRJd4b
	gWIDiMATY5eDPVFlqWWMRzloR4aXYwKq8T3whS1uGpZQeKUklcB9gX/NuZ/tHOIug3FZ7ZC8NWdc0
	qHvB07OTxeND8ZEDHIrUJhP2r9T2zzfrA1IfDUB0PBXEZ+uIgpfgJnDaRCEi1EzDnbn1e760riASG
	MNIicIr6SPtAIOAo3a2CKV6fhNp/h4BUGgvw2QJqYVnGcF+N52Y+aVl7ZF1k0ds8d83HxK82FwaN9
	kBJsBEQsEwf9at9IqGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dCT-00DHNR-25;
	Fri, 09 Jun 2023 14:34:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dCQ-00DHMk-1E
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:34:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED65D658A1
	for <linux-riscv@lists.infradead.org>; Fri,  9 Jun 2023 14:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CE6C433D2
	for <linux-riscv@lists.infradead.org>; Fri,  9 Jun 2023 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686321285;
	bh=6hi3QOrXBuWBmFSLc1LCcSZkPYNC/LjyWkqKBdgQtYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t2zwqZY++aHOeqkffOIRqTQwaFGYg/NlJ7x1vCYz/K+ZilOefocnMcGfiq6zqcf9a
	 0uz5FX80e1MTsFaeAsiOt9n82ThnzSWWQFwBB5SQ2JR4xa/BwlmgzkwZGU0gS6cVSS
	 wWM4IE8G+4mL1pkGa/mLU1KZYCVDHG+rqQnHMIXHbGT0DbiLEUOnHvDzyUYlLX7soc
	 ZWTGdcvnDa1wt8I+HMTFxSC3fmK6rqAcc1xeiJ/xrVlikzbrJKwa1lHZPJIhZ/WdC2
	 wzg2HJ8JZaBP4IJqDfoSCd6etqsXNZvushR2eLeRQ0wXuyjMhyOvTn+5hZzXjvaWg9
	 JNTb8A2CbbPuQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso21030621fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 07:34:45 -0700 (PDT)
X-Gm-Message-State: AC+VfDwstHqtqq0tEO1APVkNG5jFnndK4FVBbSx8nac7pJz1HI25UXez
	DheS00CXpPVKrJ+Dk7lBMuvdK0QSkujpPMHF7A==
X-Google-Smtp-Source: ACHHUZ5RlhCvj6SZ4qT0ESmlowGIP4EXqIRZ5+cA0hTrUzwiZ/YarhwSg72TilmhiLhF0QJ+br0GiIgWs2wltkkoIHo=
X-Received: by 2002:a2e:9c90:0:b0:2af:2466:1c18 with SMTP id
 x16-20020a2e9c90000000b002af24661c18mr1326079lji.18.1686321283406; Fri, 09
 Jun 2023 07:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 9 Jun 2023 08:34:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5oZdHi6B-R1YUEwSOc8x8Vd9sHt1bgp5ydM_hAQJE3w@mail.gmail.com>
Message-ID: <CAL_Jsq+5oZdHi6B-R1YUEwSOc8x8Vd9sHt1bgp5ydM_hAQJE3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_073446_501385_E5ED8984 
X-CRM114-Status: GOOD (  17.44  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCA4OjA34oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IENsZWFudXAgYmluZGluZ3Mg
ZHJvcHBpbmcgdW5uZWVkZWQgcXVvdGVzLiBPbmNlIGFsbCB0aGVzZSBhcmUgZml4ZWQsCj4gY2hl
Y2tpbmcgZm9yIHRoaXMgY2FuIGJlIGVuYWJsZWQgaW4geWFtbGxpbnQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlh
bWwgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKTm90ZSB0aGF0IEkgYWxyZWFkeSBoYXZlIHRoZSB3aG9sZSB0cmVlIGRvbmUuIEp1
c3Qgbm90IGFsbCBzcGxpdCB1cC4KCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgoKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbAo+IGluZGV4IGRiNTI1M2EyYTc0YS4uOGE1NjQ3M2NkZDVhIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4g
QEAgLTYxLDcgKzYxLDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgaGFydC4gIFRoZXNlIHZhbHVl
cyBvcmlnaW5hdGUgZnJvbSB0aGUgUklTQy1WIFByaXZpbGVnZWQKPiAgICAgICAgU3BlY2lmaWNh
dGlvbiBkb2N1bWVudCwgYXZhaWxhYmxlIGZyb20KPiAgICAgICAgaHR0cHM6Ly9yaXNjdi5vcmcv
c3BlY2lmaWNhdGlvbnMvCj4gLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvc3RyaW5nIgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvc3RyaW5nCj4gICAgICBlbnVtOgo+ICAgICAgICAtIHJpc2N2LHN2MzIKPiAgICAgICAgLSBy
aXNjdixzdjM5Cj4gQEAgLTk1LDcgKzk1LDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgV2hpbGUg
dGhlIGlzYSBzdHJpbmdzIGluIElTQSBzcGVjaWZpY2F0aW9uIGFyZSBjYXNlCj4gICAgICAgIGlu
c2Vuc2l0aXZlLCBsZXR0ZXJzIGluIHRoZSByaXNjdixpc2Egc3RyaW5nIG11c3QgYmUgYWxsCj4g
ICAgICAgIGxvd2VyY2FzZS4KPiAtICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy9zdHJpbmciCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy9zdHJpbmcKPiAgICAgIHBhdHRlcm46IF5ydig/OjY0fDMyKWltYWY/ZD9xP2M/Yj9rP2o/
cD92P2g/KD86W2hzeHpdKD86W2Etel0pKyk/KD86X1toc3h6XSg/OlthLXpdKSspKiQKPgo+ICAg
ICMgUklTQy1WIHJlcXVpcmVzICd0aW1lYmFzZS1mcmVxdWVuY3knIGluIC9jcHVzLCBzbyBkaXNh
bGxvdyBpdCBoZXJlCj4gQEAgLTEyMCw3ICsxMjAsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAt
IGludGVycnVwdC1jb250cm9sbGVyCj4KPiAgICBjcHUtaWRsZS1zdGF0ZXM6Cj4gLSAgICAkcmVm
OiAnL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheScKPiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkKPiAg
ICAgIGl0ZW1zOgo+ICAgICAgICBtYXhJdGVtczogMQo+ICAgICAgZGVzY3JpcHRpb246IHwKPiAt
LQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
