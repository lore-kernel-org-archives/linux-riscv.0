Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4722E6C5EA
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvJcb3BKGsWKu64THSEPu0MAoEIUbB1j9K3FguXHoFw=; b=XFpMobMCJpQELt
	Y67EA6mGUo1j74BXSW6JvqNEINa1YH2v1hG1yBhYTfgDIF9J/dAgKyBjm/jR2F/fIVz05smAthpI1
	2HSv7B8vRuQgOoArBjyxlqJ8UNkglxYjjb6RucG0081sSt6VePBhndY6R5Jef79VN+Nhi++buesYU
	S2qYYlLdBVPLFB5O9WYCWgv1KNKkG7J9y7HB5XvrW+D4pEwfMeM/yzswJQZEWrINct5ABa6q08EVV
	GVNJ+j36WtWX2oYS6xhDGEAm/PDZvgOLbFFliDyWQX8WQ7h4YUnfn7iUgKfsXLVVdjhXlaHUo/awr
	T9qiFCot2C7412DOt6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIps-000000082aD-3Gkb;
	Tue, 03 Dec 2024 02:40:24 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIoq-000000082Lr-3JLG
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 02:39:22 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-8419f5baedcso154720139f.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 18:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733193559; x=1733798359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=807AMPvhV08hQjY+W9FqkSX3XWvObJEHMlCsMJUuV3g=;
        b=l7DH4jP/JZ9MNG2vyU69y2HJoI11BEclxe3jpotcbw6dKhxuQkFaC0C8gyuWmg0TtS
         C1hPAmRle15N2dfKCzAEEBsF/aVXiBiNzUvuqwLZywFVR/6lnO9g6VsVaVcpdNNbq+DS
         isIAWErZxx7V0NS0xrFeE3bCdNe7aeFFzfMcLfjecT4zKNpR8IqaL1y4ySWU4JNZoVEK
         zlE2CLSiGwZ98e0oo40BuEBeYi6QxE+qHc36amEqo8YJdUZAmX/CFECuucuHZGOYqYMm
         GuGM6P3TkuuAxKkcy2MDTkBu+aWrlvDYfHeN8U4U9mRsPTgZrFyxrU3O4tRVZLlrxrqv
         fs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733193559; x=1733798359;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=807AMPvhV08hQjY+W9FqkSX3XWvObJEHMlCsMJUuV3g=;
        b=sOa7uhOtk+WffkKRno2noJzNOuG8ttAdtxtVG8EnHFie/6SxQ6Gcn0svOxVmApHpfa
         s9TFUZWmyUp3/gB+tJLZwo8eYb7sQRPYM64M/MEeICl7Emg7579zCmeQjlAHub73g1IW
         z3gWRN5AWwFaECgWF7PDc5TqT4LnHCzovHIabYKnfRCyiXnTJ6MQ8ww/k2+01a6VmbJi
         6HYmynOSqDH2RkKYcN5Szc6fwTfBWpToHMBY5yQnWJb+P1paRShUAvV8xMIpEfOhGHOU
         aYX+X2B2dj45qeXc06PkA8fas1CHXYkdfVNJQ2fwkpmv9mTtQadZ+GCieUSKyIkejVye
         /1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXNsvkJ6jnrnKfv0Z3xL0ZyrIx9GZP0ZOI6MExT7as5RZUNPnE5y7VohdMqMHzcQ6xXlDyOmCq6Rg6r+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yFAE1XzCJyU1wqYqArifUp7e/ddBCySodsJoXmruKO7D3gB6
	5NQsh0IWfDWj9E4FdDeu68nj8X2AaG6J1gybgJ8YjeL0dCQ2oISXPWe2+RNdBDM7z0Kq6QHpBI0
	9
