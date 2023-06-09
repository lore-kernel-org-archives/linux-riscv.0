Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF71CC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsQzgHSqhY5Pm4jg04/QZ3ABneCQX8L4spu91pGUaU8=; b=pe0MSO/OuNxiwb
	F7MfeLAhhTrvyM3Wt9hqWaEWJMSKbDGoUng7e5se3vWpKQ4f5rqehgSM0tmH65tPKbyXwSr24I/NM
	wXs8t7FINCqw1eKoqTe3v3tZuwPXPK/lS1HWWvdBYsG9pLZtUXKfjvXkfOUqXEueQVSDCR0wG2+Ga
	oemjuVLJUpVmdoj9PInOOQ88AqhDgcKGCY70DqnjLiLU9eExGKRDOYmsqudYVu9WvsGZJnAtBBiPv
	W+ikgMPyL4ARaQ0y1FcD4O85cw16nUv6Ky0cdeVhqtbGmnbmhgIRuzn/6NZrWcr8jPQG4m7RWJl3T
	hA0IzhEDj6BHgiyWeI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cih-00DC44-2V;
	Fri, 09 Jun 2023 14:04:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cie-00DC3J-04
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:04:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C09B6583D
	for <linux-riscv@lists.infradead.org>; Fri,  9 Jun 2023 14:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56E9C4339E
	for <linux-riscv@lists.infradead.org>; Fri,  9 Jun 2023 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686319438;
	bh=4I/YaRz0JPgSntsbq21xyleaxpnwMk0f+rSHrten7Nw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Li+CI9dmjZpFEyKY0TEnA7JMSOf2g/jK3VQik3pEQaGJXtNdC1mbhlhwfoOqbeM/O
	 C7zj/hGfLvcf0pC+JY5CNaWoNHbU6wwyVwVISv9OUBFLh0Uj4Zd93+snwTcRY6DNOI
	 2aIhhAjus+nq82CirPnQqpSNF6W8UgH230vTi98tauGmmSYiiWzZd+p1yA31PKCftn
	 vBAIU+eR3lwzOLk2/ZR9g1T+Pjx4cm6aQGr7GVBU9jZ5couB7wuur0Gdp+e4RfWs7x
	 TndYjNpGkwSHfiXKXTb4IWtbuVHgNvRWX3Ccd3js8PStYLqDASfAB+ThfJo2IJVG4b
	 1jO486zxpCFlg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b219ed9915so19873331fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 07:03:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDy6YcB/nm+YkjeuGa4uMY2t/0ssLnHCrIbOxphjYEpMFDwHFFXF
	HONfssxreKpEAlSwzvAPaQRSMIv+MeUA1NX2gg==
X-Google-Smtp-Source: ACHHUZ5YQv2XPsQRf7fiS5EHNK3U/O/dTd2T5JKiUmddht7wp+IV/pFj6+87nrAXOzHuwKYwetH7tBI6o/ZkH7J0SvU=
X-Received: by 2002:a2e:9942:0:b0:2b1:b8ad:3456 with SMTP id
 r2-20020a2e9942000000b002b1b8ad3456mr1157920ljj.50.1686319436756; Fri, 09 Jun
 2023 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230608-sitting-bath-31eddc03c5a5@spud> <168624654839.3085745.9088493205796442132.robh@kernel.org>
 <20230608-unlucky-carpenter-b3a95f269712@spud>
In-Reply-To: <20230608-unlucky-carpenter-b3a95f269712@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Jun 2023 08:03:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
Message-ID: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Oleksii <oleksii.kurochko@gmail.com>, 
	Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org, u-boot@lists.denx.de, 
	Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com, 
	Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Rick Chen <rick@andestech.com>, linux-kernel@vger.kernel.org, 
	Leo <ycliang@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_070400_154046_D0D31F03 
