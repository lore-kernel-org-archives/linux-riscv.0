Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1332BC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzZtfQqf+M6mJdH3BFYUsSKN9gLyS8aH3tn60v6BL+U=; b=CvB2tbhk214jNY
	6Tq08Bp5fmSbsqfPE0zdu9JrW+I3tIiOEPfROFIUQXQowBNyGerGVN96zhRkQoS+omGQScIoYXO9Y
	Jo5JYVkfCx6OCRbsTvv13pho1Tk64K6dfMu/VrDBCJ20ojLdyU4Oa6cUFtdfzXu1ZX+1jndko4fS+
	QSqsYgyacQP+hGOwinut0ra6oy33P8K/SD9uqNTnSEZrN/j08UXIatvlcq9iPK8FGo3Eo2dtKHS5H
	MUS+YkSREjnyc2g0/MDZp7Llda1wllqUihXSt3Wp/ebEmeDrSmRcttev6ljI8bttKV0fE0WonSnfM
	QspBZrESlYcH8TSM4PaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmKy-00000000yIT-04gA;
	Wed, 21 Feb 2024 13:08:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmKv-00000000yHu-2SQF;
	Wed, 21 Feb 2024 13:08:35 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so87379391fa.3;
        Wed, 21 Feb 2024 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708520911; x=1709125711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxTdzzSE56mojm4+aLf5g+MB1IpHlx8dtkV73gFQqhM=;
        b=OLbJ13ElsumJK9C2jeJhoNuKvBaVIrY9V2JlLcQ1UHDYJsu5FDR2FMfl4Rt1UR19YQ
         Sc6Zqfq9W1p6K3PyFknQzYo0zmJUqOCFChOrDt9qC1oeW9NaAx3rQgUdlAvnNNp5cEp7
         qEupo9GvH5Yg/jvE7Flp//elvU1tZa4uFhnzO4qk35ykqXuGYrG1A+I4JUsn4PLG9vrp
         fOTXMoakCUKAMISTQSmCHMKqbih49sRDxFfQzL3K4IeYWZwexzLhheL+xZxMPo3vURcB
         lRi+MgNhzuJHmmCEwCLL65Gh0KPm1d8dZ6MpGblFmK1ysmaXRGOCN4WX+0IahYLCA22s
         1kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520911; x=1709125711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxTdzzSE56mojm4+aLf5g+MB1IpHlx8dtkV73gFQqhM=;
        b=JDIy52J09zU3VMnnw5SNjdC6wtQSKTl75qxfI56J/mtmdeQUBvLGIuKqlEC2TCn7iA
         yo26olOYCq/vULgu2BBIwqjmBDT9/6+0IhIztp84B8bHzjyftPJni1m8LmvhOp5XZXc1
         tah/KKIg1ex4uUmNphTD0+PCEKsiMUpVh+C4y0zCmIpvvJrYP6+UN9qEkQ8gTy8RvMy7
         FRlAleWy2lxvgXv9AcsVl22kwJjXzi3k33SA+GJv5Jx51XOeI9da31NjojaA7zkR6WJY
         IJzsoIDhosE9UA1AtVYxucPZQt7oTmnYyXoqsiH/DwiJH8zngveXJUb05N0st7wNs3zn
         ybEA==
X-Forwarded-Encrypted: i=1; AJvYcCVCc12wKY9Yeg00WTPPo9zNAhQz8ko6+2HwvmM9Ta8jeSyz2NYTy3ZYm8oEFA4e8uAgMlzU9WJFzYKxnJD42YJf/qrV61i6WIUXIPG1zy82C823hTL4PU0mL+eElDOwhbkIPSOOc5s8FuMRFRgdxb+JISYFX+VKS1oOQcYCtISJshRXyBXx0+DrMi5rQLMj9BM8Gruv
X-Gm-Message-State: AOJu0YwartAJr5uvtoRR8okAvXn23ZNkzbPEMIZlU5tUsOFgeVHc/lHi
	TTXfaevxN8t3QkK6Uc0k5/ySA9rELO6PZ+mPNENsEi7ERPk92Jpfd59rvBy4XHAEbK67o9XOb+E
	VCEVc3jqtx4yds9zwEuo4nuQhPhw=
X-Google-Smtp-Source: AGHT+IEk4EjMAGYcW7Lzh75VAr5eflBXeC5jYHyhHnNqToNfa6pIH+DcVLj0qhM47mORzIqfli6g83qnltBwS3v9GvE=
X-Received: by 2002:a2e:6e08:0:b0:2d0:aa06:f496 with SMTP id
 j8-20020a2e6e08000000b002d0aa06f496mr12067305ljc.40.1708520910575; Wed, 21
 Feb 2024 05:08:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com> <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
In-Reply-To: <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 21 Feb 2024 21:08:19 +0800
Message-ID: <CAJve8omCZxsiP1jF0n5SBh0_U6q7Exj5A1ACFahWpdBoxohaMA@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240221_050833_653416_691286AB 
X-CRM114-Status: GOOD (  28.76  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNDozN+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
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
WzBdLAo+IFJJU0NWX0lTQV9FWFRfUkVHKEtWTV9SSVNDVl9JU0FfRVhUX1NTVEMpKSwKPgoKUmln
aHQgRml4IQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIHJlYmFzZSB0aGlzIHBhdGNo
IHNlcmllcyBvbiB5b3VyIHRyZWUKYW5kIHJlc2VudCBpdC4KClRoYW5rcywKSGFpYm8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
