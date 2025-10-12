Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C013CCD187
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrGL6TXIHhY/31239JnwKPledRjuv3U0m7zmdJmV3cI=; b=MxvWxxAtr2QdG5
	8LIvd7GxNbbzMmMvIbFT5iThzaGXiAup4rGU6brXAX7E2e739i7qxJeAyLn3tIgixQxthujutBNco
	mwU2c7WtI+cB0WzuYwoNBYbALW2ORXoxQUZzeVGPRYFZ7YciwXoXScE0lKFhjHoPRCHN1Av/gWx2j
	5aka8b2NT0HO4Se72DQrwFRz48Sq5Spf91raGadAm4TwiT6vFsbHqQGgED9haFLqUM0gM0Ec+ap9E
	aDqwhxBz18Pz8flpVdz4/+Pdq67DKTDjFG0YGBSA/RpNNjXwz7gyMoSNemNC1bRH3WVEU8cmGpZtm
	RqiLpRLa7mXlQ08VWxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pJG-0000000B76G-01yV;
	Sun, 12 Oct 2025 06:11:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pJE-0000000B75v-0Vbw
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 06:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFD9D45AFC
	for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 06:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A20C16AAE
	for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 06:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760249515;
	bh=5ola3YDxnYdWqEmDLUEc5xfcVUT9cazJU910mw2Lbgs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rzU84/YNrD2fWtDD/A8jNqlT+n3IknG2aNgbHc30iBGsUbymW8vDEQhzCFIN0qj5V
	 WfJGTL4YjoEA8I+BPMe1Jw6AccxJjU1UgC6bnuylNFw4sEWDu0X6Q3M98FdXcBFBzj
	 6SHJegyUA0VZjmnKoj1C8Un0FEoErYfRkM6pcuR6WMF1ULhkQrKx9AzK7qupKPE/WH
	 JpHGZrNYSCGqZ9eEy9C5K28Dtf9xnxkCM0zQx7FPQsQPBmI/mgn7owmH2zmLsxfkoL
	 hDmmByqEhiorgZIpgMy3LPLyYyTRRSdpOpavoT6jLBCGxxkPBWmJkMPy1MA8CHy0cD
	 XVOFlbuPhneMQ==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e29d65728so18651475e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 23:11:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXvLLGhORsqRlXGaiMxAJwhzKQLfKlSmWj6U9iyeBjEr2Vf0A4eEl4AaxmuvpGiLYWkHGsreCMU4F9iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrYn5DxQhbK0umocEKo+97MF2mOiP5WW/8oZNlSSNk9a6Zs7O+
	v3W+wOBWrEnWoTgVFZ8igpxHKShvtcRNIPJZ3PTLdKj2nNcO60jPiXMAhQtHvD6FhpoIuYoGVuv
	pft02vsjZ9fjctwkuS1fJ9SljXxhQusM=
X-Google-Smtp-Source: AGHT+IEKlteG9lfVBg9j7ASH6OTe/Dfj1NndFuZm+KdXyn0SVroBvLiRXYmPyV6peIPu9DVdV+AM6j/uCc8jUqMSTVQ=
X-Received: by 2002:a05:600c:4506:b0:45b:8a0e:cda9 with SMTP id
 5b1f17b1804b1-46fa9a8638dmr118651305e9.2.1760249514038; Sat, 11 Oct 2025
 23:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251011155746.1558731-1-guoren@kernel.org>
In-Reply-To: <20251011155746.1558731-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 12 Oct 2025 14:11:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRfLzrqHoYrexS55AT3sjn5VbbNKf2WMEGWrw9ERRLYYA@mail.gmail.com>
X-Gm-Features: AS18NWCt3-Wrv4mHE1rXWP8VmFtwVh1Eop_f8YJ4Ep4VwD8YYMjDGc5QM5wrH6o
Message-ID: <CAJF2gTRfLzrqHoYrexS55AT3sjn5VbbNKf2WMEGWrw9ERRLYYA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pgprot_dmacoherent definition
To: samuel.holland@sifive.com, david@redhat.com, yongxuan.wang@sifive.com, 
	cuiyunhui@bytedance.com, luxu.kernel@bytedance.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_231156_198926_DF295DC0 
X-CRM114-Status: GOOD (  16.64  )
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

