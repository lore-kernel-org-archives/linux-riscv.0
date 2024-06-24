Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A0C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9YNaDN6r5AP0lV3eEezhnVta9lro8Q9Ipca9VBTcNQ=; b=nqOAQ0zRuhwhI6
	B4P0tsrz7s/Tfbi+JoKqfPElgxGIsYH2YbHjsOtHsmvX84DjOBKz/h9If0so9ty+OJsPgPxdz7R84
	wpUBLWX/Synra3QCQUwZxs14AdhV8W4Njqb5sFQUSrHCblKL7LC57wVU+BVcD2YbnAK40U3xutFgZ
	huOQuGXDm/rtcnA4O/st168Mhah6afRSPy7+2/0oU3ccSysEqLOeeEP4aH4kifOXhtugP3tv7/JO8
	sz0uOD53evzwg1UwEK1ZWrIsfl9ysOB4p1MEqwBXsQBJWsq+49CziT4R7ZDQX5Y7VV0z3/PsszMAj
	WlHN6u6488z7P6sSTVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLf0d-0000000G2Hc-2gZX;
	Mon, 24 Jun 2024 08:25:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLf0T-0000000G29l-103N
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 08:24:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42110872bf9so5091545e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719217495; x=1719822295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHo51wuTRWiZIUYTemkhy4Fril3hMcATqvGkIagVwG8=;
        b=fcxH9WQUW4MC83VHCWDxb/cqQD5ZxLoeQNfKtRt0mr7ThIrovlWpDXrvAYabZK/6Jl
         MUWwj65o1Co5ctZvfQc8zMbZwmr5RA+dJfeAYPzWKiPNRCSjd5zrncVFNdSyJQHqqwMT
         g12ODBGnfEfkxQp2dDpoRlaOcshuFLWKCLF4Om8HTo7TI0y8EQRduOI/az3BxiVHM4tD
         kA9NSCFeOA6DrLt/trxkH/CQga/9hbJWSXzbj3XA0e5qrj3j7kJJ96V/5/Z+5IGNKRgN
         1VPpdh37O0L+PlDRknmSRQFL/lL4rNekcd4CSEtIYOLL51OmHA46x+R0o6D/M/X0LZ0V
         ax8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217495; x=1719822295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHo51wuTRWiZIUYTemkhy4Fril3hMcATqvGkIagVwG8=;
        b=lAOtRYVms7UKsCeQQkB1tEdWUWvq/7MWxBc0JgCKnLWLp+D6izhOwQId4EiSD+d3b+
         ymTl+hD60i2vqa/ACW0/JDj9UtSu7nKZIMZbDmIe+hOp45TcAPk3pIm2pnZFPIVQxv4/
         fgVJmgYAxW2FLm2h8b8HviRN8Z5z/m+c7ArNvXYQ2cnAJ0rGq662iiJRy9PUj5mc/MOy
         ZgnwwgkXawFh7y89Ia1X9Ac1mZG4eizArBqJBRM95VgSqlvSD9k6/PabNLJxt+MTgVCC
         i6vJXNzXl8El0dHAU4njRFF3TTVyUDh44vzUlhZfxCkkXhbcD7KYF6eDbukQlpTWApHg
         Y1KA==
X-Forwarded-Encrypted: i=1; AJvYcCWSbeBXRqaikRdRwQ2x2lkKzdL7sE+hN2ILWIBdBf/F30/JXChJ05Vcj7Rl1CEf/EviKwIWcIopKXgICqb2Lh4ZHYLzxTC6eCk5eA1Wr3iI
X-Gm-Message-State: AOJu0Yz8O6rdsC1DPQQeas0vGIIe3gSV30jYMsQ5Pj6QjcjPjwXDmHgZ
	t/uo2twvrmcovjZc6R1i0DXsgdY2nY/FkGvfZFyQNmOfNRO3u0cY2F/aUc9YrGg=
X-Google-Smtp-Source: AGHT+IHaJqmXxJcpAch8t7UdkOLrlv66b+VvjpHMvaM58a6QzEHIYabq9XOGzMv9in4jtgUGn43mVw==
X-Received: by 2002:a05:600c:3b11:b0:424:8810:78b5 with SMTP id 5b1f17b1804b1-42488107bb0mr40633265e9.0.1719217494632;
        Mon, 24 Jun 2024 01:24:54 -0700 (PDT)
