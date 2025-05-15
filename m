Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6081FC54754
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akhkpuedMqMEg1SdUnR+zdIZMCBN5jZJt1FYRyx8g30=; b=qqaTA6yMBBzS65
	+tNfHhXEHXelRcAQKzNTPI2GB0sGxKMKKBUC8g3nDviITjGFFPwheaUCSnT5Wxu/0z/1JPmR7cUDt
	jnuQslGL/f6bM0042oT/v5d/vyxrUMYMrDpaJSxE4s0zKaH6Ex1jQDIPgXbtUsDfG2yFhWyGjD55B
	TVG5NZqK+FyLppmS+bh2cg28rzA6fK4FnAJ6scOjjpi1xzRoa17xu4IR4ntnx7Azy1EXZLGRfUlTb
	S5o4pPRdlpgqM+pG6WtbzgTIA3Sksl6f5b2aeINWnB9YLuZ0NIusbJ3dGAJ+3H/4JgT5ucd6N0hT3
	a6mBT+UU69fE2+kd/eWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSTF-0000000HCGZ-3PdU;
	Thu, 15 May 2025 06:53:33 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSFj-0000000HAZt-3GcZ
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 06:39:37 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3db703f0fe7so1261725ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747291175; x=1747895975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x2m3RSAmWZBZEj+PaQZiQeaOOx6B+ozKMgLfoFz30Q=;
        b=MdYORRsNNZ6CW1b7UWeGSCMGf9QJbUt5jQGgO5hN8e1xk1Sn5L1zZoYji28OZytvhY
         8BCFwFeXygFNkMm1baz1MCyde4HZ6DZTA6KVO39v0RRKwCXrAj0dPbP4a/T/8oVd8QHh
         2Ky/hUcnWhdXXVIsz/s/mf8+kXUpXIpZTopP7bVp7egx+bmVQXr8IxVb3Kkybfn0/qFM
         dhmnLcJdEREuHT4KCOJYBX8fnoaH5z3/NODeEtpG9zAAetULr5Ebug+e5bq4h3Exjwf5
         eOiJ6YwvxuNXk9vLCUJ4D2j6sRvEPNk2tay8AyqPzZoSeIJlhOMEAGpehREGcTJ+55Nq
         PXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747291175; x=1747895975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7x2m3RSAmWZBZEj+PaQZiQeaOOx6B+ozKMgLfoFz30Q=;
        b=ZQ5oJ3DO3m9gAgp08e0lb58yRNmO3WfGYNV11jonwY4FH/WhqWc0RaxXDnlGbsovU1
         VI5J9IOlX84Y0dZB1B3PLubKBqec+EeKiiwIjMRBOxh/hHXXaOA2BFJ0lKNPpWlCFPKH
         M15IP15I3tayCJTL/Xr1q1beBhxtueJGUNqG7kzgRSLcv5u9Z9jzpcrSViUH7T4nXS8j
         1ovIHt+XP8Y5B3oIySrs1wjXRq3BGp/FGb2gt4mvleVOMRJT+WTQG/hew4tT2Xc5xyoF
         5wIncH/KxFcN+I8NUrQWmlsSg/ikhiDPZ3yS8Mksk4LEEz17ypgTJnmOosaEHqQlmwG0
         FDcA==
X-Forwarded-Encrypted: i=1; AJvYcCW2VTa2Mb3oh1CxdTMkaslMnJv42suU5OoIOG99Znkfoajnm0e/R3BnUeBKb9iJC3vwoPIkdnuEMGmNMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3+C5EKzQbNuTA4NI3x69By/ZMPGchFk/8V43ghurrRsjvmtGP
	xeRXvNhJe3VP9ljFl1PWRxO0/+VBx8/2uB/xMrhvM4YlJt4oKq2GHbcTO8Ukbf7Qo9hoGiRORPB
	HobwWzUvGhCWBzFLgT9yfPUNYuvToIK3TP+m7GQ==
X-Gm-Gg: ASbGncsguUgDCs8ycn75vCm8hQV7un4wCbNheM3fiECDpHw21k1RqyqUlJunLA9ix/i
	PFl8SNPbME6AmfjM3HYzrBqrgIqV9FVX7hHRg9LAooCa2oPmUGuP7sAAXv3zGD6iUyvbMWPEA2N
	InnK4cTrXpTHEuTiyo0cjkXj8Srzc3HJ4CzbR6hgB4dg==
X-Google-Smtp-Source: AGHT+IEeu0D8pHDHQW5TccqTotTBLOJ+RWC9pPxTNl5GwhC0PZ74BmZbAawuwwiBLjonxVe4alewTE5daIMupBgB4BE=
X-Received: by 2002:a05:6e02:168c:b0:3d3:fdb8:1792 with SMTP id
 e9e14a558f8ab-3db6f7f199bmr60062105ab.14.1747291174762; Wed, 14 May 2025
 23:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250514171320.3494917-1-abrestic@rivosinc.com>
