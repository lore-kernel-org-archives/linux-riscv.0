Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B404EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1UifjZAmS9cUG6hZvtLxepAmWuUqnEj2o/kQ3ImtNM=; b=YDGusht5sQMfwo
	ARDefSlvbVET8nWBU+9EIASRKEoKCyTasAcJbgzuLYjDH3VO2WFNN6zp63dbJHgpunbwvi9yfVadM
	gxAfC9ylj39QNEm8p5uN5Htl2bTLlyPiZQ0IT/dzkewq1sw0iQHmdmYjKUdahVuCtlxsE/UO/bBwW
	toLHKijSVGnUfdQM2gaZcV3yQ0WvdP7YXXaxpILIC9KbtessedKB6cEGP+6xilkcVCrghkPLDCQWH
	9koljrVYU7bOb+cj0Tb35/7+AGO7PEyFBLsdwnxJ/tkLAScFaROUmz1hGpqjB7qIvG1E8wTuXPpXB
	WkCSE3tKbUL4EtV2Cctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYOy-005jUY-19;
	Sat, 01 Jul 2023 11:04:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYOu-005jSy-0X
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 11:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688209462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usj2c3ViGBK68/uJN1vOeJSqiKiuoQd+nTxCRZLq9fA=;
	b=f3PqKK0JHG7xsCA5byFn011a8jPok/f0ItOf52PhGU/Vh3n/6eHgrbXFzJmhocDz7WFmR5
	kLmakWWLjsIQOS12gNrLh2zH9gtYZ/cnH9R/hZZMYoL24tlo4mH1+sOzWvdQ6L4XN5OUrD
	3o3v1R0sLcFLE/Gy/dgRlR7haYlTVsk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-lbIQ86IyOdyZryBbTv1Tsw-1; Sat, 01 Jul 2023 07:04:21 -0400
X-MC-Unique: lbIQ86IyOdyZryBbTv1Tsw-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-78a5bbabf67so623614241.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 04:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688209461; x=1690801461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usj2c3ViGBK68/uJN1vOeJSqiKiuoQd+nTxCRZLq9fA=;
        b=YQTshxcHr0xBU1zD98l13llDXw65i2AeYMuqjqsk1esNHesganB7MTT+BJDKeJq7jE
         +70YsHvKfegZ/hxuq+FXV00cZaBCLNXpGdodlWTvEqS9sXgImVZ0kCnTfdw30zyqIu3B
         9b9g0pJHgXKUXLSmbGwSofz2LFUIcUb80MQ8XVTMCoida21yysgM915Uc+lxLP9nAr0P
         DKW5Jb7pBAMvYqbKKKaRlULvzD6As+TGT3lwmcWg7TmGbCCqu7015Ywr335a3cE9MtDc
         TT6o3aCY+BvVq8Gy7M6ZQZq6o+OdkXLhC43B/dYaKwUdFmxX4F7D8I/dhZeZMKEGXLJ3
         /qhQ==
X-Gm-Message-State: ABy/qLYqvcXe5lrdtd2I7ImCw8upSjVc52fkwDG0pMdWOmWLJVL7sTs4
	hV2WpcBRnTEtCEfMKBa3yWfiznc6oR5A2NUn9xcjHSjaftY/sRWwvC+a5KkNKzlOhXvRJmYSdl3
	ycsiXhVGDhcT67OpfT/XDWXpP4mBW1pgPRieBXU5iE6An
X-Received: by 2002:a67:b14b:0:b0:443:70bd:719b with SMTP id z11-20020a67b14b000000b0044370bd719bmr3313825vsl.0.1688209460809;
        Sat, 01 Jul 2023 04:04:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFOQP3TLfCvY1U9O3p3HiSXflFh63RBDjtIKnxptpkvhxoaqz3LRDzbrfPqIDswBL+O/CNtNuz0b1RZL17327w=
X-Received: by 2002:a67:b14b:0:b0:443:70bd:719b with SMTP id
 z11-20020a67b14b000000b0044370bd719bmr3313775vsl.0.1688209459943; Sat, 01 Jul
 2023 04:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1iT=SbjSvv_7SDygSo0HhmgLjD-y+DU1_Q+6tnki7w+A@mail.gmail.com>
