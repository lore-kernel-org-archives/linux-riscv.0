Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B259CCA0ED3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zh336PZB7OEUfZQgL7Xe/e2qQfQ4NlHbUXSgkrU+ips=; b=RcY0o3HyugTxXG
	SBbw9D9i9tCnq72LCnkFEVq83fqOyWShCE3WpPVS1qINbjTZLQ/UKsa3dJhGgOnXB5IcBFcZclQSm
	NwtSdy1YR+FCD/ZqUFn7qp0wnjGv5Rb5ua/dfcKjNaleI2avHZ06RT914T+cJta7Jv2SexEnQtlkG
	iRxImPjEIwtyRYWrh6z+b1T87YVbTiBHYvM6akiow4MMz36Iaw8nE63fO5zG/jgC+Zq7hIHQPA9uU
	HlKXXG9AKWjlrryEHVUxm5Ih6R/VtsjnmI/94qF15AJlwKfpSEtC0iHWyQe3neJXVZwuCIOKmearI
	U62HXmTST/YxKz0zJHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slr3D-00000004nkD-2GO8;
	Wed, 04 Sep 2024 14:32:03 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slr39-00000004niy-2tkD
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:32:01 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-82a24dec9cbso29163739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1725460318; x=1726065118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zATIwTHrXGiuEASzCytr2UxxMjPOWVj85mDZ7xtUWY=;
        b=fShNzHpaB8DnawO0SrXQyAcoZ9CzaASPZVAwiQEIHiYoQhNJnQOdifPEjXoPwqUG+6
         0s717qFo80EVMkFb08k3BLAVocCT1aUuAcK7L7x/mMQrFVEUcrCtoCswtSKIvU44WcJQ
         5/axGxdSjGkBZC1E86zt+poIR1L4ovlzRbozd+V2I3aMavN/Y2dB10v/WR5fV3u6ycJk
         uW/HRzvTCZvO6dobdegclpymLGVExwyOx7/1GfGyiLSpl9p9GMQx/sSFbfEV0csc64o8
         HNx8chxHMyGobwueJwbwb7P9j2Kn7kJXwpMFEnUQnhfmCamtf3iJYcT3+havy0AJOe5l
         DC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725460318; x=1726065118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zATIwTHrXGiuEASzCytr2UxxMjPOWVj85mDZ7xtUWY=;
        b=L4/WzME8RIkw+ShPujB8U5dhLcC3BC/BsL5ZettXaDYUEYP6XURRuHMe5EC+ZP1H+F
         Kr8ZR+WMYWV8mkz3ZhkItGpj34/WpQ77Tuyv4q3s03cH2mOlnimKnxgcE9xVZzIo1+B1
         qhYO31HanDEPS01UTFe3XcbynSxkUJsUhm8LaVoQIfrx9JLdL/f54yKWF8GGdrF2ETWd
         N8rpMcm9Hj8CsGtLzfXlLxfx6JWo9+YhNQz43dQwQUnagKV+GkmYxQgrkVTaPjRs/GMw
         GRvx7za51Di21a5CE7IhPhE+mqMGGEgNfUMRrXW1sRH0kLMj4JQQN6L5ZW+ma3nB3klH
         3C9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUqD82/oEDj+quJTufk8tJyX1AnPBa+hRpb8BQi+pChCHGgChAXBHrGBeRoqvEmX4R2gMo+7o6O+lzNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfdQc+AaPFB0hPQuLg41i9q5IMsIkazJG5pjMZ/okz4ML2V010
	vliK6faQwgshXbuyRCDiLVWUC1xTZxHaGayu/s+ezasc1ybQB3MKOZhJ9APl5Z0=
X-Google-Smtp-Source: AGHT+IGm922K5aFjLbKMqisIulQGXLK1ylnjjkQghXfkGhr+kR8pZuYKfC5l0rEzVrrQHd7K7bQv8A==
X-Received: by 2002:a6b:7e0c:0:b0:806:3dac:5081 with SMTP id ca18e2360f4ac-82a7920d595mr183512639f.7.1725460317814;
        Wed, 04 Sep 2024 07:31:57 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ced2ee8559sm3114240173.174.2024.09.04.07.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:31:57 -0700 (PDT)
Message-ID: <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
Date: Wed, 4 Sep 2024 09:31:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm-riscv@lists.infradead.org
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com>
 <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_073159_839614_FDFA54C7 
X-CRM114-Status: GOOD (  24.51  )
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

