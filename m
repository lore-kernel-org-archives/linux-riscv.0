Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485BDEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaSpfHW9owZhukXcHlGdDZKnmf36eBkBYcHzVE3TMwE=; b=0h7AJAlN5oVrBl
	y6/bn38ilfa4fD9BzUVS4wPq+KLHCsz5QO8CkjA5Fk97fyvS2mDfq6XNuFLcMXz4fiMOFd0A3J6/2
	6gHG11vAix5M2MFVrSSAvgB6RUM0loocSXbCj2buDclBo7p8gR/g6ACqnBDSVp71pqigvlSfDnQ3d
	6jS1ihR1ZKly4RGJP4ytykAKkCPfY2yKZGdXCXhxZMZF+jQOasQmZ71qrb3sNOmTjIMw+jiqZGpRY
	x/ZNpEjKjv+NEqb07tiummEm6vXnBGxBkJtx076IzWV+3qiBXmAa+yPQ9+dolm7SRfEuZVAMOq517
	HpDuUYMvJvjYKYgYbA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHmK-00264U-25;
	Fri, 28 Jul 2023 07:20:48 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHmH-00263Z-2P
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:20:47 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so26657221fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690528843; x=1691133643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkEJgaTxs/ddkAEFRCk2052gAcbygjssKU7AjsGzwec=;
        b=PKQK3qh1VT8jWnxGjPqzEVsJuktxUM1+9+LsRoGobu0ema7mHkV2H7s6B44fGP6u0y
         vYu6LWth0HrM+LQQpLoXSUx5GaLx8NtfKPAWlWnIYc0/RLtOewMQhwXBz2FShmr9NO02
         MYxGpnAgxWm1C1bmbIs+P8NwK/IwN99YZkfj/PnK7QNXzBTEWJyq3RY55mpICMpteKf7
         IcztGUSxxtggRc0qNgriTRKa9zOJmvGxUIbPZ16XNNAeAB0vyYPHFgKFibRMZPxwaNOu
         MiSVRpatWcyzTLZjpEQyCYAX6xzBAw4hIaD9CbgmNd1rOnYRTeSrtCIzXGsUOXLf0vta
         kmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528843; x=1691133643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkEJgaTxs/ddkAEFRCk2052gAcbygjssKU7AjsGzwec=;
        b=a5I4Qcas7BMiuHCd2C+hrC4BcTFUaFGi3hXt1lgzg6GyeZS+LLYQAgEQlJTIrhEjhJ
         dXeInoR6Dl+2nfWhvL6zmd3yT+q0iq4OrRXq+OOmgiFBKzr9mGhdVvdDFJQ0b4bFdzO/
         qJ7LoU77j85V7XvOWNR88pAFKmtDw7bBphxx54AN3/WWBFWfP3LQstdE8RbpzK/xbU9t
         o4VMHMgE8lDl4CLFgNXZDxAaeFg3pQwqMmWZ9AOsbqdW2/Fh8a05t7rNFhtj81Pz6LdJ
         dICgJMjwsJx4A2SBC93MD0Vy1ZL2XAQSGaeC0IHtc78G+VmvsMbWdj2CuxK76ARbumCL
         TV1A==
X-Gm-Message-State: ABy/qLZgVCKUor+movfas0ZLYDrWltiXszLTSVmqqhij2T3BhQOkTeI4
	GhIFEqsdaHJTFQLz9I4vRzii8zj0+BALXARIFB2XQg==
X-Google-Smtp-Source: APBJJlEYv4VXz8ssay967YiIFAwaE1Bq5ymyjMJx4WO3gnt0z/waK2x38yUfDHp5coKHkN/e3yk5XwZu3CgAkivseE8=
X-Received: by 2002:a2e:84c6:0:b0:2b9:ac48:d804 with SMTP id
 q6-20020a2e84c6000000b002b9ac48d804mr1129754ljh.38.1690528843528; Fri, 28 Jul
 2023 00:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org> <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
 <20230728-penpal-prelude-29a952c03827@wendy>
