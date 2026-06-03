Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D845CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYlo3zyVzI61XZZy4n0w6TMQWubCiAOk3AeokVRLkH0=; b=FeChIiX4hWv+5C
	vKTuvEym1hHMzp9O12RrajxGIWsf/ePeehhdnirC+aHjiHOsDGdu+Y4DzyX2gV4PNsXQ4fY82Hx8H
	RKMAlSX2Zh24ncoIHS+rS2afMeAB3CV8wCzhMX9I93VUTwBUGjbu4r2OD7SUwPusqCYkravCi8bMC
	e5rCOtXdB34D8y5GW26zOZjc6UT9PGhbVnfk+q8UDa+CUZFsQNMuKi9cApahukk51jGZbLubXgUiD
	HeuWY4NftWiRsPAQbNhJFNJVcpp1oU7Wj8cxAxpvlEWQn505cqqeSZhCplORtn/s2sIW4/BO5+qpS
	DwwWRxwapmQQh2yu8sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlOn-0000000F8Wm-1jnf;
	Wed, 03 Jun 2026 13:12:45 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlOl-0000000F8Vx-2LBu
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 13:12:44 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-517654b8e28so18989621cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 06:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780492362; cv=none;
        d=google.com; s=arc-20240605;
        b=Wv6Va7tlDl2CyWQoyznp5g6EIUNl4lpxd74NGhPNNzuz6S0RDsN20TNfwClWfslblH
         KenzoK2i4cNrUa+hnPGnWfGLvd/Cls8hG1bxvzAxWIutG+65AnNitFLe3rePRDyFbSTG
         q9q5U8bmOOrGMRi1mCFq1Tkx8GuXJkPqOunnIev57KwgBAYWWSoPWNo9WrYGtEey7Xk0
         XozE7MGFZ2ATP6w5qehBkiJzbqIRp+RtSo9VOqhzTrigqHUkuu1cxUtLZck0PY/BlsMF
         PpMBsLGDkCni9prI2eqlFXDaVER/H+HmlFUOmmYJWA1bhdokQYYqy824aGiVzn0oM9MT
         LLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wPKsFlEiyLRyhzwx6niYPIzW14lmqUQ9SsuDRFLQ+5U=;
        fh=pQ8k6z70VOMDwp/MSr9Y6Q3dF7qPElJPLNjQyYaMkMA=;
        b=Lh44wxjDp8oReUexypbdJZaJaActWjKRnzt1i5ro67XqIMiwgEHwNn/uuGYoNq2+KZ
         jMShocBnFqQ67z3VVbbqACI+NDEjkBEi1kruASGUWCZRrTtxeWBO+afTEjHRZjXtISIj
         tUw2Y5c3g0jFLGCgDum+gB9y50bFk1VSACFYKWqNwWuzODQGeYt+29tXwpFOWC9aYCnL
         474Mf0XLdblZ3YYN1Eab5mn3x2HK5wQfbnMEAwx+6P9QBKtCXtjB3cO2h2bjlypaPrN2
         D+GmF/P7dWJ+/MR5xXVIuJ7u6YGJ+zIKQe1j496z8uy4Da92I6iSJqooNR/+in6bfZpp
         TWEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780492362; x=1781097162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPKsFlEiyLRyhzwx6niYPIzW14lmqUQ9SsuDRFLQ+5U=;
        b=s2Mw1bBklhKIZjiXcdUxGzFAJqo8kdHowN351gFdx90H5kvCRTJiHlPeg1SzCqIeU9
         MwKCa1Bkg5avrQa0IJjftfcss+kZoca2CTiPme3c6D+ehnVX0B6o6V0/Ar5+JWFOT+qL
         h6IZC38taKhff5GHi8oFPcC0394JdP/olbhs6dT7isep7lNbhPRnbX/NBgxEnW+yTITV
         nQrog++KsZhtA6Fi1D+29TTiJNqnP8oaBtfiMbULM8hOPRusbyK3W6b49joQOF0eZwLY
         bgrn1vFlzCrvvkG/sd2RB6zgB5nb5imhJLPwFiaNphlThY2SQVUrHCTtVG+ijORY/aDz
         sgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492362; x=1781097162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wPKsFlEiyLRyhzwx6niYPIzW14lmqUQ9SsuDRFLQ+5U=;
        b=CNNTiOnf7phlzwULUUAB8Wx67/fGrfNPZX+zOEieKTZMK7Ct6b5wwGZEFV+NbzjvEg
         aF7fzC66F+Q+Pmgu9wsJRdvUj+yYsKIhjm6Ao71cU/8qr2tj+ZeW2C0er1XgQSLcKX/z
         +xZ/xPuSP1yVUHc4sne99VykUQXmaHXxNI/cr5pSNQ/71xhfID8a9PSLlyHPLuT3yxH4
         dLS6nyJ0lgCsysOGITjuSLOZcfwh3GCUi+bPfRhd4xfSPY+UP3xWjwaBmp2vOJzyljJT
         /NA5C0k3uP+GR9mIUz3jrosoDrcNmLFA/93kvOUuLd1TpxhLaLftlqTHgIrL51frxlFm
         3eyA==
