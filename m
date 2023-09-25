Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BBCCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4S9gBtCyAmKBv+n5mN2Qq7l0TE5eJnKqpDCH36LSX/o=; b=mC5sX5cpE7gPnX
	teSwbmYipbABwTveH0E9q7iuyZnsNcETDV8F6Eh8aRR4vHuxaSaI3/QM4kooLLFKUAhtvexsO67rN
	U0v1cVF+oHyUbWNvofmjBZGinOkpY5xdB5gcAEFma1RjqBF0f8pnOn58N55jVo6L5zqjxfNAzzuey
	d85kPVtFDCzWRzmCLDEIGugQbYYxokXplUFqQhhNNJEJLU47oJLdN1XZ2biSyaAaq9ttqSF4DMiIM
	kuHtydbjv8UfnTQLrR8j/clGIf+Vh1hluhZGChwzf6ox2mvCL8E1F+QdwbSrTYPt5z20ccoHYusKx
	X77DnqpRgqfU/yrH8fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklfq-00EL5f-0e;
	Mon, 25 Sep 2023 13:30:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklfn-00EL4T-0z
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:30:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-690d9cda925so4704871b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695648648; x=1696253448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTAe+igFn40GXZ4NBAxS7RiCj1q3ukys0lCN9eYvcaY=;
        b=bznOveC1CWUMAEsoRmAVJ099ZzggpVOgBtqyhEXI4a2XZi0XhVFDqDD2XwkK6e6up8
         sKcb+vSqqJxYW4QShuS7IIYpepg9+4CJiq8hhfkphpGXOCShGQo7KcN05eKqhzgODrbO
         HekHA/bAHDZJsbINO/i1PvpP+e/ljF0oKY+q1IDpQ4pox5cg5mtaW177I2BqsriHTLTL
         ZCbLgpLqGFEDdiokMya2UnhEMFcf+R2oSHu7O2+KVaTGxLdlX/xWJpRHjnDKVu8OvQ1+
         mq8FsChyWpmhkJGzJV9YSQ8Xk5lU0g4Tm93azzT/GCbDNRAT+IxNZALL70FHfSjxlER/
         eMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648648; x=1696253448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTAe+igFn40GXZ4NBAxS7RiCj1q3ukys0lCN9eYvcaY=;
        b=NcXvG4AFhKNc2FJNJ6LUber3xWvthYagBvBwhYi7yqhyJb+r8wxJ5V6H18s+KO4waK
         Gw3RwZkM2+aJOSgt2o3gAab3D/0G/nM9d/1EJ7Z84PPZqDWyqx28Qc3ygXqCItjeRDrS
         fG4c1FhR/jeso3FBZLNUtgdW4IEEADlYRhM6G0a6TQbh0Ajrnrd6SMv149Y20lJJHV5P
         D+JONF7wQlnz8rf8HMB5VMPSCE1aIK+mHPlauKm7XgMHvTjbFmKvePcd4vnIlmscQqC9
         H3ML9hKaPah1F1nDTaIzrp+9rdS72qrv1VyUbsfs6VIy9m8tOz9ZYhLwfUycTV1bsJEs
         fb2A==
X-Gm-Message-State: AOJu0YwKlOrOdYBdCMiwsbHGLtXZwMnqpX+Ir0zphQgkQ/vK8juuvHWd
	uhwEU1m67hI+g4u/clzHLQ0WCZV8aBL3n9ibk/vYGA==
X-Google-Smtp-Source: AGHT+IGU7gRk9/0iLRnse7x9jQcD2qTYI6KEpxx8F337G2Vkhth9oLL6ElHvVj6WCup2zLolI768fLqgUgDAY/Hd65U=
X-Received: by 2002:a17:90a:f40e:b0:276:6b9d:7503 with SMTP id
 ch14-20020a17090af40e00b002766b9d7503mr4488656pjb.28.1695648648206; Mon, 25
 Sep 2023 06:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com> <20230919-bbcb3627b6d9d0238c5ba351@fedora>
In-Reply-To: <20230919-bbcb3627b6d9d0238c5ba351@fedora>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Sep 2023 19:00:37 +0530
Message-ID: <CAK9=C2Ub7+4QOdq4rXoSOuLoYaUczeqaLoCVRZ_63dZOZwiu1w@mail.gmail.com>
Subject: Re: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
To: Conor Dooley <conor@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063051_346364_B2C1ADA9 
X-CRM114-Status: GOOD (  21.75  )
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

