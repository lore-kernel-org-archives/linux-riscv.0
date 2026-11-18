Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8B606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SwPKvVnb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2QzbFoJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hydrU0KEjazniRDTqqb6TiUMmhu2ePX3NdS9wK2fqwg=; b=SwPKvVnbDbKFtPlEjpsnI7CgUw
	/dcCoewhU8LTyLEyassx2dLzouxONBl1NKYD21ygafYFgy6ief/r8OvH/jwXmMp9ZaTkO5Xf5x/3r
	LJS9a5y5ZrhMUOmXv+uTcjRJg87DLIK0ygT/qqXtbtk9l2Cmy/1CElj624kisdVAAclxj2pvWXAWH
	ur8AEsmtjw/0tiEHwa5kaG6tC7ZWwGckksFVdCCKBCRGru6Qc5V4UNd/9AH7rKIPhJ40QczeElPHo
	WzYATDZqFnF2obAZObhbmyZtLUYY7c/DiSHfGTTkERu8lNDYzsGA6u/8iDu6awhJGC6XtMKz+WTJZ
	9NbPH2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcZm-00000008W78-0LSz;
	Wed, 18 Nov 2026 10:07:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcZk-00000008W6X-3m3z
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:07:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FF2E45FC6
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1441A1F000C7
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996456;
	bh=Sf2ef/DZzsnK1sMDSaxmFCha0DAq5bCsGRzR7EIIXpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d2QzbFoJFY+k8q9V/CGKaMctSrm9z6TSBfBrEjsKosoFas19a+BaErySppE4Ncgt2
	 +YSdxqUGJKw5Ow6BHQmZ0I0Ug7mKId8Hr0d34Dtn/ism8hNDrU1dMb81zn2rGg4keB
	 1Z5QdzO6tUdStZVyDbBk+gjvk1yWL0KOISnTmx5EVdT9jZSZut4WkMBxY2JsPLJUNg
	 dvrkhrUmgKESSnXvjOZUlz1jSYIsuRpL5f/yC03cqwDmO9+V6HuTUlWi+hVrWihCWx
	 9WNv7YMnr1sf7TR58+2c1ubP35MTMNjuajhXEep1RUviGWq5QuxI5Yx/X+Yl5d6r3G
	 XdrDIOXkQ1+oQ==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso542364f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 02:07:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHO1xrMTUZyLmhniGzltMsI8Dl7Y3RQaJkpvCAdra3UbryAyxN9elawOOj//KmYamd92vgUX1xjqpPZgg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+hqBjNxSYdppw9IIOTk05s2jqFIAUdgbc5+1jg+dU1lR4mf7BO
	3MLHd1RidETxjai1wiUFe0TejY9Eq0ZF7FJHVT/DKTWaJdNs4Be8oRqsVMQZdm2eoyPgIvIR3Qp
	qnZE7C2X3ZVQAFpu1NaMvkiE4mMTO02I=
X-Received: by 2002:a05:6000:4812:b0:48d:ff06:c626 with SMTP id
 ffacd0b85a97d-4a63b6fc6d5mr4531220f8f.35.1794996454710; Wed, 18 Nov 2026
 02:07:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 18 Nov 2026 18:07:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+86jtp3Dw9pw8xf7zK=bU_txdGYjaJp+85H7WE_iKLA@mail.gmail.com>