Received: from [192.168.61.172] ([37.166.182.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247101a955sm175619005e9.0.2024.06.24.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 01:24:54 -0700 (PDT)
Message-ID: <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
Date: Mon, 24 Jun 2024 10:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-9-cleger@rivosinc.com>
 <20240623-cornbread-preteen-4ec287aa165c@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240623-cornbread-preteen-4ec287aa165c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_012457_312757_772A70D0 
X-CRM114-Status: GOOD (  15.62  )
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

CgpPbiAyMy8wNi8yMDI0IDE3OjQyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBKdW4g
MTksIDIwMjQgYXQgMDE6MzU6MThQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGUgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbiBmb3IgY29kZSByZWR1Y3Rpb24gaW50cm9kdWNlcyBu
ZXcgZXh0ZW5zaW9ucy4KPj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFpjYSwgWmNmLCBa
Y2QgYW5kIFpjYi4gWmNlLCBaY210IGFuZCBaY21wCj4+IGFyZSBsZWZ0IG91dCBvZiB0aGlzIHBh
dGNoIHNpbmNlIHRoZXkgYXJlIHRhcmdldGluZyBtaWNyb2NvbnRyb2xsZXJzLwo+PiBlbWJlZGRl
ZCBDUFVzIGluc3RlYWQgb2YgYXBwbGljYXRpb24gcHJvY2Vzc29ycy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gLS0tCj4+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAgNCArKysKPj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oCj4+IGluZGV4IDE4ODU5Mjc3ODQzYS4uYjEyYWUzZjIxNDFj
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4+IEBAIC04Nyw2ICs4NywxMCBAQAo+PiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RgkJNzgKPj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aVkU2NEQJCTc5Cj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklNT1AJCTgwCj4+ICsjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkNBCQk4MQo+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDQgkJ
ODIKPj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTgzCj4+ICsjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWkNGCQk4NAo+PiAgCj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZH
CTEyNwo+PiAgCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gaW5kZXggYTNhZjk3NmYzNmM5Li5h
YTYzMWZlNDliN2MgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gQEAgLTExMSw2ICsx
MTEsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0
IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPj4gIAo+PiAgI2RlZmluZSBfX1JJU0NWX0lTQV9F
WFRfREFUQShfbmFtZSwgX2lkKSBfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIE5VTEws
IDAsIE5VTEwpCj4+ICAKPj4gKyNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUo
X25hbWUsIF9pZCwgX3ZhbGlkYXRlKSBcCj4+ICsJCQlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1l
LCBfaWQsIE5VTEwsIDAsIF92YWxpZGF0ZSkKPj4gKwo+PiAgLyogVXNlZCB0byBkZWNsYXJlIHB1
cmUgImxhc3NvIiBleHRlbnNpb24gKFprIGZvciBpbnN0YW5jZSkgKi8KPj4gICNkZWZpbmUgX19S
SVNDVl9JU0FfRVhUX0JVTkRMRShfbmFtZSwgX2J1bmRsZWRfZXh0cykgXAo+PiAgCV9SSVNDVl9J
U0FfRVhUX0RBVEEoX25hbWUsIFJJU0NWX0lTQV9FWFRfSU5WQUxJRCwgX2J1bmRsZWRfZXh0cywg
XAo+PiBAQCAtMTIyLDYgKzEyNSwzNyBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFs
aWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPj4gICNkZWZpbmUg
X19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUX1ZBTElEQVRFKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywg
X3ZhbGlkYXRlKSBcCj4+ICAJX1JJU0NWX0lTQV9FWFRfREFUQShfbmFtZSwgX2lkLCBfc3ViX2V4
dHMsIEFSUkFZX1NJWkUoX3N1Yl9leHRzKSwgX3ZhbGlkYXRlKQo+PiAgCj4+ICtzdGF0aWMgaW50
IHJpc2N2X2V4dF96Y2FfZGVwZW5kcyhjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpk
YXRhLAo+IAo+IEl0J3Mgc3VwZXIgbWlub3IsIGJ1dCBteSBPQ0QgZG9lc24ndCBsaWtlIHRoaXMg
YmVpbmcgY2FsbGVkICJkZXBlbmRzIgo+IHdoZW4gdGhlIG90aGVycyBhcmUgYWxsIGNhbGxlZCAi
dmFsaWRhdGUiLgoKT2ssIGxldCdzIG1ha2UgYSBkZWFsLiBZb3UgcmV2aWV3IHBhdGNoIDE0LzE2
IGFuZCBJJ2xsIG1ha2UgdGhlIG1hY2hpbmUKcGFydCBvZiB5b3UgaGFwcHkgYW5kIGNhbGwgdGhp
cyBmdW5jdGlvbiB2YWxpZGF0ZSA7KQoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsJCQkJIGNv
bnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4+ICt7Cj4+ICsJaWYgKF9fcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9aQ0EpKQo+PiAr
CQlyZXR1cm4gMDsKPj4gKwo+PiArCXJldHVybiAtRVBST0JFX0RFRkVSOwo+PiArfQo+PiArc3Rh
dGljIGludCByaXNjdl9leHRfemNkX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0
X2RhdGEgKmRhdGEsCj4+ICsJCQkJICBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+
PiArewo+PiArCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAs
IFJJU0NWX0lTQV9FWFRfWkNBKSAmJgo+PiArCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZh
aWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfZCkpCj4+ICsJCXJldHVybiAwOwo+PiAr
Cj4+ICsJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgcmlz
Y3ZfZXh0X3pjZl92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRh
LAo+PiArCQkJCSAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPj4gK3sKPj4gKwlp
ZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+
PiArCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NW
X0lTQV9FWFRfWkNBKSAmJgo+PiArCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxl
KGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfZikpCj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJ
cmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+ICt9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