X-Forwarded-Encrypted: i=1; AFNElJ+LxOp5c1NDMhdg/5SDkzvC4VWiDYbLtM2bS6S4PGOWoQXBhUWZN5bs+mkmoZY5ccvoTl5WrQ+BDyS9EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRfYnxv+50qySdCymoRlH3o5ie24Rjrs2oOh0b8mUOOXz8tgIn
	bF6gWZB4wPzYGl0zuibY1qT4gJ8gQlDsLjeue6RHY1SVO9YtTIcyXgEDUXY60NnEsoCyrTjfPRk
	dgoWS3s3lozNMDOXs54E+/MQCNwhknGaCqeD/o/xbRg==
X-Gm-Gg: Acq92OGLHjlZk7BeLvY19SVxYmr5rxRnZM3/vExadOx5+NimREctqhzDVeplFOFqXNZ
	gAZ1VQqSB12rKeZwHfhYussBI28awouq8lHs5XJ15WmARaMgqIQ8CBw0MEwmTPdMvah15upyvvv
	QLS4BqJOfijbEEGHQCO+qqDh61Xe/KQ6tQy27v4YYPCD69rOLwPcvEMlXRo1LLx/dnPAL6MSd5o
	FvBLAdQ2FkeCDcaw8LffOWHP52RbId/4TfK9q9EtQEb4eFq4o/IaVWh4ItDPjHm6GZmb+WuyYMu
	3e1RI29D6snxt/ChtdzKncSTGx9C5wKv79PLVQ+/v/wJ/K0kw5T3fzpPHkzrb44OKWU7XjZFH9Z
	om5RZQ8PdctLgbMgAZ7INrcnrO4MTlKZVPu+iTQ==
