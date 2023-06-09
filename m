Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40162C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 01:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5QpLFYgZUxAQV9vucjVjlJBY+bA2n+T0vF6dehWnaM=; b=LFMJo4xuVdSCCN
	dbgSkYS8DSiT8q9l8mfUf1hRuNa8A8kK6jhIXjp7IxrruT4olB85DsRaQ7/mB50K2tHkCg4jhynHZ
	jTK196gIXoizU+pGL4ql5MvHgAz7pTQNolVdWHDb+tJYrBzmpvhbDPHwUQXmm+rU7a58Fkh2/RoVe
	UbLAAk0a3KMawK66yNFgc9JykxoRg0IBNE0l7FjwNtISlVYRrONaza+GQQarSLACAvfEZ1OGsQA9U
	3BSg0Kd6SmKtfZ1zEa8+I3eQJZZHtzBAxB1qlWiL9GVUrnKYAMm7m3PHYbKnTts7RnccMGG3JoTwq
	fqbFHC2xylod5vJKdQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7QoO-00BAIX-28;
	Fri, 09 Jun 2023 01:21:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7QoJ-00BAHo-2l;
	Fri, 09 Jun 2023 01:21:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-25676b4fb78so235122a91.2;
        Thu, 08 Jun 2023 18:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686273662; x=1688865662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twlI1LD4oryR8OR0rQu9NKOMo/NUVR/h5zjz7GVrnR8=;
        b=XWHgzO7540E60svSCzllKPcC2GCkvrzWjfew09EYySK6CIVycShnDFvaJ/ReMzuKop
         tJHDJHoJzt7aqoo+FkCB8sShxnEGHscNeCK2oQsmFiPbzo8s62H5qlR/zy2nXm4qubve
         BTdpAq1EDOPUR7fhJ/I4QUVF409qSoljmufyYAd+YmZ8/g5n5DwwYVDhbDpTdNlnJWRp
         rV2uao+FGjxkgbxjVwie8xF7SJrgN2OrRVfvddabb+yOj6iGDZR3KzEUPk5ryidqm01T
         38Clp/syDd1nNbqlFunhiLBApy1OOhy4b7gYMi5u/IIC55njbLiA16sn0flz1M4SurH/
         nriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686273662; x=1688865662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twlI1LD4oryR8OR0rQu9NKOMo/NUVR/h5zjz7GVrnR8=;
        b=Zx+GAP4LlD2Com6QHFwBb9R6RQI7kVjJpUlcOfoQjGxufnnTIlCt/ATkIHNofkfsjl
         6kRh42Mr8tMTugBO5PnrwrBeWH3PfyyLkG+oRPbWAL0KAOWzaBYHpZhp6xF04qbUNFbn
         tYptgGOEyMwr99Ixf+ffzf2g8z0VDQPfkefIzQvT/FmX/dRMDoJhEPtGIO+BgC0yZPTB
         dSUgVHzjYO3sLmXFyuuelE0rkGya3iwRBbMftbruoAEKeIWWpTmjYwDDr7U2Aqou88vs
         tfFc0n1yJHGOj0Z2i4F4qtK4xxZt/bAwvaiWIEf1wSdb8BcDXlPqe8Tmp5SjmCP+LdFL
         3yqQ==
X-Gm-Message-State: AC+VfDzTukSUzFhUiGDmrN6bA4Mi/J2P6dEkUciimijbhHq8w9MAFB1f
	JixShIr6jF0ThZnyUyph/grsbQ/SFQO9xTGjk/k=
X-Google-Smtp-Source: ACHHUZ6UCki4RhqRqkb6Pa4UkvtBuYqIvtIA6byJWicKvwzZ4Yd6I0HApD+3vIJuG+swD389v/xkWd3GhTMn5b2Ldws=
X-Received: by 2002:a17:90a:c783:b0:250:c4c1:882 with SMTP id
 gn3-20020a17090ac78300b00250c4c10882mr60804pjb.30.1686273662263; Thu, 08 Jun
 2023 18:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel> <CAJve8okR_iH4vF9DV9zTkDaeYe25kP7KUcKQphmjG5q-iVb-KA@mail.gmail.com>
 <20230608-344953a953eeb63ef6c26fb8@orel>
