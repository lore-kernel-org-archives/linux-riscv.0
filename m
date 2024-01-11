Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBB2C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 20:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShskaiAc9rQC3wz03KiUaTXAfqgJj5V5tSXpCVn/gCc=; b=kYYoRWogc4Mq7C
	53/xBPx8az7KQUpAiTgemfR2F+n7Hra/CLTeSxEh1UhZRgN5MHF8X3aKrU5O6/EqrGpZJwjMRyliy
	TSYB5krycQwlPNfruLtqoEN2Pt7/6gkb4tSVCUNlImcSZvHIIxkQnVec0IWyxPP+TGtGsyuE5r1vi
	9sH4JIOqYUr0TGMXSXw6ZfFF59DRM2dt1YJuJbbCqoA99tCKp+5vVkYjjtaYbDUf2WzUmC1qgLFXX
	c0ZiSDOwPjw6FTwoLFlXyF/Ed3Xa4IHknkhzkVjxso4fEL3HnaSQPB63TlDgQbt2KLJXQ50eL+7d0
	yWhn3O5vN4oGmfcJDyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1lE-001Avq-33;
	Thu, 11 Jan 2024 20:34:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1lB-001Ar2-1V
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 20:34:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40e4afe9ea7so13945e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 12:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705005269; x=1705610069; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhucuI11iLm9jZSo5DyrLuQREbxS6U88O/YNonTCxz8=;
        b=AiPby1I+CK/5odETikMMnqq7iumjqq2LRZVAnjTm39O26DtOUWrzRcCdbF1yNXW5OW
         XernPSLsBnfcj8+V/Rje5xzVz73GBCN53NFw3GX+zK/h5wTbmHPoHUXL2mFNWqqF/7MJ
         nAEul7/5uVF1MpBiSgQOIvzK8sLvqwdWt8EbhZUUeayWnEmiwPlqvpuAI+ivYfAyv4QB
         FMMXzsUjd13OqBTOwnazYa/uENJRkP9EWcqd8SVcUadsWEJOnndMKp0+nFzVQ+8UZM6l
         MBsirGcIB8/8I6PcYj3dJEeoxf9aT0FORqcAKggY6Tq8hE/a3BJrL1MYE6KOn+Ldg7q5
         sRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705005269; x=1705610069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhucuI11iLm9jZSo5DyrLuQREbxS6U88O/YNonTCxz8=;
        b=wsCSiCNV3nuz79E2mP5hDKmAtYFv4YaFTyX8gTN9sc3t863rzdaFl5b8tMNgbRZBUf
         k/4D9usRnWZ7F+tagLmqAi1bUi0mrL7woLnE659kelB9dMOlhtRnTUNnlwJ3tPx1h/Ln
         gkszMm7YC4FM53vha9pDC6pm2YA5vpkTvLNdLqcGuLLTtNFIyiQaNO0Z62n9UHeVPl+h
         TNfPxSC3ivTf0OTwWY0p71eWzsrXfgkEj6A70Tybhgw8fWtifZjjJRvr4UH2GZpMqavT
         CGZ/dHDaO7FnvhHSfZ3494xDMETEsi/7m+7syqPplXzOH9ZCkfCY9b8lc1JjRE53+NIr
         vxsw==
X-Gm-Message-State: AOJu0Yzk5NzIvJEHvVJWQ6+1SVWaB2Vuewqs579X2w/zBp3KZUtHY4mW
	81A+xraUBIFafEIH+dh3CA2nX46TCmPfbE+VTgouejwDYD4glChy4qMEoMKMHagYbz8=
X-Google-Smtp-Source: AGHT+IEwsvtKygl+nvSOgn3WrpQlaoPEPZDIYAeAvmwuubPmfNOdEKX4uyCZcs5X4QVXtXNLJ5Llz2AVykCfzYGX6ws=
X-Received: by 2002:a05:600c:1d1f:b0:40e:61cf:af91 with SMTP id
 l31-20020a05600c1d1f00b0040e61cfaf91mr127026wms.7.1705005268801; Thu, 11 Jan
 2024 12:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org> <202401101645.ED161519BA@keescook>
