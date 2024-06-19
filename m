Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9BEC27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LDhzptOGhjsdDRQfhBpjPchwaHdlfiJBxooLBdePacM=; b=eDoPP8f2uslw7AJo5QHvLFzL4s
	q30g+0pmkcJTNdVjpMnwDJv4zfcQZPrk7cYowJXknFlHYRc5PhVKlFagK6JxBp5zzUd3S/CY9jF0Z
	RvTr9LEeuNQ9Jz/MRm0gdZ46a1MpBf3/TrYprwSs1eXX9h9ZK7XzTDnXGYVKBhbgbYqpQ54b2/+Yn
	sZxby6EeT/vdSW5FuAeGhOoDft1zCVwF+G05Yp6I59EkCPZNlS5KyvektStL2eNOy5+OfeMCyTzuV
	M+EmMN/jQeVsNDhi+1QYaSnax6n0KyaRgzV+wFlafd+7y9or6fotil6mAF0wIfn0U5tSqnV0//Ccr
	14XIr32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzOf-00000002GoB-30O9;
	Wed, 19 Jun 2024 17:47:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzOb-00000002Glm-1OEj
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 17:47:00 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6661E3F1AF
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718819213;
	bh=IHT5FlBGHX8BcDz3usrcaubsAD5+eJT9hDJvn3YQ/tg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=L1840z5SfzOUVpq+Ezq21xEnWsqMqpoy/H53tYwXWbjnHXdDexztKffb2CLGgUuSu
	 tFQQP9W/cZcO+K6tJaT0KxBJVd66k63V6RgORPO1mY4zLmy/WAeSNUTvwsBILh29En
	 avZdpvWHLNlg9AbbcJiXkL8Jl+wq3O0swTSyivbFoRsO013rxWNU+fDOoAX1KYIJIR
	 w8jq8NBlaDBQM7j4WasR8XI6WKSIG8c//k0ogAN/Ovid8I1sVAYTR2uaEv77FzgqZi
	 pMvk0LNCB4lmisc29txler0psmEcaHD7z9zMICuzT6+z6BI+7y5LAuZH6vOCBxofAV
	 HDg6b0Gk/xkwA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4405830b0a3so86044601cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 10:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718819212; x=1719424012;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHT5FlBGHX8BcDz3usrcaubsAD5+eJT9hDJvn3YQ/tg=;
        b=M0uMzefmeowdQTO/5/drizEK2kfpLXSaZCgqKITrw6h9hWCSX9J7jsu4Pnb/uBjlzX
         1SzKl//2h8SR+9UmFk+izxhtN/RvJ36v0oUAI6uaBcNfbovyNUg8Zt3Fk6LQQWGXuAiZ
         mElw8qf9k42C5PpErkkgmin95ilF315w+1swL/6USMBNtWDOZR77qJr7x6VuF5Lljhy6
         Z2i3hRx+5Y8OMRwRHJa4xl8R1J6v7CfdUFn8TJDQknIQ7mUUw/PwvOW9vsdaGjYveacn
         pE4c3AljzPjWHCKLcHa2GpYwvvZ+XqWgDYu8fqCeNYBDNuMYfVP53CND8ZfmdHtTiKtJ
         jK0w==
X-Forwarded-Encrypted: i=1; AJvYcCVFo/B4DLI7+OufSkuij19zkGypwffJNtKM9WfYq/NJREEFtJ73e4QC6CbWfGJGnM4Cmq8uKFAhPmI5jsT6mx+Qc2DmFQp22C/1+lqH/87Q
X-Gm-Message-State: AOJu0YwLC6fupnmN0Df5Ei2YE9kiZ1v8yxxQKpUAI+t09xFicrr/09w5
	yvUGUdnZBFxycF/JshEVat42UKBIK+BxqCezAk6Or2DU9UiAZwcLNoUzSWhi0vESgAksoB+GvLb
	EEcP00yVaQ4CL2TXKTj3hwgQqEoGKFzeRZ91ctTPmQenXTD9bM9FVfdsmeAOAxl/kr7NChIFLSr
	5KapUMR6mgMzttkK68ermJxYJizfvCSntk3sOGgStSWnDYZR5JlHGh5150
X-Received: by 2002:a05:622a:2a0e:b0:444:b33b:f64d with SMTP id d75a77b69052e-444b33bff32mr9783281cf.46.1718819212430;
        Wed, 19 Jun 2024 10:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF95k2RvsNdi+fcZdUd49VFCJUgO12myNtpWdozPj6zXj+cU0eJTQB6VEWAjg1+fxFJrgsQuA6Wpy9JkVGnUFc=
X-Received: by 2002:a05:622a:2a0e:b0:444:b33b:f64d with SMTP id
 d75a77b69052e-444b33bff32mr9783031cf.46.1718819212115; Wed, 19 Jun 2024
 10:46:52 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Jun 2024 13:46:51 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com>
 <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com>
