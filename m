Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE4C88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHVqJpo7irqmsvwAaXrAjCx+yvvsVnV3zpVTCWysbec=; b=M2yZ/QurV6ZeSE
	87ihF18CVtzBq3XUMXdZ4kN14DDHi1sIMQ4IuRsy3nqJNA+xfcqEDFR6kNjFtdZHTYK4fGID+0WOh
	2UEssFBs+U0X6y1WRmahHwqyyO1AHKbGFmn5hzCStI1RRCD0aXUJhRMuw07MuVUsZxa1loBiTZYAZ
	WjsOSZTwZfwf5lhygDuwTdVqOd8oLvWlEZqC8sapW6IEXGaduBkToSfZGEINZD2nKLI7Dd7DEteoO
	5m+odg10ogZbFHzI76sfOl7QuIfXN+vIpfBeDpYWMoBr2v9XkWLY3Trzq7J7anocCie03Ulz7/ZXu
	e4mj91p8d61KYHmmViXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56VU-0000000HVGI-0KOb;
	Fri, 11 Sep 2026 19:01:52 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56VP-0000000HVFc-39pP
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 19:01:50 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae45so589143a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 12:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153305; cv=none;
        d=google.com; s=arc-20260327;
        b=BcCaFET9R6ijG3+WxFmfD35di+PHZQMKcs8sEmL/WyDyeJnKiqv6O6URGZUT7rdYuG
         1UUmLDiTmK4Z47d9H8PZ0tjQ+hZrM9azD942zgam4H05jlCS7+MADG/l5QbG1yzrD+kZ
         I0dLHHKYEjZqw1mP2GN5mBGRV1AoXpBVAauhiUnJCtbi3UM+AY6S12LmRL5k/N5L1p1L
         kI4c4F2uvV2KUu+pryBVn8M8pecHJJ6L/NhGJnONkg9p/pbtm+iLMWC1CpOQ1g0103qF
         m6dGhLv3lcu+XPqrz24JEBbpHkxywQ6h+gv0o2CaawRorKa7R++SdbdoMQfaNPud/nFa
         s4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        fh=7Wv7o6X9+Ek55VZSorm+hLBv/DjNBEewG0SYIFzuFAE=;
        b=HEOtAX1WLZ3ibjcn65H0ScPWzZfprp48OiVBAUPMHV3ZUukrwmtgduiKaJcu4Ce/pT
         4bxwOFw7VbiREb54IVZRX8IY0vHT7w0hhI6oP4ORGkAQy0v2yOQ0asZH09vDfYXILvQy
         vUh2EWW3DKeuZE+SSN0zxnUXg9cGMEthgKWQexfflxWKduB3jjBKbQPcTDieuXx0gPOh
         cByr1C3p8CJePrXTANOxWqsiVX4CrwalKgl4xQyajZKP/+xsN4aK3kyqfYRaqowbYZCJ
         ia6B/HxfNpInJ6dE/7OoVqocRTi3QmYRAc+SB2gauaiTxb50Wd+wG64TfLkZwj2ABp3y
         mzUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789153305; x=1789758105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        b=C1OvmnmgAyPQq7yabEpDtxKHvDk/qtx4vvkow4Se5gmgtYf6oz42G2URYedzOo1ouN
         FFzCFbRzpYN1nxXCjOHLsDqzi/n/bzpqDH/nZGc8QZfCeR5LkTnjzR3Hvg7ZzMLpJUMk
         5Fuj8tg7URSXWVjQaMpJGyzuJexlNtqhDaRk6kxbf281La5mcQRTBXGoVSvFy5ZTihB9
         +kztZctdwZcKQ11VIhykjewpoFmDPF7RBOJ+kMN8rE3dt+Y6+vwQl6/abzFSEMAnFfXE
         BihVOKEWSwvIegDScBS/ojzi+efwiLuswNlIw5bT0YmNSLYuxQaZ5ngH0cZ+CwLw8Znn
         NX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153305; x=1789758105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgXaZV//QYG4469dRhLaxLf4jDLcoZBNLlaluFRomK0=;
        b=HsXdDLHl3hZD0phlzoXdcV8oLL3gAxo/hAY6ZgNlsMWyJg5Oz/JFr1K9RvDHQ2e62f
         JnpJ8y8HliKbNtifo2M8ZwBXBk2TbvdI2Ns66d/Mi12nGh1/CQJPqAe8WXokaTeguOkp
         IcAxQJfaC8c639PYCK+QJiDtE3NloyOVW1oKOkZW4ptAjJhZGhNNVkBG57CaKXfRKuhB
         VOMB8VvsUwxrYoVQMXAAVK470kLzvq2RLDCO4J5kbcHedb2b1nJ7kRlN7ZWWgd/pOiS5
         7B312X6kRMfeKZgnYNpcuO/4XwDMtG2zxzccidQOtlJ86UCoup0+ybZ2ItGvlSzmvdSS
         w5HQ==
