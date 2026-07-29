Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D199C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKIFWo4vaYvXT6MUcGKnyKQcG/9lg6IQl1F4KOJQotg=; b=3rj/4CEZksO8TQ
	Lr7cPWvszYbJBE9G0gTyIh3Wm0jJTNSBPXHdpHCHmfJpAOrJp34YGuXgVTtdvsLyZgssynuRNhKUt
	S+tJAR/LSZfypulEUqwGTR5u1VBtkai/Q+cSPVxV0w6oILl0PoOihdvbEGlLCz3ljHa98vssHc5Qr
	9+JrEC8ps/r3RGGovo5NsFLDWJg+PTnUg4sdqUKb5DSVKdv6sstMQDq/wFtM9bEdRN06p0J9NY/Z7
	FMgJAf+yh2DznjVAdHEGHp/UmohxUJSOL+6e6Mqlgm8usZYgkKzlDCTMAYUFprnwRu+xwqMKKmzsP
	eTOvu+68HdryvOvWs9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7iv-00000008e86-3hNM;
	Wed, 29 Jul 2026 17:05:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7it-00000008e6z-0nSq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:05:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f97d310caso1207801f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 10:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785344737; cv=none;
        d=google.com; s=arc-20260327;
        b=mM2VVfjkWVmgzI0vswEMxRqsLEkJzEqWHORGUFIMQTuCrs3hz26TAudwWX5hytPWCG
         13Mqmb2imj/goPQuY8NfJTKg3RE4GlZujqYE+Gw3mFbBlYuVI1y0feSwFglC4UwJngGM
         k5KdOrX2L1xMdjf3Kv4+yB0902s/xfUKDzLzvmgdisDm/t9tsE7t8RcmdgXSsM72GTRf
         Clizo0fag+JqAXBIUU7Y7vE/43Hqle805PBM+R31YBPEyS3aDhZt+XZk0bz29Ua5xIDo
         wzhhkEb++BITc5mJwDhfkpNe190ApB8nqZzu4n9RsRAG/nhtjIysQCgg/H1dZ39yYefw
         BzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        fh=tidEl/WSBf96VCaEyCaK/RHy0mN4ZmvkORSTQVUpbVc=;
        b=m0qPrAwD8p9WxoGZZhw/k3ii6ndIkbSx/Hd/Z082Rr9KIArwhuBSa3eD9uIuRTa07u
         R7GqGW/5uaBOGZgNCPIJ+vEzVdNNkH3OsLp+nX/APIKd4AI0mKokPfnHECRWGAl/Nuju
         JZwGlzR/Nq+6gSmOrhnDS9ceaIWsaCQ9vwTZoyxK0jSISUCS8BgdACoiacv9+jp/4gWm
         +xdFpC9Kicf1KoLFY6nVJx9bXhSAl+SqYp+77U8CieYE9A2CSKYR5oFTlrGnNQ0yDkAl
         YUut6uHsf/z9RL2S1XI9WjeYH56LyMLWPgwdvmvHggPZ+dt4mmKdvxYflh0i4ivrqmgR
         MEfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785344737; x=1785949537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        b=Q27SFv8hPXWEUWf1qUymeIX+y3mdPOQWaNd/i5ShZ53iY3jbR80ueGAmD9RTJPdmvI
         4PHO0TKjOmMKSeeTJxxxnFhyAP9FQTvK7SKNTaZ0wQkTcbGfAHzK346M5JqkQuQga52p
         Ex6ZMFuouJHM3NjUMfm3cwye8vdJ819aboJO7Rs76A77rHl57ASO1J8GgBv07rBoq1Lg
         /k0kolId6ue18UD+uScbwbHabE7tZfho1hecYO+xu7bkmI4vuiShk/YwY8NBuXUNh5Lh
         InoKi/qQ++WtnOttSFH42Wcvl7je7t5nHoRJsfr7Q+WGgKyuEuh9cROZVl5jW/ftolLo
         GVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344737; x=1785949537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMtP5Omajqf4t0e1+zEGN1nUMmV4lfG68xLAZ3F1QR0=;
        b=KmU2nWFZ+Fa6oX6mP3liaTemjbLq4+6XnPALUuRfHwyuP3ZVk3iLCIABgM09pmEDjx
         q83u7kqcMa/mnVSgKaRNfDBKtnMcySincl6zXAIRe/+V7PHNVHqvzDSLpbBNmdzxhyv5
         3d3QZHBda4SaSWt73tt5oPcJWZOaLIUI08d4l52BBU0DzxqV7vfEs8FHMGOL8PKpTw9r
         28bxmzA2k3av9U/9zneO8CRDdPFruWfVYNFWzgub0ETqiHxWMehlLMZDa1QGJEonYrG4
         GAKTa32LNC5gRvEZ1CB2Q2nyUuVIlT2JVC1o8cP75AshICkaI9HqaLJVI4oAwKVDcXt1
         dm5A==
X-Forwarded-Encrypted: i=1; AHgh+RrGiloWkj0U612AiIG5x9+n1/7YtYgu741Dh9ldP/gwFIgKBLwQFwWoWnjHXsGnk9rESkih3GC4/SfocA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKWyZ6JgFxWJfn7s/JGHF3e6Hm8hzytG7buO2xdJdsYTEm2mUA
	oL7552poJ1NpUuFJOqOVkwBD0DGmdxtO3YwB+4Zp0kzAKUOmLaob7syBBrYTXf0TeosFOTFtpXH
	fM5rvfqmau1GQiyF59iMKSVC5hnwmeCHBFoNxXtqECg==
