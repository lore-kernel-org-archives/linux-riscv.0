Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D74C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb7J9guUUtVG4hxTFn4XQ9Znui/VUtr6DjPAc5OucOM=; b=az942kISAOUhSc
	Pp4SWdjzupVb7lxFd2PEnDYXZ/xdqc6DZariXKWXsq1WS9/UUsI0Qda/WYHsEdrapp1VCX8TXpqwr
	y/itUApjVoUasGu92biAh5ZfwesHyck+rsUXEr78yXm9WjaLU6vCYSS/ZV8k2WvfyW/Gzx6dwVinH
	X5MA14fS+s6XeBQmYZlNCVAThlRnTbW7TU2MKT/T6fypJe9uII2B/eDy9CoSnHggr7V7LDyaT7y+q
	8LPocQdr/n9EEgz+sY//+owxLgxWutideaO14F1JglnL15CyBWqVxFUemipaga8NLVuwHbtVXlIjh
	2WAjPvm81K8oHRNhtSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTSQ-003h9a-2A; Thu, 06 Oct 2022 16:10:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTSN-003h5C-Fj
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 16:10:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso1208189wms.5
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjt0SMWShN0p36N92cYaAd33vU82ZeIhktK3vx+Fq8o=;
        b=Qq3wiJE5cx3pYeRKUhp8JNeRQZtYpGGMuEE8co2n0n9LEe2UflcdPiP+G5dWGXETke
         IUDRutkr5ryYoYakptG6wijYnvolcZat5o6sGZxOojMKdh0Lm4n9wDngceeX2mdaaYFD
         qYhlTaZDexa6DfOWBx7GFrH68gFc3TgAPqOfX3/kJUmNsWYKDq93XV+ABqlh65IeqpOb
         mfIs5pKVqI+cOzhGQGi5w8LBLo0Me6DSZTa772aKWYXO6X4qH7a+cd9H1qxnf4miOfP5
         nyU0xBDF/mnareXlBtyoT0NktRNmhS1Qrph31aqWcAXCp5X4JcV/LuC1boOj/AJGC3lE
         LXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjt0SMWShN0p36N92cYaAd33vU82ZeIhktK3vx+Fq8o=;
        b=qqLhTk5WkT88dY1HkI/GcWaUvTKG44dwiYpSwFtKtlC0M9qs/AA/s4TdKtbdj1uwTV
         zw0PGWuCEvmFZRVo8Xa0yNUvMlGvNJpRvXhtiyCRDH5rlsvZltTGs2oBaCu8vLHSp/TT
         sDz/0A3bWLAoRnDBI5qh8UWTneZjAHrGyqhzMiGDU/1NIk7YrqYZ5ZLBzr3pfuFU3GM8
         igiRoL86/b4MbVvcPEmYrY1YL3Mu4w6o8y/YxOP0XjLY9wRBwJXza2l/fxKmpPeEm0/n
         c4aLBfM1IxrpRtFPKkh4Z6AfHOGYh8SpSkqStj5mfELcPLs/JjIz7xEZ+OuBFlDC3are
         xtXw==
X-Gm-Message-State: ACrzQf2M5ixr8G3OUaJEONBY5S1fityifOpx+e95t5sqarmJ+ZYWeyrK
	4bELkilbZXcilRJErl6gGSJdvQ==
X-Google-Smtp-Source: AMsMyM757hT0GLpVIT0mFBeyt2yGIWf7MwkGZ1iOb2TeR7Wvt70BJA0k+odBfGOrypk3Og7Ybvr2TA==
X-Received: by 2002:a05:600c:20b:b0:3b4:86ff:cd with SMTP id 11-20020a05600c020b00b003b486ff00cdmr7504099wmi.35.1665072638940;
        Thu, 06 Oct 2022 09:10:38 -0700 (PDT)
