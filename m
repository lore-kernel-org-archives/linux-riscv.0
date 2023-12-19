Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A27C35274
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 02:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpOIwnVv3cK/uXKC3F5NrJVN+EBCal/zWKvMChrJQDM=; b=j7phAtZYYDp52y
	GjJAxhrjU32keknhFxzpYCUMM14aTPRySqpuY4fGVA7BYUXrea7EiHYTyuj2oCAL/vQg5Rn8ALmfi
	LwWmEkNXt/Fc7KqVln3CEMXdo1rJqYWevedTTlf1isaYwvmGz7ZJOJVi5i82r1xWO2BKHKrc51Ef4
	b0HveNJ5wcyCKXIZMoKpO0ykf9Y6gAHKCdmMrKbt9HVofmrvZhPkvG3sRWjsa85pBb6p9zyAlf++H
	neyvVBV/x4ydCian4O8w6yeYJUTr81WT3bQSC/gpmulAPOxh47cDVopQ92fgcQUHUdWrfwHvqREls
	MoaiNAJ7/hx5DuPxuZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPqi-00Ca9r-1f;
	Tue, 19 Dec 2023 02:28:48 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPqg-00Ca98-17;
	Tue, 19 Dec 2023 02:28:47 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50e33fe3856so2470875e87.1;
        Mon, 18 Dec 2023 18:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702952923; x=1703557723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LybLCdgFs9gLLPX00YSt1nmK2aV7C82qKaPm0j5xx54=;
        b=mIGf7SkQ9s7lJ7zmrpBCEWAwYKjm/L/fsBzVpgSXbEdqjav/t9JP7Actzf9CYnT4Y7
         dRC5w9ItXXfCJPEvZtLok4Gze7fJ2Km+d4INwCJubwnjVEWjT9LmMSsGG4LlXprqeCfi
         ozvyjxcu0N72+gKeAwDtGELH0KviLd44kB4bA+JA34X2SDEP+1b++zonqPqtOi4s049o
         gQ36twSvbaPJPLgNHgOPOosvJc88/8tD7J6+UEaSGmGzC4MYAb5pmhEwt5JFLTNqiibr
         hLAwZN/Sz4jNqiVDIcSejYbBaVLyaXzfj7EHlI5g4/vygR96a1q8m9xTdeAvxzxA+7/n
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702952923; x=1703557723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LybLCdgFs9gLLPX00YSt1nmK2aV7C82qKaPm0j5xx54=;
        b=fynldz5VToWgutwWHYq08PXWyp+aUKxIx3zsUurmvDkORCRr5gT8fGgfNxYlRe0RHH
         XnE6j1gVERBCbbjadNWuXB2suczVWGNdMngwg2/pZNhniY//7CSJ3+O7NoJisVpWiGzW
         LciyTYSbXAhWL4vF+zo8Q+hQZb0IXgqUN7PO8nITsnb/hJ+aKEB1vGcSDWVaGqqL1T0O
         aqT8sOOXb8ErrgwOZ31bHqr1GQLDUl65bKfpwNj9ERwHU2qr5tlFTs0wwDq6FcDUEuPH
         hc3WkFuHmsgcsn/ISZMs/JmJ45c8uMboYuzWjcDPnY6R2ZAjtFcaYajRXGSCPKncXlmB
         w5Eg==
X-Gm-Message-State: AOJu0YyaeNU/m1ylH3dkqYV44XUQDJ0WNmB3DpGXYIKJTF18hNJ8rcqY
	2WdNiuP6TA3CcZC9iwM9qIRgM5OBKRjkZBGjCVI=
X-Google-Smtp-Source: AGHT+IG6tljE07OMLVo3iJQf47agztV1nHz7B1i2JzU7TDEW4jew8QvJDd4tPS3eMEBquQ1JC0Eg0TLSm7SvcF9wtYg=
X-Received: by 2002:a05:6512:b0b:b0:50b:eb40:441a with SMTP id
 w11-20020a0565120b0b00b0050beb40441amr7027389lfu.127.1702952922543; Mon, 18
 Dec 2023 18:28:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702371136.git.haibo1.xu@intel.com> <02f6c9ccaaeb4ceb67137863e0317f62cef62496.1702371136.git.haibo1.xu@intel.com>
 <20231213-b02db86aaf7957be22b200f1@orel>