X-Received: by 2002:a05:622a:151:b0:517:75d8:b960 with SMTP id
 d75a77b69052e-51778738b2cmr47091471cf.43.1780492362178; Wed, 03 Jun 2026
 06:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260517153427.94889-1-tjytimi@163.com>
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 18:42:30 +0530
X-Gm-Features: AVHnY4KdS26v-u7MwMB2QczqM1orB0trjZ3Tze-rPeQYj-S64aX-ZARYgiMz9Fg
Message-ID: <CAAhSdy3YV9Ny4YA+26SzY_yoFrAB0GWGZQBeg0X90H9Q_GSuHA@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: riscv: Speed up dirty logging write faults
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061243_816977_5D7F505B 
X-CRM114-Status: GOOD (  17.82  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgOTowNeKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBzcGVlZHMgdXAgdGhlIGNvbW1vbiBkaXJ0eSBs
b2dnaW5nIHdyaXRlIGZhdWx0IHBhdGggZm9yCj4gUklTQy1WIEtWTS4KPgo+IFdoZW4gZGlydHkg
bG9nZ2luZyBpcyBlbmFibGVkLCBndWVzdCB3cml0ZXMgdG8gd3JpdGUtcHJvdGVjdGVkIEctc3Rh
Z2UKPiA0SyBsZWF2ZXMgY3VycmVudGx5IGdvIHRocm91Z2ggdGhlIGZ1bGwgZmF1bHQgcGF0aCBh
bmQgdGFrZSBtbXVfbG9jayBmb3IKPiB3cml0ZS4gIFRoYXQgaXMgZXhwZW5zaXZlIG9uY2UgdGhl
IGxlYWYgYWxyZWFkeSBleGlzdHMgYW5kCj4gb25seSBuZWVkcyBpdHMgcGVybWlzc2lvbiBhbmQg
ZGlydHkgc3RhdGUgdXBkYXRlZC4KPgo+IFRoZSBzZXJpZXMgZmlyc3QgbWFrZXMgdGhlIGV4aXN0
aW5nIE1NVSBub3RpZmllciBsb2NraW5nIGNvbnRyYWN0Cj4gZXhwbGljaXQsIHN3aXRjaGVzIFJJ
U0MtViBLVk0gdG8gS1ZNJ3Mgcndsb2NrIGZvcm0gb2YgbW11X2xvY2ssIGFkZHMgYW4KPiBhdG9t
aWMgRy1zdGFnZSBQVEUgdXBkYXRlIGhlbHBlciwgdXNlcyBpdCBmb3IgZXhpc3RpbmcgcGVybWlz
c2lvbgo+IHVwZGF0ZXMsIGFuZCBmaW5hbGx5IGhhbmRsZXMgZGlydHkgbG9nZ2luZyB3cml0ZSBm
YXVsdHMgdW5kZXIgdGhlIHJlYWQKPiBzaWRlIG9mIG1tdV9sb2NrIHdoZW4gYSA0SyBHLXN0YWdl
IGxlYWYgaXMgYWxyZWFkeSBwcmVzZW50Lgo+Cj4gVGhlIGxvY2tpbmcgYW5kIGNvbmN1cnJlbmN5
IG1vZGVsIGZvbGxvd3MgZXhpc3RpbmcgS1ZNIHBhdHRlcm5zIGZyb20geDg2Cj4gYW5kIGFybTY0
OiB1c2UgYW4gcndsb2NrIG1tdV9sb2NrLCBrZWVwIHN0cnVjdHVyYWwgcGFnZS10YWJsZSBjaGFu
Z2VzIG9uCj4gdGhlIHdyaXRlIHNpZGUsIGFuZCB1c2UgYXRvbWljIFBURSB1cGRhdGVzIGZvciBw
ZXJtaXNzaW9uLW9ubHkgY2hhbmdlcwo+IHRoYXQgbWF5IHJhY2Ugd2l0aCBhbm90aGVyIHZDUFUu
Cj4KPiBUaGUgZmFzdCBwYXRoIG1hcmtzIHRoZSBtZW1zbG90IHBhZ2UgZGlydHkgYmVmb3JlIG1h
a2luZyB0aGUgUFRFIHdyaXRhYmxlCj4gYWdhaW4uICBJdCBhbHNvIHNldHMgdGhlIFBURSBkaXJ0
eSBiaXQsIHNvIHN5c3RlbXMgdGhhdCB0cmFwIHdoZW4gRCBpcwo+IGNsZWFyIGRvIG5vdCBmYWxs
IGJhY2sgdG8gdGhlIHNsb3cgcGF0aCBmb3IgYSB3cml0YWJsZS1idXQtY2xlYW4gUFRFLgo+Cj4g
UGVyZm9ybWFuY2Ugd2FzIG1lYXN1cmVkIHdpdGggS1ZNIHNlbGZ0ZXN0cyBpbnNpZGUgYSBRRU1V
IFJJU0MtViBob3N0Lgo+Cj4gICBkaXJ0eV9sb2dfcGVyZl90ZXN0IC1tIDE5IC12IDQgLWIgMUcg
LWkgMwo+ICAgICBiYXNlIGRpcnR5IG1lbW9yeSBhdmcsIGl0ZXJhdGlvbnMgMi0zOiA1My4yNjI0
OTNzCj4gICAgIHBhdGNoIDEtNCBkaXJ0eSBtZW1vcnkgYXZnLCBpdGVyYXRpb25zIDItMzogNTIu
NzM1Njc1cwo+ICAgICBwYXRjaCAxLTUgZGlydHkgbWVtb3J5IGF2ZywgaXRlcmF0aW9ucyAyLTM6
IDI2LjQyMjk2NHMKPiAgICAgcGF0Y2ggMS01IGltcHJvdmVtZW50IG92ZXIgYmFzZTogNTAuNCUK
Pgo+ICAgZGlydHlfbG9nX3BlcmZfdGVzdCAtbSAxOSAtdiA0IC1iIDY0TSAtaSAzCj4gICAgIGJh
c2UgZGlydHkgbWVtb3J5IGF2ZywgaXRlcmF0aW9ucyAyLTM6IDMuMjAzMTcwcwo+ICAgICBwYXRj
aCAxLTUgZGlydHkgbWVtb3J5IGF2ZywgaXRlcmF0aW9ucyAyLTM6IDEuNzYyNDUycwo+ICAgICBp
bXByb3ZlbWVudDogNDUuMCUKPgo+IFBhdGNoIDEtNCBhcmUgcHJlcmVxdWlzaXRlcyBmb3IgdGhl
IHJlYWQtc2lkZSBmYXN0IHBhdGguIFRoZQo+IG1haW4gc3BlZWR1cCBjb21lcyBmcm9tIHBhdGNo
IDUgYXZvaWRpbmcgdGhlIGZ1bGwgZmF1bHQgcGF0aAo+IGZvciBkaXJ0eSBsb2dnaW5nIHdyaXRl
IGZhdWx0cy4KPgo+IEppbnl1IFRhbmcgKDUpOgo+ICAgS1ZNOiByaXNjdjogUmVseSBvbiBjb21t
b24gTU1VIG5vdGlmaWVyIGxvY2tpbmcKPiAgIEtWTTogcmlzY3Y6IFVzZSBhbiByd2xvY2sgZm9y
IG1tdV9sb2NrCj4gICBLVk06IHJpc2N2OiBBZGQgYSBHLXN0YWdlIFBURSBjbXB4Y2hnIGhlbHBl
cgo+ICAgS1ZNOiByaXNjdjogVXBkYXRlIEctc3RhZ2UgUFRFIHBlcm1pc3Npb25zIGF0b21pY2Fs
bHkKPiAgIEtWTTogcmlzY3Y6IEZhc3QtcGF0aCBkaXJ0eSBsb2dnaW5nIHdyaXRlIGZhdWx0cwo+
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwgICA0ICsrCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgIHwgICAyICsKPiAgYXJjaC9yaXNjdi9rdm0v
Z3N0YWdlLmMgICAgICAgICAgICAgfCAgMzUgKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9t
bXUuYyAgICAgICAgICAgICAgICB8IDEwNSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4g
IDQgZmlsZXMgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Cj4g
LS0KPiAyLjQzLjAKPgoKTEdUTS4gSSB0cmllZCB0aGlzIGF0IG15IGVuZCBhcyB3ZWxsLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBz
ZXJpZXMgZm9yIExpbnV4LTcuMgoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