In-Reply-To: <20250514171320.3494917-1-abrestic@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 12:09:22 +0530
X-Gm-Features: AX0GCFvnkuONjW0g2to7KR73aQzmZtKG3JnmQAUt22P4CHLpD5Tq4AlRij675Uk
Message-ID: <CAAhSdy2nb0siV-oE8gDQLVdAnMzw2TQqYOSK6SXZqxzYBCqM0Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct CPU
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_233935_815445_D7E90D7C 
X-CRM114-Status: GOOD (  19.08  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTA6NDPigK9QTSBBbmRyZXcgQnJlc3RpY2tlcgo8YWJy
ZXN0aWNAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFdoZW4gc3RhcnRpbmcgdGhlIGxvY2FsIHN5
bmMgdGltZXIgdG8gc3luY2hyb25pemUgdGhlIHN0YXRlIG9mIGEgcmVtb3RlCj4gQ1BVIGl0IHNo
b3VsZCBiZSBhZGRlZCBvbiB0aGUgQ1BVIHRvIGJlIHN5bmNocm9uaXplZCwgbm90IHRoZSBpbml0
aWF0aW5nCj4gQ1BVLiBUaGlzIHJlc3VsdHMgaW4gaW50ZXJydXB0IGRlbGl2ZXJ5IGJlaW5nIGRl
bGF5ZWQgdW50aWwgdGhlIHRpbWVyCj4gZXZlbnR1YWxseSBydW5zIChkdWUgdG8gYW5vdGhlciBt
YXNrL3VubWFzay9taWdyYXRlIG9wZXJhdGlvbikgb24gdGhlCj4gdGFyZ2V0IENQVS4KPgo+IEZp
eGVzOiAwZjY3OTExZTgyMWMgKCJpcnFjaGlwL3Jpc2N2LWltc2ljOiBTZXBhcmF0ZSBuZXh0IGFu
ZCBwcmV2aW91cyBwb2ludGVycyBpbiBJTVNJQyB2ZWN0b3IiKQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBCcmVzdGlja2VyIDxhYnJlc3RpY0ByaXZvc2luYy5jb20+CgpNeSBiYWQuIFRoYW5rcyBm
b3IgY2F0Y2hpbmcgdGhlIGlzc3VlLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXN0YXRlLmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1zdGF0ZS5jCj4gaW5kZXggYmRmNWNkMjAzN2YyLi42MmY3Njk1MGExMTMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gQEAgLTIwOCwxNyArMjA4
LDE3IEBAIHN0YXRpYyBib29sIF9faW1zaWNfbG9jYWxfc3luYyhzdHJ1Y3QgaW1zaWNfbG9jYWxf
cHJpdiAqbHByaXYpCj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+IC1zdGF0aWMgdm9pZCBf
X2ltc2ljX2xvY2FsX3RpbWVyX3N0YXJ0KHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdikK
PiArc3RhdGljIHZvaWQgX19pbXNpY19sb2NhbF90aW1lcl9zdGFydChzdHJ1Y3QgaW1zaWNfbG9j
YWxfcHJpdiAqbHByaXYsIHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAgICAgICAgIGxvY2tkZXBf
YXNzZXJ0X2hlbGQoJmxwcml2LT5sb2NrKTsKPgo+ICAgICAgICAgaWYgKCF0aW1lcl9wZW5kaW5n
KCZscHJpdi0+dGltZXIpKSB7Cj4gICAgICAgICAgICAgICAgIGxwcml2LT50aW1lci5leHBpcmVz
ID0gamlmZmllcyArIDE7Cj4gLSAgICAgICAgICAgICAgIGFkZF90aW1lcl9vbigmbHByaXYtPnRp
bWVyLCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ICsgICAgICAgICAgICAgICBhZGRfdGltZXJfb24o
Jmxwcml2LT50aW1lciwgY3B1KTsKPiAgICAgICAgIH0KPiAgfQo+ICAjZWxzZQo+IC1zdGF0aWMg
aW5saW5lIHZvaWQgX19pbXNpY19sb2NhbF90aW1lcl9zdGFydChzdHJ1Y3QgaW1zaWNfbG9jYWxf
cHJpdiAqbHByaXYpCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2ltc2ljX2xvY2FsX3RpbWVyX3N0
YXJ0KHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdiwgdW5zaWduZWQgaW50IGNwdSkKPiAg
ewo+ICB9Cj4gICNlbmRpZgo+IEBAIC0yMzMsNyArMjMzLDcgQEAgdm9pZCBpbXNpY19sb2NhbF9z
eW5jX2FsbChib29sIGZvcmNlX2FsbCkKPiAgICAgICAgIGlmIChmb3JjZV9hbGwpCj4gICAgICAg
ICAgICAgICAgIGJpdG1hcF9maWxsKGxwcml2LT5kaXJ0eV9iaXRtYXAsIGltc2ljLT5nbG9iYWwu
bnJfaWRzICsgMSk7Cj4gICAgICAgICBpZiAoIV9faW1zaWNfbG9jYWxfc3luYyhscHJpdikpCj4g
LSAgICAgICAgICAgICAgIF9faW1zaWNfbG9jYWxfdGltZXJfc3RhcnQobHByaXYpOwo+ICsgICAg
ICAgICAgICAgICBfX2ltc2ljX2xvY2FsX3RpbWVyX3N0YXJ0KGxwcml2LCBzbXBfcHJvY2Vzc29y
X2lkKCkpOwo+Cj4gICAgICAgICByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbHByaXYtPmxv
Y2ssIGZsYWdzKTsKPiAgfQo+IEBAIC0yNzgsNyArMjc4LDcgQEAgc3RhdGljIHZvaWQgX19pbXNp
Y19yZW1vdGVfc3luYyhzdHJ1Y3QgaW1zaWNfbG9jYWxfcHJpdiAqbHByaXYsIHVuc2lnbmVkIGlu
dCBjcHUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAg
ICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIF9faW1zaWNfbG9jYWxfdGltZXJfc3RhcnQo
bHByaXYpOwo+ICsgICAgICAgICAgICAgICBfX2ltc2ljX2xvY2FsX3RpbWVyX3N0YXJ0KGxwcml2
LCBjcHUpOwo+ICAgICAgICAgfQo+ICB9Cj4gICNlbHNlCj4gLS0KPiAyLjQzLjAKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