Received: from smtpclient.apple (global-5-142.n-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003a1980d55c4sm6172412wms.47.2022.10.06.09.10.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Oct 2022 09:10:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: fix multi-letter extension compare
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20221006070257.11632-1-nikita.shubin@maquefel.me>
Date: Thu, 6 Oct 2022 17:10:37 +0100
Cc: Atish Patra <atishp@rivosinc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Yury Norov <yury.norov@gmail.com>,
 Nikita Shubin <n.shubin@yadro.com>,
 Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux <linux@yadro.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
Message-Id: <E75B9DE8-8943-4F40-8374-2E74C50D7A00@jrtc27.com>
References: <20221006070257.11632-1-nikita.shubin@maquefel.me>
To: Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_091043_625888_8F54D921 
X-CRM114-Status: GOOD (  22.12  )
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

T24gNiBPY3QgMjAyMiwgYXQgMDg6MDIsIE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHViaW5AbWFx
dWVmZWwubWU+IHdyb3RlOgo+IAo+IEZyb206IE5pa2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJv
LmNvbT4KPiAKPiBJbmNyZW1lbnQgZXh0IHBvaW50ZXIgdG8gbWF0Y2ggbGV0dGVycyBhZnRlciAn
eicgY2hhcmFjdGVyLCBzbyBpdCBwb2ludHMKPiB0byBhY3R1YWwgZXh0ZW5zaW9uIG5hbWUuCj4g
Cj4gRml4ZXM6IDQ5MDVlYzJmYjdlNiAoIlJJU0MtVjogQWRkIHNzY29mcG1mIGV4dGVuc2lvbiBz
dXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5j
b20+Cj4gLS0tCj4gSGVsbG8gQXRpc2gsCj4gCj4gU29ycnkgdG8gYmxhbWUgeW91LCBidXQgaSBk
b3VibGUgY2hlY2tlZCB0aGlzIGFuZCBpIGRvbid0IHNlZSBhIHdheSAKPiBob3cgZXh0ZW5zaW9u
cyBmcm9tIGRldmljZSB0cmVlIGNvdWxkIGJlIHN1Y2Nlc3NmdWxseSBtYXRjaGVkIHdpdGggCj4g
ZW5jb2RlZCBvbmVzIHdpdGhvdXQgaW5jcmVtZW50aW5nIHRoZSBleHQgcG9pbnRlciBvciBwcmVw
ZW5kaW5nIAo+IHRoZSBlbmNvZGVkIGV4dGVuc2lvbnMgd2l0aCAneicgbGV0dGVyLgo+IAo+IEkg
aGF2ZSBubyBpZGVhIGhvdyB0aGlzIGNvdWxkIHNsaXAgdGhyb3VnaCByZXZpZXcgLSBhbSBpIG1p
c3Npbmcgc29tZXRoaW5nID8KPiAtLS0KPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
fCAxICsKPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gaW5kZXggM2I1NTgzZGI5ZDgwLi4wMzE1NDYwNTJkYzAgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4gQEAgLTE5OSw2ICsxOTksNyBAQCB2b2lkIF9faW5pdCByaXNjdl9maWxs
X2h3Y2FwKHZvaWQpCj4gCQkJCXRoaXNfaHdjYXAgfD0gaXNhMmh3Y2FwWyh1bnNpZ25lZCBjaGFy
KSgqZXh0KV07Cj4gCQkJCXNldF9iaXQoKmV4dCAtICdhJywgdGhpc19pc2EpOwo+IAkJCX0gZWxz
ZSB7Cj4gKwkJCQlleHQrKzsKPiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJzc2NvZnBtZiIsIFJJU0NW
X0lTQV9FWFRfU1NDT0ZQTUYpOwo+IAkJCQlTRVRfSVNBX0VYVF9NQVAoInN2cGJtdCIsIFJJU0NW
X0lTQV9FWFRfU1ZQQk1UKTsKPiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJ6aWNib20iLCBSSVNDVl9J
U0FfRVhUX1pJQ0JPTSk7CgpUaGlzIG1ha2VzIG5vIHNlbnNlLiBUaGUgc2luZ2xlLWxldHRlciBw
cmVmaXggdGhhdOKAmXMgcGFydCBvZiB0aGUgYWN0dWFsCmV4dGVuc2lvbiBuYW1lIGlzIGFscmVh
ZHkgaW4gdGhlIHN0cmluZyB0aGVyZSwgd2hldGhlciBzIG9yIHouIFlvdXIKY29kZSBtZWFucyAo
YSkgeW914oCZZCBoYXZlIHRvIGRvdWJsZSB1cCB0aGUgcHJlZml4IGluIHRoZSBkZXZpY2UgdHJl
ZQood2hpY2ggaXMgb2J2aW91c2x5IHdyb25nKSAoYikgeW91IGNvdWxkIHVzZSBzIG9yIHogaW50
ZXJjaGFuZ2VhYmx5IGFzCnRoZSBmaXJzdCBjaGFyYWN0ZXIgKGUuZy4geW914oCZZCBtYWtlIHp6
aWNib20gYW5kIHN6aWNib20gcGFyc2VkIGFzCnppY2JvbSkuCgpBcmUgeW91IGFjdHVhbGx5IHNl
ZWluZyBhIGJ1Zz8gRGlkIHlvdSB0ZXN0IHRoaXMgYXQgYWxsPyBUaGlzIGxvb2tzCmxpa2UgeW91
IG1pc3VuZGVyc3Rvb2QgY29kZSBhbmQgd3JvdGUgYW4gdW50ZXN0ZWQgcGF0Y2ggZm9yIGEgYnVn
IHlvdQp0aG91Z2h0IHlvdSBzYXcuCgpKZXNzCgo+IC0tIAo+IDIuMzUuMQo+IAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
