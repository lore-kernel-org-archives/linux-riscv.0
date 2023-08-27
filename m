Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC55C83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIkiQCpgWFkzJm0eeuEE+j0CE12IONWPGM1rJ6WueXk=; b=M6z4pMQzs+NKX/
	HLM7TwqWRRE2wc6V6m0wH4casPiwgXSiM/OsJRwkNeNGFNiQg/6kzAb8Pp9M1aj6Sz06MgJhFz6fG
	IcEbVH+d0qUeakYuml6bebv8+LW3Nq3FngdDq7CWCRXlnR7pvW55mBlebC/Rx5JnP8GCIxgdyQZZq
	lwkur1qhpgO+80Op6FAK0sfTCaFeUdE4z1whAjbIyI0JyQxsCvNvU3umnPMwqMy7fOenNwmZ/wgKt
	gyssTiFtsVBQomACPglHfDE+zEjvaGmfo3hNxVL8QiFRHER1rw8l5qKhpdCOa6MpuMbuF8viWhe1s
	cd/HhpGmg6Tp7PJwNyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCvu-007w5P-1H;
	Sun, 27 Aug 2023 10:23:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCvs-007w4v-13
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:23:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1B4A6121A
	for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 10:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14649C433CA
	for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693131827;
	bh=QBRDRBbqDa/upH/bdJD6MbeIGMoQVvNZQPfx/+FLwSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z1yC37l2EwRehoSHQKHCxwLwBOgU60Sx/rKRr4ANQuKmX6fnF3IIhCxBgZotfIOV8
	 gqFDVsLH+Wg08k/S2KcJfn74C6YobycU2kVa0yTxR9B6i6n5sLTq32K9aglschmPtz
	 AhZ67TqvJinl57pKSu4a1KQTuiqDtCW5zHz0BrAk3fL7X23iducdYBnl8u/RQYKU2/
	 438CVePj0MdIJfXMY1M7/szaXISc0+cJ6T79zzLRPOVtJNhXv/v3gffLBSC9fWsRHT
	 sRH15xvjsqfsfeZHQsgh+VQ6CS7VWecOo2VHYdMVlp+ZT9q7gh/Pchaw0Q0vhfTzz6
	 GCVv+JPWQllEQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4ffa248263cso3649982e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 03:23:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YyhGeq78G9TDq7HIIrZA0CzTDsz6FoNjmfbx8BqVK7g4tDCXEvZ
	CIJeCwv0YGF4e5AgrkVHmQIwydioYgtWSjXzxAU=
X-Google-Smtp-Source: AGHT+IGP9dTtLzyu4x9TSrMzTh25JOmvSlF8WmRS6bAorcnux5lKJqBeTg77Om0k0ciGcnB6Sm5SKjYo9wpo3n31do8=
X-Received: by 2002:a05:6512:32cc:b0:4ff:7e1e:b4b4 with SMTP id
 f12-20020a05651232cc00b004ff7e1eb4b4mr18759432lfg.39.1693131825050; Sun, 27
 Aug 2023 03:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230827090644.1318-1-jszhang@kernel.org>
In-Reply-To: <20230827090644.1318-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 27 Aug 2023 06:23:33 -0400
X-Gmail-Original-Message-ID: <CAJF2gTSC18XVsH+X7sn4RC_j-pWNmO+4oWz0OWtQp=vKSPC2tQ@mail.gmail.com>
Message-ID: <CAJF2gTSC18XVsH+X7sn4RC_j-pWNmO+4oWz0OWtQp=vKSPC2tQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: update T-Head memory type definitions
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_032348_453222_F32358C7 
X-CRM114-Status: GOOD (  16.30  )
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

