Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E29EEB8FB5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eN0FgtMFFwN2sKDVVAVHgu4N1JKtAn/fFY+asg/oAWQ=; b=DO3CjLc6nGSyHj
	L8Z2q6gxwbQUjpMNyPt1zRyvkRyRg2nRRLhqN0MAd//y/e+cG4SsuEirm4momuPHVwXltgNmGpI2P
	imCTpvxzP/3YlglHJkFr/Gp9CJolnwGYqDmE00T1srpg8ktv4MR1bAbcj5DkY2MtAYRTw9gdFaT19
	h/hfHRZUPo6nBn5ARxY8JGg4LLdLtqHymQKLpARCodwR92ZastU2eAx9XeavOxWROYlyvA6otgM0P
	bbojAQVOoI+E3OTGglZbR2Q/Dz14410MGOO5fM45ErAL6ydhc56nZSYSNvIm5t6kRrpjPJe5A/X9A
	Mu2XW6KBenfFoObvpRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoXb-007rQD-07;
	Wed, 06 Sep 2023 09:09:39 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoXX-007rOg-2B;
	Wed, 06 Sep 2023 09:09:37 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so51394871fa.3;
        Wed, 06 Sep 2023 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693991372; x=1694596172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFAc0ENvdawtNpNN8VvAfyOPRtP79Ec15LEe0csz82o=;
        b=iciwE9OCLB6jib6k563KlHP3MqNX6qEkFBenw1r3zP6DEwYPeAHiQDkwe6o15IzInD
         TVXuYyo0je/lxRxyZRGdxo4LsPs9VcqzWWcs/ASYSq4uL1XvqDhs78Z5ub9I1IcH6BQB
         CEvPgbe5LwpWRN9DoKYEUmenl/S4v01jevhTnszXXPb068lc2KFhUAKa62Wp/CAdgohL
         XotLk0JP1giGTOpwBRjesL8mnTkqiyNevev7N7fDV3oRy3nlzYdzW1Siuis+oe/ms5UE
         gakEqc1I4rW5rEsbiv9OOPHaTM/wHEroTAy7cIbcRLmyli/rUniqQE9UfHgvBaHhCqfz
         O9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693991372; x=1694596172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFAc0ENvdawtNpNN8VvAfyOPRtP79Ec15LEe0csz82o=;
        b=ja1l7wvndWudBKjyse1oD2SD+XRXciHrGRIXh5fDFphCyl0/dDds6DAgTbdqs9Ouaz
         +bhFaY8sBsKr0eR03p/PUB5HBcNMHrxyEkUHfYqJmajRGpHgqo2PzCUbpkrkj/ESiLek
         mWNDrWfn+no3L+Fu0yeTcE0bsOHmRp4p3zujsFPg91JbjXtndosTwJR8f9mCy/6LwsGh
         0Dh1yjq+GGTpSR+VMQH730h9WKJjD9nQ3qrZzge43/djLurEhBXVj2CSQ2M4vTuzqUBX
         YPWETeqckqCY36mrDrkWT9cQ+HhiC3OKV6yRgkLeomJCyvpGO5G5+3VO9VANVn1Hlkdj
         WHXA==
X-Gm-Message-State: AOJu0YwT30TggOf1yFXxCGFVIA6vBKAhc6zl4j50+1r6NSd1qlCqYjJw
	I2XiM55Czt8/9FncA4A0jDIOlRxICnMCHGFoOx4=
X-Google-Smtp-Source: AGHT+IGaZt6wsaWTbeCCw1/OFTccreQdD11HazSIZhfbhlO6zQVsNMMI+83UdqvCNrcOOuteAKYC2L4cc72BzWIWZ78=
X-Received: by 2002:a2e:9859:0:b0:2bd:1fee:aacf with SMTP id
 e25-20020a2e9859000000b002bd1feeaacfmr1890357ljj.24.1693991372034; Wed, 06
 Sep 2023 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
 <20230904-06f09083d5190fd50e53b1ea@orel> <CAJve8on7Yi7cDuXOVznuRdTvfUhig2hZy8g72nvnHkM7omoVAw@mail.gmail.com>
 <20230906-c35fdc0e07d2cc0f9cb93203@orel>
