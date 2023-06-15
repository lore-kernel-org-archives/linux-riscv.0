Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCEBEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 05:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlyK0dVk1v0W80bhnaSs+SfBrwYaQPxzhvES7oDddOU=; b=JLDJQ9WeTxBBCL
	/xp5Jx05CswfRI792fMbM7pmZ9mJXN4dG0aT8DNxnFRD2SymvoQI+hVg5AlF56RaNNhQA6o4eMoR4
	+xI5WGQ/smV//1Q31gl72kgAmoFenA90Is63YTOEX3Cq64xO/vwyA29wylmvdg1B4OEukV6L35sek
	qr1046YdZbCXf551v0OdGL9iwuYwwDjlxYLn6kA8Jm2H0s3ueJOd45LSgQolM/x8wzkKfV9TCC7zK
	Q4wKtX/fk4G2LyOjGP/hpHcO7764UTYL6nastkPP1Y7tZf5OwjedVbPfBsFDMOE1H0Ko/UjwgYNIN
	XS1ziuN87BghlANRin1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fpV-00Dl4y-0F;
	Thu, 15 Jun 2023 05:47:33 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fpT-00Dl4N-05
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 05:47:32 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-561b7729a12so6566077b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 22:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686808049; x=1689400049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vDiV6UeFt2Sno0zSEPfAoE+c0aIDiDuPDDc3lI/OiI=;
        b=NnXGhiSIhqovytwTJdiQfnf5eovw73VQ87w+m9529YHgbOMhDe7l4LCL5NtOB6593B
         o90sc0F6F9c09Iv0yyo0gUhUtyFvhyXuclonV56OHBilEhgzNLnNA+mQBnM5tEm08uX1
         E+B3T2gkNTeMf5GZ4CeYbmNSoiMrxj8FjlDU4jDDz3/8wzn5i6yXoUy/FOoMQHKwWlFQ
         lMlEbhsKnb88uhsz/UH/OEAnb4OKRp1J6+phEMcdLTzi6PJNQm+XYWetoWUHArEEdu2p
         S8sVkzseIZByhGC+iZEq3fFyIlChqUaRGD9VkoATiH9Z8PQiOVakQk4O8KHlEYkLk6OX
         J+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686808049; x=1689400049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vDiV6UeFt2Sno0zSEPfAoE+c0aIDiDuPDDc3lI/OiI=;
        b=c9gpQRusUFjuT5xEbSooiMuwTO7wPRob+WRMKaymbpXHD8//KbN1cW29gJyvs6Z62g
         sPBy70ToZLYj6P+eAAC4vxX4yfivgreOzTvk6D8Cll6a2yFRC2tNFcQqREa74C6ap37i
         UKROrivhdj+FZEHo5TJ7dAOj9QtN29OLgbM3+YgTqN2tKY9yBl12DQ5q1USmrOlUmTJ3
         xCg5uzzY02JmhnXBkVaPsrLomxIrwn6nvvtoPX1ZDxsVk8KEOO9delkjey3YSrW8LBqj
         Vbj5xIH63PD0c8n+h+/dwF75f4x9TdaM9zj40Ews2eM3540FCii2Pmv2agRFS+S0lFLr
         EVZw==
X-Gm-Message-State: AC+VfDx/O4HlbEwU94VjxbuKyEagoN+zDZlKlBSxDjenwy4aD5uGwm2y
	LV/SZ+s420HacLDesuZruAtaeSgyxqIXZ6De+PXSuQ==
X-Google-Smtp-Source: ACHHUZ6aKGXwe4EbTAHJQ5c1CR4NVyX6sBaLo3x4BgIGK1ahNs5xjRNtb+Y/FJFgCgD+L1CXMRjT+B82WtWhsEiWxk0=
X-Received: by 2002:a0d:ea51:0:b0:570:2a0:6c18 with SMTP id
 t78-20020a0dea51000000b0057002a06c18mr4459993ywe.2.1686808049229; Wed, 14 Jun
 2023 22:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-8-apatel@ventanamicro.com> <20230614-devotee-repave-37d670dbfb7c@spud>
