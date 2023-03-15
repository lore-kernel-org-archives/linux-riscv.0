Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CF7C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=I0AVy8WxSxFQ6mWGw7WnYwO3ZB8Theh624mmBRh89OU=; b=4EehFZGcEo5JVAT9Zbg2fgQxSn
	PflIqBuvQ9AxD5qd9SVFCD0nsDh6RU4mP41YNMPIG5ofqHzeC2R24GLv3k5NcFrBV3iXI25flKXlf
	6m3Ddl/g2F8hISuDjWMIVpekWHFk16ad7dh+JD8C1lUhe7OqIKpG+7FQnhApZlsszZT5opG+sk2Zt
	qORFZs0bbmccQaJwOmpEZGpQhijdcRRDTjhTpkCkz8UlX6ucq5z1rXaDQz4GGviU9bylNZMzgO6RA
	xTojorKrJcZw1BhotCR1qWXH/8ynVUREg7x+3lJFT1vQxBvTZlx4bTTZQgCWvV5gvacUdCavZ39+V
	VH3al+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIHf-00CDoM-09;
	Wed, 15 Mar 2023 03:58:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIHa-00CDmz-2C
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:58:36 +0000
Received: by mail-pg1-x52c.google.com with SMTP id d8so10084977pgm.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678852713;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HYuR6tFCyvgHrmckJ1l2C1M5Y1KFC1xHbhtrJS6kSw=;
        b=EC97TzW0CrEe5hSuqkySlThCvA6rC8OWWPnB07b8u+eFPQzG24z7QLN+nSl2Ol+Fpf
         y7ndCuRq3L5iY9cZSJkEEH4ef9/uRN8WXYZiHPwscaeosQengEA6jDmcQsqpW35ibkY9
         Q9BoJ0wB+1ga3hkv5NC5zYwRApnaHXjlcLTDwnZiqrcWKk0Cox0+tUKYDeaOpvh1K75c
         /v14KaYuetjNlrxyFFq76zIgePJ8+O+WbnyB7hpqZp9zBAQ6w2Y1hwIrUUF52Qt36O3D
         N1dhqty7K6t1DM/1tLNAiPIXYbRJQcwqDDByltdDzCxTKMA6bjNOuj8QY/IqNwnOOWPb
         WMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678852713;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HYuR6tFCyvgHrmckJ1l2C1M5Y1KFC1xHbhtrJS6kSw=;
        b=0nWnFxJyLOhn4BtILRLgPkhs5FfFYZXYxunxpJ7Q/xJnv3hu2tGntAYe0iS6968jEJ
         3gITLT24ULliHq7ifN2fnDKfIDLtK6GkNLT2NFulbmcZcLyzN9C25OVVF6wi7AeDHvUr
         w5e7aX0uS44VbSbdSmp9VzFxdQ/6mWCVdHTXlN865Xu9DNbpphVU0UZYGpuuzVdfnVvO
         iOdYsDtD6K39A1P1jn5dSOM9Wx4OolWBn/J660Y0T4bynFvVFSszyzZAweDob5hmje3l
         sIbPT/cmMdc82Co5/oEtcJSI0TTi8ioty0pScHqJwyvL13aABdg043iBvgORa+S5NcKR
         Gr5g==
X-Gm-Message-State: AO0yUKUPYYsF81cbrmykZhgaraeREw4WohPXdO4vKX9XfBFHoA7GUgd4
	0cf9yPSriuO8W/lBooIqCPvyLObzBKwz30LrYbs=
