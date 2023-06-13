Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12233C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QifE6VZe/kopd2nnEoK3kQD2Ige7N1jiIhIl7JZsToM=; b=F4wRggUvKfzuyq
	excbv2DgAsuno0UYvJEIzFTdUOP+KI/FqI6epekZdjjffc3nemWZPFMmOdtYBqmn5TtNDo7Fthhg9
	LFy0VFsivPLo6/fyzcpPxm3sW5HbbXqpbF5aXGZzFJUYktUq4o7Qy5uqAvHb8gxhgoxCB5T+5uScx
	kP0VgwRwDoWNTpUmMH6KWO04uXke1FHq4lvNvL0nlnN3UobChxpLVLwEdyMW9WBSgn6oJ0GlxAEPk
	YoVzhfdeZTgNaYDbValZ682AVun0ynWFY9FQe8oVlEoMkyDJ0osZaa8O5mStHeCrMtXQ4AeM2CIrn
	SbaIqFAxhcjCfGcF2ylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8zEn-007Lj5-2T;
	Tue, 13 Jun 2023 08:18:49 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8zEl-007Lhx-0G
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 08:18:48 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-56d0776f668so21194297b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686644323; x=1689236323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYxWtgxnVnQZT9lz0RWbMniZzWsCGe2zGgB4ImcCjC4=;
        b=GgyUEUJj5KK554oYZvhgbbJrR358zHeS4y5kle8dSCpk/vbud0V99z6i78bSS0+HjB
         wPQuQEsvnimA3yQMOa98H9f/Ah/79VdGiWNjpBFkm259urnCphWmeHoe6HJB3umHuQYg
         wYrBs2AVa4wLSZSm4MDX8k6RX+mRwdmhivyg7icKiEPKvoQ0qIBwn85mhcjPlXazaph/
         TEH5n8j3358u64bZx6a1Ine85RjxRMSGn2N0SP9GYI0hi3xeXeRmqf27/ELwjVhzG9oz
         0/PeGBznoWlnd7+j0FyjVZ6jCZ15eFhQIwMf302ESJ4gxGomVNvWd+c9ycJpDNTc/Ti/
         odSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644323; x=1689236323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYxWtgxnVnQZT9lz0RWbMniZzWsCGe2zGgB4ImcCjC4=;
        b=G1UHSwJVJ2Hk09YtXVkQrAwd8mIFitpPP0W5vlEFh+MG52IWuoyhjcg7uEntfrx95J
         KISblyNuTBAIEf+xR/RVo9k9tYGVMUb2PDP83fqRgWJx58eGY7dJ6Ug95UWdLoUQumdx
         tmHt2jIAiaNIkAGtZ+VTLQ2s5Vkf0PEr0PN+3nkFWXbk8JPrJdlsyo4JPm1LNNb+rTKc
         bu8V/gzXQKjJ6WrdB1j3s2mVOfcg+0Cwgmx2aHB46Ep15PDxN8zt+vuP66k2tYK7Bli6
         YN7T0Q56QGggvJQl5dXQ4cBQ5+dtDTQIeI3Cacc8iZRE3efXkJcgK+4tDz/x+j9BwbF7
         fjBw==
X-Gm-Message-State: AC+VfDwWJPduk1WhdE/C5YyC/R06BvvGX2fQWYoezntdzmxq6tqQdKJj
	x8uhGZD/6yyUkpqnXzTEFdWUfccVCdj7eFnz7Ub87Q==
X-Google-Smtp-Source: ACHHUZ51qjjDXrZayB2WH1y5kXtJRQFZ9MOkA7yujtKYZ2TlvtYJj6qaB0h189GnS8dsYUZpmgsJKqrU1/zglYmy+zQ=
X-Received: by 2002:a25:f504:0:b0:bac:12e1:1d68 with SMTP id
 a4-20020a25f504000000b00bac12e11d68mr770859ybe.11.1686644323651; Tue, 13 Jun
 2023 01:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-5-apatel@ventanamicro.com> <20230510-untried-duvet-7e3c230fcefd@wendy>
In-Reply-To: <20230510-untried-duvet-7e3c230fcefd@wendy>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 13 Jun 2023 13:48:32 +0530
Message-ID: <CAK9=C2WR+1ZGp+db7axszzthT=G8M0134+frxBNq1YS0FnF7jg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_011847_117178_8BCBC4F8 
X-CRM114-Status: GOOD (  14.81  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgNTo0NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFudXAsCj4KPiBPbiBNb24sIE1heSAw
OCwgMjAyMyBhdCAwNzo1ODozNVBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gKyAgaW50
ZXJydXB0cy1leHRlbmRlZDoKPiA+ICsgICAgbWluSXRlbXM6IDEKPiA+ICsgICAgbWF4SXRlbXM6
IDE2Mzg0Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkgcmVw
cmVzZW50cyB0aGUgc2V0IG9mIENQVXMgKG9yIEhBUlRzKSBmb3Igd2hpY2ggZ2l2ZW4KPiA+ICsg
ICAgICBkZXZpY2UgdHJlZSBub2RlIGRlc2NyaWJlcyB0aGUgSU1TSUMgaW50ZXJydXB0IGZpbGVz
LiBFYWNoIG5vZGUgcG9pbnRlZAo+ID4gKyAgICAgIHRvIHNob3VsZCBiZSBhIHJpc2N2LGNwdS1p
bnRjIG5vZGUsIHdoaWNoIGhhcyBhIHJpc2N2IG5vZGUgKGkuZS4gUklTQy1WCj4gPiArICAgICAg
SEFSVCkgYXMgcGFyZW50Lgo+Cj4gT25lIG1pbm9yIG5pdCBoZXJlIGFib3V0IHdvcmRpbmcgLSAi
cmlzY3Ygbm9kZSIgZG9lc24ndCBzZWVtCj4gcGFydGljdWxhcmx5IGNsZWFyIHRvIG1lLCBzaG91
bGQgaXQgYmUgcy9yaXNjdiBub2RlL2NwdSBub2RlLz8KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+
Cj4gTXkgb25seSB0aGluZyBsYXN0IHRpbWUgYXJvdW5kIHdhcyBteSBtaXN1bmRlcnN0YW5kaW5n
LCBhbmQgeW91IGFsc28KPiBhcHBlYXIgdG8gaGF2ZSByZXNvbHZlZCBSb2IncyBjb21wbGFpbnRz
LCBzbzoKPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPgo+IEp1c3QgdG8gbm90ZSwgaXQnZCBiZSBncmVhdCBpZiB5b3UgY291bGQgQ0MgbWUg
b24gc2VyaWVzIHRoYXQgSSd2ZQo+IGFscmVhZHkgcmV2aWV3ZWQgd2hlbiB5b3UgcmVzdWJtaXQg
dGhlbT8KPiBBbHRob3VnaCBpbiB0aGlzIGNhc2UsIGlmIHlvdSByYW4gZ2V0X21haW50YWluZXIu
cGwgb24gdjYuNC1yYzEgaXQnZCBoYXZlCj4gdG9sZCB5b3UgdG8gQ0MgbWUgYW55d2F5IDspCj4K
PiBUaGFua3MsCj4gQ29ub3IuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
