Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3D1E95A84
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4ecAmTnOY85YcPKs72aJDY1AiTnKfMvU6TBrFHv2LU=; b=efylB2STyXntW+
	E/hDKZl22JQ1gawyi74SwT6I8DYdhoOF8ebLqXmb0QDbJZkgaFBQTDUVzGNIEJwAViteDStZ3CJFB
	EeqFEa792AHMF55ILtFhk+T/GUA7WTnJbr8YfHVlDKnAY34oPd0hBgP17elluxsfySY1NDerYT2R9
	pzeVsk8wiS5gq0dAZqRLegtOCqfIll53fLhyz138pqObR9/7i/aopzildrAGKIQhKEZJvip6VJvYm
	5+3QfQ9jJ1t9cIoyI3BgrIbG1ZVQurILMPEv1VOeEwfUQXZujcw0SGdYJAvfeCNmdjG0/p4yPoW1V
	EQbIT8aIvlY1q5aExyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpK0i-008CYf-2U;
	Sun, 08 Oct 2023 02:59:16 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpK0e-008CXa-1S;
	Sun, 08 Oct 2023 02:59:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5045cb9c091so4539075e87.3;
        Sat, 07 Oct 2023 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696733949; x=1697338749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScEsw5kRuBSyCrQaTmCBYUka5dQTvwb6RwilZml22rc=;
        b=SpdsY5aYPvwaa8lqG3rKjGSddkkCHtwzjo9HqjPg4OGnrl0e8Ws9eMn80FyvV3TpRM
         aCPFJedbFKoBzymU7bXyt0kSCDFlzCEI5Cd3nZ2o5tV28ILs5GQNYOqNQAQH+/cKlu1J
         /Hxs+6/JK2mCAFzfCLvm5LnsKLQ3wWmuMz4NEGT+N/4QNSN2Jjno+uGxc4UJ05IjpdBO
         gR5clavdkELHKigQgoWAe3irc+1TtaS+6XLGCrnRYWs0UJhlAb2ew1habSLovpISZZox
         LxD5CeS+3myqB3yJm56aCm7wVsmZCJSTqvU4+beWXNQnOxGplFhLXG0vtkDlVSX/zaIL
         zzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696733949; x=1697338749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScEsw5kRuBSyCrQaTmCBYUka5dQTvwb6RwilZml22rc=;
        b=JGQdIJ3592Q9svH6aaTd6t2W2nhpeZUhpceIuI09AUwKF4HwgVFpVmI8ZrZKdwqz6I
         PsDkUX8Z8pYQbzMUAiizBiIwzAws7m698RTPqTZfR1y41GP9cUzyoto6bmC3ds1TX4Zg
         Vzl6C5/rTBDB/jO+s6yysy9T6nWbdfDxPLvQqZoiQmy8/Bt2czbZ7THmfLGpJuOasQz8
         NSz6wBMfWkuHShP795Kogv43koko1vXL2rmuVUiJvRZRJb0jbSs7flff2bKErvkeuOBg
         VwbImI2Jhc+Ac3Pg9DD6whyLGjrNVpqtOu/bwd5QHisUXaUnNgyy/hrDSzVn811N2hVc
         Mrkg==
X-Gm-Message-State: AOJu0YxoiEdookW9cLBNcw5YAaLIiH1YbGYPGklM34JGCkPzLkPkEAtm
	OhuOVLljaun/9cyDEAYg+Zv366rHM8tfZW7ZRAA=
X-Google-Smtp-Source: AGHT+IEpb2yeFTzMhQ8mODQ9bJzzgKP4xcGT3Fdr1mnHynSEwgLk6lyxwCFHJcwsd6qGQGzx5r8I8XmeCKBxhv85QXI=
X-Received: by 2002:a05:6512:1154:b0:501:bd43:3b9c with SMTP id
 m20-20020a056512115400b00501bd433b9cmr11192604lfg.23.1696733948681; Sat, 07
 Oct 2023 19:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
 <20231003-d44206f71d0b22e539833697@orel>
