Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CFBC2D0CB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 05:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syKnTn7uWEUTJIkCfvLeziqXpPSGdy6dH7YAz3DGNRI=; b=cDqoIg+ARQQqdQ
	8+EIDZTnJC9Hhbf9E2sKjPqcogTt0LnmzyrnNEli2E3SDrlRR8znl6kF2T1RtXqfRGjN4NDRm3xWD
	1l3Rwsr7jBBSYdp3mTvVTHyOF0nB7ZnmY2MgZ8dT9ereqZNkRaaq5CdscaXr+TVF6dWbEkl9oCR1L
	lc3v77chyFrRM4QSJ1BojsXVxNI1QffK788HuUm+7kyYlkNhCZS84kyroah7EdLGtUrdd4HW7liu9
	ZA4t77PnHpNbU0qwXMoJiuKZ++ZXdtf5+otVnwWQB5t5OpynXtZygO7tbn5HZror1JQK2XDeabasq
	MjZsB072tCqkAI67Kzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRKt-0000000H4Cw-1Vdj;
	Thu, 15 May 2025 05:40:51 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRKq-0000000H4CC-19hb
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 05:40:50 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so56273839f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747287647; x=1747892447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=SAxKMIqwnfRq26FOR33tzlMTmep8wzq1BVkofdT7WnMujF/Fxt+Xfx2BND/v20bdZu
         DY46QWqZm3vic6+3VhX5PFKyTiDO9tSbgloQrtjEstsgmAZAOpaxEd/2pUTJXxJ+DbFd
         0CUgDoCatZq6RLf/APr/TTX5NFKIsBgIxxrGgBfLSPYPmXStq1kWhxgF1LnOr3yzz8Zw
         y6JyMBrYALQRAKHUrte/HSI3KPXKduzz8boNXkFdZsS0v7Y4vgPIgVyRLXFadgZUTYh8
         a3APBSenr+zaDmRq9son3AGOEYmR8y7ZRAJ9Kg59I0neJk5XlzEqv2M2Ngcm8e/M2Jv0
         4sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747287647; x=1747892447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=qYNzFKpRbetlmLJmCRYZ5YcPNOvzVJldMJGSGo9EXWQ+aJnsYSI8JTdj1jw++fk0Tc
         KAGbxa4Ocr6d06SalcXbVGQ0hFYL3uUb5Wuw+R0BguZhJUAOqLTej9D6+elB3A+qCrox
         LNrDmc9etpLPimEbCPYOEnSmoR11aYOHVxR8XaBpvnyxGyjJX1VAVp71BO73Kdk2wHtV
         q48hBlS+TQpKgAslVbiU8TLDe2dKXHoLHxPqKBEqUgsM/fXRR+PZxMSHIOgsw5KfBjqk
         RsM6zKSwxz8ivc1/O5Cc5VumcYwzCzrmNBrEBpKG9HC7j6hVuDvODezJ8CTPd/4QHwaR
         SfGw==
X-Forwarded-Encrypted: i=1; AJvYcCUZmxW8ur83DG9MVqQ2I0891wbUiteD3l5RWr7DEwkWfHJmfp0g0NafOp5Ixws+oN407VJC//UjQ+WI/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu4rkqzIgqD2TXQc89ehiZSiFXLhwm2eGffYWDYVUnbto4GO0i
	OhzWtQs6aavcO/RfiHDQxQE85Pqy0z/8dNgKHokCCNfIkt2ve+7R/KTQm0KGSrqrntQPdop4lSV
	EvwHlCAzaxQzeAvNNGXGiH8tlMNLEyA943qRqrQ==
X-Gm-Gg: ASbGncvDOn1kKidNtUfXl0Wu6QkwlTV7cH13g5xdZ7YFaUJFovegHBn0Dqknk0YZUe7
	/UXvgQkgOmtGglnVybb9pTA60EUjBFBbR59PycQZm5kf19sRu1Ih8OBW4qx96ayGqAqgiQOxZAC
	F1+bwTdqpm554Y7DVCNClt6tYsNRQq71c=
X-Google-Smtp-Source: AGHT+IFTDygqebxFrfLhPNX+H4Kgt8uWXhKH50xWzqmnoJDcPg0UVlggjxomSWbuTCti64Fu8NXM5RNuQ470N3l+oyw=
X-Received: by 2002:a05:6e02:1fc6:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3db6f794c00mr72097505ab.3.1747287646677; Wed, 14 May 2025
 22:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
 <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com> <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
