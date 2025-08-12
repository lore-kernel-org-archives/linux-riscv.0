Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54265CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4ZttW3KKklVN/LEBEaYPy2tIvxCjvfUU8PMLmB5rtA=; b=MSVUS//bt3Vocu
	72hzJYxsET0O9dIh12ioYMij1SQQQlH4PhjctstuPbBIRivTigmKNW601uSGUQUgC67Fxr/2OIN9/
	hhF01yK9DLaoCiW2JxBcNFcqzV1fcR4pACB4AHjxaFOT8WAO8qa35MmLpl63XJIOrrWxoyi1j6hcg
	9YHw26+uEsPXuCThlr5KahUNjVQfMSCcQfjXUkh6yoZ/kW4BPodcT8DfRj9eXMxPfwWNYc8NrzNiq
	k/A1S5LhpPqcAHIN/yFPQfk07W7PcqMsxQeSPD6d5mlRdKMJxEZMfWsHgzDjbe8FnmFow6YEe8TQO
	oK6J29Dc7lwSuWoc577A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloJ2-0000000AngU-2Bfx;
	Tue, 12 Aug 2025 12:40:44 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullDv-0000000AMyN-3tQ7
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:23:18 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e9173b5fa26so1006638276.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754990594; x=1755595394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oXbJx6E3ijqdJvhjzvA4M+RPwmHgHT1829C53wx0lE=;
        b=TX+MGoH3gfraXohigzqVA2cVNVwyWBNdE24W5fKCj+3KO6UPy0kFsn2eBa3y06TjbG
         cnPUU5h98f5egNBur5MlkNze6nibIgli1FcUoZvYeoY9WF8z2OvZ0GwVJN8syrmmAOPg
         YBfPajXWVmiq9Yd4/PSiW/xLBTFjMtxnvnfUJFRZvLFhKNqqVkKAbnPU5NiouLVoRF69
         JISOdZKkdIZtV8MLlWgHibbtfB+pX6kvyezuTMB8AlNeMOzsCxKW+0D8B9ctKzwWxXMu
         Yd1sEKk9Ti4ZlRTpssjriYQNUek5tLh0esgo/N5yx8JroOIcMRHtrhkhAGqDRP07dz1s
         oyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990594; x=1755595394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oXbJx6E3ijqdJvhjzvA4M+RPwmHgHT1829C53wx0lE=;
        b=Z0wZnyQuUJzDeFOklwIcGkQj+dR4nu0BWdLKWNWJ/+OzoDf6g3x+ewWHyjxy23DEfh
         ygjuAtOKzbW3++Ioz59FotUI8nUzLK06hMFEyg4szW/Oz0duGmdMgXE6lHfsEhSKVZ07
         /7stdwk8OFhNC8pr6Yiwf58R0L/7ROiSnTTjHU8qWeX8kHt/a6UJiUt7Gh83G5SGVFyV
         cdZ3zVHTZUXEi/6uXEFtoFDqQWaRmB14RGM2SUtI5gf5lMRMU6wdtUOXHwue9u181lSF
         orIIX6AwEH/yDW/w4fO3mELpttBZcyKcG5A5WKNQNWNZN5PntzSp1sveP2vH2kwr+QX9
         KGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk51t07imXfkgl8oOZ0fhnfX1uSmxCJBnYh9ss/hTTzy/T9PfO7YvHh4hbh6Oor9TlNhJHwvVU3pdMyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLOS9zunQr5gjZPy0M2V4pXrCka4+zFAk2gt/7L4kMCd30rMuv
	y66Jt8ECy6TnJkUFyN0ztmEaXbqmPeG7OyFXNkYerUMU2MI7ktXKCw1oCAWolJBgO+uT/Pnq+rK
	2W2i1M+oOdYJ9Rd8omEj1HxbUTRigDCb9b3zZ5n7PnQ==
X-Gm-Gg: ASbGncuMw3RVfWJAeHkD5DOT2J4EZSyZzO+BjxitBi/XJ/sxCZSvUekyj8NOI14Io+W
	BCJWieb68GvljngQ/De2xcdHg02qluEF/5R300aVnAyZkSoh8uAP46o5pJurUP9hkaqCPKK5ZXg
	naOKREF2slIRVGmbPrDP59wPzYRBsV+pAWu1qOlUid+KZRtIAicV4c98UzQgbkGad1YE3DMch85
	zbgzQ==
