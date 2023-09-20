Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F05CE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MObJ8KWMT3Tne9WTOwl0s4Yp78oY4x41DdRLWcUKqEg=; b=Q7VjALR3MiQV9C
	hJ3gAICcMyV0nhjvKgCnuSK/B3SPbcYJ+nqsr71KE2dawLTXHFgMpOl8HAZfP97KCHl726CEU6fvU
	6nx8qp/l4L9m8bVo67QoybjbxHIw9CpRfLWlxjQ+UmdC6awWHV4O9db2L4Bb1vQH11vo4C+JDViqu
	egDw7hGztDGOjRR1RWfYSBAUlhQWHKOcVmCwRTSxv+qHM7p1vG0OI4TobZxCeepqnVDO3UV76ZRzZ
	Cov7pVPSiL2BGdB5cACXY1HrKpO9/WFHjH7PIQ/xqQiA00MLji5iw50FrpNEbFOQcoVI70WgvQDup
	X4kvVBFhv9entw2gywRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixck-003EYB-1x;
	Wed, 20 Sep 2023 13:52:14 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixch-003EWF-2g
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:52:13 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so907018a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695217928; x=1695822728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzKUIkp2N4mFsPMBkGOtGZ83qroR9oeUcPf9C3+REGI=;
        b=DpT0XYbRoTA/j/19teM+QEJihESwEbiVyF9oAyXavJ2ZUjFTAAhYSXqxE4eT4me+mO
         wl+3DrGlNhRaN7QDHTFkQrIfXWMMBl/9JxheOuUTSqC6r9On4VJtgnA+FdgZ2z6oJjhJ
         5Jwu69i3iD9rD2dNPDtqt2Bwysys7785e2d8jR0loTYhHiouuAcOsqNMGJhzf8ZhuVsx
         ZaTkWX6XJusW6Ds7cMF/JUk+VBl5TGMD5AK5g6WmuXcZ7g6XxdP2zFmL45Ud0GjH306A
         el/6vRw51MuQLRF2a3qESsnukNvsacmpxHuTq4r3MR+eiRQKyEAbpDVpDTYiAE2XpQRN
         dMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695217928; x=1695822728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzKUIkp2N4mFsPMBkGOtGZ83qroR9oeUcPf9C3+REGI=;
        b=IzIWJknISK3X+IA/tqeQi8GxTX+F7AH2dTyNQ2Qxsj8xr/RaSKA+eGHsiCPSEENc+0
         wP3d6fGCFXq4prw9qQP0JWdhDoUhn3+lkL9CrgGeXknB9lQs86RvnDoXWwoDxqoShQGO
         +GO094CIZDZpje29bAuBWSHTZgry/2DZOJkQlaDMH6hdVjCdSmkTWa4WX43xVVC+87Lz
         EojK+jHY34EUGX/DOX4GnsAP9hIS0uDCmkD9KuRsVxxLhV5j+PB9SZQnTfVI1II8J//Z
         LD4fZCw8Dw+dfLJh/clRF7TYU5HIEMfVA3oFIjZuO/H/R3tVibh+IqBfSoBaQIswpMdj
         9oDw==
X-Gm-Message-State: AOJu0YxeSHzKUTY+4J0GeAd+ToJ9NbtIssc8l/CdbJL/Bv6F2Jbk/M8J
	pkClxyD7NogD5/7w9DdXLAYJWlKHnspYve4LXNjr0Q4Ov/UJzOmDHD8=
X-Google-Smtp-Source: AGHT+IGXSUP8486WAuGjNv3n0pBFc9g0bpvw4aa5VzPg+ObGcV35R+/p4WGbHUmzy1ayTCndxJcGUvNBRm3i9v1Kurw=
X-Received: by 2002:a17:90a:3d43:b0:26b:7d8e:edf9 with SMTP id
 o3-20020a17090a3d4300b0026b7d8eedf9mr2256888pjf.49.1695217928154; Wed, 20 Sep
 2023 06:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com> <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
