Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B255C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST4xcJOBpn10gIv87F3YpoFS4IQDu0po+fqCIlwJ1dA=; b=Co45gBb245oj/E
	b7CqtJKRu6uuSB5Vdkh+96s3K+cfzN8XsQ8dGCKOUb0AO5NqEGwkUZEPLm10aDnFn5LrumfmGspa0
	2lYWssqgw8BljI+OL/2nln43aMlvsc+OcnUAZQlzGi2ZvC+rrDv9sEdtvhZApS+XVdA/0pVGSpbrz
	5sLYr5M5zrOK8yoZXHWwZSOFkOs4SD4FXG7wFOm4cXdPjTEcnClBawAr8d+ZSE2JbCNFr0XWcFQ7H
	sRoh7cDKmEHbp1PeBlzB53Csoktlq3wCET2EmNAvUXG6SwslPY86eOzR1ornAtwONr/RUNshSMHT2
	qjNwIQUjaBVQwatEqxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q42g6-00EfyI-0K;
	Tue, 30 May 2023 16:58:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q42g3-00Efwh-1r
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 16:58:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96f7bf29550so734179266b.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1685465907; x=1688057907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnEYNjHQM/TasnYxRjtoS2EjzlomfhG9nLz36aC9pWQ=;
        b=rh2f/xqT+EJVVH8zebyVv9jEoB3et+sQhKZ793bz4svoJWsbg0oq+mq5/TUDDakJTX
         1L7wAnGntG4e52iG5Q71+6Fjj+jzBcWtDu1DBw+8nWJcqaSJ7LkV0f8cxes67ue9SHe4
         Tn3qNFyNED8wu4xRHhCx303gKX92IrzsR3ydcImCl+ctIXVeWC0U9PDEdKvA2lsehycM
         fRRYF0k8mLR+rBwSdufYDL1C2eS8dx55hqOFApWLwW2Q4nVmBhyvjwI6Ruqx4Ik03a0U
         0dcCCQtAwiQcACdZj0bkMVsy1wLFLnkNvFcDnJd8Pz6NBmxwOQ6Ex4N0vmMM8WwHmko1
         riMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465907; x=1688057907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnEYNjHQM/TasnYxRjtoS2EjzlomfhG9nLz36aC9pWQ=;
        b=NbyIAsOvxbQYGOSjsFH8eJUMt1l7ppa8c6bhZ6R1liXg+RcIJqOi19TNiHMHUPRfOF
         WI0DRbAI1My0PZL0U5ywEsy87jApiNFgQ57YjrkHLRq61ypeqPg3HpUcOV3aBi4pwVcy
         3wTsIYuC2NQI2aBVIKVzZg332IXNPTPYpFK6gzLoPtZMbtaU3F6Rdj/1ihKDBIIBOlid
         FL+3uXjQuZdwCUXLtv8ZONjrxV82IyrlLXS1I+1YaH6F+gPwT1rnAV6haH/BHJLdZgc/
         /p6FhCPk2tasFlWluLYGO9xqSwqDaG0lkAo0MpmaLGLHMLPeUm0l/eyV030Iu0YIPm0s
         I4BQ==
X-Gm-Message-State: AC+VfDzA7fp6vOtgpdtfZFYs8JM1O4qJG7ISHxvYVBPHtF6/pXMA8hBd
	+IafKbcwjmObcVmDVwxdsBp4UQ08tGkswMNMHBFW0g==
X-Google-Smtp-Source: ACHHUZ7f2mQJ5yBEeDs3mWJJCa/4boNcdAJN+uCr4iCoLeEMvXO2L0uaqfMKnWlhpo1RjGtzqiQufbFgWtQ8n5Qg/DI=
X-Received: by 2002:a17:906:6a16:b0:947:ebd5:c798 with SMTP id
 qw22-20020a1709066a1600b00947ebd5c798mr2869088ejc.54.1685465907295; Tue, 30
 May 2023 09:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230526102540.105013-1-ajones@ventanamicro.com> <20230526102540.105013-3-ajones@ventanamicro.com>
