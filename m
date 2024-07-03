Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D176CC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTghHL7MAhalIvgy95c09MZHAXbSz48p06Sv/0T+z2g=; b=mCXtdjimlAxn7m
	4f6GgVl9IJeqXkUbBDffiVOy/tXfY7NvBeTEOoG5gH50LRUPsAStD7V/cCfYkCknvuJfCbPO2TNaS
	pyoTBS1CbAGIeV3i3TtBY0hr5ISEgz89gaPzMtL6E4Q102efecUKVjMGNr3ZOcomgmQVfdlfStKj2
	og+c4ur3u78+OX82V5VVrYRfh5gPr/VLSQd96jfzWpunuVprDwyi6PfJtsuT0d/m1tXZZk/0LmmuY
	R0w1tmaww1X5mNtwYNRtK0Cw+5gyz3c3b+EJYcGTG9EttLn7VDOmtZuHUbwnnNxf45W8ktfnk9+Yv
	4DEiK0VZ4ysCEuYGF1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP17J-0000000AUyX-0viT;
	Wed, 03 Jul 2024 14:37:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP17G-0000000AUxj-1g28
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:37:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-58b0beaf703so3228114a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720017468; x=1720622268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwDgSV4xuIwT4NzMnJP3OHGqqOb1AP31ToR21/wZI0s=;
        b=bJurnnN4g0yewvP7GtCVJJuox258UaziR/qpbp+eTL8zgXWv1VYoMHq1IEhzTAIKC2
         zOWtsjXgsSgerCxbwQxU5ZZLUP8xKiHVCyVCFtFv00prPRcjAxzb3C2/kgjdKWbvBZvZ
         QlNhnUl0P0fk2bAPkPtRkE2IBy0quClQ5JFOYu+75a50kvaMnEXUPh1A0Cfvt8b0MviR
         +E/jBosF7+8gtXL7AvOnOr76odZcS6eR3KcrcvV1b/2ohTG3yD4mkpy6W3rkA7aVr/bQ
         RJ+4BpbMtfn7g6dIkuG8TcumCC3MJ6Wok7YjfkUjpaBnD7gXfZQFFbw161SOYB4+n2Tc
         W1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017468; x=1720622268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwDgSV4xuIwT4NzMnJP3OHGqqOb1AP31ToR21/wZI0s=;
        b=DkXuDfzIgEEiiHg3LCf5Z4qvwAeitlNJZTNCJUk/ZRWfmAV+hI3v/6r/HwxwZhbpIX
         cSjWuJUNPZxP2AX2bGraysJegNPtMzDc98WELWjtIMOz6whcsb0n8Bh3oEgGJ4hTosJw
         vzgp2aNQvNk8teWMd/u7fDEUPY+DA/3wOa+V0i/VQdeqs/OFNsP+R3RGStZuHgKvhcJq
         2nyeo2nYtn6OotYCAdrJv1ap+S4uc4zfs7ICIvHTP0bbzRHtYIOjXS3g5kSzUTiEhnMj
         ev1n++HPmdK2LfVfXB7IdKD6Jw+FYZFnw62m4JiHaPPOe4M5quAg+yFJ5uuR6r05Cew0
         MLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzK9OFz3LiozrMTfvG5fmcF4kKlXn9Zw22Eqm3JbLaLvyh2V0mjeZwOxaXoQha6O0YQDwa1Hhl0WtI1NibjB09bMhhZZCzczGqivy71uSL
X-Gm-Message-State: AOJu0YwPOW1wlptAukpXPY5VsBfPteAlQQ2Cqm1fYSzw81379bqc21iJ
	1GQF9do8IE1yc9gdBk/RFNLXhx2X1xyEmBMMXY2U07ZyHTTZIDsHhygzJSnWEguud3cfXBKQLOD
	lC4oB85nmlaus0827Q+ZL6eF8hU4=
X-Google-Smtp-Source: AGHT+IGXO+EsJGw5x4C61DDXzb7+HPJhRuNtxjdmHXW2WRjQgxUdXvXiKtXC11EHY8MZzkWANfP92lKR88EI3QzTMmM=
X-Received: by 2002:a05:6402:2354:b0:58d:10a0:36f1 with SMTP id
 4fb4d7f45d1cf-58d10a03a73mr969665a12.23.1720017468217; Wed, 03 Jul 2024
 07:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com> <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
 <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs>
 <20240703-garbage-explicit-bd95f8deb716@wendy> <CAGLn_=tieSCGWix-0mGC7n8MnD46WPxuWh9xhtB6r+YZry463g@mail.gmail.com>
 <20240703-postage-absence-15fdac24421c@spud>
In-Reply-To: <20240703-postage-absence-15fdac24421c@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 3 Jul 2024 20:07:35 +0530
Message-ID: <CAGLn_=vpXfCPaWXpeOEfUY3CJEWbp7TMOQb0A5XbGLAPZJ53jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_073750_457709_F4F68E49 
X-CRM114-Status: GOOD (  16.08  )
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

T24gV2VkLCBKdWwgMywgMjAyNCBhdCA3OjU34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAzLCAyMDI0IGF0IDA2OjQyOjQ2UE0gKzA1
MzAsIEthbmFrIFNoaWxsZWRhciB3cm90ZToKPiA+IEhpLAo+ID4gU28sIEkgd2lsbCBkcm9wIHRo
aXMgcGF0Y2guCj4gPiBJbiB0aGUgbmV4dCB2ZXJzaW9uIChpLmUuIHYyKSBvZiB0aGlzIHBhdGNo
c2V0LCBkbyBJIG5lZWQgdG8gaW5jbHVkZQo+ID4gdGhlIGR0LWJpbmRpbmcgcGF0Y2ggYXMgaXQg
aXMgYWxyZWFkeSBpbiBmb3ItbmV4dC4KPgo+IE5vLCB5b3UgZG8gbm90IG5lZWQgdG8gaW5jbHVk
ZSB0aGUgYmluZGluZy4KCkFscmlnaHQgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiEKCj4g
PiBJIGFtIHdhaXRpbmcgZm9yIGNvbW1lbnRzIG9uIHRoZSBkZXZpY2V0cmVlIGZpbGVzIGJlZm9y
ZSBzZW5kaW5nIHRoZQo+ID4gdjIgKGlmIHJlcXVpcmVkKS4KPgo+IEknbGwgdHJ5IHRvIGxvb2sg
YXQgdGhhdCB0b2RheSwgbm90IHN1cGVyIHN1cmUgaWYgSSB3YW5uYSBwaWNrIHVwIG1vcmUKPiBw
YXRjaGVzIGZvciB0aGF0IHBsYXRmb3JtIHdpdGggImZpeGVkLWNsb2NrInMsIGJ1dCBJJ2xsIGNv
bW1lbnQgdGhhdCBvbgo+IHRoZSBkdHMgcGF0Y2ggaXRzZWxmLgo+Cj4gQ2hlZXJzLAo+IENvbm9y
LgoKQ2hlZXJzLApLYW5hayBTaGlsbGVkYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
