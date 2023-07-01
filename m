Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D97FEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPwEC2sAN8X1XlBA5F4RWjhS9eu9N/AOhFEkHFDSPLg=; b=bEiObZe1o7/2oQ
	2A46Anh+ssiiUKFDoWlY9SNsg72UoT2NRg2yyeW3CsNKhZ8bSaTgb4ZQUq3se98VYxzEWcWI3ELj/
	3btQ9nLY3itdvYNDaB6miDatvAjO3OC/GBxX6ydrflG/IJ9gqtwzkgtgDqJe7VubkLYeXLQ6c0GMl
	jx+aidPA9CVbGBGzdsX2uUFdvT2j3XrqLIHnZQAurz9vJBD3dYBnvnjymq7X5iZzPLW0XamU+Vxrr
	wDp3ASOI7zN/IE0yg4Dy23OLGCRb03VyD0mZoBcfRd63IuSRB9PYiHAasRVZRa2ZLpvBEqzFafulr
	QrlQCCndJa0kvy/dCaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYve-005lfU-1A;
	Sat, 01 Jul 2023 11:38:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYva-005ldo-2A
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 11:38:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so4513501e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1688211487; x=1690803487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAuIfqT5Gll/OkRGnZNYzkmmC2G5kvlC5phjaj1JvNo=;
        b=FvLbCvH7C5oKNFAor8rQlEixGwXADb1QO32R+faYApfpeKdx7p12r6p6VzT+2O83UD
         moAO+kXJbdjGSuQs1EwijJOMNOeifqbxxWx7HRS/oJ3MX6KEEnPCHKNcWpTq5KwgoXZC
         SjF+23XCoQ22NJdaIhrXeAzrifaf/sHObVo12iFO7YD+NuuNnUqhx+C46jtGwzsjkNM4
         kzCJyJqzjeVqsNaBJ8Ne++BpXHncaNPoG4CxXvIq0JbdnF74YCDd+Vpat0+lJ+gkQSZP
         UjSs7Pj33OfHC5xQGTDESBSyaRb81/TevLPtjAAuST0uwl505aYAks4kZU5EQyvvOi33
         HTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688211487; x=1690803487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAuIfqT5Gll/OkRGnZNYzkmmC2G5kvlC5phjaj1JvNo=;
        b=IV4W6v/NOtKbi3sTnEdfrvQ3x5lq0oDZ+KxU1VX1inkxTY2HudeNT1mGfG3vYbfxsc
         Fz6FIobk1iW1eb4HADkafnlfA/OW/cqu81UKnba8k1fvP40Y73tyUgNu2TLMu+97oAmG
         p9D+8n5poFyL4wVQqWFQSDjvruQEk1SkHgY+34ikbiPFMgDDtFHTTAow6rJ1wa9arZCy
         5et0Nhh7O/ODoKjli5r6PV9rsRADGJ2E9TBOw6asFHghI/zOOOhbH6rrB3PW79/BK3e8
         AXbf1HhBQCkp10b/huRQo0rL5jM1e7fjNBHgeNIs1lh0VOWlgsXE+iHGtzRAsnsWNV5h
         6AKg==
X-Gm-Message-State: ABy/qLYMTDEx1uB9uYY/xAHdRFd1mupSN1M797JhFkSfQtcnn01q/Vcy
	Toftki+SMa50u2c21EWttGt0T3poXY5zqiC5GYgy3w==
X-Google-Smtp-Source: APBJJlFPF7EYCx4bAivjCDW+lZ5Fb7Qn3wBMLcBCl1tZ64ObT+EZbhZGWQGeLCVhLl/0nq7a5RUQ2xOAkBaiLlciJDk=
X-Received: by 2002:a05:6512:10d4:b0:4fb:b11:c99e with SMTP id
 k20-20020a05651210d400b004fb0b11c99emr4727305lfg.56.1688211486473; Sat, 01
 Jul 2023 04:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1iT=SbjSvv_7SDygSo0HhmgLjD-y+DU1_Q+6tnki7w+A@mail.gmail.com>
 <CABgObfZ5E58OpEzmRgVQ8axSZdoW-mfsq1wbPp=cfOX304O6uw@mail.gmail.com>
In-Reply-To: <CABgObfZ5E58OpEzmRgVQ8axSZdoW-mfsq1wbPp=cfOX304O6uw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Jul 2023 17:07:54 +0530
Message-ID: <CAAhSdy04b6TxLC78yXSUipX5dkYbWnOuuLMm56HDAy1MS2MzfQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.5
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_043810_933948_EDBD2294 
X-CRM114-Status: GOOD (  20.68  )
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