X-Gm-Gg: AR+sD10QjIGqRlHBIKIR5Ro6zyF1TXnyp7VHnaUUG9NJde5KvIX+jf+SFKX9NArYEQq
	dbj/iAJOwMbCv8dglojE5RAejxQW5FNLw37WKyTiutExZFfvG1Uo4slHXF6pXAGAPlMX8xLrucV
	BBPTzGIAdNbduWaqEYywCQRZXhsGG5LxOIvIUdhuCfyHlyhPhEB9xMYdzZlnua4/YH0cwakuvQv
	GuI3PN3txWdRqJLLh84PHUeJAguzewHma2sneFMknr3xII3wMMxy+cIA80YKiGItb1DItSFhKMZ
	hyjG8RHqI1lAlYOwBE9kBu5uzgyyMuJhtYHhSvYQdq2mMCKkIq8jLXLQ6Ur9DdH75Cy/iqEGbgJ
	W1Zl8KdeXCHK/Cg8F7f5TgNM/Blm1brk/aRK9aSEV3QEHyRSBUTMl+Fid0baNR2JQL9CWM0rSyd
	Q=
X-Received: by 2002:a5d:5f53:0:b0:47f:91e3:3cc9 with SMTP id
 ffacd0b85a97d-47fb1ecddc6mr9504645f8f.39.1785344736564; Wed, 29 Jul 2026
 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260728141938.95845-1-yang.yicong@picoheart.com>
In-Reply-To: <20260728141938.95845-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 22:35:25 +0530
X-Gm-Features: AUfX_mylMRmMHsP9q6CuBjLim_iNkPGTC4Rz3L9UjAHJiq8sx9HavOSQJCr973s
Message-ID: <CAAhSdy16iej14cfBAoU6Xdkadnq8bprU0tb0+rdJK6nX7EOQiQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, geshijian@picoheart.com, 
	shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_100539_252299_A07CBE03 
X-CRM114-Status: GOOD (  17.92  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgNzo0OeKAr1BNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB0aGUgUk1XIGZvciBJTVNJQyBN
UklGIGlzIGltcGxlbWVudGVkIHdpdGgKPiB3b3JkIExSU0MgbG9vcC4gVGhpcyB3aWxsIG9ubHkg
Y292ZXIgdGhlIGxvd2VyIDMyYml0Cj4gb24gYSA2NGJpdCBzeXN0ZW0uIEluc3RlYWQgb2YgZ3Vh
cmQgdGhlIGltcGxlbWVudGF0aW9uCj4gd2l0aCBDT05GSUdfNjRCSVQgaGVyZSwgdXNlIHRyeV9j
bXB4Y2hnKCkgd3JhcHBlcgo+IHdoaWNoIGhhcyBhbHJlYWR5IHRha2UgY2FyZSB0aGlzIHRvIGZp
eCB0aGlzIGlzc3VlLgo+IEl0IGNhbiBhbHNvIHVzZSBBTU8gaW5zdHJ1Y3Rpb25zIG9uIHN1cHBv
cnRlZCBzeXN0ZW0uCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBTaWduZWQtb2ZmLWJ5OiBZ
aWNvbmcgWWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZv
ciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmMgfCAxNSArKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggZDM4ZjVkZTA4MzRj
Li5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC0yMjAsMTUgKzIyMCwxMiBA
QCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19ybXcoc3RydWN0IGltc2lj
X21yaWYgKm1yaWYsCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2xkX3ZhbCA9IDAsIHRt
cCA9IDA7Cj4KPiAtICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPiAtICAgICAgICAgICAg
ICAgIjA6ICAgICBsci53LmFxICAgJTEsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAg
YW5kICAgICAgICUyLCAlMSwgJTNcbiIKPiAtICAgICAgICAgICAgICAgIiAgICAgICBvciAgICAg
ICAgJTIsICUyLCAlNFxuIgo+IC0gICAgICAgICAgICAgICAiICAgICAgIHNjLncucmwgICAlMiwg
JTIsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAgYm5leiAgICAgICUyLCAwYiIKPiAt
ICAgICAgICAgICAgICAgOiAiK0EiICgqcHRyKSwgIityIiAob2xkX3ZhbCksICIrciIgKHRtcCkK
PiAtICAgICAgICAgICAgICAgOiAiciIgKH53cl9tYXNrKSwgInIiIChuZXdfdmFsICYgd3JfbWFz
aykKPiAtICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICBuZXdfdmFsICY9IHdy
X21hc2s7Cj4gKwo+ICsgICAgICAgb2xkX3ZhbCA9IFJFQURfT05DRSgqcHRyKTsKPiArICAgICAg
IGRvIHsKPiArICAgICAgICAgICAgICAgdG1wID0gKG9sZF92YWwgJiB+d3JfbWFzaykgfCBuZXdf
dmFsOwo+ICsgICAgICAgfSB3aGlsZSAoIXRyeV9jbXB4Y2hnKHB0ciwgJm9sZF92YWwsIHRtcCkp
Owo+Cj4gICAgICAgICByZXR1cm4gb2xkX3ZhbDsKPiAgfQo+IC0tCj4gMi41MC4xIChBcHBsZSBH
aXQtMTU1KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