X-Gm-Gg: ASbGnctBgaEPi2SIv7HCFnLAUmG+4bhouFckPNjzz3K94UByiENW+/dgsBCsj4AYQ5K
	u9BhtnLra0k06EjPkAZVGfYUJWUsqgXPJapAHjIelhXMh2gCuHllYRVJ1AroK2mJXvXVBO/XX4Q
	a+zTYNgpc84Yf35p6Lf3HiC0S/Cn+DR7Q3qxmDUAv779TZPkktPouAWAFTY1xKPZCbRD40GZw6c
	+UQCY2EPall0fVV2iqFvPuyJm3oHM5vZmmGWjSAic2Qw7xjF3+paM2780ASwKYu0GSgseCH40g=
X-Google-Smtp-Source: AGHT+IHd7BOnDkCqoWQpQn9axYX9LaHCjBDlODl0yRpMhp5QCmkH+d5KKW0iQf5wP+UEGLbQlYkP4Q==
X-Received: by 2002:a05:6602:3405:b0:841:a1c0:c058 with SMTP id ca18e2360f4ac-8445b577d49mr152097239f.9.1733193559650;
        Mon, 02 Dec 2024 18:39:19 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230da8f03sm2387687173.17.2024.12.02.18.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 18:39:18 -0800 (PST)
Message-ID: <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
Date: Mon, 2 Dec 2024 20:39:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
 <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
 <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_183920_885053_66B937A0 
X-CRM114-Status: GOOD (  19.94  )
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