In-Reply-To: <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Sep 2023 19:21:56 +0530
Message-ID: <CAK9=C2XFGoZ-JZmMv4qmgzE+0Rt_pv+5k8UMJ0ivh=MaBoxxhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
To: Atish Patra <atishp@atishpatra.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_065211_875030_4878A6D2 
X-CRM114-Status: GOOD (  26.85  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMTo0M+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9B
TSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ3Vy
cmVudGx5IHRoZSBBSUEgT05FX1JFRyByZWdpc3RlcnMgYXJlIHJlcG9ydGVkIGJ5IGdldC1yZWct
bGlzdAo+ID4gYXMgbmV3IHJlZ2lzdGVycyBmb3IgdmFyaW91cyB2Y3B1X3JlZ19saXN0IGNvbmZp
Z3Mgd2hlbmV2ZXIgU3NhaWEKPiA+IGlzIGF2YWlsYWJsZSBvbiB0aGUgaG9zdCBiZWNhdXNlIFNz
YWlhIGV4dGVuc2lvbiBjYW4gb25seSBiZQo+ID4gZGlzYWJsZWQgYnkgU21zdGF0ZWVuIGV4dGVu
c2lvbiB3aGljaCBpcyBub3QgYWx3YXlzIGF2YWlsYWJsZS4KPiA+Cj4gPiBUbyB0YWNrbGUgdGhp
cywgd2Ugc2hvdWxkIGZpbHRlci1vdXQgQUlBIE9ORV9SRUcgcmVnaXN0ZXJzIG9ubHkKPiA+IHdo
ZW4gU3NhaWEgY2FuJ3QgYmUgZGlzYWJsZWQgZm9yIGEgVkNQVS4KPiA+Cj4gPiBGaXhlczogNDc3
MDY5Mzk4ZWQ2ICgiS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgZ2V0LXJlZy1saXN0IHRlc3Qi
KQo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiAtLS0KPiA+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAg
ICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gaW5kZXggNzZjMGFkMTFlNDIzLi44
NTkwN2M4NmI4MzUgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gQEAgLTEyLDYgKzEyLDggQEAKPiA+Cj4gPiAgI2Rl
ZmluZSBSRUdfTUFTSyAoS1ZNX1JFR19BUkNIX01BU0sgfCBLVk1fUkVHX1NJWkVfTUFTSykKPiA+
Cj4gPiArc3RhdGljIGJvb2wgaXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRf
TUFYXTsKPiA+ICsKPiA+ICBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ID4gIHsKPiA+ICAg
ICAgICAgc3dpdGNoIChyZWcgJiB+UkVHX01BU0spIHsKPiA+IEBAIC00OCw2ICs1MCwxNSBAQCBi
b29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1Zf
SVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJRkVOQ0VJOgo+ID4gICAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgo+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICAvKiBBSUEgcmVnaXN0ZXJzIGFyZSBh
bHdheXMgYXZhaWxhYmxlIHdoZW4gU3NhaWEgY2FuJ3QgYmUgZGlzYWJsZWQgKi8KPiA+ICsgICAg
ICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9S
RUdfUklTQ1ZfQ1NSX0FJQV9SRUcoc2lzZWxlY3QpOgo+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlB
X1JFRyhpcHJpbzEpOgo+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JF
R19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzIpOgo+ID4g
KyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwg
S1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhzaWVoKToKPiA+ICsgICAgICAgY2FzZSBLVk1fUkVH
X1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJ
QV9SRUcoc2lwaCk6Cj4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVH
X1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlwcmlvMWgpOgo+ID4g
KyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwg
S1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzJoKToKPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gaXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfU1NBSUFdID8gdHJ1
ZSA6IGZhbHNlOwo+Cj4gQWhoIEkgZ3Vlc3MuIHlvdSBkbyBuZWVkIHRoZSBzd2l0Y2ggY2FzZSBm
b3IgQUlBIENTUnMgYnV0IGZvciBJU0EKPiBleHRlbnNpb25zIGNhbiBiZSBhdm9pZGVkIGFzIGl0
IGlzIGNvbnRpZ3VvdXMuCgpGb3cgbm93LCBsZXQncyBsZWF2ZSBpdCBhcy1pcyBiZWNhdXNlIHRo
aXMgd2F5IGdldC1yZWctbGlzdCB3aWxsCmNvbXBsYWluIGlmIHNvbWUgbmV3IE9ORV9SRUcgcmVn
aXN0ZXIgaXMgbWlzc2VkIG91dC4KCj4KPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+ICAgICAgICAgfQo+ID4gQEAgLTcxLDE0ICs4MiwyMiBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4
dCkKPiA+Cj4gPiAgdm9pZCBmaW5hbGl6ZV92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IHZjcHVfcmVnX2xpc3QgKmMpCj4gPiAgewo+ID4gKyAgICAgICBpbnQgcmM7Cj4gPiAgICAg
ICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25n
IGlzYV9leHRfc3RhdGVbS1ZNX1JJU0NWX0lTQV9FWFRfTUFYXSA9IHsgMCB9Owo+ID4gKwo+ID4g
KyAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IEtWTV9SSVNDVl9JU0FfRVhUX01BWDsgaSsrKQo+
ID4gKyAgICAgICAgICAgICAgIF9fdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVH
KGkpLCAmaXNhX2V4dF9zdGF0ZVtpXSk7Cj4gPgo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAg
KiBEaXNhYmxlIGFsbCBleHRlbnNpb25zIHdoaWNoIHdlcmUgZW5hYmxlZCBieSBkZWZhdWx0Cj4g
PiAgICAgICAgICAqIGlmIHRoZXkgd2VyZSBhdmFpbGFibGUgaW4gdGhlIHJpc2MtdiBob3N0Lgo+
ID4gICAgICAgICAgKi8KPiA+IC0gICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBLVk1fUklTQ1Zf
SVNBX0VYVF9NQVg7IGkrKykKPiA+IC0gICAgICAgICAgICAgICBfX3ZjcHVfc2V0X3JlZyh2Y3B1
LCBSSVNDVl9JU0FfRVhUX1JFRyhpKSwgMCk7Cj4gPiArICAgICAgIGZvciAoaW50IGkgPSAwOyBp
IDwgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgICByYyA9
IF9fdmNwdV9zZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGkpLCAwKTsKPiA+ICsgICAg
ICAgICAgICAgICBpZiAocmMgJiYgaXNhX2V4dF9zdGF0ZVtpXSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlzYV9leHRfY2FudF9kaXNhYmxlW2ldID0gdHJ1ZTsKPiA+ICsgICAgICAgfQo+
ID4KPiA+ICAgICAgICAgZm9yX2VhY2hfc3VibGlzdChjLCBzKSB7Cj4gPiAgICAgICAgICAgICAg
ICAgaWYgKCFzLT5mZWF0dXJlKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+IE90aGVyd2lzZSwg
TEdUTS4KPgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
Pgo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
