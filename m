Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A2C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KlTGavWlOlw7ZHHZ15eflH74R5StZXYJByzmEI29b8=; b=weB99P/R60QpkT
	W8TUa3BMGDEM5DJah4uPIKk8U/YjHZ/WajuGvCTZ4YKJ+unUfI6yKaoxltdpwCt0yQ2oBuPScgdMS
	N066pWgtH603GmF09lxGIoOILO7sH/xOxlJahfRAE1GfQYZUivsyAxTQiOzjve4alQEKhKHmqipQj
	8kcVwR2qIbco6FNEYXAwkzsFGlEgJwIRhkAmQ+e37wGMN+wPeAYQ0HZydVGghifbLWi45E52sh740
	m4btZUu2iGerFXudHbTMB0FsHRuERSZgzvm4PpP++HZnfw/5S7O7HVPzhJzx2s8DZgUoCx3PHWp9y
	8GUFKc/+F5DUCc+qrHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2SDo-001VGM-2j;
	Fri, 26 May 2023 07:50:48 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2SDl-001VEi-1e;
	Fri, 26 May 2023 07:50:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53eee18a192so410633a12.3;
        Fri, 26 May 2023 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685087444; x=1687679444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DC31IUhv/KDwF/7LXlScDdxDoyQnFVByk+1cX0N3RaE=;
        b=Jhs5ewodbHYux8rWhVtQych048Jh1kydORvmCZBCk1d+cKOfGCAypgl5wP36OA6UPY
         iV2JB3nG+nkKnPEfCq/6JOGJ+BuIrM/MSAbgOJ0p3dOxlDiW5hfzk/rQnKvK0MZFZZmY
         LqWyiqzwdd8P8J06ueWglPKI4iG8HTQ35NWYE1Zz+rV438CWkHtoGq3E3q4ocLOP5T8C
         euSntHUIVUEBh3la/Yy5NtBfEcZBeniHggQeHvjGzwtmUrGsUA8pPjwiFDZqJwloc2H5
         yRpr2O/ZC0n2mgszGTzp1RfDh7Vg8zx5hGA8wOmNgzT9u5/icQUnuQWM3RMTu7N7NCDg
         VQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685087444; x=1687679444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DC31IUhv/KDwF/7LXlScDdxDoyQnFVByk+1cX0N3RaE=;
        b=HSio4yNddrvEIwBBHHn4Gtd4PYQmAPinz68psi9TNMnA1bXl3iPu7TFlbURf+5xl4F
         jc10aRYupNYUl24vIkyOEyYdpquzxDVsQWoHINqyt9G0xPfO2vXx4GmsBAhyUopSEqZm
         eEzCWIsTYVa/NmV6l2zPibQfrZ9dBRJAfR+o4uCjCn2il0P9VScxqUPEc3lSmHOSPOgl
         r6n+HJdjHl3bnWogObMhs3h8mlqtJ5KsG4sGGkD1+/XJtFgqxUdnvuMntjufM/X7AfhG
         d284oaa8OobjebXqkMNUTfzgppP2xroxIrhSobrDkteQgqXy/Ac6+5MHk4veKcjJovqd
         SgSg==
X-Gm-Message-State: AC+VfDwx2C2IERtmL/P+7f7bG71CbPfQFbbZjf1bvC6Kj03myNMLRBc/
	pSzvjM7xLuNogyE8Y9O8n3v6A0ome/AC+zq3abw=
X-Google-Smtp-Source: ACHHUZ58ZyNcl4smp7Jn1NrrTnovVntKOMAOSrPor/2jlNcaBY0cnT/p2f56wvJwy1y5P3rJncUZpbKm54trYcAP22Q=
X-Received: by 2002:a17:903:2345:b0:1af:f4f5:6fae with SMTP id
 c5-20020a170903234500b001aff4f56faemr1891458plh.54.1685087443821; Fri, 26 May
 2023 00:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <26dea518fc5e8da51e61db279d175364bfecd009.1684999824.git.haibo1.xu@intel.com>
 <20230525-705ddcbcd43aa63e3fd356c8@orel>
