Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16D4C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1N9YWfPGxvHkxseeiPZ7SrAl5T9P9Hj3+C8aP/Av1Q=; b=1/Jglfs7nym8/4
	6OR8Qi4omtv6wdcdg+YKmqYig4fIeaveL5458+v9fVh9byChUU7LNkGhtZJHNDd0mabzR2baW2SJ8
	PaMAY5MlZXJPyVv1V4fpPMFzsvvl1Ton7Mm1FqmIact7h7dlGmIN0q0sbCiBs9eWAPX3Jp9VVWX0Q
	/DaPVOXyQX+5JVyhrokCLZJpUcIiORlnr3sSeF4KUQgB31vOPi6k+uYqeP6Ifwi7uM5/kEf73mR1D
	WnI7znpAG2P+kIjvxb7/czVPL0T45IUOxbfIlajgCGM9LAJXSQaTvjdntpQJo6sR5OCHMJpBkHnoG
	ETqEpb21lBqLwu1Q/F6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJ7-0000000EXcx-3flH;
	Thu, 10 Sep 2026 13:59:17 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJ3-0000000EXc0-46sA
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:59:16 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so1297686f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048751; cv=none;
        d=google.com; s=arc-20260327;
        b=MLWy93AqdxuEgxCgHsC4ZJ4F9bic3zNmQfM36udVICIvatdsZEoxHlpvxZ1RgdRTi1
         Kc5XsK9yE6Q6KJYNlTZAi/JRJXiZzvWNtvL1Wcl1qxqjHH7cjn9VC33MJJMK4W9O3Waf
         id+bd3yYx3G+zWlfIGlgDZIFzTDTCMDuIE+plmca0IcmBmeHiuEDw3Gj5cYM8oBGknCB
         rDgDxqJaOaghaEG/xBFyB/Gsws3gedwtf/Zp8beWCZ4mJ1QjlmcHADLKFjDWKDsNNzDW
         LwEdNXj6+/2BJCHGcQwS6/jU97bPzfp0sH6z/QGzJMHhA9prtMyfqMYiwwBHDKc2cPdN
         hM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        fh=hQJSBMuG8vtwbKOxnETQ8wXX7NbfW3kvW+RgHVSjubk=;
        b=HRbTvadtfHcRLw7bbkHzYoAPd+xmoKwRq1t//TBLqc56o+7dZ6D+eE0kBu9DWo2Fo0
         yI95WGmedCMsVD3KNPfHqJStvbsnROd8a/9L6/7l2zTNVou8Ky0JK5XWl8qS5QeypzVw
         mUV4pGp+INAumUVLGXi0VRTmeWEiOtwBwG3q8txbri08R4Zj/ePy26t2REIZdpqp2u9f
         nGLgNGtD4kkZJ78KKyBljQLQL8+IODhSlo1aZuXH5oc5KVzDgUZDo8rHZ28+wLcvQ9EH
         GvH+Fb8FtDr+S6L7P/1f13LXwtsxqjTOxqYyuIxmPeT3fLMjaKQ7s/vwlXH1rEzSCi9C
         ptkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048751; x=1789653551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=E6ddSNUMxaQaFcbERIZ7Uoz+ajwXdNpZ5UZWqXm4x9FYbzYhSHjof7jiur47/fKZ4X
         G1hnEQX3psly0fD+roMRfO4EP0lB2Q1NsmdputaLy3XIwSIZp+FeF8i2r2y/OUF6vsVO
         r3g/eAuXIWBf+HpW1MgCXUvKNKlhHAclvxHPyeu3yvluv5YhQ2/Nh6IlJGZei0PnSOE3
         Ri5NHEm80HUvIEznvo4jI/ptQghwr4WZLLiE4/a3QCkXqsn/oGmJgIcwD2SQ7igWzj4i
         pEWYI99fBiWXSTe+f4WlgcBUDJnalY4KnAEOy7dwMu4+3dmdq9eZM/7LP1+RPS48/fwh
         t/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048751; x=1789653551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=DJjqcRDBHb/fyf7u7w9q3Ko1kqdN7TFqvQVTThTlCJkeYPgCf0QVdxlH85j9uKVIT1
         dF4ViNie2HQkceO5qf3YOKTUOehhnFtI1JN44ynYN08dsVsW3EkZIg2x6qeUBcyg+c/t
         DsyIm7X5GPOjFbN+AYRxItJGVzbT45GXcVfTTOUS1XuaLP37SgE3IwGiGjdEHsIwXOrF
         rpvjKXztfFGQnp1y/U3oTOVAZlC1WKQtnHycGwzLsYitHXC3hindkd0SbV6YedOIMsZ5
         ggj4mVsA3dDgk26htHJGMyiTDzMsEsm3ujtBkvOyFMiLEb/WbN2eoFGZTHYvV5TJqe/c
         pa6A==