In-Reply-To: <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 11:10:34 +0530
X-Gm-Features: AX0GCFvhFxNwn3sOoUM6uFOgfx0BZ3COs0Idy6xZaupJBYExW9VxrohdUkojQQE
Message-ID: <CAAhSdy2DG0y3r8T=AqJ-T7+VaVcVpY0pSRZDptfYwwknshB+zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224048_582028_83C946EF 
X-CRM114-Status: GOOD (  21.87  )
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

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMjozMeKAr0FNIEF0aXNoIEt1bWFyIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE0LCAyMDI1IGF0IDM6NTXi
gK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBX
ZWQsIE1heSAxNCwgMjAyNSBhdCAxMjoxM+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIEtWTSB2aXJ0dWFsaXplcyBQTVUgaW4gUklT
Qy1WIGFuZCBkaXNhYmxlcyBhbGwgY291bnRlciBhY2Nlc3MgZXhjZXB0Cj4gPiA+IFRNIGJpdCBi
eSBkZWZhdWx0IHZpIGhzdGF0ZWVuIENTUi4gVGhlcmUgaXMgbm8gYmVuZWZpdCBpbiBlbmFibGlu
ZyBDWS9UTQo+ID4gPiBiaXRzIGluIHNjb3VudGVyZW4gZm9yIHRoZSBndWVzdCB1c2VyIHNwYWNl
IGFzIGl0IGNhbid0IGJlIHJ1biB3aXRob3V0Cj4gPiA+IGhjb3VudGVyZW4gYW55d2F5cy4KPiA+
ID4KPiA+ID4gQWxsb3cgb25seSBUTSBiaXQgd2hpY2ggbWF0Y2hlcyB0aGUgaGNvdW50ZXJlbiBk
ZWZhdWx0IHNldHRpbmcuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gPiBpbmRleCA2MGQ2ODRjNzZjNTguLjg3MzU5M2Jm
ZTYxMCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gPiBAQCAtMTQ2LDggKzE0Niw4IEBAIGludCBrdm1f
YXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiA+ICAgICAgICAgaWYg
KGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHZjcHUsIGNudHgpKQo+ID4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+Cj4gPiA+IC0gICAgICAgLyogQnkg
ZGVmYXVsdCwgbWFrZSBDWSwgVE0sIGFuZCBJUiBjb3VudGVycyBhY2Nlc3NpYmxlIGluIFZVIG1v
ZGUgKi8KPiA+ID4gLSAgICAgICByZXNldF9jc3ItPnNjb3VudGVyZW4gPSAweDc7Cj4gPiA+ICsg
ICAgICAgLyogQnkgZGVmYXVsdCwgb25seSBUTSBzaG91bGQgYmUgYWNjZXNzaWJsZSBpbiBWVSBt
b2RlICovCj4gPiA+ICsgICAgICAgcmVzZXRfY3NyLT5zY291bnRlcmVuID0gMHgyOwo+ID4KPiA+
IExldCdzIHJlbW92ZSB0aGlzIGFzIHdlbGwgYmVjYXVzZSB0aGUgTGludXggU0JJIFBNVSBkcml2
ZXIKPiA+IGRvZXMgaW5pdGlhbGl6ZSBzY291bnRlcmVuIGNvcnJlY3RseS4KPiA+Cj4KPiBCdXQg
b3RoZXIgZ3Vlc3RzIG1heSBub3QuIEkgdGhvdWdodCB0aW1lIHNob3VsZCBiZSBhIGJhc2ljIG9u
ZSB0aGF0Cj4gc2hvdWxkIGJlIGFsbG93ZWQgYnkgZGVmYXVsdC4KPgoKVGhlcmUgaXMgbm8gc3Bl
Y2lmaWNhdGlvbiAoU0JJIG9yIFByaXYgc3BlYykgd2hpY2ggbWFuZGF0ZXMgTS1tb2RlCm9yIEhT
LW1vZGUgdG8gc2V0dXAgUy1tb2RlIENTUnMuIFNldHRpbmcgc2NvdW50ZXJlbiBiaXRzIChpbmNs
dWRpbmcKVE0gYml0KSBoYXMgYWx3YXlzIGJlZW4gYSBIQUNLIG9yIHdvcmstYXJvdW5kLgoKSXQg
aXMgYmV0dGVyIHRvIHJlbW92ZSBzY291bnRlcmVuIGluaXRpYWxpemF0aW9uIEhBQ0sgZnJvbSBL
Vk0gUklTQy1WCmJlZm9yZSBtb3JlIHN1cGVydmlzb3Igc29mdHdhcmUgc3RhcnRzIGRlcGVuZGlu
ZyBvbiBpdC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