T24gU3VuLCBBdWcgMjcsIDIwMjMgYXQgNToxOOKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBVcGRhdGUgVC1IZWFkIG1lbW9yeSB0eXBlIGRlZmluaXRp
b25zIGFjY29yZGluZyB0byBDOTEwIGRvYyBbMV0KPiBGb3IgTkMgYW5kIElPLCBTSCBwcm9wZXJ0
eSBpc24ndCBjb25maWd1cmFibGUsIGhhcmRjb2RlZCBhcyBTSCwKPiBzbyBzZXQgU0ggZm9yIE5P
Q0FDSEUgYW5kIElPLgo+Cj4gQW5kIGFsc28gc2V0IGJpdFs2MV0oQnVmZmVyYWJsZSkgZm9yIE5P
Q0FDSEUgYWNjb3JkaW5nIHRvIHRoZQo+IHRhYmxlIDYuMSBpbiB0aGUgZG9jIFsxXS4KPgo+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkxMCBbMV0KPiBTaWduZWQt
b2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oIHwgMTQgKysrKysrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS02NC5oCj4gaW5kZXggN2E1MDk3MjAyZTE1Li45YTJjNzgwYTExZTkg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+IEBAIC0xMjYsMTQgKzEyNiwx
OCBAQCBlbnVtIG5hcG90X2NvbnRfb3JkZXIgewo+Cj4gIC8qCj4gICAqIFs2Mzo1OV0gVC1IZWFk
IE1lbW9yeSBUeXBlIGRlZmluaXRpb25zOgo+IC0gKgo+IC0gKiAwMDAwMCAtIE5DICAgV2Vha2x5
LW9yZGVyZWQsIE5vbi1jYWNoZWFibGUsIE5vbi1idWZmZXJhYmxlLCBOb24tc2hhcmVhYmxlLCBO
b24tdHJ1c3RhYmxlCj4gKyAqIGJpdFs2M10gU08gLSBTdHJvbmcgT3JkZXIKPiArICogYml0WzYy
XSBDIC0gQ2FjaGVhYmxlCj4gKyAqIGJpdFs2MV0gQiAtIEJ1ZmZlcmFibGUKPiArICogYml0WzYw
XSBTSCAtIFNoYXJlYWJsZQo+ICsgKiBiaXRbNTldIFNlYyAtIFRydXN0YWJsZQo+ICsgKiAwMDEx
MCAtIE5DICAgV2Vha2x5LW9yZGVyZWQsIE5vbi1jYWNoZWFibGUsIEJ1ZmZlcmFibGUsIFNoYXJl
YWJsZSwgTm9uLXRydXN0YWJsZQo+ICAgKiAwMTExMCAtIFBNQSAgV2Vha2x5LW9yZGVyZWQsIENh
Y2hlYWJsZSwgQnVmZmVyYWJsZSwgU2hhcmVhYmxlLCBOb24tdHJ1c3RhYmxlCj4gLSAqIDEwMDAw
IC0gSU8gICBTdHJvbmdseS1vcmRlcmVkLCBOb24tY2FjaGVhYmxlLCBOb24tYnVmZmVyYWJsZSwg
Tm9uLXNoYXJlYWJsZSwgTm9uLXRydXN0YWJsZQo+ICsgKiAxMDAxMCAtIElPICAgU3Ryb25nbHkt
b3JkZXJlZCwgTm9uLWNhY2hlYWJsZSwgTm9uLWJ1ZmZlcmFibGUsIFNoYXJlYWJsZSwgTm9uLXRy
dXN0YWJsZQo+ICAgKi8KPiAgI2RlZmluZSBfUEFHRV9QTUFfVEhFQUQgICAgICAgICAgICAgICAg
KCgxVUwgPDwgNjIpIHwgKDFVTCA8PCA2MSkgfCAoMVVMIDw8IDYwKSkKPiAtI2RlZmluZSBfUEFH
RV9OT0NBQ0hFX1RIRUFEICAgIDBVTAo+IC0jZGVmaW5lIF9QQUdFX0lPX1RIRUFEICAgICAgICAg
KDFVTCA8PCA2MykKPiArI2RlZmluZSBfUEFHRV9OT0NBQ0hFX1RIRUFEICAgICgoMVVMIDwgNjEp
IHwgKDFVTCA8PCA2MCkpCj4gKyNkZWZpbmUgX1BBR0VfSU9fVEhFQUQgICAgICAgICAoKDFVTCA8
PCA2MykgfCAoMVVMIDw8IDYwKSkKWWVzLCBTSCBkb2VzIG5vdCBhZmZlY3QgRDEsIGJ1dCBsZXQn
cyBrZWVwIHRoMTUyMCAmIGQxICYgc2cyMDQyIHdpdGgKdGhlIHNhbWUgZGVmaW5pdGlvbnMuCgpS
ZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+ICAjZGVmaW5lIF9QQUdF
X01UTUFTS19USEVBRCAgICAgKF9QQUdFX1BNQV9USEVBRCB8IF9QQUdFX0lPX1RIRUFEIHwgKDFV
TCA8PCA1OSkpCj4KPiAgc3RhdGljIGlubGluZSB1NjQgcmlzY3ZfcGFnZV9tdG1hc2sodm9pZCkK
PiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