In-Reply-To: <20230526102540.105013-3-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 May 2023 22:28:16 +0530
Message-ID: <CAAhSdy01s_89rhzhPtxg4HYqyjiHkUpddc8WcttgZC8dndxF-w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Convert extension_disabled[] to ext_status[]
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_095831_802116_0EE944DE 
X-CRM114-Status: GOOD (  19.29  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMzo1NeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQ2hhbmdlIHRoZSBib29sZWFuIGV4dGVuc2lvbl9k
aXNhYmxlZFtdIGFycmF5IHRvIGFuIGFycmF5IG9mIGVudW1zLAo+IGV4dF9zdGF0dXNbXS4gRm9y
IG5vdywgdGhlIGVudW0gb25seSBoYXMgdHdvIHN0YXRlcywgd2hpY2ggY29ycmVzcG9uZAo+IHRv
IHRoZSBwcmV2aW91cyBib29sZWFuIHN0YXRlcywgc28gdGhpcyBwYXRjaCBoYXMgbm8gaW50ZW5k
ZWQKPiBmdW5jdGlvbmFsIGNoYW5nZS4gVGhlIG5leHQgcGF0Y2ggd2lsbCBhZGQgYW5vdGhlciBz
dGF0ZSwgZXhwYW5kaW5nCj4gdGhlIHB1cnBvc2Ugb2YgZXh0X3N0YXR1c1tdLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8IDcgKysrKysrLQo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgOSArKysrKystLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gaW5kZXggNDI3ODEyNWEzOGE1Li5jZGE5OWZjM2Q4
OTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBAQCAtMTQsOSAr
MTQsMTQgQEAKPiAgI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMQo+ICAjZGVmaW5lIEtW
TV9TQklfVkVSU0lPTl9NSU5PUiAwCj4KPiArZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVMg
ewoKVGhpcyB1cHBlci1jYXNlIG5hbWUgb2YgZW51bSBsb29rcyBvZGQuCgo+ICsgICAgICAgS1ZN
X1JJU0NWX1NCSV9FWFRfQVZBSUxBQkxFLAo+ICsgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfVU5B
VkFJTEFCTEUsCj4gK307Cj4gKwo+ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgewo+ICAg
ICAgICAgaW50IHJldHVybl9oYW5kbGVkOwo+IC0gICAgICAgYm9vbCBleHRlbnNpb25fZGlzYWJs
ZWRbS1ZNX1JJU0NWX1NCSV9FWFRfTUFYXTsKPiArICAgICAgIGVudW0gS1ZNX1JJU0NWX1NCSV9F
WFRfU1RBVFVTIGV4dF9zdGF0dXNbS1ZNX1JJU0NWX1NCSV9FWFRfTUFYXTsKPiAgfTsKPgo+ICBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggNmFhMTVmMWI5
N2Q5Li4yOGU1NWJhMDIzZGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMTU1LDcgKzE1NSw4IEBA
IHN0YXRpYyBpbnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAo+ICAgICAgICAgaWYgKCFzZXh0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T0VOVDsKPgo+IC0gICAgICAgc2NvbnRleHQtPmV4dGVuc2lvbl9kaXNhYmxlZFtzZXh0LT5leHRf
aWR4XSA9ICFyZWdfdmFsOwo+ICsgICAgICAgc2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0
X2lkeF0gPSByZWdfdmFsID8KPiArICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfQVZB
SUxBQkxFIDogS1ZNX1JJU0NWX1NCSV9FWFRfVU5BVkFJTEFCTEU7Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4gQEAgLTE4MCw3ICsxODEsOCBAQCBzdGF0aWMgaW50IHJpc2N2X3ZjcHVfZ2V0
X3NiaV9leHRfc2luZ2xlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIGlmICghc2V4
dCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAtICAgICAgICpyZWdfdmFs
ID0gIXNjb250ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbc2V4dC0+ZXh0X2lkeF07Cj4gKyAgICAg
ICAqcmVnX3ZhbCA9IHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhdID09Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9BVkFJTEFCTEU7
Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gQEAgLTMxNiw3ICszMTgsOCBAQCBjb25zdCBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ICAg
ICAgICAgICAgICAgICBpZiAoc2V4dC0+ZXh0X3B0ci0+ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYK
PiAgICAgICAgICAgICAgICAgICAgIHNleHQtPmV4dF9wdHItPmV4dGlkX2VuZCA+PSBleHRpZCkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChzZXh0LT5leHRfaWR4IDwgS1ZNX1JJU0NW
X1NCSV9FWFRfTUFYICYmCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5l
eHRlbnNpb25fZGlzYWJsZWRbc2V4dC0+ZXh0X2lkeF0pCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhdID09Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRf
VU5BVkFJTEFCTEUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gc2JpX2V4dFtpXS5leHRfcHRyOwo+
ICAgICAgICAgICAgICAgICB9Cj4gLS0KPiAyLjQwLjEKPgoKT3RoZXJ3aXNlLCB0aGlzIGxvb2tz
IGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
