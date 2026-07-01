Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032BBC43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMN3Zg+xIVkEaRHQguoItsbhUTtcdoqvT6+r+7NQPzo=; b=n7/XhZ3rgGTAYY
	SxA+ye7ZGfno6Cd64j1vh7mCQSkDtaAhr26NXHEp81+UHubTTiRDxpDb7KzWARkXvrq8Ci+HUjYU0
	0ZUJRcVwGuF5lYYhxJezFxka2CJUmasAHuKe1qNVtkksWcMTVOi9XPMM3RCcj6C+/cqHAU1YHb3Yy
	S1D26udbVWhcovqOylb9Q9uYm6OavjtykfT6B0y3Y5umeJr5HU5QKpyBjv6YWymvrZLLboVi0XJ4t
	MITyPGVLuObvFqkjqtk5xDUb+U5BcPv27jE1IanX1be4HD1OvYru0zPAu2DRciWddXXF5t/ImA89k
	2xPlWZUr3dGWjb5ctNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzO-00000002kCY-2FfO;
	Wed, 01 Jul 2026 17:44:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzM-00000002kBV-0wEU
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 17:44:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c81db32393so88775ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 10:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927882; cv=none;
        d=google.com; s=arc-20260327;
        b=b+BKpcXk6oW0w0FsUkUrturNYnpkYrOGskD56p9NGl4/7BAWKgT1jJ8UG1rziOMTEu
         1NeeB5DlSH5QEvMMBSr2WIXyKD6dLMSQ3gQ3nvJqwnblalLV1z1jshMecrWkJkCGS+Nm
         ByQ/o49YPAy92HxtW/B+K+zLUW5wP+URb/6FpQBQEzJjf99FD6GuTYsFn+2/l1qKoDgh
         O0Eq3Y0vm/pDuuwDAikThW2gqhvg7wJ3eIfdbMlngpywv0RMSsXuX7fccmgHdNJ9xzH9
         6tbDruxPktRsvQ5wHXF1ulXDvGSxTgyf43tMCh5SZqwmBQ7NmKz6SRg4I4FaF48/L20y
         ZC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        fh=Ku7w/8H7TwaIwoaklMDcKzHvu1OeFaubN28mBehz3+Y=;
        b=YvDfLEc5ZwRcQpeBngqfqzu+R7CzSvwj9UnPEbtN9B+lHV6IoUwWuqEpqVYC+6i7DY
         22oA3Nt9IUFjR/K/iRx0Go/rhKS+oSfvcCp4SL8/rEbSZjbG5ka75rsH0O4GAHiqzt8W
         SRwdiCHS2cTZ3fKLRH/AZD5zduuQkfxCQsZvmYzYBE6JFhY5gqN4GfS05/FtOLFXbUz5
         rmTSJht1TaI8XwfiCSyTslYnLkNGATzlJV7QBz4dw5qt2rlmIUULug7YXXXSryylAo1S
         H0q/ZjE0Sou+NS4PXz+oGjInrwrWiz+k8b+DtMcLs/bPP2A7Wl5ZgSKnk2V0t9PPGmUL
         OHTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927882; x=1783532682; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=klXGz1bDO6QsHfn5NnBWmz1V9YF4MIAdJF5R44JRCfja1CLoaYdk9OrDwAZnbH3sj0
         ytT5sJxVMSJyRLm5vMxYqCubaMo3lsuS8h+ozbtavNPxGf03tez7FcJ5T/zw9nmzvgHh
         L6oV0PJEEB+BuMFZlmTpb4jnDFgvX7Heazn8JjUOLaRV/M393vmbaJ0dLZvm5lgkiEMH
         FLcnzHRwnxElJ/0bv8gitzsQXWSIQwO+cjwfL7+JE9u67gJovmy7Ndgldwp429rQnzrS
         4hlFhhLV1rQodxVUcuR9Dw7nOpI6tu595sZUJNQqeZvmVKa67U5dYGvBaSYbja/tDVi3
         YdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927882; x=1783532682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3KB3W8igbPhJZR6fsRkWP2Fgao3oonwJVqpaQObUCc=;
        b=Dz9iwP5pQjqtdsekrFyUJB6Ce2GgauHmXoX/Iht3dJE5RNHyg8Kvd1f2+Pr1LnpfIa
         A5DDkqYhc3iTD3393l79ok9K9g5py3RXLNjbMOV2KhfcurSagW1WByhAerMgXshcTLmT
         4LgUifkrC2QoSj2aF4hnWdi3i2FAs6QNU0UbrWxX0FwhyU7OPOZlBObG+upn9ID4EktK
         Ud7lX208LV4Z4Bb8yu0xvztURGk45IwbwkiX3oaCqCVABA5dReIK171Y/wEkMGpAwQEp
         szkiaeVzngv3MhFVjtrc2KhObcaLbdw6QGRpQFXfVPNb2fiaXOCRKTmFxIfl/dIcpNVq
         IcEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8PNxklNUVV9KHVLzUsOlgKQKqiuKhPt3A6Y+CLEJRkjOno/ERqS0OJK0CNiGQ1uxf4diEUq0GwrpB8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxySrhhmhfjqOUuzmfRyKZm/3yDYEX4cxoUdcgOZ9GcgBY3wQGi
	BNoM6Yivol+c92I/mjeHtM0BzkK+I+DAgvAHb91G4EkO56PXU0Rv29sTvBSyQ30XBds7zQ5wP7H
	h04eO+WPFseJzdA5JRytx+DXFVCe45lvMVDxVUOBF
