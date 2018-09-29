Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DCBC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 03:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A4220671
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 03:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZlZ5TIc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6V2RsbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A4220671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBRQj1vbQtUrvwmk0TQT4OMzHd569yluqlOk69dq1wU=; b=mZlZ5TIcwE81r1
	2SjRvPxm12M4qTw19j2qQDUJ4grLL9e0tNyC8bjddmOX3iLzdWit0waEVKVcqkO9hVrwPiUALo8jy
	HGB+vEAfokoblZvhzztI75+KRhQGHaSMl9XVwI9ZfqBkqAStE7D3eI+kXLjzvhCJ4mkielGEiph4g
	lmL/RVg2mtU8b2nQF2ZakcGkBBz3n+xqN265NtVHEfOgDUjp8EeV/9sJ2uEM+dDS5UfU7C3SMrwP3
	2lyaL4dL7kMgIsdxfXxoh06oEJtfD1LwV/N/4kpIeOoCnwgJk7TbgmW/eq/mBWNEKLTsvjBe8QWyT
	ZgqcL8lc9hw39vJdmoTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g667u-0000Ae-L1; Sat, 29 Sep 2018 03:41:06 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g667r-00009R-Kl
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 03:41:05 +0000
Received: by mail-io1-xd42.google.com with SMTP id w16-v6so5611565iom.7
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 20:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T3ZcR3EmSfgXC/6CECU+ZOg5duXPeeCsMZ/Atxkqr3g=;
 b=C6V2RsbNGDsviqq71F8dpscuWQSRcwYRGIkt80yBD1+wNZmqU6cPWQfdWYWBH82G80
 y80CiGIgg4ANRW/w6xRUFknb8rQwE8zUzkk9sI/qqsOIov0k4T3j2ZILp2SYHs7nkDgk
 5fGw63l2ciSxT/cjeO3QflZijAiGGb7FfhwWQyeD0ixWF8xMMNm19vvVR53kGuDuioII
 +D8dKNVdcdJthwIId8PwCEMsZmabW6g/DQT3OkoYTLayD/2qiSsAD9KTn3za2CeSRhNt
 MlgxXPDX3dwH30+8JL3w1OI4nhP6S7gyJK01MN/tk26AozWmkrKtT1bTZkxNN0Yze+uE
 KFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T3ZcR3EmSfgXC/6CECU+ZOg5duXPeeCsMZ/Atxkqr3g=;
 b=t5AIUA6t65gAxIK2BbSUs0c71K/eNzJpYiQD7qU9fugiZyk/KOZ90JI1oQOAQGBvFw
 2Y9A7iTXQ/ytCqRLNSRbvb5APLWO3iAqf2sSXwJB5KKuJlo/4dfkK932PnxKIT6zssJE
 xYmhdZV+d2LSnSYZ71OLElCMRnqTVk0lSavW2nDpr4v5OY78nuX/32YEe9q/Vi2jG4Hh
 MWqbR0rsTcZG5JFJYFUlttOvdWQcYpJxKuJAj+qLxidWrMO6/iwwYHCpD3199PmOmgHy
 6oUqq4G3Gv8RM7uNpVi1lKoLXxZHcyjr8FQF8K8ILM+mzsU07uiKVQeTq9k1TxZFOMRx
 2NEg==
X-Gm-Message-State: ABuFfojVYPThpS2wmB6etChhB3G/tMtb/tPy/d4RrKPWkvA2omzPiPP0
 JsNDiC86ccnLMW6OVRWjVwKyMmvj2NMO6knwWf4=
X-Google-Smtp-Source: ACcGV61PZeZGEWeJRtThiY8+IL3UUB6I59OLEgs+nOr8cOD58aJ+pvgBcsL2Yc3We+IcF1HZ1JVXrPugq5fF5q6rYQc=
X-Received: by 2002:a6b:e05:: with SMTP id 5-v6mr940023ioo.141.1538192449480; 
 Fri, 28 Sep 2018 20:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537949825.git.zongbox@gmail.com>
 <mhng-1934187c-6fab-4000-af19-23a80173669d@palmer-si-x1c4>