In-Reply-To: <202401101645.ED161519BA@keescook>
From: Fangrui Song <maskray@google.com>
Date: Thu, 11 Jan 2024 12:34:17 -0800
Message-ID: <CAFP8O3+947djoRjnVPuPhHUHbHv_9CugufuXQ+c=N03yLsaEcA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, akpm@linux-foundation.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-efi@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, mykolal@fb.com, 
	bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_123441_524427_8D5DCA1C 
X-CRM114-Status: GOOD (  21.32  )
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

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgNDo0NuKAr1BNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDA5LCAyMDI0IGF0IDAzOjE2OjI4UE0g
LTA3MDAsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgdXBkYXRlcyBh
bGwgaW5zdGFuY2VzIG9mIExMVk0gUGhhYnJpY2F0b3IgYW5kIEJ1Z3ppbGxhIGxpbmtzCj4gPiB0
byBwb2ludCB0byBHaXRIdWIgY29tbWl0cyBkaXJlY3RseSBhbmQgTExWTSdzIEJ1Z3ppbGxhIHRv
IEdpdEh1YiBpc3N1ZQo+ID4gc2hvcnRsaW5rcyByZXNwZWN0aXZlbHkuCj4gPgo+ID4gSSBzcGxp
dCB1cCB0aGUgUGhhYnJpY2F0b3IgcGF0Y2ggaW50byBCUEYgc2VsZnRlc3RzIGFuZCB0aGUgcmVz
dCBvZiB0aGUKPiA+IGtlcm5lbCBpbiBjYXNlIHRoZSBCUEYgZm9sa3Mgd2FudCB0byB0YWtlIGl0
IHNlcGFyYXRlbHkgZnJvbSB0aGUgcmVzdCBvZgo+ID4gdGhlIHNlcmllcywgdGhlcmUgYXJlIG9i
dmlvdXNseSBubyBkZXBlbmRlbmN5IGlzc3VlcyBpbiB0aGF0IGNhc2UuIFRoZQo+ID4gQnVnemls
bGEgY2hhbmdlIHdhcyBtZWNoYW5pY2FsIGVub3VnaCBhbmQgc2hvdWxkIGhhdmUgbm8gY29uZmxp
Y3RzLgo+ID4KPiA+IEkgYW0gYWltaW5nIHRoaXMgYXQgQW5kcmV3IGFuZCBDQydpbmcgb3RoZXIg
bGlzdHMsIGluIGNhc2UgbWFpbnRhaW5lcnMKPiA+IHdhbnQgdG8gY2hpbWUgaW4sIGJ1dCBJIHRo
aW5rIHRoaXMgaXMgcHJldHR5IHVuY29udHJvdmVyc2lhbCAoZmFtb3VzCj4gPiBsYXN0IHdvcmRz
Li4uKS4KPiA+Cj4gPiAtLS0KPiA+IE5hdGhhbiBDaGFuY2VsbG9yICgzKToKPiA+ICAgICAgIHNl
bGZ0ZXN0cy9icGY6IFVwZGF0ZSBMTFZNIFBoYWJyaWNhdG9yIGxpbmtzCj4gPiAgICAgICBhcmNo
IGFuZCBpbmNsdWRlOiBVcGRhdGUgTExWTSBQaGFicmljYXRvciBsaW5rcwo+ID4gICAgICAgdHJl
ZXdpZGU6IFVwZGF0ZSBMTFZNIEJ1Z3ppbGxhIGxpbmtzCj4gPgo+ID4gIGFyY2gvYXJtNjQvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4gPiAgYXJjaC9w
b3dlcnBjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPiA+
ICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9uZXN0ZWQuYyAgICAgICAgICAgICAgICB8ICAy
ICstCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiA+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vZnRyYWNlLmggICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgYXJjaC94ODYvcG93ZXIvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gIGNyeXB0by9ibGFrZTJiX2dlbmVy
aWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBkcml2ZXJzL2Zpcm13
YXJlL2VmaS9saWJzdHViL01ha2VmaWxlICAgICAgICAgICAgICB8ICAyICstCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF80XzIuYyAgICAgICAgICAgfCAgMiArLQo+ID4g
IGRyaXZlcnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpY29kZWMvY29kZWMtZndodC5jICAgIHwgIDIg
Ky0KPiA+ICBkcml2ZXJzL3JlZ3VsYXRvci9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ID4gIGluY2x1ZGUvbGludXgvY29tcGlsZXItY2xhbmcuaCAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBsaWIvS2NvbmZpZy5rYXNhbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgbGliL3JhaWQ2L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gIGxpYi9zdGFja2luaXRf
a3VuaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBtbS9zbGFi
X2NvbW1vbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAg
bmV0L2JyaWRnZS9icl9tdWx0aWNhc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ID4gIHNlY3VyaXR5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvUkVBRE1FLnJzdCAgICAg
ICAgICAgICB8IDMyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiA+ICB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy94ZHB3YWxsLmMgICB8ICAyICstCj4gPiAgLi4uL3NlbGZ0
ZXN0cy9icGYvcHJvZ3MvdGVzdF9jb3JlX3JlbG9jX3R5cGVfaWQuYyAgfCAgMiArLQo+ID4gIDIz
IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+ID4gLS0t
Cj4gPiBiYXNlLWNvbW1pdDogMGRkM2VlMzExMjU1MDhjZDY3ZjdlNzE3MjI0N2YwNWI3ZmQxNzUz
YQo+ID4gY2hhbmdlLWlkOiAyMDI0MDEwOS11cGRhdGUtbGx2bS1saW5rcy1kMDNmOWQ2NDllMWUK
PiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiAtLQo+ID4gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPgo+ID4KPgo+IEV4Y2VsbGVudCEgVGhhbmtzIGZvciBkb2luZyB0aGlzLiBJ
IHNwb3QgY2hlY2tlZCBhIGhhbmRmdWwgSSB3YXMKPiBmYW1pbGlhciB3aXRoIGFuZCBldmVyeXRo
aW5nIGxvb2tzIGdvb2QgdG8gbWUuCj4KPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29v
a0BjaHJvbWl1bS5vcmc+Cj4KPiAtLQo+IEtlZXMgQ29vawo+CgpUaGVzZSByZXZpZXdzLmxsdm0u
b3JnIGxpbmtzIHdvdWxkIGRlZmluaXRlbHkgYmUga2VwdCBsaWtlCmh0dHBzOi8vbGlzdHMubGx2
bS5vcmcvcGlwZXJtYWlsL2xsdm0tZGV2LyBvciBjZmUtZGV2IGxpbmtzCihkaXNjdXNzaW9ucyBo
YXZlIGJlZW4gbWlncmF0ZWQgdG8gRGlzY291cnNlKS4KSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRo
ZSBnaXRodWIgcmVwbyBsaW5rIGxvb2tzIG1vcmUgb2ZmaWNpYWwuIEkgaGF2ZQpjbGlja2VkIGEg
ZmV3IGxpbmtzIGFuZCB0aGV5IGxvb2sgZ29vZC4KClNpbmNlIEkgbWFpbnRhaW4gcmV2aWV3cy5s
bHZtLm9yZyBhbmQgY3JlYXRlZCB0aGUgc3RhdGljIGFyY2hpdmUgWzFdLAoKQWNrZWQtYnk6IEZh
bmdydWkgU29uZyA8bWFza3JheUBnb29nbGUuY29tPgoKWzFdOiBodHRwczovL2Rpc2NvdXJzZS5s
bHZtLm9yZy90L2xsdm0tcGhhYnJpY2F0b3ItdHVybmRvd24vNzYxMzcKCi0tIArlrovmlrnnnb8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