X-Gm-Gg: AfdE7cmNxjm5btQ1WHFYSdLBvW44knhCjUVeKPAzJx6GCh8jEtyIVcIpynGUa55tbwC
	2GucyvRU9zNx2mq7911hWklDf0OHuvzwTB6M3pmFv3a53KlJ/yc5e4+sCmgatAODKJLpt1CrhF0
	wWgR58QdwN3k5Owv8CH2/HOsfzNP8DFQuMR/cPyVurU7sYr2+mUKFZHeHdrDejdu/T+HK6dkH5t
	1b+OpdAY1Y7rddPZM4S7XGmNRAZSAha29fwuSiZ+u623TK2gagqIhX+g2GgxU2XncUlesxEIYl4
	1yl9w0fo
X-Received: by 2002:a17:903:1c7:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2ca7092e3abmr2685955ad.18.1782927881605; Wed, 01 Jul 2026
 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:29 -0700
X-Gm-Features: AVVi8CfVI0-HeGb5BzxacOi52xTnZf0837ZLQ1Li6xufzgI5Rfn0UuYpoo0nJUs
Message-ID: <CAP-5=fX1wR0tKyTiLjpK5JKWUP8j=E4meaPG1eyzTwj1XuKmFw@mail.gmail.com>
Subject: Re: [PATCH v8 19/22] tools/perf: Support event code for arch standard events
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104444_265967_87725745 
X-CRM114-Status: GOOD (  21.55  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxOjQ44oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBGcm9tOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KPgo+IFJJU0MtViByZWxpZXMgb24gdGhlIGV2ZW50IGVuY29kaW5nIGZyb20gdGhlIGpz
b24gZmlsZS4gVGhhdCBpbmNsdWRlcwo+IGFyY2ggc3RhbmRhcmQgZXZlbnRzLiBJZiBldmVudCBj
b2RlIGlzIHByZXNlbnQsIGV2ZW50IGlzIGFscmVhZHkgdXBkYXRlZAo+IHdpdGggY29ycmVjdCBl
bmNvZGluZy4gTm8gbmVlZCB0byB1cGRhdGUgaXQgYWdhaW4gd2hpY2ggcmVzdWx0cyBpbiBsb3Np
bmcKPiB0aGUgZXZlbnQgZW5jb2RpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+CgpUaGFua3MsCklhbgoKPiAtLS0KPiAgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2Fy
Y2gvcmlzY3YvYXJjaC1zdGFuZGFyZC5qc29uIHwgMTAgKysrKysrKysrKwo+ICB0b29scy9wZXJm
L3BtdS1ldmVudHMvamV2ZW50cy5weSAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYXJjaC1zdGFuZGFy
ZC5qc29uIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvYXJjaC1zdGFuZGFyZC5q
c29uCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjk2ZTIxZjA4
ODU1OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9y
aXNjdi9hcmNoLXN0YW5kYXJkLmpzb24KPiBAQCAtMCwwICsxLDEwIEBACj4gK1sKPiArICB7Cj4g
KyAgICAiRXZlbnROYW1lIjogImN5Y2xlcyIsCj4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJj
eWNsZSBleGVjdXRlZCIKPiArICB9LAo+ICsgIHsKPiArICAgICJFdmVudE5hbWUiOiAiaW5zdHJ1
Y3Rpb25zIiwKPiArICAgICJCcmllZkRlc2NyaXB0aW9uIjogImluc3RydWN0aW9uIHJldGlyZWQi
Cj4gKyAgfQo+ICtdCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9qZXZlbnRz
LnB5IGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2pldmVudHMucHkKPiBpbmRleCAzYTFiY2RjZGM2
ODUuLjBjZjlkMjYzMTViMyAxMDA3NTUKPiAtLS0gYS90b29scy9wZXJmL3BtdS1ldmVudHMvamV2
ZW50cy5weQo+ICsrKyBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9qZXZlbnRzLnB5Cj4gQEAgLTQx
Myw3ICs0MTMsMTQgQEAgY2xhc3MgSnNvbkV2ZW50Ogo+ICAgICAgICAgIHNlbGYubG9uZ19kZXNj
ID0gTm9uZQo+ICAgICAgaWYgYXJjaF9zdGQ6Cj4gICAgICAgIGlmIGFyY2hfc3RkLmxvd2VyKCkg
aW4gX2FyY2hfc3RkX2V2ZW50czoKPiAtICAgICAgICBldmVudCA9IF9hcmNoX3N0ZF9ldmVudHNb
YXJjaF9zdGQubG93ZXIoKV0uZXZlbnQKPiArICAgICAgICAjIEluaGVyaXQgdGhlIGFyY2gtc3Rh
bmRhcmQgZW5jb2Rpbmcgb25seSBpZiB0aGlzIGV2ZW50IGRlZmluZXMgbm8KPiArICAgICAgICAj
IGV4cGxpY2l0IGVuY29kaW5nIG9mIGl0cyBvd24uIEV2ZW50cyB3aXRoIGV4cGxpY2l0IEV2ZW50
Q29kZSwKPiArICAgICAgICAjIENvbmZpZ0NvZGUsIGV0Yy4gbWF5IGNhcnJ5IGFsdGVybmF0ZSBl
bmNvZGluZ3MgYW5kIGFwcGVuZGVkIG1vZGlmaWVycwo+ICsgICAgICAgICMgdGhhdCBtdXN0IHN1
cnZpdmUuCj4gKyAgICAgICAgaWYgKCdFdmVudENvZGUnIG5vdCBpbiBqZCBhbmQgJ0V4dFNlbCcg
bm90IGluIGpkIGFuZAo+ICsgICAgICAgICAgICBjb25maWdjb2RlIGlzIE5vbmUgYW5kIGV2ZW50
aWRjb2RlIGlzIE5vbmUgYW5kCj4gKyAgICAgICAgICAgIGxlZ2FjeV9od19jb25maWcgaXMgTm9u
ZSBhbmQgbGVnYWN5X2NhY2hlX2NvbmZpZyBpcyBOb25lKToKPiArICAgICAgICAgIGV2ZW50ID0g
X2FyY2hfc3RkX2V2ZW50c1thcmNoX3N0ZC5sb3dlcigpXS5ldmVudAo+ICAgICAgICAgICMgQ29w
eSBmcm9tIHRoZSBhcmNoaXRlY3R1cmUgc3RhbmRhcmQgZXZlbnQgdG8gc2VsZiBmb3IgdW5kZWZp
bmVkIGZpZWxkcy4KPiAgICAgICAgICBmb3IgYXR0ciwgdmFsdWUgaW4gX2FyY2hfc3RkX2V2ZW50
c1thcmNoX3N0ZC5sb3dlcigpXS5fX2RpY3RfXy5pdGVtcygpOgo+ICAgICAgICAgICAgaWYgaGFz
YXR0cihzZWxmLCBhdHRyKSBhbmQgbm90IGdldGF0dHIoc2VsZiwgYXR0cik6Cj4KPiAtLQo+IDIu
NTMuMC1NZXRhCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
