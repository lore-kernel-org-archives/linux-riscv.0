Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C775CCEACD5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7kwfeVqlbZumAgTidzth/aruo5CidpHLYBuSkxDW/U=; b=UNmAzPr3d/K0OZ
	Z/pibiaQF9mdSJMA958TulsQ+bUVvCN1aOBy6/Nz9SD8OwDcvOeJFC+RJ3KZMY6Ox2AlSEmrF6YN7
	EY+rH9YrRO1qqLmitJ2950fx9y6MV9uR90X9DXxSInsQynm/y6xnXrNDTAiY31cxoMYjADZzqoEA6
	WMhqGB+VGbMVaGabx5/+kxnfzNxDAA4/1b99YeTUF/vn7SvL7iBHzDcghQ1nHSfYNBHDBI65ocvzm
	IGrml/6+/67VLuuXOs12DEdkzTEpuGNjEZiOxco+L5DiazradEu3FURldFDP7HCvF0Zs3UErU5taJ
	gf3JGDLXA/lmAndX/MEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sveZM-00000003Hyq-3QQH;
	Tue, 01 Oct 2024 15:13:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sveYi-00000003HwA-2CZ7
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 15:13:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5389e536198so676515e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727795582; x=1728400382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=JJuRlrkcOFX8ngupjo9SiVYNkYeB3M0qTbxg2lD612tOdWI1cv/uTpiLzWtcglUBDb
         5v6+TH2YOJGrfIH+l4B83w59l2sebPIViZHu1Hn/GnBZMEatJ2L4j95hxQZldRMTqqGD
         tSd0aBhAZiXtL1AejPXWC4AU8k2/Tl+AmACr2xXrAOAzR+UOlvCaD+P5HnlSndhe/yfN
         rUM1pJ/UQx4P8vLYa4KCrJU2+18a4AZQN9FQk93P4QkDeb6jdF0VGaJ9+/SseAnb0ldn
         4HvSyVrTevFriEE103CLQPLG+8aN2fWiA5luZnRyhQlTbgahjnTO/Pb8vacqUzdPS05w
         4MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795582; x=1728400382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=PpkG3G4fYCF3PK/qrul8y7VSfKt0t7QQI+moEvd4VLpG/6ht+O5x40c7N1FOg/0NYD
         RHe8Df5KXWnyIVArX5U+7X2BMujhvO9c6JELjGDZquZt31wM10fYibELnLLFSdyU6NNS
         B8cLHWfV8RQzMnRKjV3UDu84I06C+hIK6m2gjduz+lZkWa5Tu9iwIOF3GW6zYrnXYl0h
         n7GH+S4FlQkN86sImQ+kHuEC9cCvq0bDuD/ToA92qADIPxhiHrzkRhosqJpZrseXG6cy
         dLoSQEIWTDWesNTuW0cVg47xgnB0ViJYw77bE1/sfEOABs6xIf+dzi9AXqqbAAa6Fx/s
         TU1Q==
X-Gm-Message-State: AOJu0Yy7Gp8yDJSsBNjN4oPENXYOXg1ViUYRyCzMH5yvaEqZLJGGQb9A
	CLUhQckp7wV9mB9FXIZ5gpkKUzBUNRssL9++pybAkUyYZ4XI1LwGmUFSrvmYHHsj6AIZ14aSUUO
	HxE73jsWqm1SEUgfK1asMGSAXKJE=
X-Google-Smtp-Source: AGHT+IGMhNBqjZ6ijgQcOXn6JFNmxnnktPEIZeD+nygAOPZgju/CctlYZ3G0XVoXICXF9IwanuhOiZqfY4Zocu+x87A=
X-Received: by 2002:a05:651c:506:b0:2ee:e196:1486 with SMTP id
 38308e7fff4ca-2fae1010f89mr288481fa.4.1727795581521; Tue, 01 Oct 2024
 08:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 17:12:47 +0200
Message-ID: <CANiq72nREvDcdMinXgkVtqtUT8k+vHap9EWzxCboensXokvLQQ@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_081304_585171_ECDA4CA5 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBPY3QgMSwgMjAyNCBhdCAxOjI44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3J1c3QvYXJjaC1z
dXBwb3J0LnJzdCBiL0RvY3VtZW50YXRpb24vcnVzdC9hcmNoLXN1cHBvcnQucnN0Cj4gaW5kZXgg
NzUwZmYzNzE1NzBhMC4uNTRiZTdkZGYzZTU3YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3J1c3QvYXJjaC1zdXBwb3J0LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vcnVzdC9hcmNoLXN1
cHBvcnQucnN0Cj4gQEAgLTE3LDcgKzE3LDcgQEAgQXJjaGl0ZWN0dXJlICAgTGV2ZWwgb2Ygc3Vw
cG9ydCAgQ29uc3RyYWludHMKPiAgPT09PT09PT09PT09PSAgPT09PT09PT09PT09PT09PSAgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICBgYGFybTY0YGAg
ICAgICBNYWludGFpbmVkICAgICAgICBMaXR0bGUgRW5kaWFuIG9ubHkuCj4gIGBgbG9vbmdhcmNo
YGAgIE1haW50YWluZWQgICAgICAgIFwtCj4gLWBgcmlzY3ZgYCAgICAgIE1haW50YWluZWQgICAg
ICAgIGBgcmlzY3Y2NGBgIG9ubHkuCj4gK2BgcmlzY3ZgYCAgICAgIE1haW50YWluZWQgICAgICAg
IGBgcmlzY3Y2NGBgIGFuZCBMTFZNL0NsYW5nIG9ubHkuCj4gIGBgdW1gYCAgICAgICAgIE1haW50
YWluZWQgICAgICAgIFwtCj4gIGBgeDg2YGAgICAgICAgIE1haW50YWluZWQgICAgICAgIGBgeDg2
XzY0YGAgb25seS4KPiAgPT09PT09PT09PT09PSAgPT09PT09PT09PT09PT09PSAgPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAyMmRjNWVhNDE5NmNl
Li43Njg0MzU4NDk2MGMyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0xNzcsNyArMTc3LDcgQEAgY29uZmlnIFJJU0NWCj4g
ICAgICAgICBzZWxlY3QgSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJCj4gICAgICAgICBz
ZWxlY3QgSEFWRV9SRVRIT09LIGlmICFYSVBfS0VSTkVMCj4gICAgICAgICBzZWxlY3QgSEFWRV9S
U0VRCj4gLSAgICAgICBzZWxlY3QgSEFWRV9SVVNUIGlmIFJVU1RDX1NVUFBPUlRTX1JJU0NWCj4g
KyAgICAgICBzZWxlY3QgSEFWRV9SVVNUIGlmIFJVU1RDX1NVUFBPUlRTX1JJU0NWICYmIENDX0lT
X0NMQU5HCj4gICAgICAgICBzZWxlY3QgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVAo+ICAgICAg
ICAgc2VsZWN0IEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1RfTVVMVEkKPiAgICAgICAgIHNlbGVj
dCBIQVZFX1NUQUNLUFJPVEVDVE9SCgpBY2tlZC1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJu
ZWwub3JnPgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
