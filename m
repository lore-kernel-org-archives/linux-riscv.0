Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AF3C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 15:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoQLdzRbHZUmLcX27yQJb199H6WyGGYSH1Ns3JaGNs4=; b=U/AluNVu/y5vCd
	fGVgwNT46vmim2X/eDtDqhVPNMY9drcv0cDbeUiF++e+xiq/du9PDL8Yo4LrDJD2EF03gMBJ9bxde
	pPcXsElRujvB5n9VIfvMKucut9hOIklJ4Y2yqksC5d47H0qILBO0b3c2XUtJgIbzyrXCffKVXYhY1
	RBhdevSqyCI6MefaS1Tke7vNHpD/6ee/0Al/d5Qt7NkF1GqDUjigVmQfOhGfpIK6pUyFAf6sRuQV2
	lGyRa0IKWRcRV+I4GgeKfg+T0NKe/+71RBXZ+sKM80hFMlp9Zs1FrmDf79tb7b73Y7u85Y/B3iAc3
	as3uA/0rpa5bL+PPRnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q01fu-00GYgy-2I;
	Fri, 19 May 2023 15:05:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q01fr-00GYfq-2u
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 15:05:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96622bca286so640697666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1684508742; x=1687100742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ozVXd1B4f6j39NHoWAFD6vv7kLwnop5AT6O9mizDAY=;
        b=kAS9k7GAqvJKVSSgU1MgYRPEuIYBQVvDJJfwKA3YlIrrarWn/nVnwvdOtKzuxwKJ+6
         RdfmJ007iM3kt9rG/Op3fyi7LdN6rBHZSX2xsHsbYMNa9BpUzBehPU+SU10ys0rTrUfj
         TgKGN+n00QxkeIipwXucoWmlpocSv8lrELy1CqRTda8QHG8za2S8C212lKl7Ih1TU6F0
         lgamS0c/hRLREzLTUpNpLigLacpQ9SvblWWkllY0zQaDQU7u7rxgEHBwlIejM0FjqYs0
         b4JKtgn+E7d++y3psZibzoQLiOPph99taRcWPTzsvYKNp7HoMM6bTyHGLyTwxLzV3o8b
         +vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508742; x=1687100742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ozVXd1B4f6j39NHoWAFD6vv7kLwnop5AT6O9mizDAY=;
        b=UKX99KaJiNC2rQxYHCsV6B1cEjajdoZaAcVWU97KAbVKLnfSC0pIEYEGL181tAF06L
         io3dkzMHWRJeMVDpijT6xZ5wLyCfH61bK/irDfocYfPPsG36QjhxrdIK7JS8hBl4pzsQ
         +hTmElhDYGF79RDW3Rg8i87fin1HpUaK4+3buQ14E7aJ/shxn1l65d4aE9MZNrSNtvd9
         lkNyBP+7kD3T3L1JXdy1YkGU/beCTSYR8M0aZ5g27yP5my3rEOqyOo/zXdPjKEz9BPNq
         k9gdboVE2Ij4CMNQmdwC5Rb79wjRjC9nyPfCndtg+UlmeZvuIxmLG0h/uW3lTI2uHgLg
         AszQ==
X-Gm-Message-State: AC+VfDw0dpDaBKM+mpcZUKfgEITmQsvp5HbHYPVs5ZUxXGoRRIsT6Wxk
	+EpisNOdCZGnYNuq61Jp2PWVaY4TxvI3pXypwuFOVQ==
X-Google-Smtp-Source: ACHHUZ6nwKiteOq1H9wfIyIRK8SORzx5pTii1Ln4FomLOn3bSmRSjcguJR83Tlk3Ga9K91QJgz/DYKPPbDZ5IkO0DWg=
X-Received: by 2002:a17:907:982:b0:961:69a2:c8d6 with SMTP id
 bf2-20020a170907098200b0096169a2c8d6mr1757323ejc.69.1684508742267; Fri, 19
 May 2023 08:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230426171328.69663-1-ajones@ventanamicro.com> <20230426171328.69663-4-ajones@ventanamicro.com>
