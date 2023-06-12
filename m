Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B364C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5Oqeyb6VMddKEjUCFyZ+LnaOUkWWRCshNnEYCHVDJo=; b=BhrgqeToQ/Urdo
	reZ4FjupBCZUGMMcmOrv52KEnwrXIS8pI7JvggeEtAoT+yfrP5vSUwCtnmZLWrKStO2eoTFmcuDwf
	Tp2l9Ok0d/Uk+FoQNlkRMfxa8hwKQTGyLCw34SLfzXi0AU16d7PapkGjM6PxnOyeEsOQyRd+FQx5t
	SmKBfbNLGQDPf224l3XqyHm4wO2ogNtiLXY0tO+GYKOsDMgZkyuqFtOX1a4ZGahYs4O9xLCT+o55F
	XtHaZB4qq4K9yVJfoTeKKN+OCPMukXKZugsGPdms68DPehIQQYyfs2Oo8g/KKp8tZwKpatLGilgF7
	3tVupZwptua1M/MtwbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e6N-003Lje-1l;
	Mon, 12 Jun 2023 09:44:43 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e6K-003Lhu-1P;
	Mon, 12 Jun 2023 09:44:41 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b2f0a140b7so574538a34.3;
        Mon, 12 Jun 2023 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686563078; x=1689155078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxkf6jrO4dEZx2mwSY4xMRu+z/wFzxrSpMsDqPXhZ5o=;
        b=W66LBfOWiiTsiZ/jfv9BUP8aQ4UfXXP7S7asvtInvAZ0+41KbPzHcmy+DZbscCDnCs
         J0VsiXPFg7xu6lz+cGKwTFsn6EJM/iPxDuG/08DA0toBY3blImbX8Ar1cPBN6OUUkl1Z
         E5Cw5qfEpazhmrnDES7MzPWC29a6FXJRN0xcKUtwEf0++rZL5U/c9Enzu1vC8wFAQp3r
         Tla5PgbfaXjpxm9AM1Ffyu9eId7z9ELqBGA2mhu73RxrC0HdT5YzwA5jRvDu2hrLFPxF
         R3ssFuKYAfdKEjA/N3KJOTQ7/V0CejatMjwjb1g5llwpK/SGadIr9K6S1er5ehndO0OQ
         gnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563078; x=1689155078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxkf6jrO4dEZx2mwSY4xMRu+z/wFzxrSpMsDqPXhZ5o=;
        b=DYS/VvtFZxXRz/5WjV70XeuZQQT8KnOuY0+/0bXWyovTFNWysbLI3SLIfo3s2Eo7Ne
         3pkvBHYS5NKa3zFBR2E5gu9qGfIsCfvcp9ndPJKawYMk03pYY/yZCaRTyClPSI4ktW7h
         mLriBa87N7A9L6KxhpDle8WEQaJ39a1QOyEWuAkkcPOvrJIKdgmSTdlAwo/rmeijODst
         KQ8psv43vsKpsjPuPfAMLjIl9kvKqsQkxejeZD+o2aDACQaExD5582ydIrgnTD/MqZMG
         /1RLX9Vp0rGBJY0FwWhrEfQkCsAD2oNrI29e1IHSt5vLIwOzrfnFyy/kYHG/WZdejwid
         RmOQ==
X-Gm-Message-State: AC+VfDznOwq+4pv9T4ZOv/kdOlQfvFH/A+DQg3znu/sr3sBCmlaor6Zh
	ZgmIjgubH/ODRLGcaYEdq8123TCm5/1sKGckYeI=
X-Google-Smtp-Source: ACHHUZ7x6+asQtR9uojrnXOYMbtxE9WXKqmvAG5Y58QN3Q+1M9AvT+ew0zEvisqgZmSNnEvIcddaaMqz+PXoYqJFll8=
X-Received: by 2002:a05:6808:189e:b0:396:40c4:a2ef with SMTP id
 bi30-20020a056808189e00b0039640c4a2efmr4005165oib.11.1686563078478; Mon, 12
 Jun 2023 02:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
 <20230609-05521f954b0485c69612f00b@orel> <CAJve8omPV_XgCSvw8POZwisb6uTOFMJU4FyAKArryui2SAsqtw@mail.gmail.com>
 <20230612-05314de3b73277af1ee729b0@orel>
