Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F3C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfnNyv5UaEUEpr31EB13scsc+M+JDidNB3nThB6p3u8=; b=iF0DvXm1YrKZJl
	SkEGkwgZ6/PAAf9IB40bexgw8btX6wisc9r5cc5MvL7j66SlGRIu1AWPLvfD1Mx7V0FEgjwO8EBKe
	0yug+RVInes7QmPtzpMw29xoMIGMPBXF3ESOfeSrnG86+pEhBGCsDzC3fE/2MBqcIkIj6JwZTueJP
	5K5U0AlqwXL0mBR6yB3fB5Rxd3A/oYUzkFVtLNBZReluGIW2MvWNTOFlU/hSQMZI4YWLDYluMJ4+6
	ngRNj1UKZD9nHXbfnbvDgZa6E1fYJblDwgapOAvh5FDw3i+yLDmKjuiSKcMRB31g0Dq/tXZ41Vc3/
	jTjva2Gny9gUD1Dwdw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSFK-00000008o6v-3IZl;
	Fri, 23 Feb 2024 09:53:34 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSEx-00000008nuz-36ir
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 09:53:18 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-365337ad3e7so1510325ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 01:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708681990; x=1709286790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwITkJOkxJi4tf5gcg3IMghI+TXnjRRJ7mlrP6U+6fo=;
        b=iWWP8HNjaHxMtQwmHUp4oVNNxD8EYKPhmn/I9EAuIQgnSsff61U00hbtSgK9P0U8Wh
         VrNAb4oCmGoXpKg/8W1bdjXtf45Uy3j3WHgxAv62D1nbk2U4SprtyTVJWirGvBYNNvpl
         ip+b858hzFNIIbhrPQzLCUjJKvHtcOjVeNvQfApqtRBg5dlajIkjQIPYPtt66oSSZxoU
         +PWHI1AakNQ+Wa/+EKmrMhR27EWabiYMpOyva7ldk7RO01tmxk9RYRTJfBHeBF+Bj+QG
         iiJ3VkJ0wzzmZAdz14J1JX0sYtwAhtjzT6mtcqa5SxtSuELQYTx4GKJqIr3Yky3jB6VO
         avEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708681990; x=1709286790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwITkJOkxJi4tf5gcg3IMghI+TXnjRRJ7mlrP6U+6fo=;
        b=nNsLYh9GxTGxTsHG14NZ2FScPJ+OjJii1kcTKAoSCtnHYZgn6FudBF8k5ZlqUk/+EJ
         pOtegYgbOk9ZpPWTKtm6KvpbMcKu0FhyIZ1cXxveQXb/urK+q5qcb8QP+c/t2AA0w/Be
         +F71YZoETASXk89w7VsUC776NqbuXrwDKOB8b4FFclS3Y5GhcGahKdS2G3os/vrgD7JT
         xjXHsys26LprEehkvQhgMrx5PUl90wdD019vtI4qGyNxS5S04rDbri1KYtIlzsfkA52p
         raSURqKfHvMCOv6jT/dz1qvrtkwOn2UeQxsz0D/tBv0q8mQWzhGnG1MmfmqgoaATLWX8
         DQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2LlpVa6wxzsjnpR5nWzBspHSwfhJoeImyVuxheafYS6dltm9VTgerc77CtYivzhSB+mgFSC5K1o8+FXiwYzuuDEwmTFm4X14LWQCatya
X-Gm-Message-State: AOJu0YzSbpWPKzq2u/kQhbxQl+8KjnNvg9jE8zvOyuhplF/EhCHSP326
	tpbEAkOjuzSZpMLIHCuilA9UfEKDKB89CX0Hv0IEczv1DiTRaudKFnGmowM/200bqmxBel8crJJ
	K5I922uEuYsLdhnP5UiflZGnbn5fDUF834WcGmQ==
