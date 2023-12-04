Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0442AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anNSAJeu8Z1xhclJWbeoPmA6pYYYWrhOUtV+XqMsG5o=; b=udo69jfpXsDCxW
	oN64Zs8FL9Xj+OLPDdF3toJLBeVbi5OFb2PD1g1wgiDAzmPXTA7ni4Gj5zGslxs4muLXXKfH+YLzi
	4kWqYGMu+XhxQaKBGY3F/eQj+1N50IYp2pkndvLIjjKpBtHNaOI34trzE5jUEtG4fbIK0i1BNg3uk
	Zv0YGky1BpVfoKtEFF8enCb/oF0YJXkv3nZEYrvrZnAZ33ESIUeUPELd0H82jg4lqxtI6jANehO7x
	LOZVuArvMR64gfxWGB6lT8oVOtSA9ldsDidvyZCQZT3PpS3TO2a606B8OIoniKqHGBdgAmP338+wB
	/m+uQEfde+Euh8t1FW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9yuy-002rJK-1j;
	Mon, 04 Dec 2023 02:42:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9yuu-002rI4-1i;
	Mon, 04 Dec 2023 02:42:42 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so11061701fa.3;
        Sun, 03 Dec 2023 18:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701657756; x=1702262556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEUh6K5iutasnoMeRQbvniZJyhB8EqO9DGWeSRBdHG8=;
        b=g1J/QtTUf+qAwlLJDY7yd0a2FML2O4/sLp27fUw68DqaolOIaa6kxUZBssQWUJgUwS
         NnIM2IzLMTsIsAlBWa//YpAx3A4LwU9rWAEriEHiiz5GeyfBQpYksExuKEDLfNm96blg
         3Vr6IGLCgBZuXSTrhupGVCbGyzKhpUhR4qEWVr1bqijthFqGDiGj97WQRAJXwcfeAKTv
         Hf13xZ5rmzXbTpo95rb42xR2lzCU18D3vttm9J0mWE64b5bbEuLzMLmcox8uzm9gkQs2
         f6lSfS5NLAZXjz/S3+Vj518LRqbM06yvqPUVlNO6QxE0GQoF6bza4UyTeKQi6ft+50lP
         Ob6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701657756; x=1702262556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEUh6K5iutasnoMeRQbvniZJyhB8EqO9DGWeSRBdHG8=;
        b=siCqRmQeeTewqDo+4lI9snbJici9jr89l/369wShcRwuLyNzmnmkSY6xnazErK7/4o
         L+Gq75MJpccWXVjAOqsy1Hdxc7a41LUIJwZgGrZ0OmQmpidwH0G1QEw5Gi6rg0kxIlqI
         1M59fYRmH+TQcwhf7kWbBLk0Tl0BceqLuscXlkLj2dGz/YjIHEd1rEaGIA0Gs20iB7CT
         DbYEKDci5KGbQ2CR+SpyqN0P1HEGqTGUnVujj8uzsYZ5DIKDVcmZXvsV/QjX4AmROLas
         w190kNESks0FI6XC/d78NnqB9nswU6y0mkPqiEJeoigZqx5oBhEFesRKD2//2ahvmO8t
         paPQ==
X-Gm-Message-State: AOJu0YwVkfQ6d+VSMmrfSoX18kAGiwtHyuHtzhNdurdboYxqzWc5S3Im
	HWSTr/1icYlojC7nN+sDxHD4Be9SMpNgxpM4jq8=
X-Google-Smtp-Source: AGHT+IFwUdfTpFRUP7l0fmhtGiz7fd+NP19pyuThwxbiypx7Ivz7rX5Zrc/KjwBbAY7wO0CJI2SrHgFWM/kImEvN9oM=
X-Received: by 2002:a05:6512:ea1:b0:50b:f03c:1eaa with SMTP id
 bi33-20020a0565120ea100b0050bf03c1eaamr553100lfb.95.1701657756237; Sun, 03
 Dec 2023 18:42:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel> <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
