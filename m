Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD59CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iwNyECvUnmLj2SkFOdSIPrB3z8CYh/v9Txz32crGJI=; b=wRNGlqhKbekP7Z
	c6Zi3TzXy0l1kuMls9e8gQ1apDs5mF7op1xEYYwjpgCScxE7ZI3RxiOzxkrMYLHlsVmYkJum65qOX
	IsUmxSvDR7dMsk0zlPFbLbNoBfvdJN2L5MYfnteRDBtH7vKtWGsYt/hUu3d2ofxvgfAz09envihcW
	883Uao6OEyMHlL/DmrPO6PoruAPtlSJjNrPyvRj8hMUj3oOssOkOeRFDi1vbiWdxS2M9X60FyhpHu
	HxRDG7Hbiy7/sBbwPuGIH3eO4uEerGhdrU1xRCMyhpWr4AujZeof3glnJ9I6IM5H05t6CD1BhhNBs
	7z1vPJHDEspRcW2LYEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqxPk-001Gge-2m;
	Thu, 12 Oct 2023 15:15:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqxPh-001Gg3-1F
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 15:15:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so3546405e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697123747; x=1697728547; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H40DjF2DvqAhDOEevi599YrHU/CFw/Fi+zNNdBCogjA=;
        b=jDcKe0ygW1f7tjQ7nwOZaQgVe7kt0auzGieE74adph6twKOwOJnawZsW/93hWD0yqC
         /SbEkHsIHHXXn3QD4v69xDa4g3EII8G56uUBVaXOMQqtUHTXeJTgHXcJ+wdMl7gnMGPF
         jfTRpHgzAxnr/d5Jgj70zhnTmq/6SeYQTNTKdAJNe3WQfnZ992RaNayBdV76Vgk+4gDW
         nNXt9FQdeRlFLWkN7Xy+E/ZXP7biEVRpYiy228eBjqeXH5I1rHvq+Nijj5OE7Vma06lJ
         yMD+LfL7pB9BcfjrxCgaGrWFWDG2CpEwTljaWKomF4C69xRrCvVC3EmX2qEaNPyxTUNG
         hR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123747; x=1697728547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H40DjF2DvqAhDOEevi599YrHU/CFw/Fi+zNNdBCogjA=;
        b=PgJDGE3EWP8EBCt6EbIJuGHMcKEtTPc3H+s/5/iu21YXbssmvXHwWvBDplXtSPdv8+
         5/NJVQcqgfHMFblwTNPHcEn0FV61LvspucodUfxUi/Mm/KwaI3Dxj+BpsR38zqw/sR0b
         cINlrktEibjLVIvT99l2S+I8CewUp6NZav1jBfXGwK7kRJ0C0CuATjfdYAnr10+UegAU
         3Q2CILuvwWC1AfDg5Ye5bZglpVtPxIMLJKiQ7WxzMo9yCJwneiJVoWd8XAt55mK7WuzR
         jMmC/uN8vdPyic6hfbD+tcVr1AQFLFqbiTU5NzfkzNT1bo/IMbJs8H5IFZvMlohkF02h
         VlyQ==
X-Gm-Message-State: AOJu0YzHxYLQyXKWEjNu9qtm1STi2+rHDCUW0rqxEvmIPOfsnRGo9xPW
	yRztV7F5sqvi5xjc7qptrNm/Gg==
X-Google-Smtp-Source: AGHT+IGgtyD7d5JdTAOBgsfaVSkKTyr+ixUgoSAdL+LWzbJmc7NFj9h7df+UzeVb5v70tLe13yfemg==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr21976065wml.2.1697123746655;
        Thu, 12 Oct 2023 08:15:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b003fee6e170f9sm76694wml.45.2023.10.12.08.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:15:46 -0700 (PDT)