In-Reply-To: <20230906-c35fdc0e07d2cc0f9cb93203@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 17:09:20 +0800
Message-ID: <CAJve8ok-Z6VCziFj5t0=BoouZ-VLyGaqEng-dYGTFnP-CR36kw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] tools: riscv: Add header file csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, David Matlack <dmatlack@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Peter Gonda <pgonda@google.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, zhang songyi <zhang.songyi@zte.com.cn>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_020935_713207_A3240E19 
X-CRM114-Status: GOOD (  26.26  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCAzOjEz4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAwNiwgMjAyMyBhdCAwMjozNTo0
MlBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDQsIDIwMjMgYXQgOToz
M+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBTYXQsIFNlcCAwMiwgMjAyMyBhdCAwODo1OToyNVBNICswODAwLCBIYWlibyBY
dSB3cm90ZToKPiA+ID4gPiBCb3Jyb3cgdGhlIGNzciBkZWZpbml0aW9ucyBhbmQgb3BlcmF0aW9u
cyBmcm9tIGtlcm5lbCdzCj4gPiA+ID4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB0byB0
b29scy8gZm9yIHJpc2N2Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUg
PGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHRvb2xzL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmggfCA1MjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyMSBpbnNlcnRpb25zKCspCj4gPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gPiA+ID4K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBi
L3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+ID4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGU4NmM4MmFhY2JkCj4gPiA+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiA+ID4gPiBAQCAtMCwwICsxLDUyMSBAQAo+ID4gPiA+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiA+ID4gKy8qCj4gPiA+ID4gKyAqIENvcHly
aWdodCAoQykgMjAxNSBSZWdlbnRzIG9mIHRoZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEKPiA+
ID4gPiArICovCj4gPiA+ID4gKwo+ID4gPiA+ICsjaWZuZGVmIF9BU01fUklTQ1ZfQ1NSX0gKPiA+
ID4gPiArI2RlZmluZSBfQVNNX1JJU0NWX0NTUl9ICj4gPiA+ID4gKwo+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvYml0cy5oPgo+ID4gPiA+ICsKPiA+ID4gPiArLyogU3RhdHVzIHJlZ2lzdGVyIGZs
YWdzICovCj4gPiA+ID4gKyNkZWZpbmUgU1JfU0lFICAgICAgICAgICAgICAgX0FDKDB4MDAwMDAw
MDIsIFVMKSAvKiBTdXBlcnZpc29yIEludGVycnVwdCBFbmFibGUgKi8KPiA+ID4gPiArI2RlZmlu
ZSBTUl9NSUUgICAgICAgICAgICAgICBfQUMoMHgwMDAwMDAwOCwgVUwpIC8qIE1hY2hpbmUgSW50
ZXJydXB0IEVuYWJsZSAqLwo+ID4gPiA+ICsjZGVmaW5lIFNSX1NQSUUgICAgICAgICAgICAgIF9B
QygweDAwMDAwMDIwLCBVTCkgLyogUHJldmlvdXMgU3VwZXJ2aXNvciBJRSAqLwo+ID4gPiA+ICsj
ZGVmaW5lIFNSX01QSUUgICAgICAgICAgICAgIF9BQygweDAwMDAwMDgwLCBVTCkgLyogUHJldmlv
dXMgTWFjaGluZSBJRSAqLwo+ID4gPiA+ICsjZGVmaW5lIFNSX1NQUCAgICAgICAgICAgICAgIF9B
QygweDAwMDAwMTAwLCBVTCkgLyogUHJldmlvdXNseSBTdXBlcnZpc29yICovCj4gPiA+ID4gKyNk
ZWZpbmUgU1JfTVBQICAgICAgICAgICAgICAgX0FDKDB4MDAwMDE4MDAsIFVMKSAvKiBQcmV2aW91
c2x5IE1hY2hpbmUgKi8KPiA+ID4gPiArI2RlZmluZSBTUl9TVU0gICAgICAgICAgICAgICBfQUMo
MHgwMDA0MDAwMCwgVUwpIC8qIFN1cGVydmlzb3IgVXNlciBNZW1vcnkgQWNjZXNzICovCj4gPiA+
ID4gKwo+ID4gPiA+ICsjZGVmaW5lIFNSX0ZTICAgICAgICAgICAgICAgIF9BQygweDAwMDA2MDAw
LCBVTCkgLyogRmxvYXRpbmctcG9pbnQgU3RhdHVzICovCj4gPiA+ID4gKyNkZWZpbmUgU1JfRlNf
T0ZGICAgIF9BQygweDAwMDAwMDAwLCBVTCkKPiA+ID4gPiArI2RlZmluZSBTUl9GU19JTklUSUFM
ICAgICAgICBfQUMoMHgwMDAwMjAwMCwgVUwpCj4gPiA+ID4gKyNkZWZpbmUgU1JfRlNfQ0xFQU4g
IF9BQygweDAwMDA0MDAwLCBVTCkKPiA+ID4gPiArI2RlZmluZSBTUl9GU19ESVJUWSAgX0FDKDB4
MDAwMDYwMDAsIFVMKQo+ID4gPiA+ICsKPiA+ID4gPiArI2RlZmluZSBTUl9WUyAgICAgICAgICAg
ICAgICBfQUMoMHgwMDAwMDYwMCwgVUwpIC8qIFZlY3RvciBTdGF0dXMgKi8KPiA+ID4gPiArI2Rl
ZmluZSBTUl9WU19PRkYgICAgX0FDKDB4MDAwMDAwMDAsIFVMKQo+ID4gPiA+ICsjZGVmaW5lIFNS
X1ZTX0lOSVRJQUwgICAgICAgIF9BQygweDAwMDAwMjAwLCBVTCkKPiA+ID4gPiArI2RlZmluZSBT
Ul9WU19DTEVBTiAgX0FDKDB4MDAwMDA0MDAsIFVMKQo+ID4gPiA+ICsjZGVmaW5lIFNSX1ZTX0RJ
UlRZICBfQUMoMHgwMDAwMDYwMCwgVUwpCj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIFNSX1hT
ICAgICAgICAgICAgICAgIF9BQygweDAwMDE4MDAwLCBVTCkgLyogRXh0ZW5zaW9uIFN0YXR1cyAq
Lwo+ID4gPiA+ICsjZGVmaW5lIFNSX1hTX09GRiAgICBfQUMoMHgwMDAwMDAwMCwgVUwpCj4gPiA+
ID4gKyNkZWZpbmUgU1JfWFNfSU5JVElBTCAgICAgICAgX0FDKDB4MDAwMDgwMDAsIFVMKQo+ID4g
PiA+ICsjZGVmaW5lIFNSX1hTX0NMRUFOICBfQUMoMHgwMDAxMDAwMCwgVUwpCj4gPiA+ID4gKyNk
ZWZpbmUgU1JfWFNfRElSVFkgIF9BQygweDAwMDE4MDAwLCBVTCkKPiA+ID4gPiArCj4gPiA+ID4g
KyNkZWZpbmUgU1JfRlNfVlMgICAgIChTUl9GUyB8IFNSX1ZTKSAvKiBWZWN0b3IgYW5kIEZsb2F0
aW5nLVBvaW50IFVuaXQgKi8KPiA+ID4gPiArCj4gPiA+ID4gKyNpZm5kZWYgQ09ORklHXzY0QklU
Cj4gPiA+Cj4gPiA+IEhvdyBkbyB3ZSBlbnN1cmUgQ09ORklHXzY0QklUIGlzIHNldD8KPiA+ID4K
PiA+Cj4gPiBDdXJyZW50bHksIG5vIGV4cGxpY2l0IGNoZWNraW5nIGZvciB0aGlzLgo+ID4gU2hh
bGwgd2UgYWRkIGEgZ2F0ZWtlZXBlciBpbiB0aGlzIGZpbGUgdG8gZW5zdXJlIGl0IGlzIHNldD8K
Pgo+IE5vdCBpbiB0aGlzIGZpbGUsIHNpbmNlIHRoaXMgZmlsZSBpcyBzaGFyZWQgYnkgYWxsIHRo
ZSB0b29scyBhbmQuLi4KPgo+ID4KPiA+ICNpZm5kZWYgQ09ORklHXzY0QklUCj4gPiAjZXJyb3Ig
IkNPTkZJR182NEJJVCB3YXMgbm90IHNldCIKPiA+ICNlbmRpZgo+Cj4gLi4ud2UnbGwgc3VyZWx5
IGhpdCB0aGlzIGVycm9yIHJpZ2h0IG5vdyBzaW5jZSBub3RoaW5nIGlzIHNldHRpbmcKPiBDT05G
SUdfNjRCSVQgd2hlbiBjb21waWxpbmcgS1ZNIHNlbGZ0ZXN0cy4KPgo+IFdlIG5lZWQgdG8gZGVm
aW5lIENPTkZJR182NEJJVCBpbiB0aGUgYnVpbGQgc29tZXdoZXJlIHByaW9yIHRvIGFueQo+IGhl
YWRlcnMgd2hpY2ggZGVwZW5kIG9uIGl0IGJlaW5nIGluY2x1ZGVkLiBNYXliZSB3ZSBjYW4gc2lt
cGx5Cj4gYWRkIC1EQ09ORklHXzY0QklUIHRvIENGTEFHUywgc2luY2UgYWxsIEtWTSBzZWxmdGVz
dHMgc3VwcG9ydGVkCj4gYXJjaGl0ZWN0dXJlcyBhcmUgNjQtYml0Lgo+CgpNYWtlIHNlbnNlISBB
bm90aGVyIG9wdGlvbiBjYW4gYmUganVzdCBhZGQgIiNkZWZpbmUgQ09ORklHXzY0QklUIiBhdAp0
aGUgYmVnaW4gb2YgY3NyLmgKCj4gKFBsZWFzZSB0cmltIGVtYWlscywgYXMgSSd2ZSBiZWVuIGRv
aW5nLCB3aGVuIGRpc2N1c3Npbmcgc3BlY2lmaWMgcGFydHMuKQo+CgpTdXJlLCB0aGFua3MgZm9y
IHRoZSBzdWdnZXN0aW9ucyEKCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
