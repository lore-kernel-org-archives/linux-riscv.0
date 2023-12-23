Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83941C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHmV1KROqKV2Kyc1ZGtZE9i6ZgMN6GrWvcHjE++8SDk=; b=FCnXQrbA/+LCww
	7A529wnEAocNGfQMCc43Pwt13ptTSHiWE0BgmldaOfjFqyuBb47IOVEoiljlwh4LVprjSm1crUEre
	U834veBpeWf4KI/BJjpG9R6u6NtCIYxj+2uWZzyxdgJCYzg5tK4xbICUcpLjZ2VNrfANyVmdUqXBQ
	YBe0mnJIk0QUnjC8EcaxXzIQOYpVpQDEiPMd61CQ09wK+Rj0zTJCbo5VO1xoMmnYwcIOMWVmP/Xh0
	QY3aSCyL82SrP3wEHGSuhMRpMKJGUBr0a4W912CYAZR4ccxADhurzyzmiXsCPEmsT0RdM/veY3sKj
	cX9dtH8744lvHTnvjnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtQ3-007KAl-0O;
	Sat, 23 Dec 2023 04:15:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtQ0-007KA1-0n
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:15:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40d490a1936so9811035e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703304917; x=1703909717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkfSo8ZTFHLoFLmvhQ6WyvO6NSzYvB7Vfz6jJY7OI8E=;
        b=RKOmgNqUAiauMmwB4mN2ObeZiFP4/Y3Bmorqf8GfCohlgx80Z4l1XIviqs5zEBsfaH
         2fg5L3ACSqbBYcTHhn9yBxAA+9u44X5Dx2YJNHBt2EJAcQT4pEhEVe01CQjcZdA9KbJ/
         52SVMqw3PxEwykvpZw8OBiovcrgt7B5L+1Hx1HtH8fV8Te9OnbR9k3THHBwEk6/aVNR0
         SJsJv93kg0cegUOqolktDCgqqWVVzNvDr7+VfXlv7MwrQvH30xx+A/90bCqV5XKqXJ/d
         Gkfl8MyXSJwT8WXW+BvSAm/nOhEVPYFPv/tztE1v/8QfPLgn6x82C2NgM7GeZkV1NRsC
         cCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703304917; x=1703909717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkfSo8ZTFHLoFLmvhQ6WyvO6NSzYvB7Vfz6jJY7OI8E=;
        b=Myn53SbUPUiA5LBdwhmQe5Q0Vz9Nc6pZXGlxipTSwEXp360fvKgONdU4V96ailNCNQ
         uyBj9rnhCgV2Orb+7nvFlcbtOPrFk1GnXz6JcEa1kXp1njLiR15mY2CBZkLFlblzSBB4
         DEN02XhfmHls0/4W4c6oXBg5zJM+ZBePpni4S94QjGL38On4NEWZzLJW8YEc6swWJqYb
         r7Q/6HL38u7DK1L3vSw0UUQMIgzZ1ctS5wC9GQ1xY8VEvi8B50t7nXBesCWL5k18ATCR
         o7OWeklPDw5n0NHoimRBv3pW8T54DZqoUtOgG0Ovujp4+a05s9dDVDU2pvz3T4O3HLWd
         6ABg==
X-Gm-Message-State: AOJu0YyxT0+B7cP/XeH12LFA1rvcocvxY2Yi1J/tbqs1Ords51r3L3oP
	XOZT1gT0sB+NJbeRqKJXAZckuEqEvo/6FTVgusVA1i18GRZ7AA==
X-Google-Smtp-Source: AGHT+IGaYGYDyJONneRP0Uzt2aGrgYnVBE/mhONMmNVoQkuHi7atohlfvV19NWg29CRxdGSdP2laoTU53gWTjTUIIQ0=
X-Received: by 2002:a05:600c:3147:b0:40c:53c2:d7f7 with SMTP id
 h7-20020a05600c314700b0040c53c2d7f7mr623972wmo.114.1703304917448; Fri, 22 Dec
 2023 20:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-3-leobras@redhat.com>
 <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com> <ZYXDdlF1CFNpDdiV@LeoBras>
