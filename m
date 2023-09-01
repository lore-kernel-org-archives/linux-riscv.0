Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76A9CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcFbb2pJ9LuQfxOBewg5Ee9wCf9OL5ovxlfBuvqmFO8=; b=x4sCLEnWb7tcgg
	m36g5eFVmCtv0B7pMN+KhWGwc2dnEZgiOz5pqT8KI7n0PHVGK73AUNDA9V2UdPv9mGQObu0ItdSPf
	8MrXUVSljtil9QcN1iLIPqQRdbg4oJSPuWNWs5U4q7y+9qHYwTvDXc/q6uv2emrrs7c9F7FvZBbzF
	lGoDfmP5JeaC3ACmd5/TVzL9R/kizjQtwE+Wyl9dbWAmovfTsJgjvqmRgl5DsIj95Pur1ue3n3csp
	6NxCPFhLlbEBJbwhwfkyvnpYzaEMVQ+5N9xoG5s+Y0JNzOpLIBrD5KBRdkbtahbMQ2qqxwIyrgBWe
	EnlBqAkqmwvjoYSliAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxKI-00GWmL-10;
	Fri, 01 Sep 2023 06:08:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxKE-00GWlj-2i
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 06:08:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-500b0f06136so3034226e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1693548487; x=1694153287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55BxJjKi7DirtlyQXejaP8jWTZ8SZUZhKioXDf5mo/E=;
        b=oSYgFRtn0+8b22gbynrh60Q03zhuMJXpu/WdQTNxn0ZjK29Y+PugNU90BDQup3R2oX
         6jjvf/YEKZjvUrN2g4l0EMzYvTJBPlvIfIPp3gW8sjKouEhTQpBMjl/cTLOlKLvhl3Y0
         YnSCktls8/H49Q8RAqFFffGYwRLsCleyTkHsOZ/oSX5cfyfoMuUgscDi5DrhhBRc2X+t
         XXUnW1wVsC3PITlevjfoCCwyZJSToM271UcB2JKQHz19RcwKhUq572DqL8BBypOtgOgA
         DAkCPw7tgETvrP/Ycr3/U3wNMDWm+H9/OP7vRduYiEwROQIYrVBOZxtCgZJnBZHOfuwr
         ARgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693548487; x=1694153287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55BxJjKi7DirtlyQXejaP8jWTZ8SZUZhKioXDf5mo/E=;
        b=O7uZqdEAPQf0zbLWzdxhKZS+0G4KCtuy3tb5Cw58OyzhO/r1jUVW5prXxZTRolO6co
         Q1up8B+m0EvHH6qf1KJ2HaLIR3cjrBJ5IGBM7NyVsf0/VaWubcyoD3DyqaGbGmBxPKJO
         pDs5K346Jtk8ayddDzdn6kEBQjWoT0lvMba8JhmgV3p9GmlV8zw0hAJF1RDhFDOft2wk
         bO0KJrP3oEQVkqu9+es1r0+Yvc6p+f/Bg9G3Q+csP4s2cISQfwX/Xihd1YOuzMjhRBuy
         gckU6bYpa89MIJRbsbv2O6+Fbt5R0KlBMs54kc/mxZSaOfYOMSk6Du+oKBK1VPxUVf/C
         fPEw==
X-Gm-Message-State: AOJu0YxDtUoKw/WQILOVr/HCkIFoIs5G0JjyPVlmLphHC6z9245IAyXY
	vHNm+mS3atfGku3YE2LMsDXtjUo2cBSD5diskAAL4g==
X-Google-Smtp-Source: AGHT+IHhmP3gDhGomai/9raHqQKs+Q5jpKVGJgJsGk/popt6RSiceb6Vl34UQbx7LN57F4CW4PL97nuoVUvhRY61XQc=
X-Received: by 2002:ac2:57cb:0:b0:4fe:7e7f:1328 with SMTP id
 k11-20020ac257cb000000b004fe7e7f1328mr693199lfo.16.1693548487184; Thu, 31 Aug
 2023 23:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230828101757.9724-1-aboutphysycs@gmail.com> <20230828-citable-superjet-d235f036be99@wendy>
