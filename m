Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBB5CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kauOpaUz91OjuuYG4LxjIDjww6tzBSudy0UFb9bDxTM=; b=DTrJWYQO32Gufs
	jnh4d8v8xjyL145bBeZcJDT4hpqDHClvNWkv3MdfGZ3WFpRs+4/6YLNUCUv17RcNFjYa1HAGfJlBT
	1xqGbk/vXsVy7sy/wjTqzS1V7Jw/H12oUL+WeVrczLVdo2PhpWh8EZqOu8F6Insg9Ev0LZ2t6vm0k
	BHox158t4OC831EyXl8uStVe5mfeRGiAvVfiG0zL4syaNdX+tOq6LJ5nLguo3k/RDPQp80lDGKkDk
	VASnNq1gxqtrZX0pcA02DQr+yqp3FafR8R5B0G+SzDZgxknfgSATvCIlyvk/j3COePAchvoFhOa1Q
	PZyYKuIj8uuHBd7/oe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipjB-001ub5-0q;
	Wed, 20 Sep 2023 05:26:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipj6-001uZU-2d
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:26:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so6015813f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 22:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695187575; x=1695792375; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/hPQ2aul6l5anqC2DYg1b33GU8acR4UMMOAz4f8qXg=;
        b=SFwOPlVLpxliI/2wJlRkvtxNUx/IaTPmos74NztdtoNDlcz6PBkOb2592RRDfQBdnt
         M1UpElAMQISZEAzqnqqRbnuch+jhx6QdmeoL2x57TeLITo3tHjTMZXIRPmIio4u0LhWI
         BDq11cRLKbKZg5Gaqsl0nVQTzv+2gCu4dQZuh99uD5Ei5yj7RWN+duT/5WaMI3wYntUW
         gIn0xGJYVNi6984CSGYpz/JOgKh3gB9bIe8drMaU29kiiufhwhH0GXsbW40ixJSTB5cS
         Pzt+9ymKpCpykbHvnIOsccE3ZIsRxMYjrOIRZdFk7FqqbdczE1YAFKNCvTYWNUCFZC5I
         iesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695187575; x=1695792375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/hPQ2aul6l5anqC2DYg1b33GU8acR4UMMOAz4f8qXg=;
        b=tzccnmMLN6gg2tvO9KN68NJZBoZYHfiLINuK/+2T8xQixo8casMET1da079kC/vuKx
         L/RqGv0zHvsOCgzAm3NUwOKQ022vxVS30JRI8dxWcIf9Ab1IZ7HV70HBXEWe7VAqaNom
         9th0+DygpUfz4lTcKR31l+t/kYFpiCb0MQrWJF/GsmMlx9VClORhYWE5eATBomZ5O2ub
         0MYGhST51Hu5V+Ewe2myQoNXEDnz0MB63Jqf7CRBa4GqBsdBUB8gv/LOLCYFyuOYUeWZ
         2DOFcm1PHwcr6Hly/W/jIsO0SkzhZx0lrScvD0MQ7C+hrfd1jirW+4i6QhsWfvoNDGlT
         tAww==
X-Gm-Message-State: AOJu0YwrO228O9pvzYL4m2eqrPIIUfwmVEoP4/rnOLk+hFmok/abArIm
	DiV0yLDixThC18pY0ef8VXazrw==
X-Google-Smtp-Source: AGHT+IFzgI1qI3qqkSIQbqlVAElk88cX+8fv0gUH+cKvN29I57hXEltVb4ZmH0gDcWJ0gA+gzE05kg==
X-Received: by 2002:adf:dc8f:0:b0:321:5d9f:2d9f with SMTP id r15-20020adfdc8f000000b003215d9f2d9fmr1348682wrj.47.1695187574848;
        Tue, 19 Sep 2023 22:26:14 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g10-20020adff3ca000000b003200c918c81sm9574162wrp.112.2023.09.19.22.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:26:14 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:26:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
Message-ID: <20230920-d9e483ee61b25b834af160bb@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
 <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
 <20230920-bc0e3956d144be651727e252@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920-bc0e3956d144be651727e252@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_222616_856667_C4DD75B7 
