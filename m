Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73664C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1QBg8TvZB4WlUar8YqwjQQmmz0nLV9gWZhpX32B3Hk=; b=VbmUvpULS4oKqP
	FKj978fqZUPahotlqkZovRORFQkahURsEqiapcL3eV7kaBNgZAztJQAwxFn7yhBsbK5FWp590Es6A
	qoHLv/9SoVU01tjqeid8e1Bp1o2gOaJ7g6vMGa+9HJ+erixaGN5CirCAWz/wCRGBN3l/VJ69r9qVH
	szDhOeiZrdcm9PFRR5nDXmbVcxI4YhYG7xQlqW2owMCXsDCz+ytWcRgkRvUebrWojJicjBj+MiFhE
	QmbqPGzj7z/beL920FkKLO+6exxWm33tsw9hFWgVlkRxZRzu+GmpXLF/DtSz6AzcV9UXIauuKASPG
	zbYEceEDTjRWEC/SeoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODkt-006oeT-1U;
	Tue, 25 Jul 2023 08:50:55 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODkq-006od8-0B;
	Tue, 25 Jul 2023 08:50:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b935316214so66558921fa.1;
        Tue, 25 Jul 2023 01:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690275048; x=1690879848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9E3/WWnB3oqCCKicWHSv17L65rJSzN/sd8dp6vx1FQ=;
        b=YLNBowiTU69Ja/HCaBea3FPTx+ls86SNtFC7ONC0KOg1J7cu8IZFnZLwwk4n2zDxjI
         XcekrqM13pSQl1pAaXQNtLR6GwEWBCVKYp+eWbbv63yKHgnMaptHCzfDRz9bt6v7u/9M
         gDLGiBuH3dKnyH5ENURz+/XYHBCcShB5X7tICrtdjKdBrGStkjmgtVg05s7GKhG4rPwh
         CZTU62ahmVHuQRO2FlyKtsdFUKXxwTy4ZHKMsgmx3hHO8ezOMuRNWqyTNBtA19xQvwKS
         sDWM93WmkQ7KG7S045C7WLtYgGtDJ0fb0ixTPKfHbyOsrhBClBQgrBqntgbAZeC3Z8oK
         oImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690275048; x=1690879848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9E3/WWnB3oqCCKicWHSv17L65rJSzN/sd8dp6vx1FQ=;
        b=QIjwDJ7vbfuu7SnxqXND/zavW/JTimDDdC6GXYQO1Bi6WCsJnDvxr8ND8+0SZrHAH0
         We4lne7O+cNheBWcWtlLI6JUfthDzLZnXBtI9UcsDESpp6m/h/6WPdnLn+L+guocFDWA
         Q1Ax2/VLcBrZFrb+GCC5JKrejkWXUndlowU+HceeX/cLP2DkWqXKfbAsGOAcWVAi2ibB
         nJNAOvRMwJfkMBGJ0EfIEFk4KCVNdLRfCnL03iA9lBKV+vCelfoz988HF9mndj3bLHCH
         Y81OOmqakaEjElNcSfWyr3mbQaHXvj1/k/nsCyWfRS/95bQMuZT/0IPijzCrzrsF+ddy
         0hAQ==
X-Gm-Message-State: ABy/qLbzRAgmXmVePLIootOftO2gaFssyIrFTqcD8FTT1tDL7YyUQ27T
	ca+tWyCrJ2B+bAAyr+JRNWDYTjCbQRLRogOdndo=
X-Google-Smtp-Source: APBJJlGBlJjhXA317NVJI8YZATKyklEw0tkXtLszo383gTFM/xNrJUX6GWwD9HJEgK2Q2+0j7hQmt2LxipqVhYinjTg=
X-Received: by 2002:a2e:8e31:0:b0:2b6:a0c8:fde3 with SMTP id
 r17-20020a2e8e31000000b002b6a0c8fde3mr748982ljk.6.1690275048115; Tue, 25 Jul
 2023 01:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <1f25f27d1316bc91e1e31cd3d50a1d20f696759a.1690273969.git.haibo1.xu@intel.com>
