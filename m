Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA0C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHWXc6XYzMeWv5opOlFpHJ7Sj+Q9HrmPbiUtQf9hp00=; b=Td0YpOdXUOeIea
	p7H8RGUACBxOITFOAYliW3g7jkJdd8n6eIVdHFuWaEiKuXPCsiF6uK0AVmTdeUeoPy9QdcqOq264V
	IRlwIxR+J3io542XKt14Yu+HumCg/cK1yDR3zhqOfAl3xAVmy/3mV9SUa1YJBFjYHwYJd1WUyua/k
	PoI9R5JHkDcqB9Rwmy7uxTvglTht2YhqXHhcQvi/nTA7K6w/yWmPHmB8lC1wdsXuqb+Fk4H5cMTKd
	Lh48ioC/M+yCSFnGlxhOxka68cshk3DulrTIP94pL/Kd68urPM3xJuxUJrzVL1ff23rbTHsK1+4/d
	amgHWrZJeWN8aS3ORAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ma9-008c1V-5t; Thu, 01 Dec 2022 16:38:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mZx-008buc-Q2
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:38:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id w129so2373800pfb.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 08:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wz5UjU3Ma0W7cBTZ/63jSNwcUzSf/RN7ETO0YflOK9Q=;
        b=L5oONEpJeyYInhCN8kEGfJ8WS2VPlfmSQI0EIRyACnSb62Ho4uiLAZ+22FZ0LpKSBY
         OanLGdeorUn/O6YHVn5BHqcWoMtKOfzbPKcz+4fsn48JXXYOuwBU81HsoXu4yIA+KxBs
         oNf69ULLkYXBFawHATlUKtmTRlCCGuue7O3x4Uj20kNa312jwW6CLd6dDy2pzPGk3DaL
         y4jm5SpqWS/wMH/C2TjT2ihvVuFcoRw2TnuuxPCYPfzDwkDLPEA8hE11/Idhqhxr7xt0
         rj/FXhrQIb1ypgd2I2CBp8L/oyRKWO3NUq8Jq7LgrgnoUKAu1/kU3hKmcHIeaOcvmDNO
         M6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wz5UjU3Ma0W7cBTZ/63jSNwcUzSf/RN7ETO0YflOK9Q=;
        b=cpa+s42+Wh3mXXJMDeyx09CNSAEjI9PYX1OIW8qyFHY9EIsu/60CQvl2Ux5UOaWNjz
         YHTBRQsFipHvuUJtVT4nZ4bP+APIdpLW+yg9hj732QcuHJxxKHjpA3bobR6XHPU0+eVR
         l/sSFKmclH3fry/UOOuLuCyDKd6rgDoSEUFI9j6eRgrER4gxDit5bEbLz2dF281Meg2X
         Q6n4ju2ClimCqTh2ELnHSQiOvmDUaW0rAv+FwBkKiErmio4xr6tNPrUwVJNOxf2uUq4d
         VpOd8yl6XCfNFyY+cfT/6K5aNzc91a9qhbcPxgKQ21QRo5f3ptefYmMyJcsRHyWBR6Qe
         HUSg==
X-Gm-Message-State: ANoB5pn8CISRmV/lQt2cfe16ks1I2ULoco9NH6UdIwAPtGjI3iZxMF/l
	Q35/exhfL46hMX4I32MVCxUN8A==
X-Google-Smtp-Source: AA0mqf7E8VTs9g+yA9GqMgTdFbO4YLYoa36a9KLdCj074cztIQB7gniXVzh1et27ldGMC17rtCxmqQ==
X-Received: by 2002:aa7:8512:0:b0:575:65ff:8831 with SMTP id v18-20020aa78512000000b0057565ff8831mr16235817pfn.80.1669912703144;
        Thu, 01 Dec 2022 08:38:23 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm5118172pjf.17.2022.12.01.08.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:38:22 -0800 (PST)
Date: Thu, 1 Dec 2022 16:38:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check to
 module init
Message-ID: <Y4jXuh4P9Oibki6W@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
 <87cz93snqc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cz93snqc.fsf@mpe.ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_083829_875644_5898AB9F 
X-CRM114-Status: GOOD (  33.65  )
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