SGkgQXRpc2gsCgpPbiAyMDI0LTEyLTAyIDY6MTUgUE0sIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3Rl
Ogo+IE9uIE1vbiwgRGVjIDIsIDIwMjQgYXQgMjozN+KAr1BNIFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4gT24gMjAyNC0xMS0xOSAyOjI5IFBNLCBB
dGlzaCBQYXRyYSB3cm90ZToKPj4+IFNCSSB2My4wIGludHJvZHVjZWQgYSBuZXcgcmF3IGV2ZW50
IHR5cGUgdGhhdCBhbGxvd3Mgd2lkZXIKPj4+IG1ocG1ldmVudFggd2lkdGggdG8gYmUgcHJvZ3Jh
bW1lZCB2aWEgQ0ZHX01BVENILgo+Pj4KPj4+IFVzZSB0aGUgcmF3IGV2ZW50IHYyIGlmIFNCSSB2
My4wIGlzIGF2YWlsYWJsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRp
c2hwQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2Jp
LmggfCAgNCArKysrCj4+PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDE4ICsrKysr
KysrKysrKy0tLS0tLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4+IGluZGV4IDliZTM4YjA1ZjRh
ZC4uM2VlOWJmYTVlNzdjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaAo+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+Pj4gQEAgLTE1OSw3
ICsxNTksMTAgQEAgc3RydWN0IHJpc2N2X3BtdV9zbmFwc2hvdF9kYXRhIHsKPj4+Cj4+PiAgI2Rl
ZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwoNDcsIDApCj4+PiAgI2Rl
ZmluZSBSSVNDVl9QTVVfUExBVF9GV19FVkVOVF9NQVNLIEdFTk1BU0tfVUxMKDYxLCAwKQo+Pj4g
Ky8qIFNCSSB2My4wIGFsbG93cyBleHRlbmRlZCBocG1ldmVudFggd2lkdGggdmFsdWUgKi8KPj4+
ICsjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfTUFTSyBHRU5NQVNLX1VMTCg1NSwgMCkK
Pj4+ICAjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfSURYIDB4MjAwMDAKPj4+ICsjZGVmaW5l
IFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfSURYIDB4MzAwMDAKPj4+ICAjZGVmaW5lIFJJU0NWX1BM
QVRfRldfRVZFTlQgIDB4RkZGRgo+Pj4KPj4+ICAvKiogR2VuZXJhbCBwbXUgZXZlbnQgY29kZXMg
c3BlY2lmaWVkIGluIFNCSSBQTVUgZXh0ZW5zaW9uICovCj4+PiBAQCAtMjE3LDYgKzIyMCw3IEBA
IGVudW0gc2JpX3BtdV9ldmVudF90eXBlIHsKPj4+ICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9I
VyA9IDB4MCwKPj4+ICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9DQUNIRSA9IDB4MSwKPj4+ICAg
ICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9SQVcgPSAweDIsCj4+PiArICAgICBTQklfUE1VX0VWRU5U
X1RZUEVfUkFXX1YyID0gMHgzLAo+Pj4gICAgICAgU0JJX1BNVV9FVkVOVF9UWVBFX0ZXID0gMHhm
LAo+Pj4gIH07Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4+PiBpbmRleCA1MGNiZGJmNjZiYjcu
LmYwZTg0NWZmNmI3OSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMKPj4+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPj4+IEBAIC01OSw3ICs1
OSw3IEBAIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRSggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+Pj4gICNkZWZpbmUgUEVSRl9FVkVOVF9GTEFHX1VTRVJfQUND
RVNTICBCSVQoU1lTQ1RMX1VTRVJfQUNDRVNTKQo+Pj4gICNkZWZpbmUgUEVSRl9FVkVOVF9GTEFH
X0xFR0FDWSAgICAgICAgICAgICAgIEJJVChTWVNDVExfTEVHQUNZKQo+Pj4KPj4+IC1QTVVfRk9S
TUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC00NyIpOwo+Pj4gK1BNVV9GT1JNQVRfQVRUUihldmVu
dCwgImNvbmZpZzowLTU1Iik7Cj4+PiAgUE1VX0ZPUk1BVF9BVFRSKGZpcm13YXJlLCAiY29uZmln
OjYyLTYzIik7Cj4+Pgo+Pj4gIHN0YXRpYyBib29sIHNiaV92Ml9hdmFpbGFibGU7Cj4+PiBAQCAt
NTI3LDE4ICs1MjcsMjQgQEAgc3RhdGljIGludCBwbXVfc2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVy
Zl9ldmVudCAqZXZlbnQsIHU2NCAqZWNvbmZpZykKPj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+
PiAgICAgICBjYXNlIFBFUkZfVFlQRV9SQVc6Cj4+PiAgICAgICAgICAgICAgIC8qCj4+PiAtICAg
ICAgICAgICAgICAqIEFzIHBlciBTQkkgc3BlY2lmaWNhdGlvbiwgdGhlIHVwcGVyIDE2IGJpdHMg
bXVzdCBiZSB1bnVzZWQKPj4+IC0gICAgICAgICAgICAgICogZm9yIGEgaGFyZHdhcmUgcmF3IGV2
ZW50Lgo+Pj4gKyAgICAgICAgICAgICAgKiBBcyBwZXIgU0JJIHYwLjMgc3BlY2lmaWNhdGlvbiwK
Pj4+ICsgICAgICAgICAgICAgICogIC0tIHRoZSB1cHBlciAxNiBiaXRzIG11c3QgYmUgdW51c2Vk
IGZvciBhIGhhcmR3YXJlIHJhdyBldmVudC4KPj4+ICsgICAgICAgICAgICAgICogQXMgcGVyIFNC
SSB2My4wIHNwZWNpZmljYXRpb24sCj4+PiArICAgICAgICAgICAgICAqICAtLSB0aGUgdXBwZXIg
OCBiaXRzIG11c3QgYmUgdW51c2VkIGZvciBhIGhhcmR3YXJlIHJhdyBldmVudC4KPj4+ICAgICAg
ICAgICAgICAgICogQml0cyA2Mzo2MiBhcmUgdXNlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHJh
dyBldmVudHMKPj4+ICAgICAgICAgICAgICAgICogMDAgLSBIYXJkd2FyZSByYXcgZXZlbnQKPj4+
ICAgICAgICAgICAgICAgICogMTAgLSBTQkkgZmlybXdhcmUgZXZlbnRzCj4+PiAgICAgICAgICAg
ICAgICAqIDExIC0gUmlzYy1WIHBsYXRmb3JtIHNwZWNpZmljIGZpcm13YXJlIGV2ZW50Cj4+PiAg
ICAgICAgICAgICAgICAqLwo+Pj4gLQo+Pj4gICAgICAgICAgICAgICBzd2l0Y2ggKGNvbmZpZyA+
PiA2Mikgewo+Pj4gICAgICAgICAgICAgICBjYXNlIDA6Cj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFg7Cj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgKmVjb25maWcgPSBjb25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4+PiArICAg
ICAgICAgICAgICAgICAgICAgaWYgKHNiaV92M19hdmFpbGFibGUpIHsKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICplY29uZmlnID0gY29uZmlnICYgUklTQ1ZfUE1VX1JBV19FVkVO
VF9WMl9NQVNLOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gUklTQ1Zf
UE1VX1JBV19FVkVOVF9WMl9JRFg7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICplY29uZmlnID0gY29uZmlnICYgUklT
Q1ZfUE1VX1JBV19FVkVOVF9NQVNLOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFg7Cj4+Cj4+IFNob3VsZG4ndCB3ZSBjaGVjayB0
byBzZWUgaWYgYW55IG9mIGJpdHMgNDgtNTUgYXJlIHNldCBhbmQgcmV0dXJuIGFuIGVycm9yLAo+
PiBpbnN0ZWFkIG9mIHNpbGVudGx5IHJlcXVlc3RpbmcgdGhlIHdyb25nIGV2ZW50Pwo+Pgo+IAo+
IFdlIGNhbi4gSSBkaWQgbm90IGFkZCBpdCBvcmlnaW5hbGx5IGFzIHdlIGNhbid0IGRvIG11Y2gg
dmFsaWRhdGlvbiBmb3IKPiB0aGUgcmF3IGV2ZW50cyBmb3IgYW55d2F5cy4KPiBJZiB0aGUgZW5j
b2RpbmcgaXMgbm90IHN1cHBvcnRlZCB0aGUgdXNlciB3aWxsIGdldCB0aGUgZXJyb3IgYW55d2F5
cwo+IGFzIGl0IGNhbid0IGZpbmQgYSBjb3VudGVyLgo+IFdlIHdpbGwganVzdCBzYXZlIDEgU0JJ
IGNhbGwgaWYgdGhlIGtlcm5lbCBkb2Vzbid0IGFsbG93IHJlcXVlc3RpbmcgYW4KPiBldmVudCBp
ZiBiaXRzIDQ4LTU1IGFyZSBzZXQuCgpUaGUgc2NlbmFyaW8gSSdtIGNvbmNlcm5lZCBhYm91dCBp
cyB3aGVyZSBtYXNraW5nIG9mZiBiaXRzIDQ4LTU1IHJlc3VsdHMgaW4gYQp2YWxpZCwgc3VwcG9y
dGVkIGVuY29kaW5nIGZvciBhIGRpZmZlcmVudCBldmVudC4gRm9yIGV4YW1wbGUsIGluIHRoZSBI
UE0gZXZlbnQKZW5jb2Rpbmcgc2NoZW1lIHVzZWQgYnkgUm9ja2V0IGFuZCBpbmhlcml0ZWQgYnkg
U2lGaXZlIGNvcmVzLCBiaXRzIDgtNTUgYXJlIGEKYml0bWFwLiBTbyBtYXNraW5nIG9mZiBzb21l
IG9mIHRob3NlIGJpdHMgd2lsbCBleGNsdWRlIHNvbWUgZXZlbnRzLCBidXQgd2lsbCBub3QKY3Jl
YXRlIGFuIGludmFsaWQgZW5jb2RpbmcuIFRoaXMgY291bGQgYmUgdmVyeSBjb25mdXNpbmcgZm9y
IHVzZXJzLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
