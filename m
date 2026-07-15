Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5477C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMKmBJ875x5oFcm72Th9ihjngkqo1LyL/KyJ6ur+9JI=; b=2gdbs6Fzq/qRaT
	2/RH5sq64kSqy2xOsW+TC3O5n7Ox6OdFuDbi9lzusra6sFKpu3/BodZ/1pHGxcqnaFzQc3Hk0/btm
	8UiSTUDNWKyeSWS8iNKYOz19lWRWvFVVk53mkxRioZwfi8knvGPl+nbqtxN9Gav7/kuUmYeRlAUwA
	exllzPXPFqg00mSSdTmyf/PIWQaoQ0uET8O2IrAA+LAWqVTpMPUhDSyJFbWwsmha4pX7kkZ3EHAjD
	HzET9FIXxArJaIpqw2F+gNXmoPCQeisyFQxH1D84nnzBUZzEv6T6uQfWYWy8c8yucFvKY63ZNZ8gM
	dthZV7v6E9KTj17jmgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz57-0000000Eqoi-1KRj;
	Wed, 15 Jul 2026 12:51:21 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4x-0000000EqeO-0ius
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 12:51:20 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953ddae026so3890545e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 05:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784119868; cv=none;
        d=google.com; s=arc-20260327;
        b=mqV3aTjHzUjLyvN/uYDD6ptWc8C+JEAwaqugiNfqTAPW4JOv8jbP6aR8DLeXXlpgzX
         fk+KwrfNvEHzidDjuJM87QFxlgDvyrIPUZ/cCcmxdtvZXLIOnYVfEAiFzvREgAUwUKSF
         glbf4jJRWmXDI6xyE/Eweiz0ZnD5Yd1YTb4GTGUwXXwLs/wXHZIyGnFgpvaoVzZiwopI
         nt+oLGYTcQLeBsw4jquhgU3NRITapc1m35I+MRMuKCqklPaz+/r8EkETOJse6y6elqJI
         mSljOLWrSnSqlhUCGi0s9AfJWRRkg9NtPkCeNAwB/mBqaWp4wwSQMEzujafkojPDpLSC
         qVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        fh=IGkwTUps//NeNMr5Q+mo0QvE8BDCJuQ7aJOPd8d5ezM=;
        b=fYdYy0pk5QriuNVVhGsNS+WvgThVV6LheyG7k/h+rNDInZ43K/oifp1xUoLSQJwL6E
         mYohTbcpf7vSoXMyfp4DtqFeS/ogmIz4hAQzKmQXd91Bp8Vt0JXNy8k8pbh4yR0VgYTU
         aipcpvZjKPFwfFrCLxecBQBR6QaaY5iAhTvwN1yaXzEws8LjxsOsGprMEg6CYKFhKCB9
         XMCO9NP2Ps9SDdTM+OKnUrtm4hAU+7exrz2SbIjqS3LpAo5F0Uald0ORSn7vkyMuCYIp
         +8rNUdd1Qrn0+ZWREm1QDTeDdlmUBD1fHxxCf74gAohB2mRrNl2WSp9MrqNCpb4TOmym
         sS9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784119868; x=1784724668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        b=MyHYYQoPKwSysQHpMX75V/iGVhp7tahy12yGnBZWKwdBknug8gyzKrXI4X7j1PFEeo
         Xgz9FjT3DuBWtGjrYV5sNtPHmi+UWctDh5L5lchynUks+TGKV1zYXzEPXSFkQdePW7Y+
         Feky173fzorowU2JGw8qHxbo2Dd6NmUZPcDIpxUFLSi6MiVIKkXaqykCEEJiKW7d8wLw
         OZjExCvEcVUdK0632aC87c57G5Yh4xyrN4mxnrijaMFjmgSSaTx2A9oZ0bEkyVEU6GVQ
         Db45H4sa+ZGcBUAcoWXSLjSqEYFIot35WGQr4AQRUrckKYR+3tNP0MxbfMPCLvjtzE2e
         KNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119868; x=1784724668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        b=hIwLkrvVrw7y6LqyFgufjmmW2NhuE21/CoeWg3YvIITcz4lgYI6Lv0ovsfp/Q4pJ6J
         H/knotLEWrAXvOtgauxP7PTsc+zJ2/067g4DsYSRyzLD9KpsBlbeye2zCdTnUp4e+Zn1
         zjoi1RcJPbvQvaNhDSLZboFzfYCjazpSr7etbibcFaSSS+AZ6pvLQJi8mMoo/aCQ5EbF
         rwR6L8xXHvH88pldZzJTuV/rlIRELQKFHEozCFuU/J7m/vySf0ndv5lnVOxC6Ji21K29
         vXSxqp4TkjvwcN3DsZ2ljD3eJU+dBlcxVkBaneu6AR+URMVxETro3Rn3/swwDLWd3Y5w
         MASw==
X-Forwarded-Encrypted: i=1; AHgh+RoInlVjLdcyxKuvZ7zQhDJV1UH6or2/DIbB99xnoC29xgVIybkeZwQY9qfteASlvCAj/CXVZjIBLAxo7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLH3xxCpxotB0IIt2+ZhLk39b3L1iY7jvBKWO47bvUc+0RfpYc
	se+gtSSQMVirMxh7a5uLDb4RnbESlLbvv9Thh7yQlwrZ8a8w8zjIxLG+O+EACRbIYVWnp6XrvFG
	ioijosG8RtiduwUf/cG5m7A0OB7rYkGcJAd9DIsjN1g==
