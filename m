Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96208CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3jlPAjaL/DM7PfjZmaRviPyZoSy75zW4BsdNy7Lu7o=; b=L7mdABshSlZiP5
	LUK4nrDcATe+T1BaX/qkGhU7JY7OLvJSGh+LD/RYmWEAtj/fqaYHdaRbOWIni8HMJ1241kc/nVnV/
	4UJxIsJUfCWsJdNtHNnETM72/8nEFRgB+VhhJ0yGrWiXMvRhvjgGjxpd0cG5z+6rTXP+8SPVWNvsL
	eIlQs/OGnupl+VrZdnihUSWk+HAQhTxBZiY8PMRK05c4ZjMIa/1/gvySw/b1CZgiUScYMpxyWMN0E
	zsFHWsShz2OVwEQUmX6i9HqyrSReufvdq4ewxvm2J28bqmNtP1BA9SGm7wOlKEDTMA3t3w153EhF3
	bEFn0BHa4apfmBZp9sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qioDx-001lCl-0y;
	Wed, 20 Sep 2023 03:50:01 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qioDu-001lAs-0D
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 03:49:59 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1a28de15c8aso4102615fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695181792; x=1695786592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcEmXd6qxRcs3BYgRhvSX8w5LurG2MJXEE/HzYLhdCo=;
        b=e6lMCuorsHjhIXUglCAxUDx1ObDAlLBGi78OYEMOUAUsDTuMVWII4A1Ac1L0+BgcJm
         YWYlfJHOZUo1C96cN6YTnIOj59yl5BoeyLxltvYPaT5NWimMfk86orUbURWyN3lFg6tv
         lV/dAnB1FsY4n3/d8NIHK03cdYEcnSyEJ5Chr+NXALbtdPsMLtGGLvbU/KiulWBWZ9AA
         WyybVgvYJoVBAShQALBwcV3dtrXNY+WmgLGh4f1CSyyTfSA1exUwVJge+qDS7tJvq7yp
         qe989WTmvIXSSjHjZtcxdtot0BnpcPhj0SIi1HiJCjutxf7igbRnjSARv3Uvr+kUjU74
         mnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695181792; x=1695786592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcEmXd6qxRcs3BYgRhvSX8w5LurG2MJXEE/HzYLhdCo=;
        b=XD2C1PxefcChrAiX/MYyb9+WNjePxf9jRb/YAYHvzYdSFPeM0VDm9XvfskV6ezrq30
         XCY1PF9sQCCG52oLgUw6w9j/HTOMxIZtPaY5lLlcempuQdUau9JHwbxVG0mSL3kAtl5y
         MpHdDfgMcXUBX5A8n2krMzr19HQqGykwnfIDEJYMflbwZHsDOINr5iGsC6pbbi28rldu
         Og3eabGmexUxAGA5upmo+QgGrNiANNeFpU0E6v7DZ2XlhsVuBnMBSEo6c3jR7ymkAnPn
         T5KvfIl15hz3eL5xy4CuSU+0X13yYjj7q8Acc1Y3e/Tgw3RWwRLtdpmMtli3fCDo1trO
         JJFg==
X-Gm-Message-State: AOJu0YzMa05moQc2x4Qr3bZoVX57zSqujOVsW4TNN0X0NLoN/Lws50h4
	+YdAG4LcLPHfcP1q31RzS+vxxbXNs8u/hp7Ciosk9g==
X-Google-Smtp-Source: AGHT+IFC5ykJgzdPO9/UQTCMkpj4OyxzDmF9fA+W3DMpI1p6hqTk51dYch5UuKxCSpy3G5X1DAv0m0wwAcs8ZpjrXNo=
X-Received: by 2002:a05:6870:6122:b0:1d6:ef37:9416 with SMTP id
 s34-20020a056870612200b001d6ef379416mr1495389oae.22.1695181792271; Tue, 19
 Sep 2023 20:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230915082701.3643-1-yongxuan.wang@sifive.com>
 <20230915082701.3643-2-yongxuan.wang@sifive.com> <20230915-triangle-fool-e7032469d3e1@wendy>
