Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98DFE7F150
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YU5m0joHldZ0F1hI5mk3PoRaoGBkA5v+OH5lUbGTA3U=; b=rbAnCSRIaZKezp
	uZMsJZCBzNLp3F2nz96XYVXlpSzrTdLgF33ljga8v+770IXtdM0EmB4lKNi3c0h/fNm7dmXX2+Zq+
	oGmplP8fr9N3neLCF8NpSohQ6JZ5Sc+T4fK6zROH7VhRn3Puka9P4qemAa0I95AHvBBfz/DJY25VX
	3UgR4BAhIpBSbdqrniMJjx/NdT5D2ubjT1Oanm569bPL5jUk3b+hzRR+lcHGF6Rqae7k2GsFurZud
	Fq6qzDjMt2/2smujXDWIaLVvVqSq9MprpALUwihnf8uQDKHwycZ4ftURa0OvxCxB9NQDMnYbjZ0gB
	q/Rrl9XL1pLPlEHd5bGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlK3T-00HM1C-1q;
	Wed, 27 Sep 2023 02:13:35 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlK3P-00HM01-2f
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 02:13:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-69101022969so9042683b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 19:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695780808; x=1696385608; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZV6WWLW/um6fjmDxBYmHw3kQW73zJt+fvsBsocXSqds=;
        b=gc8xpHTwavwpURFmB/T1RKEKH2HkQRY4yBt2dgh9KRdngFOl96FzvQ76WLbO2u+oaa
         FK+ciU/6X+E392T+RZQkaMHIEo8iBHH9ISBCURpIGEZEvIuhwijVqzPugPyQldit2CT0
         EhZWVg+Q9VXaUr9Q9gSVFSYwxyAEiDHy/+B8sr/2W3IDLSPWfaGB95cTDV52Rc/SPW0E
         SdILqJz4OX7q6pu8kRk4qsbmACVDOlSn2jxrXXmalBWBdfltbCVOIGJL8hzIacmylpkm
         fLzPI0SIf8BmA1wi4BOPd86xvRwFnxBRLzQKmLEvvmidmAwyJpKdOQodn+11v2FUz9NM
         ZE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695780808; x=1696385608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV6WWLW/um6fjmDxBYmHw3kQW73zJt+fvsBsocXSqds=;
        b=ZCcuApenGRYizVmN+CMlU8UvIIJvq7yDyjezmb+1613XKKF+xP1ehlXpsiEUkZuP6V
         7bACCVSnfneXMQG0fNATVuK0fU0YnvIvXK+fPCYx201PUZo04rfFnCUX4oAiSnmMI+Cu
         Fr0DhLDsh8gXZKgc5EPwZ74dyMykIgCenz0XNwlTxU4NcxUtzgCmVAnF+GpnSenOjbm/
         0a0aWmrtnLg6QFWfxpvYUxL1PoSVws3GKF50rdc4yd47FscjtkwfmIqguock40BiuLni
         pbx2/5JQ1ZPJAQ9uqndnoBJctdI9///6mRzK0BK40MVfwgq2XAmiDyzM9bAXktszMasc
         NgCQ==
X-Gm-Message-State: AOJu0YyUIF4TfSd4MPWcKjV4Fwaqwb7H8mofdsahvUihGdA4RdoHKk3v
	SJRsLDWS5iYeJhJh/09q0Cj/aA==
X-Google-Smtp-Source: AGHT+IE1uy7Z2/RTHVKKBhrojjBrMYzG+W9qZc3apbDrbDB/vlS2HSZCgLb+7NFBKhVe0YuAu/kyOA==
X-Received: by 2002:a05:6a00:cd5:b0:68c:49e4:bd71 with SMTP id b21-20020a056a000cd500b0068c49e4bd71mr709094pfv.34.1695780808529;
        Tue, 26 Sep 2023 19:13:28 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:6eef:9e73:7774:1855])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0068fda1db80bsm10616571pfi.75.2023.09.26.19.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 19:13:28 -0700 (PDT)
