Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7631EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 03:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsXwzV1Cr5u3ez7tr1govPt2ccT+d4XKK9oztRLnILA=; b=ueZKPj0XfvKBLz
	KaQO09oBnP4q15lFDpA3r99ENO9xpvB8nb09ebxDxLnj4gF9INBTLWznY7JbeId2NvkRItQ/5do+J
	W5h3UsQ2gjc7RQfZHxQztR7V8CImPu0ZBlmm2i/3KvjQHCrMIxPpgoMQTCfV+K27rsAQJgyDehqwY
	k6xIhkoUuVZpbRZ9BihPDBdLTEAPRMNgo1/eGDsvA1+iP3raw011lHu/8E0loVB4+r7RNnzC3fqSn
	A8a/D+WZNrsxy/+66dUG4ovjIUZkEkBzejMtZJm2ARPyPxfDVxBA8cOjmCwUYuoc2RBwBO9aNoGTd
	EbIFlLD2iQpBrsdsUqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSrEh-00G5uU-1S;
	Mon, 07 Aug 2023 03:48:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSrEd-00G5sf-2b
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 03:48:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5230f8da574so961333a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Aug 2023 20:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691380125; x=1691984925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bns5NuOnFHjf4+AhxK6OdiLKU/uYDW/dYLyqP2UAOt4=;
        b=5LEnuLe6+rBNX3zvpPKPIdTqqnxWUz738hsVOkmEBZH2bi40Ti+h6hJSvGjAVK7k+t
         dHk25/OASOQPlDXjFWyNqGEqFz98nybJEnn4a8eiZ9+so87/6fNBzBq+1+UGOPOFuESW
         zAGuk1oq4XTKNeSdOrWID5h2t2Bbm9qH8ECfTAYsya9MP9jF3oRSFnqymLvshliQupLU
         aVBtHihjRnYkd0HekrClm6sQL02NknOm832ejQQIYLXrNtyGUdFoo3K1Sqy1bpjMVR4k
         KQh2jUGOBKILi2W/cvrlXAfAEASLdhBNpmKZF7ceGWfp50NovnwspgLkg75Rn7fGcYu/
         ljeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691380125; x=1691984925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bns5NuOnFHjf4+AhxK6OdiLKU/uYDW/dYLyqP2UAOt4=;
        b=TXZUVD8GJENksPXhFNeTz+TM5ytopRhCBOTh3DQqv3g4aF6uyb5GSGpLLLyrpM7ShV
         WUjSNPUk24Bnj2msvkfDFyZ2cq/rr/9RhqGeYCeSE4A6N4hqUsQRfOFXJlVcMI3GQ+zg
         oESnHVvgeefhyUSkqJ0g9Pm21gYAETrW69uNMxaKFsT3AmyuEhVFN6jPCCxz8lyPpaJA
         n4gt4LBWVcEKBb5qJSmDyQ4kaK8V/mYWZOZCT0xmXWWTiEZIZeGQPcXp2u0msrazOphW
         GtKQ9I+EqFDwjI3S2ul0iQiiYZPbbgRWrOmZ8sdAbR8D0cYf42Taw9lUlcPJtoHitJMP
         hBwQ==
X-Gm-Message-State: AOJu0YxTRkVTfiIkM/u4ooU1sOuAke+VIsuAulQ0MyZMz4Gn4L+uNc8q
	HKdu7x+v4UumDyJJ32tzlib7WoS2RQGrbtcFH+0aEg==
X-Google-Smtp-Source: AGHT+IFA4Pcl20GhvvrZF32CrVlsSTz8804Kwavv3GghPlUogdRMps2PmuTBdGKwOlui5rGci5M5f/LYq0TGzIIAZN4=
X-Received: by 2002:a17:906:2250:b0:993:eddd:6df9 with SMTP id
 16-20020a170906225000b00993eddd6df9mr7298478ejr.2.1691380124601; Sun, 06 Aug
 2023 20:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1690273969.git.haibo1.xu@intel.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Aug 2023 09:18:33 +0530
Message-ID: <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To: maz@kernel.org, oliver.upton@linux.dev
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com, seanjc@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	Haibo Xu <haibo1.xu@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_204847_844590_7D3DCDD1 
X-CRM114-Status: GOOD (  18.48  )
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

