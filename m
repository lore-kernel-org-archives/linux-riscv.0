Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89C0105F7AE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgJB5HKVe9naIEaeGHXDcEN+CsEnQgEvDhhRzKV/+HU=; b=yebWblqZARPV3P
	hCL4MRZQxRj1P9UI19WiFcCAyhTwPrIZF0zzWy4oXccBYX3TwdmwQLUqPaxwX2CVQjsbFbDkYPq9s
	Ej+q0Z3nCMPAK6VP8L4E50McXMToSBb/Noii2BdK3ho1OcBOSa3jx5fP+zOs6vT5D6U8nJQWWhrZL
	Urqu6WMPzZqzR2uzjdISrz12TP3D8Yv+gY3IBtJ94kJKgn7P8Ggh8LpM2A+8CkDpQmW9tOkDGQ939
	5Hf9Vf8yj1d70CjHuZvRkjAzp+Z/uF8gwMWVuZ9UvpHRIT4uJvv6PAoTtq+VDZGIRweYC9MYGVxJ9
	adge9va0qGOePkukCOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ia-00000000Plf-3xXR;
	Fri, 13 Mar 2026 14:42:24 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13iY-00000000PlH-2Bs3
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:42:23 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-89a1347051aso23654876d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773412941; cv=none;
        d=google.com; s=arc-20240605;
        b=hKUS/+Wtfg/XEN8SkwHU/DctIJP53/xIxk5AA1dMHSy8B8kugVsluKdxhhTS9ibDT3
         OakDIAA4je9gje9LGbjbJz6tl0e8xW5Bs1174lsmYIZNRtLNhOvWgCB887hP+bED9C3p
         97jJk1QOCC81DzlF+n3N0bqKGODHSujCrOv2JlOAXPL7mc5BUDJfo+yAQvaz3nh1k4p+
         mjoO+1S7+DrcFE/AP/m8ljcSe1Tyb7tTkGZFpttwxMy+P8IfUyhKk+AWAuzBSpbJXlks
         GXMQSl1yf0fZEkgO+K2l2VkTvoTcaVk4vUbqS5tz7FPXYm7/UwphpXpADPIAsL3ucsvk
         F7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        fh=Hol6SuoJdFQo2TTfS1UCY68pYnPxr0tWk92Q7JAXXLM=;
        b=dJKvN5owlREzsVkZUZcuj7mNUDB2PA2y8H5lIdvMqurvvb/gB69ArfdKDx+K9J9lit
         lpEyLkHQhETMwY1B3WdNVUdfjz1EBLe5Sz5BCLUcM36/TLw07yf40b5Sz7YQzBnQipXk
         vpwHD4UJOm7pGe6MimU/CiUC/hcpKNUQSkZy7CoMdrDYUfaQxIsnKL39exzM/yPG5Yz/
         4zbHHW5frO28InJPmZ0RdcIyN+T4/+bNcJMMRCb1iNGMFZuCJmxTI3fucTfmI7aBkGFR
         YB+A9IXzkztFwja0lpJXa1CbfgwaiWGxU0MoQRgqidAfTMj8eonpqe3B1lgNrvb1LMED
         LVEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773412941; x=1774017741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        b=EmMmk8Jf1g1CGrNDtthRwOKMv5Ll4wW+BSrEYc9BZR4HSws98zrWtjF/Vf+Evnf1f3
         z2LRob+7hpBwKELYwVrmZH+VpMrT4u41XhX9y74fK/iHsySjg9EI+zQLy3XyGYOc9tgL
         8qd3z/jJf+Pv3LSffCUYpvUIwYoS954D8JJ4IFzda/zJNJYmFKc9CuFB1M3lZAaxk0fX
         3WFpOFxYzBWLDamorocjj3ibsoKnUbJYPRUkwwVqXImYP3qyjN5lRXrBaEhoQs5VrCe1
         1z0jiJ9cfyApSWp0S2VmIesOzeG9l3xfE0GysDMHHQd41M3Dez/Uj7YWujxsOjIxYNIw
         o6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412941; x=1774017741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qc+mZxTV+FdzmhrCNMAZNBcHZoz8P43EP82OiNbVxfA=;
        b=IWdkTdJVjS0ZFdSP0LPxY8BlE8AGoU0P3RnIKxECUIJ37BR9zH4oJk1hKrCswRagdP
         mSTPKHQVT6ZB5yv9JabYFXcHISIR/W9316Q8B3FcQm8PYI1NWpxMqwRuBXdpbGH/n6Kt
         iNYKhQJKqElSQz6JFwzRFu2MxPxhVeV1TvLKomHbnwBP27zQ5aC+dTYoDFIumugvofZB
         Vr8lbuHKXoP2N9uObKWNSKLeBLwdr9dUXvJSJFTRZaV1RJqXwdJ3dKO+5n3Goy5UE9pW
         bvyjK3PsyaNjbeQ9q0UPU1T5sk0MQbJ3aC3B8LBMqUeuVaCeNWU4uhs3VboQH+8/iTyQ
         tclQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtnrdjRTzQvzVQ3mkjq0cvDCW7RUND1NEhokXuiGAsCz2e2Sd4hDA7DvxEvp6KrC0UeFSeL1J3IhVX7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkxfEVbbSWrj/iaYs2sMf3hrWAhkv3nA4N6qWVEImlS1bpi5t
	eT+RF6VzyY6X72+XE6p2BF9rD+DpiaMGPEXnuYE4atHLQcLRTiEfmCCpKZATDJEnKRJmPsH72F8
	BFf+ksN/Pd6FsXbtsrcuF3v0V9OusxqU=
