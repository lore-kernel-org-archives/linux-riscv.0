Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE98BEB64DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fwOmQAcaRLKiuJSVzPZpZEs8UuUNwig9iPTGkgq4fvI=; b=bBjFPS7rzanVKkIpRwKxyx2+1+
	ugI4telVw2M/roEwyK6HSbUEmD1r5pkaLQPj0teYXxg7D7T235OJDiIuSj2nwzfgDtdeal1f5ajLW
	+g6h9tC4Glo7UjJzVo50Zvig8rcpHohjgggAeQO3aECGm9zS7ZtTpJveGcnHNRFXTNhIH3aevnGVS
	rnFHUYLUDdu3sThb75E1D/98J++Qd0meOBOyY4FwGbq1e8rc/2xOwlTbdkDoD0oHhbgjp7un0GMfx
	VmhvhEspWryiBiG7WbWGVSTEZc7lT3NGUDHD0MpbulYNBknLIoXnviFLPR1gBt4Qg8OxJAVBkqUCZ
	VyTmbo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK9f-009GiN-2d;
	Mon, 19 Jun 2023 19:03:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK9d-009Gh7-0M
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:03:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b53b8465daso13975315ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687201387; x=1689793387;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh2Knh+eyFpPP0zXFVZmWYF3CKRxFUiHLPlFuSbog+U=;
        b=wKx+bos1cI6IbySsPO8+K2v2s9qp3I7I42gsP1g1LY8PjPkUjSGsKylL6wOhYHprrg
         CeGoOwZeha+WOXdTxRa+xwfiVyYWjPvqMqAGDryO5peYAkFqeY0AL8/YgT7SMglSExGd
         qIE9Sai5+lXS9/fBds6bLDEQOPqQnnizY84bYoltnIyyAQHV7m88flara4ZY8jnbuupv
         f5+8ov4PGPZOH6G8Xn4WM4bZk9ntE/phgyaGeFET8mksgxpVQEpYvtlBKQqzlsJKJlh7
         KTHQgtc1QVlJc+7VDmXI7do7X4cQZXFRLgkIUWTDhw/W3j3D/xvabtU8AHBjky4TPDre
         iG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201387; x=1689793387;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jh2Knh+eyFpPP0zXFVZmWYF3CKRxFUiHLPlFuSbog+U=;
        b=imOj7YmNJ9fGXwnEjMxxzaw/tJmFXoAFSF6FOmA6S7s2y56ho97FcH2Ssiclm52VQp
         xum6L4uhUvLR91gS1yWr7lkPBCQXZKMhXlYzbUlyU5EFD9RtsB8sPuvvc+K3Oy7DiGaD
         MoivwvV2yBdMnmsUQZY6dQkGcUxXbL8/2mEPlQ9wGguiRyfBfLRTrwEYR9raoPRiy72y
         iTuYj2yEtZqLmQO22kabpXl3BXWx/nLVar6+rOiAaBSpRsF/nWudp4a2O+n2PDymz6A2
         6UeiYf1oJhlcMJGqY+FJGGMUUBk3fdJExwVaAAyB3ZP5OIU+IPUoGCV81nWAfYJeVYyS
         t4kA==
X-Gm-Message-State: AC+VfDyKRq4AfLSyUD6xsibRxWKhhNh/ykKDBVADMrDzuFy7TPm20y7n
	5ZReKaD0i3fgtbxG89dW834zzL94IOF1nC2XHB0=
X-Google-Smtp-Source: ACHHUZ5slzFxErDOuI/VLgAicRS0PDu+7Qm4FG0tyxCQzp6FxqsYNgc5Dwct9avX8bAtIaa6VcvivA==
X-Received: by 2002:a17:903:25c4:b0:1b5:fb8:a821 with SMTP id jc4-20020a17090325c400b001b50fb8a821mr5665874plb.13.1687201387481;
        Mon, 19 Jun 2023 12:03:07 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b001a64851087bsm146947ple.272.2023.06.19.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 12:03:06 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:03:06 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 12:02:12 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Document that V registers are clobbered on syscalls
