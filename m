Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC455C83F35
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G65jxUBoaHA1kgbDywrrlNdUB8Vzd1oX5zyNKu47Moo=; b=xr+cuiwiEpcgHR
	RLiSJh6y/h0zk0gPOVR0/TN0/va3xfyRWtq6CraA3sZrD7rVFZcZvNQ1TcGw3Jy+v3Tkg5tQ4qnaB
	WJywi+8TApdYfN3rPkrBlAoQ5zugwIMTKWM7OttfXjAjE5lW89SLrubZsyzGuFWxI4k+zFvE2jHzi
	Tmo2AxSZqehHdCB0fHTbTdhRPwO9fVsm6Gdj6Q4UF3l9VgpoW8rsUnN3Ggms3kYIRQCPqLSSSLg+R
	vRYLZrslcAmFgkqSBZMakwjLgC3Y7mEnjmrxuAZXw4DDvYwmEz4Jz+gbOjXiht/WxHxTqr03rdnXE
	l5Q22Xk9xnpc32t9sYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblTY-00Fda0-2f;
	Thu, 31 Aug 2023 17:29:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblTW-00FdZ1-2U
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693502934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfsQm+G3Enn5fgXR19EACJ3eKvpvvy2mdlpWv8WijKU=;
	b=fDjFl3F6K93SH7GmirF/jw0f+JlAKoHz7ABFUdFB0/7MNU5CkPWnx9dj28B22/duqFEwD5
	Se0u6Js4Eu+cTad4KIZEkreRWOmGtrOlzTZTj5mHl3R2T2yIcEr69c6eRaOyCwHUot0HLB
	e67h/7ksfxQWpbgVjA46XOpk4WxB1bo=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-E801aU5WPL29diYg4f4Iwg-1; Thu, 31 Aug 2023 13:28:53 -0400
X-MC-Unique: E801aU5WPL29diYg4f4Iwg-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7a28090eb26so453379241.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693502933; x=1694107733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfsQm+G3Enn5fgXR19EACJ3eKvpvvy2mdlpWv8WijKU=;
        b=H3JpWtZ3QCdxsAq+GOs36RvoA3nqJoHUpUit6iwLmZ4Dv1XL1cBYa0yanEB+xu7Qf/
         DxCQK+xT3tsERniQAaDS5BnrtkBW3cq6x0VXLOZK3/avPY8jR7rvPeGl4zM8BysyZgzi
         HvwFG1YAMzPDaOnkay8Y4WicZH2g/u45Ek4SGrs/k4oX56UY0wwcM+NPqQH6OOQ1pxFZ
         lKuawvpY+wqNY9PTXrIYH2g57Qml9zyekmMCQO60MCQItHlMxglzJTeOXiEGDr0kEglz
         /eelBs343H1nD6EK4WfoY7eVGR6mmckjfGksX90+riRcAxlKyCSGvwY3Q/ld/8MdH5Pg
         z/BQ==
X-Gm-Message-State: AOJu0YwkuB8SzEBZIxQg0coZsgtxUoz6c88zZ+sT6uyh730lMLqdYwIO
	ZEeRwF4LbP+PFY63FOBm416oYNOVDtVkm/efpxOZzzyFEpo0daH9ATaovGtWf04n09iRtH0y1JS
	OmeoA0fARyBFamf+FiRDtlzcgLtegHr4IuU+ycW1c8Rhg
X-Received: by 2002:a67:ec44:0:b0:44e:9614:39bf with SMTP id z4-20020a67ec44000000b0044e961439bfmr293099vso.6.1693502932777;
        Thu, 31 Aug 2023 10:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHipeW3lIgNcSTdWetBcjopqTTEHmLXiLOy2n1+8qaMIBfRzWUt+YgG4yzmubx2qtJ9GCPV0ZoYBRSD1sdgwW8=
X-Received: by 2002:a67:ec44:0:b0:44e:9614:39bf with SMTP id
 z4-20020a67ec44000000b0044e961439bfmr293075vso.6.1693502932535; Thu, 31 Aug
 2023 10:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