QW51cCdzIHBhdGNoIGhhcyBzb2x2ZWQgdGhpczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNTA4MjAxNTIzMTYuMTAxMjc1Ny0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29t
LwoKU28sIEkgYWJhbmRvbiB0aGlzIHBhdGNoLgoKT24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgMTE6
NTjigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogIkd1byBSZW4gKEFs
aWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+Cj4gUklTQy1WIFN2cGJt
dCBTdGFuZGFyZCBFeHRlbnNpb24gZm9yIFBhZ2UtQmFzZWQgTWVtb3J5IFR5cGVzCj4gZGVmaW5l
cyB0aHJlZSBtb2RlczoKPgo+ICBNb2RlIHwgVmFsdWUgfCBSZXF1ZXN0ZWQgTWVtb3J5IEF0dHJp
YnV0ZXMKPiAgUE1BICB8ICAgMCAgIHwgTm9uZQo+ICBOQyAgIHwgICAxICAgfCBOb24tY2FjaGVh
YmxlLCBpZGVtcG90ZW50LCB3ZWFrbHktb3JkZXJlZCAoUlZXTU8pLAo+ICAgICAgIHwgICAgICAg
fCBtYWluIG1lbW9yeQo+ICBJTyAgIHwgICAyICAgfCBOb24tY2FjaGVhYmxlLCBub24taWRlbXBv
dGVudCwgc3Ryb25nbHktb3JkZXJlZAo+ICAgICAgIHwgICAgICAgfCAoSS9PIG9yZGVyaW5nKSwg
SS9PCj4KPiBUaGUgcGdwcm90X2RtYWNvaGVyZW50IGRlZmF1bHQgdXNlcyB0aGUgSU8gbWVtb3J5
IGF0dHJpYnV0ZSBpZiB0aGVyZQo+IGlzIG5vIGFzbSBkZWZpbml0aW9uLCBidXQgSU8gaXMgbm90
IGZvciBtYWluIG1lbW9yeSBhY2NvcmRpbmcgdG8KPiBTdnBibXQgcnVsZXMuCj4KPiBUaGlzIGNv
bW1pdCBjb3JyZWN0cyBwZ3Byb3RfZG1hY29oZXJlbnQgd2l0aCB0aGUgTkMgbWVtb3J5IGF0dHJp
YnV0ZSwKPiB3aGljaCBzYXRpc2ZpZXMgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgYW5kIHByZXZl
bnRzIHVzaW5nIHRoZSBJTwo+IGF0dHJpYnV0ZSB0byBhY2Nlc3MgbWFpbiBtZW1vcnkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBrZXJu
ZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDkgKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gaW5kZXggMjllOTk0YTlhZmI2Li4yYTg0NDc5ZGU4MWIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC02NTQsNiArNjU0LDE1IEBAIHN0YXRpYyBpbmxp
bmUgcGdwcm90X3QgcGdwcm90X3dyaXRlY29tYmluZShwZ3Byb3RfdCBfcHJvdCkKPiAgICAgICAg
IHJldHVybiBfX3BncHJvdChwcm90KTsKPiAgfQo+Cj4gKy8qCj4gKyAqIERNQSBhbGxvY2F0aW9u
cyBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMgdXNlIHdoYXQgdGhlIFJJU0MtViBhcmNoaXRlY3R1
cmUKPiArICogY2FsbCAiTm9uLUNhY2hlYWJsZSIgbWVtb3J5IGF0dHJpYnV0ZSwgd2hpY2ggcGVy
bWl0cyBpZGVtcG90ZW50LCB3ZWFrbHktb3JkZXJlZAo+ICsgKiAoUlZXTU8pLCBtYWluIG1lbW9y
eS4gVGhpcyBpcyBkaWZmZXJlbnQgZnJvbSAiSS9PIiBtZW1vcnkgYXR0cmlidXRlIHdoaWNoIGlz
Cj4gKyAqIGludGVuZGVkIGZvciBNTUlPIGFjY2VzcyB3aXRoIE5vbi1jYWNoZWFibGUsIG5vbi1p
ZGVtcG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gKyAqIChJL08gb3JkZXJpbmcpLCBJL08gYXR0
cmlidXRlcy4KPiArICovCj4gKyNkZWZpbmUgcGdwcm90X2RtYWNvaGVyZW50IHBncHJvdF93cml0
ZWNvbWJpbmUKPiArCj4gIC8qCj4gICAqIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGNvbnRyb2wgdGhl
IGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4gdGhlIFBURSBBL0QgYml0cyBuZWVkIHRvIGJlIHNldC4g
QnkKPiAgICogZGVmYXVsdCB0aGUgTS1tb2RlIGZpcm13YXJlIGVuYWJsZXMgdGhlIGhhcmR3YXJl
IHVwZGF0aW5nIHNjaGVtZSB3aGVuIG9ubHkgU3ZhZHUgaXMgcHJlc2VudCBpbgo+IC0tCj4gMi40
MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
