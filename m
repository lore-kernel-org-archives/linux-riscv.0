Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239BBC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=509bS8gQcaPmy88RIAIf9v/NZq8YKsqX6eDmrB19r9I=; b=aEtlZPNGs6rRO0
	I6DTMpGV4YpcO2N5ayZQAi/qvh5SKl+RSZ3tmWPTg3H5fZqgot7VkqXM5oiuHcdtR+nIJW0ZE/D15
	cA0VQKY21JiSKXQ84L+SSvSm9+qmuXrU4p+uCu2wPmrFSsLN4v181/CiJH8RlowfzdxwnpYiKbXyb
	fTInKe6ruQPPwsYf/cRbrMNGWFNpL+ZvwOBEeBVs6X3ljHjIpZsNA4apuSqnp9ptTLmO1s25z8rqo
	iRMOr20TD9IXSXRHKmvZatm0m5qIeATcMYCj+iRWJ/D0Lvv98sInLOT2muXnuE2rpfsSJUmX6/b08
	m0591FGEInrVKXCJ8J8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVM5-00000005G8o-3xfH;
	Mon, 12 Feb 2024 12:24:13 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVM3-00000005G7p-1FNr
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 12:24:12 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-363da712713so11494555ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707740649; x=1708345449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CQJAbVN1hEJxIfRK6BeBiBHbVNEAmKsPHC3r9j+pPA=;
        b=BLddaAaWksOXxQ5P40DehyQ90wBQPI6OsG8ydlhnbIpXpgbj5u+V9BujJH2ZY5d9qN
         Av8kTGPp6KCcihT3EKgCFFzOHOQGY3AUjdwI6TfXoVpAqMZvl13EZMIMH2f6hGKzoekt
         06WdFv/uoRC/5ecxDXgwzC5f6jB3pjIBvSun6RmKJ3GqbT14TTIfkQGimK/toHjkuD4K
         FyCl+aXXae2UH5OZWNFLI/PKflgYvcb4cfetFkG75q4j92h8taA9hDQ1GXjpApv7Pz0/
         be2YnJ4JbjtyFg10qQaPv4mj7M26Xblt8NRgw/qOwMI555LKIefSZ/U2e1FsfJiiHCS5
         foaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740649; x=1708345449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CQJAbVN1hEJxIfRK6BeBiBHbVNEAmKsPHC3r9j+pPA=;
        b=SXjRv4r+qbS/D2LyLGOLUGMSNyFDpafSuB8lPCpuAXhUBB4Naq6ejF1/IYi8JU8TDw
         e/y1VfeN9OrLzy3s66q7c2ZzGWEoBfE1bDmWhLRW341LaegGUD5hy6SRDgDk8595MCQH
         1rLn7HAXnIS/5V1nJXAoxMmiXFXTbm+Ky7qwcmw9PEh9nUn9C9QVi3YyGvWRyc1Uak4h
         s+ds5iUjC1NAXGUykobTU5ISYZQV3Q3qCYrdj/v1HslJVSca75XZ01C7MBfwdN9yf7mP
         rn2ACOQnrk6fU2tGYgkJgKHy3kITOobcek2WZxUpE9kkPyz/CdJTFTWmoCtLoC98SBd3
         BdXw==
X-Gm-Message-State: AOJu0YzpjBuvRPishjysPS04WfAheluULOVx69zXNqLl98Qxb8DW3E0z
	oX8tSoo5I6yMz1+LUuqiuE/IED/Qf9EsEW2dmgE+d0tjuji+QLA8xf+azEPqvc5dqVk3cs2dBGu
	2lZgEe4mUwI6S98MUKpsbQJ0O731oKEW7ajg5+Q==
X-Google-Smtp-Source: AGHT+IGzhXfq5zT3FYgC1LPkY3wsC1WD62YVWVgEP5W8s001037XANdQn59nNXrbCGSEhsi8pEoYiewroYfMiW87JoM=
X-Received: by 2002:a92:caca:0:b0:363:e7ff:f378 with SMTP id
 m10-20020a92caca000000b00363e7fff378mr8506844ilq.28.1707740649498; Mon, 12
 Feb 2024 04:24:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Feb 2024 17:53:58 +0530
Message-ID: <CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atishp@atishpatra.org>, 
	Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_042411_586121_E235F56A 
