Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8232C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DD12082A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2p6UwAS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ+A4Cmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6DD12082A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RBvFaTy94UHnAqLo00B9WVmB68YtZkYz8w/FKJXRRY=; b=l2p6UwASKHdze7
	aEn9vP6G/kux0aANrtnHY+n0KV/Mv4+hsviXQ2s4U9OC6y+j2/8jJ35mLMqUcUN91FzWsdGlohuyl
	IQysEY0jlG8Z3agtmrF+ac9c4DBGkQtc+msrf2HFlOta7TXAZ9k/TX0n/v+R8oQKHqGWAtJheJF9D
	wxtpuoTNzFfqdnceFB1dwR12c4QmAdc7WZIXPwnN3HQa+X1gr4q89Jp93Erjz1/r6foGemCBDATCH
	zlCDoc7wHc/D7ByENtZ2E3bMEE9WeNTLXSU1cHRPDMfsWoFjCi4tHVHj2I0+IvUeMyn7sBar9TTgC
	oOaBS2PSeGvLxKeMydPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xob-0001nX-S1; Wed, 03 Oct 2018 03:27:09 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7XoW-0001m8-PO
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:27:08 +0000
Received: by mail-it1-x142.google.com with SMTP id h6-v6so10686631ith.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uQao3xGFEFn8Y07K52ssW3bIqYUjRZ72xPIgvT77Ym4=;
 b=GZ+A4CmoXyGrbbVW3uT0V+18mzHQHBQzDHvK19anHICNRGZ4k8fx1247KVm3oXUqvk
 hfxD2U7j4YCRZYF+KONDkPtuU0VDLXZjkjFOdkVj2Ui9CAD71cLd7+52NB+TKIhy+rRO
 ITh5H5IUV1E0f67o/pxErBPB0qdv/kD8ZCpiLWWD7Vs7SRZ/gdYLR3K3W9m5xYYbFHUm
 XxvigGqkNb+Ip3yTCZ2uAhndIYTLubgVm18VoO57ayUwlRrinZ8GoR/MxoxZBZ5EV/6Y
 UNuHdkGoSKpL4gW9EusNYYJWyDytSCcyaZA2pEibTMKhlDzqvrrg9zY8AYmz3zXm+c6j
 /o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uQao3xGFEFn8Y07K52ssW3bIqYUjRZ72xPIgvT77Ym4=;
 b=RghogViLT3xglY4a5qyeYp+7v/1obJVl/CZm2OP6A8OYt7Zw53qBZf9PyLzV8mOP/i
 OIqjIhfTMLRY2Cx+pbGIDyg/jkp5//CWXQz6tVCe3Ns3qflrE4kVAp63Sv8RqFPfeSym
 E7zVzv5hgntASkS0ja8+VMGGEczyFPX2SmzFhovA2MPQBJiMOlvR1wM1Qh3SxBov2Q3j
 +rqX/HGhWRliBr7oS+Tlgph9943HviS5OH8UCP86O4V6NZq4r0drmsDF9YMjCPTftEB5
 o2jXnvyfqh5CIA7INZQDa0IxqkfAR61fihJnopW9DCtqGAfVVhQLOBQbfp1qK2r87sUr
 vIzg==
X-Gm-Message-State: ABuFfogzFz9DVg4WbL3w2ULBp+XiRIIvGglJQ64oRre99GASld3qKgoA
 DhDQjhgO+RlLRY5EvqfEK+NliDJK6+CDjmdRD5A=
X-Google-Smtp-Source: ACcGV60UH3Tc3qrk2vBvlkhP7HdVxRn3MMNJthy9WqLiWK3RZJHb32Z9GWd1mHq/f4badBV1GUohh9Rk/JPMGefJQhA=
X-Received: by 2002:a24:ee0c:: with SMTP id
 b12-v6mr3984139iti.33.1538537213819; 
 Tue, 02 Oct 2018 20:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538470103.git.zongbox@gmail.com>
 <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
 <20181002145116.GE3889@infradead.org>
In-Reply-To: <20181002145116.GE3889@infradead.org>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 3 Oct 2018 11:26:43 +0800
Message-ID:
 <CA+ZOyahwAA3v+9XeJ4eLkhiNgDacHtLHfrqG3ifhdV-shwnAaA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_202704_826891_72029428 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincentc@andestech.com>, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003032643.yplDJS3Hni4Uo02Xh7Nj1nApjK5Ip0yst1qyVRSDT8I@z>

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiDmlrwgMjAxOOW5tDEw5pyIMuaX
pSDpgLHkuowg5LiL5Y2IMTA6NTHlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgT2N0IDAyLCAyMDE4IGF0
IDA0OjUyOjMxUE0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBGcm9tOiBWaW5jZW50IENoZW4g
PHZpbmNlbnRjQGFuZGVzdGVjaC5jb20+Cj4gPgo+ID4gRm9yIDMyYml0LCB0aGUgdXBwZXIgMzIt
Yml0IG9mIHBoeXNfYWRkcl90IHdpbGwgYmUgZmx1c2hlZCB0byB6ZXJvCj4gPiBhZnRlciBBTkQg
d2l0aCBQQUdFX01BU0sgYmVjYXVzZSB0aGUgZGF0YSB0eXBlIG9mIFBBR0VfTUFTSyBpcwo+ID4g
dW5zaWduZWQgbG9uZy4gVG8gZml4IHRoaXMgcHJvYmxlbSwgdGhlIHBhZ2UgYWxpZ25tZW50IGlz
IGRvbmUgYnkKPiA+IHN1YnRyYWN0aW5nIHRoZSBwYWdlIG9mZnNldCBpbnN0ZWFkIG9mIEFORCB3
aXRoIFBBR0VfTUFTSy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNl
bnRjQGFuZGVzdGVjaC5jb20+Cj4KPiBMb29rcyBnb29kLAo+Cj4gUmV2aWV3ZWQtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Cj4gKGFuZCBJJ20gcHJldHR5IHN1cmUgSSByZXZp
ZXdlZCB0aGlzIGJlZm9yZS4uKQoKSGkgQ2hyaXN0b3BoLAoKVmVyeSBzb3JyeSBhYm91dCB0aGF0
LiBJIGRpZG4ndCBub3RpY2UgSSBsb3NlIHRoZXNlIHJldmlldyB0YWdzLiBDb3VsZAp5b3UgcGxl
YXNlIGhlbHAgdG8gcmV2aWV3IGFnYWluIGluIHZlcnNpb24gNCBwYXRjaGVzPyBUaGFuayB5b3Uu
CgpSZWdhcmRzLApab25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
