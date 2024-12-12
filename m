Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DA9E77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKy07BXJUziB4yr1tfvaTqymZ8Pn08ciKLYPSUwiHqQ=; b=opdfsll6RISVPH
	vec54Z4qoDi7BPE2GlRHUXQwXO4IKjm010NaV6Ly1qXWv79DVmrT1mqYIgZsOZ/H9rfU0ID3LdqS8
	iKrp0+fgarIL2Gwj9YyGB1m+Cig0ntiC4rJrjc1Gk0FOALFFSb+ocN/g9qhpugIHGvC8UoqCJhc3Z
	jRfhM6BRJS0OJyp0tv2NTUtwgwRi9g3TolZsJXv6/Ebuzd3BtdTXXWRZdsYdhgf5li9j7X3dZ6Wz3
	DDzB9uClc8CbhXbTEkJn7M8kcdxNVvIY7t1l7ZWlPv3+LSure6Y/ZKSQ4KhzxVUynXVIhnz/bI034
	UQeo0F5Z4VozRuADgwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLowU-00000001f9S-0KiC;
	Thu, 12 Dec 2024 19:33:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLopK-00000001dKK-16Su
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 19:26:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-725dac69699so910010b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 11:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734031581; x=1734636381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPnFUIi4L999NoGrpXMp4CZPau9DfuDv5KGY4m1VIsY=;
        b=qOWeGASFW7t49LDlhciYxaTFhD5GxbHHSKvPE0wPrF8j4/X1QyDK6wQjkXlm9QhZcB
         KqGFSqkPKy/Kg5tY/TMekb4ueOv+qKpVAe/B096dD7jjjf2xGlNl8b0EsXZ/UROntv4V
         NOAe8CHLMBlPI96EpOZWMGou/e/6x0l000B1l4HaVetGl4lXzgGS5FvXU9GFqjEbqWyM
         0ltt8jJ7YoHe5xzktpY8QRfTRILV3NaeJY/k2jXX6GGRGvVItvnBCVUYXOoSB5wcRxbK
         P0j1BcjOXHatoG3ltjoa3h+e2nWviKU3W3/0wNiDbXBwZV+UHgHMuPWDGp9p//YGuMYm
         kBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734031581; x=1734636381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPnFUIi4L999NoGrpXMp4CZPau9DfuDv5KGY4m1VIsY=;
        b=U/j5YB6TBRZwaoySKgzRgQmOjI2UQ6IiHRMfk95BkQVOVp9TUjo9cjvdyAvBWMmWZm
         18HusN5XLu3NQ66Hg9ExYtLKPt2VUEKcEgCP1yy6EPCQ98rahiK8sbFfvHkQS458cgnA
         lEeSmPTAVtcux/v7pU/BWmfr13bGNPHlT/x3tamiUaBfgJFWTkER8eLaL3aEhtbDAskP
         qhGEFC4ZirgHsRNs+EV0547byCya+/ucwoj5FoyuRs7PxFkucnHe9vHyTYy+Xz+BwD6A
         E3FZixkMOWTfyR3GFpdw60nTeK4vrermgVzjNGCfmdwmC1MZuvNLc0IhCdxIdWO62Vv3
         d5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMHodzF9r3/hCLEZKS0jJtoqFYBRYjOmN+3FnafjrZdKuVY4sxhphG7z4ZPDxwyA18Swh0toKgPUjv6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNvdZYBWPCvFQ6HgqodAYixHAi42hyy4M0Lh+Hii/iusvLyoKh
	Xct62orhx1bc1uMECu+OA6iL+JEstCAyq+S2rY4wS8kNFykXWvlLI9gR/zIx3qOrTVL7scNxXxs
	Vm4RBYSqnZFiDBL4mOxzCZQti+0rTHzV6mB6IaQ==
X-Gm-Gg: ASbGncsw3T4CyZIhQpFSFDLrOGpunMjHdc5My1/SYXfK53d56PXLraP6qI8lfAZPEcN
	N87f+NPS72E3rND+feWxM2glVNEAUJhwnEo0l
X-Google-Smtp-Source: AGHT+IEPwEWxyWAwEFjkiB40b7qB8uzvBeDQL6zpw5H+2169/UHZLb2L1T7jmdC2c1bF2UThDUzl7odEvBTht3Xeaik=
X-Received: by 2002:a05:6a00:9295:b0:725:30f3:67d8 with SMTP id
 d2e1a72fcca58-7290681d9c5mr1768378b3a.0.1734031581162; Thu, 12 Dec 2024
 11:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20241209-pmu_event_fixes-v1-2-d9525e90072c@rivosinc.com>
 <mhng-1c6ec679-02bc-4aa3-9b23-bb4c5f5f9b81@palmer-ri-x1c9a>
 <CAHBxVyF445KnZfT9rPhTwKA76_GT0eT3+p=ot1oLQzUb7j7d7w@mail.gmail.com> <c094ae0b-ddf0-42fc-ad47-00fad84fb70d@sifive.com>