In-Reply-To: <20230525-705ddcbcd43aa63e3fd356c8@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 26 May 2023 15:50:32 +0800
Message-ID: <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] KVM: riscv: selftests: Make check_supported arch specific
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_005045_567702_E0642B79 
X-CRM114-Status: GOOD (  30.82  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMTI6NDDigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDAzOjM4
OjMzUE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gY2hlY2tfc3VwcG9ydGVkKCkgd2FzIHVz
ZWQgdG8gdmVyaWZ5IHdoZXRoZXIgYSBmZWF0dXJlL2V4dGVuc2lvbiB3YXMKPiA+IHN1cHBvcnRl
ZCBpbiBhIGd1ZXN0IGluIHRoZSBnZXQtcmVnLWxpc3QgdGVzdC4gQ3VycmVudGx5IHRoaXMgaW5m
bwo+ID4gY2FuIGJlIHJldHJpZXZlZCB0aHJvdWdoIHRoZSBLVk1fQ0FQX0FSTV8qIEFQSSBpbiBh
YXJjaDY0LCBidXQgaW4KPiA+IHJpc2N2LCB0aGlzIGluZm8gd2FzIG9ubHkgZXhwb3NlZCB0aHJv
dWdoIHRoZSBLVk1fR0VUX09ORV9SRUcgb24KPiA+IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCBwc2V1
ZG8gcmVnaXN0ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVA
aW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1y
ZWctbGlzdC5jIHwgMzIgKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBpbmRleCBmNmFkNzk5MWE4MTIuLmYx
ZmMxMTNlOTcxOSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9n
ZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1y
ZWctbGlzdC5jCj4gPiBAQCAtOTksNiArOTksMjAgQEAgdm9pZCBfX3dlYWsgcHJpbnRfcmVnKGNv
bnN0IGNoYXIgKnByZWZpeCwgX191NjQgaWQpCj4gPiAgfQo+ID4KPiA+ICAjaWZkZWYgX19hYXJj
aDY0X18KPiA+ICtzdGF0aWMgdm9pZCBjaGVja19zdXBwb3J0ZWQoc3RydWN0IHZjcHVfcmVnX2xp
c3QgKmMpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHZjcHVfcmVnX3N1Ymxpc3QgKnM7Cj4gPiAr
Cj4gPiArICAgICBmb3JfZWFjaF9zdWJsaXN0KGMsIHMpIHsKPiA+ICsgICAgICAgICAgICAgaWYg
KCFzLT5jYXBhYmlsaXR5KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4g
SSB3YXMgZ29pbmcgdG8gc2F5IHRoYXQgbWFraW5nIHRoaXMgZnVuY3Rpb24gYWFyY2g2NCBzaG91
bGRuJ3QgYmUKPiBuZWNlc3NhcnksIHNpbmNlIHJpc2N2IGxlYXZlcyBjYXBhYmlsaXR5IHNldCB0
byB6ZXJvIGFuZCB0aGlzIGZ1bmN0aW9uCj4gZG9lc24ndCBkbyBhbnl0aGluZywgYnV0IHRoZW4g
bG9va2luZyBhaGVhZCBJIHNlZSByaXNjdiBpcyBhYnVzaW5nCj4gY2FwYWJpbGl0eSBieSBwdXR0
aW5nIGlzYSBleHRlbnNpb25zIGluIGl0LiBJTU8sIGNhcGFiaWxpdHkgc2hvdWxkCj4gb25seSBi
ZSBzZXQgdG8gS1ZNX0NBUF8qIHZhbHVlcy4gU2luY2UgcmlzY3YgZG9lc24ndCB1c2UgaXQsIHRo
ZW4gaXQKPiBzaG91bGQgYmUgbGVmdCB6ZXJvLgo+Cj4gSWYgd2UncmUgZ29pbmcgdG8gYWJ1c2Ug
c29tZXRoaW5nLCB0aGVuIEknZCByYXRoZXIgYWJ1c2UgdGhlICdmZWF0dXJlJwo+IG1lbWJlciwg
YnV0IHNpbmNlIGl0J3Mgb25seSBhbiBpbnQgKG5vdCBhbiB1bnNpZ25lZCBsb25nKSwgdGhlbiBs
ZXQncwo+IGp1c3QgYWRkIGFuICd1bnNpZ25lZCBsb25nIGV4dGVuc2lvbicgbWVtYmVyLgo+CgpH
b29kIGlkZWEhCgpGb3IgdGhlIG5ldyAnZXh0ZW5zaW9uJyBtZW1iZXIgaW4gcmlzY3YsIEkgdGhp
bmsgaXRzIHVzZSBjYXNlIHNob3VsZCBiZQppZGVudGljYWwgdG8gdGhlICdmZWF0dXJlJyBtZW1i
ZXIgaW4gYWFyY2g2NChLVk1fUklTQ1ZfSVNBX0VYVF9GCndhcyBzaW1pbGFyIHRvIEtWTV9BUk1f
VkNQVV9TVkUpPyBJZiBzbywgSSB0aGluayB3ZSBjYW4ganVzdCByZXVzZQp0aGUgJ2ZlYXR1cmUn
IG1lbWJlciBzaW5jZSB0aGUgZGF0YSB0eXBlIHdhcyBub3QgYSBiaWcgZGVhbC4KCj4gVGhlbiwg
dGhlIGZpbmFsaXplX3ZjcHUoKSBjYWxsIGNhbiBiZSBtb3ZlZCBiYWNrIHRvIHJ1bl90ZXN0KCks
IGZyb20KPiBhYXJjaDY0J3MgdmNwdV9jb25maWdfZ2V0X3ZjcHUoKS4gQm90aCBhYXJjaDY0IGFu
ZCByaXNjdiB3aWxsIGNhbGwgaXQKPiByaWdodCBhZnRlciB2Y3B1X2NvbmZpZ19nZXRfdmNwdSgp
IGFuZCB0aGUgcmlzY3YgdmVyc2lvbiBvZiBpdCB3aWxsCj4gZG8gd2hhdCB5b3VyIGN1cnJlbnQg
cmlzY3YgY2hlY2tfc3VwcG9ydGVkKCkgaXMgZG9pbmcsIHVzaW5nIHRoZQo+IG5ldyAnZXh0ZW5z
aW9uJyBtZW1iZXIgaW5zdGVhZCBvZiAnY2FwYWJpbGl0eScuCj4KPiBBbmQgdGhpcyBwYXRjaCBn
ZXRzIGRyb3BwZWQuCj4KPiBUaGFua3MsCj4gZHJldwo+Cj4gPiArCj4gPiArICAgICAgICAgICAg
IF9fVEVTVF9SRVFVSVJFKGt2bV9oYXNfY2FwKHMtPmNhcGFiaWxpdHkpLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiJXM6ICVzIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3Rz
XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25maWdfbmFtZShjKSwgcy0+
bmFtZSk7Cj4gPiArICAgICB9Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB2b2lkIHByZXBhcmVf
dmNwdV9pbml0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjLCBzdHJ1Y3Qga3ZtX3ZjcHVfaW5pdCAq
aW5pdCkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgdmNwdV9yZWdfc3VibGlzdCAqczsKPiA+IEBA
IC0xMjYsNiArMTQwLDggQEAgc3RhdGljIHN0cnVjdCBrdm1fdmNwdSAqdmNwdV9jb25maWdfZ2V0
X3ZjcHUoc3RydWN0IHZjcHVfcmVnX2xpc3QgKmMsIHN0cnVjdCBrdm0KPiA+ICAgICAgIHN0cnVj
dCBrdm1fdmNwdV9pbml0IGluaXQgPSB7IC50YXJnZXQgPSAtMSwgfTsKPiA+ICAgICAgIHN0cnVj
dCBrdm1fdmNwdSAqdmNwdTsKPiA+Cj4gPiArICAgICBjaGVja19zdXBwb3J0ZWQoYyk7Cj4gPiAr
Cj4gPiAgICAgICBwcmVwYXJlX3ZjcHVfaW5pdChjLCAmaW5pdCk7Cj4gPiAgICAgICB2Y3B1ID0g
X192bV92Y3B1X2FkZCh2bSwgMCk7Cj4gPiAgICAgICBhYXJjaDY0X3ZjcHVfc2V0dXAodmNwdSwg
JmluaXQpOwo+ID4gQEAgLTE0MCwyMCArMTU2LDYgQEAgc3RhdGljIHN0cnVjdCBrdm1fdmNwdSAq
dmNwdV9jb25maWdfZ2V0X3ZjcHUoc3RydWN0IHZjcHVfcmVnX2xpc3QgKmMsIHN0cnVjdCBrdm0K
PiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gLXN0YXRpYyB2b2lkIGNoZWNrX3N1cHBvcnRlZChz
dHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+IC17Cj4gPiAtICAgICBzdHJ1Y3QgdmNwdV9yZWdf
c3VibGlzdCAqczsKPiA+IC0KPiA+IC0gICAgIGZvcl9lYWNoX3N1Ymxpc3QoYywgcykgewo+ID4g
LSAgICAgICAgICAgICBpZiAoIXMtPmNhcGFiaWxpdHkpCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiAtCj4gPiAtICAgICAgICAgICAgIF9fVEVTVF9SRVFVSVJFKGt2bV9o
YXNfY2FwKHMtPmNhcGFiaWxpdHkpLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
JXM6ICVzIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzXG4iLAo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25maWdfbmFtZShjKSwgcy0+bmFtZSk7Cj4gPiAtICAgICB9Cj4g
PiAtfQo+ID4gLQo+ID4gIHN0YXRpYyBib29sIHByaW50X2xpc3Q7Cj4gPiAgc3RhdGljIGJvb2wg
cHJpbnRfZmlsdGVyZWQ7Cj4gPgo+ID4gQEAgLTE2NSw4ICsxNjcsNiBAQCBzdGF0aWMgdm9pZCBy
dW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ICAgICAgIHN0cnVjdCBrdm1fdm0g
KnZtOwo+ID4gICAgICAgc3RydWN0IHZjcHVfcmVnX3N1Ymxpc3QgKnM7Cj4gPgo+ID4gLSAgICAg
Y2hlY2tfc3VwcG9ydGVkKGMpOwo+ID4gLQo+ID4gICAgICAgdm0gPSB2bV9jcmVhdGVfYmFyZWJv
bmVzKCk7Cj4gPiAgICAgICB2Y3B1ID0gdmNwdV9jb25maWdfZ2V0X3ZjcHUoYywgdm0pOwo+ID4K
PiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