T24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMTI6NTbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEFudXAsCj4KPiBPbiBUdWUsIFNlcCAxOSwgMjAyMyBh
dCAwOToyMzozN0FNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gVGhlIFZleXJvbi1WMSBD
UFUgc3VwcG9ydHMgY3VzdG9tIGNvbmRpdGlvbmFsIGFyaXRobWV0aWMgYW5kCj4gPiBjb25kaXRp
b25hbC1zZWxlY3QvbW92ZSBvcGVyYXRpb25zIHJlZmVycmVkIHRvIGFzIFhWZW50YW5hQ29uZE9w
cwo+ID4gZXh0ZW5zaW9uLiBJbiBmYWN0LCBRRU1VIFJJU0MtViBhbHNvIGhhcyBzdXBwb3J0IGZv
ciBlbXVsYXRpbmcKPiA+IFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24uCj4gPgo+ID4gTGV0IHVz
IGRldGVjdCBYVmVudGFuYUNvbmRPcHMgZXh0ZW5zaW9uIGZyb20gSVNBIHN0cmluZyBhdmFpbGFi
bGUKPiA+IHRocm91Z2ggRFQgb3IgQUNQSS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA3ICsrKysrKysKPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBpbmRleCAzNmZmNjc0OWZiYmEuLmNhZDhlZjY4ZWNhNyAx
MDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IEBAIC0xNzEsNiArMTcxLDEzIEBAIHByb3BlcnRp
ZXM6Cj4gPiAgICAgICAgICAgICAgbWVtb3J5IHR5cGVzIGFzIHJhdGlmaWVkIGluIHRoZSAyMDE5
MTIxMyB2ZXJzaW9uIG9mIHRoZSBwcml2aWxlZ2VkCj4gPiAgICAgICAgICAgICAgSVNBIHNwZWNp
ZmljYXRpb24uCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDogeHZlbnRhbmFjb25kb3BzCj4gPiAr
ICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgICAgICAgVGhlIFZlbnRhbmEgc3Bl
Y2lmaWMgWFZlbnRhbmFDb25kT3BzIGV4dGVuc2lvbiBmb3IgY29uZGl0aW9uYWwKPiA+ICsgICAg
ICAgICAgICBhcml0aG1ldGljIGFuZCBjb25kaXRpb25hbC1zZWxlY3QvbW92ZSBvcGVyYXRpb25z
IGRlZmluZWQgYnkgdGhlCj4gPiArICAgICAgICAgICAgVmVudGFuYSBjdXN0b20gZXh0ZW5zaW9u
cyBzcGVjaWZpY2F0aW9uIHYxLjAuMSAob3IgaGlnaGVyKSBhdAo+ID4gKyAgICAgICAgICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS92ZW50YW5hbWljcm8vdmVudGFuYS1jdXN0b20tZXh0ZW5zaW9ucy9y
ZWxlYXNlcy4KPiA+ICsKPgo+IEZvciB0aGlzIGFuZCB0aGUgbmV4dCBwYXRjaCwgdGhlIGJpbmRp
bmcgY2hhbmdlIG5lZWRzIHRvIGJlIHNwbGl0IG91dAo+IGZyb20gdGhlIGNvZGUuIGNoZWNrcGF0
Y2ggc2hvdWxkJ3ZlIGNvbXBsYWluZWQgYWJvdXQgaXQuCgpPa2F5LCBJIHdpbGwgc3BsaXQgdGhp
cyBwYXRjaC4KCj4KPiA+ICAgICAgICAgIC0gY29uc3Q6IHpiYQo+ID4gICAgICAgICAgICBkZXNj
cmlwdGlvbjogfAo+ID4gICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaYmEgYml0LW1hbmlwdWxh
dGlvbiBleHRlbnNpb24gZm9yIGFkZHJlc3MgZ2VuZXJhdGlvbgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaAo+ID4gaW5kZXggMGY1MjBmN2QwNThhLi5iN2VmZTllMmZhODkgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+ID4gQEAgLTU5LDYgKzU5LDcgQEAKPiA+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWklGRU5DRUkgICAgICAgICAgICAgICA0MQo+ID4gICNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aSUhQTSAgICAgICAgICA0Mgo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTVNUQVRF
RU4gICAgICAgICAgICAgIDQzCj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hWRU5UQU5BQ09O
RE9QUyAgICAgICAgNDQKPiA+Cj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAgICAg
ICAgIDY0Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggMzc1NWE4YzJhOWRl
Li4zYTMxZDM0ZmU3MDkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTE4
Miw2ICsxODIsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9l
eHRbXSA9IHsKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lT
QV9FWFRfU1ZJTlZBTCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdm5hcG90LCBS
SVNDVl9JU0FfRVhUX1NWTkFQT1QpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Zw
Ym10LCBSSVNDVl9JU0FfRVhUX1NWUEJNVCksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFU
QSh4dmVudGFuYWNvbmRvcHMsIFJJU0NWX0lTQV9FWFRfWFZFTlRBTkFDT05ET1BTKSwKPgo+IEkn
dmUgYmVlbiBiYW5naW5nIG9uIGZvciBhIGJpdCBhYm91dCBwZW9wbGUgZG9pbmcgd2VpcmQgc3R1
ZmYgdG8gZGV0ZWN0Cj4gdGhlaXIgdmVuZG9yIGV4dGVuc2lvbnMsIHNvIG5pY2UgdG8gc2VlIGl0
IGJlaW5nIGRvbmUgcHJvcGVybHkgOikKPgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgo+Cj4gPiAgfTsK
PiA+Cj4gPiAgY29uc3Qgc2l6ZV90IHJpc2N2X2lzYV9leHRfY291bnQgPSBBUlJBWV9TSVpFKHJp
c2N2X2lzYV9leHQpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KClJlZ2FyZHMsCkFudXAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