X-Forwarded-Encrypted: i=1; AKwUvBzTgmjEPRC3DNNLid5Yx3FaJm8hmVLaQV1RvWSGO6M6JZjr0qjxUzvMDYwtYQ4pomDFHDrzFAwd1zBmmA==@lists.infradead.org
X-Gm-Message-State: AFuF++mc6RQfC7YqGuybCh7cnyBsBKeTltGS0hfMG453ay1iNKKsCVk+
	XVeXMkKB/un/wKqFr4sLPQZrhrWEG37qGkwrNqo0TGupsn2ZbpeATB5NGDNKyFT2b2z+4/l94YV
	pgkMaNolcxKcuxV0+BjXiOk94oU603Qa4s0yoESGzUA==
X-Gm-Gg: AYBFou3w+UEX2dubrdEAqdv7SQ3HhbGO4J63DdXKF9VTnNecmpwNYUjL1AL5hJ+6+DR
	pVU9NYQ4AE5WkoeudqaV+3ZZ+Z7zRpnpSFrbSpgs+TqkyenpBILIzSS4V0QPzuynKqM1S0wDJdm
	1GZ3TpxgVuvwKEcdctLJmylfl9zyaR1/049c6xyL4ZUsRAh0gDGDt8iuhraW6yMVy7b9UG4L1W0
	ChhQShKf2nkYo8RkefbfA+bjngw4zfiZfj0IswIuIpZg4C08+SXk5SpVQP5rpUY5QINZiepnyA7
	Fl4AqM6Zp1GqK36ywuvuPWe/8GYiiT7QZU43789meP1Gn1RAskYlL0p5UojBRXFM3BP7CYkJnzy
	APy0i24wcy/ySbsifDggy+7t4W5jIB09uN9BvGzX7dt6u5uZcTHLS4AQzNxx8cHCwiDj5U0tK2g
	==
X-Received: by 2002:a05:6000:402c:b0:485:acfd:4fa2 with SMTP id
 ffacd0b85a97d-485acfd572dmr20259573f8f.28.1789048750919; Thu, 10 Sep 2026
 06:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-2-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-2-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:28:58 +0530
