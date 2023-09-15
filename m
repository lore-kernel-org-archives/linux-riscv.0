Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C081EE3F01
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VwYxEOh8VH5kqVxKSWy9HPCJef88fQhu9xnssVKd/g=; b=OieC5avmnrM9ZJ
	BJKybhCwk93yGT0G0sSeWiAPVYVwb/ggminwgXEun2h9U/XHYN+dczZ10hHpCs/hD4Cd288TnzbgE
	palTcfPlcME2eEzwSokrKMlTBXys3RlQP2r2TZrieXy9qBPGxmKhD0PFuFLRA+swCFy5bTt6qcpRF
	13sHM2/UYXltaFOnaeAE8fUrGq4ScHAtD3wYfO+Rkz5aBQrqF5ZbRAYFP8CJCcUlhelKzxJHiu2s7
	TsqPIPNPCJd9HkeY/heo0YVRGKZyqS/WWiO4JNSuGkcprYilBw8y0D+azHhZBrMQwz3L0m827kMi0
	vqNVqscV9Z1gr+Byy5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh255-009suV-2B;
	Fri, 15 Sep 2023 06:13:31 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh252-009ssj-2d;
	Fri, 15 Sep 2023 06:13:30 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-502f302b68dso679607e87.2;
        Thu, 14 Sep 2023 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758405; x=1695363205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrYfSyvA1qDzz1C9me2YoJdAvmKAyt6HEOJS2kBsMOc=;
        b=IBYrlWEI2l45GmeFOvbI6siu8qsxm1iePyupBVWgqIs4ZhiFXQKH03XtJk1L0ZBhBE
         0i21WMk3LpTk1PsJRGm6xi1MXRsWfSuaTR+BGPq0OCbStFr29AR8FAWJ79TxnHkgAQUg
         uC+W/+tYpfe3dFQqxoA7oP3FqnMP1HPROYcETr4+T54Q0bSHkvBLpaLryJO96AbhegoT
         mv5vNv588tp4AFGq0iymdeWdUfU5tu7tnRI7JJMC0w2kj5DblPxZO2CDhtIhRaUjfVEi
         LdFbSmqXj3V72g7Ni6dMysaAliOtA03p0as1SsEG60MLkISU7cvt0+acRnPw2oky0nG7
         8fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758405; x=1695363205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrYfSyvA1qDzz1C9me2YoJdAvmKAyt6HEOJS2kBsMOc=;
        b=NQg2L58NHAnxEn2ZlhqCiny8AUx2FM+gGrVihF+vc8yQSp+Qqr2w2MpxdYjFLv4aY+
         dSTKw+f9bfjfv1GDF98LAVXrumWrL9SjWt5sZACZancbW+laBe7gkXMxwNJd9cGcbK4t
         ThJcbr9TXuccBDFuEt0D0LNWntw8hCSaOIAQYXvswr5XOc8iPYw4Z8KSKHKXtk9jflXu
         4TIt5ffNZiHPDxCT/BP7wUH356npnFOBVIi2FZqPORCa4u64r1EH4J8eDfV1qCpvbFJz
         6dyuKyx1B3MGQO5i6gLwk0jCnUBpZVdpHXj5B3Evj81ki4zvaw7Wl/q6dyPBnSr4aG/7
         6msw==
X-Gm-Message-State: AOJu0YxpHem/Y6w8VywXgswfGqwrSGUhtoUYzfLCEVRXyB4m3StuHSQy
	xsk9xkXz/igC0sxOvHgMQsyYrHL6gCe/AYV8qCs=
X-Google-Smtp-Source: AGHT+IGkLJqQ/k8slvZGXQMAE/UeB/ooMmN+gETIu3I1Y9kMMNpJ7F3dojbdtU+Jb3bl7yAYuGDVmI9UONACJCtektg=
X-Received: by 2002:ac2:4c8b:0:b0:4fc:3755:37d9 with SMTP id
 d11-20020ac24c8b000000b004fc375537d9mr634044lfl.68.1694758405211; Thu, 14 Sep
 2023 23:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <6cdda82518977c67004ee01a767bc67962352c13.1694421911.git.haibo1.xu@intel.com>
 <20230914-18bfe93b679e290188e70307@orel>
