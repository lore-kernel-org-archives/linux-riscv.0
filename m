Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3DEC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7p82cty6Yp6XTCtxG4WprodjbuR1xtKAJFUPTzK4HJw=; b=YHDxW/t5xqZOOi
	HJILzWU8eb1rk7GBQ6gHS3IFcWQssh0k4d4D8PsDQHsGOBpBij6869rBBBgsd8i68ekn91xC4LU4c
	LSmZLP/TZPz89Scb8heFP+yo9B5Lgl0IYYYX/6QDmMEy+HuDjlQV2XjQOFZs46GLm7tqVDsEQ4L6z
	NwcEdrG5ZvYrKP0vedEj3o9hcpN8OpaMOYaNHzLcdcMQM6CY70/LKZN1xV6E5xZFhP5HQnUE3upcH
	kmkCbUJDreUDWo/r18+4Rk5BrobRneLNgUqZG2mg0LWItmFG6iGAs0NpAodLP5Lsia+zRph7BJLs4
	CdElHezj5tv+rXc9L09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQS4-000000096da-1XIR;
	Mon, 12 May 2025 10:32:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQLr-000000095nO-2k5c
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 10:25:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso5355235e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747045537; x=1747650337; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVYDNzGl1HhtRbOLlZqbNyW/2ZNd9jQ043iVsCWK1J0=;
        b=RtWXylDSbxdW/Driq+HkbLAO/Hk343L5l/42RTbjJXGKkim5X0vC3mBqDsT5VO+Kxr
         DAJpr2tuZ2JW6GA4VATRfEEmPrDzljd/mDlBzffrg1/UbF3uyR6jyWi8PCVL9uIrenQU
         gPDl8AAkFL+nI/HdipmX3yHo5BRFRLAgtpMgJLxuCA1e5lAOgl//lN6lm++0S6XNef7O
         glbYqf8Zjkdw1cPzCrqtd2LRfcFKPyNbjWXW6WxUSwdIIgGL1L2rO+hyWQj6YrfdKFvF
         fmgIqCUUz2kzNJo3tQW5EZq62GLJHfYTHpjEZBonHlnhqn9De9x/76sH3YSdevN+/O7+
         sg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045537; x=1747650337;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVYDNzGl1HhtRbOLlZqbNyW/2ZNd9jQ043iVsCWK1J0=;
        b=rbb3aRWqNwufcaxBRzLQuKZjyWjKwQr7F4suJmvbJRqtPjqSLnERkRcmKCP893kC9z
         W0gn9cPr6gK8lIIDj4MsDi6y70iAmY6eR1GzOwwd30Zos8eCUR8CMjLnhVsvko6IWj7n
         6QYOJHpfRCGRq/A94Cr/J/iuejk9/hpq4UwIGLF8BlHifDBl+jIYjDum46GOk0GyQnId
         id72MrpQmKySYgTWBVkf3Ljv1TkU/FHjN7I3yPfbnhBfrK9RK4+54pbG3IuetPu5p2kW
         cNHvrokMZFGm+sGcpvZWcBlKO0TgOv0PkHfcbpyHses/wq4TofFw4P0y4wuZ46n2QUt6
         uacQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsr8QLcr4J4HPMt92vxKeZrTm7i9EIxZLUNFFOR9cyjMB5IunfYRcBTrnyJMnbGBloGy2id7dEcSH3wg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs1kD4BxIfQ9FHZ223q6JjjFEc0nZmasoI1R+EqNyvOaa8ZP2i
	tj3TeKXSvVkhTtRwdzpk4MN8lE7UCVFp/k2d5kWJMQuEXSkFo5QCy8yYSeZyrCU=
X-Gm-Gg: ASbGncskJ1FXZn3uCUa85heJnYbcL/g/HM7yQhEJDpS08xj3N6RVf1MpXoWRtvpDByK
	w4iQoeGlgNEVI6l1v1DDSrpNIy2tDoeknSxdi6NXsVNIkOdP49Hu6CrjtnzKcLDbNRVd5KAcgh2
	UO+YeLMeJIVQU/hHACCEknYWWEPZdrmHI+YhbN3w4G4snMlklujq+6DgkMRU1HBpJ5awvW2/Ar1
	O4/YiInZnySNn3z4CjVtrdTKoZi4BP245xIAML0dkmZX4IzfywGo4bZa9KrW1pJLNGiikpxjiFA
	/7dvQvQJgyL1Ts6Cvw/G+5EsYRZ/Zmj9NA3PCzURYpkW6bTYReoIfGbxTnU=
X-Google-Smtp-Source: AGHT+IGcTuM+dMRNAzDc5kg0U48s/ErTHPCpW1AeG6d0g+VQ2rWI9+vdhUQrqpzvxyWDNYPzIqhOmg==
X-Received: by 2002:a05:600c:4ec7:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-442d6c39b14mr38970815e9.0.1747045537283;
        Mon, 12 May 2025 03:25:37 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:6b5b:8def:fde9:86fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d76b7fd6sm74327145e9.0.2025.05.12.03.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 03:25:36 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 12 May 2025 12:25:36 +0200
