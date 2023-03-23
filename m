Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68764C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVsLg9rx0wnLK77q7iUre6sQCCGS+rEx4xrda1+YGSU=; b=QlEgCv1+7lhWWq
	kKoLY20p/f+PkBJZSADq3GYZQPIZRiSYTZedclt7rVeG4An/1gP5VlWsTUJOutuQw9Yi8t6PYULGz
	WFikn2SEVFQ4XhpRoQ6SkYX0LCrwdU6rW6HRJ2mtETtt1NJYDMAJiN8Qo1g7ABfiNzfqVJPNPfJEj
	DoX64jvLJiGNVSSJAxZMykyJPpniPiQKDutnMHri9d7zDiG/FzC+0WkegXsvtv6xDixo6IntcDDuw
	bI0iy7+pN7xwrRw7y6aiS2NIjXDkJFKJk5InGU87f9a7U9qAlRrFvogyW3LHIgBEybl/DQTVzyeTy
	Rn8YIjr4LAchP0As4Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJtp-001tEs-1w;
	Thu, 23 Mar 2023 12:18:33 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJtn-001tDC-0m
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 12:18:32 +0000
Received: by mail-ua1-x933.google.com with SMTP id v48so14809233uad.6
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679573908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUGGmJNIiB2tF8GpRaO2v6aJCn8Q0P89mXNxX4DzMis=;
        b=mPuBjeJhfwjWVU2IiF589l1xztdu4iLvv5rYXSrDnDEmnOEfiaXr3e+6o21DzYJE6d
         TLtJGe7ge2fz5OHM6vcRKkB/g2EBVZBkguKaL7J491mqY/k7sqn3fSj4HW0nW3/NvB8S
         wrHnPIn9cbH+Ho2ekBbbo8KoaI7vNCQmWhyDxjnh5XXLzx5XFFeHFhi9pwsv+CypJv3V
         aZU5xlXrc8pmPv1fAu8dCvL7E4OQ04FpN0t0EcS7UE9vqVHzROz4LXn2DSKws//RaUJr
         cJ/U1kxwksVsO4tpBlDs6C8Zc/SDPt+TopdFtXa/7qhGmQd9ofI7MN/6uQ02tCpZZm6V
         R9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUGGmJNIiB2tF8GpRaO2v6aJCn8Q0P89mXNxX4DzMis=;
        b=Q/USBeUqBGgppG68D22GzNw8/4ApcYVBAd/esNcG8hSSPOKGKr2qoNSK2t/JRBSnEe
         NhE/VWwU6xYqKf6HaV4QXWBWirC+y9VAut5hNAl4xVR0b/3YLqMikxJ5PWOEolBqL3e5
         lrpYzbGPL7ip+zoJKtkx4SaFvPLPz7PMvzn5kNYbbdhaw0bSj+vCO5qT18SSFF4wVt6S
         jyd/xaAkOPjbxvZ1Re5RCkWQmYGaFAqEEDxOiCo3bmpVol7JsYH2r9qfhpMWmpGF2+Q0
         hVbWNuMxToZaHWhENTECbyKziPidj8T5Itq2+eprfG73Sa/G03+UZgegY11orVwlud0m
         u80w==
X-Gm-Message-State: AAQBX9czIQvXqBTju0VoGcneNuA0f12OCw5dJUxaqtefQ/o0Ye1VKUCi
	tEEwY0i5VolwcxPqkhkBnIfib2easJ5WvaencTL0Sg==
X-Google-Smtp-Source: AK7set9Ku140oLgFHLDCQ0mGT17Dc0+6TsKKP+riuE/qzlt8WH/QLk5OUjHO552MQkVQo+HaNEH3OYbtH5GCZ93/ARU=
X-Received: by 2002:a05:6130:c0b:b0:755:9b3:fef8 with SMTP id
 cg11-20020a0561300c0b00b0075509b3fef8mr5092826uab.2.1679573908493; Thu, 23
 Mar 2023 05:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
