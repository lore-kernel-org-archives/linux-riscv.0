Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5258AC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wu8uV4/2q4G9WqvFuN/T2i4rc2x+hdm/p5O8drINS9w=; b=rrNHl7L6zkEbMu
	+hnMuoYWsgyNAckw/kdJll9lkAtWY69aXrxnLpk1+BWtSeuHkWwiVuC5ZbV8EjliRsxvGgnmd9AjT
	GgZvrG76/Mh7UF0ELAGlKC61yjBe2+XbCrgSs8LLhESWV5b3ZP9W4XKgsiyQ31Tm67vs0YoESocd1
	tMrSNDCo4UQwQQY33NQc55pY8TqPT/hU2i5QIWJmsoYCgztWT+XAlTvin96i6qDuYuZh80xahpt/y
	jUZ/Sw5tgWQzqMqG27oH/80nf7VrN+0xxsr4eTeU7K6VnK0r7fLGx08tYIwZqE9HPpFN6ITvDFJyi
	zW4NCHphCvhHu1nDJ34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pryle-006C9W-1m;
	Thu, 27 Apr 2023 10:22:26 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prylb-006C4V-2x
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 10:22:25 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51f597c975fso8281847a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682590940; x=1685182940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnODog9U903LNGD2V1Nk+gMw3BrcjjBNHazIwAOSIYs=;
        b=btJTg7f9VKENot0Au9p4GAN4K+Bmbohn4oyMWlWhtfceqKATCOMSN0EqEhzzSepPzA
         seRVV5LMhj02yUkZpMcOI1QvdKkysW9+duxXF5JerrH/Z/pdlnV9dxX8n5HlfBDo+2ty
         E+ZALpmuIlKVTlYyXbxLJr6d66daljc+amVBdDWOsLuMoyg7Gghm606jO0a99LQeZ6Ij
         1yrjCrpLukFj5vjiSVtZfZiS0M7YS6brxDw5t5DiIZCRA/k+/O6pB5JDPV5j8KyFeOp+
         KnMgAba9FMGsjDlhy5fbyD4nKGpXxxuHSTAOQ7nbL5gBhB055H27X0S+U/FzanRJ163X
         B1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682590940; x=1685182940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnODog9U903LNGD2V1Nk+gMw3BrcjjBNHazIwAOSIYs=;
        b=AK+vMMkEmx89bXSCD7oYZ7x5UDj7xkXJmeNPwlLpgG6EvEcVFf+Rx/AVopE7a2sJKN
         gcuk9O+OGpOr9OC3GHLvMsdK+pq4e8GR17NbYOrKFAx4RNxRfOAwymE9V5y+s9tjmZLg
         IbbYLfzR4o+B2nRsKWOx6O+EQeYjSgLCCWDD/TXtPszpDdW//FU3xjEmlYP569K2hV+1
         RzAYlWzeT5/EDUfm/QUQr5hD2FJ/3OMv9EaEbpz1lJJnfJlEc6FCWmi7r6MYbCvNXUhc
         36yu3G9Jhjrra8dLjmFLB9Y8hTon7jY+aK6Q9/n92O1RaJFLBIUdN4if9Lf9LNlh3MGZ
         IN7w==
X-Gm-Message-State: AC+VfDyEnSqQVNn0QHdncmEZxm2B4SADofKiXRuaHk28pkOcfc3t7JVy
	fDUgMIu7ESWSob8pfqu75ZD64iOma9gu2M5HeAg=
X-Google-Smtp-Source: ACHHUZ74pJgbzC2ZFcCd//1VReiQpkWmwTEmUMjiTdxjQv6IVRjpu9ndqiUDYz2KnTZWlxGVgUseChkXgRj7PeZoKaM=
X-Received: by 2002:a17:90a:cc02:b0:247:6a93:1d56 with SMTP id
 b2-20020a17090acc0200b002476a931d56mr1313129pju.22.1682590940306; Thu, 27 Apr
 2023 03:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230426100009.685435-1-suagrfillet@gmail.com> <20230427-prevail-upload-033ca439a54c@wendy>
In-Reply-To: <20230427-prevail-upload-033ca439a54c@wendy>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 27 Apr 2023 10:22:08 +0000
Message-ID: <CAAYs2=hvyZgtDOMtO4OMbu5vWC6yn+xJunTYbDZ_T_AZ50kCiQ@mail.gmail.com>
Subject: Re: [PATCH -fixes V2] riscv: mm: remove redundant parameter of create_fdt_early_page_table
To: Conor Dooley <conor.dooley@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, heiko@sntech.de, guoren@kernel.org, 
	anshuman.khandual@arm.com, mick@ics.forth.gr, samuel@sholland.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_032223_981339_552202FD 