In-Reply-To: <c094ae0b-ddf0-42fc-ad47-00fad84fb70d@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 11:26:10 -0800
Message-ID: <CAHBxVyH-2+Jj2vrqvYJBG0mHGLjCJM61DnpfT3H7pUoiFMpETA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/perf: riscv: Do not allow invalid raw event config
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, 
	anup@brainfault.org, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	mchitale@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_112622_463760_42CC9C15 
X-CRM114-Status: GOOD (  33.31  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgODowNuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEF0aXNoLAo+Cj4gT24gMjAyNC0xMi0x
MSAzOjEwIFBNLCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDExLCAy
MDI0IGF0IDExOjQ24oCvQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiBPbiBNb24sIDA5IERlYyAyMDI0IDE2OjA0OjQ2IFBTVCAoLTA4MDApLCBB
dGlzaCBQYXRyYSB3cm90ZToKPiA+Pj4gVGhlIFNCSSBzcGVjaWZpY2F0aW9uIGFsbG93cyBvbmx5
IGxvd2VyIDQ4Yml0cyBvZiBocG1ldmVudFggdG8gYmUKPiA+Pj4gY29uZmlndXJlZCB2aWEgU0JJ
IFBNVS4gQ3VycmVudGx5LCB0aGUgZHJpdmVyIG1hc2tzIG9mIHRoZSBoaWdoZXIKPiA+Pj4gYml0
cyBidXQgZG9lc24ndCByZXR1cm4gYW4gZXJyb3IuIFRoaXMgd2lsbCBsZWFkIHRvIGFuIGFkZGl0
aW9uYWwKPiA+Pj4gU0JJIGNhbGwgZm9yIGNvbmZpZyBtYXRjaGluZyB3aGljaCBzaG91bGQgcmV0
dXJuIGZvciBhbiBpbnZhbGlkCj4gPj4+IGV2ZW50IGVycm9yIGluIG1vc3Qgb2YgdGhlIGNhc2Vz
Lgo+ID4+Pgo+ID4+PiBIb3dldmVyLCBpZiBhIHBsYXRmb3JtKGkuZSBSb2NrZXQgYW5kIHNpZml2
ZSBjb3JlcykgaW1wbGVtZW50cyBhCj4gPj4+IGJpdG1hcCBvZiBhbGwgYml0cyBpbiB0aGUgZXZl
bnQgZW5jb2RpbmcgdGhpcyB3aWxsIGxlYWQgdG8gYW4KPiA+Pj4gaW5jb3JyZWN0IGV2ZW50IGJl
aW5nIHByb2dyYW1tZWQgbGVhZGluZyB0byB1c2VyIGNvbmZ1c2lvbi4KPiA+Pj4KPiA+Pj4gUmVw
b3J0IHRoZSBlcnJvciB0byB0aGUgdXNlciBpZiBoaWdoZXIgYml0cyBhcmUgc2V0IGR1cmluZyB0
aGUKPiA+Pj4gZXZlbnQgbWFwcGluZyBpdHNlbGYgdG8gYXZvaWQgdGhlIGNvbmZ1c2lvbiBhbmQg
c2F2ZSBhbiBhZGRpdGlvbmFsCj4gPj4+IFNCSSBjYWxsLgo+ID4+Pgo+ID4+PiBTdWdnZXN0ZWQt
Ynk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+Pj4gLS0tCj4g
Pj4+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMTAgKysrKysrLS0tLQo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jCj4gPj4+IGluZGV4IDM0NzNiYTAyYWJmMy4uZmI2ZWRhOTBmNzcx
IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPj4+ICsr
KyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+Pj4gQEAgLTUwNyw3ICs1MDcsNyBA
QCBzdGF0aWMgaW50IHBtdV9zYmlfZXZlbnRfbWFwKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwg
dTY0ICplY29uZmlnKQo+ID4+PiAgewo+ID4+PiAgICAgICB1MzIgdHlwZSA9IGV2ZW50LT5hdHRy
LnR5cGU7Cj4gPj4+ICAgICAgIHU2NCBjb25maWcgPSBldmVudC0+YXR0ci5jb25maWc7Cj4gPj4+
IC0gICAgIGludCByZXQ7Cj4gPj4+ICsgICAgIGludCByZXQgPSAtRU5PRU5UOwo+ID4+Pgo+ID4+
PiAgICAgICAvKgo+ID4+PiAgICAgICAgKiBFbnN1cmUgd2UgYXJlIGZpbmlzaGVkIGNoZWNraW5n
IHN0YW5kYXJkIGhhcmR3YXJlIGV2ZW50cyBmb3IKPiA+Pj4gQEAgLTUzNiw4ICs1MzYsMTEgQEAg
c3RhdGljIGludCBwbXVfc2JpX2V2ZW50X21hcChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2
NCAqZWNvbmZpZykKPiA+Pj4KPiA+Pj4gICAgICAgICAgICAgICBzd2l0Y2ggKGNvbmZpZyA+PiA2
Mikgewo+ID4+PiAgICAgICAgICAgICAgIGNhc2UgMDoKPiA+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IFJJU0NWX1BNVV9SQVdfRVZFTlRfSURYOwo+ID4+PiAtICAgICAgICAgICAgICAg
ICAgICAgKmVjb25maWcgPSBjb25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAvKiBSZXR1cm4gZXJyb3IgYW55IGJpdHMgWzQ4LTYzXSBp
cyBzZXQgIGFzIGl0IGlzIG5vdCBhbGxvd2VkIGJ5IHRoZSBzcGVjICovCj4gPj4+ICsgICAgICAg
ICAgICAgICAgICAgICBpZiAoIShjb25maWcgJiB+UklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLKSkg
ewo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqZWNvbmZpZyA9IGNvbmZpZyAm
IFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSzsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFg7Cj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICB9Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gICAgICAg
ICAgICAgICBjYXNlIDI6Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAoY29uZmln
ICYgMHhGRkZGKSB8IChTQklfUE1VX0VWRU5UX1RZUEVfRlcgPDwgMTYpOwo+ID4+PiBAQCAtNTU0
LDcgKzU1Nyw2IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9ldmVudF9tYXAoc3RydWN0IHBlcmZfZXZl
bnQgKmV2ZW50LCB1NjQgKmVjb25maWcpCj4gPj4+ICAgICAgICAgICAgICAgfQo+ID4+PiAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4+PiAgICAgICBkZWZhdWx0Ogo+ID4+PiAtICAgICAgICAgICAg
IHJldCA9IC1FTk9FTlQ7Cj4gPj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICAgICAgIH0K
PiA+Pgo+ID4+IFRoaXMgZG9lc24ndCBoYXZlIGEgRml4ZXMsIGlzIGl0Cj4gPj4KPiA+PiAgICAg
Rml4ZXM6IGYwYzkzNjNkYjJkZCAoInBlcmYvcmlzY3Ytc2JpOiBBZGQgcGxhdGZvcm0gc3BlY2lm
aWMgZmlybXdhcmUgZXZlbnQgaGFuZGxpbmciKQo+ID4+Cj4gPgo+ID4gSSB3YXMgbm90IHN1cmUg
aWYgYSBGaXhlcyB0YWcgd2FzIHdvcnRoIGl0IGFzIHRoZSBjdXJyZW50Cj4gPiBiZWhhdmlvciht
YXNraW5nIG9mZiB0aGUgaGlnaGVyIGJpdHMpIGlzIHRoZXJlIGZyb20gdGhlIGJlZ2lubmluZyBv
Zgo+ID4gdGhlIGRyaXZlci4KPiA+IHBlcmYgdG9vbCB0aHJvd3MgYSB3YXJuaW5nIGFzIHdlbGwg
aWYgYSB1c2VyIHRyaWVzIHRvIHNldCBhbnkgb2YgdGhlCj4gPiB1cHBlciAxNiBiaXRzIGFzIGV2
ZW50IGF0dHJpYnV0ZXMgaXMgc2V0IHRvIDAtNDcuCj4gPgo+ID4gSWYgaXQgc2hvdWxkIGJlIGJh
Y2twb3J0ZWQsIHRoaXMgaXMgdGhlIGNvcnJlY3QgZml4ZXMgdGFnLgo+ID4gRml4ZXM6IGU5OTkx
NDM0NTk2ZiAoIlJJU0MtVjogQWRkIHBlcmYgcGxhdGZvcm0gZHJpdmVyIGJhc2VkIG9uIFNCSQo+
ID4gUE1VIGV4dGVuc2lvbiIpCj4KPiBJIHdvdWxkIGFncmVlIHRoZSBtYXNraW5nIGlzbid0IGEg
cmVhbCBpc3N1ZSBiZWZvcmUgY2hhbmdpbmcgdGhlIGV2ZW50IGF0dHJpYnV0ZQo+IGZyb20gNDgg
dG8gNTYgYml0cyB3aWRlLiBIb3dldmVyLCB0aGlzIHBhdGNoIGFsc28gZG9lcyBhIGRyaXZlLWJ5
IGZpeCBvZiBhCj4gZGlmZmVyZW50IGJ1ZyBpbnRyb2R1Y2VkIGJ5IGYwYzkzNjNkYjJkZDogdGhl
cmUgaXMgbm8gImNhc2UgMSIgb3IgZGVmYXVsdCBjYXNlLAo+IHNvIHRoZSBmdW5jdGlvbiB3b3Vs
ZCByZXR1cm4gYW4gdW5pbml0aWFsaXplZCB2YWx1ZSBpZiB0aGUgaGlnaCBiaXRzIGFyZSAwMS4K
PiBNYXliZSB0aGF0IHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLCB3aXRoIGEgRml4ZXMgdGFn
Pwo+CgpHb29kIGV5ZSA7KS4gSSB3aWxsIHNwbGl0IHRoaXMgb25lIGludG8gdHdvIHdpdGggYSBm
aXhlcyB0YWcgZm9yIHRoZQpzd2l0Y2ggY2FzZS4KCj4gUmVnYXJkcywKPiBTYW11ZWwKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
