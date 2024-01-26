Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE27C47DDB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEDvfXBWj4xY5FTZ5cb3n39y2Hze7b5n3M2D5eguBug=; b=jVtyb6KxoGNfju
	RmpsuigqoTlXcwBxfQdPd1YehqM37hrXAf9SwswyKlAdxMdzUDuE1txurMus4/eoKhTdDp4M02kzG
	YZz/s9nPnF6ODfFr9KjXkmwcl2vnUM0lISwrIEw/K6S3m7SVE5gj3k33UO3o7zbzm3ovViav0IWTZ
	TlLPL6YX+osv0z2koEienfEZVVVSt3K1DSmjlPsESur2cuyF8E9v08PSl5CfU9tajA6uJZUATNDah
	4gq8aCPMDajeCNK/U9w3O93gwU/zY4uTx+NHPDtBuaQQbLeqrSMUtFA2TQwYukFyPTONIBERVOWd1
	TcvqrhpMBcmYxgkA9WAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQUx-00000004zgY-2Dla;
	Fri, 26 Jan 2024 18:00:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTQUt-00000004zed-0Y5L
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 18:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706292008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe5cAuD+r7l7BeM6JauqetJcjdzYv9yedKQx/BOkRTI=;
	b=jUxTOcF3K2YwizYYqvODWmoJ4lgpSMWMo1xxbaAaQO2JUirBLCK61s1DJCm+Z5E/xrRvW5
	AEPMouLl4ky7lYV68s2tPTESbrJBuLABM0sG5ZUl72AtNWUwk4mVfpuoYvz+ApXFWm3StB
	e11+esXzCpI63JCppARjGxmFv5IP8iI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-DsS0zOdTP3Kdkc9HbsS52Q-1; Fri, 26 Jan 2024 13:00:07 -0500
X-MC-Unique: DsS0zOdTP3Kdkc9HbsS52Q-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7d2d72f7965so197921241.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jan 2024 10:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706292006; x=1706896806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pe5cAuD+r7l7BeM6JauqetJcjdzYv9yedKQx/BOkRTI=;
        b=XEzIXpYhi1pfFNk8mfBkFI54H/mTI9avWlET9q268wEi+g5OKhGwktbkJXFgdg6L1/
         HzHwu2EPs8lMIBdN6iVT6pf3HvjkNIG7iiEIWSip/ghAgcRc4vf4f+0VjvB8I/XfEoTE
         HgCWzVo6d59RJBXSE69U+PNg9dLquCIWa+non4ZIWX0An4bwAPOlFWlj2qPkh8x+c0mj
         WT/PW6w0naUN34GFz+V0lfE6tFuc8eHve/PVLBQ7BFjZfl++f1I7z78Apg3daF/D3Xvd
         LPDMj0o0ZG5ICeSiDKgxVsisniYm4ZA2foU7dQlwfvIvUVxZr0Vlhg5iqQd9Lr3XUVnt
         d/DQ==
X-Gm-Message-State: AOJu0YxDIT/KfQrcutAXZaawoLtyXko34VfzgkJFGET3czwBgx2Q++Yi
	X2BuD7hFX4OVSrx2gywHQJdO0xuzN6KMMTgWy87DFaygYjb0r2akBXdw00pJn6cu/NVLrU4Vsi0
	JhuuGKHseHt21eP8C/t0vXeQ0hWEJvkfe2Waxru92ZSuJaj06fYB47wuv/0ZzdlXqrZx9cj9Tx+
	qbLp9JmeaCMAJQ3uxxFt+x3CyL40c1lfX5isET7INx
X-Received: by 2002:a05:6122:4126:b0:4bd:5f13:1293 with SMTP id ce38-20020a056122412600b004bd5f131293mr161894vkb.24.1706292006201;
        Fri, 26 Jan 2024 10:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEs8NNV8GXT8UDGCEqs4Xs1royxAcYx30+Iiu+w3V2jR05bmGyDpTGlnwfAOA3z4i569k8jc+jA020qI93c/F0=
X-Received: by 2002:a05:6122:4126:b0:4bd:5f13:1293 with SMTP id
 ce38-20020a056122412600b004bd5f131293mr161881vkb.24.1706292005872; Fri, 26
 Jan 2024 10:00:05 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2rbMeTwwHU_dHwUQi3AQB1qGNf=ByvzG11D99ZOJ3djA@mail.gmail.com>
In-Reply-To: <CAAhSdy2rbMeTwwHU_dHwUQi3AQB1qGNf=ByvzG11D99ZOJ3djA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Jan 2024 18:59:54 +0100
Message-ID: <CABgObfavYbr_L34jNTOf_GLKTZ0CjXyz_vkVO6jr6pQZ_pLWSA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.8 part #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_100011_271731_4DBD6AE4 
X-CRM114-Status: GOOD (  12.10  )
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