In-Reply-To: <mhng-1934187c-6fab-4000-af19-23a80173669d@palmer-si-x1c4>
From: Zong Li <zongbox@gmail.com>
Date: Sat, 29 Sep 2018 11:40:37 +0800
Message-ID:
 <CA+ZOyagkLaikQjcwJzFumOs=o2Bhu0nzRcdb3a8fW7nT-HfprQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix some bugs on RV32 build fail and issue
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_204103_681114_7BB87FF7 
X-CRM114-Status: GOOD (  17.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong@andestech.com>, aou@eecs.berkeley.edu,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hch@infradead.org,
 Vincent Chen <vincentc@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929034037.DsMQUMZJi18Ju-aNyfZpSaj-FxTAVipjUJQya70BV7E@z>

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiDmlrwgMjAxOOW5tDnmnIgyOeaXpSDp
gLHlha0g5LiK5Y2INzo1MuWvq+mBk++8mgo+Cj4gT24gV2VkLCAyNiBTZXAgMjAxOCAwMTozMTow
OSBQRFQgKC0wNzAwKSwgem9uZ2JveEBnbWFpbC5jb20gd3JvdGU6Cj4gPiBUaGlzIHBhdGNoZXMg
Y29udGFpbiB0aGUgbW9kaWZpY2Fpb24gYXMgZm9sbG93czoKPiA+IDEuIEZpeCB1cCB0aGUgYnVp
bGRpbmcgZmFpbCBvbiBSVjMyLgo+ID4gMi4gQWRkIHVtb2RkaTMgYW5kIHVkaXZtb2RkaTQgZnVu
Y3Rpb25zIGZvciBSVjMyLgo+ID4gMy4gRml4IGlvcmVtYXAgcHJvYmxlbSBvbiBSVjMyLgo+ID4K
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgLSBSZXRhaW4gdGhlIGNvcHlyaWdodCBub3RpY2VzIGZy
b20gbGliZ2NjIGluIHVtb2RkaTMuYyBhbmQgdWRpdm1vZGRpNC5jLgo+ID4KPiA+IFZpbmNlbnQg
Q2hlbiAoMSk6Cj4gPiAgIFJJU0MtVjogQXZvaWQgY29ycnVwdGluZyB0aGUgdXBwZXIgMzItYml0
IG9mIHBoeXNfYWRkcl90IGluIGlvcmVtYXAKPiA+Cj4gPiBab25nIExpICg0KToKPiA+ICAgUklT
Qy1WOiBCdWlsZCB0aXNoaWZ0IG9ubHkgb24gNjQtYml0Cj4gPiAgIFJJU0MtVjogVXNlIHN3aW90
bGIgb24gUlY2NCBvbmx5Cj4gPiAgIGxpYjogQWRkIHVtb2RkaTMgYW5kIHVkaXZtb2RkaTQgb2Yg
R0NDIGxpYnJhcnkgcm91dGluZXMKPiA+ICAgUklTQy1WOiBTZWxlY3QgR0VORVJJQ19MSUJfVU1P
RERJMyBvbiBSVjMyCj4gPgo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgfCAgIDEgKwo+
ID4gIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCAgIDMgKwo+ID4gIGFyY2gvcmlzY3YvbGli
L01ha2VmaWxlICAgfCAgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L21tL2lvcmVtYXAuYyAgIHwgICAy
ICstCj4gPiAgbGliL0tjb25maWcgICAgICAgICAgICAgICB8ICAgMyArCj4gPiAgbGliL01ha2Vm
aWxlICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgbGliL3VkaXZtb2RkaTQuYyAgICAgICAgICB8
IDMwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
bGliL3Vtb2RkaTMuYyAgICAgICAgICAgICB8ICAzNCArKysrKwo+ID4gIDggZmlsZXMgY2hhbmdl
ZCwgMzU0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi91ZGl2bW9kZGk0LmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Vtb2RkaTMu
Ywo+Cj4gSSBsaWtlIHdoYXQgdGhpcyBkb2VzLCBidXQgdGhlcmUncyBhIGxpY2Vuc2UgaXNzdWUg
aGVyZSB0aGF0IENocmlzdG9waCBwb2ludGVkCj4gb3V0LiAgSXQnZCBiZSBncmVhdCB0byBoYXZl
IFJWMzJJIHN5c3RlbXMgYm9vdGluZyA0LjE5LCBkbyB5b3UgdGhpbmsgdGhlcmUncyBhCj4gY2hh
bmNlIHlvdSBjYW4gc29ydCB0aGlzIG91dCBuZXh0IHdlZWsgc28gd2UgY2FuIGdldCBpdCBpbnRv
IHRoZSBsYXN0IFJDPyAgVGhhdAo+IHdvdWxkIGhlbHAgd2l0aCB0aGUgcnYzMmkgZ2xpYmMgcHJv
Y2VzcywgYXMgd2UnbGwgYWN0dWFsbHkgYmUgYWJsZSB0byBib290IGFuCj4gdXBzdHJlYW0ga2Vy
bmVsLgo+Cj4gSXQgbG9va3MgbGlrZSB0aGUgZnVuY3Rpb25zIHdlIGhhdmUgYW4gaXNzdWUgd2l0
aCBjb21lIGZyb20gbGliZ2NjMi5jLCB3aGljaAo+IGRvZXNuJ3QgY2hhbmdlIHZlcnkgbXVjaC4g
IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHdlIG1pZ2h0IGJlIGFibGUgdG8gZ2V0IGF3YXkKPiB3aXRo
IHRoZXNlIGZ1bmN0aW9ucyBmcm9tIDQuMi4xLCB3aGljaCB3YXMgbGljZW5zZWQgdW5kZXIgdGhl
IEdQTHYyLiAgSGVyZSdzCj4gdGhlIHJlbGV2YW50IGZ1bmN0aW9ucyBvbiBHQ0MncyBnaXRodWIg
bWlycm9yCj4KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL2djYy1taXJyb3IvZ2NjL2Jsb2IvZ2Nj
LTRfMl8xLXJlbGVhc2UvZ2NjL2xpYmdjYzIuYyNMNTU5Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9nY2MtbWlycm9yL2djYy9ibG9iL2djYy00XzJfMS1yZWxlYXNlL2djYy9saWJnY2MyLmMjTDg0
NAo+Cj4gVGhlc2UgbG9vayB2ZXJ5IHNpbWlsYXIgdG8gd2hhdCB5b3Ugc2VuZCBvdXQuICBBcyBm
YXIgYXMgSSBjYW4gdGVsbCwgaWYgeW91Cj4gYmFzZSB5b3VyIGNvZGUgb24gdGhlIEdQTHYyIHZl
cnNpb24gdGhlbiB0aGlzIHNob3VsZCBiZSBmaW5lIHRvIGluY2x1ZGUuCj4KPiBUaGFua3MhCgpU
aGFua3MgZm9yIHRoZSBoZWxwIGFuZCB1c2VmdWwgaW5mb3JtYXRpb24uIEkgd2lsbCBtb2RpZnkg
dGhlCmltcGxlbWVudGF0aW9uIGFuZCBzdWJtaXQgdGhlIG5leHQgdmVyc2lvbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