X-Google-Smtp-Source: AGHT+IH77Kjt8YC9sfRPn8ADNNC7hjxOUoD/Dna6Dolf20ZY+41dtteIkmZw9xyyoKWcmYqmqjNzYuop1VYhnZfQUKU=
X-Received: by 2002:a05:690c:46c9:b0:71c:1a46:48d6 with SMTP id
 00721157ae682-71c42964fc4mr37731957b3.1.1754990594494; Tue, 12 Aug 2025
 02:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com> <20250714-working_dma_0701_v2-v3-4-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-4-8b0f5cd71595@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 12 Aug 2025 17:23:02 +0800
X-Gm-Features: Ac12FXzwCXGXSKiwmxKY93OBxvFdFv-jw-xOzVu8Q_eshKd5oaEN163nC5iHGgE
Message-ID: <CAH1PCMYtYfJYAt_Ah4WW_ps3tPuYLMvanKExhk9t_VRHkRwnng@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022316_203468_D2A90D1F 
X-CRM114-Status: GOOD (  11.97  )
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

SGksIFZpbm9kCgpKdXN0IGEgZ2VudGxlIHJlbWluZGVyIG9uIHRoaXMgcGF0Y2ggc2VyaWVzLiBJ
J3ZlIGluY29ycG9yYXRlZCB5b3VyCmZlZWRiYWNrIGZyb20gdjEgYnkgc3BsaXR0aW5nIHRoZSB3
b3JrIGludG8gdHdvIGluZGVwZW5kZW50IHBhdGNoZXM6CiAtIHRoaXMgcGF0Y2g6IFtQQVRDSCB2
MyA0LzhdIGRtYWVuZ2luZTogbW1wX3BkbWE6IEFkZCBvcGVyYXRpb25zIHN0cnVjdHVyZQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgY29udHJvbGxlciBhYnN0cmFjdGlvbgogLSBu
ZXh0IHBhdGNoOiBbUEFUQ0ggdjMgNS84XSBkbWFlbmdpbmU6IG1tcF9wZG1hOiBBZGQgU3BhY2Vt
aVQgSzEgUERNQQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdXBwb3J0IHdpdGggNjQt
Yml0IGFkZHJlc3NpbmcKCkNvdWxkIHlvdSBwbGVhc2UgdGFrZSBhbm90aGVyIGxvb2sgd2hlbiB5
b3UgaGF2ZSBhIG1vbWVudD8KClRoYW5rIHlvdSB2ZXJ5IG11Y2guCgpCUiwKR3VvZG9uZyBYdQoK
T24gTW9uLCBKdWwgMTQsIDIwMjUgYXQgNTo0MOKAr1BNIEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPiB3cm90ZToKPgo+IEludHJvZHVjZSBtbXBfcGRtYV9vcHMgc3RydWN0dXJlIHRv
IGFic3RyYWN0IDMyLWJpdCBhZGRyZXNzaW5nIG9wZXJhdGlvbnMKPiBhbmQgZW5hYmxlIHN1cHBv
cnQgZm9yIGRpZmZlcmVudCBjb250cm9sbGVyIHZhcmlhbnRzLiBUaGlzIHByZXBhcmVzIGZvcgo+
IGFkZGluZyA2NC1iaXQgYWRkcmVzc2luZyBzdXBwb3J0Lgo+Cj4gVGhlIG9wcyBzdHJ1Y3R1cmUg
aW5jbHVkZXM6Cj4gLSBIYXJkd2FyZSByZWdpc3RlciBvcGVyYXRpb25zIChyZWFkL3dyaXRlIERE
QURSLCBEU0FEUiwgRFRBRFIpCj4gLSBEZXNjcmlwdG9yIG1lbW9yeSBvcGVyYXRpb25zIChtYW5p
cHVsYXRlIGRlc2NyaXB0b3Igc3RydWN0cykKPiAtIENvbnRyb2xsZXIgY29uZmlndXJhdGlvbiAo
cnVuIGJpdHMsIERNQSBtYXNrKQo+Cj4gQ29udmVydCBleGlzdGluZyAzMi1iaXQgb3BlcmF0aW9u
cyB0byB1c2UgdGhlIG5ldyBhYnN0cmFjdGlvbiBsYXllcgo+IHdoaWxlIG1haW50YWluaW5nIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9k
b25nQHJpc2NzdGFyLmNvbT4KPiAtLS0KPiB2MzogTm8gY2hhbmdlLgo+IHYyOiBOZXcgcGF0Y2gs
IGludHJvZHVjZSBtbXBfcGRtYV9vcHMgZm9yIDMyLWJpdCBhZGRyZXNzaW5nIG9wZXJhdGlvbnMu
Cj4gLS0tCj4gIGRyaXZlcnMvZG1hL21tcF9wZG1hLmMgfCAxODcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTU2IGlu
c2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