X-Gm-Features: Aa3M54rjZmx21x9qbdtBeJSZpO91ThMWIbqg7YbcJXk95cJ0eYpg24g2amLowHU
Message-ID: <CAJF2gTQ+86jtp3Dw9pw8xf7zK=bU_txdGYjaJp+85H7WE_iKLA@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on secondary harts
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	stable@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTE6MDXigK9BTSBQZWl4aW4gWGllCjxwZWl4aW4ueGll
QGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBEdXJpbmcgZWFybHkgSVNBLXN0cmluZyBw
YXJzaW5nLCB0aGUgYm9vdCBoYXJ0IHN0b3JlcyBpdHMgbXZlbmRvcmlkCj4gYW5kIG1hcmNoaWQg
aW4gcmlzY3ZfY3B1aW5mby4gVGhpcyBoYXBwZW5zIGJlZm9yZSBzZXR1cF9wZXJfY3B1X2FyZWFz
KCksCj4gd2hpY2ggY29waWVzIHRoZSBzdGF0aWMgcGVyLUNQVSBkYXRhIHRvIGVhY2ggQ1BVJ3Mg
YWxsb2NhdGVkIGFyZWEuCj4KPiBXaGVuIHJpc2N2X2NwdWluZm9fc3RhcnRpbmcoKSBydW5zIG9u
IHRoZSBvdGhlciBoYXJ0cywgdGhlIGNvcGllZCBJRHMKPiBhcmUgYWxyZWFkeSBub256ZXJvLCBz
byBpdCBza2lwcyByZWFkaW5nIHRoZWlyIG93biBJRHMuIEFzIGEgcmVzdWx0LAo+IHNlY29uZGFy
eSBoYXJ0cyBjYW4gcmV0YWluIHRoZSBib290IGhhcnQncyBJRHMuCj4KPiBSZWFkIG12ZW5kb3Jp
ZCBhbmQgbWFyY2hpZCB1bmNvbmRpdGlvbmFsbHkgb24gZWFjaCBoYXJ0LCBhcyBhbHJlYWR5Cj4g
ZG9uZSBmb3IgbWltcGlkLgo+Cj4gRml4ZXM6IGU0ODJlYWI0ZDFlYiAoInJpc2N2OiBjcHVmZWF0
dXJlOiBGaXggdGhlYWQgdmVjdG9yIGh3Y2FwIHJlbW92YWwiKQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUGVpeGluIFhpZSA8cGVpeGluLnhpZUBsaW51eC5z
cGFjZW1pdC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jIHwgMTIgKysrKy0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHUuYwo+IGluZGV4IGFmODRiOTdhZjNhMS4uNjRjMGM4M2VmZjc2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
LmMKPiBAQCAtMTk3LDE2ICsxOTcsMTIgQEAgc3RhdGljIGludCByaXNjdl9jcHVpbmZvX3N0YXJ0
aW5nKHVuc2lnbmVkIGludCBjcHUpCj4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfY3B1aW5mbyAqY2kg
PSB0aGlzX2NwdV9wdHIoJnJpc2N2X2NwdWluZm8pOwo+Cj4gICNpZiBJU19FTkFCTEVEKENPTkZJ
R19SSVNDVl9TQkkpCj4gLSAgICAgICBpZiAoIWNpLT5tdmVuZG9yaWQpCj4gLSAgICAgICAgICAg
ICAgIGNpLT5tdmVuZG9yaWQgPSBzYmlfc3BlY19pc18wXzEoKSA/IDAgOiBzYmlfZ2V0X212ZW5k
b3JpZCgpOwo+IC0gICAgICAgaWYgKCFjaS0+bWFyY2hpZCkKPiAtICAgICAgICAgICAgICAgY2kt
Pm1hcmNoaWQgPSBzYmlfc3BlY19pc18wXzEoKSA/IDAgOiBzYmlfZ2V0X21hcmNoaWQoKTsKPiAr
ICAgICAgIGNpLT5tdmVuZG9yaWQgPSBzYmlfc3BlY19pc18wXzEoKSA/IDAgOiBzYmlfZ2V0X212
ZW5kb3JpZCgpOwo+ICsgICAgICAgY2ktPm1hcmNoaWQgPSBzYmlfc3BlY19pc18wXzEoKSA/IDAg
OiBzYmlfZ2V0X21hcmNoaWQoKTsKPiAgICAgICAgIGNpLT5taW1waWQgPSBzYmlfc3BlY19pc18w
XzEoKSA/IDAgOiBzYmlfZ2V0X21pbXBpZCgpOwo+ICAjZWxpZiBJU19FTkFCTEVEKENPTkZJR19S
SVNDVl9NX01PREUpCj4gLSAgICAgICBpZiAoIWNpLT5tdmVuZG9yaWQpCj4gLSAgICAgICAgICAg
ICAgIGNpLT5tdmVuZG9yaWQgPSBjc3JfcmVhZChDU1JfTVZFTkRPUklEKTsKPiAtICAgICAgIGlm
ICghY2ktPm1hcmNoaWQpCj4gLSAgICAgICAgICAgICAgIGNpLT5tYXJjaGlkID0gY3NyX3JlYWQo
Q1NSX01BUkNISUQpOwo+ICsgICAgICAgY2ktPm12ZW5kb3JpZCA9IGNzcl9yZWFkKENTUl9NVkVO
RE9SSUQpOwo+ICsgICAgICAgY2ktPm1hcmNoaWQgPSBjc3JfcmVhZChDU1JfTUFSQ0hJRCk7Cj4g
ICAgICAgICBjaS0+bWltcGlkID0gY3NyX3JlYWQoQ1NSX01JTVBJRCk7Cj4gICNlbHNlCj4gICAg
ICAgICBjaS0+bXZlbmRvcmlkID0gMDsKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiA2NjI4ZTdkNGM2
YjI1YzhkMThmMTM0NWUzYTIwZDIxODI5YWFlN2U0Cj4gY2hhbmdlLWlkOiAyMDI2MTExOC1yaXNj
di1tYXJjaGlkLWZpeC0zZWEzNjcyZDFlMGUKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFBlaXhp
biBYaWUgPHBlaXhpbi54aWVAbGludXguc3BhY2VtaXQuY29tPgo+CkhtbSwgaXQgc29sdmVkIHRo
ZSBwcm9ibGVtIG9uIEJpZy1saXR0bGUgY29yZXMnIFNvQy4KClJldmlld2VkLWJ5OiBHVU8gUmVu
IChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