In-Reply-To: <ZYXDdlF1CFNpDdiV@LeoBras>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 23 Dec 2023 12:15:06 +0800
Message-ID: <CABgGipWmidzhf3PqyK9FWQCmKAuS9H31XECTL5XYjSL5m1Es4g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] riscv: add compile-time test into is_compat_task()
To: Leonardo Bras <leobras@redhat.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Oleg Nesterov <oleg@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Greg Ungerer <gerg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_201520_333931_55C1D3FA 
X-CRM114-Status: GOOD (  27.90  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMToxMuKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAwNTozNToyMFBN
ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgNTowMuKA
r1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEN1cnJlbnRseSBzZXZlcmFsIHBsYWNlcyB3aWxsIHRlc3QgZm9yIENPTkZJR19DT01QQVQgYmVm
b3JlIHRlc3RpbmcKPiA+ID4gaXNfY29tcGF0X3Rhc2soKSwgcHJvYmFibHkgaW4gb3JkZXIgdG8g
YXZvaWQgYSBydW4tdGltZSB0ZXN0IGludG8gdGhlIHRhc2sKPiA+ID4gc3RydWN0dXJlLgo+ID4g
Pgo+ID4gPiBTaW5jZSBpc19jb21wYXRfdGFzaygpIGlzIGFuIGlubGluZWQgZnVuY3Rpb24sIGl0
IHdvdWxkIGJlIGhlbHBmdWwgdG8gYWRkIGEKPiA+ID4gY29tcGlsZS10aW1lIHRlc3Qgb2YgQ09O
RklHX0NPTVBBVCwgbWFraW5nIHN1cmUgaXQgYWx3YXlzIHJldHVybnMgemVybyB3aGVuCj4gPiA+
IHRoZSBvcHRpb24gaXMgbm90IGVuYWJsZWQgZHVyaW5nIHRoZSBrZXJuZWwgYnVpbGQuCj4gPiA+
Cj4gPiA+IFdpdGggdGhpcywgdGhlIGNvbXBpbGVyIGlzIGFibGUgdG8gdW5kZXJzdGFuZCBpbiBi
dWlsZC10aW1lIHRoYXQKPiA+ID4gaXNfY29tcGF0X3Rhc2soKSB3aWxsIGFsd2F5cyByZXR1cm4g
MCwgYW5kIG9wdGltaXplLW91dCBzb21lIG9mIHRoZSBleHRyYQo+ID4gPiBjb2RlIGludHJvZHVj
ZWQgYnkgdGhlIG9wdGlvbi4KPiA+ID4KPiA+ID4gVGhpcyB3aWxsIGFsc28gYWxsb3cgcmVtb3Zp
bmcgYSBsb3QgI2lmZGVmcyB0aGF0IHdlcmUgaW50cm9kdWNlZCwgYW5kIG1ha2UKPiA+ID4gdGhl
IGNvZGUgbW9yZSBjbGVhbi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZG8gQnJh
cyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY29tcGF0LmggICAgfCAzICsrKwo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
bGYuaCAgICAgICB8IDQgLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggICB8IDYgLS0tLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
IHwgNCArKy0tCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NvbXBhdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+ID4gPiBpbmRleCAy
YWM5NTViNTExNDhmLi45MTUxN2I1MWI4ZTI3IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y29tcGF0LmgKPiA+ID4gQEAgLTE0LDYgKzE0LDkgQEAKPiA+ID4KPiA+ID4gIHN0YXRpYyBpbmxp
bmUgaW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4gPiA+ICB7Cj4gPiA+ICsgICAgICAgaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19DT01QQVQpKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPiA+ICsKPiA+ID4gICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQp
Owo+ID4gPiAgfQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9lbGYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiA+ID4gaW5kZXggNTlhMDgz
NjdmZGRkNy4uMmU4ODI1N2NhZmFlYSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9lbGYuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4g
PiA+IEBAIC01MywxMyArNTMsOSBAQCBleHRlcm4gYm9vbCBjb21wYXRfZWxmX2NoZWNrX2FyY2go
RWxmMzJfRWhkciAqaGRyKTsKPiA+ID4gICNkZWZpbmUgRUxGX0VUX0RZTl9CQVNFICAgICAgICAg
ICAgICAgICgoREVGQVVMVF9NQVBfV0lORE9XIC8gMykgKiAyKQo+ID4gPgo+ID4gPiAgI2lmZGVm
IENPTkZJR182NEJJVAo+ID4gPiAtI2lmZGVmIENPTkZJR19DT01QQVQKPiA+ID4gICNkZWZpbmUg
U1RBQ0tfUk5EX01BU0sgICAgICAgICAoaXNfY29tcGF0X3Rhc2soKSA/IFwKPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg3ZmYgPj4gKFBBR0VfU0hJRlQgLSAxMikgOiBc
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4M2ZmZmYgPj4gKFBBR0Vf
U0hJRlQgLSAxMikpCj4gPiA+IC0jZWxzZQo+ID4gPiAtI2RlZmluZSBTVEFDS19STkRfTUFTSyAg
ICAgICAgICgweDNmZmZmID4+IChQQUdFX1NISUZUIC0gMTIpKQo+ID4gPiAtI2VuZGlmCj4gPiA+
ICAjZW5kaWYKPiA+ID4KPiA+ID4gIC8qCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
PiA+IGluZGV4IDFkNDcyYjMxZTBjZmUuLmVhNWIyNjliZTIyM2EgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+IEBAIC0xMjcsMTYgKzEyNywxMCBAQAo+ID4gPiAg
I2RlZmluZSBWQV9VU0VSX1NWNDggKFVMKDEpIDw8IChWQV9CSVRTX1NWNDggLSAxKSkKPiA+ID4g
ICNkZWZpbmUgVkFfVVNFUl9TVjU3IChVTCgxKSA8PCAoVkFfQklUU19TVjU3IC0gMSkpCj4gPiA+
Cj4gPiA+IC0jaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4gPiAgI2RlZmluZSBNTUFQX1ZBX0JJVFNf
NjQgKChWQV9CSVRTID49IFZBX0JJVFNfU1Y0OCkgPyBWQV9CSVRTX1NWNDggOiBWQV9CSVRTKQo+
ID4gPiAgI2RlZmluZSBNTUFQX01JTl9WQV9CSVRTXzY0IChWQV9CSVRTX1NWMzkpCj4gPiA+ICAj
ZGVmaW5lIE1NQVBfVkFfQklUUyAoaXNfY29tcGF0X3Rhc2soKSA/IFZBX0JJVFNfU1YzMiA6IE1N
QVBfVkFfQklUU182NCkKPiA+ID4gICNkZWZpbmUgTU1BUF9NSU5fVkFfQklUUyAoaXNfY29tcGF0
X3Rhc2soKSA/IFZBX0JJVFNfU1YzMiA6IE1NQVBfTUlOX1ZBX0JJVFNfNjQpCj4gPiA+IC0jZWxz
ZQo+ID4gPiAtI2RlZmluZSBNTUFQX1ZBX0JJVFMgKChWQV9CSVRTID49IFZBX0JJVFNfU1Y0OCkg
PyBWQV9CSVRTX1NWNDggOiBWQV9CSVRTKQo+ID4gPiAtI2RlZmluZSBNTUFQX01JTl9WQV9CSVRT
IChWQV9CSVRTX1NWMzkpCj4gPiA+IC0jZW5kaWYgLyogQ09ORklHX0NPTVBBVCAqLwo+ID4gPiAt
Cj4gPiA+ICAjZWxzZQo+ID4gPiAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLTMyLmg+Cj4gPiA+ICAj
ZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAo+ID4gPiBpbmRleCBmMTlmODYxY2RhNTQ5Li5lZDMyZTUzZTU1OTk5IDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ID4gQEAgLTIyLDcgKzIyLDcgQEAKPiA+
ID4gICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIG1tYXBfZW5kOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAgICAgICB0eXBlb2YoYWRkcikgX2Fk
ZHIgPSAoYWRkcik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gLSAgICAgICBp
ZiAoKF9hZGRyKSA9PSAwIHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlzX2NvbXBh
dF90YXNrKCkpKSBcCj4gPiA+ICsgICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCBpc19jb21wYXRf
dGFzaygpKSAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgICAgICAgICBtbWFwX2Vu
ZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgICAg
ZWxzZSBpZiAoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ICAgICAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiA+IEBAIC0zOSw3ICszOSw3IEBACj4gPiA+ICAgICAgICAgdHlw
ZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ICAgICAgICAgdHlwZW9mKGJhc2UpIF9iYXNlID0gKGJhc2UpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBybmRfZ2FwID0gREVGQVVM
VF9NQVBfV0lORE9XIC0gKF9iYXNlKTsgICBcCj4gPiA+IC0gICAgICAgaWYgKChfYWRkcikgPT0g
MCB8fCAoSVNfRU5BQkxFRChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+
ID4gPiArICAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgaXNfY29tcGF0X3Rhc2soKSkgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgICAgICAgICAgbW1hcF9iYXNlID0gKF9iYXNlKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgIGVsc2UgaWYgKCgoX2Fk
ZHIpID49IFZBX1VTRVJfU1Y1NykgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjU3KSkgXAo+ID4g
PiAgICAgICAgICAgICAgICAgbW1hcF9iYXNlID0gVkFfVVNFUl9TVjU3IC0gcm5kX2dhcDsgICAg
ICAgICAgICAgXAo+ID4gPiAtLQo+ID4gPiAyLjQzLjAKPiA+ID4KPiA+IFJldmlld2VkLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPgo+IFRoYW5rcyEKPiBMZW8KPgo+ID4KPiA+IC0t
Cj4gPiBCZXN0IFJlZ2FyZHMKPiA+ICBHdW8gUmVuCj4gPgo+CgpSZXZpZXdlZC1ieTogQW5keSBD
aGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