In-Reply-To: <871qi7l2ml.fsf@all.your.base.are.belong.to.us>
CC: linux-riscv@lists.infradead.org, remi@remlab.net
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bjorn@kernel.org
Message-ID: <mhng-b8c6af23-6bf7-4262-a5d0-e5316e3cea61@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120309_151849_64228E32 
X-CRM114-Status: GOOD (  15.75  )
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

T24gTW9uLCAxOSBKdW4gMjAyMyAxMTozNzozOCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+
Cj4+IFRoaXMgaXMgaW5jbHVkZWQgaW4gdGhlIElTQSBtYW51YWwsIGJ1dCBpdCdzIHByZXR0eSBj
b21tb24gZm9yIGJpdHMgb2YKPj4gdGhlIElTQSBtYW51YWwgdGhhdCBhcmUgYWN0dWFsbHkgQUJJ
IHRvIGNoYW5nZS4gIFNvIGxldCdzIGRvY3VtZW50IGl0Cj4+IGV4cGxpY2l0bHkuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+PiAtLS0K
Pj4gQ2hhbmdlcyBzaW5jZSB2MSA8MjAyMzA2MTQxNjM1MzQuMTg2NjgtMS1wYWxtZXJAcml2b3Np
bmMuY29tPjoKPj4KPj4gKiBSZW1vdmUgdGhlIGNvZGUgY2hhbmdlLCBqdXN0IHVwZGF0ZSB0aGUg
ZG9jdW1lbnRhdGlvbi4gIFdlIG1pZ2h0IHN0aWxsCj4+ICAgd2FudCB0byBkbyBzb21ldGhpbmcg
aW4gdGhlIGNvZGUsIGJ1dCB0aGF0J3Mgc3RpbGwgdW5kZXIgZGlzY3Vzc2lvbiBzbwo+PiAgIGxl
dCdzIGdldCB0aGUgZG9jcyBzb3J0ZWQgb3V0IGZvciBub3cuCj4+IC0tLQo+PiAgRG9jdW1lbnRh
dGlvbi9yaXNjdi92ZWN0b3IucnN0IHwgNiArKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9y
LnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdAo+PiBpbmRleCA0OGYxODlkNzll
NDEuLjk2ZjBmZWRlY2U3MyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0
b3IucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdAo+PiBAQCAtMTMw
LDMgKzEzMCw5IEBAIHByb2Nlc3NlcyBpbiBmb3JtIG9mIHN5c2N0bCBrbm9iOgo+PiAgCj4+ICAg
ICAgTW9kaWZ5aW5nIHRoZSBzeXN0ZW0gZGVmYXVsdCBlbmFibGVtZW50IHN0YXR1cyBkb2VzIG5v
dCBhZmZlY3QgdGhlIGVuYWJsZW1lbnQKPj4gICAgICBzdGF0dXMgb2YgYW55IGV4aXN0aW5nIHBy
b2Nlc3Mgb2YgdGhyZWFkIHRoYXQgZG8gbm90IG1ha2UgYW4gZXhlY3ZlKCkgY2FsbC4KPj4gKwo+
PiArMy4gIFZlY3RvciBSZWdpc3RlciBTdGF0ZSBBY3Jvc3MgU3lzdGVtIENhbGxzCj4+ICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+PiArQXMgaW5k
aWNhdGVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBWIGV4dGVuc2lvbiwgdmVjdG9yIHJlZ2lzdGVy
cyBhcmUgY2xvYmJlcmVkCj4+ICtieSBzeXN0ZW0gY2FsbHMuCj4KPiBNYXliZSBhZGQgYSByZWZl
cmVuY2UgdG8gdGhlIHNwZWMgWzFdPwo+Cj4gUmVnYXJkbGVzcyBpZiB0aGF0IGlzIGFkZGVkLCBv
ciBub3Q6Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
Pgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytdi1zcGVjL2Jsb2IvbWFzdGVy
L2NhbGxpbmctY29udmVudGlvbi5hZG9jCgpTZWVtcyByZWFzb25hYmxlLCBJIGp1c3Qgc2VudCBh
IHYzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
