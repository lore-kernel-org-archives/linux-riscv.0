Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5FAC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pey0GNlloIAzeVyVKGu+QUPNhXTKMcS3sBsG8UG9t1k=; b=vY/uuGaC107VSv
	hmBdjw6ftE8MdQrxRG1aTSf2ro77DY+fWWCby1jDLDyQi1220R56Zj7aQh64ZjHGeDdshrFnUDcnU
	p78pviF25jTTPYRC/aVDJyd4Lmk7sUNy1GBJch7Ch+WBTb2kckUn54atqVgQPwK6h+xFN7d/3dPCI
	zycKyrNe1/ylWYeW/BTscPDb1Hru4EKpUjKaN4P6AnXpnsegJeiI7NBHZPnr0OwVOgS15u8YCkbpM
	QdcDsl0RVIssEEurUlx47lGknRGcs25QHdiyTbnPxEHvGgkibB6qy/BMmDZBtB3bqI89fsvfAbqLG
	xhsoJjrJA3s0fr/XWsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqcg-00Ax2p-1e;
	Fri, 21 Apr 2023 13:16:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqcc-00Ax19-0n
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 13:16:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94f6c285d22so271422766b.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1682082974; x=1684674974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XMxjEm4UvnsoHzLAHBkPkEwF3Gt/9CwX8y4iqsN5RM=;
        b=jG+FvIrl+PnQY2V/+/flKf7p6cz0IwKUMHve/yF8z2kv2EiqetKGPGvzn9z3sWYh+Y
         iQs/X0Do1qDOY4E0w4wH+jWgK9owtfi4Aer5sxYo/dPb1NYkKAMM6eaEpUBHFiF+AUsS
         RacrXeGWmbXtI/V0+88BPz5aCwqfR6FVenFm2aRwGDmlh7vbrkUhhLssYsf6ouuG+wNS
         73L4fBzQuRIG6JViXq93O7EXoP7uCN/RISzWwBiyLOquRiFH2rhk6+aRyji4ymw34Qk6
         JoNdfQqG+p8fcBU1NUvsk1TSgJteVfiNMgY/cntm5cH9Tc3Lk+OWgEqXuXhRcBui/PJc
         qcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682082974; x=1684674974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XMxjEm4UvnsoHzLAHBkPkEwF3Gt/9CwX8y4iqsN5RM=;
        b=bdJmi9dIWUWfuvT1Yn1tRHis2aB5RfqUVfjMaceJdkdaHQa9oEEOspv3u9Wvwb3aYQ
         LHvR7IwsjDvaQwHpvYQRBzHIacqxRWRQ/cgStQBS2W9NB4NOdQ4Os+q6B0p9Y8rT990d
         6pQhXcNNAljtE778aSEkc4NkHuSey/DYHbopu8XY7uYPMDP07SZ7qZ4MqX2xq2wFe8iQ
         kVne1kq11CF3tK4kgFHhcre/sDoOCxFWAHvY+/xseR7iviUg65AtCIA3ei4/wWNfZ2E1
         fRPn2sYfwnRP150OuG1Tra0ltYPvalv8XK5tEMoODu5Zxo8nJ2zjNPm72YBmnxqxBifH
         9SIA==
X-Gm-Message-State: AAQBX9dutdhABaEWcwPfQ+wxnb4Yzxo08n11CrjSdcZCrm2LJj1nuj/8
	LspYGfaNRq2j85I9A7hdEHgKLScBc3O+Ay038vqGZg==
X-Google-Smtp-Source: AKy350YpLHxIgjQxSyvTw/OkPmB9KWS2SVXe5O8dmW8okji2xcd0yrVO+8HrGFVCIpoLQvcaAPH1ap/uCtVjJhCk4Xk=
X-Received: by 2002:a17:906:c416:b0:953:37eb:7727 with SMTP id
 u22-20020a170906c41600b0095337eb7727mr2260294ejz.43.1682082974310; Fri, 21
 Apr 2023 06:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Apr 2023 18:46:02 +0530