In-Reply-To: <1f25f27d1316bc91e1e31cd3d50a1d20f696759a.1690273969.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 25 Jul 2023 16:50:36 +0800
Message-ID: <CAJve8okJ-HYpsOrqH4Zvn7OBtwXWa4JumC+ZsMfHKB-deVYd2A@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] KVM: arm64: selftests: Split get-reg-list test code
To: Haibo Xu <haibo1.xu@intel.com>
Cc: ajones@ventanamicro.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_015052_097584_1AED8FF1 
X-CRM114-Status: GOOD (  17.96  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgNDozN+KAr1BNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPiB3cm90ZToKPgo+IEZyb206IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Cj4KPiBTcGxpdCB0aGUgYXJjaC1uZXV0cmFsIHRlc3QgY29kZSBvdXQgb2YgYWFyY2g2
NC9nZXQtcmVnLWxpc3QuYyBpbnRvCj4gZ2V0LXJlZy1saXN0LmMuIFRvIGRvIHRoaXMgd2UgaW52
ZW50IGEgbmV3IG1ha2UgdmFyaWFibGUKPiAkKFNQTElUX1RFU1RTKSB3aGljaCBleHBlY3RzIGNv
bW1vbiBwYXJ0cyB0byBiZSBpbiB0aGUgS1ZNIHNlbGZ0ZXN0cwo+IHJvb3QgYW5kIHRoZSBjb3Vu
dGVycGFydHMgdG8gaGF2ZSB0aGUgc2FtZSBuYW1lLCBidXQgYmUgaW4KPiAkKEFSQ0hfRElSKS4K
Pgo+IFRoZXJlJ3Mgc3RpbGwgc29tZSB3b3JrIHRvIGJlIGRvbmUgdG8gZGUtYWFyY2g2NCB0aGUg
Y29tbW9uCj4gZ2V0LXJlZy1saXN0LmMsIGJ1dCB3ZSBsZWF2ZSB0aGF0IHRvIHRoZSBuZXh0IHBh
dGNoIHRvIGF2b2lkCj4gbW9kaWZ5aW5nIHRvbyBtdWNoIGNvZGUgd2hpbGUgbW92aW5nIGl0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiAtLS0KPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlICAgICAgICAgIHwgIDEyICstCj4g
IC4uLi9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvZ2V0LXJlZy1saXN0LmMgICAgICB8IDM2NyArLS0t
LS0tLS0tLS0tLS0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0
LmMgICAgfCAzNzcgKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzk4IGlu
c2VydGlvbnMoKyksIDM1OCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9NYWtlZmlsZQo+IGluZGV4IGM2OTJjYzg2ZTdkYS4uOTVmMTgwZTcxMWQ1IDEwMDY0
NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+ICsrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+IEBAIC0xNDAsNyArMTQwLDYgQEAg
VEVTVF9HRU5fUFJPR1NfRVhURU5ERURfeDg2XzY0ICs9IHg4Nl82NC9ueF9odWdlX3BhZ2VzX3Rl
c3QKPiAgVEVTVF9HRU5fUFJPR1NfYWFyY2g2NCArPSBhYXJjaDY0L2FhcmNoMzJfaWRfcmVncwo+
ICBURVNUX0dFTl9QUk9HU19hYXJjaDY0ICs9IGFhcmNoNjQvYXJjaF90aW1lcgo+ICBURVNUX0dF
Tl9QUk9HU19hYXJjaDY0ICs9IGFhcmNoNjQvZGVidWctZXhjZXB0aW9ucwo+IC1URVNUX0dFTl9Q
Uk9HU19hYXJjaDY0ICs9IGFhcmNoNjQvZ2V0LXJlZy1saXN0Cj4gIFRFU1RfR0VOX1BST0dTX2Fh
cmNoNjQgKz0gYWFyY2g2NC9oeXBlcmNhbGxzCj4gIFRFU1RfR0VOX1BST0dTX2FhcmNoNjQgKz0g
YWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfYWFyY2g2NCArPSBhYXJj
aDY0L3BzY2lfdGVzdAo+IEBAIC0xNTIsNiArMTUxLDcgQEAgVEVTVF9HRU5fUFJPR1NfYWFyY2g2
NCArPSBhY2Nlc3NfdHJhY2tpbmdfcGVyZl90ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX2FhcmNoNjQg
Kz0gZGVtYW5kX3BhZ2luZ190ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX2FhcmNoNjQgKz0gZGlydHlf
bG9nX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfYWFyY2g2NCArPSBkaXJ0eV9sb2dfcGVyZl90ZXN0
Cj4gK1RFU1RfR0VOX1BST0dTX2FhcmNoNjQgKz0gZ2V0LXJlZy1saXN0Cj4gIFRFU1RfR0VOX1BS
T0dTX2FhcmNoNjQgKz0ga3ZtX2NyZWF0ZV9tYXhfdmNwdXMKPiAgVEVTVF9HRU5fUFJPR1NfYWFy
Y2g2NCArPSBrdm1fcGFnZV90YWJsZV90ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX2FhcmNoNjQgKz0g
bWVtc2xvdF9tb2RpZmljYXRpb25fc3RyZXNzX3Rlc3QKPiBAQCAtMTgxLDYgKzE4MSw4IEBAIFRF
U1RfR0VOX1BST0dTX3Jpc2N2ICs9IGt2bV9wYWdlX3RhYmxlX3Rlc3QKPiAgVEVTVF9HRU5fUFJP
R1NfcmlzY3YgKz0gc2V0X21lbW9yeV9yZWdpb25fdGVzdAo+ICBURVNUX0dFTl9QUk9HU19yaXNj
diArPSBrdm1fYmluYXJ5X3N0YXRzX3Rlc3QKPgo+ICtTUExJVF9URVNUUyArPSBnZXQtcmVnLWxp
c3QKPiArCj4gIFRFU1RfUFJPR1MgKz0gJChURVNUX1BST0dTXyQoQVJDSF9ESVIpKQo+ICBURVNU
X0dFTl9QUk9HUyArPSAkKFRFU1RfR0VOX1BST0dTXyQoQVJDSF9ESVIpKQo+ICBURVNUX0dFTl9Q
Uk9HU19FWFRFTkRFRCArPSAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVEXyQoQVJDSF9ESVIpKQo+
IEBAIC0yMjgsMTEgKzIzMCwxNCBAQCBMSUJLVk1fQ19PQkogOj0gJChwYXRzdWJzdCAlLmMsICQo
T1VUUFVUKS8lLm8sICQoTElCS1ZNX0MpKQo+ICBMSUJLVk1fU19PQkogOj0gJChwYXRzdWJzdCAl
LlMsICQoT1VUUFVUKS8lLm8sICQoTElCS1ZNX1MpKQo+ICBMSUJLVk1fU1RSSU5HX09CSiA6PSAk
KHBhdHN1YnN0ICUuYywgJChPVVRQVVQpLyUubywgJChMSUJLVk1fU1RSSU5HKSkKPiAgTElCS1ZN
X09CSlMgPSAkKExJQktWTV9DX09CSikgJChMSUJLVk1fU19PQkopICQoTElCS1ZNX1NUUklOR19P
QkopCj4gK1NQTElUX1RFU1RTX1RBUkdFVFMgOj0gJChwYXRzdWJzdCAlLCAkKE9VVFBVVCkvJSwg
JChTUExJVF9URVNUUykpCj4gK1NQTElUX1RFU1RTX09CSlMgOj0gJChwYXRzdWJzdCAlLCAkKEFS
Q0hfRElSKS8lLm8sICQoU1BMSVRfVEVTVFMpKQo+Cj4gIFRFU1RfR0VOX09CSiA9ICQocGF0c3Vi
c3QgJSwgJS5vLCAkKFRFU1RfR0VOX1BST0dTKSkKPiAgVEVTVF9HRU5fT0JKICs9ICQocGF0c3Vi
c3QgJSwgJS5vLCAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVEKSkKPiAgVEVTVF9ERVBfRklMRVMg
PSAkKHBhdHN1YnN0ICUubywgJS5kLCAkKFRFU1RfR0VOX09CSikpCj4gIFRFU1RfREVQX0ZJTEVT
ICs9ICQocGF0c3Vic3QgJS5vLCAlLmQsICQoTElCS1ZNX09CSlMpKQo+ICtURVNUX0RFUF9GSUxF
UyArPSAkKHBhdHN1YnN0ICUubywgJS5kLCAkKFNQTElUX1RFU1RTX09CSlMpKQo+ICAtaW5jbHVk
ZSAkKFRFU1RfREVQX0ZJTEVTKQo+Cj4gICQoVEVTVF9HRU5fUFJPR1MpICQoVEVTVF9HRU5fUFJP
R1NfRVhURU5ERUQpOiAlOiAlLm8KPiBAQCAtMjQwLDcgKzI0NSwxMCBAQCAkKFRFU1RfR0VOX1BS
T0dTKSAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVEKTogJTogJS5vCj4gICQoVEVTVF9HRU5fT0JK
KTogJChPVVRQVVQpLyUubzogJS5jCj4gICAgICAgICAkKENDKSAkKENGTEFHUykgJChDUFBGTEFH
UykgJChUQVJHRVRfQVJDSCkgLWMgJDwgLW8gJEAKPgo+IC1FWFRSQV9DTEVBTiArPSAkKExJQktW
TV9PQkpTKSAkKFRFU1RfREVQX0ZJTEVTKSAkKFRFU1RfR0VOX09CSikgY3Njb3BlLioKPiArJChT
UExJVF9URVNUU19UQVJHRVRTKTogJTogJS5vICQoU1BMSVRfVEVTVFNfT0JKUykKPiArICAgICAg
ICQoQ0MpICQoQ0ZMQUdTKSAkKENQUEZMQUdTKSAkKExERkxBR1MpICQoVEFSR0VUX0FSQ0gpICRe
ICQoTERMSUJTKSAtbyAkQAo+ICsKPiArRVhUUkFfQ0xFQU4gKz0gJChMSUJLVk1fT0JKUykgJChU
RVNUX0RFUF9GSUxFUykgJChURVNUX0dFTl9PQkopICQoU1BMSVRfVEVTVFNfT0JKUykgY3Njb3Bl
LioKPgo+ICB4IDo9ICQoc2hlbGwgbWtkaXIgLXAgJChzb3J0ICQoZGlyICQoTElCS1ZNX0NfT0JK
KSAkKExJQktWTV9TX09CSikpKSkKPiAgJChMSUJLVk1fQ19PQkopOiAkKE9VVFBVVCkvJS5vOiAl
LmMKCkhpIEBBbmRyZXcgSm9uZXMsCgpBZnRlciByZWJhc2luZyB0byB2Ni41LXJjMywgc29tZSBj
aGFuZ2VzIGFyZSBuZWVkZWQgdG8gdGhlIFNQTElUX1RFU1RTCnRhcmdldCwgb3IgdGhlIG1ha2Ug
d291bGQgZmFpbC4KUGxlYXNlIGhlbHAgaGF2ZSBhIGxvb2suCgpSZWdhcmRzLApIYWlibwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