T24gU2F0LCBKdWwgMSwgMjAyMyBhdCA0OjM04oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCA0OjEz4oCvUE0g
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUGFvbG8s
Cj4gPgo+ID4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi41
Ogo+ID4gMSkgUmVkaXJlY3QgQU1PIGxvYWQvc3RvcmUgbWlzYWxpZ25lZCB0cmFwcyB0byBLVk0g
Z3Vlc3QKPiA+IDIpIFRyYXAtbi1lbXVsYXRlIEFJQSBpbi1rZXJuZWwgaXJxY2hpcCBmb3IgS1ZN
IGd1ZXN0Cj4gPiAzKSBTdm5hcG90IHN1cHBvcnQgZm9yIEtWTSBHdWVzdAo+ID4KPiA+IFBsZWFz
ZSBwdWxsLgo+ID4KPiA+IFBsZWFzZSBub3RlIHRoYXQgdGhlcmUgaXMgYSBtaW5vciBjb25mbGlj
dCB3aXRoIHRoZSBSSVNDLVYKPiA+IHRyZWUgaW4gdGhlIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9rdm0uaCBoZWFkZXIgZHVlIHRvCj4gPiBLVk0gdmVjdG9yIHZpcnR1YWxpemF0aW9uIGdv
aW5nIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlLgo+Cj4gVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAu
IEkgYWxzbyBhcHByZWNpYXRlIHRoYXQgeW91IGhhdmUgZml4ZWQgdGhlCj4gd29ya2Zsb3cgYW5k
IHRoZSBhdXRob3IvY29tbWl0dGVyIGRhdGUgYXJlIG5vdyBva2F5IQoKWWVzLCB0aGUgbmV4dCBi
cmFuY2ggb2YgS1ZNIFJJU0MtViB0cmVlIGlzIG5vdyBwYXJ0IG9mIHJlZ3VsYXIKaW50ZWdyYXRp
b24gdGVzdGluZyBpbiBsaW51eC1uZXh0IGFuZCBJIGFtIGFjdGl2ZWx5IHB1c2hpbmcgYWNjZXB0
ZWQKcGF0Y2hlcyB0byB0aGUgbmV4dCBicmFuY2ggbXVjaCBiZWZvcmUgdGhlIGFjdHVhbCBQUi4K
ClRoYW5rcyB0byB5b3VyIHN1Z2dlc3Rpb25zIGFuZCBndWlkYW5jZS4KClJlZ2FyZHMsCkFudXAK
Cj4KPiBQYW9sbwo+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgOTU2MWRlM2E1NWJlZDZiZGQ0NGExMjgyMGJhODFlYzQxNmU3
MDVhNzoKPiA+Cj4gPiAgIExpbnV4IDYuNC1yYzUgKDIwMjMtMDYtMDQgMTQ6MDQ6MjcgLTA0MDAp
Cj4gPgo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gPgo+ID4g
ICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi02
LjUtMQo+ID4KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwN2YyMjViNTg0MjQy
MGFlOWMxOGNiYTE3ODczZmM3MWVkNjljMjhlOgo+ID4KPiA+ICAgUklTQy1WOiBLVk06IFJlbW92
ZSB1bm5lZWRlZCBzZW1pY29sb24gKDIwMjMtMDYtMjAgMTA6NDg6MzggKzA1MzApCj4gPgo+ID4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gS1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuNQo+ID4KPiA+IC0gUmVkaXJlY3Qg
QU1PIGxvYWQvc3RvcmUgbWlzYWxpZ25lZCB0cmFwcyB0byBLVk0gZ3Vlc3QKPiA+IC0gVHJhcC1u
LWVtdWxhdGUgQUlBIGluLWtlcm5lbCBpcnFjaGlwIGZvciBLVk0gZ3Vlc3QKPiA+IC0gU3ZuYXBv
dCBzdXBwb3J0IGZvciBLVk0gR3Vlc3QKPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBBbmRyZXcgSm9uZXMg
KDMpOgo+ID4gICAgICAgUklTQy1WOiBLVk06IFJlbmFtZSBkaXNfaWR4IHRvIGV4dF9pZHgKPiA+
ICAgICAgIFJJU0MtVjogS1ZNOiBDb252ZXJ0IGV4dGVuc2lvbl9kaXNhYmxlZFtdIHRvIGV4dF9z
dGF0dXNbXQo+ID4gICAgICAgUklTQy1WOiBLVk06IFByb2JlIGZvciBTQkkgZXh0ZW5zaW9uIHN0
YXR1cwo+ID4KPiA+IEFudXAgUGF0ZWwgKDExKToKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXBs
ZW1lbnQgZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0IGxpbmUgbWFuYWdlbWVudAo+ID4gICAgICAg
UklTQy1WOiBLVk06IEFkZCBJTVNJQyByZWxhdGVkIGRlZmluZXMKPiA+ICAgICAgIFJJU0MtVjog
S1ZNOiBBZGQgQVBMSUMgcmVsYXRlZCBkZWZpbmVzCj4gPiAgICAgICBSSVNDLVY6IEtWTTogU2V0
IGt2bV9yaXNjdl9haWFfbnJfaGdlaSB0byB6ZXJvCj4gPiAgICAgICBSSVNDLVY6IEtWTTogU2tl
bGV0YWwgaW4ta2VybmVsIEFJQSBpcnFjaGlwIHN1cHBvcnQKPiA+ICAgICAgIFJJU0MtVjogS1ZN
OiBJbXBsZW1lbnQgZGV2aWNlIGludGVyZmFjZSBmb3IgQUlBIGlycWNoaXAKPiA+ICAgICAgIFJJ
U0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIGVtdWxhdGlvbiBvZiBBSUEgQVBMSUMKPiA+ICAgICAg
IFJJU0MtVjogS1ZNOiBFeHBvc2UgQVBMSUMgcmVnaXN0ZXJzIGFzIGF0dHJpYnV0ZXMgb2YgQUlB
IGlycWNoaXAKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0
aW9uIG9mIEFJQSBJTVNJQwo+ID4gICAgICAgUklTQy1WOiBLVk06IEV4cG9zZSBJTVNJQyByZWdp
c3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcAo+ID4gICAgICAgUklTQy1WOiBLVk06
IEFsbG93IFN2bmFwb3QgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ID4KPiA+IEJlbiBEb29rcyAo
MSk6Cj4gPiAgICAgICByaXNjdjoga3ZtOiBkZWZpbmUgdmNwdV9zYmlfZXh0X3BtdSBpbiBoZWFk
ZXIKPiA+Cj4gPiBZYW5nIExpICgxKToKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBSZW1vdmUgdW5u
ZWVkZWQgc2VtaWNvbG9uCj4gPgo+ID4gWWUgWGluZ2NoZW4gKDEpOgo+ID4gICAgICAgUklTQy1W
OiBLVk06IHVzZSBiaXRtYXBfemVybygpIEFQSQo+ID4KPiA+IHdjaGVuICgxKToKPiA+ICAgICAg
IFJJU0MtVjogS1ZNOiBSZWRpcmVjdCBBTU8gbG9hZC9zdG9yZSBtaXNhbGlnbmVkIHRyYXBzIHRv
IGd1ZXN0Cj4gPgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggICAgICAgICAgIHwg
ICAgMiArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggICAgICAgfCAgMTA3
ICsrKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBsaWMuaCB8ICAgNTgg
KysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfaW1zaWMuaCB8ICAgMzggKysK
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICB8ICAgIDQgKwo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggIHwgICAxMSArLQo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgIHwgICA3MyArKysKPiA+ICBhcmNo
L3Jpc2N2L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAgIDQgKwo+ID4gIGFyY2gvcmlz
Y3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAgMyArCj4gPiAgYXJjaC9yaXNjdi9r
dm0vYWlhLmMgICAgICAgICAgICAgICAgICAgfCAgMjc0ICsrKysrKystCj4gPiAgYXJjaC9yaXNj
di9rdm0vYWlhX2FwbGljLmMgICAgICAgICAgICAgfCAgNjE5ICsrKysrKysrKysrKysrKysrKwo+
ID4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgICAgICAgIHwgIDY3MyArKysrKysr
KysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAgICAg
IHwgMTA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yv
a3ZtL21haW4uYyAgICAgICAgICAgICAgICAgIHwgICAgMyArLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L3RsYi5jICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICAgICAgIHwgICAgNCArCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9l
eGl0LmMgICAgICAgICAgICAgfCAgICAyICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
ICAgICAgICAgICAgICB8ICAgODAgKystCj4gPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAg
ICAgICAgICAgICAgfCAgMTE4ICsrKysKPiA+ICBpbmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAg
ICAgICAgICAgICB8ICAgIDIgKwo+ID4gIDIwIGZpbGVzIGNoYW5nZWQsIDMxMDAgaW5zZXJ0aW9u
cygrKSwgNjEgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2FpYV9hcGxpYy5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9pbXNpYy5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2t2bS9haWFfaW1zaWMuYwo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