Message-ID: <CAAhSdy3V-BMzuCLcvZ9YVLVF+0o3D+6rMrSGJ3-BDBxxpBx1ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] RISC-V KVM virtualize AIA CSRs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_061618_287187_297541EC 
X-CRM114-Status: GOOD (  17.61  )
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCA5OjA14oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIFJJU0MtViBBSUEgc3BlY2lmaWNhdGlvbiBpcyBu
b3cgZnJvemVuIGFzLXBlciB0aGUgUklTQy1WIGludGVybmF0aW9uYWwKPiBwcm9jZXNzLiBUaGUg
bGF0ZXN0IGZyb3plbiBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1haWEvcmVsZWFzZXMvZG93bmxvYWQvMS4wLVJDMy9yaXNjdi1p
bnRlcnJ1cHRzLTEuMC1SQzMucGRmCj4KPiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIGZpcnN0IHBo
YXNlIG9mIEFJQSB2aXJ0dWFsaXphdGlvbiB3aGljaCB0YXJnZXRzCj4gdmlydHVhbGl6aW5nIEFJ
QSBDU1JzLiBUaGlzIGFsc28gcHJvdmlkZXMgYSBmb3VuZGF0aW9uIGZvciB0aGUgc2Vjb25kCj4g
cGhhc2Ugb2YgQUlBIHZpcnR1YWxpemF0aW9uIHdoaWNoIHdpbGwgdGFyZ2V0IGluLWtlcm5lbCBB
SUEgaXJxY2hpcAo+IChpbmNsdWRpbmcgYm90aCBJTVNJQyBhbmQgQVBMSUMpLgo+Cj4gVGhlIGZp
cnN0IHR3byBwYXRjaGVzIGFyZSBzaGFyZWQgd2l0aCB0aGUgIkxpbnV4IFJJU0MtViBBSUEgU3Vw
cG9ydCIKPiBzZXJpZXMgd2hpY2ggYWRkcyBBSUEgZHJpdmVyIHN1cHBvcnQuCj4KPiBUbyB0ZXN0
IHRoaXMgc2VyaWVzLCB1c2UgQUlBIGRyaXZlcnMgZnJvbSB0aGUgIkxpbnV4IFJJU0MtViBBSUEg
U3VwcG9ydCIKPiBzZXJpZXMgYW5kIHVzZSBLVk1UT09MIGZyb20gdGhlIHJpc2N2X2FpYV92MSBi
cmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwva3ZtdG9vbC5naXQKPgo+IFRo
ZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2t2bV9haWFfY3NyX3Y0
IGJyYW5jaCBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IEJh
c2VkLW9uOiAyMDIzMDQwMTExMjczMC4yMTA1MjQwLTEtYXBhdGVsQHZlbnRhbmFtaWNyby5jb20K
PiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDQwMTExMjczMC4yMTA1MjQwLTEt
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20vKQo+Cj4gQmFzZWQtb246IDIwMjMwNDAzMTIxNTI3LjIy
ODY0ODktMS1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbQo+IChodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjMwNDAzMTIxNTI3LjIyODY0ODktMS1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbS8p
Cj4KPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ICAtIFNwbGl0IFBBVENINyBpbnRvIHR3byBwYXRjaGVz
Cj4gIC0gQWRkcmVzc2VkIGNvbW1lbnRzIGluIFBBVENINywgUEFUQ0g4IGFuZCBQQVRDSDkKPgo+
IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gUmViYXNlZCBvbiBMaW51eC02LjMtcmM1Cj4gIC0gU3Bs
aXQgUEFUQ0g1IGludG8gdHdvIHNlcGFyYXRlIHBhdGNoZXMgYXMgc3VnZ2VzdGVkIGJ5IEF0aXNo
Lgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBBZGRyZXNzZWQgZnJvbSBEcmV3IGFuZCBDb25v
ciBpbiBQQVRDSDEKPiAgLSBVc2UgYWxwaGFiZXRpY2FsIG9yZGVyaW5nIGZvciBTTUFJQSBhbmQg
U1NBSUEgZW51bSBpbiBQQVRDSDIKPiAgLSBVc2UgR0VOTUFTSygpIGluIFBBVENIMwo+Cj4gQW51
cCBQYXRlbCAoOSk6Cj4gICBSSVNDLVY6IEFkZCBBSUEgcmVsYXRlZCBDU1IgZGVmaW5lcwo+ICAg
UklTQy1WOiBEZXRlY3QgQUlBIENTUnMgZnJvbSBJU0Egc3RyaW5nCj4gICBSSVNDLVY6IEtWTTog
RHJvcCB0aGUgX01BU0sgc3VmZml4IGZyb20gaGdhdHAuVk1JRCBtYXNrIGRlZmluZXMKPiAgIFJJ
U0MtVjogS1ZNOiBJbml0aWFsIHNrZWxldGFsIHN1cHBvcnQgZm9yIEFJQQo+ICAgUklTQy1WOiBL
Vk06IEltcGxlbWVudCBzdWJ0eXBlIGZvciBDU1IgT05FX1JFRyBpbnRlcmZhY2UKPiAgIFJJU0Mt
VjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgZm9yIEFJQSBDU1JzCj4gICBSSVNDLVY6IEtW
TTogVXNlIGJpdG1hcCBmb3IgaXJxc19wZW5kaW5nIGFuZCBpcnFzX3BlbmRpbmdfbWFzawo+ICAg
UklTQy1WOiBLVk06IFZpcnR1YWxpemUgcGVyLUhBUlQgQUlBIENTUnMKPiAgIFJJU0MtVjogS1ZN
OiBJbXBsZW1lbnQgZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0IGxpbmUgbWFuYWdlbWVudAoKSSBo
YXZlIHF1ZXVlZCBQQVRDSDEgdG8gUEFUQ0g4IGZvciBMaW51eC02LjQKClRoZSBQQVRDSDkgZGVw
ZW5kcyBvbiAiUklTQy1WIElQSSBJbXByb3ZlbWVudHMiIHNlcmllcwpzbyB0aGlzIHBhdGNoIHdp
bGwgYmUgc2VudCBhcyBzZXBhcmF0ZSBQUiBvciBkaWZmZXJlZCB0byBMaW51eC02LjUKClJlZ2Fy
ZHMsCkFudXAKCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgIHwgMTA3ICsr
KystCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICB8ICAgOCArCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICB8IDEzNyArKysrKysrCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxNCArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggfCAgMTggKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAg
IHwgICAyICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgIHwgICAyICsKPiAg
YXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9r
dm0vYWlhLmMgICAgICAgICAgICAgIHwgNjI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgfCAgMjMgKy0KPiAgYXJjaC9y
aXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgIHwgICAzICstCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICB8IDE5MCArKysrKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9p
bnNuLmMgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAg
IHwgICA0ICsKPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5jICAgICAgICAgICAgIHwgICA0ICstCj4g
IDE1IGZpbGVzIGNoYW5nZWQsIDEwODMgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vYWlhLmMKPgo+IC0tCj4gMi4zNC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