X-CRM114-Status: GOOD (  20.87  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5LqOMjAyM+W5tDTmnIgy
N+aXpeWRqOWbmyAxMDoxNeWGmemBk++8mgo+Cj4gT24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMDY6
MDA6MDlQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPiA+IGNyZWF0ZV9mZHRfZWFybHlfcGFn
ZV90YWJsZSgpIGV4cGxpY2l0bHkgdXNlcyBlYXJseV9wZ19kaXIgZm9yCj4gPiAzMi1iaXQgZmR0
IG1hcHBpbmcgYW5kIHRoZSBwZ2RpciBwYXJhbWV0ZXIgaXMgcmVkdW5kYW50IGhlcmUuCj4gPiBT
byByZW1vdmUgaXQgYW5kIGl0cyBjYWxsZXIuCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFNvbmcg
U2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPgo+IFdob29wcywgSSBtaXNzZWQgdGhlIHYy
LCBzbyBjb3B5LXBhc3Rpbmc6Cj4KPiAiYW5kIGl0cyBjYWxsZXIiIHNvdW5kcyBsaWtlIHlvdSdy
ZSByZW1vdmluZyB0aGUgY2FsbGVyIGl0c2VsZiB3aGVuCj4gdGhhdCdzIG5vdCB3aGF0IHlvdSdy
ZSBkb2luZyEKPiBJIGFtIGNlcnRhaW5seSBub3Qgc3VnZ2VzdGluZyB0aGF0IHlvdSByZXN1Ym1p
dCBiZWNhdXNlIG9mIHRoYXQgdGhvdWdoLgo+Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBBdXRvbWF0aW9uIGZhaWxlZCB0byBhcHBs
eSB0aGlzIHdoaWNoIGlzIGEgYml0IHdlaXJkLiBXaGF0IHdhcyB0aGUKPiBiYXNlLWNvbW1pdD8K
Y29tbWl0IDFiNTBmOTU2YzhmZSBgcmlzY3Y6IE5vIG5lZWQgdG8gcmVsb2NhdGUgdGhlIGR0YiBh
cyBpdCBsaWVzIGluCnRoZSBmaXhtYXAgcmVnaW9uYCBpbiByaXNjdi9saW51eCBmaXhlcyBicmFu
Y2guCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiBWMToKPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzgzNTQwY2IxLTBjOWItZjU3Mi04
NDlhLWNiMTAwNDM3ZDA0OUBnaGl0aS5mci9ULyN0Cj4gPiAtIGZpeCB0aGUgdHlwbwo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA2ICsrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+IGluZGV4IDBmMTRm
NGE4ZDE3OS4uNmViYjc1YTlhNmI5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBAQCAtODQzLDggKzg0Myw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfa2VybmVsX3BhZ2VfdGFibGUocGdkX3QgKnBnZGly
LCBib29sIGVhcmx5KQo+ID4gICAqIHRoaXMgbWVhbnMgMiBQTUQgZW50cmllcyB3aGVyZWFzIGZv
ciAzMi1iaXQga2VybmVsLCB0aGlzIGlzIG9ubHkgMSBQR0RJUgo+ID4gICAqIGVudHJ5Lgo+ID4g
ICAqLwo+ID4gLXN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfZmR0X2Vhcmx5X3BhZ2VfdGFibGUo
cGdkX3QgKnBnZGlyLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludHB0cl90IGZpeF9mZHRfdmEsCj4gPiArc3RhdGljIHZvaWQgX19pbml0IGNyZWF0
ZV9mZHRfZWFybHlfcGFnZV90YWJsZSh1aW50cHRyX3QgZml4X2ZkdF92YSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnRwdHJfdCBkdGJfcGEpCj4g
PiAgewo+ID4gICAgICAgdWludHB0cl90IHBhID0gZHRiX3BhICYgfihQTURfU0laRSAtIDEpOwo+
ID4gQEAgLTEwMzQsOCArMTAzMyw3IEBAIGFzbWxpbmthZ2Ugdm9pZCBfX2luaXQgc2V0dXBfdm0o
dWludHB0cl90IGR0Yl9wYSkKPiA+ICAgICAgIGNyZWF0ZV9rZXJuZWxfcGFnZV90YWJsZShlYXJs
eV9wZ19kaXIsIHRydWUpOwo+ID4KPiA+ICAgICAgIC8qIFNldHVwIGVhcmx5IG1hcHBpbmcgZm9y
IEZEVCBlYXJseSBzY2FuICovCj4gPiAtICAgICBjcmVhdGVfZmR0X2Vhcmx5X3BhZ2VfdGFibGUo
ZWFybHlfcGdfZGlyLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZml4
X3RvX3ZpcnQoRklYX0ZEVCksIGR0Yl9wYSk7Cj4gPiArICAgICBjcmVhdGVfZmR0X2Vhcmx5X3Bh
Z2VfdGFibGUoX19maXhfdG9fdmlydChGSVhfRkRUKSwgZHRiX3BhKTsKPiA+Cj4gPiAgICAgICAv
Kgo+ID4gICAgICAgICogQm9vdGltZSBmaXhtYXAgb25seSBjYW4gaGFuZGxlIFBNRF9TSVpFIG1h
cHBpbmcuIFRodXMsIGJvb3QtaW9yZW1hcAo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KCgoKLS0gClRo
YW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
