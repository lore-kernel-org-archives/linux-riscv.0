Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFBCEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KTzWbaFGjrHDEb8oSUKz2qoFkfHRUvGB2A+Bn5U5XgI=; b=PwlFPZ1fWi87RqcULUIBppqRsP
	0FJ3rgcEx+e4oIsYEyCSFnm8bgR6sx8Q0xKqpMuX4280e+X/IFgMCgssfpR7iO7/UZHzzSVH7B4vC
	JHM7uh3oCjFp6kKGbY2/9xX90L7DKYVYj5yb+hcl+qhsRkk/FlXnzULNbCoi4dE/dUs5YBbzloM+4
	3wVOmG+ngnz3qn46OAJhgMGfutsLZ/C/x8sRicf7VFFUls83IeVeDEoSzYnIA+AOVTFP6pnei6aCC
	zVc81eMzwExy17o0ZPlB5da+C73Y8NgwK7Lt6nnCReroSePU8xmJKi9loaz9M1p05DLlHfppCi5+a
	RfjP6/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDYL7-008q74-2W;
	Sun, 25 Jun 2023 22:36:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDYL3-008q6O-1D
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 22:36:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-262e619fbb9so233143a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687732567; x=1690324567;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsqNhkE5oWlMgtIBUOkdhdib6xZtYP/JVM/Zsc0j+ts=;
        b=cihVByItGc+eVG4fy+EISc6Bqco0E+A7e5FqMT8JF5b0t783oDa2N6FS+yHNR8JIZH
         Zb4RiTZgIp+m8w+DIbKDSNXBgGxFnJnlcD2xDghKMQn8huuoRW5ueQCZzR9ZYLQsg6Fz
         QC5rQL3JGLuVLms9u+yh2gdmlPirR8det57xQlpb/OHS6hZshppUKdVamBLmFEQZg27k
         Sdgw+xPpf+Yxl0skzejaeB86m/eizwSpjvG6VCyZxllPmExoCPMo1Z7H3WZYw9DHU2GO
         8RrNOsr94j4k/Bnn9v0xZzNgPCka5OuAiVcNqUIdnHEqEyQz7NzktKyTzda2C//Cfzn5
         Rvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687732567; x=1690324567;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsqNhkE5oWlMgtIBUOkdhdib6xZtYP/JVM/Zsc0j+ts=;
        b=WVeg57EFgLoIYKxrQnZH8PuDBjrlStHsPrqvobHKcz2nrI5bP3pVpCFQF9uUbZNUz9
         dB2rh5cc2BGTNRUeiVmcDxqUE2aQ/rRLJPWf7TIrxzZo++Vvrv2O9arnTLa+FAWEJS31
         rgEW9bbXY/VLWjwKqBzkSsnE73ZV9P6WqUp5uOc2rUHBt5liMPedDg+Co2Ac/e4/yDU+
         GF3VzdkL/wslqJqw7fKj/DdYygGwnXiWlXCMbS9beF1B1yoBeVxqHOaqMtVw1bz1xHJH
         RwHSfr8OPw0voT7XBjxPxgypzrljI4JGBNIdZdUdQFbBC+A/l6t5pj6nvwuNzlRxv0+V
         frMQ==
X-Gm-Message-State: AC+VfDxyFuE+cWQFfSNZnQNUC89j8L55C+ACMsdNYImffjwUxCs0WuMs
	WOH3kqLaY4JbECJRefuW3DuZHg==
X-Google-Smtp-Source: ACHHUZ69BZVi1KJzS7hQaMLqlt1Sd5kzMCZwpAk6rFMb0eeKG+qy91PnYxOv+QVg7tosGmhPDxdWVw==
X-Received: by 2002:a17:90a:1:b0:262:b3f8:6ae with SMTP id 1-20020a17090a000100b00262b3f806aemr3976171pja.46.1687732567008;
        Sun, 25 Jun 2023 15:36:07 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ip4-20020a17090b314400b0025374fedab4sm4789374pjb.22.2023.06.25.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 15:36:06 -0700 (PDT)
Date: Sun, 25 Jun 2023 15:36:06 -0700 (PDT)
X-Google-Original-Date: Sun, 25 Jun 2023 15:35:24 PDT (-0700)
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
In-Reply-To: <20230625-obstinate-grimy-b765a1d3d741@spud>
CC: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
  alexghiti@rivosinc.com, mpe@ellerman.id.au, Arnd Bergmann <arnd@arndb.de>, rppt@kernel.org,
  samuel@sholland.org, panqinglin2020@iscas.ac.cn, Conor Dooley <conor.dooley@microchip.com>,
  anup@brainfault.org, xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com, heiko@sntech.de,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-57d088de-b527-4f19-89f5-fec31a6df475@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_153609_642774_F9C888E1 
