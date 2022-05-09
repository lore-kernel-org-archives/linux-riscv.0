Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAF7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zx8ANxiAN8Dy9pXZeUiTtOreqhd089PgOTsgL8wUXdQ=; b=c6j4Qx6jSe3ee7
	Qt40VnbXIbiIIxL6oW8SHt6OU/OG/FNj/v9dmpM3XOGvAq/Tdxs03dKk+LHtFxJuY97DJTKRUagf3
	lycEddb1d30AxpJWfTbOlCmLe4h49FSwQPVLtyeHy1ZkM5gGBVRVBcdp7N4yvKHoigmk6LRycvRYj
	t6kTWYyHYXnx1oSDJUKnicBGC+2iI+C6zgVV7Oxa7qQ0xqZm+r5/Siie752dCIxS7IpLQWcR2ZUmM
	FhXtN8Xosa41OkhfEP2lJCHvhzjuZYlLnnN3ivHgR0BiGmKJDA5uBkbntKALIcXe62LWqcn5TCwcB
	7mH0e1Pok0ws1aQpTv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nntZq-00C6sb-PO; Mon, 09 May 2022 02:56:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nntZn-00C6rM-DK
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 02:56:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c11so17516764wrn.8
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zGLs8GoeHHxow0QHkE6WAhpRqq163am1P8u8l/0Qawg=;
 b=bAwc46bgzRfoc2DLiYdlzCkJPvcTGnfgzRzweu1C2fVcg65WP1trATs3acTrH2BCpt
 81BISgEST0FFiyAi91rjBzJ2CcK8WtoctbuwX8fVb6oHVQkkPjJti5aNXrfLRwEwdBwh
 Pooh4iBSsUnxbSHf7vQeTOP+CzQZbTv++VBlRsCQdHVNNn2ASO5mLA/QefvHvWD+6s0a
 eUj93XWAurLLDFWehur4TNlOEyKlCHm5EZoURSXu6c1XR7zzsn21bwm7Xhp36MO+emEL
 WZSA6YWOrVmJ2oan2T0b2rg6BfN2ZIYMVD5tTFdyhEhhJ+6MnkGdDRz3FeTqBXkviG3a
 arKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zGLs8GoeHHxow0QHkE6WAhpRqq163am1P8u8l/0Qawg=;
 b=W+LD8smvOxTH3VgmlsK3Asg4/vCQWn2iP+B/njXqzn6GHwBtZk9SMdn+efOI2IPX5c
 jah/6gtDVgRBvR9o5jP0wtObd6FGLO9QKr69tGD2MZRieSeU4185hxIe8vakwEgadSta
 n35A2YwjOyKwsUU/2BgzANcSUaMHNytKidi4M960kRDfGYaS7cJNGmb/+X76lxSnFH++
 El+NW3CwQOZTAff/Qvot3ygsSbe8KmQHCfqryDeEfwkwaY0MM7OzB/gh5haQHVooJ568
 67IDvNLEtnfuYVPINn0+0WpZp5YFrtR+/JkY5QTBz3LJtU/YEh7mwCnoPpUgj4H54Al/
 ARWg==
X-Gm-Message-State: AOAM530FmxLjfVupppFKqO9fn1nNK5UCg2wme9rKq2Az4mbG+tUi9EZs
 MeZtrVZQR7bVDrSvdhNVUlGmkg==
X-Google-Smtp-Source: ABdhPJy059/eM8oV+XQ+w8slguW1SE1QSeWz1ma5e97+6eHR1i6LQS94bQGbba8RybbXFq3PKp2VTw==
X-Received: by 2002:a5d:584a:0:b0:20c:45fe:b02e with SMTP id
 i10-20020a5d584a000000b0020c45feb02emr11717800wrf.504.1652065004531; 
 Sun, 08 May 2022 19:56:44 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141]) by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b0039456fb80b3sm13680708wmj.43.2022.05.08.19.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 May 2022 19:56:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] clocksource/drivers/riscv: Events are stopped during CPU
 suspend
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220509012121.40031-1-samuel@sholland.org>
Date: Mon, 9 May 2022 03:56:43 +0100
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <878D1D3C-E8F1-4B37-93F1-B3560E3F271E@jrtc27.com>
References: <20220509012121.40031-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_195647_508415_88AAE47C 
X-CRM114-Status: GOOD (  19.75  )
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

T24gOSBNYXkgMjAyMiwgYXQgMDI6MjEsIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQu
b3JnPiB3cm90ZToKPiAKPiBTb21lIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgU0JJIHRpbWUgZXh0
ZW5zaW9uIGRlcGVuZCBvbiBoYXJ0LWxvY2FsCj4gc3RhdGUgKGZvciBleGFtcGxlLCBDU1JzKSB0
aGF0IGFyZSBsb3N0IG9yIGhhcmR3YXJlIHRoYXQgaXMgcG93ZXJlZAo+IGRvd24gd2hlbiBhIENQ
VSBpcyBzdXNwZW5kZWQuIFRvIGJlIHNhZmUsIHRoZSBjbG9ja2V2ZW50cyBkcml2ZXIKPiBjYW5u
b3QgYXNzdW1lIHRoYXQgdGltZXIgSVJRcyB3aWxsIGJlIHJlY2VpdmVkIGR1cmluZyBDUFUgc3Vz
cGVuZC4KPiAKPiBGaXhlczogNjJiMDE5NDM2ODE0ICgiY2xvY2tzb3VyY2U6IG5ldyBSSVNDLVYg
U0JJIHRpbWVyIGRyaXZlciIpCgpTdXJlbHkgdGhhdOKAmXMgbm90IHJpZ2h0PyBBIGNvbW1pdCBm
cm9tIDIwMTggY2Fu4oCZdCBoYXZlIGJlZW4gZXhwZWN0ZWQgdG8KcHJlZGljdCB0aGUgZnV0dXJl
LCBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIG9uZSBvZiB0aGUgcGF0Y2hlcyBhZGRpbmcKc3Vz
cGVuZCB0byBSSVNDLVYgd2hpY2ggY2FtZSB5ZWFycyBsYXRlci4KCkplc3MKCj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLS0tCj4gCj4gZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiBpbmRleCAxNzY3ZjhiZjIwMTMuLjU5M2Q1YTk1N2I2OSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNl
L3RpbWVyLXJpc2N2LmMKPiBAQCAtMzQsNyArMzQsNyBAQCBzdGF0aWMgaW50IHJpc2N2X2Nsb2Nr
X25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPiBzdGF0aWMgdW5zaWduZWQgaW50IHJp
c2N2X2Nsb2NrX2V2ZW50X2lycTsKPiBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGNsb2Nr
X2V2ZW50X2RldmljZSwgcmlzY3ZfY2xvY2tfZXZlbnQpID0gewo+IAkubmFtZQkJCT0gInJpc2N2
X3RpbWVyX2Nsb2NrZXZlbnQiLAo+IC0JLmZlYXR1cmVzCQk9IENMT0NLX0VWVF9GRUFUX09ORVNI
T1QsCj4gKwkuZmVhdHVyZXMJCT0gQ0xPQ0tfRVZUX0ZFQVRfT05FU0hPVCB8IENMT0NLX0VWVF9G
RUFUX0MzU1RPUCwKPiAJLnJhdGluZwkJCT0gMTAwLAo+IAkuc2V0X25leHRfZXZlbnQJCT0gcmlz
Y3ZfY2xvY2tfbmV4dF9ldmVudCwKPiB9Owo+IC0tIAo+IDIuMzUuMQo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