In-Reply-To: <CAAhSdy1iT=SbjSvv_7SDygSo0HhmgLjD-y+DU1_Q+6tnki7w+A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 1 Jul 2023 13:04:08 +0200
Message-ID: <CABgObfZ5E58OpEzmRgVQ8axSZdoW-mfsq1wbPp=cfOX304O6uw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.5
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_040424_273729_B46654F1 
X-CRM114-Status: GOOD (  15.93  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNDoxM+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjU6Cj4gMSkgUmVkaXJlY3QgQU1PIGxvYWQvc3RvcmUg
bWlzYWxpZ25lZCB0cmFwcyB0byBLVk0gZ3Vlc3QKPiAyKSBUcmFwLW4tZW11bGF0ZSBBSUEgaW4t
a2VybmVsIGlycWNoaXAgZm9yIEtWTSBndWVzdAo+IDMpIFN2bmFwb3Qgc3VwcG9ydCBmb3IgS1ZN
IEd1ZXN0Cj4KPiBQbGVhc2UgcHVsbC4KPgo+IFBsZWFzZSBub3RlIHRoYXQgdGhlcmUgaXMgYSBt
aW5vciBjb25mbGljdCB3aXRoIHRoZSBSSVNDLVYKPiB0cmVlIGluIHRoZSBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggaGVhZGVyIGR1ZSB0bwo+IEtWTSB2ZWN0b3IgdmlydHVhbGl6
YXRpb24gZ29pbmcgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUuCgpUaGFua3MgZm9yIHRoZSBoZWFk
cyB1cC4gSSBhbHNvIGFwcHJlY2lhdGUgdGhhdCB5b3UgaGF2ZSBmaXhlZCB0aGUKd29ya2Zsb3cg
YW5kIHRoZSBhdXRob3IvY29tbWl0dGVyIGRhdGUgYXJlIG5vdyBva2F5IQoKUGFvbG8KCj4gUmVn
YXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDk1NjFk
ZTNhNTViZWQ2YmRkNDRhMTI4MjBiYTgxZWM0MTZlNzA1YTc6Cj4KPiAgIExpbnV4IDYuNC1yYzUg
KDIwMjMtMDYtMDQgMTQ6MDQ6MjcgLTA0MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5n
aXQgdGFncy9rdm0tcmlzY3YtNi41LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byAwN2YyMjViNTg0MjQyMGFlOWMxOGNiYTE3ODczZmM3MWVkNjljMjhlOgo+Cj4gICBSSVNDLVY6
IEtWTTogUmVtb3ZlIHVubmVlZGVkIHNlbWljb2xvbiAoMjAyMy0wNi0yMCAxMDo0ODozOCArMDUz
MCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgY2hhbmdlcyBmb3IgNi41Cj4KPiAtIFJlZGlyZWN0
IEFNTyBsb2FkL3N0b3JlIG1pc2FsaWduZWQgdHJhcHMgdG8gS1ZNIGd1ZXN0Cj4gLSBUcmFwLW4t
ZW11bGF0ZSBBSUEgaW4ta2VybmVsIGlycWNoaXAgZm9yIEtWTSBndWVzdAo+IC0gU3ZuYXBvdCBz
dXBwb3J0IGZvciBLVk0gR3Vlc3QKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbmRyZXcgSm9uZXMgKDMpOgo+ICAg
ICAgIFJJU0MtVjogS1ZNOiBSZW5hbWUgZGlzX2lkeCB0byBleHRfaWR4Cj4gICAgICAgUklTQy1W
OiBLVk06IENvbnZlcnQgZXh0ZW5zaW9uX2Rpc2FibGVkW10gdG8gZXh0X3N0YXR1c1tdCj4gICAg
ICAgUklTQy1WOiBLVk06IFByb2JlIGZvciBTQkkgZXh0ZW5zaW9uIHN0YXR1cwo+Cj4gQW51cCBQ
YXRlbCAoMTEpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgZ3Vlc3QgZXh0ZXJuYWwg
aW50ZXJydXB0IGxpbmUgbWFuYWdlbWVudAo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgSU1TSUMg
cmVsYXRlZCBkZWZpbmVzCj4gICAgICAgUklTQy1WOiBLVk06IEFkZCBBUExJQyByZWxhdGVkIGRl
ZmluZXMKPiAgICAgICBSSVNDLVY6IEtWTTogU2V0IGt2bV9yaXNjdl9haWFfbnJfaGdlaSB0byB6
ZXJvCj4gICAgICAgUklTQy1WOiBLVk06IFNrZWxldGFsIGluLWtlcm5lbCBBSUEgaXJxY2hpcCBz
dXBwb3J0Cj4gICAgICAgUklTQy1WOiBLVk06IEltcGxlbWVudCBkZXZpY2UgaW50ZXJmYWNlIGZv
ciBBSUEgaXJxY2hpcAo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIGVtdWxhdGlv
biBvZiBBSUEgQVBMSUMKPiAgICAgICBSSVNDLVY6IEtWTTogRXhwb3NlIEFQTElDIHJlZ2lzdGVy
cyBhcyBhdHRyaWJ1dGVzIG9mIEFJQSBpcnFjaGlwCj4gICAgICAgUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDCj4gICAgICAgUklTQy1WOiBLVk06
IEV4cG9zZSBJTVNJQyByZWdpc3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcAo+ICAg
ICAgIFJJU0MtVjogS1ZNOiBBbGxvdyBTdm5hcG90IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPgo+
IEJlbiBEb29rcyAoMSk6Cj4gICAgICAgcmlzY3Y6IGt2bTogZGVmaW5lIHZjcHVfc2JpX2V4dF9w
bXUgaW4gaGVhZGVyCj4KPiBZYW5nIExpICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogUmVtb3Zl
IHVubmVlZGVkIHNlbWljb2xvbgo+Cj4gWWUgWGluZ2NoZW4gKDEpOgo+ICAgICAgIFJJU0MtVjog
S1ZNOiB1c2UgYml0bWFwX3plcm8oKSBBUEkKPgo+IHdjaGVuICgxKToKPiAgICAgICBSSVNDLVY6
IEtWTTogUmVkaXJlY3QgQU1PIGxvYWQvc3RvcmUgbWlzYWxpZ25lZCB0cmFwcyB0byBndWVzdAo+
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggICAgICAgICAgIHwgICAgMiArCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAgICAgIHwgIDEwNyArKystCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9hcGxpYy5oIHwgICA1OCArKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9haWFfaW1zaWMuaCB8ICAgMzggKysKPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oICAgICAgfCAgICA0ICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaCAgfCAgIDExICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaCAgICAgIHwgICA3MyArKysKPiAgYXJjaC9yaXNjdi9rdm0vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgfCAgICA0ICsKPiAgYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgfCAgICAzICsKPiAgYXJjaC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgICAgICAgfCAg
Mjc0ICsrKysrKystCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jICAgICAgICAgICAgIHwg
IDYxOSArKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jICAg
ICAgICAgICAgfCAgNjczICsrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jICAgICAgICAgICAgIHwgMTA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgICAgICB8ICAgIDMgKy0K
PiAgYXJjaC9yaXNjdi9rdm0vdGxiLmMgICAgICAgICAgICAgICAgICAgfCAgICAyICstCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgIHwgICAgNCArCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfZXhpdC5jICAgICAgICAgICAgIHwgICAgMiArCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpLmMgICAgICAgICAgICAgIHwgICA4MCArKy0KPiAgYXJjaC9yaXNjdi9rdm0vdm0u
YyAgICAgICAgICAgICAgICAgICAgfCAgMTE4ICsrKysKPiAgaW5jbHVkZS91YXBpL2xpbnV4L2t2
bS5oICAgICAgICAgICAgICAgfCAgICAyICsKPiAgMjAgZmlsZXMgY2hhbmdlZCwgMzEwMCBpbnNl
cnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2FpYV9hcGxpYy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfaW1zaWMuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0v
YWlhX2ltc2ljLmMKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