In-Reply-To: <20231003-d44206f71d0b22e539833697@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 8 Oct 2023 10:58:57 +0800
Message-ID: <CAJve8o=Q74U0Z3PayrzY7heNc0qeTw5VYS+tdkpm=aJdefQEbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] KVM: selftests: Unify the makefile rule for split targets
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_195912_510538_48CB9E36 
X-CRM114-Status: GOOD (  18.95  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCA2OjI44oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCAwOTozNjo1
NkFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IEEgc2VwYXJhdGUgbWFrZWZpbGUgcnVsZSB3
YXMgdXNlZCBmb3Igc3BsaXQgdGFyZ2V0cyB3aGljaCB3YXMgYWRkZWQKPiA+IGluIHBhdGNoKEtW
TTogYXJtNjQ6IHNlbGZ0ZXN0czogU3BsaXQgZ2V0LXJlZy1saXN0IHRlc3QgY29kZSkuIFRoaXMK
PiA+IGNvdWxkIGJlIGF2b2lkZWQgYnkgbWlub3IgY2hhbmdlcyB0byB0aGUgcmVjaXBlcyBvZiBj
dXJyZW50IHJ1bGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBp
bnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZp
bGUgfCA2ICsrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+ID4gaW5k
ZXggYTNiYjM2ZmIzY2ZjLi43OTcyMjY5ZThjNWYgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9NYWtlZmlsZQo+ID4gQEAgLTI0OSwxMyArMjQ5LDEwIEBAIFRFU1RfREVQX0ZJTEVT
ICs9ICQocGF0c3Vic3QgJS5vLCAlLmQsICQoU1BMSVRfVEVTVFNfT0JKUykpCj4gPiAgLWluY2x1
ZGUgJChURVNUX0RFUF9GSUxFUykKPiA+Cj4gPiAgJChURVNUX0dFTl9QUk9HUykgJChURVNUX0dF
Tl9QUk9HU19FWFRFTkRFRCk6ICU6ICUubwo+ID4gLSAgICAgJChDQykgJChDRkxBR1MpICQoQ1BQ
RkxBR1MpICQoTERGTEFHUykgJChUQVJHRVRfQVJDSCkgJDwgJChMSUJLVk1fT0JKUykgJChMRExJ
QlMpIC1vICRACj4gPiArICAgICAkKENDKSAkKENGTEFHUykgJChDUFBGTEFHUykgJChMREZMQUdT
KSAkKFRBUkdFVF9BUkNIKSAkXiAkKExETElCUykgLW8gJEAKPiA+ICAkKFRFU1RfR0VOX09CSik6
ICQoT1VUUFVUKS8lLm86ICUuYwo+ID4gICAgICAgJChDQykgJChDRkxBR1MpICQoQ1BQRkxBR1Mp
ICQoVEFSR0VUX0FSQ0gpIC1jICQ8IC1vICRACj4gPgo+ID4gLSQoU1BMSVRfVEVTVFNfVEFSR0VU
Uyk6ICU6ICUubyAkKFNQTElUX1RFU1RTX09CSlMpCj4gPiAtICAgICAkKENDKSAkKENGTEFHUykg
JChDUFBGTEFHUykgJChMREZMQUdTKSAkKFRBUkdFVF9BUkNIKSAkXiAkKExETElCUykgLW8gJEAK
PiA+IC0KPiA+ICBFWFRSQV9DTEVBTiArPSAkKExJQktWTV9PQkpTKSAkKFRFU1RfREVQX0ZJTEVT
KSAkKFRFU1RfR0VOX09CSikgJChTUExJVF9URVNUU19PQkpTKSBjc2NvcGUuKgo+ID4KPiA+ICB4
IDo9ICQoc2hlbGwgbWtkaXIgLXAgJChzb3J0ICQoZGlyICQoTElCS1ZNX0NfT0JKKSAkKExJQktW
TV9TX09CSikpKSkKPiA+IEBAIC0yNzQsNiArMjcxLDcgQEAgJChMSUJLVk1fU1RSSU5HX09CSik6
ICQoT1VUUFVUKS8lLm86ICUuYwo+ID4gIHggOj0gJChzaGVsbCBta2RpciAtcCAkKHNvcnQgJChk
aXIgJChURVNUX0dFTl9QUk9HUykpKSkKPiA+ICAkKFRFU1RfR0VOX1BST0dTKTogJChMSUJLVk1f
T0JKUykKPiA+ICAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVEKTogJChMSUJLVk1fT0JKUykKPiA+
ICskKFNQTElUX1RFU1RTX1RBUkdFVFMpOiAkKE9VVFBVVCkvJTogJChBUkNIX0RJUikvJS5vCj4g
Pgo+ID4gIGNzY29wZTogaW5jbHVkZV9wYXRocyA9ICQoTElOVVhfVE9PTF9JTkNMVURFKSAkKExJ
TlVYX0hEUl9QQVRIKSBpbmNsdWRlIGxpYiAuLgo+ID4gIGNzY29wZToKPiA+IC0tCj4gPiAyLjM0
LjEKPiA+Cj4KPiBJIGp1c3Qgbm90aWNlZCB0aGF0IHdpdGggYW5kIHdpdGhvdXQgdGhpcyBwYXRj
aCB3ZSdyZSBidWlsZGluZyB0aGUKPiBhcmNoLXNwZWNpZmljIHBhcnQgaW4gdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2IGV2ZW4gd2hlbiB3ZSBoYXZlCj4gYW4gJChPVVRQVVQpIGRp
cmVjdG9yeSAoZS5nLiBPPWJ1aWxkKS4gVGhvc2UgYnVpbGQgYXJ0aWZhY3RzIHNob3VsZCBiZSBp
bgo+IGJ1aWxkL2tzZWxmdGVzdC9rdm0vcmlzY3YgaW5zdGVhZC4KPgoKVGhhbmtzIGZvciBwb2lu
dGluZyBpdCBvdXQuIEkgd2lsbCBoYXZlIGEgbG9vayBpbiBuZXh0IHdlZWshCgo+IFRoYW5rcywK
PiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
