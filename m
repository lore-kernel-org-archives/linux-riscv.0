Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E9EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 01:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlKJWX4miMsWlU4RjaJQ0rBVV1lAmL9k6XSut6h80Qs=; b=l0pBcMe5c0cUvM
	2xPEua9NVW/k+15mdTNZSAkLE3wA2osNJwAmsJIyA/ZtGlQyA6+MqGj3JHWjGDS1Dn8rZqZ70/eNB
	6KmitVmsbiHpbKKVAHvHuck0O/UiT6UhwJcaBKVACqecFgLRxRxSHwfWJeIDJJ8tSKZgpqGtbiB7O
	q9Y9oyEqxpYXc7mVtunvmFT419v8PNRo7av4z5QZWBaP25o+W/ISjKG90ZeU//Q2xu1tIw3QIvLIr
	lwb/jj2+RF7vHA8l/VIgoHzDChwhcCQ6P18b9pBTb/ih4p0Ec44MN/1ipDrcMdZ+BLPFG6IFjahOE
	OtevdXGKiqu7MPeJjjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfAj4-007zmD-6z; Fri, 15 Apr 2022 01:26:18 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfAj0-007zl1-OQ
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 01:26:16 +0000
Received: by mail-qk1-x72f.google.com with SMTP id e10so5793039qka.6
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 18:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Sm+gny5XTTpy+ELPSV+rPSft8W2i3xec/MLcuEY0I/Y=;
 b=dLn7lrKL8/l7RC0S6YMvBo5CS3kBVa2lk3icsydvZ+kJysipb9rdkORVWJPLC1aY7G
 /NT6aH7hXVIdGfSfk70stO6ReDmaR5qGuiaiUDVHVAfXUDp2IN8E506Nwtkzxe65rg/1
 j0Tm5GVTSN5WiMsbqaGsXHDgM32yD1DKUYdQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Sm+gny5XTTpy+ELPSV+rPSft8W2i3xec/MLcuEY0I/Y=;
 b=h3u5D6VCw9jqKeJGgsgyatfEvPCODMQOzubQLngfJyWO7U6NcfvV3w7LafuRACKbVR
 pG3izkojcWmR4cLJ4ElVCpgAlw8+IUjnWl54lLxhgYoFnJcs4EEOdFoKeR0tAkyR2hvr
 vKgpMkUA3uZPbAk7RKsiXb0mjV4syfrlbqQIjKcS2GXO5fBLhgiPqvI4MxWYGSLtBjEr
 +BM8FIgal19jjtwyx7PYoemvZ9PD1GtkC7XGmeXPy63DFOMFqiRO/CtK7yqueFhxWRiH
 4v3QMAjP2yoedR5JRBmxW1XDEEz7P0CWZf9LAzvd7vXJeE2u9WoGfZjT0UzCruDRe6ZZ
 7mjA==
X-Gm-Message-State: AOAM53120JwnDHq2bNi9ez4bT3GCSdPbptJPhSgLLGXJNOdQH0n7C+AU
 79GUb7cb49o8hxMad9SV+dF/vQ==
X-Google-Smtp-Source: ABdhPJzCY5w8ByFXA4+AhOmT5fd2zsrh/f3FCBgbtzYes037mIpSHpI2oeA68UX2ihwu/ODEPSuHIQ==
X-Received: by 2002:a37:2e42:0:b0:67e:6d80:2707 with SMTP id
 u63-20020a372e42000000b0067e6d802707mr4008990qkh.365.1649985972470; 
 Thu, 14 Apr 2022 18:26:12 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
 by smtp.gmail.com with ESMTPSA id
 n186-20020a37bdc3000000b0069c218173e8sm1801615qkf.112.2022.04.14.18.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 18:26:12 -0700 (PDT)
Date: Thu, 14 Apr 2022 21:26:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Message-ID: <20220415012610.f2uph3vpwehyc27u@meerkat.local>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <202204141624.6689D6B@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202204141624.6689D6B@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_182614_841060_2D2314D7 
X-CRM114-Status: GOOD (  11.81  )
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

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDQ6Mjc6MzhQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFRodSwgQXByIDE0LCAyMDIyIGF0IDExOjEwOjE4QU0gKzAyMDAsIE5pa2xhcyBDYXNz
ZWwgd3JvdGU6Cj4gPiBiRkxUIGJpbmFyaWVzIGFyZSB1c3VhbGx5IGNyZWF0ZWQgdXNpbmcgZWxm
MmZsdC4KPiA+IFsuLi5dCj4gCj4gSG0sIHNvbWV0aGluZyBpbiB0aGUgY2hhaW4gYnJva2UgREtJ
TSwgYnV0IEkgY2FuJ3Qgc2VlIHdoYXQ6Cj4gCj4gICDinJcgW1BBVENIIHYyXSBiaW5mbXRfZmxh
dDogZG8gbm90IHN0b3AgcmVsb2NhdGluZyBHT1QgZW50cmllcyBwcmVtYXR1cmVseSBvbiByaXNj
dgo+ICAgICDinJcgQkFEU0lHOiBES0lNL3dkYy5jb20KPiAKPiBLb25zdGFudGluLCBkbyB5b3Ug
aGF2ZSBhIHByb2Nlc3MgZm9yIGRlYnVnZ2luZyB0aGVzZT8gSSBkb24ndCBzZWUgdGhlCj4gIm5v
cm1hbCIgc3R1ZmYgdGhhdCBicmVha3MgREtJTSAoaS5lLiBhIHRyYWlsaW5nIG1haWxpbmcgbGlz
dCBmb290ZXIsIGV0YykKCkl0J3Mgb3VyIHVzdWFsIGZyaWVuZCAiYz1zaW1wbGUvc2ltcGxlIiAt
LSB2Z2VyIGp1c3QgZG9lc24ndCB3b3JrIHdpdGggdGhhdC4KU2VlIGhlcmUgZm9yIHJlYXNvbnM6
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjExMjE0MTUwMDMyLm5pb2VsZ3ZtYXNl
N3l5dXNAbWVlcmthdC5sb2NhbC8KCllvdSBzaG91bGQgdHJ5IHRvIGNvbnZpbmNlIHdkYy5jb20g
bWFpbCBhZG1pbnMgdG8gc2V0IGl0IHRvIGM9cmVsYXhlZC9zaW1wbGUsCm9yIHlvdSBjYW4gY2Mg
YWxsIHlvdXIgcGF0Y2hlcyB0byBwYXRjaGVzQGxpc3RzLmxpbnV4LmRldiAod2hpY2ggZG9lcyB3
b3JrCndpdGggYz1zaW1wbGUvc2ltcGxlKSwgYW5kIHRoZW4gYjQgd2lsbCBnaXZlIHRob3NlIHBy
aW9yaXR5IHRyZWF0bWVudC4KCi1LCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
