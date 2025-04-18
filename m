Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E790FC369C9
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gzng+21fCcRc/4dQlLSxxAF3/jgKyyjiWRE3OtuzPXs=; b=BYe8bwNIA5l3+g
	ikKLpYMv5IX3dggPbYIb4geiIMIe490bc665gPzSI97wVk4sxnNP8uakE7Xv0oz5dWiJVRhVl6oA1
	g8YCV+AoIF6SWt47fNzkjLZJO11psprUjoy29mZiT8mczOPLTHt5XTs3LWVwqm5/ht4VBB/U7E0ZB
	EB6/9FdIvh4ETA5R84qlocLP9qIOGRfr2U/FevI9aMof1nkINTmzWayUApVN73qOtdPo67nZCFL2V
	1+RGesYKue87qnvfsHgSDQVVeWp1AzgfFSXpYCPyIIt8X8QD/QT1tg3aHyzOkhF2/CpIONpG/+JRc
	hCv1GJMEMiiXBccpuz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iWo-0000000Foyx-2CHq;
	Fri, 18 Apr 2025 10:00:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iTv-0000000FoWS-1FcG
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 09:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4DADA4B30B
	for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 09:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73FDC4AF0B
	for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744970277;
	bh=QdGPYEWnf1mJjlpPJrENrbvJsClpPNG75kMnxBynrX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FtMsQkMPkvLtYQhbn2vHpmYSK90nEQV2IvIZq2jgEn4a+IO3mfmoQ9lXOfUQLJfAP
	 ukvPWhJLSdO6qMFDWsgavDw7uvW4OgYtq01teix4ZEolE/p8tzxcGMAwzAJHF+5MUA
	 GDCRUlXQ1UqOb+0QiieHVdrVOQmKyEIIb3IWYob+TuJGmbuwzQtV1x66EEW0Z0wEos
	 oDblkVSnhq50osth3pw6efqbGrEUielkfSV7vXkOSl+f/pBjAoB+80uMDaMRiYtZVD
	 8MAJMAPYBluyLQ/NQoJSyWx8Gtc2+A9DG2uRhr/UM4hzlX/DRjMZvrtgGV5mvytJHz
	 tmMm6Ir/MsJdQ==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so8395385e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 02:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4MbSV8ktol/9R0PcMwfoiWIiI9vdQF4CiwLqWi8n81+w0LyWA8RcZjsAF4F+RMwjfl5cFaIJHDeYo3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEnnBq419tCPYnCXWv22EctOHqYZgoWHpOwLyTvWoL1C7T7Vn
	3L3NtdhGURf4T2WvN0IVbznGffIqWt3G7tOCdGcZuK1Dhy/S1EuSnpx6eUFqjB5kl1haBjYyTtP
	ZChbKe0aLoPaACxaIXq89177gVEg=
X-Google-Smtp-Source: AGHT+IFh7dJFhOh/tUHYTQtTLbQ09SGHWRr+mcEFY9snalid5pSMr6ky3gCW7K4kMDga2CAL14oYoFoDAQIREnqsGao=
X-Received: by 2002:a05:600c:3c91:b0:43c:f00b:d581 with SMTP id
 5b1f17b1804b1-4406ac0fc21mr16955775e9.29.1744970276347; Fri, 18 Apr 2025
 02:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250417074952.1315641-1-bjorn@kernel.org>