T24gRnJpLCBKYW4gMTksIDIwMjQgYXQgNjozM+KAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
YWRkaXRpb25hbCBLVk0gUklTQy1WIGNoYW5nZXMgZm9yIDYuODoKPiAxKSBaYmMgZXh0ZW5zaW9u
IHN1cHBvcnQgZm9yIEd1ZXN0L1ZNCj4gMikgU2NhbGFyIGNyeXB0byBleHRlbnNpb25zIHN1cHBv
cnQgZm9yIEd1ZXN0L1ZNCj4gMykgVmVjdG9yIGNyeXB0byBleHRlbnNpb25zIHN1cHBvcnQgZm9y
IEd1ZXN0L1ZNCj4gNCkgWmZoW21pbl0gZXh0ZW5zaW9ucyBzdXBwb3J0IGZvciBHdWVzdC9WTQo+
IDUpIFppaGludG50bCBleHRlbnNpb24gc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiA2KSBadmZoW21p
bl0gZXh0ZW5zaW9ucyBzdXBwb3J0IGZvciBHdWVzdC9WTQo+IDcpIFpmYSBleHRlbnNpb24gc3Vw
cG9ydCBmb3IgR3Vlc3QvVk0KClB1bGxlZCwgdGhhbmtzLgoKUGFvbG8KCj4gUGxlYXNlIHB1bGwu
Cj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgOWQxNjk0ZGM5MWNlN2I4MGJjOTZkNmQ4ZWFmMWExZWNhNjY4ZDg0NzoKPgo+ICAgTWVyZ2Ug
dGFnICdmb3ItNi44L2Jsb2NrLTIwMjQtMDEtMTgnIG9mIGdpdDovL2dpdC5rZXJuZWwuZGsvbGlu
dXgKPiAoMjAyNC0wMS0xOCAxODoyMjo0MCAtMDgwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xp
bnV4LmdpdCB0YWdzL2t2bS1yaXNjdi02LjgtMgo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDRkMGU4ZjlhMzYxYjNhMWY3YjY3NDE4YzUzNmIyNTgzMjNkZTczNGY6Cj4KPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpmYSBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRl
c3QKPiAoMjAyNC0wMS0xOSAwOToyMDoxOSArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3Yg
Y2hhbmdlcyBmb3IgNi44IHBhcnQgIzIKPgo+IC0gWmJjIGV4dGVuc2lvbiBzdXBwb3J0IGZvciBH
dWVzdC9WTQo+IC0gU2NhbGFyIGNyeXB0byBleHRlbnNpb25zIHN1cHBvcnQgZm9yIEd1ZXN0L1ZN
Cj4gLSBWZWN0b3IgY3J5cHRvIGV4dGVuc2lvbnMgc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiAtIFpm
aFttaW5dIGV4dGVuc2lvbnMgc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiAtIFppaGludG50bCBleHRl
bnNpb24gc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiAtIFp2ZmhbbWluXSBleHRlbnNpb25zIHN1cHBv
cnQgZm9yIEd1ZXN0L1ZNCj4gLSBaZmEgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIEd1ZXN0L1ZNCj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gQW51cCBQYXRlbCAoMTQpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBBbGxvdyBa
YmMgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czog
QWRkIFpiYyBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgICAgICBSSVNDLVY6IEtW
TTogQWxsb3cgc2NhbGFyIGNyeXB0byBleHRlbnNpb25zIGZvciBHdWVzdC9WTQo+ICAgICAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNjYWxlciBjcnlwdG8gZXh0ZW5zaW9ucyB0byBnZXQt
cmVnLWxpc3QgdGVzdAo+ICAgICAgIFJJU0MtVjogS1ZNOiBBbGxvdyB2ZWN0b3IgY3J5cHRvIGV4
dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQg
dmVjdG9yIGNyeXB0byBleHRlbnNpb25zIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4gICAgICAgUklT
Qy1WOiBLVk06IEFsbG93IFpmaFttaW5dIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICAgICAg
S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmZoW21pbl0gZXh0ZW5zaW9ucyB0byBnZXQtcmVn
LWxpc3QgdGVzdAo+ICAgICAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaaWhpbnRudGwgZXh0ZW5zaW9u
IGZvciBHdWVzdC9WTQo+ICAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFppaGludG50
bCBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgICAgICBSSVNDLVY6IEtWTTogQWxs
b3cgWnZmaFttaW5dIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICAgICAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBBZGQgWnZmaFttaW5dIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QK
PiAgICAgICBSSVNDLVY6IEtWTTogQWxsb3cgWmZhIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAg
ICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaZmEgZXh0ZW5zaW9uIHRvIGdldC1yZWct
bGlzdCB0ZXN0Cj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAg
ICAgICAgIHwgIDI3ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNTQgKysrKysrKysrKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDEwOCArKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDE4OSBpbnNlcnRpb25zKCspCj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
