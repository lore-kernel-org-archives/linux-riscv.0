Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314DCC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 19:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV9VtI5qF6sGFopFIT2H/1qIkKxFvl2LQOYd+3cR+bs=; b=RnT7llW7H89/N7
	brW/yu/gLAUto7fyDT6z6WpBF+6CSWAMgEYRoz5femooHci2VzyixGlvChN+tcu1sdqTP4ZCsHEuU
	SVp6hb5az8SXk7S/vMhVKCDIB7qcEIOnY7dEB9HgSnjezF+mbtO9yJN/mR7OdFDqReLLGn8GdZhf+
	NdzbblBKuF0rcMLqBeO6vxxKuJ6PQyzyNkYXLkoFsT7iMGqxljx41HhHxrREfegXIUSxxl/e0QbFd
	rl1Zux+BKIf66Fcjaq8fVD+UM5dGniZn+gngBWQSRyu90gUPevd74VjAyB327JvLMMCg+KLsESFWy
	CQlVM1xvHLyc7l3hiO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZuO-008rQn-1h;
	Thu, 20 Apr 2023 19:25:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZuL-008rQ8-25
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 19:25:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ec81773d50so787103e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682018726; x=1684610726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWE8R62ug9IOafmgAJdkD07OZG/0r/qUsiJsU6YxK1s=;
        b=OXLQHs0y9Qc5jwHD7/YQdWd1wzdfKoGV6iAPLans6bion+wnXPV70h7FRfcuhFPDWI
         8rkOgkVKlvc1fuxFSDDaAn5n4Tv7EI6r8q70a1pelEzTUSJXA8fGdcoNoOYGpldC2SKr
         HyQTOMCCkY/k+/seYBS61EE01cEjGOOIRl8qy7swTZehHJWWS5ExvhPELc6gyAK5kOu/
         r6Q7aCpTJaf3gOSVt0wYy8+O8scRvU8BTTh51drGcxAgl7kjsz55fmdgUatFOcPxWNhZ
         HDtsu31PaWIDJ7Avzj1GHWJ88HeX3Yr66LB2G0Hmce7Y0I0vziigIQhGiA+89lWwi/xM
         Wyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682018726; x=1684610726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWE8R62ug9IOafmgAJdkD07OZG/0r/qUsiJsU6YxK1s=;
        b=Mmp8KHPRRm5Hm9GzMSLwuFDcVhhBGWcO2t3pfsbpAK87DdfA3F2vcRLtnYj9HXPjJ4
         IBXjVkxrC8KotSviRhwlTOsWOrH2uPK/DxAV3JCUdsbJD4uMQ/H62uEQjZqfb2w83g1g
         6OXMkNjLZ3WPoMEasdWGm0YXWJdkXlgH/yULOS6uWjpeQfAIqfVrju1ozcwFCBmYiQbj
         trFC7t+ZejDaRARyL04otOizPmN+x7MxSwrz26eGVkT3jWhFrkCGXFF84/bAsON2eR8W
         W0samIibWMkOTkOkAc7OIUrcXsFpVaIOLodFJGxC6+FWlKvlcI9oPVCibGU0mwJCpGT8
         y4qQ==
X-Gm-Message-State: AAQBX9ego6HzMcUgFCzE+c2x79gG61RP+SaxseEuseFl5UcKanY5/UU0
	PNHZg4cmy0sKlP6fVX6ZmFVCFTKdKulBNJuisf4blA==
X-Google-Smtp-Source: AKy350Y+3QsWnzmHhCpX/QL9+ftZJqg6k4XpDD7ALs4aOzFlfXXBGpwyJA8JWdFuufJ9Lg4e+ZVgqvNMQH7RHTJc7k0=
X-Received: by 2002:ac2:5ec4:0:b0:4ec:9368:cb55 with SMTP id
 d4-20020ac25ec4000000b004ec9368cb55mr651216lfq.64.1682018726404; Thu, 20 Apr
 2023 12:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230420-wound-gizzard-2b2b589d9bea@spud>
In-Reply-To: <20230420-wound-gizzard-2b2b589d9bea@spud>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 20 Apr 2023 12:24:50 -0700
Message-ID: <CALs-HsvgYZSaDmSJ1XPVbcqBuLD8XyynJOa-ETajG4GxAoWqOA@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: include cpufeature.h in cpufeature.c
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_122529_688694_1B0B255E 
X-CRM114-Status: GOOD (  10.09  )
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

T24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgMTE6MzDigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPgo+IEF1dG9tYXRpb24gY29tcGxhaW5zOgo+IHdhcm5pbmc6IHN5bWJvbCAn
X19wY3B1X3Njb3BlX21pc2FsaWduZWRfYWNjZXNzX3NwZWVkJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPwo+Cj4gY3B1ZmVhdHVyZS5jIGRvZXNuJ3QgYWN0dWFsbHkgaW5j
bHVkZSB0aGUgaGVhZGVyIG9mIHRoZSBzYW1lIG5hbWUsIGFzIGl0Cj4gaGFkIG5vdCBwcmV2aW91
c2x5IHVzZWQgYW55dGhpbmcgZnJvbSBpdC4KPiBUaGUgcGVyLWNwdSB2YXJpYWJsZSBpcyBkZWNs
YXJlZCB0aGVyZSwgc28gaW5jbHVkZSBpdCB0byBzaWxlbmNlIHRoZQo+IGNvbXBsYWludHMuCj4K
PiBGaXhlczogNjJhMzFkNmUzOGJkICgiUklTQy1WOiBod3Byb2JlOiBTdXBwb3J0IHByb2Jpbmcg
b2YgbWlzYWxpZ25lZCBhY2Nlc3MgcGVyZm9ybWFuY2UiKQo+IFNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gQ0M6IEV2YW4gR3Jl
ZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+IENDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPgo+IENDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4g
Q0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KVGhhbmtzIENvbm9yIQoK
UmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKcHMgLSBJJ20gd29y
a2luZyBvbiB0aGF0IG1vZHByb2JlIGZpeCBub3csIHdpbGwgc2VuZCBzb21ldGhpbmcgc2hvcnRs
eS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