X-Google-Smtp-Source: AGHT+IFEMrjyUct3LRVpsNuoU0mxhXWWWiTu7G911BntzOGl/Oh/Kjz2rfYKPmZurgFzXi9TrTc+zlN+3LwG3NAjrOo=
X-Received: by 2002:a92:c56e:0:b0:365:2aa7:9407 with SMTP id
 b14-20020a92c56e000000b003652aa79407mr1592046ilj.17.1708681990333; Fri, 23
 Feb 2024 01:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-12-apatel@ventanamicro.com> <87a5nreg94.ffs@tglx>
In-Reply-To: <87a5nreg94.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Feb 2024 15:22:59 +0530
Message-ID: <CAAhSdy1jdHsuwRhbRgig98-AVDOGwp_XxHurg9o3Rsj1AVOqbA@mail.gmail.com>
Subject: Re: [PATCH v14 11/18] irqchip: Add RISC-V incoming MSI controller
 early driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_015312_916081_2503EB39 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMTo1OOKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgRmViIDIyIDIwMjQgYXQgMTU6MDksIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogU2V0dXAgY3B1aHAgc3Rh
dGUgKG11c3QgYmUgZG9uZSBhZnRlciBzZXR0aW5nIGltc2ljX3BhcmVudF9pcnEpCj4gPiArICAg
ICAgKgo+ID4gKyAgICAgICogRG9uJ3QgZGlzYWJsZSBwZXItQ1BVIElNU0lDIGZpbGUgd2hlbiBD
UFUgZ29lcyBvZmZsaW5lCj4gPiArICAgICAgKiBiZWNhdXNlIHRoaXMgYWZmZWN0cyBJUEkgYW5k
IHRoZSBtYXNraW5nL3VubWFza2luZyBvZgo+ID4gKyAgICAgICogdmlydHVhbCBJUElzIGlzIGRv
bmUgdmlhIGdlbmVyaWMgSVBJLU11eAo+ID4gKyAgICAgICovCj4gPiArICAgICBjcHVocF9zZXR1
cF9zdGF0ZShDUFVIUF9BUF9PTkxJTkVfRFlOLCAiaXJxY2hpcC9yaXNjdi9pbXNpYzpzdGFydGlu
ZyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbXNpY19zdGFydGluZ19jcHUsIGltc2lj
X2R5aW5nX2NwdSk7Cj4KPiBUaGlzIGlzIG5vdCByZWFsbHkgY29ycmVjdC4gSVBJcyBzaG91bGQg
YmUgd29ya2luZyByaWdodCBhd2F5IHdoZW4gYSBDUFUKPiBjb21lcyBvbmxpbmUgYW5kIG9uIHRo
ZSB1bnBsdWcgc2lkZSB1bnRpbCBpdCByZWFsbHkgZ29lcyBvZmZsaW5lLgo+Cj4gU28gdGhpcyB3
YW50cyB0byBiZSBpbiB0aGUgc3RhcnRpbmcgcmFuZ2UsIGkuZS4gYmV0d2VlbiBDUFVIUF9BUF9P
RkZMSU5FCj4gYW5kIENQVUhQX0FQX09OTElORS4gTm8/CgpZZXMsIGl0IGhhcyB0byBiZSBhcyBl
YXJseSBhcyBwb3NzaWJsZSBidXQgSSB3YXMgbm90IHN1cmUgYWJvdXQKaW50cm9kdWNpbmcgeWV0
IGFub3RoZXIgZHJpdmVyIHNwZWNpZmljIENQVUhQX0FQX3h5eiBzdGF0ZQpjb25zaWRlcmluZyBD
UFVIUF9BUF9PTkxJTkVfRFlOIHdvcmtlZCBmaW5lLgoKU2luY2UgeW91IHN1Z2dlc3RlZCwgbGV0
IG1lIGludHJvZHVjZQpDUFVIUF9BUF9JUlFfUklTQ1ZfSU1TSUNfU1RBUlRJTkcgaW4gdGhlIG5l
eHQgcmV2aXNpb24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