X-Gm-Features: AcwNN1VoynwwDilW3Qq5_YgkFrLdSifis-TkUfgosx4SiSWNhFsAD_CF6I0IGk8
Message-ID: <CAAhSdy16n_zWBudDS0_E8xK=mhKBOvLMz00SRWnY0ArDkJF=qw@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] RISC-V: KVM: Release unused page after MMU invalidation
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_065914_043680_30FE000C 
X-CRM114-Status: GOOD (  16.97  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgMTA6NDbigK9BTSBYaWUgQm8gPHhiQHVsdHJhcmlzYy5j
b20+IHdyb3RlOgo+Cj4gSWYgYW4gTU1VIGludmFsaWRhdGlvbiByYWNlcyB3aXRoIGEgRy1zdGFn
ZSBmYXVsdCwgdGhlIGZhdWx0IGhhbmRsZXIgc2tpcHMKPiBpbnN0YWxsaW5nIHRoZSBwYWdlIGJ1
dCBsZWF2ZXMgcmV0IHNldCB0byB6ZXJvLiBBcyBhIHJlc3VsdCwKPiBrdm1fcmVsZWFzZV9mYXVs
dGluX3BhZ2UoKSB0cmVhdHMgdGhlIHBhZ2UgYXMgdXNlZCBhbmQgY2FuIHVubmVjZXNzYXJpbHkK
PiBtYXJrIGl0IGRpcnR5Lgo+Cj4gVHJhY2sgdGhlIGludmFsaWRhdGlvbiByZXRyeSBzZXBhcmF0
ZWx5IGFuZCByZWxlYXNlIHRoZSBwYWdlIGFzIHVudXNlZCwKPiB3aGlsZSBwcmVzZXJ2aW5nIHRo
ZSBleGlzdGluZyByZXR1cm4gdmFsdWUgc28gdGhhdCB0aGUgdkNQVSByZXRyaWVzIHRoZQo+IGZh
dWx0Lgo+Cj4gRml4ZXM6IDJlZDkwY2IwOTM4YSAoIktWTTogUklTQy1WOiBSZXRyeSBmYXVsdCBp
ZiB2bWFfbG9va3VwKCkgcmVzdWx0cyBiZWNvbWUgaW52YWxpZCIpCj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBYaWUgQm8gPHhiQHVsdHJhcmlzYy5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1
ZWQgdGhpcyBhcyBhIGZpeCBmb3IgTGludXgtNy4zLXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDYwMzViNWUuLmQxODlm
ZDUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS9tbXUuYwo+IEBAIC02MjcsNiArNjI3LDcgQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAg
ICAgICAgIGludCByZXQ7Cj4gICAgICAgICBrdm1fcGZuX3QgaGZuOwo+ICAgICAgICAgYm9vbCBp
c19odWdldGxiOwo+ICsgICAgICAgYm9vbCB1bnVzZWQgPSBmYWxzZTsKPiAgICAgICAgIGJvb2wg
d3JpdGFibGU7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgdm1hX3BhZ2VzaGlmdDsKPiAgICAgICAg
IGdmbl90IGdmbiA9IGdwYSA+PiBQQUdFX1NISUZUOwo+IEBAIC03MTksOCArNzIwLDEwIEBAIGlu
dCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fbWVt
b3J5X3Nsb3QgKm1lbXNsb3QsCj4KPiAgICAgICAgIHdyaXRlX2xvY2soJmt2bS0+bW11X2xvY2sp
Owo+Cj4gLSAgICAgICBpZiAobW11X2ludmFsaWRhdGVfcmV0cnkoa3ZtLCBtbXVfc2VxKSkKPiAr
ICAgICAgIGlmIChtbXVfaW52YWxpZGF0ZV9yZXRyeShrdm0sIG1tdV9zZXEpKSB7Cj4gKyAgICAg
ICAgICAgICAgIHVudXNlZCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9j
azsKPiArICAgICAgIH0KPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIENoZWNrIGlmIHdlIGFy
ZSBiYWNrZWQgYnkgYSBUSFAgYW5kIHRodXMgdXNlIGJsb2NrIG1hcHBpbmcgaWYKPiBAQCAtNzQz
LDcgKzc0Niw4IEBAIGludCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4gICAgICAgICAgICAgICAgIGt2bV9l
cnIoIkZhaWxlZCB0byBtYXAgaW4gRy1zdGFnZVxuIik7Cj4KPiAgb3V0X3VubG9jazoKPiAtICAg
ICAgIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsIHJldCAmJiByZXQgIT0gLUVF
WElTVCwgd3JpdGFibGUpOwo+ICsgICAgICAga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKGt2bSwg
cGFnZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnVzZWQgfHwgKHJldCAm
JiByZXQgIT0gLUVFWElTVCksIHdyaXRhYmxlKTsKPiAgICAgICAgIHdyaXRlX3VubG9jaygma3Zt
LT5tbXVfbG9jayk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