In-Reply-To: <20230316131711.1284451-1-alexghiti@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Mar 2023 17:48:16 +0530
Message-ID: <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_051831_281027_C54FC1E6 
X-CRM114-Status: GOOD (  28.17  )
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

SGkgQWxleCwKCk9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDY6NDjigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaHNldCBpbnRl
bmRzIHRvIGltcHJvdmUgdGxiIHV0aWxpemF0aW9uIGJ5IHVzaW5nIGh1Z2VwYWdlcyBmb3IKPiB0
aGUgbGluZWFyIG1hcHBpbmcuCj4KPiBBcyByZXBvcnRlZCBieSBBbnVwIGluIHY2LCB3aGVuIFNU
UklDVF9LRVJORUxfUldYIGlzIGVuYWJsZWQsIHdlIG11c3QKPiB0YWtlIGNhcmUgb2YgaXNvbGF0
aW5nIHRoZSBrZXJuZWwgdGV4dCBhbmQgcm9kYXRhIHNvIHRoYXQgdGhleSBhcmUgbm90Cj4gbWFw
cGVkIHdpdGggYSBQVUQgbWFwcGluZyB3aGljaCB3b3VsZCB0aGVuIGFzc2lnbiB3cm9uZyBwZXJt
aXNzaW9ucyB0bwo+IHRoZSB3aG9sZSByZWdpb246IGl0IGlzIGFjaGlldmVkIGJ5IGludHJvZHVj
aW5nIGEgbmV3IG1lbWJsb2NrIEFQSS4KPgo+IEFub3RoZXIgcGF0Y2ggbWFrZXMgdXNlIG9mIHRo
aXMgbmV3IEFQSSBpbiBhcm02NCB3aGljaCB1c2VkIHNvbWUgc29ydCBvZgo+IGhhY2sgdG8gc29s
dmUgdGhpcyBpc3N1ZTogaXQgd2FzIGJ1aWx0L2Jvb3QgdGVzdGVkIHN1Y2Nlc3NmdWxseS4KPgo+
IGJhc2UtY29tbWl0LXRhZzogdjYuMy1yYzEKPgo+IHY4Ogo+IC0gRml4IHJ2MzIsIGFzIHJlcG9y
dGVkIGJ5IEFudXAKPiAtIERvIG5vdCBtb2RpZnkgbWVtYmxvY2tfaXNvbGF0ZV9yYW5nZSBhbmQg
Zml4ZXMgY29tbWVudCwgYXMgc3VnZ2VzdGVkIGJ5IE1pa2UKPiAtIFVzZSB0aGUgbmV3IG1lbWJs
b2NrIEFQSSBmb3IgY3Jhc2gga2VybmVsIHRvbyBpbiBhcm02NCwgYXMgc3VnZ2VzdGVkIGJ5IEFu
ZHJldwo+IC0gRml4IGFybTY0IGRvdWJsZSBtYXBwaW5nICh3aGljaCB0byBtZSBkaWQgbm90IHdv
cmsgaW4gdjcpLCBidXQgZW5kcyB1cCBub3QKPiAgIGJlaW5nIHByZXR0eSBhdCBhbGwsIHdpbGwg
d2FpdCBmb3IgY29tbWVudHMgZnJvbSBhcm02NCByZXZpZXdlcnMsIGJ1dAo+ICAgdGhpcyBwYXRj
aCBjYW4gZWFzaWx5IGJlIGRyb3BwZWQgaWYgdGhleSBkbyBub3Qgd2FudCBpdC4KPgo+IHY3Ogo+
IC0gRml4IEFudXAgYnVnIHJlcG9ydCBieSBpbnRyb2R1Y2luZyBtZW1ibG9ja19pc29sYXRlX21l
bW9yeSB3aGljaAo+ICAgYWxsb3dzIHVzIHRvIHNwbGl0IHRoZSBtZW1ibG9jayBtYXBwaW5ncyBh
bmQgdGhlbiBhdm9pZCB0byBtYXAgdGhlCj4gICB0aGUgUFVEIHdoaWNoIGNvbnRhaW5zIHRoZSBr
ZXJuZWwgYXMgcmVhZCBvbmx5Cj4gLSBBZGQgYSBwYXRjaCB0byBhcm02NCB0byB1c2UgdGhpcyBu
ZXdseSBpbnRyb2R1Y2VkIEFQSQo+Cj4gdjY6Cj4gLSBxdWlldCBMTFZNIHdhcm5pbmcgYnkgY2Fz
dGluZyBwaHlzX3JhbV9iYXNlIGludG8gYW4gdW5zaWduZWQgbG9uZwo+Cj4gdjU6Cj4gLSBGaXgg
bm9tbXUgYnVpbGRzIGJ5IGdldHRpbmcgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIGluIHBhdGNoIDEs
IHRoYW5rcwo+ICAgQ29ub3IKPiAtIEFkZCBSQiBmcm9tIEFuZHJldwo+Cj4gdjQ6Cj4gLSBSZWJh
c2Ugb24gdG9wIG9mIHY2LjItcmMzLCBhcyBub3RlZCBieSBDb25vcgo+IC0gQWRkIEFja2VkLWJ5
IFJvYgo+Cj4gdjM6Cj4gLSBDaGFuZ2UgdGhlIGNvbW1lbnQgYWJvdXQgaW5pdHJkX3N0YXJ0IFZB
IGNvbnZlcnNpb24gc28gdGhhdCBpdCBmaXRzCj4gICBBUk02NCBhbmQgUklTQ1Y2NCAoYW5kIG90
aGVycyBpbiB0aGUgZnV0dXJlIGlmIG5lZWRlZCksIGFzIHN1Z2dlc3RlZAo+ICAgYnkgUm9iCj4K
PiB2MjoKPiAtIEFkZCBhIGNvbW1lbnQgb24gd2h5IFJJU0NWNjQgZG9lcyBub3QgbmVlZCB0byBz
ZXQgaW5pdHJkX3N0YXJ0L2VuZCB0aGF0Cj4gICBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzLCBh
cyBhc2tlZCBieSBSb2IKPgo+IEFsZXhhbmRyZSBHaGl0aSAoNCk6Cj4gICByaXNjdjogR2V0IHJp
ZCBvZiByaXNjdl9wZm5fYmFzZSB2YXJpYWJsZQo+ICAgbW06IEludHJvZHVjZSBtZW1ibG9ja19p
c29sYXRlX21lbW9yeQo+ICAgYXJtNjQ6IE1ha2UgdXNlIG9mIG1lbWJsb2NrX2lzb2xhdGVfbWVt
b3J5IGZvciB0aGUgbGluZWFyIG1hcHBpbmcKPiAgIHJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwoKS2VybmVsIGJvb3QgZmluZSBvbiBSVjY0IGJ1dCB0
aGVyZSBpcyBhIGZhaWx1cmUgd2hpY2ggaXMgc3RpbGwgbm90CmFkZHJlc3NlZC4gWW91IGNhbiBz
ZWUgdGhpcyBmYWlsdXJlIGFzIGZvbGxvd2luZyBtZXNzYWdlIGluCmtlcm5lbCBib290IGxvZzoK
ICAgIDAuMDAwMDAwXSBGYWlsZWQgdG8gYWRkIGEgU3lzdGVtIFJBTSByZXNvdXJjZSBhdCA4MDIw
MDAwMAoKUmVnYXJkcywKQW51cAoKPgo+ICBhcmNoL2FybTY0L21tL21tdS5jICAgICAgICAgICB8
IDI1ICsrKysrKysrKysrLS0tLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIHwg
MTkgKysrKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICB8IDUzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIGFyY2gvcmlzY3YvbW0vcGh5c2Fk
ZHIuYyAgICAgIHwgMTYgKysrKysrKysrKysKPiAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAg
ICAgfCAxMSArKysrLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICB8ICAxICsK
PiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrCj4gIDcg
ZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+Cj4gLS0K
PiAyLjM3LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
