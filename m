Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C4CC83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8w/48YDQEhg05IGMUQgoF5Ts2oyOK/T/HtN7DLjvew0=; b=mQdIxTaXg0f8gb
	Vsq0Vxe6QoUgpqwiHvLTNgxmcJ3muLKnfGgJiIt+mQgmRrgcGIgqwyyD71do3iz/Q2jaqYNr65/K5
	3zfvg5qpx8zZZ5r6wmSMJ0YFEmd2PQ1MszA5arAGYw+EG7Sox6lVKWH/zIDxEQz9ww+z67ht7m50h
	5DO6QU3t6PUfq7m9yF8gHQbt6G183a4XiRCAx+yvbdScoEk/GNE8O5uTMO5oVnTapfmtLXh46h5BU
	mkm0UvkEBKjOUBj78aEtc7BIxORuv+4aIFfFkUqrckbs/7rTyCdeJs+3SZ8pUTWWtMBfPqqV6zz+3
	08kfi9O6L8WZPxwB79DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQvr-0000000AY1t-0hWU;
	Thu, 17 Jul 2025 15:54:03 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQMJ-0000000AUbn-3Ojp
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:17:20 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e32c95775aso102556085a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765439; x=1753370239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=y8j+V2JPRLq5DN9EM0JXfolPVulIMPfggjRtrcYqM8NMiVLXTtzNMyAYSEB/GQ/biz
         yYd/JdE81TP5XNj4Booa+6k1SiRI5tcSqGk+TawLZNeqMtRYuiXzMb62oVNg/QlQZJtO
         5zgHIi4umO6qBKmEgGUL6xY8/HtxAfe2w1jiE6aNOWXKuUJENik2wYtZ2w6C3DVc3/hY
         YAywYvdLUeUd5a0CttmmLHqVyk3jyRAMV11psd+hEI4gcyndG7FwEkYN2X6n1z7fOSbM
         WNSEta7I0tfj9zYb7/0VxKl3MQgxdbCdb/aJWj4Jz70s8Oyxc84dt9S/WFQyqle4L/9v
         dOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765439; x=1753370239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=TXMSZjDGJ6oRtji5dkTjnz8BWjjCj6D993yuOsFoR9w6V67IQU90DqrM72wJQmDlTU
         XOHfRMpoJ8At9Jl0zJm2AdfrNGB72rrnr3BeTJTo7EeC3IfnCxJIoooF5sGf5UcXVb8M
         m7mkTHkYPAU/6ZESMqDGKZ25dXKA/0vJI5JYagB6zGAOi3bRV4Z+t2SO7XmVYVV0+gYK
         /lNm0ReWlvSRHKe7DuzbyzRb1KzFytLHRUBXavljpA/CKCaDKN2QY+SmwyV/5FAN1tau
         8nBLa3BYSQOzo6wviW8d4vXt8SkbQV1Y5tnI4xmwQqNSylWrS9wIgQHCR3sn6ncBW5Vt
         GvGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9+6IyvGrSuEgrLQZ104pbWXBClKCuiFqC/VReK/7gUzIeJRa5i/zm4Ntzh4y64hXZpdX/v4BII2cgvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwf/JQF0qukuqIllXydML3KPTh5WcsmYW3lHTYLDlJZ9WMCxrx
	Igl7BcdNOiKXzIKNd2HrTAXn9DCdO/C3tPDgugKAxKELWoDeR2xIAitgwwoj4LCas4elzEoVcbg
	hIvgRrHl1tMGthRuYpaC4GP/o++ZDcbuSTwctJOzn8HP2Y1VmOA6Bp9g=
X-Gm-Gg: ASbGncswo4oUI5arFo0QwY/TP7BH/1YFtwC/sreikGkU/aTk5Q/6PPn4tiPUOG1BgUV
	PllNb3aNmIonS4+LjacbV0X4LzjuRM/BQFWt0UaxKtwbcMi63nhISRPEapeti80qXp70mAwETlu
	Vx2drtL+dHI7SmSU8C6Oyrsums1IvvGPPwYJr7fSX+TFR5Ayptb1cdlAdSLEzuivn34BcYQJouj
	muevb96