Message-ID: <7b71ff39-bbc0-4ba9-8b98-d36fa127316e@rivosinc.com>
Date: Thu, 12 Oct 2023 17:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/13] riscv: add ISA extension probing for Zv*
 extensions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-3-cleger@rivosinc.com>
 <b157edc4-a21f-40ac-8c9f-e989b34bb872@rivosinc.com>
 <20231012-darkness-neutron-fc1843ff05ff@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231012-darkness-neutron-fc1843ff05ff@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_081549_664546_F313723A 
X-CRM114-Status: GOOD (  32.95  )
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

CgpPbiAxMi8xMC8yMDIzIDE2OjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MTIsIDIwMjMgYXQgMDM6MTc6MTRQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMS8xMC8yMDIzIDEzOjE0LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+PiBBZGQg
cHJvYmluZyBvZiBzb21lIFp2KiBJU0EgZXh0ZW5zaW9ucyB0aGF0IGFyZSBtZW50aW9uZWQgaW4g
IlJJU0MtVgo+Pj4gQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJIiBbMV0uIFRoZXNl
IElTQSBleHRlbnNpb25zIGFyZSB0aGUKPj4+IGZvbGxvd2luZzoKPj4+Cj4+PiAtIFp2YmI6IFZl
Y3RvciBCYXNpYyBCaXQtbWFuaXB1bGF0aW9uCj4+PiAtIFp2YmM6IFZlY3RvciBDYXJyeWxlc3Mg
TXVsdGlwbGljYXRpb24KPj4+IC0gWnZrYjogVmVjdG9yIENyeXB0b2dyYXBoeSBCaXQtbWFuaXB1
bGF0aW9uCj4+PiAtIFp2a2c6IFZlY3RvciBHQ00vR01BQy4KPj4+IC0gWnZrbmVkOiBOSVNUIFN1
aXRlOiBWZWN0b3IgQUVTIEJsb2NrIENpcGhlcgo+Pj4gLSBadmtuaFthYl06IE5JU1QgU3VpdGU6
IFZlY3RvciBTSEEtMiBTZWN1cmUgSGFzaAo+Pj4gLSBadmtzZWQ6IFNoYW5nTWkgU3VpdGU6IFNN
NCBCbG9jayBDaXBoZXIKPj4+IC0gWnZrc2g6IFNoYW5nTWkgU3VpdGU6IFNNMyBTZWN1cmUgSGFz
aAo+Pj4gLSBadmtuOiBOSVNUIEFsZ29yaXRobSBTdWl0ZQo+Pj4gLSBadmtuYzogTklTVCBBbGdv
cml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlwbHkKPj4+IC0gWnZrbmc6IE5JU1QgQWxn
b3JpdGhtIFN1aXRlIHdpdGggR0NNLgo+Pj4gLSBadmtzOiBTaGFuZ01pIEFsZ29yaXRobSBTdWl0
ZQo+Pj4gLSBadmtzYzogU2hhbmdNaSBBbGdvcml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVs
dGlwbGljYXRpb24KPj4+IC0gWnZrc2c6IFNoYW5nTWkgQWxnb3JpdGhtIFN1aXRlIHdpdGggR0NN
Lgo+Pj4gLSBadmt0OiBWZWN0b3IgRGF0YS1JbmRlcGVuZGVudCBFeGVjdXRpb24gTGF0ZW5jeS4K
Pj4+Cj4+PiBbMV0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xZ2I5T0xILURoYkNn
V3A3VndwUE9WcnJZNmYzb1NKTEwvdmlldwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCB8IDE2ICsrKysrKysrKysrKysrKysKPj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgfCAxNiArKysrKysrKysrKysrKysrCj4+PiAgMiBmaWxlcyBjaGFu
Z2VkLCAzMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+Pj4gaW5k
ZXggYjdiNTgyNThmNmM3Li40ZTQ2OTgxYWM2YzggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaAo+Pj4gQEAgLTU4LDYgKzU4LDIyIEBACj4+PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJ
Q1NSCQk0MAo+Pj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUZFTkNFSQkJNDEKPj4+ICAjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWklIUE0JCTQyCj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pW
QkIJCTQzCj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWQkMJCTQ0Cj4+PiArI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWS0IJCTQ1Cj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS0cJCTQ2
Cj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS04JCTQ3Cj4+PiArI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pWS05DCQk0OAo+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktORUQJCTQ5Cj4+
PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS05HCQk1MAo+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aVktOSEEJCTUxCj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS05IQgkJNTIKPj4+
ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLUwkJNTMKPj4+ICsjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWlZLU0MJCTU0Cj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NFRAkJNTUKPj4+ICsj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0gJCTU2Cj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pWS1NHCQk1Nwo+Pgo+PiBBYm91dCBadmtzL1p2a24sIHRoZXNlIGV4dGVuc2lvbnMgYXJlIGFj
dHVhbGx5IHNob3J0aGFuZCBmb3IgYSBmZXcgb3RoZXIKPj4gc3ViLWV4dGVuc2lvbnMsIGl0IGlz
IHN0aWxsIG5vdCBjbGVhciBpZiBpdCBzaG91bGQgYmUgcGFyc2VkIGFzIGlzLgo+PiBUaGVyZSBh
cmUgbXVsdGlwbGUgc29sdXRpb25zOgo+Pgo+PiAtIEhhbmRsZSB0aGVtIGFzLWlzLCBzaW1wbHkg
ZW5hYmxlIHRoZSBleHRlbnNpb24sIGlmIHJlcG9ydGVkIHRocm91Z2gKPj4gaHdwcm9iZSwgdXNl
cnNwYWNlIHdpbGwgYmUgcmVzcG9uc2libGUgdG8gZGV0ZWN0IHRoZSBzdWItZXh0ZW5zaW9ucwo+
PiAoY3VycmVudCBhcHByb2FjaCkKPiAKPiBJIGRpc2xpa2UgdGhpcywgc2luY2UgaW4ta2VybmVs
IHVzZXJzIHdpbGwgaGF2ZSB0byBjaGVjayBmb3IgInBhcmVudCIgJgo+ICJjaGlsZCIgZXh0ZW5z
aW9ucy4KPiAKPj4gLSAiVW5mb2xkIiB0aGUgZXh0ZW5zaW9uIGluIG9yZGVyIHRvIGVuYWJsZSBh
bGwgdGhlIHN1Yi1leHRlbnNpb25zIGFuZAo+PiBrZWVwIHRoZSBtYWluIG9uZSAoZm9yIGluc3Rh
bmNlIGZvciBadmtuLCBlbmFibGUgWnZrbmVkLCBadmtuaGIsIFp2a2IsCj4+IFp2a3QsIFp2a24p
Cj4gCj4gV2UgdGhyZXcgdG9nZXRoZXIgc29tZSBjb2RlIGZvciB0aGlzIGEgZmV3IG1vbnRocyBh
Z28gYWZ0ZXIgc29tZQo+IGRpc2N1c3Npb24gd2l0aCBzb21lIG9mIHlvdXIgUml2b3MgY29sbGVh
Z3Vlcy4gVGhlIGluaXRpYWwgdmVyc2lvbiBvZiBpdAo+IHdhcyBpbiB0aGlzIHRocmVhZCB3aXRo
IEV2YW46Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzAzLW1hbmdsZS1wYW5u
aW5nLTc1OTA5ZWJiZTMwY0BzcHVkLwo+IGFuZCBpbiBhIGxhdGVyIGl0ZXJhdGlvbiB0aGVyZSB3
YXMgc29tZSBtb3JlIGRvbmUgYnkgbXlzZWxmIGFuZCBEcmV3Ogo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDcxMy1ib290bGVnLXRyYXktYzViZmU1OGI1NjczQHdlbmR5Lwo+IE9u
ZSBvZiB0aGUgdmVyc2lvbnMgZW5kZWQgdXAgYXMgdGhlIHJpc2N2LWV4dGVuc2lvbnMtc3RyaW5n
cy1zY2FsYXItY3J5cHRvCj4gYnJhbmNoIGluIG15IGsub3JnIHJlcG86Cj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY29ub3IvbGludXguZ2l0L2xvZy8/
aD1yaXNjdi1leHRlbnNpb25zLXN0cmluZ3Mtc2NhbGFyLWNyeXB0bwo+IAoKVGhhbmtzIGZvciB0
aGVzZSBpbmZvcm1hdGlvbiAhIEkgdGhpbmsgeW91ciB2ZXJzaW9uIHRvIGhhbmRsZSBleHRlbnNp
b24KZ3JvdXAgaXMgcHJldHR5IGNsZWFuLiBBcmUgeW91IHdhaXRpbmcgZm9yIGFueXRoaW5nIGlu
IHBhcnRpY3VsYXIgZXhjZXB0CmEgU2lnbmVkLW9mZjogZnJvbSBFdmFuIHRvIHN1Ym1pdCB0aGF0
IHBhdGNoID8gSWYgc28sIGNhbiBJIGJhY2twb3J0CnRoaXMgcGF0Y2ggaW4gbXkgYnJhbmNoLCBn
YXRoZXIgRXZhbiBTb0IgYW5kIHJlYmFzZSBteSBzZXJpZXMgb24gdG9wIG9mIGl0ID8KCj4gVGhh
dCBjcnlwdG8gc3R1ZmYgaGFzIGFsbCBnb25lIHF1aWV0IG9mIGxhdGUgdW5mb3J0dW5hdGVseS4g
SSB3b25kZXIgaWYKPiBTYW11ZWwgaXMgc3RpbGwgd29ya2luZyBvbiBpdC4KCkkgdGFsa2VkIHdp
dGggU2FtdWVsIGFuZCB3ZSBhZ3JlZWQgb24gdGhlIGZvbGxvd2luZyBwbGFuOiBJJ2xsIGFjdHVh
bGx5CmNhcnJ5IG9uIHRoZSBiaXRtYW5pcCBJU0EgcGFydCBhbmQgaGUgd2lsbCByZXN1Ym1pdCB0
aGUgWmtyIHdpdGgKYXJjaHJhbmRvbSBwYXJ0LgoKPiAKPj4gLSAiVW5mb2xkIiBidXQgZG9uJ3Qg
a2VlcCB0aGUgZXh0ZW5zaW9uICJzaG9ydGhhbmQiIGluIHRoZSBJU0EgZXh0ZW5zaW9uCj4+IGxp
c3QgKGZvciBpbnN0YW5jZSBmb3IgWnZrbiwgZW5hYmxlIFp2a25lZCwgWnZrbmhiLCBadmtiLCBa
dmt0KQo+IAo+IEJ1dCBJIHdvdWxkIGFsc28gYmUgZmluZSB3aXRoIHRoaXMgb25lIGZyb20gYSBw
dXJlIGluLWtlcm5lbCBQb1YuCgpXaGljaCBpcyB0aGUgY2FzZSB3aXRoIHlvdXIgdmVyc2lvbiBG
V0lVIChpZSwgb25seSB0aGUgY2hpbGQgZXh0ZW5zaW9ucwphcmUgdmlzaWJsZSkuCgo+IEkgdGhp
bmsgaXQncyBsaWtlbHkgdG8gYmUgYW5ub3lpbmcgZm9yIHVzZXJzIHRob3VnaCwgc2luY2UgdGhl
eSB3b24ndCBiZQo+IGFibGUgdG8gcG9sbCBmb3IgdGhlICJwYXJlbnQiIHVubGVzcyB3ZSByZS1h
c3NlbWJsZSB0aGUgcGFyZW50cyBpbgo+IGh3cHJvYmUgZXRjIChldWdoKS4KCkluZGVlZCwgYW5k
IHJlLWFzc2VtYmxpbmcgdGhlIHBhcmVudCBpcyBJTUhPIGR1cGxpY2F0aW9uIG9mIHRoZSBleGlz
dGluZwppbmZvcm1hdGlvbi4gQ2hlY2tpbmcgdGhhdCB0aGUgbmVlZGVkIElTQSBleHRlbnNpb25z
IGFyZSBwcmVzZW50IHdpbGwgYmUKc2ltcGxlIGVub3VnaCAoc2ltcGxlIGJpdG1hc2spIHNvIEkn
bSBub3Qgc3VyZSB0aGF0IHJlLWFzc2VtYmxpbmcgdGhlCnBhcmVudHMgaXMgbmVjZXNzYXJ5IChC
dXQgdGhhdCdzIGEgcGVyc29uYWwgc3RhdGVtZW50IGFuZCBJJ20gcHJldHR5CnN1cmUgb3RoZXJz
IHdpbGwgbGlrZSBpdCB0byBiZSBwcm92aWRlZCBkaXJlY3RseSkuCgpUaGFua3MsCgpDbMOpbWVu
dAoKPiAKPiAtIGRvbid0IHBlcm1pdCBwYXNzaW5nIHRoZSAicGFyZW50cyIgYXQgYWxsLCBhbmQg
b25seSBkZWFsIHdpdGggdGhlCj4gICAiY2hpbGRyZW4iLiBXZSBjYW4gZW5mb3JjZSB0aGlzIGZv
ciBEVCwgYnV0IG5vdCBmb3IgQUNQSSwgc28gcHJvYmFibHkKPiAgIG5vdCBhIHJ1bm5lcj4KPiBU
aGFua3MsCj4gQ29ub3IuCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4gQ2zDqW1lbnQKPj4KPj4+ICsj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLVAkJNTgKPj4+ICAKPj4+ICAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfTUFYCQk2NAo+Pj4gIAo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+Pj4gaW5kZXggMWNm
YmJhNjVkMTFhLi44NTlkNjQ3ZjNjZWQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
Pj4gQEAgLTE3NCw2ICsxNzQsMjIgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBy
aXNjdl9pc2FfZXh0W10gPSB7Cj4+PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1Zf
SVNBX0VYVF9aQkEpLAo+Pj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9F
WFRfWkJCKSwKPj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJzLCBSSVNDVl9JU0FfRVhUX1pC
UyksCj4+PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiks
Cj4+PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCj4+
PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiksCj4+PiAr
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2csIFJJU0NWX0lTQV9FWFRfWlZLRyksCj4+PiArCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp2a24sIFJJU0NWX0lTQV9FWFRfWlZLTiksCj4+PiArCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a25jLCBSSVNDVl9JU0FfRVhUX1pWS05DKSwKPj4+ICsJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZrbmVkLCBSSVNDVl9JU0FfRVhUX1pWS05FRCksCj4+PiArCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a25nLCBSSVNDVl9JU0FfRVhUX1pWS05HKSwKPj4+ICsJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZrbmhhLCBSSVNDVl9JU0FfRVhUX1pWS05IQSksCj4+PiArCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a25oYiwgUklTQ1ZfSVNBX0VYVF9aVktOSEIpLAo+Pj4gKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmtzLCBSSVNDVl9JU0FfRVhUX1pWS1MpLAo+Pj4gKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmtzYywgUklTQ1ZfSVNBX0VYVF9aVktTQyksCj4+PiArCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHp2a3NlZCwgUklTQ1ZfSVNBX0VYVF9aVktTRUQpLAo+Pj4gKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmtzaCwgUklTQ1ZfSVNBX0VYVF9aVktTSCksCj4+PiArCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHp2a3NnLCBSSVNDVl9JU0FfRVhUX1pWS1NHKSwKPj4+ICsJX19SSVNDVl9J
U0FfRVhUX0RBVEEoenZrdCwgUklTQ1ZfSVNBX0VYVF9aVktUKSwKPj4+ICAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAo+Pj4gIAlfX1JJU0NWX0lTQV9F
WFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCj4+PiAgCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