In-Reply-To: <20230828-citable-superjet-d235f036be99@wendy>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Fri, 1 Sep 2023 09:07:56 +0300
Message-ID: <CAH3L5QreWNPgwogL7bCYZgKSuz_HfZuKLtRVqz+UyRtJ1TB-SA@mail.gmail.com>
Subject: Re: [PATCH] char: hw_random: mpfs-rng: removed unneeded call to platform_set_drvdata()
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrei Coardos <aboutphysycs@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	herbert@gondor.apana.org.au, olivia@selenic.com, daire.mcnamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_230810_971643_F4ACC37B 
X-CRM114-Status: GOOD (  22.00  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMjowNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMDE6
MTc6NTdQTSArMDMwMCwgQW5kcmVpIENvYXJkb3Mgd3JvdGU6Cj4gPiBUaGlzIGZ1bmN0aW9uIGNh
bGwgd2FzIGZvdW5kIHRvIGJlIHVubmVjZXNzYXJ5IGFzIHRoZXJlIGlzIG5vIGVxdWl2YWxlbnQK
PiA+IHBsYXRmb3JtX2dldF9kcnZkYXRhKCkgY2FsbCB0byBhY2Nlc3MgdGhlIHByaXZhdGUgZGF0
YSBvZiB0aGUgZHJpdmVyLiBBbHNvLAo+ID4gdGhlIHByaXZhdGUgZGF0YSBpcyBkZWZpbmVkIGlu
IHRoaXMgZHJpdmVyLCBzbyB0aGVyZSBpcyBubyByaXNrIG9mIGl0IGJlaW5nCj4gPiBhY2Nlc3Nl
ZCBvdXRzaWRlIG9mIHRoaXMgZHJpdmVyIGZpbGUuCj4KPiBJIHRoaW5rIEdyZWcgcHJldmlvdXNs
eSBwb2ludGVkIG91dCB0byB5b3UgdGhhdCBpcyBpdCBub3Qgc3VmZmljaWVudCB0bwo+IGNoZWNr
IGZvciBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YSgpIGFsb25lLCBiZWNhdXNlIHRoZSBpbmZvcm1hdGlv
biBjb3VsZCBiZQo+IGFjY2Vzc2VkIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGF0IGhlbHBlci4g
VGhhdCdzIG5vdCB0aGUgY2FzZSBoZXJlLAo+IGJ1dCBpdCBjb3VsZCBiZSB0cnVlIGVsc2V3aGVy
ZS4KPgo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVpIENv
YXJkb3MgPGFib3V0cGh5c3ljc0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2NoYXIv
aHdfcmFuZG9tL21wZnMtcm5nLmMgfCAyIC0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vbXBmcy1y
bmcuYyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vbXBmcy1ybmcuYwo+ID4gaW5kZXggYzY5NzI3
MzRhZTYyLi4wOTk0MDI0ZGFhNzAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2NoYXIvaHdfcmFu
ZG9tL21wZnMtcm5nLmMKPiA+ICsrKyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vbXBmcy1ybmcu
Ywo+ID4gQEAgLTc5LDggKzc5LDYgQEAgc3RhdGljIGludCBtcGZzX3JuZ19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgcm5nX3ByaXYtPnJuZy5yZWFkID0gbXBm
c19ybmdfcmVhZDsKPiA+ICAgICAgIHJuZ19wcml2LT5ybmcubmFtZSA9IHBkZXYtPm5hbWU7Cj4g
Pgo+ID4gLSAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcm5nX3ByaXYpOwo+ID4gLQo+
ID4gICAgICAgcmV0ID0gZGV2bV9od3JuZ19yZWdpc3RlcigmcGRldi0+ZGV2LCAmcm5nX3ByaXYt
PnJuZyk7CgpBIHF1ZXN0aW9uIHdvdWxkIGJlIGlmIHRoZXJlIGlzIGEgZGVzaXJlIHRvIGtlZXAg
dGhlIHByaW50cyBiZWxvdywgb3IKd291bGQgdGhpcyBiZSBzdWZmaWNpZW50PwoKICAgICAgICAg
IHJldHVybiBkZXZtX2h3cm5nX3JlZ2lzdGVyKCZwZGV2LT5kZXYsICZybmdfcHJpdi0+cm5nKTsK
CklmIHRoZXJlIGlzIHRoZSBkZXNpcmUgdG8ga2VlcCB0aGUgcHJpbnRzLCB0aGVuOgoKUmV2aWV3
ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleEBzaHJ1Z2dpZS5ybz4KCj4gPiAgICAgICBp
ZiAocmV0KQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2
LCByZXQsICJGYWlsZWQgdG8gcmVnaXN0ZXIgTVBGUyBod3JuZ1xuIik7Cj4gPiAtLQo+ID4gMi4z
NC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