X-Gm-Gg: AfdE7cm8AGxNBkFKDZ+RbZQC3MAHbR70q7SvkSZup/zVYeSR1aMfTJLGvx+W6WATLrr
	eSpz/+ootCykEC1hCUkNebCV5mkLf+/4fMA3lBLUjGacuLyJFw/lT+97DUNGF9fVfu+MSW20+68
	iu5Mt7N95LW4H7ThnNRMg3zMn/0KOKJeykdV+1UDkpcZtdms3/dgZ2b+jg56wL42ifBTYby3Rw/
	uwxF7r80ZJZAhjss1PGmMZd7nMcHCle4B1Sod0wjtPEPns0WqpnaFAZHQP1YLnx9PxMb/9RaAhG
	wzWEScCcuIR6O/Bk/gyDeaX13htiJSFOLxvL8kI6OA7FphE9dngl2X3PNBLtnIV1A1pWlNp9MDr
	PAhwQ3NZiS2I5estMXR5NVEqrIc8=
X-Received: by 2002:a05:600c:34c9:b0:493:f826:89a6 with SMTP id
 5b1f17b1804b1-493f87806ddmr186711985e9.0.1784119867968; Wed, 15 Jul 2026
 05:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260715030818.75657-1-min_halo@163.com>
In-Reply-To: <20260715030818.75657-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Jul 2026 18:20:55 +0530
X-Gm-Features: AUfX_myEAwkg-DK47-Nw8T398vurr_etEiC2Mn8n3DA4o5cqkrypTMsduIATEYE
Message-ID: <CAAhSdy1cSDB-8XbkjMzhZafvOwM=ghjcaoiGd3NXGxLnAUMzkw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix Spectre-v1 in vector register access
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055111_251975_CC5E1E81 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgODozOOKAr0FNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiBVc2VyLWNvbnRyb2xsZWQgcmVnaXN0ZXIgaW5kaWNlcyBmcm9tIHRoZSBPTkVf
UkVHIGlvY3RsIGFyZSB1c2VkIHRvCj4gaW5kZXggaW50byB0aGUgdmVjdG9yIHJlZ2lzdGVyIGJ1
ZmZlciAodjAuLnYzMSkuIFNhbml0aXplIHRoZSBjYWxjdWxhdGVkCj4gb2Zmc2V0IHdpdGggYXJy
YXlfaW5kZXhfbm9zcGVjKCkgdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmRzCj4g
YWNjZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91IDx6aG91em9uZ21pbkBreWxp
bm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExpbnV4LTcuMi1yY1gKClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDE0ICsrKysr
KysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gaW5kZXggNjJkMmZiNzdiYjliLi4zNzA4NjE2ZTJj
MzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8
bGludXgva3ZtX2hvc3QuaD4KPiArI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9rdm1faXNhLmg+Cj4gQEAgLTEyOSwxMSArMTMwLDIwIEBAIHN0YXRpYyBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfdnJlZ19hZGRyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiAgICAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgfSBlbHNlIGlmIChyZWdfbnVtIDw9IEtWTV9SRUdfUklTQ1ZfVkVDVE9SX1JFRygzMSkp
IHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyByZWdfb2Zmc2V0Owo+ICsKPiAgICAg
ICAgICAgICAgICAgaWYgKHJlZ19zaXplICE9IHZsZW5iKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICBXQVJOX09OKCFjbnR4LT52ZWN0
b3IuZGF0YXApOwo+IC0gICAgICAgICAgICAgICAqcmVnX2FkZHIgPSBjbnR4LT52ZWN0b3IuZGF0
YXAgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAocmVnX251bSAtIEtWTV9SRUdfUklT
Q1ZfVkVDVE9SX1JFRygwKSkgKiB2bGVuYjsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAg
ICAgICAgICAgICogVGhlIHJlZ19udW0gaXMgZGVyaXZlZCBmcm9tIHRoZSB1c2Vyc3BhY2UtcHJv
dmlkZWQgT05FX1JFRwo+ICsgICAgICAgICAgICAgICAgKiBpZC4gU2FuaXRpemUgaXQgd2l0aCBh
cnJheV9pbmRleF9ub3NwZWMoKSB0byBwcmV2ZW50Cj4gKyAgICAgICAgICAgICAgICAqIHNwZWN1
bGF0aXZlIG91dC1vZi1ib3VuZHMgYWNjZXNzIHRvIHRoZSB2ZWN0b3IgcmVnaXN0ZXIKPiArICAg
ICAgICAgICAgICAgICogYnVmZmVyICgzMiB2ZWN0b3IgcmVnaXN0ZXJzOiB2MC4udjMxKS4KPiAr
ICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJlZ19vZmZzZXQgPSBhcnJheV9p
bmRleF9ub3NwZWMoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdfbnVtIC0g
S1ZNX1JFR19SSVNDVl9WRUNUT1JfUkVHKDApLCAzMik7Cj4gKyAgICAgICAgICAgICAgICpyZWdf
YWRkciA9IGNudHgtPnZlY3Rvci5kYXRhcCArIHJlZ19vZmZzZXQgKiB2bGVuYjsKPiAgICAgICAg
IH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICAgICAgICAgfQo+
IC0tCj4gMi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNr
ZWQgYnkgSGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