SGkgTWFyYywgSGkgT2xpdmVyLAoKT24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMjowNeKAr1BNIEhh
aWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPgo+IEtWTV9HRVRfUkVHX0xJU1Qg
d2lsbCBkdW1wIGFsbCByZWdpc3RlciBJRHMgdGhhdCBhcmUgYXZhaWxhYmxlIHRvCj4gS1ZNX0dF
VC9TRVRfT05FX1JFRyBhbmQgSXQncyB2ZXJ5IHVzZWZ1bCB0byBpZGVudGlmeSBzb21lIHBsYXRm
b3JtCj4gcmVncmVzc2lvbiBpc3N1ZSBkdXJpbmcgVk0gbWlncmF0aW9uLgo+Cj4gUGF0Y2ggMS03
IHJlLXN0cnVjdHVyZWQgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGluIGFhcmNoNjQgdG8gbWFrZSBz
b21lCj4gb2YgdGhlIGNvZGUgYXMgY29tbW9uIHRlc3QgZnJhbWV3b3JrIHRoYXQgY2FuIGJlIHNo
YXJlZCBieSByaXNjdi4KPgo+IFBhdGNoIDggbW92ZSByZWplY3Rfc2V0IGNoZWNrIGxvZ2ljIHRv
IGEgZnVuY3Rpb24gc28gYXMgdG8gY2hlY2sgZm9yCj4gZGlmZmVyZW50IGVycm5vIGZvciBkaWZm
ZXJlbnQgcmVnaXN0ZXJzLgo+IFBhdGNoIDkgbW92ZSBmaW5hbGl6ZV92Y3B1IGJhY2sgdG8gcnVu
X3Rlc3Qgc28gdGhhdCByaXNjdiBjYW4gaW1wbGVtZW50Cj4gaXRzIHNwZWNpZmljIG9wZXJhdGlv
bi4KPiBQYXRjaCAxMCBjaGFuZ2UgdG8gZG8gdGhlIGdldC9zZXQgb3BlcmF0aW9uIG9ubHkgb24g
cHJlc2VudC1ibGVzc2VkIGxpc3QuCj4gUGF0Y2ggMTEgYWRkIHRoZSBza2lwX3NldCBmYWNpbGl0
aWVzIHNvIHRoYXQgcmlzY3YgY2FuIHNraXAgc2V0IG9wZXJhdGlvbgo+IG9uIHNvbWUgcmVnaXN0
ZXJzLgo+IFBhdGNoIDEyIGVuYWJsZWQgdGhlIEtWTV9HRVRfUkVHX0xJU1QgQVBJIGluIHJpc2N2
Lgo+IHBhdGNoIDEzIGFkZGVkIHRoZSBjb3JyZXNwb25kaW5nIGtzZWxmdGVzdCBmb3IgY2hlY2tp
bmcgcG9zc2libGUKPiByZWdpc3RlciByZWdyZXNzaW9ucy4KPgo+IFRoZSBnZXQtcmVnLWxpc3Qg
a3ZtIHNlbGZ0ZXN0IHdhcyBwb3J0ZWQgZnJvbSBhYXJjaDY0IGFuZCB0ZXN0ZWQgd2l0aAo+IExp
bnV4IHY2LjUtcmMzIG9uIGEgUWVtdSByaXNjdjY0IHZpcnQgbWFjaGluZS4KPgo+IC0tLQo+IENo
YW5nZWQgc2luY2UgdjU6Cj4gICAqIFJlYmFzZSB0byB2Ni41LXJjMwo+ICAgKiBNaW5vciBmaXgg
Zm9yIEFuZHJldydzIGNvbW1lbnRzCj4KPiBBbmRyZXcgSm9uZXMgKDcpOgo+ICAgS1ZNOiBhcm02
NDogc2VsZnRlc3RzOiBSZXBsYWNlIHN0cl93aXRoX2luZGV4IHdpdGggc3RyZHVwX3ByaW50Zgo+
ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBEcm9wIFNWRSBjYXAgY2hlY2sgaW4gcHJpbnRfcmVn
Cj4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJlbW92ZSBwcmludF9yZWcncyBkZXBlbmRlbmN5
IG9uIHZjcHVfY29uZmlnCj4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJlbmFtZSB2Y3B1X2Nv
bmZpZyBhbmQgYWRkIHRvIGt2bV91dGlsLmgKPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRGVs
ZXRlIGNvcmVfcmVnX2ZpeHVwCj4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFNwbGl0IGdldC1y
ZWctbGlzdCB0ZXN0IGNvZGUKPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRmluaXNoIGdlbmVy
YWxpemluZyBnZXQtcmVnLWxpc3QKPgo+IEhhaWJvIFh1ICg2KToKPiAgIEtWTTogYXJtNjQ6IHNl
bGZ0ZXN0czogTW92ZSByZWplY3Rfc2V0IGNoZWNrIGxvZ2ljIHRvIGEgZnVuY3Rpb24KPiAgIEtW
TTogYXJtNjQ6IHNlbGZ0ZXN0czogTW92ZSBmaW5hbGl6ZV92Y3B1IGJhY2sgdG8gcnVuX3Rlc3QK
PiAgIEtWTTogc2VsZnRlc3RzOiBPbmx5IGRvIGdldC9zZXQgdGVzdHMgb24gcHJlc2VudCBibGVz
c2VkIGxpc3QKPiAgIEtWTTogc2VsZnRlc3RzOiBBZGQgc2tpcF9zZXQgZmFjaWxpdHkgdG8gZ2V0
X3JlZ19saXN0IHRlc3QKPiAgIEtWTTogcmlzY3Y6IEFkZCBLVk1fR0VUX1JFR19MSVNUIEFQSSBz
dXBwb3J0Cj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdAoK
QXJlIHlvdSBva2F5IGZvciB0aGlzIHNlcmllcyB0byBnbyB0aHJvdWdoIHRoZSBLVk0gUklTQy1W
IHRyZWUgPwoKUmVnYXJkcywKQW51cAoKPgo+ICBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5y
c3QgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMzc1ICsrKysrKysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vTWFrZWZpbGUgICAgICAgICAgfCAgMTMgKy0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0v
YWFyY2g2NC9nZXQtcmVnLWxpc3QuYyAgICAgIHwgNTU0ICsrLS0tLS0tLS0tLS0KPiAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jICAgIHwgNDAxICsrKysrKysrKwo+
ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCAgICAgfCAgMjEgKwo+
ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgfCAgIDMgKwo+
ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGVzdF91dGlsLmggfCAgIDIgKwo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Rlc3RfdXRpbC5jICAgfCAgMTUgKwo+
ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCA3ODAgKysr
KysrKysrKysrKysrKysrCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDE2NzAgaW5zZXJ0aW9ucygrKSwg
NDk2IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPgo+IC0tCj4gMi4zNC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
