Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A19E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2rX2YVW3rm/aOhq+uh+qPnSRFPO0UKVH14DWmsRdiE=; b=MOaYsQSbg9+AXT
	LuJEaGlhziGk2tLv8PKPCq+6foyQoQhTuxIeUq+hb8eV6Z0fqysq2x7k6G3Yqhy+C9qpIY5IeX6UV
	IANKDX4sZTZOLNMW69vx0SJvA3IiaNGuo1gEMzTTgB8ljVwj0r56FXQHwjQvSm525R70EzcSXUczY
	qxtIJ295QPOkH8ZxmBrpA0sDvHSpwADxwEsO6GWWCtmSntSVCujhYW/Ttno3SLmYo8zpxcgTQ5Sne
	DMJrKeUji7tg9At/AaLvOpIW5EjKjTddenOvNan7zlWOrfHCH7xvrCWfC76LAcPVrSSqkk7viCRVl
	xGp+kVBB2x+r+0NjuJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLU1Y-0000000G93S-0dcf;
	Wed, 11 Dec 2024 21:13:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTyN-0000000G8Uk-185R
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 21:10:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725ee27e905so4130310b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 13:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733951418; x=1734556218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUJ6E1dccY/UenqZ3HoN/Mh8eiUDPyCKSbZAwA4cbhs=;
        b=vVL6A76WXksh3SZZlT5zWlA2QjhfP7JT/b8vmiCVnFx0BDl/KEgUA4bWkCBUxXtvyK
         QcKZ7JTBlmtg1CktZt2mcvEvjGzNYIQlI8a/lI7cKtDH+LUmiFPExaLQhY6RLo26Cpx4
         Tc/TWM9q/8c8gIQde3dHRP0Q0ayW6oaZ2Z8jFUxXqiWQxpPm7VVKXEu9jel/dFebE3ve
         JjN+VLUEAIc8GG3C9k+adJEjMJ7n1vrIYwzSc2maZlwhwIEsdv4nHN+JGXmMP3orbc/Z
         orgMRQCrj1oapS/GEtBlqP39T2If07v2+D/Z7GY5iwxdw3ZZTriOIvv6c8Ttp1XNZlyf
         Ns4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733951418; x=1734556218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUJ6E1dccY/UenqZ3HoN/Mh8eiUDPyCKSbZAwA4cbhs=;
        b=ta1CPlZOo5wiAZzh0PVkZu00Wf7VUYtM6KnyFK3ZA+E87J6ubxGI9axbEKTchhwfpO
         DP07ed/cZZsG0gA8MABy+wACckXzsCjJ4P4ZPn0gscmMUEHE61WD/dN2N+ko81kjlP3z
         AhotWKBaIUNSLWmVqEX2mLtHPmn4zdmPC7mB+IkDTF0mEPZcdXSSlr4JFb5BJMsn3OJv
         HjLpNfnedQdXzjSTSSoqeOHLBaXYBr2q0dwu/tcQrf1Q7tKbUBFP492DB3P8+V/Jg5Qz
         Y81IdTqcSrfN+hIxG3MPPaGTWmhYVUoHX2o6Zumw3hZCJYd39NAmjFfDybFx2xPNNHeN
         m02A==
X-Forwarded-Encrypted: i=1; AJvYcCWf4c3cnONQ95JG3Xxjn3OzRY74w2OqNPTATdPzthBS3DiQGgFctLhMiTjQ/l1stqC1hoAMTidhvLu9Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4bH1FfRmy72zDXn+O1JeJvFgAur5pkwymoKD0QzaAXxe/KuyR
	5O1yiH9Nqp0KORhFRwidj8ihXhOikPkMnsT2zJfCKeXM7iPl0E/03nJTpc1Byi4Rnec9XsGI0ki
	SKCiGIcpCBLvglIPewC6LWbq7hy5KmUTg4s+r+g==
X-Gm-Gg: ASbGncu+sTyF6i9dkSrB14E1e0iG+u80sd7qcMuZ1wEoZCHt4KaR2TZjH4d/LxVGbFp
	Wr2Ug8KwfUWgJGzkO+1PFxYDRsGAbQ7mLPA==