X-Google-Smtp-Source: AGHT+IHz2ooSEYMwChi5WNQfJsDufDgq6WJG7AmXKC3wtaW/L8MYe8nihHSBFgq+2TYbHnsMVgzMJk9i+88DE/6bDYA=
X-Received: by 2002:a05:620a:7017:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7e343615e30mr946456785a.40.1752765438473; Thu, 17 Jul 2025
 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:47:06 +0530
X-Gm-Features: Ac12FXzD0efP_qu0iiVx1ulFC3dW-BDJaKPty1r8E1h77LH8P4Y_H1glg7EyAyo
Message-ID: <CAAhSdy02kKJ0PHjyeGaV1-pC3DVL8-VcQ=EB+ha69=_CAQb2xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081719_847935_AE5957A3 
X-CRM114-Status: GOOD (  22.57  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQkkgdjMuMCBpbnRyb2R1Y2VkIGEgbmV3IHJhdyBldmVu
dCB0eXBlIHRoYXQgYWxsb3dzIHdpZGVyCj4gbWhwbWV2ZW50WCB3aWR0aCB0byBiZSBwcm9ncmFt
bWVkIHZpYSBDRkdfTUFUQ0guCj4KPiBVc2UgdGhlIHJhdyBldmVudCB2MiBpZiBTQkkgdjMuMCBp
cyBhdmFpbGFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8ICA0ICsrKysK
PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDE2ICsrKysrKysrKysrKy0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oCj4gaW5kZXggM2QyNTA4MjQxNzhiLi42Y2UzODVhM2E3YmIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKPiBAQCAtMTYwLDcgKzE2MCwxMCBAQCBzdHJ1Y3QgcmlzY3ZfcG11X3Nu
YXBzaG90X2RhdGEgewo+Cj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLIEdFTk1B
U0tfVUxMKDQ3LCAwKQo+ICAjZGVmaW5lIFJJU0NWX1BNVV9QTEFUX0ZXX0VWRU5UX01BU0sgR0VO
TUFTS19VTEwoNjEsIDApCj4gKy8qIFNCSSB2My4wIGFsbG93cyBleHRlbmRlZCBocG1ldmVudFgg
d2lkdGggdmFsdWUgKi8KPiArI2RlZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX01BU0sgR0VO
TUFTS19VTEwoNTUsIDApCj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFggMHgyMDAw
MAo+ICsjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfSURYIDB4MzAwMDAKPiAgI2RlZmlu
ZSBSSVNDVl9QTEFUX0ZXX0VWRU5UICAgIDB4RkZGRgo+Cj4gIC8qKiBHZW5lcmFsIHBtdSBldmVu
dCBjb2RlcyBzcGVjaWZpZWQgaW4gU0JJIFBNVSBleHRlbnNpb24gKi8KPiBAQCAtMjE4LDYgKzIy
MSw3IEBAIGVudW0gc2JpX3BtdV9ldmVudF90eXBlIHsKPiAgICAgICAgIFNCSV9QTVVfRVZFTlRf
VFlQRV9IVyA9IDB4MCwKPiAgICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9DQUNIRSA9IDB4MSwK
PiAgICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9SQVcgPSAweDIsCj4gKyAgICAgICBTQklfUE1V
X0VWRU5UX1RZUEVfUkFXX1YyID0gMHgzLAo+ICAgICAgICAgU0JJX1BNVV9FVkVOVF9UWVBFX0ZX
ID0gMHhmLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gaW5kZXggY2ZkNjk0NmZjYTQyLi4y
NzNlZDcwMDk4YTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBAQCAtNTksNyArNTksNyBAQCBh
c20gdm9sYXRpbGUoQUxURVJOQVRJVkUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAjZGVmaW5lIFBFUkZfRVZFTlRfRkxBR19VU0VSX0FDQ0VTUyAgICBC
SVQoU1lTQ1RMX1VTRVJfQUNDRVNTKQo+ICAjZGVmaW5lIFBFUkZfRVZFTlRfRkxBR19MRUdBQ1kg
ICAgICAgICBCSVQoU1lTQ1RMX0xFR0FDWSkKPgo+IC1QTVVfRk9STUFUX0FUVFIoZXZlbnQsICJj
b25maWc6MC00NyIpOwo+ICtQTVVfRk9STUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC01NSIpOwo+
ICBQTVVfRk9STUFUX0FUVFIoZmlybXdhcmUsICJjb25maWc6NjItNjMiKTsKPgo+ICBzdGF0aWMg
Ym9vbCBzYmlfdjJfYXZhaWxhYmxlOwo+IEBAIC01MjcsOCArNTI3LDEwIEBAIHN0YXRpYyBpbnQg
cG11X3NiaV9ldmVudF9tYXAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcp
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBQRVJGX1RZUEVfUkFXOgo+
ICAgICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBBcyBwZXIgU0JJIHNwZWNp
ZmljYXRpb24sIHRoZSB1cHBlciAxNiBiaXRzIG11c3QgYmUgdW51c2VkCj4gLSAgICAgICAgICAg
ICAgICAqIGZvciBhIGhhcmR3YXJlIHJhdyBldmVudC4KPiArICAgICAgICAgICAgICAgICogQXMg
cGVyIFNCSSB2MC4zIHNwZWNpZmljYXRpb24sCj4gKyAgICAgICAgICAgICAgICAqICAtLSB0aGUg
dXBwZXIgMTYgYml0cyBtdXN0IGJlIHVudXNlZCBmb3IgYSBoYXJkd2FyZSByYXcgZXZlbnQuCj4g
KyAgICAgICAgICAgICAgICAqIEFzIHBlciBTQkkgdjMuMCBzcGVjaWZpY2F0aW9uLAoKVGhlIHRl
eHQgaGVyZSBzaG91bGQgYmUgIkFzLXBlciBTQkkgdjIuMCAuLi4iCgo+ICsgICAgICAgICAgICAg
ICAgKiAgLS0gdGhlIHVwcGVyIDggYml0cyBtdXN0IGJlIHVudXNlZCBmb3IgYSBoYXJkd2FyZSBy
YXcgZXZlbnQuCj4gICAgICAgICAgICAgICAgICAqIEJpdHMgNjM6NjIgYXJlIHVzZWQgdG8gZGlz
dGluZ3Vpc2ggYmV0d2VlbiByYXcgZXZlbnRzCj4gICAgICAgICAgICAgICAgICAqIDAwIC0gSGFy
ZHdhcmUgcmF3IGV2ZW50Cj4gICAgICAgICAgICAgICAgICAqIDEwIC0gU0JJIGZpcm13YXJlIGV2
ZW50cwo+IEBAIC01MzcsOCArNTM5LDE0IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9ldmVudF9tYXAo
c3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcpCj4KPiAgICAgICAgICAgICAg
ICAgc3dpdGNoIChjb25maWcgPj4gNjIpIHsKPiAgICAgICAgICAgICAgICAgY2FzZSAwOgo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChzYmlfdjNfYXZhaWxhYmxlKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyogUmV0dXJuIGVycm9yIGFueSBiaXRzIFs1Ni02M10gaXMgc2V0ICBh
cyBpdCBpcyBub3QgYWxsb3dlZCBieSB0aGUgc3BlYyAqLwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCEoY29uZmlnICYgflJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfTUFTSykp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBj
b25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX01BU0s7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfSURYOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIFJldHVybiBlcnJvciBhbnkgYml0cyBbNDgtNjNdIGlzIHNldCAgYXMgaXQgaXMgbm90
IGFsbG93ZWQgYnkgdGhlIHNwZWMgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAoIShj
b25maWcgJiB+UklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLKSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIH0gZWxzZSBpZiAoIShjb25maWcgJiB+UklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLKSkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBjb25maWcgJiBS
SVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