X-Google-Smtp-Source: AK7set/f279w0PNYnzk8p6eaHIA+U2s7JSlU+MedS2TRqoMtPOHNLMkoP1Vc2Z7oekBIxmo0doQfaw==
X-Received: by 2002:a62:8415:0:b0:625:500c:35bd with SMTP id k21-20020a628415000000b00625500c35bdmr6675421pfd.6.1678852712976;
        Tue, 14 Mar 2023 20:58:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g21-20020aa78755000000b0059442ec49a2sm1143241pfo.146.2023.03.14.20.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:58:32 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:58:32 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 20:57:37 PDT (-0700)
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
In-Reply-To: <d641459e-c52b-c42e-dfcb-77bb978414f8@kernel.org>
CC: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: gerg@kernel.org, damien.lemoal@opensource.wdc.com, macro@orcam.me.uk
Message-ID: <mhng-a62a57b8-4268-4c51-b79e-f5f6bd0c13a2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_205834_785634_0BDADFD4 
X-CRM114-Status: GOOD (  27.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBGZWIgMjAyMyAxNjoyMDozNSBQU1QgKC0wODAwKSwgZ2VyZ0BrZXJuZWwub3Jn
IHdyb3RlOgo+IEhpIFBhbG1lciwKPgo+IE9uIDEvMy8yMyAwNzo1MiwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4+IE9uIFR1ZSwgMjggRmViIDIwMjMgMDU6NTE6MjQgUFNUICgtMDgwMCksIGdlcmdA
a2VybmVsLm9yZyB3cm90ZToKPj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBhZGQgdGhlIGFiaWxp
dHkgdG8gcnVuIEVMRiBmb3JtYXQgYmluYXJpZXMgd2hlbgo+Pj4gcnVubmluZyBSSVNDLVYgaW4g
bm9tbXUgbW9kZS4gVGhhdCBzdXBwb3J0IGlzIGFjdHVhbGx5IHBhcnQgb2YgdGhlCj4+PiBFTEYt
RkRQSUMgbG9hZGVyLCBzbyB0aGVzZSBjaGFuZ2VzIGFyZSBhbGwgYWJvdXQgbWFraW5nIHRoYXQg
d29yayBvbgo+Pj4gUklTQy1WLgo+Pj4KPj4+IFRoZSBmaXJzdCBpc3N1ZSB0byBkZWFsIHdpdGgg
aXMgbWFraW5nIHRoZSBFTEYtRkRQSUMgbG9hZGVyIGNhcGFibGUgb2YKPj4+IGhhbmRsaW5nIDY0
LWJpdCBFTEYgZmlsZXMuIEFzIGNvZGVkIHJpZ2h0IG5vdyBpdCBvbmx5IHN1cHBvcnRzIDMyLWJp
dAo+Pj4gRUxGIGZpbGVzLgo+Pj4KPj4+IFNlY29uZGx5IHNvbWUgY2hhbmdlcyBhcmUgcmVxdWly
ZWQgdG8gZW5hYmxlIGFuZCBjb21waWxlIHRoZSBFTEYtRkRQSUMKPj4+IGxvYWRlciBvbiBSSVND
LVYgYW5kIHRvIHBhc3MgdGhlIEVMRi1GRFBJQyBtYXBwaW5nIGFkZHJlc3NlcyB0aHJvdWdoIHRv
Cj4+PiB1c2VyIHNwYWNlIHdoZW4gZXhlY2luZyB0aGUgbmV3IHByb2dyYW0uCj4+Pgo+Pj4gVGhl
c2UgY2hhbmdlcyBoYXZlIG5vdCBiZWVuIHVzZWQgdG8gcnVuIGFjdHVhbCBFTEYtRkRQSUMgYmlu
YXJpZXMuCj4+PiBJdCBpcyB1c2VkIHRvIGxvYWQgYW5kIHJ1biBub3JtYWwgRUxGIC0gY29tcGls
ZWQgLXBpZSBmb3JtYXQuIFRob3VnaCB0aGUKPj4+IHVuZGVybHlpbmcgY2hhbmdlcyBhcmUgZXhw
ZWN0ZWQgdG8gd29yayB3aXRoIGZ1bGwgRUxGLUZEUElDIGJpbmFyaWVzIGlmCj4+PiBvciB3aGVu
IHRoYXQgaXMgc3VwcG9ydGVkIG9uIFJJU0MtViBpbiBnY2MuCj4+Pgo+Pj4gVG8gYXZvaWQgbmVl
ZGluZyBjaGFuZ2VzIHRvIHRoZSBDLWxpYnJhcnkgKHRlc3RlZCB3aXRoIHVDbGliYy1uZwo+Pj4g
Y3VycmVudGx5KSB0aGVyZSBpcyBhIHNpbXBsZSBydW50aW1lIGR5bmFtaWMgbG9hZGVyIChpbnRl
cnByZXRlcikKPj4+IGF2YWlsYWJsZSB0byBkbyB0aGUgZmluYWwgcmVsb2NhdGlvbnMsIGh0dHBz
Oi8vZ2l0aHViLmNvbS9ncmVndW5nZXJlci91bGRzby4KPj4+IFRoZSBuaWNlIHRoaW5nIGFib3V0
IGRvaW5nIGl0IHRoaXMgd2F5IGlzIHRoYXQgdGhlIHNhbWUgcHJvZ3JhbQo+Pj4gYmluYXJ5IGNh
biBhbHNvIGJlIGxvYWRlZCB3aXRoIHRoZSB1c3VhbCBFTEYgbG9hZGVyIGluIE1NVSBsaW51eC4K
Pj4+Cj4+PiBUaGUgbW90aXZhdGlvbiBoZXJlIGlzIHRvIHByb3ZpZGUgYW4gZWFzeSB0byB1c2Ug
YWx0ZXJuYXRpdmUgdG8gdGhlCj4+PiBmbGF0IGZvcm1hdCBiaW5hcmllcyBub3JtYWxseSB1c2Vk
IGZvciBSSVNDLVYgbm9tbXUgYmFzZWQgc3lzdGVtcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBH
cmVnIFVuZ2VyZXIgPGdlcmdAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4KPj4+IMKgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lbGYuaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTEgKysrKysrKysrLQo+
Pj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5owqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
IDQgKysrCj4+PiDCoGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCB8wqDCoMKg
IDUgKysrKwo+Pj4gwqBmcy9LY29uZmlnLmJpbmZtdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqAgMiAtCj4+PiDCoGZzL2JpbmZtdF9lbGZfZmRwaWMuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzOCArKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQo+Pj4gwqBpbmNsdWRlL2xpbnV4L2VsZi1mZHBpYy5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCAxNCArKysrKysrKysrKy0KPj4+IMKgaW5jbHVkZS91YXBpL2xpbnV4
L2VsZi1mZHBpYy5owqDCoMKgwqDCoMKgIHzCoMKgIDE1ICsrKysrKysrKysrKysKPj4+IMKgNyBm
aWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gQWRk
aW5nIERhbWllbiwgYXMgSUlSQyBoZSdzIGhhZCBzb21lIGhhY2tlZCB1cCB1c2Vyc3BhY2UgYml0
cyBmb3IgdGhlIEsyMTAuwqAgSSdtIHlldCB0byBnZXQgYW55dGhpbmcgcnVubmluZywgYnV0IGl0
J2QgYmUgZ3JlYXQgaWYgd2UgZ2V0IHRoaXMgdG8gYSBwb2ludCB3aGVyZSBJIGNhbiBhY3R1YWxs
eSBib290IHRlc3QgdGhpcyBvbiBRRU1VIChJJ20ganVzdCBkb2luZyBidWlsZHMgbm93KS4KPgo+
IFRoaXMgaXMgYSBzaW1wbGUgc2NyaXB0IEkgdXNlciB0byBnZW5lcmF0ZSBhIHdvcmtpbmcgUUVN
VSBleGFtcGxlOgo+Cj4gICAgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2dyZWd1
bmdlcmVyL3NpbXBsZS1saW51eC9tYXN0ZXIvYnVpbGQtcmlzY3Zub21tdS1saW51eC11Y2xpYmMt
ZWxmLnNoCj4KPiBJdCBkb2VzIHJlZmVyZW5jZSBzb21lIGNvbmZpZ3MgaGVyZSBodHRwczovL2dp
dGh1Yi5jb20vZ3JlZ3VuZ2VyZXIvc2ltcGxlLWxpbnV4L3RyZWUvbWFzdGVyL2NvbmZpZ3MKPiBh
bmQgdGhpcyBwb3N0ZWQgcGF0Y2hzZXQgYXMgaHR0cHM6Ly9naXRodWIuY29tL2dyZWd1bmdlcmVy
L3NpbXBsZS1saW51eC90cmVlL21hc3Rlci9wYXRjaGVzICh0aGlzIGlzCj4ganVzdCB0aGVzZSAy
IHBhdGNoZXMgY29tYmluZWQgYXMgYSBzaW5nbGUgcGF0Y2gpLgo+Cj4KPj4gR2l2ZW4gdGhhdCBp
dCdzIHRoZSBzZWNvbmQgd2VlayBvZiB0aGUgbWVyZ2Ugd2luZG93IGFuZCB0aGlzIGlzIGEgYnVu
Y2ggb2YgbmV3IHVBQkkgaXQgc2VlbXMgYmVzdCB0byBob2xkIG9mZiB1bnRpbCB0aGUgbmV4dCBj
eWNsZS7CoCBJIHBva2VkIGFyb3VuZCBhbmQgZG9uJ3Qgc2VlIGFueXRoaW5nIHdyb25nLCBidXQg
SSdsbCB0cnkgYW5kIHRha2UgYSBtb3JlIGRldGFpbGVkIGxvb2sgYWZ0ZXIgdGhlIG1lcmdlIHdp
bmRvdy4KPgo+IE9oLCB5ZWFoLCBubyBodXJyeS4KCk1hY2llaiBhbmQgRGFtaWVuOiBJJ20gZmlu
ZSB0YWtpbmcgdGhpcywgYnV0IG5vdCBpbiBhbnkgcnVzaC4gIEknZCAKcmF0aGVyIGdldCB0aGUg
dUFCSSByaWdodCBpZiB0aGluZ3MgYXJlIHN0aWxsIGluIGZsaWdodCwgYnV0IGlmIHdlJ3JlIAph
bGwganVzdCB3YWl0aW5nIGZvciBzb21ldGhpbmcgdG8gZ2V0IG1lcmdlZCBmaXJzdCB0aGVuIEkn
bSBmaW5lIHdpdGggCnRoYXQgYmVpbmcgTGludXguCgo+Cj4gUmVnYXJkcwo+IEdyZWcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
