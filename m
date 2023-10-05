Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020CE784A9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5faN67yL2ztMLaUWb3UqFNfonhIPRU4I98X38rQzbU=; b=sUL4bm8dHyjDh5
	HKB2rrNakNeC4V6y0J7Klj3FUDw4RqZhtYFlWsGIBn3kl3uTYat0t4hrrniNIVVw2oSKFw5ppRuEo
	Je5krG4t9RMzYZsiXFUvPyLX00wQ17QpMTzmjcv91Vn27qro4Ov0Gp3Bk2heIRcxkGKH3WgQ9dcj+
	xE8TTGxwquUCuj52eX2vKhWDXRqG2dtCvKE4Wvpkfespy7uGer3/kRQADm0mAGoiG6BL+4A3dUy52
	LruXuHKMNMTTrzBi7w7hD9rU6rI0TzjUkmsaL/03QXWgGnQQ7HRzwxFy2GeAZa42d5yPXUvLRAYRv
	aEk4UwF5KLWq6acvppwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHUr-001UeX-1b;
	Thu, 05 Oct 2023 06:06:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHUo-001Ud5-18
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 06:06:03 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-58916df84c8so378840a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 23:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1696485960; x=1697090760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+OzM9WN1Dh21ubOEAVeEY0lIe+PfmIXwuMmmkct6SM=;
        b=nfIFOlgElJU1hwlKBDxmqwPz6b6ZW1/4CIRb9PWgEcSnczgFtwgvaMX6v8oiL5rLE5
         YnS3HbZqpp4e/S3Hod/pkOO5amhOHDkmHJB7M/iIOcORrgjaJXKYd8s7jy4Z6U52kutb
         P07iNJ4bwJ+qIAWWSkj3eyKVPQp16/KtiFGh58oXIQ7EO+9ZLflYuoEdsSNElsuoWZow
         toX70gNdtDZVO+zOlNAJTkzOoVa8CWytdc1iqUJrVfplmyKSiZ9CgegNoXyR0reyTT3a
         ODessaqedvCiwJB0jYijiXXzMPXXfJZbO+GSMj7Bs1xfVQQfaDkX0kmD4wDbWG0ODcRL
         GF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696485960; x=1697090760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+OzM9WN1Dh21ubOEAVeEY0lIe+PfmIXwuMmmkct6SM=;
        b=rrP9MySS/V0Ki3QSYfnQQavO9RDvMWR2QCjNctVHNLbs//pRO7p3pb84mwIHnE3yXK
         jkGlfEvyAmXfRsKXaOiQBkiQYahE4SzR5bCfIQwUhvsps6QWcZqvxGEz/jSkTDdW/rWW
         XvqJR0ed3bQ4aOmskjvi83pGwPYWOo5mgCWnoviDTXHhucrXHzistYwIJD9r36+hWG6T
         z+9VJ0L2roJb+JfvHEPJaanJtA2GKcPcNl8x52PTTqySosA/flDVaAoEp6gReJZL4x2E
         CG87Bd4za3UmDOsSNF3wC4IDtJGsvcJOrkzdQ5xRuK1j9xy71rB9rPI/oX4vDpQ2qVoQ
         7Ljw==
X-Gm-Message-State: AOJu0YzT8FOLg2MYSpEiQ68lJ6Fy6Rz4umoBMRE0CQkKAPFwo3rWofzq
	5vGoeCJRk1p2yrY6mUrH/p0mBJAvNTHdE0FPxagJdw==
X-Google-Smtp-Source: AGHT+IG1fxwb2v6SLkh4Fkaz8cqMSdUWu3blXiCEco3U0En8uebQJpE7wswsbpc3LD+Oi31mdQhRZwbY+N7+m1uQ3rk=
X-Received: by 2002:a17:90b:84:b0:268:15dd:c5c7 with SMTP id
 bb4-20020a17090b008400b0026815ddc5c7mr3855515pjb.40.1696485960557; Wed, 04
 Oct 2023 23:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Oct 2023 11:35:50 +0530
Message-ID: <CAAhSdy0P=5WiFfFyMHjkd63JKCcjsTsvhLTNgUB+LOCd8A9iOQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM RISC-V Conditional Operations
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_230602_389150_6AE60EFB 
X-CRM114-Status: GOOD (  15.25  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCA5OjIy4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZXh0ZW5kcyBLVk0gUklTQy1WIHRv
IGFsbG93IEd1ZXN0L1ZNIGRpc2NvdmVyIGFuZCB1c2UKPiBjb25kaXRpb25hbCBvcGVyYXRpb25z
IHJlbGF0ZWQgSVNBIGV4dGVuc2lvbnMgKG5hbWVseSBYVmVudGFuYUNvbmRPcHMKPiBhbmQgWmlj
b25kKS4KPgo+IFRvIHRyeSB0aGVzZSBwYXRjaGVzLCB1c2UgS1ZNVE9PTCBmcm9tIHJpc2N2X3pi
eF96aWNudHJfc21zdGF0ZWVuX2NvbmRvcHNfdjEKPiBicmFuY2ggYXQ6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9hdnBhdGVsL2t2bXRvb2wuZ2l0Cj4KPiBUaGVzZSBwYXRjaGVzIGFyZSBiYXNlZCB1cG9u
IHRoZSBsYXRlc3QgcmlzY3Zfa3ZtX3F1ZXVlIGFuZCBjYW4gYWxzbyBiZQo+IGZvdW5kIGluIHRo
ZSByaXNjdl9rdm1fY29uZG9wc192MyBicmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2
cGF0ZWwvbGludXguZ2l0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIERyb3BwZWQgcGF0Y2gx
LCBwYXRjaDIsIGFuZCBwYXRjaDUgc2luY2UgdGhlc2UgcGF0Y2hlcyBkb24ndCBtZWV0Cj4gICAg
dGhlIHJlcXVpcmVtZW50cyBvZiBwYXRjaCBhY2NlcHRhbmNlIHBvbGljeS4KPgo+IENoYW5nZXMg
c2luY2UgdjE6Cj4gIC0gUmViYXNlZCB0aGUgc2VyaWVzIG9uIHJpc2N2X2t2bV9xdWV1ZQo+ICAt
IFNwbGl0IFBBVENIMSBhbmQgUEFUQ0gyIG9mIHYxIHNlcmllcyBpbnRvIHR3byBwYXRjaGVzCj4g
IC0gQWRkZWQgc2VwYXJhdGUgdGVzdCBjb25maWdzIGZvciBYVmVudGFuYUNvbmRPcHMgYW5kIFpp
Y29uZCBpbiBQQVRDSDcKPiAgICBvZiB2MSBzZXJpZXMuCj4KPiBBbnVwIFBhdGVsICg2KToKPiAg
IGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFppY29uZCBleHRlbnNpb24gZW50cnkKPiAgIFJJU0Mt
VjogRGV0ZWN0IFppY29uZCBmcm9tIElTQSBzdHJpbmcKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBa
aWNvbmQgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBB
ZGQgc2VudmNmZyByZWdpc3RlciB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBBZGQgc21zdGF0ZWVuIHJlZ2lzdGVycyB0byBnZXQtcmVnLWxpc3QgdGVzdAo+
ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgY29uZG9wcyBleHRlbnNpb25zIHRvIGdldC1y
ZWctbGlzdCB0ZXN0CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTYuNwoKVGhhbmtzLApB
bnVwCgo+Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8
ICA2ICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAg
fCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8
ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAg
MiArCj4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDU0
ICsrKysrKysrKysrKysrKysrKysKPiAgNiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
Cj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