In-Reply-To: <20230614-devotee-repave-37d670dbfb7c@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Jun 2023 11:17:16 +0530
Message-ID: <CAK9=C2X35L3STKu954euRp3gsWb3uxzVbW+i+ddor4Hff9snXg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_224731_064340_B90D204F 
X-CRM114-Status: GOOD (  16.58  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTI6NTfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEFudXAsCj4KPiBNb3N0bHkgbG9va3MgZ29vZCwgb25j
ZSBtaW5vciBjb21tZW50Lgo+Cj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMDk6MDQ6MTJQTSAr
MDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPgo+ID4gKyAgcmlzY3YsY2hpbGRyZW46Cj4gPiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkKPiA+
ICsgICAgbWluSXRlbXM6IDEKPiA+ICsgICAgbWF4SXRlbXM6IDEwMjQKPiA+ICsgICAgaXRlbXM6
Cj4gPiArICAgICAgbWF4SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAg
QSBsaXN0IG9mIGNoaWxkIEFQTElDIGRvbWFpbnMgZm9yIHRoZSBnaXZlbiBBUExJQyBkb21haW4u
IEVhY2ggY2hpbGQKPiA+ICsgICAgICBBUExJQyBkb21haW4gaXMgYXNzaWduZWQgYSBjaGlsZCBp
bmRleCBpbiBpbmNyZWFzaW5nIG9yZGVyLCB3aXRoIHRoZQo+ID4gKyAgICAgIGZpcnN0IGNoaWxk
IEFQTElDIGRvbWFpbiBhc3NpZ25lZCBjaGlsZCBpbmRleCAwLiBUaGUgQVBMSUMgZG9tYWluIGNo
aWxkCj4gPiArICAgICAgaW5kZXggaXMgdXNlZCBieSBmaXJtd2FyZSB0byBkZWxlZ2F0ZSBpbnRl
cnJ1cHRzIGZyb20gdGhlIGdpdmVuIEFQTElDCj4gPiArICAgICAgZG9tYWluIHRvIGEgcGFydGlj
dWxhciBjaGlsZCBBUExJQyBkb21haW4uCj4gPiArCj4gPiArICByaXNjdixkZWxlZ2F0aW9uOgo+
ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFy
cmF5Cj4gPiArICAgIG1pbkl0ZW1zOiAxCj4gPiArICAgIG1heEl0ZW1zOiAxMDI0Cj4gPiArICAg
IGl0ZW1zOgo+ID4gKyAgICAgIGl0ZW1zOgo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogY2hp
bGQgQVBMSUMgZG9tYWluIHBoYW5kbGUKPiA+ICsgICAgICAgIC0gZGVzY3JpcHRpb246IGZpcnN0
IGludGVycnVwdCBudW1iZXIgb2YgdGhlIHBhcmVudCBBUExJQyBkb21haW4gKGluY2x1c2l2ZSkK
PiA+ICsgICAgICAgIC0gZGVzY3JpcHRpb246IGxhc3QgaW50ZXJydXB0IG51bWJlciBvZiB0aGUg
cGFyZW50IEFQTElDIGRvbWFpbiAoaW5jbHVzaXZlKQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+
ICsgICAgICBBIGludGVycnVwdCBkZWxlZ2F0aW9uIGxpc3Qgd2hlcmUgZWFjaCBlbnRyeSBpcyBh
IHRyaXBsZSBjb25zaXN0aW5nCj4gPiArICAgICAgb2YgY2hpbGQgQVBMSUMgZG9tYWluIHBoYW5k
bGUsIGZpcnN0IGludGVycnVwdCBudW1iZXIgb2YgdGhlIHBhcmVudAo+ID4gKyAgICAgIEFQTElD
IGRvbWFpbiwgYW5kIGxhc3QgaW50ZXJydXB0IG51bWJlciBvZiB0aGUgcGFyZW50IEFQTElDIGRv
bWFpbi4KPiA+ICsgICAgICBGaXJtd2FyZSBtdXN0IGNvbmZpZ3VyZSBpbnRlcnJ1cHQgZGVsZWdh
dGlvbiByZWdpc3RlcnMgYmFzZWQgb24KPiA+ICsgICAgICBpbnRlcnJ1cHQgZGVsZWdhdGlvbiBs
aXN0Lgo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJl
Zwo+ID4gKyAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcgo+ID4gKyAgLSAiI2ludGVycnVwdC1jZWxs
cyIKPiA+ICsgIC0gcmlzY3YsbnVtLXNvdXJjZXMKPiA+ICsKPiA+ICthbnlPZjoKPiA+ICsgIC0g
cmVxdWlyZWQ6Cj4gPiArICAgICAgLSBpbnRlcnJ1cHRzLWV4dGVuZGVkCj4gPiArICAtIHJlcXVp
cmVkOgo+ID4gKyAgICAgIC0gbXNpLXBhcmVudAo+Cj4gTm90IHN1cmUgaWYgeW91IG1pc3NlZCB0
aGlzIGZyb20gdGhlIGxhc3QgdmVyc2lvbiwgYnV0IEkgYXNrZWQgaWYgd2UKPiBuZWVkZWQgYQo+
ICAgICAgICAgZGVwZW5kZW5jaWVzOgo+ICAgICAgICAgICByaXNjdixkZWxlZ2F0ZTogWyByaXNj
dixjaGlsZHJlbiBdCj4KPiBJT1csIEkgZG9uJ3QgdGhpbmsgaXQgaXMgdmFsaWQgdG8gaGF2ZSBh
IGRlbGVnYXRpb24gd2l0aG91dCBoYXZpbmcKPiBjaGlsZHJlbj8KCkFoaCwgeWVzLiBJIG1pc3Nl
ZCB0aGlzIG9uZS4gSSB3aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KCj4KPiBPdGhl
cndpc2UsCj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4KPiBDaGVlcnMsCj4gQ29ub3IuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