X-CRM114-Status: GOOD (  14.55  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMzoxNeKAr1BNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPiB3cm90ZToKPgo+IFRoZSBSSVNDLVYgYXJjaF90aW1lciBzZWxmdGVzdHMgaXMgdXNl
ZCB0byB2YWxpZGF0ZSBTc3RjIHRpbWVyCj4gZnVuY3Rpb25hbGl0eSBpbiBhIGd1ZXN0LCB3aGlj
aCBzZXRzIHVwIHBlcmlvZGljIHRpbWVyIGludGVycnVwdHMKPiBhbmQgY2hlY2sgdGhlIGJhc2lj
IGludGVycnVwdCBzdGF0dXMgdXBvbiBpdHMgcmVjZWlwdC4KPgo+IFRoaXMgS1ZNIHNlbGZ0ZXN0
cyB3YXMgcG9ydGVkIGZyb20gYWFyY2g2NCBhcmNoX3RpbWVyIGFuZCB0ZXN0ZWQKPiB3aXRoIExp
bnV4IHY2LjctcmM4IG9uIGEgUWVtdSByaXNjdjY0IHZpcnQgbWFjaGluZS4KPgo+IC0tLQo+IENo
YW5nZWQgc2luY2UgdjQ6Cj4gICAqIFJlYmFzZWQgdG8gTGludXggNi43LXJjOAo+ICAgKiBBZGRl
ZCBuZXcgcGF0Y2goMi8xMikgdG8gY2xlYW4gdXAgdGhlIGRhdGEgdHlwZSBpbiBzdHJ1Y3QgdGVz
dF9hcmdzCj4gICAqIFJlLW9yZGVyZWQgcGF0Y2goMTEvMTEpIGluIHY0IHRvIHBhdGNoKDMvMTIp
Cj4gICAqIENoYW5nZWQgdGhlIHRpbWVyX2Vycl9tYXJnaW5fdXMgdHlwZSBmcm9tIGludCB0byB1
aW50MzJfdAo+Cj4gSGFpYm8gWHUgKDExKToKPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRGF0
YSB0eXBlIGNsZWFudXAgZm9yIGFyY2hfdGltZXIgdGVzdAo+ICAgS1ZNOiBhcm02NDogc2VsZnRl
c3RzOiBFbmFibGUgdHVuaW5nIG9mIGVycm9yIG1hcmdpbiBpbiBhcmNoX3RpbWVyCj4gICAgIHRl
c3QKPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogU3BsaXQgYXJjaF90aW1lciB0ZXN0IGNvZGUK
PiAgIEtWTTogc2VsZnRlc3RzOiBBZGQgQ09ORklHXzY0QklUIGRlZmluaXRpb24gZm9yIHRoZSBi
dWlsZAo+ICAgdG9vbHM6IHJpc2N2OiBBZGQgaGVhZGVyIGZpbGUgY3NyLmgKPiAgIHRvb2xzOiBy
aXNjdjogQWRkIGhlYWRlciBmaWxlIHZkc28vcHJvY2Vzc29yLmgKPiAgIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogU3dpdGNoIHRvIHVzZSBtYWNybyBmcm9tIGNzci5oCj4gICBLVk06IHJpc2N2OiBz
ZWxmdGVzdHM6IEFkZCBleGNlcHRpb24gaGFuZGxpbmcgc3VwcG9ydAo+ICAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBBZGQgZ3Vlc3QgaGVscGVyIHRvIGdldCB2Y3B1IGlkCj4gICBLVk06IHJpc2N2
OiBzZWxmdGVzdHM6IENoYW5nZSB2Y3B1X2hhc19leHQgdG8gYSBjb21tb24gZnVuY3Rpb24KPiAg
IEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNzdGMgdGltZXIgdGVzdAo+Cj4gUGFvbG8gQm9u
emluaSAoMSk6Cj4gICBzZWxmdGVzdHMva3ZtOiBGaXggaXNzdWVzIHdpdGggJChTUExJVF9URVNU
UykKClJlYmFzZWQgb24gTGludXgtNi44LXJjNCBhbmQgcXVldWVkIHRoaXMgc2VyaWVzIGZvciBM
aW51eC02LjkKClRoYW5rcywKQW51cAoKPgo+ICB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oICAgICAgICAgICAgfCA1NDEgKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8ICAzMiArKwo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUgICAgICAgICAgfCAgMjcgKy0KPiAgLi4uL3NlbGZ0
ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMgICAgICAgIHwgMjk1ICstLS0tLS0tLS0KPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FyY2hfdGltZXIuYyAgICAgIHwgMjU5ICsrKysr
KysrKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2FhcmNoNjQvcHJvY2Vzc29yLmggfCAg
IDQgLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCAgICAgfCAg
IDkgKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L2FyY2hfdGltZXIuaCAgfCAg
NzEgKysrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggICB8
ICA2NSArKy0KPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Rlc3RfdXRpbC5o
IHwgICAyICsKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmggICAgICAg
IHwgIDQ1ICsrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5TICAgICAg
ICB8IDEwMSArKysrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAg
ICAgICB8ICA4NyArKysKPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3Rp
bWVyLmMgIHwgMTExICsrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0
LmMgICAgICAgIHwgIDExICstCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDEzNTMgaW5zZXJ0aW9ucygr
KSwgMzA3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYXJjaF90aW1lci5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9hcmNoX3RpbWVyLmgK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3RpbWVyX3Rlc3QuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5TCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4KPiAtLQo+IDIuMzQuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
