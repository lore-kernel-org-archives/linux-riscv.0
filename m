Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EDCCFA747
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrLyE/vRVfd7Z8QJNZQZ6iQiqtq12Ps22WC76H0aHCU=; b=JF90h/ZCEIes/K
	6TOrvqznGIbIbajFf0zp1+UMRY0wFkI05DW7INbMck0pyWdXtzyE2smldDfx/SHozFoIYiWasf/4Z
	wtdw4cjyo3NWzgT8Fm3wrB8fp5OACoOe+EdQyIA8WYyoRL3Xx4hKVDU59iBlysYsqbi/njxQbwEaW
	rk2oKZTxJPUcPqacooMzS+QVsMzJdrj1c2eCmexAK6MKM+NYVP8smilG/h2C64IyLEILrQPOdM9Q/
	HvqKAQYocDx1Kyul3clLu4R67cCXyzoIGSv/smCFnbwqq4cxqmvgmoDGKnTNNf31/9Sh+nvR9SFD8
	GTorHNKuOJomYhkphj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMPj-000000083T0-1osn;
	Fri, 21 Nov 2025 08:22:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMPg-000000083Sa-49YH
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 08:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8874C44249
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 08:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9BCC16AAE
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763713359;
	bh=HYNDpspIIvlQrvW+iVhMi8SfO4q/jqFm+sWhmzc5mMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FFFnTNDWHm6S3nVWx6LLLUhjdYwuA4MweY+5foFaJLD8Gp3mAWBjTtX8EtcABAg3g
	 YXmivT5yZoQRUXwb7a/Mm7fWjEm//XP87wJhdhkw30YUrKxgFzKf1GiCSXFqX3muNp
	 IZcvDJKF+49gc2rg7tyR069jEvaeYNYA2lzHER/Qo8i7fsIDzjusqNTZErlCHDi/Qa
	 VMJKY0ZYlkuX4HEv2mEDq80MNVJeDIO8aXwgPYYQX7C+q2CBteD7DkLtFFpyqzXE+t
	 dGZSzgbvVk9P/lX3dugyFbWUyTnWTwDH3PeXVV7zR4fc898C9bT5k3MqH7GefKNty5
	 NBogVKQEexb3w==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1477347f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 00:22:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcfBxJU+3dVbMTiLjI3pU+pczBiaY76J0IeZEsZt0ISxV4T+emK9dmDMpax2dRwBk1HzsvjsR6KqX6Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpI6ViDZ4rmcMlAtRZIj9en69FuPbxwklVasteqFUtGi7Hoos5
	FC0HD5NVoVJpm+yz6aIYfTvH57NzxgbZdELosY6hxCQXoVPtBW/T8xYybhHod1qUkNj0NBc2tsF
	W+e4QtDeAbCF5fw1yr0/GtKauKtD79NY=
X-Google-Smtp-Source: AGHT+IGUTC0KIr8VzF4dB2PYL/35xms4GHTL8V+m6O+4W4E4J+pE2dP+DxrlgkmaLJo1VtMewWX9G6RonD0G+xBL+TQ=
X-Received: by 2002:a05:6000:1a8f:b0:42b:3dfb:645f with SMTP id
 ffacd0b85a97d-42cc1d19d78mr1388711f8f.47.1763713357676; Fri, 21 Nov 2025
 00:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20251121063439.2545-1-cp0613@linux.alibaba.com> <20251121063439.2545-2-cp0613@linux.alibaba.com>
In-Reply-To: <20251121063439.2545-2-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Nov 2025 16:22:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRhatsOVshRHZSrxcNLktGCD6xK2MF3=qTtjkqm2-A8JQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnMD2gejPZX_v0rAyljbsI6Oke2xFh30nSFLiY-NGQAnJTIyn8eTijEau0
Message-ID: <CAJF2gTRhatsOVshRHZSrxcNLktGCD6xK2MF3=qTtjkqm2-A8JQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for XuanTie
To: cp0613@linux.alibaba.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_002241_068130_1561775B 
X-CRM114-Status: GOOD (  11.97  )
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

T24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgMjozNeKAr1BNIDxjcDA2MTNAbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IEFkZCBuZXcgdmVuZG9yIHN0cmluZ3MgdG8gZHQgYmluZGluZ3MgZm9yIFJJU0MtViB2ZW5k
b3IgWHVhblRpZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxp
YmFiYS5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbAo+IGluZGV4IGYxZDE4ODIwMDliYS4uNWQyOGIyZGE5NGNkIDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbAo+IEBAIC0xODI5LDYgKzE4MjksOCBAQCBwYXR0ZXJuUHJvcGVydGllczoK
PiAgICAgIGRlc2NyaXB0aW9uOiBYaWxpbngKPiAgICAiXnhuYW5vLC4qIjoKPiAgICAgIGRlc2Ny
aXB0aW9uOiBYbmFubwo+ICsgICJeeHVhbnRpZSwuKiI6Cj4gKyAgICBkZXNjcmlwdGlvbjogQy1T
S1kgTWljcm9zeXN0ZW1zIENvLiwgTHRkLiAoWHVhblRpZSkKWWVzLCBBY2NvcmRpbmcgdG8gdGhl
ICJTdGFuZGFyZCBNYW51ZmFjdHVyZXIncyBJREVOVElGSUNBVElPTiBDT0RFIgpbMV0uIFRoZSBt
YW51ZmFjdHVyZXIgb2YgQ29kZSAnMHg1YjcnIGhhcyBjaGFuZ2VkIGZyb20gdGhlYWQgdG8KeHVh
bnRpZSBpbiAwNC8zMC8yMDI0LgoKMTA1IFQtSEVBRCBTZW1pY29uZHVjdG9yIENvIEx0ZCAtPiBD
LVNLWSBNaWNyb3N5c3RlbXMgQ28gTHRkIChYdWFuVGllKQoKVGhlIFh1YW5UaWUgaXMgdGhlIGFi
YnJldmlhdGlvbiBvZiBDLVNLWSBNaWNyb3N5c3RlbXMgQ28uLCBMdGQsIHdoaWNoCmJlbG9uZ3Mg
dG8gQWxpYmFiYSBEYW1vIEFjYWRlbXkuCgpbMV0gaHR0cHM6Ly93d3cuamVkZWMub3JnL3N0YW5k
YXJkcy1kb2N1bWVudHMvZG9jcy9qZXAtMTA2YWIKClJldmlld2VkLWJ5OiBHdW8gUmVuIChBbGli
YWJhIERhbW8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIChBbGliYWJhIERhbW8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwub3JnPgoKPiAgICAiXnh1
bmxvbmcsLioiOgo+ICAgICAgZGVzY3JpcHRpb246IFNoZW56aGVuIFh1bmxvbmcgU29mdHdhcmUg
Q08uLExpbWl0ZWQKPiAgICAiXnh5bG9uLC4qIjoKPiAtLQo+IDIuNTAuMQo+CgoKLS0KQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