X-Gm-Gg: ATEYQzzZ3bwkypDJNVmeQWyxEMKAmfHqUAcxYWw9B+ABPZpUMrie3GG7YCsIGUhbHxy
	RjLp9CDGChaB7PGT6aNW4Y9f4JaR96ZiUJyWMU3uuMNgyBVzwd+i6zh3f3h5FXrh1dqQN7xy3y+
	rE+0miMngUOhPub/vBKT17OOrnYVsw3S2nKzY3tFAwmLvC4h/Uz7muZ4ssk2XN7CpDf92a8DYFx
	ZdgOmgTeAsl2OeQYaqqdsIYH7iMrXLbdLqrH0IBjfqKYCNHO3r9is7M4F3gYXOECd/KdndtZFzR
	iCgGcw==
X-Received: by 2002:a05:622a:1a8c:b0:503:4251:6597 with SMTP id
 d75a77b69052e-50957cc6720mr50149121cf.29.1773412941102; Fri, 13 Mar 2026
 07:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com> <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
In-Reply-To: <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 20:12:02 +0530
X-Gm-Features: AaiRm51P57qcJuyAf0DEi9SoGi5rXwcJCFXanh2EQoeiyawGvbU2ynSwbZwPkSA
Message-ID: <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074222_600369_66500DD1 
X-CRM114-Status: GOOD (  29.87  )
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

