Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bXVGBfC8DI0ry0SEg+CzznXQtI8YLcDLFepZF69R6M=; b=mpsVtkAvW6xVY/
	rp15F28Kycvj7V1Km8ca165i+oJqy6RYuQochXjQPAyxBszgylTaaBoqUenTnU4dtMpJNIpbobLs+
	7PE1cyTqCpaOlTi/ppCDZwoOLFAKMaMh6Rm6sis6OYPnmFMKWlARcO8SFlFyPO3qEITiWTlKuAPiR
	tjX8CW5s2wXETEVHkgUkWizAFWd+MKyBd2eXqaKQMlJRySzz7ySjJqEngR93EStq4hPx9iKEMObdE
	0brmrVcSWVyJv4eLxfW6cdbLS1L0Kbta2BA2T/bHOArLo43m+jHFMXRSHHwXf2P+dHmz6Bi2+h/bg
	20htaOm67MZAQ8SgRNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi3J-00GZEX-0v;
	Fri, 08 Dec 2023 21:06:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi3E-00GZDG-2W
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 21:06:27 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso2393627e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 13:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702069581; x=1702674381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrp32oGF9B6zd6d7F/t+NH4/lgimMxpo/jAtAKpsnVQ=;
        b=eLlSr9bTrnAVCIaKt7kEn81/2MG5JVyp7AvmXRol2TFXJGwnfrMXkRhkauuy0XWsHt
         irZGUYEbPmJfy6I0eoX04QA/zEfvxEzrNl5V3iSTNf9e786xtdMHmA0ZgVkaUn64DIiu
         NpFiE1cHENv01TIIqVjkXZzKG4JqISaXyrllo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069581; x=1702674381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrp32oGF9B6zd6d7F/t+NH4/lgimMxpo/jAtAKpsnVQ=;
        b=nyfxu1ttR1DmDEKree/hWkevo1Cx3vj5MzbgK1AHqIhKDusmjWs5BloHGLz6Z33r1t
         GlaVSG9rDFsXFqJLBlZZmVjsVjAW0AstKtGZnOKACLjPXp3GxhZAUm9QBvZ7PDi0jRx5
         cSZ4nm1BtJudGlg9nJQZ447DyFc0ShiVv/yP9BW4r6aDUFEMb+nMa81O6IrTpBt6NuKX
         ZsimOmO5KUaQ0jK2rakKwEaWoSVH7GOJwJxskyyZvol1S1eduUKgVl3ycko0ACh4eaB8
         O5j7m4yRFdhyf0gGIqd6ooG7W95pnnSbWSBMKTnXjnc0xKTAo0NERyL+BPaspTLYhHyQ
         dD+w==
X-Gm-Message-State: AOJu0YxenO3/7nBcAWY/weY0l8BOfbR4BOFQ/NQGJ2Kgy45d3dwJIWaW
	s9lqkReHGvpK5YoVqkBrdcAh0vvak2fl/hhfnwCu
X-Google-Smtp-Source: AGHT+IFhPILMJ4QDzhpQJCTlw9rlSnIXE6QXzWmm26t/m85O2RhVhFv9eS9o0wVtDTKz+lKwUAL/6UXBL7uiOmmSRiI=
X-Received: by 2002:a05:6512:3d08:b0:50b:fe40:ada5 with SMTP id
 d8-20020a0565123d0800b0050bfe40ada5mr1114591lfv.2.1702069581145; Fri, 08 Dec
 2023 13:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20231205092555.35617-1-vadim.shakirov@syntacore.com> <20231205092555.35617-2-vadim.shakirov@syntacore.com>
In-Reply-To: <20231205092555.35617-2-vadim.shakirov@syntacore.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 8 Dec 2023 13:06:10 -0800
Message-ID: <CAOnJCUJ-eE+zbXH0yBX_QBK2ep779q=wNCSrc+BJfzUb+zBCaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers: perf: added capabilities for legacy PMU
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_130625_147354_33707BB4 
X-CRM114-Status: GOOD (  11.86  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCAxOjI24oCvQU0gVmFkaW0gU2hha2lyb3YKPHZhZGltLnNo
YWtpcm92QHN5bnRhY29yZS5jb20+IHdyb3RlOgo+Cj4gQWRkZWQgdGhlIFBFUkZfUE1VX0NBUF9O
T19JTlRFUlJVUFQgZmxhZyBiZWNhdXNlIHRoZSBsZWdhY3kgcG11IGRyaXZlcgo+IGRvZXMgbm90
IHByb3ZpZGUgc2FtcGxpbmcgY2FwYWJpbGl0aWVzCj4KPiBBZGRlZCB0aGUgUEVSRl9QTVVfQ0FQ
X05PX0VYQ0xVREUgZmxhZyBiZWNhdXNlIHRoZSBsZWdhY3kgcG11IGRyaXZlcgo+IGRvZXMgbm90
IHByb3ZpZGUgdGhlIGFiaWxpdHkgdG8gZGlzYWJsZSBjb3VudGVyIGluY3JlbWVudGF0aW9uIGlu
Cj4gZGlmZmVyZW50IHByaXZpbGVnZSBtb2Rlcwo+Cj4gU3VnZ2VzdGVkLWJ5OiBBdGlzaCBQYXRy
YSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFNoYWtpcm92
IDx2YWRpbS5zaGFraXJvdkBzeW50YWNvcmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11X2xlZ2FjeS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMKPiBpbmRleCBhMTc5ZWQ2YWM5ODAuLmZhMGJjY2Y0
ZWRmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gKysr
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYwo+IEBAIC0xMjMsNiArMTIzLDggQEAg
c3RhdGljIHZvaWQgcG11X2xlZ2FjeV9pbml0KHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiAgICAg
ICAgIHBtdS0+ZXZlbnRfbWFwcGVkID0gcG11X2xlZ2FjeV9ldmVudF9tYXBwZWQ7Cj4gICAgICAg
ICBwbXUtPmV2ZW50X3VubWFwcGVkID0gcG11X2xlZ2FjeV9ldmVudF91bm1hcHBlZDsKPiAgICAg
ICAgIHBtdS0+Y3NyX2luZGV4ID0gcG11X2xlZ2FjeV9jc3JfaW5kZXg7Cj4gKyAgICAgICBwbXUt
PnBtdS5jYXBhYmlsaXRpZXMgfD0gUEVSRl9QTVVfQ0FQX05PX0lOVEVSUlVQVDsKPiArICAgICAg
IHBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BNVV9DQVBfTk9fRVhDTFVERTsKPgo+ICAg
ICAgICAgcGVyZl9wbXVfcmVnaXN0ZXIoJnBtdS0+cG11LCAiY3B1IiwgUEVSRl9UWVBFX1JBVyk7
Cj4gIH0KPiAtLQo+IDIuMzQuMQo+CgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+CgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
