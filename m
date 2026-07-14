Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0955C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHl3LdEE164WBifsVIiUjBEwQ0qoIZ4iL0MxF/ps0z4=; b=uiO7U9/aD8C/GS
	L7nAbMKOISjX36y1MD5J+aICHQJtjZPmW0XFbiCAGAq5vwe5AmIHQ0k5wsjswu+ICiBsPusdCTOTu
	ONyF30LhgC3Jp71KULid1UswoM7jCGiWY1OFoCWeIxRGt3rNXiWj3mkjDq4EUmoAX0EpjbjRXTn+r
	FeO90959dCgitfOONVt1m1GIFc95e3oWE1X61WjQurn8kmMj4RjRIZfXeIti0yYzULJuJ2J/JamI0
	KW+X3CnJPzFJ9HxrWD6FIvjblPPANxrJdeKivZAUOw3xyQiETm7Tkj8vp7+8MW/Tzyvw2UknX7ydO
	RdxunR+QfvL3X/FtMlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWYD-0000000B1r2-2AFA;
	Tue, 14 Jul 2026 06:23:29 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWYB-0000000B1qV-09KB
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 06:23:28 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-495b98b4f6aso1451542b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784010203; cv=none;
        d=google.com; s=arc-20260327;
        b=Ryvf6z/pF/5R/7wQ8fdwFdQHPy2PLtoohHIPjAnDSTPZ/SG431+Y/Lc7YCQnY6i9FE
         aa6bsdoPaVAyObGyr/YoOrItRysG9XBbtc+kdLpE4bcAkbn9j5qgnbhdYJPXJF1K2VkD
         3wNVBs2ADz8u8lOVVhsRb9gZv6i8m8EEOP6ztfp3DEAEysMkTqdfuAMVX+ynF5dNarXJ
         dK6N5r8BPjGRXaCT0eQwW7Ow3jsgFng8/wuEFuGrhlcbhHW1ksWD1omQ5twbNtN4g4pf
         cbCwHPP7d/g5TeUrXyqAoc/T7QvyWmAhZAiVH0JDRMYblPZWzmsQxAhgbvnTjc0nMFVJ
         mPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        fh=VE3ukQrD9Nm77FAOJ4QofrVrp5wKmuwI/ZDblGjLjk0=;
        b=Z33zkzu9oRCgfrPZJEPmMP3946G0kmuVCK/vzzHzBQHeZ20p27P5JK0i31+Zsvx5NS
         eTeCcRsUnHwKiu6x5yvm/ABd+fesiSSjopjnsmW4ORUBNXRpsdK/TqzL7IoLxbqUCRh8
         yM1dvoVArWTYTmJSrtxtZ0M+CTHR1Bsf7gpPBtGlNLmd6CcO69lX6Y9cVyj64f6NSZ3w
         06Z9imsx2GLkQxGyJxFt1+v05BvcMUR6PQoCZpoyIsfOUxGpWljiwCTxxjBJxVOgy7mv
         tuV0u7+m/D53ZLflD6dEB+nsMmXZgj8AUIZJYu3UftsXxtuQAJUm3GoZP4LZ8cfVv80s
         xjEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784010203; x=1784615003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        b=ROJQMsKHdC9ltny7egWJTKW59P2qz4OTRrllzLnoUNJR3jhb1FOy0t3aSaVxKsIVQz
         T0+HIC70wQ1MeRLm4k5BQR+n3mPsf0ne/Y6wvU2uCzSLKzGJDdmcW0L9DPaFmscO9vyr
         lhddi/mltXDJsB+DZ4THDidhFCMct8t4OYxQYAR3tjgREr3hk0VPaMbhpC2g7+hU5j/H
         ZWVK/jfH67IpHwbRNWV6XXCP7r/xU1mWq7kQTfMR5VprgvWUz7g5ajz7PtOSsT1AvLi4
         vuBkyopQaFCyoMOdXN6wMsqti94rr1VhjZN3yqovbv2aZNeaH+3f0vEKPNFBmiuEtHSz
         IkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010203; x=1784615003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmwZ2JdGpnQjzlIbtGvTSfdYg7lmImsp/NzZpGZ4h5M=;
        b=GZXQWmUeb8/ed8UH1rqw+37+8HOHzSnlTLqz7KdzOTnxOlu/N+wyu+8xlJqqBWwv0H
         CeyKQeOQv2f7eSmVyYH/2+/qkpeESx2Ji2B/ZIGewbIgydIyIsl7tf62cDm3Nla0F6fX
         EOZyctEYdonBeoKBztCZUTLO+cnw5Un1N2EIVMm53tO7k9biHDPPXVacjp+N1BSuYbEm
         hEEjNqtQ059x/Azci1XGoIz1/rNhWmLIOgzfLwkzSMZ6s+dNAwrnT6T7I58YfcSMNWu0
         AdPv2Ebr5reHKFQkU70qoLJBcYCLQosw1ewlEHxFo+NuyIv61ybyCiU/NAsaJraFo8HL
         l+Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8lVN65x23rd8iKNXUUcmcZOfvWReqvkvE6M2OJ/wb6oMWUzVCKtX/oZSMKbUlk41XKeMOdfOV2m4ZhlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WI59AvuK55jo94IHotiiSf26371STKYuSMEmAYOxDF36Mans
	9gFPyaV+if/G1vkLCxXW/cN0myaTabBv7VWRml/nIX7zdzNq7HjBIXgz+RThLloUm+SDA5IgoiQ
	T4HpYIYYF4/s3UAdEAgimgE3DboziJBjDX9SpvX0pSQ==