In-Reply-To: <20231213-b02db86aaf7957be22b200f1@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 19 Dec 2023 10:28:31 +0800
Message-ID: <CAJve8okOO=e66Kko3LyDfsD+tRZvDGf_Zgmog-u5TUzk1JZ1RA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] KVM: riscv: selftests: Add guest helper to get
 vcpu id
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, wchen <waylingii@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Samuel Holland <samuel@sholland.org>, Sean Christopherson <seanjc@google.com>, Like Xu <likexu@tencent.com>, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_182846_383805_F960B9A0 
X-CRM114-Status: GOOD (  22.45  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTA6MDjigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDA1OjMx
OjE3UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gQWRkIGd1ZXN0X2dldF92Y3B1aWQoKSBo
ZWxwZXIgdG8gc2ltcGxpZnkgYWNjZXNzaW5nIHRvIHBlci1jcHUKPiA+IHByaXZhdGUgZGF0YS4g
VGhlIHNzY3JhdGNoIENTUiB3YXMgdXNlZCB0byBzdG9yZSB0aGUgdmNwdSBpZC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvYWFyY2g2NC9wcm9jZXNzb3IuaCB8
IDQgLS0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGls
X2Jhc2UuaCAgICAgfCA5ICsrKysrKysrKwo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgICAgICAgfCA4ICsrKysrKysrCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9hYXJjaDY0L3Byb2Nlc3Nv
ci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvYWFyY2g2NC9wcm9jZXNz
b3IuaAo+ID4gaW5kZXggYzQyZDY4MzEwMmM3Li4xNmFlMGFjMDE4NzkgMTAwNjQ0Cj4gPiAtLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9hYXJjaDY0L3Byb2Nlc3Nvci5o
Cj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9hYXJjaDY0L3By
b2Nlc3Nvci5oCj4gPiBAQCAtMjI2LDggKzIyNiw0IEBAIHZvaWQgc21jY2Nfc21jKHVpbnQzMl90
IGZ1bmN0aW9uX2lkLCB1aW50NjRfdCBhcmcwLCB1aW50NjRfdCBhcmcxLAo+ID4gICAgICAgICAg
ICAgIHVpbnQ2NF90IGFyZzIsIHVpbnQ2NF90IGFyZzMsIHVpbnQ2NF90IGFyZzQsIHVpbnQ2NF90
IGFyZzUsCj4gPiAgICAgICAgICAgICAgdWludDY0X3QgYXJnNiwgc3RydWN0IGFybV9zbWNjY19y
ZXMgKnJlcyk7Cj4gPgo+ID4gLQo+ID4gLQo+ID4gLXVpbnQzMl90IGd1ZXN0X2dldF92Y3B1aWQo
dm9pZCk7Cj4gPiAtCj4gPiAgI2VuZGlmIC8qIFNFTEZURVNUX0tWTV9QUk9DRVNTT1JfSCAqLwo+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91
dGlsX2Jhc2UuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGls
X2Jhc2UuaAo+ID4gaW5kZXggYTE4ZGI2YTdiM2NmLi42NjY0MzgxMTNkMjIgMTAwNjQ0Cj4gPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmgK
PiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jh
c2UuaAo+ID4gQEAgLTkzMiw0ICs5MzIsMTMgQEAgdm9pZCBrdm1fc2VsZnRlc3RfYXJjaF9pbml0
KHZvaWQpOwo+ID4KPiA+ICB2b2lkIGt2bV9hcmNoX3ZtX3Bvc3RfY3JlYXRlKHN0cnVjdCBrdm1f
dm0gKnZtKTsKPiA+Cj4gPiArdm9pZCB2bV9pbml0X3ZlY3Rvcl90YWJsZXMoc3RydWN0IGt2bV92
bSAqdm0pOwo+ID4gK3ZvaWQgdmNwdV9pbml0X3ZlY3Rvcl90YWJsZXMoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKPiA+ICsKPiA+ICtzdHJ1Y3QgZXhfcmVnczsKPiA+ICt0eXBlZGVmIHZvaWQoKmV4
Y2VwdGlvbl9oYW5kbGVyX2ZuKShzdHJ1Y3QgZXhfcmVncyAqKTsKPiA+ICt2b2lkIHZtX2luc3Rh
bGxfZXhjZXB0aW9uX2hhbmRsZXIoc3RydWN0IGt2bV92bSAqdm0sIGludCB2ZWN0b3IsIGV4Y2Vw
dGlvbl9oYW5kbGVyX2ZuIGhhbmRsZXIpOwo+Cj4gSSB0aGluayBzb21ldGhpbmcgaGFwcGVuZCBv
biByZWJhc2Ugc2luY2UgdGhlIGFib3ZlIHNob3VsZCBiZSBpbiBhCj4gZGlmZmVyZW50IHBhdGNo
IChhbmQgd2VyZSBmb3IgdjMpLiBJIHN1Z2dlc3QgY2hlY2tpbmcgeW91ciBwcmV2aW91cwo+IGFu
ZCBjdXJyZW50IHZlcnNpb24gYnJhbmNoZXMgd2l0aCBnaXQtcmFuZ2UtZGlmZiBhZnRlciByZWJh
c2luZyBpbgo+IG9yZGVyIHRvIGNhdGNoIHN0dWZmIGxpa2UgdGhpcy4KPgo+IFRoYW5rcywKPiBk
cmV3Cj4KClRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0LiBXaWxsIGZpeCBpdCBpbiB2NS4KCj4g
PiArCj4gPiArdWludDMyX3QgZ3Vlc3RfZ2V0X3ZjcHVpZCh2b2lkKTsKPiA+ICsKPiA+ICAjZW5k
aWYgLyogU0VMRlRFU1RfS1ZNX1VUSUxfQkFTRV9IICovCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiA+IGluZGV4IGVmZDlhYzRi
MDE5OC4uMzlhMWU5OTAyZGVjIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gQEAgLTMxNiw2ICszMTYsOSBAQCBz
dHJ1Y3Qga3ZtX3ZjcHUgKnZtX2FyY2hfdmNwdV9hZGQoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQz
Ml90IHZjcHVfaWQsCj4gPiAgICAgICB2Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfQ09SRV9SRUco
cmVncy5zcCksIHN0YWNrX3ZhZGRyICsgc3RhY2tfc2l6ZSk7Cj4gPiAgICAgICB2Y3B1X3NldF9y
ZWcodmNwdSwgUklTQ1ZfQ09SRV9SRUcocmVncy5wYyksICh1bnNpZ25lZCBsb25nKWd1ZXN0X2Nv
ZGUpOwo+ID4KPiA+ICsgICAgIC8qIFNldHVwIHNzY3JhdGNoIGZvciBndWVzdF9nZXRfdmNwdWlk
KCkgKi8KPiA+ICsgICAgIHZjcHVfc2V0X3JlZyh2Y3B1LCBSSVNDVl9DU1JfUkVHKHNzY3JhdGNo
KSwgdmNwdV9pZCk7Cj4gPiArCj4gPiAgICAgICAvKiBTZXR1cCBkZWZhdWx0IGV4Y2VwdGlvbiB2
ZWN0b3Igb2YgZ3Vlc3QgKi8KPiA+ICAgICAgIHZjcHVfc2V0X3JlZyh2Y3B1LCBSSVNDVl9DU1Jf
UkVHKHN0dmVjKSwgKHVuc2lnbmVkIGxvbmcpZ3Vlc3RfdW5leHBfdHJhcCk7Cj4gPgo+ID4gQEAg
LTQzNiwzICs0MzksOCBAQCB2b2lkIHZtX2luc3RhbGxfaW50ZXJydXB0X2hhbmRsZXIoc3RydWN0
IGt2bV92bSAqdm0sIGV4Y2VwdGlvbl9oYW5kbGVyX2ZuIGhhbmRsZQo+ID4KPiA+ICAgICAgIGhh
bmRsZXJzLT5leGNlcHRpb25faGFuZGxlcnNbMV1bMF0gPSBoYW5kbGVyOwo+ID4gIH0KPiA+ICsK
PiA+ICt1aW50MzJfdCBndWVzdF9nZXRfdmNwdWlkKHZvaWQpCj4gPiArewo+ID4gKyAgICAgcmV0
dXJuIGNzcl9yZWFkKENTUl9TU0NSQVRDSCk7Cj4gPiArfQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
