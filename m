Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B934BC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 05:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHiq6RdUzACOGVcU7F18v+mLqRPLhgWx1RbiZR3fGgs=; b=ItpbS7yWRSp7Su
	N8IOKL7niGpLAsBQzc8MtlDrgxvfXV9Kx5kxEHOQ3k72P+YuuwMQXE9uTF73oaVpL4t657EwhnCPq
	IoQUsn43UIitBhZjvjfgYWPo0LvOBKKb/f/dZlBg9fVb2TYOR4UfJLeCSRxJZYKtdf0eGpypLbUf8
	CQZjey62vUARk73itT1ShEFiKs+oeIWwTPa1l7OTL/qNet6eNnDwnQRk5WcxvbOKFS//P8A91wPAK
	qpIcj9kozawQk3uiwwo+LnS+WZpjXMmdvo92SA/IvAqeKXtXIw3WJ3rffcuwFekXSauAXDRVod3ys
	QjjxHPcPW2awl6yAePsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reTPJ-0000000GWOE-1TQH;
	Mon, 26 Feb 2024 05:20:05 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reTPG-0000000GWMi-08kN
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 05:20:03 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7c7c984699fso31935339f.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 21:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708924800; x=1709529600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvD9c59bJDsB22IC2oo8c8Y8bED38e+VeFaxxSdJnPM=;
        b=dPgrYaNZHW1RQqIr8M+ALCt+nSSQbfPA+FekfvIHSl0lzffd7JnmDxSfOSu5IAQT80
         MjDVmjJCdpOKhmRgnMi/VPwUu65ygocm2ARfYQaj+Wycp/ga1jwXcSXUeFHMTUjgmFVP
         MfsPP/0lsHlI+oq01YhNlJx6nY3WjcYxP0zbFHOpDxcGq/2XzwfVAJBACrNAPrpJsGFd
         gC/JyBbxFckj+cBVarRu3DLmQkkC5JDmYUEMPp6eOh+tteGN4srsAIP6t7DdXxQa7tvI
         8IwL99MIx3FzqhT1eoynIVhkiNG5rs9CAmmyHNJIoHqg1NxQsUuT7sdsDi/oTM3MSiQd
         ni5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708924800; x=1709529600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvD9c59bJDsB22IC2oo8c8Y8bED38e+VeFaxxSdJnPM=;
        b=MRCwluBuqViT3MmwcNOvO8cMuSnoZTvwH/3JoAqLboumO7NXD/nDnfAWehHd5Aj9ta
         dtF05Vkwr9Hs+9Dml1el+5/5uMR/UcN8UOugpEuIjbW6E5w5EUQYSmeX99wiwAiLRE9s
         IRZWOAhf7bdzq2RFTTV50E6JUsxTdEUX/EObkoknu75w10gBvIh4GBwFpBWou1INWhmq
         f91in7ZakvdEoJ4wm8lOjiMmpZXI+6LDfASBC9z73G/Qd2uTe0sGWm2vOx8mXN7AXdzQ
         9fxEIt1CV2H83i6DEsk6bvXYLP8di9ic+XCbxbKLpiIrLFzxjHRb/KqKppyEQqskUY6p
         4nCw==
X-Forwarded-Encrypted: i=1; AJvYcCWnhoodtKRQnt6Ki66djguVOY2NALIaF2fs9SRAtTPgu/O88fiG5GmID27qamWt2sZ4fr64IGgMX43imllZe6dE9nKcD0bUV7QaCmB//fr4
X-Gm-Message-State: AOJu0YyrYcwpZIBgTljDVPEY8EMHBqCrLY/1zY2IIObr+C9N4PiITVLh
	0O2g7jXbNuxibg5sm5OgjrmEHGC+7Zh5QF1WeARdtPCO58WLov6yrH313Gq36CKwila5NNS03/e
	cB94kOtwsQknm7MyFWZKZH/Lyz71hZ2irL4EQmQ==
X-Google-Smtp-Source: AGHT+IFhPWWZbPSpZ41rJEGw9JQOC3MSyyZstWUE8ZQsGCxE1OndwcIjQLNxLORidft8I/HoA5DyZytqJFxaLx8Id3o=
X-Received: by 2002:a05:6e02:d0d:b0:364:216e:d1dc with SMTP id
 g13-20020a056e020d0d00b00364216ed1dcmr6656541ilj.22.1708924800237; Sun, 25
 Feb 2024 21:20:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com> <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