In-Reply-To: <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 4 Dec 2023 10:42:24 +0800
Message-ID: <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_184240_596623_2066C182 
X-CRM114-Status: GOOD (  16.75  )
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMjoyMeKAr1BNIEhhaWJvIFh1IDx4aWFvYm81NXhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDU6NTLigK9QTSBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IFNlcCAxNCwgMjAyMyBhdCAwOTozNzowM0FNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4g
QWRkIGEgS1ZNIHNlbGZ0ZXN0cyB0byB2YWxpZGF0ZSB0aGUgU3N0YyB0aW1lciBmdW5jdGlvbmFs
aXR5Lgo+ID4gPiBUaGUgdGVzdCB3YXMgcG9ydGVkIGZyb20gYXJtNjQgYXJjaCB0aW1lciB0ZXN0
Lgo+ID4KPiA+IEkganVzdCB0cmllZCB0aGlzIHRlc3Qgb3V0LiBSdW5uaW5nIGl0IG92ZXIgYW5k
IG92ZXIgYWdhaW4gb24gUUVNVSBJIHNlZQo+ID4gaXQgd29ya3Mgc29tZXRpbWVzLCBidXQgaXQg
ZnJlcXVlbnRseSBmYWlscyB3aXRoIHRoZQo+ID4gR1VFU1RfQVNTRVJUX0VRKGNvbmZpZ19pdGVy
ICsgMSwgaXJxX2l0ZXIpIGFzc2VydCBhbmQgYXQgbGVhc3Qgb25jZSBJCj4gPiBhbHNvIHNhdyB0
aGUgX19HVUVTVF9BU1NFUlQoeGNudCA+PSBjbXApIGFzc2VydC4KPiA+Cj4KPiBHb29kIGNhdGNo
IQo+Cj4gSSBjYW4gYWxzbyByZXByb2R1Y2UgdGhpcyBpc3N1ZSBhbmQgaXQgaXMgYSBjb21tb24g
cHJvYmxlbSBmb3IgYm90aAo+IGFybTY0IGFuZCByaXNjdiBiZWNhdXNlIGl0IGFsc28gaGFwcGVu
cyBpbiBhIGFybTY0IFFlbXUgVk0uCj4KPiBJdCBzZWVtcyBsaWtlIGEgc3luY2hyb25pemF0aW9u
IGlzc3VlIGJldHdlZW4gaG9zdCBhbmQgZ3Vlc3Qgc2hhcmVkCj4gdmFyaWFibGVzLiBXaWxsIGRv
dWJsZSBjaGVjayB0aGUgdGVzdCBjb2RlLgo+Cj4gPiBUaGFua3MsCj4gPiBkcmV3CgpIaSBBbmRy
ZXcsCgpBZnRlciBzZXZlcmFsIHJvdW5kcyBvZiByZWdyZXNzaW9uIHRlc3RpbmcsIHNvbWUgZmlu
ZGluZ3M6CjEuIFRoZSBpbnRlcm1pdHRlbnQgZmFpbHVyZSBhbHNvIGhhcHBlbmVkIG9uIEFSTTY0
IFFlbXUgVk0sIGFuZCBldmVuCmluIHRoZSBpbml0aWFsIGFyY2hfdGltZXIgY29tbWl0KDQ5NTlk
ODY1MGU5ZjQpLgoyLiBpdCBkaWRuJ3QgaGFwcGVuIG9uIGEgQVJNNjQgSFcoYnV0IGEgZGlmZmVy
ZW50IGZhaWx1cmUgb2NjdXJlZApkdXJpbmcgc3RyZXNzIHRlc3QpCjMuIFRoZSBmYWlsdXJlIGhh
dmUgYSBjbG9zZSByZWxhdGlvbnNoaXAgd2l0aApUSU1FUl9URVNUX0VSUl9NQVJHSU5fVVMoZGVm
YXVsdCAxMDApLCBhbmQgYWZ0ZXIgaW5jcmVhc2luZwogICAgIHRoZSBtYWNybyB0byAzMDAsIHRo
ZSBmYWlsdXJlIGNvdWxkbid0IHJlcHJvZHVjZWQgaW4gMTAwMCBsb29wcwpzdHJlc3MgdGVzdCBp
biBSSVNDLVYgUWVtdSBWTQoKU28gbXkgc3VnZ2VzdGlvbiBpcyB3ZSBjYW4gZXhwb3NlIHRoZSBU
SU1FUl9URVNUX0VSUl9NQVJHSU5fVVMKcGFyYW1ldGVyIGFzIGFuIGFyY2hfdGltZXIgdGVzdCBh
cmcgcGFyYW1ldGVyCmFuZCB0dW5lIGl0IGJhc2VkIG9uIGEgc3BlY2lmaWMgdGVzdCBlbnZpcm9u
bWVudC4KCldoYXQncyB5b3VyIG9waW5pb24/CgpSZWdhcmRzLApIYWlibwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