X-CRM114-Status: GOOD (  28.91  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMDY6NDg6MTFBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDAxOjEyOjQ3UE0gLTA3MDAsIEF0aXNoIFBh
dHJhIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEN1cnJlbnRs
eSB0aGUgQUlBIE9ORV9SRUcgcmVnaXN0ZXJzIGFyZSByZXBvcnRlZCBieSBnZXQtcmVnLWxpc3QK
PiA+ID4gYXMgbmV3IHJlZ2lzdGVycyBmb3IgdmFyaW91cyB2Y3B1X3JlZ19saXN0IGNvbmZpZ3Mg
d2hlbmV2ZXIgU3NhaWEKPiA+ID4gaXMgYXZhaWxhYmxlIG9uIHRoZSBob3N0IGJlY2F1c2UgU3Nh
aWEgZXh0ZW5zaW9uIGNhbiBvbmx5IGJlCj4gPiA+IGRpc2FibGVkIGJ5IFNtc3RhdGVlbiBleHRl
bnNpb24gd2hpY2ggaXMgbm90IGFsd2F5cyBhdmFpbGFibGUuCj4gPiA+Cj4gPiA+IFRvIHRhY2ts
ZSB0aGlzLCB3ZSBzaG91bGQgZmlsdGVyLW91dCBBSUEgT05FX1JFRyByZWdpc3RlcnMgb25seQo+
ID4gPiB3aGVuIFNzYWlhIGNhbid0IGJlIGRpc2FibGVkIGZvciBhIFZDUFUuCj4gPiA+Cj4gPiA+
IEZpeGVzOiA0NzcwNjkzOThlZDYgKCJLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVn
LWxpc3QgdGVzdCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dl
dC1yZWctbGlzdC5jICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4g
PiA+IGluZGV4IDc2YzBhZDExZTQyMy4uODU5MDdjODZiODM1IDEwMDY0NAo+ID4gPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+ID4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gPiA+
IEBAIC0xMiw2ICsxMiw4IEBACj4gPiA+Cj4gPiA+ICAjZGVmaW5lIFJFR19NQVNLIChLVk1fUkVH
X0FSQ0hfTUFTSyB8IEtWTV9SRUdfU0laRV9NQVNLKQo+ID4gPgo+ID4gPiArc3RhdGljIGJvb2wg
aXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfTUFYXTsKPiA+ID4gKwo+ID4g
PiAgYm9vbCBmaWx0ZXJfcmVnKF9fdTY0IHJlZykKPiA+ID4gIHsKPiA+ID4gICAgICAgICBzd2l0
Y2ggKHJlZyAmIH5SRUdfTUFTSykgewo+ID4gPiBAQCAtNDgsNiArNTAsMTUgQEAgYm9vbCBmaWx0
ZXJfcmVnKF9fdTY0IHJlZykKPiA+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VY
VCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJRkVOQ0VJOgo+ID4gPiAgICAgICAgIGNhc2UgS1ZNX1JF
R19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklIUE06Cj4gPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gKyAgICAgICAvKiBBSUEgcmVnaXN0ZXJzIGFyZSBh
bHdheXMgYXZhaWxhYmxlIHdoZW4gU3NhaWEgY2FuJ3QgYmUgZGlzYWJsZWQgKi8KPiA+ID4gKyAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZN
X1JFR19SSVNDVl9DU1JfQUlBX1JFRyhzaXNlbGVjdCk6Cj4gPiA+ICsgICAgICAgY2FzZSBLVk1f
UkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NS
X0FJQV9SRUcoaXByaW8xKToKPiA+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwg
S1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzIp
Ogo+ID4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NT
Ul9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKHNpZWgpOgo+ID4gPiArICAgICAgIGNh
c2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJ
U0NWX0NTUl9BSUFfUkVHKHNpcGgpOgo+ID4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9D
U1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlw
cmlvMWgpOgo+ID4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJ
U0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlwcmlvMmgpOgo+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGlzYV9leHRfY2FudF9kaXNhYmxlW0tWTV9SSVNDVl9JU0Ff
RVhUX1NTQUlBXSA/IHRydWUgOiBmYWxzZTsKPiA+IAo+ID4gQWhoIEkgZ3Vlc3MuIHlvdSBkbyBu
ZWVkIHRoZSBzd2l0Y2ggY2FzZSBmb3IgQUlBIENTUnMgYnV0IGZvciBJU0EKPiA+IGV4dGVuc2lv
bnMgY2FuIGJlIGF2b2lkZWQgYXMgaXQgaXMgY29udGlndW91cy4KPiAKPiBJIGd1ZXNzIHdlIGNv
dWxkIHNvIHNvbWV0aGluZyBsaWtlCj4gCj4gY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgLi4u
IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX01BWDoKPiAKPiBmb3Ig
dGhlIElTQSBleHRlbnNpb25zLgo+CgpPbiBzZWNvbmQgdGhvdWdodCwgSSB0aGluayBJIGxpa2Ug
dGhlbSBlYWNoIGxpc3RlZCBleHBsaWNpdGx5LiBXaGVuIHdlIGFkZAphIG5ldyBleHRlbnNpb24g
aXQgd2lsbCBzaG93IHVwIGluIHRoZSBuZXcgcmVnaXN0ZXIgbGlzdCwgd2hpY2ggd2lsbCBub3QK
b25seSByZW1pbmQgdXMgdGhhdCBpdCBuZWVkcyB0byBiZSBmaWx0ZXJlZCwgYnV0IGFsc28gdGhh
dCB3ZSBzaG91bGQKcHJvYmFibHkgYWxzbyBjcmVhdGUgYSBzcGVjaWZpYyBjb25maWcgZm9yIGl0
LgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