In-Reply-To: <20230426171328.69663-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 May 2023 20:35:31 +0530
Message-ID: <CAAhSdy0e5Uc0LP3YOy5Lz7hh4G7pSn70pLXSicy7aj6v90C00Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: Introduce extension_enabled
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_080543_963492_6E4696EF 
X-CRM114-Status: GOOD (  24.01  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTA6NDPigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIG5lZWQgdGhyZWUgU0JJIGV4dGVuc2lvbiBz
dGF0dXMgdmFsdWVzICh1bmluaXRpYWxpemVkLCBlbmFibGVkLAo+IGFuZCBkaXNhYmxlZCkuIFBh
aXJpbmcgYW5vdGhlciBib29sZWFuIGFycmF5LCBleHRlbnNpb25fZW5hYmxlZFtdLAo+IHdpdGgg
dGhlIGJvb2xlYW4gYXJyYXkgZXh0ZW5zaW9uX2Rpc2FibGVkW10gcHJvdmlkZXMgZm91ciBzdGF0
ZXMuCj4gVXNpbmcgYSBwYWlyIG9mIGJvb2xlYW4gYXJyYXlzLCB3aGljaCBtYXkgZXZlbnR1YWxs
eSBiZSBjaGFuZ2VkIHRvCj4gYSBwYWlyIG9mIGJpdG1hcHMsIGlzIG1vcmUgc3BhY2UgZWZmaWNp
ZW50IHRoYW4gdXNpbmcgb25lIGVudW0KPiBzdGF0dXMgZmllbGQuIEFwcGx5IHRoZSBuZXcgKGVu
YWJsZWQ9MSxkaXNhYmxlZD0wKSBzdGF0ZSwgd2hpY2gKPiBtZWFucyBlaXRoZXIgdGhlIGV4dGVu
c2lvbiBkb2Vzbid0IGhhdmUgYSBwcm9iZSBmdW5jdGlvbiBvciB0aGF0Cj4gaXRzIHByb2JlIHdh
cyBzdWNjZXNzZnVsLCB0byBhdm9pZCBtb3JlIHRoYW4gb25lIHByb2JlIG9mIHRoZQo+IGV4dGVu
c2lvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAg
OSArKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8IDEx
ICsrKysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gaW5kZXggNDI3
ODEyNWEzOGE1Li5lM2M1ZTFkMTVlOTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3Zj
cHVfc2JpLmgKPiBAQCAtMTYsNiArMTYsMTUgQEAKPgo+ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2Nv
bnRleHQgewo+ICAgICAgICAgaW50IHJldHVybl9oYW5kbGVkOwo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIGV4dGVuc2lvbl9lbmFibGVkW10gYW5kIGV4dGVuc2lvbl9kaXNhYmxlZFtdIHByb3Zp
ZGUgU0JJCj4gKyAgICAgICAgKiBleHRlbnNpb25zIGZvdXIgc3RhdHVzIHZhbHVlcywgb2Ygd2hp
Y2ggd2UgbmVlZCB0aHJlZToKPiArICAgICAgICAqICgwLDApIHVuaW5pdGlhbGl6ZWQsICgxLDAp
IGVuYWJsZWQsICgwLDEpIGRpc2FibGVkLiBVc2luZwo+ICsgICAgICAgICogYSBwYWlyIG9mIGJv
b2xlYW4gYXJyYXlzLCB3aGljaCBtYXkgZXZlbnR1YWxseSBiZSBjaGFuZ2VkCj4gKyAgICAgICAg
KiB0byBhIHBhaXIgb2YgYml0bWFwcywgaXMgbW9yZSBzcGFjZSBlZmZpY2llbnQgdGhhbiB1c2lu
Zwo+ICsgICAgICAgICogb25lIGVudW0gc3RhdHVzIGZpZWxkLgo+ICsgICAgICAgICovCj4gKyAg
ICAgICBib29sIGV4dGVuc2lvbl9lbmFibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07CgpUaGUg
ZXh0ZW5zaW9uX2VuYWJsZWRbXSBpcyBub3QgYW4gYXBwcm9wcmlhdGUgbmFtZS4KCkhvdyBhYm91
dCBleHRlbnNpb25fcHJvYmVfYWxsb3dlZFtdID8KCkFueSBiZXR0ZXIgbmFtZSA/CgpSZWdhcmRz
LApBbnVwCgo+ICAgICAgICAgYm9vbCBleHRlbnNpb25fZGlzYWJsZWRbS1ZNX1JJU0NWX1NCSV9F
WFRfTUFYXTsKPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IGluZGV4IGExYTgyZjBmYmFkMi4uMzQ0ZDM4
YmJlMDZhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gQEAgLTE1NSw2ICsxNTUsMTIgQEAgc3RhdGljIGlu
dCByaXNjdl92Y3B1X3NldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
ICAgICAgICBpZiAoIXNleHQpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogV2UgY2FuJ3Qgc2V0IHNjb250ZXh0LT5leHRlbnNpb25f
ZW5hYmxlZFtdIHRvIHJlZ192YWwgc2luY2UgdGhlCj4gKyAgICAgICAgKiBleHRlbnNpb24gbWF5
IGhhdmUgYSBwcm9iZSgpIGZ1bmN0aW9uIHdoaWNoIG5lZWRzIHRvIGNvbmZpcm0KPiArICAgICAg
ICAqIGVuYWJsZW1lbnQgZmlyc3QuIE9ubHkgc2V0IGV4dGVuc2lvbl9kaXNhYmxlZFtdIGhlcmUg
YW5kIGxlYXZlCj4gKyAgICAgICAgKiB0aGUgZXh0ZW5zaW9uX2VuYWJsZWRbXSBzZXR0aW5nIHRv
IGt2bV92Y3B1X3NiaV9maW5kX2V4dCgpLgo+ICsgICAgICAgICovCj4gICAgICAgICBzY29udGV4
dC0+ZXh0ZW5zaW9uX2Rpc2FibGVkW3NleHQtPmV4dF9pZHhdID0gIXJlZ192YWw7Cj4KPiAgICAg
ICAgIHJldHVybiAwOwo+IEBAIC0zMTcsNyArMzIzLDggQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1
X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1X3NiaV9maW5kX2V4dCgKPiAgICAgICAgICAgICAgICAg
ZXh0ID0gZW50cnktPmV4dF9wdHI7Cj4KPiAgICAgICAgICAgICAgICAgaWYgKGV4dC0+ZXh0aWRf
c3RhcnQgPD0gZXh0aWQgJiYgZXh0LT5leHRpZF9lbmQgPj0gZXh0aWQpIHsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoZW50cnktPmV4dF9pZHggPj0gS1ZNX1JJU0NWX1NCSV9FWFRfTUFY
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChlbnRyeS0+ZXh0X2lkeCA+PSBLVk1fUklT
Q1ZfU0JJX0VYVF9NQVggfHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NvbnRleHQt
PmV4dGVuc2lvbl9lbmFibGVkW2VudHJ5LT5leHRfaWR4XSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBleHQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNj
b250ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbZW50cnktPmV4dF9pZHhdKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gQEAgLTMyNSw2ICszMzIsOCBAQCBj
b25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0
KAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NvbnRleHQtPmV4dGVuc2lvbl9k
aXNhYmxlZFtlbnRyeS0+ZXh0X2lkeF0gPSB0cnVlOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzY29udGV4dC0+ZXh0ZW5zaW9uX2VuYWJsZWRbZW50cnkt
PmV4dF9pZHhdID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXh0Owo+
ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