Mime-Version: 1.0
Date: Wed, 19 Jun 2024 13:46:51 -0400
Message-ID: <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Anup Patel <apatel@ventanamicro.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_104657_690225_F408B999 
X-CRM114-Status: GOOD (  18.51  )
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

QW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCA3OjAw4oCvUE0gRW1p
bCBSZW5uZXIgQmVydGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gVGhlIFBMSUMgZHJpdmVyIGRv
ZXMgbm90IHJlcXVpcmUgdmVyeSBlYXJseSBpbml0aWFsaXphdGlvbiBzbyBjb252ZXJ0Cj4gPiA+
IGl0IGludG8gYSBwbGF0Zm9ybSBkcml2ZXIuCj4gPiA+Cj4gPiA+IEFmdGVyIGNvbnZlcnNpb24s
IHRoZSBQTElDIGRyaXZlciBpcyBwcm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11cAo+ID4g
PiBzbyBzZXR1cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhhbmRsZXIgb2YgYWxsIG9ubGlu
ZSBDUFVzIGFyZQo+ID4gPiBpbml0aWFsaXplZCBvdGhlcndpc2UgUExJQyBkcml2ZXIgY3Jhc2hl
cyBmb3IgcGxhdGZvcm1zIHdpdGggbXVsdGlwbGUKPiA+ID4gUExJQyBpbnN0YW5jZXMuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29t
Pgo+ID4KPiA+IEhpIEFudXAsCj4gPgo+ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IHRvIHRo
ZSBtYWlsaW5nIGxpc3QsIGJ1dCBldmVyIHNpbmNlIDYuOSB3aGVyZSB0aGlzIHdhcwo+ID4gYXBw
bGllZCBteSBBbGx3aW5uZXIgRDEgYmFzZWQgYm9hcmRzIG5vIGxvbmdlciBib290LiBUaGlzIGlz
IHRoZSBsb2cgb2YgbXkKPiA+IExpY2hlZVJWIERvY2sgYm9vdGluZyBwbGFpbiA2LjEwLXJjNCwg
bG9ja2luZyB1cCBhbmQgdGhlbiByZWJvb3RpbmcgZHVlIHRvIHRoZQo+ID4gdGhlIHdhdGNoZG9n
IHRpbWluZyBvdXQ6Cj4gPgo+ID4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L25zYnpnRUtXCj4g
Pgo+ID4gT24gNi4xMC1yYzQgSSBjYW4gYnJpbmcgdGhlIHNhbWUgYm9hcmQgdG8gYm9vdCBieSBy
ZXZlcnRpbmcgdGhpcyBwYXRjaCBhbmQgYWxsCj4gPiBwYXRjaGVzIGJ1aWxkaW5nIG9uIGl0LiBF
Zy46Cj4gPgo+ID4gICBnaXQgcmV2ZXJ0IGUzMDZhODk0YmQ1MSBhN2ZiNjlmZmQ3Y2UgYWJiNzIw
NTc5NDkwIFwKPiA+ICAgICAgICAgICAgICA5NTY1MjEwNjQ3ODAgYTE1NTg3Mjc3YTI0IDZjNzI1
ZjMzZDY3YiBcCj4gPiAgICAgICAgICAgICAgYjY4ZDBmZjUyOWE5IDI1ZDg2MmUxODNkNCA4ZWM5
OWIwMzMxNDcKPgo+IERvZXMgeW91ciBib2FyZCBib290IHdpdGggb25seSBTQkkgdGltZXIgZHJp
dmVyIGVuYWJsZWQgPwoKSSdtIG5vdCAxMDAlIHN1cmUgdGhpcyBpcyB3aGF0IHlvdSBtZWFuLCBi
dXQgd2l0aCB0aGlzIGNoYW5nZSBJIGNhbiBkaXNhYmxlCkNPTkZJR19TVU40SV9USU1FUjoKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5z
b2NzCmluZGV4IGY1MWJiMjRiYzg0Yy4uMDE0MzU0NTM0OGViIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L0tjb25maWcuc29jcworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwpAQCAtMzksNyAr
MzksNiBAQCBjb25maWcgQVJDSF9TVU5YSQogICAgICAgIGJvb2wgIkFsbHdpbm5lciBzdW4yMGkg
U29DcyIKICAgICAgICBkZXBlbmRzIG9uIE1NVSAmJiAhWElQX0tFUk5FTAogICAgICAgIHNlbGVj
dCBFUlJBVEFfVEhFQUQKLSAgICAgICBzZWxlY3QgU1VONElfVElNRVIKICAgICAgICBoZWxwCiAg
ICAgICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQWxsd2lubmVyIHN1bjIwaSBwbGF0Zm9y
bSBoYXJkd2FyZSwKICAgICAgICAgIGluY2x1ZGluZyBib2FyZHMgYmFzZWQgb24gdGhlIEQxIGFu
ZCBEMXMgU29Dcy4KCgpCdXQgdW5mb3J0dW5hdGVseSB0aGUgYm9hcmQgc3RpbGwgZG9lc24ndCBi
b290OgpodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvQXdSeGNmZXUKCi9FbWlsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