X-Forwarded-Encrypted: i=1; AKwUvBywGWSuFOkqE3kdwWBDIe2fRg2yqiFdnE1IEr8VCqI9ST9VRqzY4RFg/jopahVfa9ISHeAtslqPqAddVg==@lists.infradead.org
X-Gm-Message-State: AFuF++miIOvgueoGEojDPSmqVwJnG/0ZoVoLunx6UC+Wvd1Os+tIF4io
	RSH4xTbmsGILxivsMjBm2vr5OlSde3elfXwpYcmJw2TrV40sypQXlUYyQHZLs67Tk4JpJgQzwwB
	o0HzXFbZzgeTunw3XowYS5rWdYoSw937Xez4c
X-Gm-Gg: AYBFou2ROb7ri71QD4tnCV56GCZSKAReDUHS31E0FRBWOZHe6IGyGNA2Qy8o+0fz1VE
	34ZljbOt1NgfbG/4uNdWpuu+1insHhWfmmBR/+HrNlwOGmlZQEHnGviHgLJRNF9UGn+0fuuEOQA
	YTsXyLjAqrvskyiVMVp0MxrvMA/1r0BwP2py8Al74r1IgTqZH/NhTF4lMdszltawCXkLasfhugw
	RXcixU2RcodMdczQJPfoYVqtWG0D7xRdQC2YNt0yYOAUnuzNOZ8miL9bouQ3bNEUNpC7Vl8ewX6
	fH0g7cCpJtsxN2J7RL5wiVU2tMmqcUgitmLDhewZ3pd37NBDot1WM26r
X-Received: by 2002:a05:6402:5024:b0:6a6:32f5:90b3 with SMTP id
 4fb4d7f45d1cf-6a9b56cb90bmr5271034a12.21.1789153305023; Fri, 11 Sep 2026
 12:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 11 Sep 2026 14:01:32 -0500
X-Gm-Features: AcwNN1Ue_pfyyzvxcWu7bUZijifaEJzBimk14NP6B3kzlMYEX1HbytKB-0x_sYs
Message-ID: <CAFTtA3MNxUp8pnUzcM-EfAQkZ=ZG6k=7aXKZBVmjGPnjXhywTw@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context save/restore
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_120149_554921_1F2340D1 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

SGkgVHJveSwKCk9uIFR1ZSwgU2VwIDgsIDIwMjYgYXQgODowM+KAr0FNIFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguZGV2PiB3cm90ZToKPgo+IFRoZSBzdGFuZGFyZCB2ZWN0b3Ig
c2F2ZS9yZXN0b3JlIGFzbSBhZHZhbmNlcyBkYXRhcCBidXQgZGVjbGFyZXMgaXQgYXMKPiBpbnB1
dC1vbmx5LiBBbiBpbmxpbmVkIGNhbGxlciByZXVzaW5nIHRoZSBvcmlnaW5hbCBwb2ludGVyIG1h
eSB0aGVyZWZvcmUKPiB1c2UgdGhlIGFkdmFuY2VkIGFkZHJlc3MgaW5zdGVhZC4KPgo+IERlY2xh
cmUgZGF0YXAgYXMgcmVhZC13cml0ZSBzbyB0aGUgY29tcGlsZXIgY2FuIHByZXNlcnZlIHRoZSBv
cmlnaW5hbAo+IHBvaW50ZXIgd2hlbiBuZWVkZWQuCj4KPiBGaXhlczogMDNjM2ZjZDk5NDFhICgi
cmlzY3Y6IEludHJvZHVjZSBzdHJ1Y3QvaGVscGVycyB0byBzYXZlL3Jlc3RvcmUgcGVyLXRhc2sg
VmVjdG9yIHN0YXRlIikKPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNo
ZWxsQGxpbnV4LmRldj4KClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPHRjaGl1QHRlbnN0b3JyZW50
LmNvbT4KClRoYW5rIHlvdSwKQW5keSBDaGl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