In-Reply-To: <20250417074952.1315641-1-bjorn@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Apr 2025 17:57:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRv4a-sEgjAvMm8VatFpnYoTVNM1+3XVsmnh=i8TuPPw@mail.gmail.com>
X-Gm-Features: ATxdqUEP6OCbknqd91sT14FYjke3t4k3lbqWbMYYe-uTyoMA8JsVf2DWM3yq3Lk
Message-ID: <CAJF2gTTRv4a-sEgjAvMm8VatFpnYoTVNM1+3XVsmnh=i8TuPPw@mail.gmail.com>
Subject: Re: [PATCH fixes] riscv: uprobes: Add missing fence.i after building
 the XOL buffer
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_025759_466067_910868F7 
X-CRM114-Status: GOOD (  18.88  )
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMzo1MOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gVGhlIFhPTCAoZXhlY3V0ZSBvdXQtb2YtbGluZSkgYnVmZmVyIGlzIHVzZWQgdG8g
c2luZ2xlLXN0ZXAgdGhlCj4gcmVwbGFjZWQgaW5zdHJ1Y3Rpb24ocykgZm9yIHVwcm9iZXMuIFRo
ZSBSSVNDLVYgcG9ydCB3YXMgbWlzc2luZyBhCj4gcHJvcGVyIGZlbmNlLmkgKGkkIGZsdXNoaW5n
KSBhZnRlciBjb25zdHJ1Y3RpbmcgdGhlIFhPTCBidWZmZXIsIHdoaWNoCj4gY2FuIHJlc3VsdCBp
biBpbmNvcnJlY3QgZXhlY3V0aW9uIG9mIHN0YWxlL2Jyb2tlbiBpbnN0cnVjdGlvbnMuCj4KPiBU
aGlzIHdhcyBmb3VuZCBydW5uaW5nIHRoZSBCUEYgc2VsZnRlc3RzICJ0ZXN0X3Byb2dzOgo+IHVw
cm9iZV9hdXRvYXR0YWNoLCBhdHRhY2hfcHJvYmUiIG9uIHRoZSBTcGFjZW1pdCBLMS9YNjAsIHdo
ZXJlIHRoZQo+IHVwcm9iZXMgdGVzdHMgcmFuZG9tbHkgYmxldyB1cC4KR29vZCBjYXRjaCwgVGh4
IQoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKCj4KPiBGaXhlczog
NzQ3ODQwODFhYWM4ICgicmlzY3Y6IEFkZCB1cHJvYmVzIHN1cHBvcnRlZCIpCj4gU2lnbmVkLW9m
Zi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jIHwgOSArLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
dXByb2Jlcy5jCj4gaW5kZXggNGIzZGM4YmVhZjc3Li40ZmFlZjkyZGQ3NzEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKPiBAQCAtMTc2LDEzICsxNzYsNiBAQCB2b2lkIGFyY2hf
dXByb2JlX2NvcHlfaXhvbChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyB2YWRkciwK
PiAgICAgICAgICAgICAgICAgKih1cHJvYmVfb3Bjb2RlX3QgKilkc3QgPSBfX0JVR19JTlNOXzMy
Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBmbHVzaF9pY2FjaGVfcmFuZ2UoKHVuc2lnbmVkIGxv
bmcpZHN0LCAodW5zaWduZWQgbG9uZylkc3QgKyBsZW4pOwo+ICAgICAgICAga3VubWFwX2F0b21p
YyhrYWRkcik7Cj4gLQo+IC0gICAgICAgLyoKPiAtICAgICAgICAqIFdlIHByb2JhYmx5IG5lZWQg
Zmx1c2hfaWNhY2hlX3VzZXJfcGFnZSgpIGJ1dCBpdCBuZWVkcyB2bWEuCj4gLSAgICAgICAgKiBU
aGlzIHNob3VsZCB3b3JrIG9uIG1vc3Qgb2YgYXJjaGl0ZWN0dXJlcyBieSBkZWZhdWx0LiBJZgo+
IC0gICAgICAgICogYXJjaGl0ZWN0dXJlIG5lZWRzIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQg
aXQgY2FuIGRlZmluZQo+IC0gICAgICAgICogaXRzIG93biB2ZXJzaW9uIG9mIHRoZSBmdW5jdGlv
bi4KPiAtICAgICAgICAqLwo+IC0gICAgICAgZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSk7Cj4gIH0K
Pgo+IGJhc2UtY29tbWl0OiAxYTFkNTY5YTc1ZjNhYjI5MjNjYjYyZGFmMzU2ZDEwMmU0ZGYyYjg2
Cj4gLS0KPiAyLjQ1LjIKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