In-Reply-To: <20230915-triangle-fool-e7032469d3e1@wendy>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 20 Sep 2023 11:49:41 +0800
Message-ID: <CAMWQL2jTbYDSD3y8R8fFORH2AL+1C25N+fNn7kmfc2jAZJKbeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Detect and Enable Svadu Extension Support
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_204958_107019_1E10DB49 
X-CRM114-Status: GOOD (  20.36  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCA0OjQ14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAxNSwg
MjAyMyBhdCAwODoyNjo1N0FNICswMDAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IFdlIGRl
dGVjdCBTdmFkdSBleHRlbnNpb24gc3VwcG9ydCBmcm9tIERUQiBhbmQgYWRkIGFyY2hfaGFzX2h3
X3B0ZV95b3VuZygpCj4gPiB0byBlbmFibGUgb3B0aW1pemF0aW9uIGluIE1HTFJVIGFuZCBfX3dw
X3BhZ2VfY29weV91c2VyKCkgaWYgU3ZhZHUKPiA+IGV4dGVuc2lvbiBpcyBhdmFpbGFibGUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmlueXUgVGFuZyA8dGp5dGltaUAxNjMuY29tPgo+Cj4gWW91
J3JlIGVpdGhlciBtaXNzaW5nIGEgRnJvbTogb3IgYSBDby1kZXZlbG9wZWQtYnk6IHRhZyBoZXJl
Lgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZp
dmUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgfCAx
ICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICB8IDEgKwo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNiArKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgICB8IDEgKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gPiBpbmRleCA3NzdjYjgyOTk1NTEuLjEw
NjQ4YjM3MmEyYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+IEBAIC0xOTQsNiArMTk0
LDcgQEAKPiA+ICAvKiB4RU5WQ0ZHIGZsYWdzICovCj4gPiAgI2RlZmluZSBFTlZDRkdfU1RDRSAg
ICAgICAgICAgICAgICAgIChfQUMoMSwgVUxMKSA8PCA2MykKPiA+ICAjZGVmaW5lIEVOVkNGR19Q
Qk1URSAgICAgICAgICAgICAgICAgKF9BQygxLCBVTEwpIDw8IDYyKQo+ID4gKyNkZWZpbmUgRU5W
Q0ZHX0hBREUgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgNjEpCj4gPiAgI2RlZmlu
ZSBFTlZDRkdfQ0JaRSAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IDcpCj4gPiAgI2Rl
ZmluZSBFTlZDRkdfQ0JDRkUgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IDYpCj4gPiAg
I2RlZmluZSBFTlZDRkdfQ0JJRV9TSElGVCAgICAgICAgICAgIDQKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmgKPiA+IGluZGV4IGI3YjU4MjU4ZjZjNy4uMTAxMzY2MWQ2NTE2IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBAIC01OCw2ICs1OCw3IEBACj4gPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pJQ1NSICAgICAgICAgIDQwCj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJ
RkVOQ0VJICAgICAgICAgICAgICAgNDEKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklIUE0g
ICAgICAgICAgNDIKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1ZBRFUgICAgICAgICAgNDMK
PiA+Cj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAgICAgICAgIDY0Cj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IGIyYmEzZjc5Y2ZlOS4uZjNkMDc3ZGZm
OGFjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtNjI5LDYgKzYy
OSwxMiBAQCBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF93cml0ZWNvbWJpbmUocGdwcm90
X3QgX3Byb3QpCj4gPiAgICAgICByZXR1cm4gX19wZ3Byb3QocHJvdCk7Cj4gPiAgfQo+ID4KPiA+
ICsjZGVmaW5lIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyBhcmNoX2hhc19od19wdGVfeW91bmcKPiA+
ICtzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKHZvaWQpCj4gPiArewo+
ID4gKyAgICAgcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRf
U1ZBRFUpOwo+Cj4gTm8gaGFyZHdhcmUgY3VycmVudGx5IGhhcyB0aGlzLCB3aHkgaXMgaXQgbGlr
ZWx5Pwo+Cj4gPiArfQo+ID4gKwo+ID4gIC8qCj4gPiAgICogVEhQIGZ1bmN0aW9ucwo+ID4gICAq
Lwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggMWNmYmJhNjVkMTFhLi5lYWQzNzhj
MDQ5OTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTE3OCw2ICsxNzgs
NyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsK
PiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlB
KSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhU
X1NTQ09GUE1GKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzdGMsIFJJU0NWX0lT
QV9FWFRfU1NUQyksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmFkdSwgUklTQ1Zf
SVNBX0VYVF9TVkFEVSksCj4KPiBUaGlzIG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQgaW4gcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sLgo+CgpUaGFuayB5b3UhIEkgd2lsbCB1cGRhdGUgdGhlc2UgaW4gdjIg
cGF0Y2guCgpSZWdhcmRzLApZb25nLVh1YW4KCj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4gPiAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpLAo+
ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZuYXBvdCwgUklTQ1ZfSVNBX0VYVF9TVk5B
UE9UKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2cGJtdCwgUklTQ1ZfSVNBX0VY
VF9TVlBCTVQpLAo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