X-CRM114-Status: GOOD (  15.37  )
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

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCAxMjowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAxMTo0OTowOEFNIC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFRodSwgMDggSnVuIDIwMjMgMTc6NTQ6MDUg
KzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPgo+ID4gPiBBcyBhIHJlc3VsdCBvZiBpbXBsZW1l
bnRpbmcgU2VhbidzIHN1Z2dlc3Rpb24sIEkgYmVsaWV2ZSBJIG5lZWQgdG8gYWRkCj4gPiA+IHJp
c2N2LGlzYS1leHRlbnNpb25zIGFzIGFuIGV4Y2VwdGlvbiB0byB0aGUgcnVsZXMgcHJldmVudGlu
ZyB2ZW5kb3IKPiA+ID4gcHJvcGVydGllcyBiZWluZyBvZiBvYmplY3QgdHlwZSwgb3RoZXJ3aXNl
IGR0X2JpbmRpbmdfY2hlY2sgaXMgbGVzcyB0aGFuCj4gPiA+IGhhcHB5IHdpdGggbWUuCj4KPiA+
IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4gPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQt
cmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWw6IHByb3BlcnRpZXM6cmlzY3YsaXNhLWV4dGVuc2lvbnM6ICdvbmVPZicg
Y29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKPiA+ICAgICAgIEFkZGl0aW9u
YWwgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdhZGRpdGlvbmFsUHJvcGVydGllcycsICdw
cm9wZXJ0aWVzJyB3ZXJlIHVuZXhwZWN0ZWQpCj4gPiAgICAgICAgICAgICAgIGhpbnQ6IEEgdmVu
ZG9yIGJvb2xlYW4gcHJvcGVydHkgY2FuIHVzZSAidHlwZTogYm9vbGVhbiIKPiA+ICAgICAgIC9i
dWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbDogcHJvcGVydGllczpyaXNjdixpc2Et
ZXh0ZW5zaW9uczogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVk
Ogo+ID4gICAgICAgICAgICAgICAnZW51bScgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+ID4gICAg
ICAgICAgICAgICAnY29uc3QnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ICAgICAgICAgICAg
ICAgaGludDogQSB2ZW5kb3Igc3RyaW5nIHByb3BlcnR5IHdpdGggZXhhY3QgdmFsdWVzIGhhcyBh
biBpbXBsaWNpdCB0eXBlCj4gPiAgICAgICAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy92ZW5kb3ItcHJvcHMueWFtbCMKPiA+ICAgICAg
IEFkZGl0aW9uYWwgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdhZGRpdGlvbmFsUHJvcGVy
dGllcycsICdwcm9wZXJ0aWVzJywgJ3R5cGUnIHdlcmUgdW5leHBlY3RlZCkKPiA+ICAgICAgICAg
ICAgICAgaGludDogQSB2ZW5kb3Igc3RyaW5nIHByb3BlcnR5IHdpdGggZXhhY3QgdmFsdWVzIGhh
cyBhbiBpbXBsaWNpdCB0eXBlCj4gPiAgICAgICAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3
LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWw6IHByb3BlcnRpZXM6cmlzY3YsaXNhLWV4dGVuc2lvbnM6ICdvbmVPZicgY29uZGl0
aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKPiA+ICAgICAgICAgICAgICAgJyRyZWYn
IGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ICAgICAgICAgICAgICAgJ2FsbE9mJyBpcyBhIHJl
cXVpcmVkIHByb3BlcnR5Cj4gPiAgICAgICAgICAgICAgIGhpbnQ6IEEgdmVuZG9yIHByb3BlcnR5
IG5lZWRzIGEgJHJlZiB0byB0eXBlcy55YW1sCj4gPiAgICAgICAgICAgICAgIGZyb20gc2NoZW1h
ICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy92ZW5kb3ItcHJvcHMueWFt
bCMKPiA+ICAgICAgICdib29sZWFuJyB3YXMgZXhwZWN0ZWQKPiA+ICAgICAgICAgICAgICAgaGlu
dDogQSB2ZW5kb3IgYm9vbGVhbiBwcm9wZXJ0eSBjYW4gdXNlICJ0eXBlOiBib29sZWFuIgo+ID4g
ICAgICAgaGludDogVmVuZG9yIHNwZWNpZmljIHByb3BlcnRpZXMgbXVzdCBoYXZlIGEgdHlwZSBh
bmQgZGVzY3JpcHRpb24gdW5sZXNzIHRoZXkgaGF2ZSBhIGRlZmluZWQsIGNvbW1vbiBzdWZmaXgu
Cj4gPiAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvdmVuZG9yLXByb3BzLnlhbWwjCj4KPiBZZWFoLCBleHBlY3RlZC4gSSB0aGluayBJIG5l
ZWQgYW4gZXhjZXB0aW9uIGluIHZlbmRvci1wcm9wcyBmb3IgdGhpcyB0bwo+IHBhc3MgdGhlIGNo
ZWNrcy4KCk5vcGUsIHZlbmRvciBwcmVmaXhlcyBkb24ndCBnbyBpbiBub2RlIG5hbWVzLiBUaGF0
J3Mgbm90IGV4cGxpY2l0CmFueXdoZXJlLCBidXQgZ29lcyBhZ2FpbnN0IHVzaW5nIGdlbmVyaWMg
bm9kZSBuYW1lcy4KCkFsc28sIG5vdGUgdGhhdCBsb29raW5nIGF0IHRoZSBEVCBzcGVjLCB0aGVy
ZSdzIGFscmVhZHkgcHJpb3IgYXJ0IGhlcmUKd2l0aCBQUEMuIFNlZSAicG93ZXItaXNhLSoiLiBU
aG91Z2ggdGhhdCBhcHBlYXJzIGluIC5kdHMgZmlsZXMsIGJ1dCBubwprZXJuZWwgY29kZS4gTWF5
YmUgeW91IGFscmVhZHkgc2F3IHRoYXQgYXMgeW91ciB2MSBpcyBzaW1pbGFyLiBUaGVyZSdzCm5v
dCByZWFsbHkgbXVjaCBhZHZhbnRhZ2UgdG8gYWxpZ24gd2l0aCBpdCwgYnV0IGFsc28gbm90IG11
Y2ggcmVhc29uCnRvIGRldmlhdGUuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