T24gVGh1LCBEZWMgMDEsIDIwMjIsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6Cj4gU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKPiA+IE1vdmUgS1ZNIFBQQydz
IGNvbXBhdGliaWxpdHkgY2hlY2tzIHRvIHRoZWlyIHJlc3BlY3RpdmUgbW9kdWxlX2luaXQoKQo+
ID4gaG9va3MsIHRoZXJlJ3Mgbm8gbmVlZCB0byB3YWl0IHVudGlsIEtWTSdzIGNvbW1vbiBjb21w
YXQgY2hlY2ssIG5vciBpcwo+ID4gdGhlcmUgYSBuZWVkIHRvIHBlcmZvcm0gdGhlIGNoZWNrIG9u
IGV2ZXJ5IENQVSAocHJvdmlkZWQgYnkgY29tbW9uIEtWTSdzCj4gPiBob29rKSwgYXMgdGhlIGNv
bXBhdGliaWxpdHkgY2hlY2tzIG9wZXJhdGUgb24gZ2xvYmFsIGRhdGEuCj4gPgo+ID4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vY3B1dGFibGUuaDogZXh0ZXJuIHN0cnVjdCBjcHVfc3BlYyAq
Y3VyX2NwdV9zcGVjOwo+ID4gICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szcy5jOiByZXR1cm4gMAo+
ID4gICBhcmNoL3Bvd2VycGMva3ZtL2U1MDAuYzogc3RyY21wKGN1cl9jcHVfc3BlYy0+Y3B1X25h
bWUsICJlNTAwdjIiKQo+ID4gICBhcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5jOiBzdHJjbXAoY3Vy
X2NwdV9zcGVjLT5jcHVfbmFtZSwgImU1MDBtYyIpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cmNtcChjdXJfY3B1X3NwZWMtPmNwdV9uYW1lLCAiZTU1MDAiKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJjbXAoY3VyX2NwdV9zcGVjLT5jcHVfbmFtZSwgImU2
NTAwIikKPiAKPiBJJ20gbm90IHN1cmUgdGhhdCBvdXRwdXQgaXMgcmVhbGx5IHVzZWZ1bCBpbiB0
aGUgY2hhbmdlIGxvZyB1bmxlc3MgeW91Cj4gZXhwbGFpbiBtb3JlIGFib3V0IHdoYXQgaXQgaXMu
CgpBZ3JlZWQsIEkgZ290IGxhenkuICBJJ2xsIHdyaXRlIGEgcHJvcGVyIGRlc2NyaXB0aW9uLgog
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYyBiL2FyY2gvcG93ZXJw
Yy9rdm0vZTUwMG1jLmMKPiA+IGluZGV4IDU3ZTBhZDZhMmNhMy4uNzk1NjY3ZjdlYmYwIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYwo+ID4gKysrIGIvYXJjaC9wb3dl
cnBjL2t2bS9lNTAwbWMuYwo+ID4gQEAgLTM4OCw2ICszODgsMTAgQEAgc3RhdGljIGludCBfX2lu
aXQga3ZtcHBjX2U1MDBtY19pbml0KHZvaWQpCj4gPiAgewo+ID4gIAlpbnQgcjsKPiA+ICAKPiA+
ICsJciA9IGt2bXBwY19lNTAwbWNfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCgpOwo+ID4gKwlpZiAo
cikKPiA+ICsJCXJldHVybiBrdm1wcGNfZTUwMG1jOwo+ICAKPiBUaGlzIGRvZXNuJ3QgYnVpbGQ6
Cj4gCj4gbGludXgvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYzogSW4gZnVuY3Rpb24g4oCYa3Zt
cHBjX2U1MDBtY19pbml04oCZOgo+IGxpbnV4L2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmM6Mzkx
OjEzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYa3ZtcHBjX2U1
MDBtY19jaGVja19wcm9jZXNzb3JfY29tcGF04oCZOyBkaWQgeW91IG1lYW4g4oCYa3ZtcHBjX2Nv
cmVfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4gICAzOTEgfCAgICAgICAgIHIgPSBrdm1wcGNfZTUwMG1jX2NoZWNrX3By
b2Nlc3Nvcl9jb21wYXQoKTsKPiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAga3ZtcHBjX2NvcmVfY2hl
Y2tfcHJvY2Vzc29yX2NvbXBhdAo+IGxpbnV4L2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmM6Mzkz
OjI0OiBlcnJvcjog4oCYa3ZtcHBjX2U1MDBtY+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4g
dGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhrdm1fb3BzX2U1MDBtY+KAmT8KPiAgIDM5
MyB8ICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtcHBjX2U1MDBtYzsKPiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICBrdm1fb3BzX2U1MDBtYwo+IGxpbnV4L2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmM6
MzkzOjI0OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5
IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKSHVoLCBDT05GSUdfUFBDX0U1
MDBNQyBnb3QgdW5zZWxlY3RlZCBpbiB0aGUgY29uZmlnIEkgdXNlIHRvIGNvbXBpbGUgdGVzdCB0
aGlzCmZsYXZvci4gIEkgc3VzcGVjdCBJIGJvdGNoZWQgYW4gb2xkY29uZmlnIGF0IHNvbWUgcG9p
bnQuCiAKQW55d2F5cywgZml4ZWQgdGhhdCBhbmQgdGhlIGJ1Z3MuCgpUaGFua3MgbXVjaCEKCi0t
ClN1YmplY3Q6IFtQQVRDSF0gS1ZNOiBQUEM6IE1vdmUgcHJvY2Vzc29yIGNvbXBhdGliaWxpdHkg
Y2hlY2sgdG8gbW9kdWxlIGluaXQKCk1vdmUgS1ZNIFBQQydzIGNvbXBhdGliaWxpdHkgY2hlY2tz
IHRvIHRoZWlyIHJlc3BlY3RpdmUgbW9kdWxlX2luaXQoKQpob29rcywgdGhlcmUncyBubyBuZWVk
IHRvIHdhaXQgdW50aWwgS1ZNJ3MgY29tbW9uIGNvbXBhdCBjaGVjaywgbm9yIGlzCnRoZXJlIGEg
bmVlZCB0byBwZXJmb3JtIHRoZSBjaGVjayBvbiBldmVyeSBDUFUgKHByb3ZpZGVkIGJ5IGNvbW1v
biBLVk0ncwpob29rKS4gIFRoZSBjb21wYXRpYmlsaXR5IGNoZWNrcyBhcmUgZWl0aGVyIGEgbm9w
IChCb29rM1MpLCBvciBzaW1wbHkKY2hlY2sgdGhlIENQVSBuYW1lIHN0b3JlZCBpbiB0aGUgZ2xv
YmFsIENQVSBzcGVjIChlNTAwIGFuZCBlNTAwbWMpLgoKQ2M6IEZhYmlhbm8gUm9zYXMgPGZhcm9z
YXNAbGludXguaWJtLmNvbT4KQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5h
dT4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+
Ci0tLQogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9wcGMuaCB8ICAxIC0KIGFyY2gvcG93
ZXJwYy9rdm0vYm9vazNzLmMgICAgICAgICAgfCAxMCAtLS0tLS0tLS0tCiBhcmNoL3Bvd2VycGMv
a3ZtL2U1MDAuYyAgICAgICAgICAgIHwgIDQgKystLQogYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMu
YyAgICAgICAgICB8ICA2ICsrKysrLQogYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMgICAgICAg
ICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9wcGMuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdm1fcHBjLmgKaW5kZXggYmZhY2YxMjc4NGRkLi41MWEx
ODI0YjBhMTYgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdm1fcHBjLmgK
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9wcGMuaApAQCAtMTE4LDcgKzExOCw2
IEBAIGV4dGVybiBpbnQga3ZtcHBjX3hsYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWxvbmcg
ZWFkZHIsCiBleHRlcm4gaW50IGt2bXBwY19jb3JlX3ZjcHVfY3JlYXRlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CiBleHRlcm4gdm9pZCBrdm1wcGNfY29yZV92Y3B1X2ZyZWUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKIGV4dGVybiBpbnQga3ZtcHBjX2NvcmVfdmNwdV9zZXR1cChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwotZXh0ZXJuIGludCBrdm1wcGNfY29yZV9jaGVja19wcm9jZXNzb3JfY29t
cGF0KHZvaWQpOwogZXh0ZXJuIGludCBrdm1wcGNfY29yZV92Y3B1X3RyYW5zbGF0ZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBrdm1fdHJhbnNsYXRpb24gKnRyKTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2
bS9ib29rM3MuYyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmMKaW5kZXggNmQ1MjUyODVkYmU4
Li44NzI4M2EwZTMzZDggMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmMKKysr
IGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3MuYwpAQCAtOTk5LDE2ICs5OTksNiBAQCBpbnQga3Zt
cHBjX2hfbG9naWNhbF9jaV9zdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB9CiBFWFBPUlRf
U1lNQk9MX0dQTChrdm1wcGNfaF9sb2dpY2FsX2NpX3N0b3JlKTsKIAotaW50IGt2bXBwY19jb3Jl
X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCkKLXsKLQkvKgotCSAqIFdlIGFsd2F5cyByZXR1
cm4gMCBmb3IgYm9vazNzLiBXZSBjaGVjawotCSAqIGZvciBjb21wYXRpYmlsaXR5IHdoaWxlIGxv
YWRpbmcgdGhlIEhWCi0JICogb3IgUFIgbW9kdWxlCi0JICovCi0JcmV0dXJuIDA7Ci19Ci0KIGlu
dCBrdm1wcGNfYm9vazNzX2hjYWxsX2ltcGxlbWVudGVkKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWdu
ZWQgbG9uZyBoY2FsbCkKIHsKIAlyZXR1cm4ga3ZtLT5hcmNoLmt2bV9vcHMtPmhjYWxsX2ltcGxl
bWVudGVkKGhjYWxsKTsKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMC5jIGIvYXJj
aC9wb3dlcnBjL2t2bS9lNTAwLmMKaW5kZXggYzhiMmI0NDc4NTQ1Li4wZWE2MTE5MGVjMDQgMTAw
NjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMC5jCisrKyBiL2FyY2gvcG93ZXJwYy9rdm0v
ZTUwMC5jCkBAIC0zMTQsNyArMzE0LDcgQEAgc3RhdGljIHZvaWQga3ZtcHBjX2NvcmVfdmNwdV9w
dXRfZTUwMChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJa3ZtcHBjX2Jvb2tlX3ZjcHVfcHV0KHZj
cHUpOwogfQogCi1pbnQga3ZtcHBjX2NvcmVfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lkKQor
c3RhdGljIGludCBrdm1wcGNfZTUwMF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZvaWQpCiB7CiAJ
aW50IHI7CiAKQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBrdm1wcGNfZTUw
MF9pbml0KHZvaWQpCiAJdW5zaWduZWQgbG9uZyBoYW5kbGVyX2xlbjsKIAl1bnNpZ25lZCBsb25n
IG1heF9pdm9yID0gMDsKIAotCXIgPSBrdm1wcGNfY29yZV9jaGVja19wcm9jZXNzb3JfY29tcGF0
KCk7CisJciA9IGt2bXBwY19lNTAwX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQoKTsKIAlpZiAocikK
IAkJZ290byBlcnJfb3V0OwogCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5j
IGIvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYwppbmRleCA1N2UwYWQ2YTJjYTMuLjQ1NjRhYTI3
ZWRjZiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYworKysgYi9hcmNoL3Bv
d2VycGMva3ZtL2U1MDBtYy5jCkBAIC0xNjgsNyArMTY4LDcgQEAgc3RhdGljIHZvaWQga3ZtcHBj
X2NvcmVfdmNwdV9wdXRfZTUwMG1jKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlrdm1wcGNfYm9v
a2VfdmNwdV9wdXQodmNwdSk7CiB9CiAKLWludCBrdm1wcGNfY29yZV9jaGVja19wcm9jZXNzb3Jf
Y29tcGF0KHZvaWQpCitpbnQga3ZtcHBjX2U1MDBtY19jaGVja19wcm9jZXNzb3JfY29tcGF0KHZv
aWQpCiB7CiAJaW50IHI7CiAKQEAgLTM4OCw2ICszODgsMTAgQEAgc3RhdGljIGludCBfX2luaXQg
a3ZtcHBjX2U1MDBtY19pbml0KHZvaWQpCiB7CiAJaW50IHI7CiAKKwlyID0ga3ZtcHBjX2U1MDBt
Y19jaGVja19wcm9jZXNzb3JfY29tcGF0KCk7CisJaWYgKHIpCisJCWdvdG8gZXJyX291dDsKKwog
CXIgPSBrdm1wcGNfYm9va2VfaW5pdCgpOwogCWlmIChyKQogCQlnb3RvIGVycl9vdXQ7CmRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYyBiL2FyY2gvcG93ZXJwYy9rdm0vcG93
ZXJwYy5jCmluZGV4IDVmYWY2OTQyMWYxMy4uZDQ0Yjg1YmE4Y2VmIDEwMDY0NAotLS0gYS9hcmNo
L3Bvd2VycGMva3ZtL3Bvd2VycGMuYworKysgYi9hcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYwpA
QCAtNDQyLDcgKzQ0Miw3IEBAIGludCBrdm1fYXJjaF9oYXJkd2FyZV9lbmFibGUodm9pZCkKIAog
aW50IGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCAqb3BhcXVlKQogewotCXJl
dHVybiBrdm1wcGNfY29yZV9jaGVja19wcm9jZXNzb3JfY29tcGF0KCk7CisJcmV0dXJuIDA7CiB9
CiAKIGludCBrdm1fYXJjaF9pbml0X3ZtKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0
eXBlKQoKYmFzZS1jb21taXQ6IDAwZTQ0OTNkYjdjNjE2M2Q0OGQ1YjQ1MDM0ZDFhNzdlMTZhMWM4
ZGMKLS0gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