In-Reply-To: <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Feb 2024 10:49:48 +0530
Message-ID: <CAAhSdy2TVSt=gCJRf78AzXNVFKy8MGJ+QspSEHeedT7GPAYkUQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Atish Patra <atishp@rivosinc.com>
Cc: Haibo Xu <xiaobo55x@gmail.com>, Atish Patra <atishp@atishpatra.org>, 
	Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_212002_312083_02FF54EC 
X-CRM114-Status: GOOD (  32.06  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMjowN+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIDIvMjAvMjQgMTg6MTMsIEhhaWJvIFh1IHdyb3RlOgo+
ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNzowM+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBA
YXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQg
MTo0OOKAr0FNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+
Pj4gTW92ZSB2Y3B1X2hhc19leHQgdG8gdGhlIHByb2Nlc3Nvci5jIGFuZCByZW5hbWUgaXQgdG8g
X192Y3B1X2hhc19leHQKPiA+Pj4gc28gdGhhdCBvdGhlciB0ZXN0IGNhc2VzIGNhbiB1c2UgaXQg
Zm9yIHZDUFUgZXh0ZW5zaW9uIGNoZWNrLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBIYWli
byBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIHwgIDIgKysKPiA+Pj4g
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jICAgICB8
IDEwICsrKysrKysrKysKPiA+Pj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yv
Z2V0LXJlZy1saXN0LmMgICAgICB8IDExICstLS0tLS0tLS0tCj4gPj4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nv
ci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29y
LmgKPiA+Pj4gaW5kZXggYjY4YjFiNzMxYTM0Li5iZDI3ZTFjNjc1NzkgMTAwNjQ0Cj4gPj4+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5o
Cj4gPj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3By
b2Nlc3Nvci5oCj4gPj4+IEBAIC00Miw2ICs0Miw4IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3Qg
X19rdm1fcmVnX2lkKHVpbnQ2NF90IHR5cGUsIHVpbnQ2NF90IGlkeCwKPiA+Pj4gICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfUkVHKGlkeCkgX19rdm1fcmVnX2lkKEtWTV9SRUdfUklTQ1ZfSVNBX0VY
VCwgXAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWR4LCBLVk1fUkVHX1NJWkVfVUxPTkcpCj4gPj4+Cj4gPj4+ICtib29sIF9fdmNwdV9oYXNfZXh0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCk7Cj4gPj4+ICsKPiA+Pj4gICBzdHJ1Y3Qg
ZXhfcmVncyB7Cj4gPj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmE7Cj4gPj4+ICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgc3A7Cj4gPj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4+PiBpbmRleCAzOWExZTk5MDJkZWMuLmRhZDcz
Y2UxODE2NCAxMDA2NDQKPiA+Pj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xp
Yi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4+PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gPj4+IEBAIC0xNSw2ICsxNSwxNiBAQAo+ID4+Pgo+
ID4+PiAgIHN0YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5kbGVyczsKPiA+Pj4KPiA+Pj4g
K2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4+
PiArewo+ID4+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUgPSAwOwo+ID4+PiArICAgICAg
IGludCByZXQ7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1
LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4+PiArCj4gPj4+ICsgICAgICAg
cmV0dXJuICFyZXQgJiYgISF2YWx1ZTsKPiA+Pj4gK30KPiA+Pj4gKwo+ID4+Cj4gPj4gTm90IHN1
cmUgd2hhdCB3YXMgdGhlIGJhc2UgcGF0Y2ggb24gd2hpY2ggdGhpcyB3YXMgcmViYXNlZC4gVGhl
IGFjdHVhbAo+ID4+IGNvbW1pdCBpbiB0aGUgcXVldWUgYnJhbmNoIGxvb2tzIGRpZmZlcmVudC4K
PiA+Pgo+ID4KPiA+IFRoaXMgcGF0Y2ggc2V0IHdhcyBiYXNlZCBvbiA2LjctcmM4Lgo+ID4KPiA+
PiBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4L2NvbW1pdC81NTYzNTE3Y2MyMDEy
ZTMzMjY0MTFiMzYwYzk5MjRkM2YyNzA2YzhkCj4gPj4KPiA+PiBCb3RoIHNlZW0gdG8gaGF2ZSB0
aGUgc2FtZSBidWcgdGhvdWdoIHRoZSB0ZXN0cyBmYWlsIG5vdyBhbmQgcmVxdWlyZQo+ID4+IHRo
ZSBmb2xsb3dpbmcgZml4Lgo+ID4+IFRoZSBleHQgaWQgc2hvdWxkIGJlIHVpbnQ2NF90IGFuZCB3
ZSBuZWVkIHRvIHBhc3MgZXh0IGRpcmVjdGx5IHNvIHRoYXQKPiA+PiBTQkkgZXh0ZW5zaW9uIHRl
c3RzIGNhbiBhbHNvIHBhc3MuCj4gPj4KPiA+Cj4gPiBJdCdzIHdlaXJkIHRoYXQgNi43LXJjOCBo
YXMgYWxyZWFkeSBpbmNsdWRlZCBBbmRyZXcncyBjaGFuZ2Ugb24gdGhlIElTQSBleHQgcmVnLAo+
ID4gYnV0IHRoaXMgcGF0Y2ggd2FzIG5vdCBnZW5lcmF0ZWQgYWdhaW5zdCBoaXMgY2hhbmdlLgo+
ID4KPiA+IGNvbW1pdCBiZGY2YWEzMjhmMTM3ZTE4NGIwZmNlNjA3ZmQ1ODUzNTRjMzc0MmYxCj4g
PiBBdXRob3I6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBEYXRl
OiAgIFdlZCBEZWMgMTMgMTg6MDk6NTggMjAyMyArMDEwMAo+ID4KPiA+ICAgICAgUklTQy1WOiBL
Vk06IHNlbGZ0ZXN0czogVHJlYXQgU0JJIGV4dCByZWdzIGxpa2UgSVNBIGV4dCByZWdzCj4gPgo+
ID4gQW55d2F5LCB5b3VyIGNoYW5nZXMgd2VyZSByaWdodC4gUGxlYXNlIGdvIGFoZWFkIHRvIGlu
Y2x1ZGUgdGhlbSB3aGVuIG1lcmdpbmcuCj4gPgo+Cj4gSSBhbSBub3Qgc3VyZSB3aGF0IGhhcHBl
bmVkLiBQcm9iYWJseSwgYSBtZXJnZSBjb25mbGljdCBpc3N1ZS4KPgo+IEkganVzdCByZWFsaXpl
ZCBJIGZvcmdvdCB0byBjb3B5IHBhc3RlIGFub3RoZXIgZml4IGluIGFyY2ggdGltZXIKPgo+ICsr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiBAQCAt
ODUsNyArODUsNyBAQCBzdHJ1Y3Qga3ZtX3ZtICp0ZXN0X3ZtX2NyZWF0ZSh2b2lkKQo+ICAgICAg
ICAgIGludCBucl92Y3B1cyA9IHRlc3RfYXJncy5ucl92Y3B1czsKPgo+ICAgICAgICAgIHZtID0g
dm1fY3JlYXRlX3dpdGhfdmNwdXMobnJfdmNwdXMsIGd1ZXN0X2NvZGUsIHZjcHVzKTsKPiAtICAg
ICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHVzWzBdLCBLVk1fUklTQ1ZfSVNB
X0VYVF9TU1RDKSwKPiArICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHVz
WzBdLAo+IFJJU0NWX0lTQV9FWFRfUkVHKEtWTV9SSVNDVl9JU0FfRVhUX1NTVEMpKSwKCkkgaGF2
ZSBzcXVhc2hlZCB0aGlzIGNoYW5nZSBpbnRvIGFuIGV4aXN0aW5nIGNvbW1pdCBpbiByaXNjdl9r
dm1fcXVldWUuCgpUaGFua3MsCkFudXAKCj4KPgo+ID4gVGhhbmtzLAo+ID4gSGFpYm8KPiA+Cj4g
Pj4KPiA+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9w
cm9jZXNzb3IuaAo+ID4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3Jpc2N2L3Byb2Nlc3Nvci5oCj4gPj4gQEAgLTQ4LDcgKzQ4LDcgQEAgc3RhdGljIGlubGluZSB1
aW50NjRfdCBfX2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwKPiA+PiB1aW50NjRfdCBzdWJ0eXBl
LAo+ID4+IEtWTV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSwgXAo+ID4+IGlkeCwgS1ZNX1JFR19TSVpF
X1VMT05HKQo+ID4+Cj4gPj4gLWJvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBpbnQgZXh0KTsKPiA+PiArYm9vbCBfX3ZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHVpbnQ2NF90IGV4dCk7Cj4gPj4KPiA+PiBzdHJ1Y3QgZXhfcmVncyB7Cj4gPj4gdW5z
aWduZWQgbG9uZyByYTsKPiA+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4+IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4+IGluZGV4IDI4MjU4N2NkNGJiYy4uZWM2NmQz
MzFhMTI3IDEwMDY0NAo+ID4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIv
cmlzY3YvcHJvY2Vzc29yLmMKPiA+PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
bGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gPj4gQEAgLTE1LDEyICsxNSwxMiBAQAo+ID4+Cj4gPj4g
c3RhdGljIHZtX3ZhZGRyX3QgZXhjZXB0aW9uX2hhbmRsZXJzOwo+ID4+Cj4gPj4gLWJvb2wgX192
Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4+ICtib29sIF9f
dmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWludDY0X3QgZXh0KQo+ID4+IHsK
PiA+PiB1bnNpZ25lZCBsb25nIHZhbHVlID0gMDsKPiA+PiBpbnQgcmV0Owo+ID4+Cj4gPj4gLSBy
ZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQpLCAmdmFsdWUp
Owo+ID4+ICsgcmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgZXh0LCAmdmFsdWUpOwo+ID4+Cj4g
Pj4gcmV0dXJuICFyZXQgJiYgISF2YWx1ZTsKPiA+PiB9Cj4gPj4KPiA+PiBXaXRoIHRoZSBhYm92
ZSB0aGUgZml4LCBCb3RoIFNCSS9JU0EgZXh0ZW5zaW9uIHRlc3RzIHBhc3MuCj4gPj4gIyAuL2dl
dC1yZWctbGlzdAo+ID4+IHNiaS1iYXNlOiBQQVNTCj4gPj4gc2JpLXN0YTogUEFTUwo+ID4+IHNi
aS1wbXU6IFBBU1MKPiA+PiBzYmktZGJjbjogUEFTUwo+ID4+IGFpYTogUEFTUwo+ID4+IGZwX2Y6
IFBBU1MKPiA+PiBmcF9kOiBQQVNTCj4gPj4gMS4uMCAjIFNLSVAgLSBoIG5vdCBhdmFpbGFibGUs
IHNraXBwaW5nIHRlc3RzCj4gPj4gc21zdGF0ZWVuOiBQQVNTCj4gPj4gc3Njb2ZwbWY6IFBBU1MK
PiA+PiBzc3RjOiBQQVNTCj4gPj4gMS4uMCAjIFNLSVAgLSBzdmludmFsIG5vdCBhdmFpbGFibGUs
IHNraXBwaW5nIHRlc3RzCj4gPj4gMS4uMCAjIFNLSVAgLSBzdm5hcG90IG5vdCBhdmFpbGFibGUs
IHNraXBwaW5nIHRlc3RzCj4gPj4gMS4uMCAjIFNLSVAgLSBzdnBibXQgbm90IGF2YWlsYWJsZSwg
c2tpcHBpbmcgdGVzdHMKPiA+PiB6YmE6IFBBU1MKPiA+PiB6YmI6IFBBU1MKPiA+PiB6YmM6IFBB
U1MKPiA+PiAxLi4wICMgU0tJUCAtIHpia2Igbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMK
PiA+PiAxLi4wICMgU0tJUCAtIHpia2Mgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPiA+
PiAxLi4wICMgU0tJUCAtIHpia3ggbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPiA+PiB6
YnM6IFBBU1MKPiA+PiB6ZmE6IFBBU1MKPiA+PiAxLi4wICMgU0tJUCAtIHpmaCBub3QgYXZhaWxh
YmxlLCBza2lwcGluZyB0ZXN0cwo+ID4+IDEuLjAgIyBTS0lQIC0gemZobWluIG5vdCBhdmFpbGFi
bGUsIHNraXBwaW5nIHRlc3RzCj4gPj4gemljYm9tOiBQQVNTCj4gPj4gemljYm96OiBQQVNTCj4g
Pj4gemljbnRyOiBQQVNTCj4gPj4gMS4uMCAjIFNLSVAgLSB6aWNvbmQgbm90IGF2YWlsYWJsZSwg
c2tpcHBpbmcgdGVzdHMKPiA+PiB6aWNzcjogUEFTUwo+ID4+IHppZmVuY2VpOiBQQVNTCj4gPj4g
emloaW50bnRsOiBQQVNTCj4gPj4gemloaW50cGF1c2U6IFBBU1MKPiA+PiB6aWhwbTogUEFTUwo+
ID4+Cj4gPj4KPiA+Pj4gICBzdGF0aWMgdWludDY0X3QgcGFnZV9hbGlnbihzdHJ1Y3Qga3ZtX3Zt
ICp2bSwgdWludDY0X3QgdikKPiA+Pj4gICB7Cj4gPj4+ICAgICAgICAgIHJldHVybiAodiArIHZt
LT5wYWdlX3NpemUpICYgfih2bS0+cGFnZV9zaXplIC0gMSk7Cj4gPj4+IGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+Pj4gaW5kZXggMjVk
ZTRiOGJjMzQ3Li5lZDI5YmE0NTU4OGMgMTAwNjQ0Cj4gPj4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4+PiArKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+Pj4gQEAgLTc1LDE1ICs3
NSw2IEBAIGJvb2wgY2hlY2tfcmVqZWN0X3NldChpbnQgZXJyKQo+ID4+PiAgICAgICAgICByZXR1
cm4gZXJyID09IEVJTlZBTDsKPiA+Pj4gICB9Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgaW5saW5lIGJv
b2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiA+Pj4gLXsK
PiA+Pj4gLSAgICAgICBpbnQgcmV0Owo+ID4+PiAtICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWU7
Cj4gPj4+IC0KPiA+Pj4gLSAgICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9J
U0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4+PiAtICAgICAgIHJldHVybiAocmV0KSA/IGZh
bHNlIDogISF2YWx1ZTsKPiA+Pj4gLX0KPiA+Pj4gLQo+ID4+PiAgIHZvaWQgZmluYWxpemVfdmNw
dShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4+PiAg
IHsKPiA+Pj4gICAgICAgICAgdW5zaWduZWQgbG9uZyBpc2FfZXh0X3N0YXRlW0tWTV9SSVNDVl9J
U0FfRVhUX01BWF0gPSB7IDAgfTsKPiA+Pj4gQEAgLTExMSw3ICsxMDIsNyBAQCB2b2lkIGZpbmFs
aXplX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykK
PiA+Pj4gICAgICAgICAgICAgICAgICBfX3ZjcHVfc2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhU
X1JFRyhzLT5mZWF0dXJlKSwgMSk7Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgICAgLyogRG91
YmxlIGNoZWNrIHdoZXRoZXIgdGhlIGRlc2lyZWQgZXh0ZW5zaW9uIHdhcyBlbmFibGVkICovCj4g
Pj4+IC0gICAgICAgICAgICAgICBfX1RFU1RfUkVRVUlSRSh2Y3B1X2hhc19leHQodmNwdSwgcy0+
ZmVhdHVyZSksCj4gPj4+ICsgICAgICAgICAgICAgICBfX1RFU1RfUkVRVUlSRShfX3ZjcHVfaGFz
X2V4dCh2Y3B1LCBzLT5mZWF0dXJlKSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiJXMgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHNcbiIsIHMtPm5hbWUpOwo+ID4+
PiAgICAgICAgICB9Cj4gPj4+ICAgfQo+ID4+PiAtLQo+ID4+PiAyLjM0LjEKPiA+Pj4KPiA+Pgo+
ID4+Cj4gPj4gLS0KPiA+PiBSZWdhcmRzLAo+ID4+IEF0aXNoCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