X-CRM114-Status: GOOD (  37.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyNSBKdW4gMjAyMyAxNToxNToxNCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IEhleSwKPgo+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDExOjA5OjIxUE0gKzA4MDAs
IFNvbmcgU2h1YWkgd3JvdGU6Cj4KPj4gU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlcGx5LAo+Cj4g
SXQgd2Fzbid0IHJlYWxseSBkZWxheWVkIGF0IGFsbCBhY3R1YWxseSwgeW91IHJlcGxpZWQgd2l0
aGluIGFuIGhvdXIgb3IKPiBzbywgQUZBSUNULgo+Cj4+IE15IHRpbnlsYWIgZW1haWwgd2VudCBz
b21ldGhpbmcgd3JvbmcsIEknbGwgdXNlIGdtYWlsIGluIHRoaXMgdGhyZWFkLgo+PiAKPj4g5Zyo
IDIwMjMvNi8yNSAyMjoxOCwgQ29ub3IgRG9vbGV5IOWGmemBkzoKPj4gPiBPbiBTdW4sIEp1biAy
NSwgMjAyMyBhdCAxMDowOToyOVBNICswODAwLCBTb25nIFNodWFpIHdyb3RlOgo+PiA+ID4gVGhp
cyByZXZlcnRzIGNvbW1pdCBlZDMwOWNlNTIyMTg1NTgzYjE2M2JkMGM3NGYwZDlmMjk5ZmUxODI2
Lgo+PiA+ID4gCj4+ID4gPiBXaXRoIHRoZSBjb21taXQgMzMzNTA2OGY4NzIxICgicmlzY3Y6IFVz
ZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlCj4+ID4gPiBsaW5lYXIgbWFwcGluZyIpIHJldmVy
dGVkLCB0aGUgTUlOX01FTUJMT0NLX0FERFIgcG9pbnRzIHRoZSBrZXJuZWwKPj4gPiA+IGxvYWQg
YWRkcmVzcyB3aGljaCB3YXMgcGxhY2VkIGF0IGEgUE1EIGJvdW5kYXJ5Lgo+PiA+IAo+PiA+ID4g
QW5kIGZpcm13YXJlIGFsd2F5cwo+PiA+ID4gY29ycmVjdGx5IG1hcmsgcmVzaWRlbnQgbWVtb3J5
LCBvciBtZW1vcnkgcHJvdGVjdGVkIHdpdGggUE1QIGFzCj4+ID4gPiBwZXIgdGhlIGRldmljZXRy
ZWUgc3BlY2lmaWNhdGlvbiBhbmQvb3IgdGhlIFVFRkkgc3BlY2lmaWNhdGlvbi4KPj4gPiAKPj4g
PiBCdXQgdGhpcyBpcyBub3QgdHJ1ZT8gVGhlIHZlcnNpb25zIG9mIE9wZW5TQkkgdGhhdCB5b3Ug
bWVudGlvbiBpbiB5b3VyCj4+ID4gY292ZXIgbGV0dGVyIGRvIG5vdCBkbyB0aGlzLgo+PiA+IFBs
ZWFzZSBleHBsYWluLgo+PiA+IAo+PiAKPj4gQXQgdGhpcyB0aW1lLCBPcGVuU2JpIFt2MC44LHYx
LjMpIGFuZCBlZGsyKFJpc2NWVmlydCkgaW5kZWVkIGRvbid0IG9iZXkgdGhlCj4+IERUL1VFRkkg
c3BlYy4gVGhpcyBzdGF0ZW1lbnQgaXMgZXhjZXJwdGVkIGZyb20gIlJlc2VydmVkIG1lbW9yeSBm
b3IgcmVzaWRlbnQKPj4gZmlybXdhcmUiIHBhcnQgZnJvbSB0aGUgdXBjb21pbmcgcmlzY3YvYm9v
dC5yc3QuIEl0IGlzbid0IGFjY3VyYXRlIGZvciBub3cuCj4+IEhvdyBhYm91dCBkZWxldGluZyB0
aGlzIG9uZT8KPgo+IEl0IGlzIGluY29ycmVjdCwgc28gaXQgd2lsbCBuZWVkIHRvIGJlIHJlbW92
ZWQsIHllcy4KPiBVbmZvcnR1bmF0ZWx5IHdyaXRpbmcgYSBkb2MgZG9lcyBub3QgZml4IHRoZSBl
eGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgOigKPgo+PiBBY3R1YWxseSB3aXRoIDMzMzUwNjhmODcy
MSByZXZlcnRlZCwgdGhlIGNoYW5nZSBvZiBNSU5fTUVNQkxPQ0tfQUREUiBjYW4KPj4gYXZvaWQg
dGhlIG1hcHBpbmcgb2YgZmlybXdhcmUgbWVtb3J5LCBJIHdpbGwgbWFrZSBpdCBjbGVhciBpbiB0
aGUgbmV4dAo+PiB2ZXJzaW9uLgo+Cj4gVG8gYmUgaG9uZXN0LCBJJ2QgbGlrZSB0byBzZWUgdGhp
cyByZXZlcnQgYXMgdGhlIGZpbmFsIGNvbW1pdCBpbiBhCj4gc2VyaWVzIHRoYXQgZGVhbHMgd2l0
aCB0aGUgcHJvYmxlbSBieSBhY3R1YWxseSByZXNlcnZpbmcgdGhlIHJlZ2lvbnMsCj4gcmF0aGVy
IHRoYW4gYSBzZXQgb2YgcmV2ZXJ0cyB0aGF0IGdvIGJhY2sgdG8gaG93IHdlIHdlcmUuCj4gSSB3
YXMgaG9waW5nIHRoYXQgc29tZW9uZSB3aG8gY2FyZXMgYWJvdXQgaGliZXJuYXRpb24gc3VwcG9y
dCB3b3VsZCBiZQo+IGludGVyZXN0ZWQgaW4gd29ya2luZyBvbiB0aGF0IC0gKmNvdWdoKiBzdGFy
Zml2ZSAqY291Z2gqLCBhbHRob3VnaCBtYXliZQo+IHRoZXkganVzdCBmaXhlZCB0aGVpciBPcGVu
U0JJIGFuZCBtb3ZlZCBvbi4KPiBJZiB0aGVyZSB3ZXJlIG5vIHZvbHVudGVlcnMsIG15IGludGVu
dGlvbiB3YXMgdG8gYWRkIGEgZmlybXdhcmUgZXJyYXR1bQo+IHRoYXQgd291bGQgcHJvYmUgdGhl
IFNCSSBpbXBsZW1lbnRhdGlvbiAmIHZlcnNpb24gSURzLCBhbmQgYWRkIGEgZmlybXdhcmUKPiBl
cnJhdHVtIHRoYXQnZCBwYXJzZSB0aGUgRFQgZm9yIHRoZSBvZmZlbmRpbmcgcmVnaW9ucyBhbmQg
cmVzZXJ2ZSB0aGVtLgoKSXMgdGhlcmUgYW55IGFjdHVhbCB1c2UgY2FzZSBmb3IgaGliZXJuYXRp
b24gb24gdGhlc2UgYm9hcmRzPyAgTWF5YmUgCml0J3Mgc2ltcGxlciB0byBqdXN0IGFkZCBhICJy
ZXNlcnZlZCByZWdpb25zIGFjdHVhbGx5IHdvcmsiIHNvcnQgb2YgCnByb3BlcnR5IGFuZCB0aGVu
IGhhdmUgbmV3IGZpcm13YXJlIHNldCBpdCAtLSB0aGF0IHdheSB3ZSBjYW4gYXZvaWQgCnNvcnRp
bmcgdGhyb3VnaCBhbGwgdGhlIG9sZCBzdHVmZiBub2JvZHkgY2FyZXMgYWJvdXQgYW5kIGp1c3Qg
Z2V0IG9uIAp3aXRoIGZpeGluZyB0aGUgc3R1ZmYgcGVvcGxlIHVzZS4KCj4KPiBDaGVlcnMsCj4g
Q29ub3IuCj4KPj4gPiA+IFNvIHRob3NlIHJlZ2lvbnMgd2lsbCBub3QgYmUgbWFwcGVkIGluIHRo
ZSBsaW5lYXIgbWFwcGluZyBhbmQgdGhleQo+PiA+ID4gY2FuIGJlIHNhZmVseSBzYXZlZC9yZXN0
b3JlZCBieSBoaWJlcm5hdGlvbi4KPj4gPiA+IAo+PiA+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBT
aHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+Cj4+ID4gPiAtLS0KPj4gPiA+ICAgYXJj
aC9yaXNjdi9LY29uZmlnIHwgNSArLS0tLQo+PiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4+ID4gPiAKPj4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gPiA+IGluZGV4IDU5NjZhZDk3
YzMwYy4uMTdiNWZjN2Y1NGQ0IDEwMDY0NAo+PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmln
Cj4+ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gPiA+IEBAIC04MDAsMTEgKzgwMCw4
IEBAIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucyIKPj4gPiA+ICAgc291cmNlICJrZXJu
ZWwvcG93ZXIvS2NvbmZpZyIKPj4gPiA+IC0jIEhpYmVybmF0aW9uIGlzIG9ubHkgcG9zc2libGUg
b24gc3lzdGVtcyB3aGVyZSB0aGUgU0JJIGltcGxlbWVudGF0aW9uIGhhcwo+PiA+ID4gLSMgbWFy
a2VkIGl0cyByZXNlcnZlZCBtZW1vcnkgYXMgbm90IGFjY2Vzc2libGUgZnJvbSwgb3IgZG9lcyBu
b3QgcnVuCj4+ID4gPiAtIyBmcm9tIHRoZSBzYW1lIG1lbW9yeSBhcywgTGludXgKPj4gPiA+ICAg
Y29uZmlnIEFSQ0hfSElCRVJOQVRJT05fUE9TU0lCTEUKPj4gPiA+IC0JZGVmX2Jvb2wgTk9OUE9S
VEFCTEUKPj4gPiA+ICsJZGVmX2Jvb2wgeQo+PiA+ID4gICBjb25maWcgQVJDSF9ISUJFUk5BVElP
Tl9IRUFERVIKPj4gPiA+ICAgCWRlZl9ib29sIEhJQkVSTkFUSU9OCj4+ID4gPiAtLSAKPj4gPiA+
IDIuMjAuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