In-Reply-To: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 31 Aug 2023 19:28:41 +0200
Message-ID: <CABgObfbHSkoavDYqKhhotn0cOFr+x2QRYD4NN9v_55tK4nxQoQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.6
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_102858_882587_1731B00E 
X-CRM114-Status: GOOD (  13.50  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgNzoyNeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjY6Cj4gMSkgWmJhLCBaYnMsIFppY250ciwgWmljc3Is
IFppZmVuY2VpLCBhbmQgWmlocG0gc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiAyKSBBZGRlZCBPTkVf
UkVHIGludGVyZmFjZSBmb3IgU0FUUCBtb2RlCj4gMykgQWRkZWQgT05FX1JFRyBpbnRlcmZhY2Ug
dG8gZW5hYmxlL2Rpc2FibGUgbXVsdGlwbGUgSVNBIGV4dGVuc2lvbnMKPiA0KSBJbXByb3ZlZCBl
cnJvciBjb2RlcyByZXR1cm5lZCBieSBPTkVfUkVHIGludGVyZmFjZXMKPiA1KSBBZGRlZCBLVk1f
R0VUX1JFR19MSVNUIGlvY3RsKCkgaW1wbGVtZW50YXRpb24gZm9yIEtWTSBSSVNDLVYKPiA2KSBB
ZGRlZCBnZXQtcmVnLWxpc3Qgc2VsZnRlc3QgZm9yIEtWTSBSSVNDLVYKPgo+IFBsZWFzZSBwdWxs
Lgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDUyYTkzZDM5YjE3ZGM3ZWI5OGI2YWEzZWRiOTM5NDMyNDhlMDNiMmY6Cj4KPiAgIExpbnV4
IDYuNS1yYzUgKDIwMjMtMDgtMDYgMTU6MDc6NTEgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNj
di9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtNi42LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byA0NzcwNjkzOThlZDZlMDQ5OGVlMjQzZTc5OWNiNmM2OGJhZjZjY2I4Ogo+Cj4g
ICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdCAoMjAyMy0wOC0w
OSAxMjoxNToyNyArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgY2hhbmdlcyBmb3IgNi42
Cj4KPiAtIFpiYSwgWmJzLCBaaWNudHIsIFppY3NyLCBaaWZlbmNlaSwgYW5kIFppaHBtIHN1cHBv
cnQgZm9yIEd1ZXN0L1ZNCj4gLSBBZGRlZCBPTkVfUkVHIGludGVyZmFjZSBmb3IgU0FUUCBtb2Rl
Cj4gLSBBZGRlZCBPTkVfUkVHIGludGVyZmFjZSB0byBlbmFibGUvZGlzYWJsZSBtdWx0aXBsZSBJ
U0EgZXh0ZW5zaW9ucwo+IC0gSW1wcm92ZWQgZXJyb3IgY29kZXMgcmV0dXJuZWQgYnkgT05FX1JF
RyBpbnRlcmZhY2VzCj4gLSBBZGRlZCBLVk1fR0VUX1JFR19MSVNUIGlvY3RsKCkgaW1wbGVtZW50
YXRpb24gZm9yIEtWTSBSSVNDLVYKPiAtIEFkZGVkIGdldC1yZWctbGlzdCBzZWxmdGVzdCBmb3Ig
S1ZNIFJJU0MtVgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFuZHJldyBKb25lcyAoOSk6Cj4gICAgICAgUklTQy1W
OiBLVk06IEltcHJvdmUgdmVjdG9yIHNhdmUvcmVzdG9yZSBlcnJvcnMKPiAgICAgICBSSVNDLVY6
IEtWTTogSW1wcm92ZSB2ZWN0b3Igc2F2ZS9yZXN0b3JlIGZ1bmN0aW9ucwo+ICAgICAgIEtWTTog
YXJtNjQ6IHNlbGZ0ZXN0czogUmVwbGFjZSBzdHJfd2l0aF9pbmRleCB3aXRoIHN0cmR1cF9wcmlu
dGYKPiAgICAgICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IERyb3AgU1ZFIGNhcCBjaGVjayBpbiBw
cmludF9yZWcKPiAgICAgICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJlbW92ZSBwcmludF9yZWcn
cyBkZXBlbmRlbmN5IG9uIHZjcHVfY29uZmlnCj4gICAgICAgS1ZNOiBhcm02NDogc2VsZnRlc3Rz
OiBSZW5hbWUgdmNwdV9jb25maWcgYW5kIGFkZCB0byBrdm1fdXRpbC5oCj4gICAgICAgS1ZNOiBh
cm02NDogc2VsZnRlc3RzOiBEZWxldGUgY29yZV9yZWdfZml4dXAKPiAgICAgICBLVk06IGFybTY0
OiBzZWxmdGVzdHM6IFNwbGl0IGdldC1yZWctbGlzdCB0ZXN0IGNvZGUKPiAgICAgICBLVk06IGFy
bTY0OiBzZWxmdGVzdHM6IEZpbmlzaCBnZW5lcmFsaXppbmcgZ2V0LXJlZy1saXN0CgpQdWxsZWQs
IHRoYW5rcywgYnV0IEknbGwgZ2l2ZSBhIGNsb3NlciBsb29rIHRvIHRoZXNlIHBhdGNoZXMgYWZ0
ZXIKa2lja2luZyB0aGUgbG9uZy1ydW5uaW5nIHRlc3RzLiBJdCB3b3VsZCBoYXZlIGJlZW4gbmlj
ZXIgdG8gZ2V0IGFuCkFja2VkLWJ5IGZyb20gZWl0aGVyIG1lIG9yIE1hcmMgb3IgT2xpdmVyLCBi
dXQgbm8gaHVnZSBkZWFsLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