In-Reply-To: <20230914-18bfe93b679e290188e70307@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:13:13 +0800
Message-ID: <CAJve8okdUtcCihGh4wRb9rHTxuL7=7_1FY8Ez0+QMr=+x7fzoQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] KVM: riscv: selftests: Switch to use macro from csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Peter Xu <peterx@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_231328_879803_6708B612 
X-CRM114-Status: GOOD (  16.69  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNDo1MuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDk6MzY6
NTlBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8
aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIHwgOCArLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+
ID4gaW5kZXggNWI2MmEzZDJhYTliLi42Nzc2NmJhZWQ0ZjcgMTAwNjQ0Cj4gPiAtLS0gYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ID4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgK
PiA+IEBAIC04LDYgKzgsNyBAQAo+ID4gICNkZWZpbmUgU0VMRlRFU1RfS1ZNX1BST0NFU1NPUl9I
Cj4gPgo+ID4gICNpbmNsdWRlICJrdm1fdXRpbC5oIgo+ID4gKyNpbmNsdWRlIDxhc20vY3NyLmg+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgo+Cj4gbml0OiBVc3VhbGx5IHdlIHRy
eSB0byBrZWVwIHRoZSBvcmRlciBvZiBvdXIgaW5jbHVkZXMgc2VwYXJhdGVkIGludG8gZml2ZQo+
IGNhdGVnb3JpZXMsIGxpc3RlZCBiZWxvdywgd2hlcmUgZWFjaCBjYXRlZ29yeSBpcyBzb3J0ZWQg
YWxwaGFiZXRpY2FsbHkuIE9mCj4gY291cnNlIGFueSBkZXBlbmRlbmNpZXMgdGhlIGluY2x1ZGVz
IGhhdmUgb24gZWFjaCBvdGhlciBuZWVkIHRvIGJlCj4gY29uc2lkZXJlZCB0b28uCj4KPiA8bGli
cmFyeS1pbmNsdWRlcy13aXRob3V0LWEtc3ViZGlyPgo+IDxsaWJyYXJ5LWluY2x1ZGVzLXdpdGgt
c3ViZGlyPgo+IDxsaW51eC8uLi4+Cj4gPGFzbS8uLi4+Cj4gImxvY2FsLWluY2x1ZGVzIgo+CgpJ
dCdzIHZlcnkgaGVscGZ1bC4gVGhhbmtzIGZvciBzaGFyaW5nIGl0IQpXaWxsIGZpeCBpdCBpbiB2
NC4KCj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90
IHR5cGUsIHVpbnQ2NF90IGlkeCwKPiA+IEBAIC05NSwxMyArOTYsNiBAQCBzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBlLCB1aW50NjRfdCBpZHgsCj4gPiAg
I2RlZmluZSBQR1RCTF9QQUdFX1NJWkUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQR1RC
TF9MMF9CTE9DS19TSVpFCj4gPiAgI2RlZmluZSBQR1RCTF9QQUdFX1NJWkVfU0hJRlQgICAgICAg
ICAgICAgICAgICAgICAgICBQR1RCTF9MMF9CTE9DS19TSElGVAo+ID4KPiA+IC0jZGVmaW5lIFNB
VFBfUFBOICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfQUMoMHgwMDAwMEZGRkZGRkZGRkZG
LCBVTCkKPiA+IC0jZGVmaW5lIFNBVFBfTU9ERV8zOSAgICAgICAgICAgICAgICAgICAgICAgICBf
QUMoMHg4MDAwMDAwMDAwMDAwMDAwLCBVTCkKPiA+IC0jZGVmaW5lIFNBVFBfTU9ERV80OCAgICAg
ICAgICAgICAgICAgICAgICAgICBfQUMoMHg5MDAwMDAwMDAwMDAwMDAwLCBVTCkKPiA+IC0jZGVm
aW5lIFNBVFBfQVNJRF9CSVRTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE2Cj4gPiAt
I2RlZmluZSBTQVRQX0FTSURfU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA0NAo+
ID4gLSNkZWZpbmUgU0FUUF9BU0lEX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
X0FDKDB4RkZGRiwgVUwpCj4gPiAtCj4gPiAgI2RlZmluZSBTQklfRVhUX0VYUEVSSU1FTlRBTF9T
VEFSVCAgICAgICAgICAgMHgwODAwMDAwMAo+ID4gICNkZWZpbmUgU0JJX0VYVF9FWFBFUklNRU5U
QUxfRU5EICAgICAgICAgICAgIDB4MDhGRkZGRkYKPiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+
Cj4gQXNzdW1pbmcgdGhlIENPTkZJR182NEJJVCBwYXRjaCB3aWxsIGNvbWUgYmVmb3JlIHRoaXMs
IHRoZW4KPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