Message-Id: <D9U3YFOPMSEF.15BJIA8CET3RT@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com> <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com> <1da6648a-251b-456b-9ddd-a7ffa95a5125@linux.dev>
In-Reply-To: <1da6648a-251b-456b-9ddd-a7ffa95a5125@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_032539_686072_AA688498 
X-CRM114-Status: GOOD (  11.81  )
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

MjAyNS0wNS0wOVQxNTozODo1NS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS84LzI1IDY6MzIgQU0sIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4gMjAy
NS0wNS0wNVQxNDozOToyOS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+
Ogo+Pj4gU0VOVkNGRyBhbmQgU1NUQVRFRU4gQ1NScyBhcmUgY29udHJvbGxlZCBieSBIU0VOVkNG
Ryg2MikgYW5kCj4+PiBTU1RBVEVFTjAoNjMpIGJpdHMgaW4gaHN0YXRlZW4uIEVuYWJsZSB0aGVt
IGxhemlseSBhdCBydW50aW1lCj4+PiBpbnN0ZWFkIG9mIGJvb3RpbWUuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfaW5zbi5jCj4+PiBAQCAtMjU2LDkgKzI1NiwzNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfaHN0
YXRlZW5fbGF6eV9lbmFibGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgY3Ny
Xwo+Pj4gICAJcmV0dXJuIEtWTV9JTlNOX0NPTlRJTlVFX1NBTUVfU0VQQzsKPj4+ICAgfQo+Pj4g
ICAKPj4+ICtzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2VuYWJsZV9zZW52Y2Zn
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPj4+ICsJCQkJCQkgIHVuc2lnbmVkIGludCBjc3JfbnVt
LAo+Pj4gKwkJCQkJCSAgdW5zaWduZWQgbG9uZyAqdmFsLAo+Pj4gKwkJCQkJCSAgdW5zaWduZWQg
bG9uZyBuZXdfdmFsLAo+Pj4gKwkJCQkJCSAgdW5zaWduZWQgbG9uZyB3cl9tYXNrKQo+Pj4gK3sK
Pj4+ICsJcmV0dXJuIGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2xhenlfZW5hYmxlKHZjcHUsIGNz
cl9udW0sIFNNU1RBVEVFTjBfSFNFTlZDRkcpOwo+Pj4gK30KPj4gQmFzaWNhbGx5IHRoZSBzYW1l
IGNvbW1lbnRzIGFzIGZvciBbMS81XToKPj4KPj4gV2h5IGRvbid0IHdlIHdhbnQgdG8gc2V0IHRo
ZSBFTlZDRkcgYml0ICg2MikgdW5jb25kaXRpb25hbGx5Pwo+Pgo+PiBJdCB3b3VsZCBzYXZlIHVz
IHRoZSB0cmFwIG9uIGZpcnN0IGFjY2Vzcy4gIFdlIGRvbid0IGdldCBhbnl0aGluZyBmcm9tCj4+
IHRoZSB0cmFwLCBzbyBpdCBsb29rcyBsaWtlIGEgbmV0IG5lZ2F0aXZlIHRvIG1lLgo+Cj4gV2Ug
d2FudCB0byBsYXp5IGVuYWJsZW1lbnQgaXMgdG8gbWFrZSBzdXJlIHRoYXQgaHlwZXJ2aXNvciBp
cyBhd2FyZSBvZiAKPiB0aGUgd2hhdCBmZWF0dXJlcwo+IGd1ZXN0IGlzIHVzaW5nLiBXZSBkb24n
dCB3YW50IHRvIG5lY2Vzc2FyaWx5IGVuYWJsZSB0aGUgYXJjaGl0ZWN0dXJlIAo+IHN0YXRlcyBm
b3IgdGhlIGd1ZXN0IGlmIGd1ZXN0IGRvZXNuJ3QgbmVlZCBpdC4KPgo+IFdlIG5lZWQgbGF6eSBl
bmFibGVtZW50IGZvciBDVFIgbGlrZSBmZWF0dXJlcyBhbnl3YXlzLiBUaGlzIHdpbGwgYWxpZ24g
Cj4gYWxsIHRoZSB0aGUgZmVhdHVyZXMgY29udHJvbGxlZAo+IGJ5IHN0YXRlZW4gaW4gdGhlIHNh
bWUgbWFubmVyLiBUaGUgY29zdCBpcyBqdXN0IGEgc2luZ2xlIHRyYXAgYXQgdGhlIAo+IGJvb3Qg
dGltZS4KPgo+IElNTywgaXQncyBmYWlyIHRyYWRlIG9mZi4KClllYWgsIGFzIGxvbmcgYXMgd2Ug
YXJlIGRvaW5nIHNvbWV0aGluZyB3aXRoIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZQp0cmFwLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