X-Gm-Gg: AfdE7cl0QTXNvk0w7ore1J/Iy/AnlpsIhAa5IYgk17vSOzbPv1P3tQdP2+sCHI5X3+Z
	wdzaw/2q5aquFBIf6ZGgiZ8n9S80n8oW+Ky191esJg3/emm93oCre3iXDBuXjzbw4t9lXHlOfTO
	2MSW3iPRMhIABqjikOSnzJsorSs3KLisNwNbqOAKoIWnOFNKdXECxN0+f5A1QH+A6Cw65wbR/RK
	e6aU1Ctazkd2JMXNi6BKAjhpFGpNFdwz0Dxh5Zo9h8osVk0hX4ombhd3QZrn1+t/NBsnuc9Hss=
X-Received: by 2002:a05:6808:1b24:b0:495:f79d:b08e with SMTP id
 5614622812f47-4a47a6c1d27mr439710b6e.21.1784010203197; Mon, 13 Jul 2026
 23:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-2-cuiyunhui@bytedance.com> <74ffb0c5-4edd-7b64-3d3f-be76c2aec4c2@kernel.org>
In-Reply-To: <74ffb0c5-4edd-7b64-3d3f-be76c2aec4c2@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 14 Jul 2026 14:23:12 +0800
X-Gm-Features: AUfX_mxF_EkkHPpXwVLSHWKREo9gY6a3BeqhKBMKR6LcYXx54wa2zu3a3fsDMQ8
Message-ID: <CAEEQ3wk8gK9pam2da=o5mbfzU3-5EtfH5nyhAoVfCoy+7UuCGA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232327_085257_731B79BA 
X-CRM114-Status: GOOD (  12.67  )
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

SGkgUGF1bCwKCk9uIFR1ZSwgSnVsIDE0LCAyMDI2IGF0IDI6MDTigK9BTSBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDMgSnVsIDIwMjYsIFl1bmh1aSBD
dWkgd3JvdGU6Cj4KPiA+IFdoZW4gcG9ydCBJL08gaXMgbm90IHN1cHBvcnRlZCwgZXhwb3Npbmcg
dGhlIHBvcnQtc3RyaW5nIGhlbHBlcnMgaXMgYm90aAo+ID4gdW5uZWNlc3NhcnkgYW5kIGNhbiBt
YWtlIGNsYW5nIGRpYWdub3NlIG51bGwtcG9pbnRlciBhcml0aG1ldGljIGZyb20gdGhlCj4gPiBQ
Q0lfSU9CQVNFIGJhc2VkIGFkZHJlc3MgZXhwcmVzc2lvbi4gIEtlZXAgdGhlIE1NSU8gc3RyaW5n
IGhlbHBlcnMKPiA+IGF2YWlsYWJsZSBhcyBiZWZvcmUsIGJ1dCBvbmx5IHByb3ZpZGUgdGhlIHBv
cnQgSS9PIHZhcmlhbnRzIHdoZW4KPiA+IENPTkZJR19IQVNfSU9QT1JUIGlzIGVuYWJsZWQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gPiBSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+IFRoYW5r
cywgcXVldWVkIGZvciB2Ny4yLXJjLgoKVGhhbmtzIGZvciBxdWV1aW5nIHBhdGNoIDEuCgpUaGF0
IHBhdGNoIGlzIGluZGVwZW5kZW50IGFuZCBzYWZlIHRvIHRha2UgYXMtaXMuCgpGb3IgcGF0Y2hl
cyAyLzMsIHdlIGxhdGVyIGZvdW5kIHRoYXQgdGhlIHBlcmNwdSB0cnlfY21weGNoZyBmYWxsYmFj
ayBwYXRoIGNhbgpleHBvc2UgYSB2YXJpYWJsZS1zaGFkb3dpbmcgaXNzdWUgaW4gdGhlIGN1cnJl
bnQgUklTQy1WIGNtcHhjaGcgbWFjcm8KaW1wbGVtZW50YXRpb24gaW4gYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jbXB4Y2hnLmguCgpJJ2xsIGFkZHJlc3MgdGhhdCBpbiB0aGUgbmV4dCByZXZpc2lv
biBvZiB0aGUgcGVyY3B1IHBhdGNoZXMsIHNvIHBsZWFzZSBqdXN0CnRha2UgcGF0Y2ggMSBmcm9t
IHY4IGZvciBub3cuCgo+Cj4KPiAtIFBhdWwKCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