In-Reply-To: <20230612-05314de3b73277af1ee729b0@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 12 Jun 2023 17:44:27 +0800
Message-ID: <CAJve8om8tjsXejtBWjuSg+kCUgfDdzq2AS2abC0qx9q2a7eSQw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set operation
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
X-CRM114-CacheID: sfid-20230612_024440_478013_DB79516F 
X-CRM114-Status: GOOD (  38.71  )
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgNDo1N+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMTA6MzU6
MjRBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biA5LCAyMDIzIGF0IDU6
MjTigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gRnJpLCBKdW4gMDksIDIwMjMgYXQgMTA6MTI6MTdBTSArMDgwMCwgSGFpYm8g
WHUgd3JvdGU6Cj4gPiA+ID4gU2V0IG9wZXJhdGlvbiBvbiBzb21lIHJpc2N2IHJlZ2lzdGVycyht
b3N0bHkgcGVzdWRvIG9uZXMpIHdhcyBub3QKPiA+ID4gPiBzdXBwb3J0ZWQgYW5kIHNob3VsZCBi
ZSBza2lwcGVkIGluIHRoZSBnZXQtcmVnLWxpc3QgdGVzdC4gSnVzdAo+ID4gPiA+IHJldXNlIHRo
ZSByZWplY3RzX3NldCB1dGlsaXRpZXMgdG8gaGFuZGxlIGl0IGluIHJpc2N2Lgo+ID4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiA+
ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYyB8IDIwICsrKysrKysrKysrKystLS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gPiA+IGluZGV4IGM0YmQ1YTUy
NTlkYS4uYWJhY2I5NWMyMWM2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gPiA+IEBAIC0yMTEsMTYgKzIxMSwyMiBAQCBz
dGF0aWMgdm9pZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgKytmYWlsZWRfZ2V0Owo+ID4gPiA+ICAgICAgICAgICAgICAgfQo+
ID4gPiA+Cj4gPiA+ID4gLSAgICAgICAgICAgICAvKiByZWplY3RzX3NldCByZWdpc3RlcnMgYXJl
IHJlamVjdGVkIGFmdGVyIEtWTV9BUk1fVkNQVV9GSU5BTElaRSAqLwo+ID4gPiA+ICsgICAgICAg
ICAgICAgLyoKPiA+ID4gPiArICAgICAgICAgICAgICAqIHJlamVjdHNfc2V0IHJlZ2lzdGVycyBh
cmUgcmVqZWN0ZWQgYWZ0ZXIgS1ZNX0FSTV9WQ1BVX0ZJTkFMSVpFIG9uIGFhcmNoNjQsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgKiBvciByZWdpc3RlcnMgdGhhdCBzaG91bGQgc2tpcCBzZXQgb3Bl
cmF0aW9uIG9uIHJpc2N2Lgo+ID4gPiA+ICsgICAgICAgICAgICAgICovCj4gPiA+ID4gICAgICAg
ICAgICAgICBmb3JfZWFjaF9zdWJsaXN0KGMsIHMpIHsKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHMtPnJlamVjdHNfc2V0ICYmIGZpbmRfcmVnKHMtPnJlamVjdHNfc2V0LCBzLT5y
ZWplY3RzX3NldF9uLCByZWcuaWQpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVqZWN0X3JlZyA9IHRydWU7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gX192Y3B1X2lvY3RsKHZjcHUsIEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4g
PiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCAhPSAtMSB8fCBlcnJu
byAhPSBFUEVSTSkgewo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHJpbnRmKCIlczogRmFpbGVkIHRvIHJlamVjdCAocmV0PSVkLCBlcnJubz0lZCkgIiwgY29u
ZmlnX25hbWUoYyksIHJldCwgZXJybm8pOwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJpbnRfcmVnKGNvbmZpZ19uYW1lKGMpLCByZWcuaWQpOwo+ID4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHV0Y2hhcignXG4nKTsKPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsrZmFpbGVkX3JlamVj
dDsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoKHJlZy5pZCAmIEtW
TV9SRUdfQVJDSF9NQVNLKSA9PSBLVk1fUkVHX0FSTTY0KSB7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBfX3ZjcHVfaW9jdGwodmNwdSwgS1ZNX1NF
VF9PTkVfUkVHLCAmcmVnKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCIlczogRmFpbGVk
IHRvIHJlamVjdCAocmV0PSVkLCBlcnJubz0lZCkgIiwKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZ19uYW1l
KGMpLCByZXQsIGVycm5vKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJpbnRfcmVnKGNvbmZpZ19uYW1lKGMpLCByZWcuaWQpOwo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdXRjaGFyKCdc
bicpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICArK2ZhaWxlZF9yZWplY3Q7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4gPiA+Cj4gPiA+IFRoaW5raW5nIGFib3V0IHRoaXMgc29tZSBtb3JlLCBzaG91
bGRuJ3Qgd2UgYXR0ZW1wdCB0aGUgc2V0IGlvY3RsIGZvcgo+ID4gPiByaXNjdiByZWplY3QgcmVn
aXN0ZXJzIGFzIHdlbGwsIGJ1dCBsb29rIGZvciBkaWZmZXJlbnQgZXJyb3IgbnVtYmVycz8KPiA+
ID4KPiA+Cj4gPiBZZXMsIHdlIGNhbi4gQ3VycmVudGx5LCAyIGRpZmZlcmVudCBlcnJubyhFT1BO
T1RTVVBQL0VJTlZBTCkgd291bGQgYmUKPiA+IHJlcG9ydGVkIGZvciB0aGUgcmVqZWN0ZWQgcmVn
aXN0ZXJzIGluIHJpc2Mtdi4KPiA+IFRoZXNlIDIgZXJybm9zIGNhbiBiZSBoYW5kbGVkIHNwZWNp
YWxseSBsaWtlIGJlbG93Ogo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2dldC1yZWctbGlzdC5jCj4gPiBpbmRleCA3M2Y0MGUwODQyYjguLmYzZjJjNDUxOTMxOCAxMDA2
NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+
ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBA
QCAtMjU1LDYgKzI1NSwxNSBAQCBzdGF0aWMgdm9pZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdf
bGlzdCAqYykKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHB1dGNoYXIoJ1xuJyk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICArK2ZhaWxlZF9yZWplY3Q7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IF9fdmNwdV9pb2N0bCh2
Y3B1LAo+ID4gS1ZNX1NFVF9PTkVfUkVHLCAmcmVnKTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAocmV0ICE9IC0xIHx8IChlcnJubyAhPQo+ID4gRUlOVkFM
ICYmIGVycm5vICE9IEVPUE5PVFNVUFApKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiVzOiBGYWlsZWQgdG8KPiA+IHJlamVjdCAo
cmV0PSVkLCBlcnJubz0lZCkgIiwKPiA+ICsKPiA+IGNvbmZpZ19uYW1lKGMpLCByZXQsIGVycm5v
KTsKPiA+ICsKPiA+IHByaW50X3JlZyhjb25maWdfbmFtZShjKSwgcmVnLmlkKTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB1dGNoYXIoJ1xuJyk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArK2Zh
aWxlZF9yZWplY3Q7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fQo+Cj4gSW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgY29kZSBBcm0gdXNlcywgd2UganVzdCBu
ZWVkIGFuIGVycm5vIGNoZWNrCj4gZnVuY3Rpb24sIHByZWZlcmFibHkgb25lIHRoYXQgdGFrZXMg
dGhlIHJlZ2lzdGVyIGFzIGFuIGlucHV0LCBzbyB3ZQo+IGNhbiBjaGVjayBmb3Igc3BlY2lmaWMg
ZXJybm9zIGZvciBzcGVjaWZpYyByZWdpc3RlcnMuCj4KPiA+Cj4gPiBPbmUgcG9zc2libGUgaXNz
dWUgZm9yIHRoZSBhYm92ZSBjaGFuZ2UgaXMgdGhhdCB3aGVuIG5ldyByZWdpc3RlcnMKPiA+IHRo
YXQgZG9uJ3Qgc3VwcG9ydCBzZXRzIHdlcmUgYWRkZWQsIHdlIG5lZWQKPiA+IHRvIGFkZCB0aGVt
IHRvIHRoZSByZWplY3QgcmVnaXN0ZXJzIGxpc3QsIG9yIHRoZSB0ZXN0IHdvdWxkIGZhaWwuCj4g
Pgo+ID4gSW5pdGlhbGx5LCBpbiB0aGUgdjEgcGF0Y2gsIHRoZSBkZXNpZ24gd2FzIHRvIGp1c3Qg
c2tpcCB0aGUgRU9QTk9UU1VQUAo+ID4gZXJybm8gaW4gc2V0IG9wZXJhdGlvbnMgZm9yIGFsbCBy
ZWdpc3RlcnMKPiA+IHNpbmNlIGl0J3MgYSBrbm93biBlcnJubyBmb3IgcmVnaXN0ZXJzIHRoYXQg
ZG9uJ3Qgc3VwcG9ydCBzZXRzLiBUaGlzCj4gPiBjaGFuZ2UgY292ZXIgYWxsIHRoZSByZWdpc3Rl
cnMgZXZlbiBmb3IgZnV0dXJlCj4gPiBuZXcgb25lcy4KPiA+Cj4gPiBXaGF0J3MgeW91ciBvcGlu
aW9uPwo+Cj4gSSB0aGluayB3ZSBzaG91bGQgb25seSBkbyB0aGUgZ2V0L3NldCB0ZXN0cyBvbiBw
cmVzZW50LCBibGVzc2VkIGxpc3QKPiByZWdpc3RlcnMsIHNpbmNlIGlmIGl0J3MgYSBuZXcgcmVn
aXN0ZXIgd2UgZG9uJ3Qga25vdyBpdHMgY2FwYWJpbGl0aWVzLgo+Cj4gU28sIGluc3RlYWQgb2YK
Pgo+ICAgZm9yX2VhY2hfcmVnKGkpIHsKPiAgICAgIC8qIGdldC9zZXQgdGVzdHMgKi8KPiAgIH0K
Pgo+IHdlIGRvCj4KPiAgIGZvcl9lYWNoX3ByZXNlbnRfYmxlc3NlZF9yZWcoaSkgewo+ICAgICAg
LyogZ2V0L3NldCB0ZXN0cyAqLwo+ICAgfQo+Cj4gd2hlcmUgd2UgaGF2ZQo+Cj4gICNkZWZpbmUg
Zm9yX2VhY2hfcHJlc2VudF9ibGVzc2VkX3JlZyhpKSBcCj4gICAgICBmb3IgKChpKSA9IDA7IChp
KSA8IGJsZXNzZWRfbjsgKysoaSkpIFwKPiAgICAgICAgICBpZiAoZmluZF9yZWcocmVnX2xpc3Qt
PnJlZywgcmVnX2xpc3QtPm4sIGJsZXNzZWRfcmVnW2ldKSkKPgo+Cj4gQ2hhbmdpbmcgcnVuX3Rl
c3QoKSB0byB3b3JrIHRoaXMgd2F5IHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgo+CgpHb29k
IGlkZWEhIGxldCBtZSBoYXZlIGEgdHJ5LgoKVGhhbmtzLApIYWlibwoKPiBUaGFua3MsCj4gZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