Date: Tue, 26 Sep 2023 19:13:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <ZROPxDPYGDcGm2J/@ghost>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-3-apatel@ventanamicro.com>
 <ZRHH25IyJJLWSolC@ghost>
 <CAK9=C2UoKxM+wknB4n8=okyXCCE6t0Vvz4jU_tBW6DMm6Vb3DA@mail.gmail.com>
 <CAK9=C2X9FpLTW4mDTNUWkoRLAXZonPzhrsOD5xrCfrqKSbaLhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2X9FpLTW4mDTNUWkoRLAXZonPzhrsOD5xrCfrqKSbaLhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_191331_866149_C8DCD8A4 
X-CRM114-Status: GOOD (  40.85  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMDk6NDQ6MzhBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCA5OjM44oCvQU0gQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0
IDExOjE44oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDA3OjA4OjUyUE0gKzA1MzAsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiA+ID4gVGhlIFZleXJvbi1WMSBDUFUgc3VwcG9ydHMgY3VzdG9t
IGNvbmRpdGlvbmFsIGFyaXRobWV0aWMgYW5kCj4gPiA+ID4gY29uZGl0aW9uYWwtc2VsZWN0L21v
dmUgb3BlcmF0aW9ucyByZWZlcnJlZCB0byBhcyBYVmVudGFuYUNvbmRPcHMKPiA+ID4gPiBleHRl
bnNpb24uIEluIGZhY3QsIFFFTVUgUklTQy1WIGFsc28gaGFzIHN1cHBvcnQgZm9yIGVtdWxhdGlu
Zwo+ID4gPiA+IFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24uCj4gPiA+ID4KPiA+ID4gPiBMZXQg
dXMgZGV0ZWN0IFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24gZnJvbSBJU0Egc3RyaW5nIGF2YWls
YWJsZQo+ID4gPiA+IHRocm91Z2ggRFQgb3IgQUNQSS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+IC0t
LQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKPiA+ID4gPiAg
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCj4gPiA+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
Cj4gPiA+ID4gaW5kZXggMGY1MjBmN2QwNThhLi5iN2VmZTllMmZhODkgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiA+ID4gQEAgLTU5LDYgKzU5LDcgQEAKPiA+ID4g
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJICAgICAgICAgICAgICAgNDEKPiA+ID4g
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSFBNICAgICAgICAgIDQyCj4gPiA+ID4gICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4gICAgICAgICAgICAgIDQzCj4gPiA+ID4gKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9YVkVOVEFOQUNPTkRPUFMgICAgICAgIDQ0Cj4gPiA+ID4KPiA+ID4g
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAgICAgICAgIDY0Cj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gaW5kZXggMzc1NWE4YzJhOWRlLi4zYTMxZDM0
ZmU3MDkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gQEAg
LTE4Miw2ICsxODIsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lz
YV9leHRbXSA9IHsKPiA+ID4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBS
SVNDVl9JU0FfRVhUX1NWSU5WQUwpLAo+ID4gPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHN2bmFwb3QsIFJJU0NWX0lTQV9FWFRfU1ZOQVBPVCksCj4gPiA+ID4gICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEEoc3ZwYm10LCBSSVNDVl9JU0FfRVhUX1NWUEJNVCksCj4gPiA+ID4gKyAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoeHZlbnRhbmFjb25kb3BzLCBSSVNDVl9JU0FfRVhUX1hWRU5U
QU5BQ09ORE9QUyksCj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+ID4gPiAgY29uc3Qgc2l6ZV90IHJp
c2N2X2lzYV9leHRfY291bnQgPSBBUlJBWV9TSVpFKHJpc2N2X2lzYV9leHQpOwo+ID4gPiA+IC0t
Cj4gPiA+ID4gMi4zNC4xCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+
ID4KPiA+ID4gSSB3b3JyeSBhYm91dCBzdG9yaW5nIHZlbmRvciBleHRlbnNpb25zIGluIHRoaXMg
ZmlsZS4gQmVjYXVzZSB2ZW5kb3IKPiA+ID4gZXh0ZW5zaW9ucyBhcmUgbm90IHN0YW5kYXJkaXpl
ZCwgdGhleSBjYW4gb25seSBiZSBleHBlY3RlZCB0byBoYXZlIHRoZQo+ID4gPiBkZXNpcmVkIGJl
aGF2aW9yIG9uIGhhcmR3YXJlIHdpdGggdGhlIGFwcHJvcHJpYXRlIHZlbmRvciBpZC4gQSBjb3Vw
bGUKPiA+Cj4gPiBBc3N1bWluZyB0aGF0IGEgdmVuZG9yIGV4dGVuc2lvbiBpcyBvbmx5IGF2YWls
YWJsZSBvbiBoYXJkd2FyZSB3aXRoCj4gPiBhcHByb3ByaWF0ZSB2ZW5kb3IgaWQgaXMgbm90IGNv
cnJlY3QgYmVjYXVzZToKPiA+IDEpIHZlbmRvciBBIGNhbiBhbGxvdyB2ZW5kb3IgQiB0byBpbXBs
ZW1lbnQgYSBjdXN0b20gZXh0ZW5zaW9uCj4gPiAgICAgZGVmaW5lZCBieSB2ZW5kb3IgQgo+IAo+
IFR5cG8gY29ycmVjdGlvbjogInZlbmRvciBBIGNhbiBhbGxvdyB2ZW5kb3IgQiB0byBpbXBsZW1l
bnQgYSBjdXN0b20KPiBleHRlbnNpb24gZGVmaW5lZCBieSB2ZW5kb3IgQSIKPiAKPiA+IDIpIHZl
bmRvciBBIGFuZCB2ZW5kb3IgQiBjYW4gam9pbnRseSBkZXZlbG9wIGEgUklTQy1WIENQVSB3aGVy
ZQo+ID4gICAgIGJvdGggdmVuZG9ycyBpbnRlZ3JhdGUgdGhlaXIgY3VzdG9tIGV4dGVuc2lvbnMu
Cj4gPgo+ID4gSXQgaXMgYmVzdCB0byBpZGVudGlmeSBhIHZlbmRvciBleHRlbnNpb24gaW5kZXBl
bmRlbnRseSB3aXRoIGEKPiA+ICJYPHZlbmRvcl9uYW1lPjxleHRlbnNpb25fbmFtZT4iIHN0cmlu
ZyB0byBrZWVwIGl0IHNpbXBsZQo+ID4gYW5kIHNjYWxhYmxlLgo+ID4KPiA+IEFsb25nIHRoZXNl
IGxpbmVzLCBlYWNoIFQtSGVhZCBjdXN0b20gZXh0ZW5zaW9uIHNob3VsZCBoYXZlIGEKPiA+ICJY
VGhlYWQ8eHl6PiIgbmFtZSBhc3NvY2lhdGVkIHdpdGggaXQuCj4gPgo+ID4gPiBtb250aHMgYWdv
IEkgc2VudCBhIHBhdGNoIHRvIGFkZHJlc3MgdGhpcyBieSBoYW5kbGluZyB2ZWN0b3IgZXh0ZW5z
aW9ucwo+ID4gPiBpbmRlcGVuZGVudGx5IGZvciBlYWNoIHZlbmRvciBbMV0uIEkgZHJvcHBlZCB0
aGUgcGF0Y2ggYmVjYXVzZSBpdAo+ID4gPiByZWxpZWQgdXBvbiBIZWlrbydzIFQtSGVhZCB2ZWN0
b3IgZXh0ZW5zaW9uIHN1cHBvcnQgdGhhdCBoZSBzdG9wcGVkCj4gPiA+IHdvcmtpbmcgb24uIEhv
d2V2ZXIsIEkgY2FuIHJldml2ZSB0aGlzIHBhdGNoIHNvIHlvdSBjYW4gYnVpbGQgb2ZmIG9mIGl0
Lgo+ID4KPiA+IEF0IGxlYXN0LCB0aGUgY29uZGl0aW9uYWwgb3BlcmF0aW9ucyBkb24ndCBuZWVk
IGEgaHdwcm9iZSBpbnRlcmZhY2UKPiA+IGJlY2F1c2UgYW4gYXBwbGljYXRpb24gaXMgZWl0aGVy
IGNvbXBpbGVkIHdpdGggb3Igd2l0aG91dCBjb25kaXRpb25hbAo+ID4gb3BlcmF0aW9ucy4gSW4g
b3RoZXIgd29yZHMsIGVmZmVjdGl2ZSB1c2Ugb2YgY29uZGl0aW9uYWwgb3BlcmF0aW9uIGlzCj4g
PiBvbmx5IHBvc3NpYmxlIGlmIGNvbXBpbGVyIGdlbmVyYXRlcyB0aGVzZSBpbnN0cnVjdGlvbnMg
YmFzZWQgb24KPiA+IGNvZGUgcGF0dGVybnMuCj4gPgoKSSB3YXMgY29uZmxhdGluZyBod3Byb2Jl
IHdpdGggaHdjYXAgd2hlbiBJIHdhcyB0aGlua2luZyBhYm91dCB0aGlzLgpIb3dldmVyLCBJIHRo
aW5rIGl0IG1pZ2h0IHN0aWxsIGJlIGJlbmVmaWNpYWwgdG8gc3BsaXQgb3V0IHRoZSB2ZW5kb3IK
ZXh0ZW5zaW9ucy4gSXQgaXMgcG9zc2libGUgZm9yIHZlbmRvcnMgdG8gaW1wbGVtZW50IGVhY2gg
b3RoZXIncwpleHRlbnNpb25zIGJ1dCBJIGRvbid0IGV4cGVjdCB0aGF0IHRvIGJlIHRoZSBhdmVy
YWdlIGNhc2UuIEJlY2F1c2UgSSBkbwpub3QgZXhwZWN0IHRoaXMgdG8gYmUgdGhlIGF2ZXJhZ2Ug
Y2FzZSwgcmlzY3ZfaXNhX2V4dCBiZWNvbWVzIG5lZWRsZXNzbHkKbGFyZ2UgYXMgaXQgaGFzIHRv
IGNvbnRhaW4gdGhlIGV4dGVuc2lvbnMgb2YgZXZlcnkgdmVuZG9yLgoKPiA+ID4KPiA+ID4gVGhp
cyBzY2hlbWUgaGFzIHRoZSBhZGRlZCBiZW5lZml0IHRoYXQgdmVuZG9ycyBkbyBub3QgaGF2ZSB0
byB3b3JyeQo+ID4gPiBhYm91dCBjb25maWN0aW5nIGV4dGVuc2lvbnMsIGFuZCB0aGUga2VybmVs
IGRvZXMgbm90IGhhdmUgdG8gYWN0IGFzIGEKPiA+ID4ga2V5IHJlZ2lzdHJ5IGZvciB2ZW5kb3Jz
Lgo+ID4KPiA+IEhvdyBjYW4gdmVuZG9yIGV4dGVuc2lvbnMgY29uZmxpY3QgaWYgdGhleSBhbGwg
Zm9sbG93IHRoZQo+ID4gIlg8dmVuZG9yX25hbWU+PGV4dGVuc2lvbl9uYW1lPiIgbmFtaW5nIHNj
aGVtZSA/Cj4gPgo+ID4gPgo+ID4gPiBXaGF0IGFyZSB5b3VyIHRob3VnaHRzPwo+ID4gPgo+ID4g
PiAtIENoYXJsaWUKPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMzA3MDUtdGhlYWRfdmVuZG9yX2V4dGVuc2lvbnMtdjEtMi1hZDY5MTUzNDljNGRAcml2b3Np
bmMuY29tLwo+ID4gPgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gCj4gUmVnYXJkcywKPiBB
bnVwCgotIENoYXJsaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