In-Reply-To: <20230608-344953a953eeb63ef6c26fb8@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 9 Jun 2023 09:20:50 +0800
Message-ID: <CAJve8o=xhANzM7qPsyC-4rc8oB9TWTxBJKtiqNxe-w_+w_d-1g@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
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
X-CRM114-CacheID: sfid-20230608_182103_920957_492569E3 
X-CRM114-Status: GOOD (  18.33  )
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

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCA1OjU44oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAwNTo0NToy
MVBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDE6
MTjigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+Cj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBL
Vk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKG1vZGUpLAo+ID4gPiA+
ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9D
U1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc3N0YXR1cyksCj4gPiA+ID4gKyAgICAgS1ZNX1JF
R19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdf
UklTQ1ZfQ1NSX1JFRyhzaWUpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVH
X1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc3R2
ZWMpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZN
X1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc3NjcmF0Y2gpLAo+ID4gPiA+
ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9D
U1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc2VwYyksCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklT
Q1ZfQ1NSX1JFRyhzY2F1c2UpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVH
X1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc3R2
YWwpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZN
X1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc2lwKSwKPiA+ID4gPiArICAg
ICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwg
S1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNhdHApLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1Yg
fCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NT
Ul9SRUcoc2NvdW50ZXJlbiksCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdf
U0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX1RJTUVSIHwgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUco
ZnJlcXVlbmN5KSwKPiA+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2
NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyh0aW1lKSwK
PiA+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdf
UklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyhjb21wYXJlKSwKPiA+ID4gPiAr
ICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfVElN
RVIgfCBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyhzdGF0ZSksCj4gPiA+ID4gKyAgICAgS1ZNX1JF
R19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1f
UklTQ1ZfSVNBX0VYVF9BLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJ
WkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfQywKPiA+
ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0QsCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9GLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVf
VTY0IHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfSCwKPiA+ID4g
PiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1Zf
SVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0ksCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVND
ViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9NLAo+ID4gPgo+ID4gPiBJIHRoaW5rIGFsbCB0aGUgYWJvdmUgc2hvdWxkIGhhdmUg
dGhlIHNpemUgS1ZNX1JFR19TSVpFX1VMT05HLiBQbGVhc2UgYWxzbwo+ID4gPiB0ZXN0IHdpdGgg
YSAzMi1iaXQgaG9zdC4KPiA+ID4KPiA+Cj4gPiBIaSBBbmRyZXcsCj4gPgo+ID4gSnVzdCBub3Rp
Y2VkIHRoZSBSSVNDLVYgMzItYml0IGt2bSBzZWxmdGVzdHMgd2FzIG5vdCBzdXBwb3J0ZWQgY3Vy
cmVudGx5Lgo+Cj4gT2gsIHJpZ2h0Lgo+Cj4gPiBFdmVuIHRob3VnaCBJIHRyaWVkIHRvIHJlbW92
ZSB0aGUgYmVsb3cgY2hlY2sgZm9yIDMyLWJpdCwgdGhlcmUgd2VyZQo+ID4gc3RpbGwgbWFueSB3
YXJuaW5nIGFuZCBlcnJvciBtZXNzYWdlcyBkdXJpbmcgY29tcGlsaW5nLgo+ID4gSXQgc2VlbXMg
MzItYml0IEtWTSBzZWxmdGVzdHMgd2FzIG5vdCBzdXBwb3J0ZWQgZWl0aGVyIGZvciBBUk0veDg2
LiBEbwo+ID4gd2UgaGF2ZSBhIHBsYW4gdG8gc3VwcG9ydCBpdCBvbiByaXNjLXY/Cj4KPiBObyBw
bGFuIGFuZCwgaWYgdGhlcmUgd2FzLCBpdCB3b3VsZCBiZSBzdXBlciBsb3cgcHJpb3JpdHkuIFNv
IGZvciBzdHVmZgo+IGxpa2UgdXNpbmcgS1ZNX1JFR19TSVpFX1VMT05HLCB3ZSdsbCBqdXN0IGhh
dmUgdG8gdHJ5IGFuZCBnZXQgaXQgcmlnaHQKPiB3aXRob3V0IHRlc3RpbmcuIElmIHNvbWVib2R5
IGFkZHMgMzItYml0IHN1cHBvcnQgdG8gdGhlc2UgdGVzdHMgc29tZWRheSwKPiB0aGVuLCBob3Bl
ZnVsbHksIGl0J2xsIGp1c3Qgd29yayAoSSdtIGFsbG93ZWQgb25lIG92ZXJseSBvcHRpbWlzdGlj
Cj4gY29tbWVudCBwZXIgZGF5KS4KPgoKU3VyZSwgV2lsbCB0cnkgdG8gZ2V0IGl0IHJpZ2h0IGZv
ciBhIDMyLWJpdCBzeXN0ZW0uCgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