SGkgQW51cCwKCk9uIDIwMjQtMDktMDQgNzoxNyBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBU
aHUsIEF1ZyAyOSwgMjAyNCBhdCA2OjMy4oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBpbnRlcmZhY2UgZm9yIGNvbnRyb2xs
aW5nIHBvaW50ZXIgbWFza2luZyBpbiBWUy1tb2RlIGlzIGhlbnZjZmcuUE1NLAo+PiB3aGljaCBp
cyBwYXJ0IG9mIHRoZSBTc25wbSBleHRlbnNpb24sIGV2ZW4gdGhvdWdoIHBvaW50ZXIgbWFza2lu
ZyBpbgo+PiBIUy1tb2RlIGlzIHByb3ZpZGVkIGJ5IHRoZSBTbW5wbSBleHRlbnNpb24uIEFzIGEg
cmVzdWx0LCBlbXVsYXRpbmcgU21ucG0KPj4gaW4gdGhlIGd1ZXN0IHJlcXVpcmVzIChvbmx5KSBT
c25wbSBvbiB0aGUgaG9zdC4KPj4KPj4gU2luY2UgdGhlIGd1ZXN0IGNvbmZpZ3VyZXMgU21ucG0g
dGhyb3VnaCB0aGUgU0JJIEZpcm13YXJlIEZlYXR1cmVzCj4+IGludGVyZmFjZSwgdGhlIGV4dGVu
c2lvbiBjYW4gYmUgZGlzYWJsZWQgYnkgZmFpbGluZyB0aGUgU0JJIGNhbGwuIFNzbnBtCj4+IGNh
bm5vdCBiZSBkaXNhYmxlZCB3aXRob3V0IGludGVyY2VwdGluZyB3cml0ZXMgdG8gdGhlIHNlbnZj
ZmcgQ1NSLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHYyKQo+Pgo+PiBD
aGFuZ2VzIGluIHYyOgo+PiAgLSBOZXcgcGF0Y2ggZm9yIHYyCj4+Cj4+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggfCAyICsrCj4+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJl
Zy5jICAgICAgfCAzICsrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+PiBpbmRleCBlOTdkYjMyOTY0NTYuLjRmMjQy
MDEzNzZiMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+PiBAQCAtMTc1LDYg
KzE3NSw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+PiAgICAgICAgIEtWTV9SSVND
Vl9JU0FfRVhUX1pDRiwKPj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUCwKPj4gICAg
ICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdSUywKPj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VY
VF9TTU5QTSwKPj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTSwKPj4gICAgICAgICBL
Vk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4+ICB9Owo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPj4gaW5k
ZXggYjMxOWM0YzEzYzU0Li42ZjgzM2VjMjM0NGEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+
PiBAQCAtMzQsOSArMzQsMTEgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9l
eHRfYXJyW10gPSB7Cj4+ICAgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX01dID0gUklTQ1ZfSVNB
X0VYVF9tLAo+PiAgICAgICAgIFtLVk1fUklTQ1ZfSVNBX0VYVF9WXSA9IFJJU0NWX0lTQV9FWFRf
diwKPj4gICAgICAgICAvKiBNdWx0aSBsZXR0ZXIgZXh0ZW5zaW9ucyAoYWxwaGFiZXRpY2FsbHkg
c29ydGVkKSAqLwo+PiArICAgICAgIFtLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTV0gPSBSSVNDVl9J
U0FfRVhUX1NTTlBNLAo+IAo+IFdoeSBub3QgdXNlIEtWTV9JU0FfRVhUX0FSUigpIG1hY3JvIGhl
cmUgPwoKQmVjYXVzZSB0aGUgZXh0ZW5zaW9uIG5hbWUgaW4gdGhlIGhvc3QgZG9lcyBub3QgbWF0
Y2ggdGhlIGV4dGVuc2lvbiBuYW1lIGluIHRoZQpndWVzdC4gUG9pbnRlciBtYXNraW5nIGZvciBI
UyBtb2RlIGlzIHByb3ZpZGVkIGJ5IFNtbnBtLiBQb2ludGVyIG1hc2tpbmcgZm9yIFZTCm1vZGUg
aXMgcHJvdmlkZWQgYnkgU3NucG0gYXQgdGhlIGhhcmR3YXJlIGxldmVsLCBidXQgdGhpcyBuZWVk
cyB0byBhcHBlYXIgdG8gdGhlCmd1ZXN0IGFzIGlmIFNtbnBtIHdhcyBpbXBsZW1lbnRlZCwgc2lu
Y2UgdGhlIGd1ZXN0IHRoaW5rcyBpdCBpcyBydW5uaW5nIG9uIGJhcmUKbWV0YWwuCgo+PiAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihTTVNUQVRFRU4pLAo+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FS
UihTU0FJQSksCj4+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNTQ09GUE1GKSwKPj4gKyAgICAg
ICBLVk1fSVNBX0VYVF9BUlIoU1NOUE0pLAo+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU1RD
KSwKPj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4+ICAgICAgICAgS1ZNX0lT
QV9FWFRfQVJSKFNWTkFQT1QpLAo+PiBAQCAtMTI5LDYgKzEzMSw3IEBAIHN0YXRpYyBib29sIGt2
bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQpCj4+ICAg
ICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9NOgo+PiAgICAgICAgIC8qIFRoZXJlIGlzIG5v
dCBhcmNoaXRlY3R1cmFsIGNvbmZpZyBiaXQgdG8gZGlzYWJsZSBzc2NvZnBtZiBjb21wbGV0ZWx5
ICovCj4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRjoKPj4gKyAgICAg
ICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTTlBNOgo+IAo+IFdoeSBub3QgYWRkIEtWTV9SSVND
Vl9JU0FfRVhUX1NNTlBNIGhlcmUgPwo+IAo+IERpc2FibGluZyBTbW5wbSBmcm9tIEtWTSB1c2Vy
IHNwYWNlIGlzIHZlcnkgZGlmZmVyZW50IGZyb20KPiBkaXNhYmxpbmcgU21ucG0gZnJvbSBHdWVz
dCB1c2luZyBTQkkgRldGVCBleHRlbnNpb24uCgpVbnRpbCBhIHN1Y2Nlc3NmdWwgU0JJIEZXRlQg
Y2FsbCB0byBLVk0gdG8gZW5hYmxlIHBvaW50ZXIgbWFza2luZyBmb3IgVlMgbW9kZSwKdGhlIGV4
aXN0ZW5jZSBvZiBTbW5wbSBoYXMgbm8gdmlzaWJsZSBlZmZlY3Qgb24gdGhlIGd1ZXN0LiBTbyBm
YWlsaW5nIHRoZSBTQkkKY2FsbCBpcyBzdWZmaWNpZW50IHRvIHByZXRlbmQgdGhhdCB0aGUgaGFy
ZHdhcmUgZG9lcyBub3Qgc3VwcG9ydCBTbW5wbS4KCj4gVGhlIEtWTSB1c2VyIHNwYWNlIHNob3Vs
ZCBhbHdheXMgYWRkIFNtbnBtIGluIHRoZQo+IEd1ZXN0IElTQSBzdHJpbmcgd2hlbmV2ZXIgdGhl
IEhvc3QgSVNBIHN0cmluZyBoYXMgaXQuCgpJIGRpc2FncmVlLiBBbGxvd2luZyB1c2Vyc3BhY2Ug
dG8gZGlzYWJsZSBleHRlbnNpb25zIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyBhbmQKdG8gc3VwcG9y
dCBtaWdyYXRpb24gdG8gaG9zdHMgd2hpY2ggZG8gbm90IHN1cHBvcnQgdGhvc2UgZXh0ZW5zaW9u
cy4gU28gSSB3b3VsZApvbmx5IGFkZCBleHRlbnNpb25zIHRvIHRoaXMgbGlzdCBpZiB0aGVyZSBp
cyBubyBwb3NzaWJsZSB3YXkgdG8gZGlzYWJsZSB0aGVtLgoKPiBUaGUgR3Vlc3QgbXVzdCBleHBs
aWNpdGx5IHVzZSBTQkkgRldGVCB0byBlbmFibGUKPiBTbW5wbSBvbmx5IGFmdGVyIGl0IHNlZXMg
U21ucG0gaW4gSVNBIHN0cmluZy4KClllcywgZXhhY3RseSwgYW5kIHRoZSBwdXJwb3NlIG9mIG5v
dCBpbmNsdWRpbmcgU21ucG0gaW4gdGhlIHN3aXRjaCBjYXNlIGhlcmUgaXMKc28gdGhhdCBLVk0g
dXNlciBzcGFjZSBjYW4gY29udHJvbCB3aGV0aGVyIG9yIG5vdCBpdCBhcHBlYXJzIGluIHRoZSBJ
U0Egc3RyaW5nLgoKUmVnYXJkcywKU2FtdWVsCgo+PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lT
QV9FWFRfU1NUQzoKPj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4+
ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVk5BUE9UOgo+PiAtLQo+PiAyLjQ1LjEK
Pj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