In-Reply-To: <20230728-penpal-prelude-29a952c03827@wendy>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 28 Jul 2023 15:20:32 +0800
Message-ID: <CAPqJEFo3LPuwm6dtgdMP243jYtT23LjaFvXDVQiF876WmOw1bQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_002045_831827_183F1E44 
X-CRM114-Status: GOOD (  20.78  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMDI6
MDE6MjhQTSArMDgwMCwgRXJpYyBMaW4gd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPgo+ID4g
T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgNDozNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPiA+
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAy
MC8wNy8yMDIzIDE1OjUxLCBFcmljIExpbiB3cm90ZToKPiA+ID4gPiBUaGlzIGFkZCBZQU1MIERU
IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgU2lGaXZlIFByaXZhdGUgTDIKPiA+ID4gPiBjYWNo
ZSBjb250cm9sbGVyCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFcmljIExpbiA8ZXJp
Yy5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBz
aWZpdmUuY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC4uLgo+ID4gPgo+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4g
PiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gPiArICAgICAgLSBj
b25zdDogc2lmaXZlLHBsMmNhY2hlMQo+ID4gPgo+ID4gPiBJIHN0aWxsIGhhdmUgZG91YnRzIHRo
YXQgaXQgaXMgbm90IHVzZWQgaW4gYW55IFNvQy4gVGhpcyBpcyB3aGF0IHlvdQo+ID4gPiBzYWlk
IGxhc3QgdGltZTogImlzIG5vdCBwYXJ0IG9mIGFueSBTb0MuIgo+ID4gPiBJZiBub3QgcGFydCBv
ZiBhbnkgU29DLCB0aGVuIHdoZXJlIGlzIGl0PyBXaHkgYXJlIHlvdSBhZGRpbmcgaXQgdG8gdGhl
Cj4gPiA+IGtlcm5lbD8KPiA+ID4KPiA+Cj4gPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuIEkg
ZGlkbid0IGRlc2NyaWJlIGl0IGNsZWFybHkgbGFzdCB0aW1lLgo+ID4gQ3VycmVudGx5LCB3ZSBo
YXZlIHR3byBoYXJkd2FyZSB2ZXJzaW9ucyBvZiBwbDJjYWNoZTogcGwyY2FjaGUwIGFuZCBwbDJj
YWNoZTEuCj4gPiBUaGUgcGwyY2FjaGUwIGlzIHVzZWQgaW4gdW5tYXRjaGVkIGJvYXJkIFNvQy4K
Pgo+IFdhaXQgYSBzZWNvbmQsIGRvZXMgdGhlIGZ1NzQwIG9uIHRoZSB1bm1hdGNoZWQgbm90IGhh
dmUgYSBjY2FjaGUgYXMKPiBpdCdzIEwyIGNhY2hlPwo+CgpIaSBDb25vciwKU29ycnksIEkgbWlz
cmVtZW1iZXIgdGhlIEwyIGNhY2hlIG9uIHRoZSB1bm1hdGNoZWQgYm9hcmQuCkkganVzdCBjaGVj
ayBhZ2Fpbi4gVGhlIHVubWF0Y2hlZCBib2FyZCBMMiBjYWNoZSBpcyBjY2FjaGUgbm90CnBsMmNh
Y2hlMC4gWW91IGFyZSByaWdodC4gVGhhbmtzLgoKQmVzdCByZWdhcmRzLApFcmljIExpbgoKPiA+
IFRoZSBwbDJjYWNoZTEgaXMKPiA+IHV0aWxpemVkIGluIG91ciBpbnRlcm5hbCBGUEdBIHBsYXRm
b3JtIGZvciBldmFsdWF0aW9uOyBpdCdzIG91ciBjb3JlCj4gPiBJUC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