X-Google-Smtp-Source: AGHT+IGbytb2z6LDDkYKhPGNyqyAm3jA1eJq1+JKml7I0nFmrZCCwIKb2tSKtD6WnDFHkiV+jENJ+KJKRSAidtP2wIY=
X-Received: by 2002:a05:6a00:a8f:b0:728:ecab:521c with SMTP id
 d2e1a72fcca58-728faa19073mr995943b3a.6.1733951417743; Wed, 11 Dec 2024
 13:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20241209-pmu_event_fixes-v1-2-d9525e90072c@rivosinc.com> <mhng-1c6ec679-02bc-4aa3-9b23-bb4c5f5f9b81@palmer-ri-x1c9a>
In-Reply-To: <mhng-1c6ec679-02bc-4aa3-9b23-bb4c5f5f9b81@palmer-ri-x1c9a>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 11 Dec 2024 13:10:07 -0800
Message-ID: <CAHBxVyF445KnZfT9rPhTwKA76_GT0eT3+p=ot1oLQzUb7j7d7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/perf: riscv: Do not allow invalid raw event config
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, anup@brainfault.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mchitale@ventanamicro.com, 
	samuel.holland@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_131019_575825_9FB3C3E2 
X-CRM114-Status: GOOD (  29.16  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6NDbigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMDkgRGVjIDIwMjQgMTY6MDQ6NDYgUFNU
ICgtMDgwMCksIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gVGhlIFNCSSBzcGVjaWZpY2F0aW9uIGFs
bG93cyBvbmx5IGxvd2VyIDQ4Yml0cyBvZiBocG1ldmVudFggdG8gYmUKPiA+IGNvbmZpZ3VyZWQg
dmlhIFNCSSBQTVUuIEN1cnJlbnRseSwgdGhlIGRyaXZlciBtYXNrcyBvZiB0aGUgaGlnaGVyCj4g
PiBiaXRzIGJ1dCBkb2Vzbid0IHJldHVybiBhbiBlcnJvci4gVGhpcyB3aWxsIGxlYWQgdG8gYW4g
YWRkaXRpb25hbAo+ID4gU0JJIGNhbGwgZm9yIGNvbmZpZyBtYXRjaGluZyB3aGljaCBzaG91bGQg
cmV0dXJuIGZvciBhbiBpbnZhbGlkCj4gPiBldmVudCBlcnJvciBpbiBtb3N0IG9mIHRoZSBjYXNl
cy4KPiA+Cj4gPiBIb3dldmVyLCBpZiBhIHBsYXRmb3JtKGkuZSBSb2NrZXQgYW5kIHNpZml2ZSBj
b3JlcykgaW1wbGVtZW50cyBhCj4gPiBiaXRtYXAgb2YgYWxsIGJpdHMgaW4gdGhlIGV2ZW50IGVu
Y29kaW5nIHRoaXMgd2lsbCBsZWFkIHRvIGFuCj4gPiBpbmNvcnJlY3QgZXZlbnQgYmVpbmcgcHJv
Z3JhbW1lZCBsZWFkaW5nIHRvIHVzZXIgY29uZnVzaW9uLgo+ID4KPiA+IFJlcG9ydCB0aGUgZXJy
b3IgdG8gdGhlIHVzZXIgaWYgaGlnaGVyIGJpdHMgYXJlIHNldCBkdXJpbmcgdGhlCj4gPiBldmVu
dCBtYXBwaW5nIGl0c2VsZiB0byBhdm9pZCB0aGUgY29uZnVzaW9uIGFuZCBzYXZlIGFuIGFkZGl0
aW9uYWwKPiA+IFNCSSBjYWxsLgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRy
YSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4IDM0
NzNiYTAyYWJmMy4uZmI2ZWRhOTBmNzcxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4g
QEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZXZlbnRfbWFwKHN0cnVjdCBw
ZXJmX2V2ZW50ICpldmVudCwgdTY0ICplY29uZmlnKQo+ID4gIHsKPiA+ICAgICAgIHUzMiB0eXBl
ID0gZXZlbnQtPmF0dHIudHlwZTsKPiA+ICAgICAgIHU2NCBjb25maWcgPSBldmVudC0+YXR0ci5j
b25maWc7Cj4gPiAtICAgICBpbnQgcmV0Owo+ID4gKyAgICAgaW50IHJldCA9IC1FTk9FTlQ7Cj4g
Pgo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIEVuc3VyZSB3ZSBhcmUgZmluaXNoZWQgY2hlY2tp
bmcgc3RhbmRhcmQgaGFyZHdhcmUgZXZlbnRzIGZvcgo+ID4gQEAgLTUzNiw4ICs1MzYsMTEgQEAg
c3RhdGljIGludCBwbXVfc2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2
NCAqZWNvbmZpZykKPiA+Cj4gPiAgICAgICAgICAgICAgIHN3aXRjaCAoY29uZmlnID4+IDYyKSB7
Cj4gPiAgICAgICAgICAgICAgIGNhc2UgMDoKPiA+IC0gICAgICAgICAgICAgICAgICAgICByZXQg
PSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAqZWNv
bmZpZyA9IGNvbmZpZyAmIFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSzsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAvKiBSZXR1cm4gZXJyb3IgYW55IGJpdHMgWzQ4LTYzXSBpcyBzZXQgIGFzIGl0
IGlzIG5vdCBhbGxvd2VkIGJ5IHRoZSBzcGVjICovCj4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKCEoY29uZmlnICYgflJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSykpIHsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICplY29uZmlnID0gY29uZmlnICYgUklTQ1ZfUE1VX1JBV19F
VkVOVF9NQVNLOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gUklTQ1Zf
UE1VX1JBV19FVkVOVF9JRFg7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAgICBjYXNlIDI6Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gKGNvbmZpZyAmIDB4RkZGRikgfCAoU0JJX1BNVV9FVkVO
VF9UWVBFX0ZXIDw8IDE2KTsKPiA+IEBAIC01NTQsNyArNTU3LDYgQEAgc3RhdGljIGludCBwbXVf
c2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCAqZWNvbmZpZykKPiA+
ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgIGRlZmF1
bHQ6Cj4gPiAtICAgICAgICAgICAgIHJldCA9IC1FTk9FTlQ7Cj4gPiAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gICAgICAgfQo+Cj4gVGhpcyBkb2Vzbid0IGhhdmUgYSBGaXhlcywgaXMgaXQKPgo+
ICAgICBGaXhlczogZjBjOTM2M2RiMmRkICgicGVyZi9yaXNjdi1zYmk6IEFkZCBwbGF0Zm9ybSBz
cGVjaWZpYyBmaXJtd2FyZSBldmVudCBoYW5kbGluZyIpCj4KCkkgd2FzIG5vdCBzdXJlIGlmIGEg
Rml4ZXMgdGFnIHdhcyB3b3J0aCBpdCBhcyB0aGUgY3VycmVudApiZWhhdmlvcihtYXNraW5nIG9m
ZiB0aGUgaGlnaGVyIGJpdHMpIGlzIHRoZXJlIGZyb20gdGhlIGJlZ2lubmluZyBvZgp0aGUgZHJp
dmVyLgpwZXJmIHRvb2wgdGhyb3dzIGEgd2FybmluZyBhcyB3ZWxsIGlmIGEgdXNlciB0cmllcyB0
byBzZXQgYW55IG9mIHRoZQp1cHBlciAxNiBiaXRzIGFzIGV2ZW50IGF0dHJpYnV0ZXMgaXMgc2V0
IHRvIDAtNDcuCgpJZiBpdCBzaG91bGQgYmUgYmFja3BvcnRlZCwgdGhpcyBpcyB0aGUgY29ycmVj
dCBmaXhlcyB0YWcuCkZpeGVzOiBlOTk5MTQzNDU5NmYgKCJSSVNDLVY6IEFkZCBwZXJmIHBsYXRm
b3JtIGRyaXZlciBiYXNlZCBvbiBTQkkKUE1VIGV4dGVuc2lvbiIpCgoKPiA/CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