SGkgVHJldm9yLAoKT24gRnJpLCAxMyBNYXIgMjAyNiBhdCAxOToyNiwgVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDIwMjYtMDMtMDkgMDc6NDAs
IElrZXIgUGVkcm9zYSB3cm90ZToKPiA+IEFkZCBjb21wbGV0ZSBTRCBjYXJkIGNvbnRyb2xsZXIg
c3VwcG9ydCB3aXRoIFVIUyBoaWdoLXNwZWVkIG1vZGVzLgo+ID4KPiA+IC0gRW5hYmxlIHNkaGNp
MCBjb250cm9sbGVyIHdpdGggNC1iaXQgYnVzIHdpZHRoCj4gPiAtIENvbmZpZ3VyZSBjYXJkIGRl
dGVjdCBHUElPIHdpdGggaW52ZXJzaW9uCj4gPiAtIENvbm5lY3Qgdm1tYy1zdXBwbHkgdG8gYnVj
azQgZm9yIDMuM1YgY2FyZCBwb3dlcgo+ID4gLSBDb25uZWN0IHZxbW1jLXN1cHBseSB0byBhbGRv
MSBmb3IgMS44Vi8zLjNWIEkvTyBzd2l0Y2hpbmcKPiA+IC0gQWRkIGR1YWwgcGluY3RybCBzdGF0
ZXMgZm9yIHZvbHRhZ2UtZGVwZW5kZW50IHBpbiBjb25maWd1cmF0aW9uCj4gPiAtIFN1cHBvcnQg
VUhTLUkgU0RSMjUsIFNEUjUwLCBhbmQgU0RSMTA0IG1vZGVzCj4gPgo+ID4gVGhpcyBlbmFibGVz
IGZ1bGwgU0QgY2FyZCBmdW5jdGlvbmFsaXR5IGluY2x1ZGluZyBoaWdoLXNwZWVkIFVIUyBtb2Rl
cwo+ID4gZm9yIGltcHJvdmVkIHBlcmZvcm1hbmNlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElr
ZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW9yYW5nZXBpLXJ2Mi5kdHMgfCAxOSArKysrKysrKysr
KysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYy
LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwo+
ID4gaW5kZXggNDE0YjAzZjVlNjQ4MGYwNWY1ZDdlZWFhYTBhZmI0ZTg2NDI1YWUzNi4uMzYxMTM1
MjY5ODAxZjQzNjcwM2I2ZjFkNzY4YzkxMzI1YTUyZjA3ZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gPiBAQCAtMTQw
LDMgKzE0MCwyMiBAQCBzZF92cW1tYzogYWxkbzEgewo+ID4gICAgICAgICAgICAgICB9Owo+ID4g
ICAgICAgfTsKPiA+ICAgfTsKPiA+ICsKPiA+ICsmc2RoY2kwIHsKPiA+ICsgICAgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCIsICJzdGF0ZV91aHMiOwo+ID4gKyAgICAgcGluY3RybC0wID0gPCZt
bWMxX2NmZz47Cj4gPiArICAgICBwaW5jdHJsLTEgPSA8Jm1tYzFfdWhzX2NmZz47Cj4gPiArICAg
ICBidXMtd2lkdGggPSA8ND47Cj4gPiArICAgICBjZC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDgw
KSBHUElPX0FDVElWRV9ISUdIPjsKPiA+ICsgICAgIGNkLWludmVydGVkOwo+ID4gKyAgICAgbm8t
bW1jOwo+ID4gKyAgICAgbm8tc2RpbzsKPiA+ICsgICAgIGRpc2FibGUtd3A7Cj4gPiArICAgICBj
YXAtc2QtaGlnaHNwZWVkOwo+ID4gKyAgICAgdm1tYy1zdXBwbHkgPSA8JnNkX3ZtbWM+Owo+ID4g
KyAgICAgdnFtbWMtc3VwcGx5ID0gPCZzZF92cW1tYz47Cj4gPiArICAgICBzZC11aHMtc2RyMjU7
Cj4gPiArICAgICBzZC11aHMtc2RyNTA7Cj4gPiArICAgICBzZC11aHMtc2RyMTA0Owo+ID4gKyAg
ICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPgo+IEhlbGxvIGFnYWluLAo+Cj4gVGhhbmtz
IGZvciBkb2luZyB0aGlzIHdvcmsuIE15IGNvbGxlYWd1ZXMgYW5kIEkgaGF2ZSBiZWVuIHRlc3Rp
bmcgdGhpcwo+IG9uIGFuIE9yYW5nZVBpIFJWMiwgYW5kIGFsc28gYSBNdXNlIFBpIFBybyBib2Fy
ZCAobWFraW5nIGEgc2ltaWxhciB0d2Vhawo+IHRvIHRoaXMgcGF0Y2ggaW4gazEtbXVzZXBpLXBy
by5kdHMpLiBUbyBkbyB0aGUgdGVzdGluZyBvbiBteSBlbmQsIEknbQo+IGFwcGx5aW5nIHRoZSBw
YXRjaCBzZXJpZXMgb24gdG9wIG9mIDYuMTkgaW4gYSBZb2N0byBCU1AuCj4KPiBJJ3ZlIGJlZW4g
ZmluZGluZyB0aGF0IEkgc2VlIGlzc3VlcyB3aXRoIHRoZSBVSFMgc3VwcG9ydCBvbiBteSBzaWRl
Cj4gKHRoaXMgbG9nIGNvbWVzIGZyb20gYW4gaW1hZ2UgYnVpbHQgYW5kIGZsYXNoZWQgdG8gYW4g
U0QgY2FyZCk6Cj4KPgo+IFsgMS4wNzI0MTddIHNkaGNpLXNwYWNlbWl0IGQ0MjgwMDAwLm1tYzog
R290IENEIEdQSU8KPiBbIDEuMTA5NzQxXSBtbWMwOiBTREhDSSBjb250cm9sbGVyIG9uIGQ0Mjgw
MDAwLm1tYyBbZDQyODAwMDAubW1jXSB1c2luZwo+IEFETUEKPiBbIDEuMTE0NTg5XSBjbGs6IERp
c2FibGluZyB1bnVzZWQgY2xvY2tzCj4gWyAxLjExODQyMV0gUE06IGdlbnBkOiBEaXNhYmxpbmcg
dW51c2VkIHBvd2VyIGRvbWFpbnMKPiBbIDEuMTIzMjQ5XSBBTFNBIGRldmljZSBsaXN0Ogo+IFsg
MS4xMjZbIDEuMTI5OTQ5XSBjaGVjayBhY2Nlc3MgZm9yIHJkaW5pdD0vaW5pdCBmYWlsZWQ6IC0y
LCBpZ25vcmluZwo+IFsgMS4xMzMyODRdIFdhaXRpbmcgZm9yIHJvb3QgZGV2aWNlCj4gUEFSVFVV
SUQ9ZTk0YmZkZDctYTM2Zi00MzE1LWE0ODAtNDc2ZTJhMTI0MDNkLi4uCj4gWyAxLjE3NjU2OV0g
bW1jMDogbmV3IFVIUy1JIHNwZWVkIEREUjUwIFNESEMgY2FyZCBhdCBhZGRyZXNzIGFhYWEKPiBb
IDEuMTgwNzMyXSBtbWNibGswOiBtbWMwOmFhYWEgU1MxNkcgMTQuOCBHaUIKPiBbIDEuMjc2MjY4
XSBtbWNibGswOiByZWNvdmVyeSBmYWlsZWQhCj4gWyAxLjI3NzM1MV0gSS9PIGVycm9yLCBkZXYg
bW1jYmxrMCwgc2VjdG9yIDAgb3AgMHgwOihSRUFEKSBmbGFncwo+IDB4ODAwMDAwIHBoeXNfc2Vn
IDEgcHJpbyBjbGFzcyAyCj4gWyAxLjI4NjM0Nl0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbW1j
YmxrMCwgbG9naWNhbCBibG9jayAwLCBhc3luYyBwYWdlCj4gcmVhZAo+IFsgMS4yOTM4OTFdIG1t
Y2JsazA6IHJlY292ZXJ5IGZhaWxlZCEKPiBbIDEuMjk3Mjg5XSBJL08gZXJyb3IsIGRldiBtbWNi
bGswLCBzZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzCj4gMHg4MDAwMDAgcGh5c19zZWcgMSBw
cmlvIGNsYXNzIDIKPiBbIDEuMzA2MjY5XSBCdWZmZXIgSS9PIGVycm9yIG9uIGRldiBtbWNibGsw
LCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIHBhZ2UKPiByZWFkCj4gWyAxLjMxMzUyMl0gbW1jYmxr
MDogdW5hYmxlIHRvIHJlYWQgcGFydGl0aW9uIHRhYmxlCj4KPgo+IEF0IGZpcnN0IEkgd29uZGVy
ZWQgaWYgbWF5YmUgdGhlcmUgd2FzIGFuIGlzc3VlIHdpdGggdGhlIGNhcmQgaXRzZWxmLAo+IGJ1
dCBieSBjaGFuZ2luZyB0aGUgc2RoY2kwIHNlY3Rpb24gdG8gdGhpcywgSSdtIGFibGUgdG8gcmVh
ZCB0aGUgU0QganVzdAo+IGZpbmU6Cj4KSSB1c2VkIHRoZSBzYW1lIGV4YW1wbGUgb24gdGhlIEsx
LU9yYW5nZVBpLVJWMiBEVFMsCkJ1dCBpdOKAmXMgc2xpZ2h0bHkgZGlmZmVyZW50IGZyb20gdGhl
IG9uZSB5b3XigJlyZSB3b3JraW5nIHdpdGguCkkgdGVzdGVkIG9uIHRoZSBsYXRlc3QgIDcuMC1y
YzMuCgo+ICZzZGhjaTAgewo+ICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ICAgICAgICAgICBwaW5jdHJsLTAgPSA8Jm1tYzFfY2ZnPjsKPiAgICAgICAgICAgYnVzLXdpZHRo
ID0gPDQ+Owo+ICAgICAgICAgICBjZC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDgwKSBHUElPX0FD
VElWRV9ISUdIPjsKPiAgICAgICAgICAgY2QtaW52ZXJ0ZWQ7Cj4gICAgICAgICAgIG5vLW1tYzsK
PiAgICAgICAgICAgbm8tc2RpbzsKPiAgICAgICAgICAgZGlzYWJsZS13cDsKPiAgICAgICAgICAg
dm1tYy1zdXBwbHkgPSA8JnNkX3ZtbWM+Owo+ICAgICAgICAgICB2cW1tYy1zdXBwbHkgPSA8JnNk
X3ZxbW1jPjsKPiAgICAgICAgICAgbm8tMS04LXY7Cj4gICAgICAgICAgIHN0YXR1cyA9ICJva2F5
IjsKPiB9Owo+CisKKyZzZGhjaTAgeworICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIs
ICJzdGF0ZV91aHMiOworICAgICAgIHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+OworICAgICAgIHBp
bmN0cmwtMSA9IDwmbW1jMV91aHNfY2ZnPjsKKyAgICAgICBidXMtd2lkdGggPSA8ND47CisgICAg
ICAgY2QtZ3Bpb3MgPSA8JmdwaW8gSzFfR1BJTyg4MCkgR1BJT19BQ1RJVkVfSElHSD47CisgICAg
ICAgY2QtaW52ZXJ0ZWQ7CisgICAgICAgbm8tbW1jOworICAgICAgIG5vLXNkaW87CisgICAgICAg
ZGlzYWJsZS13cDsKKyAgICAgICBjYXAtc2QtaGlnaHNwZWVkOworICAgICAgIHZtbWMtc3VwcGx5
ID0gPCZzZF92bW1jPjsKKyAgICAgICB2cW1tYy1zdXBwbHkgPSA8JnNkX3ZxbW1jPjsKKyAgICAg
ICBzZC11aHMtc2RyMjU7CisgICAgICAgc2QtdWhzLXNkcjUwOworICAgICAgIHNkLXVocy1zZHIx
MDQ7CisgICAgICAgc3RhdHVzID0gIm9rYXkiOworfTsKClRoYW5rcwotQW5hbmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
