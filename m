Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C18C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 06:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHxBEbqMk1Fwvc8Mnd71WLtTkHMgEOGd0kMU87rbFfU=; b=UWn367SuzofaC6
	xHjXCRkPwJQF198S+eA5r7rAonQIBVus3wmqw1jsQodMj/zlsWfTIDID27ceKRI4mUbNWo/JO3But
	95INgDTlX9u3VxsoiJfcsXBRPDOTb7tCCqAH4GC5inqQCoVLv2w5GOyNJRXI70m0JzEPUTPxL6byj
	lgpfnWSbXpz7BgV2E9mcW2rwb6E2uK0rtVX0ocNEOwxzLO1YiVvBGp0TFNqrtg5TQBjLlfp/0+I7F
	Z0WEUXe54M19omj18lkdKNGAA2+XZ/zO/0q2JeKRqZLygmmgVWetuuCEIwvgwdzTTnQshAiYbjlAZ
	zs2p7RAez4iih0WkQl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua73c-0000000DpZp-1wEC;
	Fri, 11 Jul 2025 06:16:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua73a-0000000DpYW-0LVV
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 06:16:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso327542f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752214584; x=1752819384; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47YogP8wO1/1CZX6L6M640j7zCn7xq2x3uPbrcgBo+4=;
        b=iP8mPppKiB4yOBjeXj5bnN7tCriKdu1xbPHqc4vWJByO1LB388f8ldBF2kKsaZtN3e
         otPQQbpvHQVLQc+QbQTlO9mNqfDD5z5XFQr8wjtuybm569b9qHGxStJdPgSjNbehmlsV
         iMJLaxvh05DFwPbjZfzFB8uI/ATPW4HXt3s/3ZVdDu1NU95Z0M05OkUXFJIg7w8UbokT
         9dMtRIl8uBBA99KPpqa6KbT2wAThB1lAQdM2sDOYmJoxnVF4hhKZLM4CGJzpRw9GoRik
         gj6n5pEx4f2SjuJzOdKDMVN9oQ3hvGdaPMJJMfOzTM/ng4pm1l0AvNeiktKmIw/+XjLc
         pLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752214584; x=1752819384;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47YogP8wO1/1CZX6L6M640j7zCn7xq2x3uPbrcgBo+4=;
        b=U3S6tyMUogkJcwI3KKSyAG63H6r4HXvoTAWNLTPk+Xc6GyEdwxap+UtTCUmKg943gh
         YEQtIeLTa512Y1PtyBRPsRSkjfJeBj/Qf37AP046/oITEEnJFeLbtQyg8jYYhHBX/qLs
         5I8OWt7D8t5rujhZhBplPxO7oqd8MqqhxzQ2W3Wb4HnYb2jmkeOKkICcXyHuLnWyPAq2
         VTk97USiQZOodkk2ecyiMbBs0WZUfLfTeF28hgJUQoa2TyMlnRxIBwrn030f4eIHS+pg
         eWinxAmyJhT46fa35JhapXStAePMMOk4yny0dzTCfQcy/y4A6rxIUIgwfgXv+lXdDSLG
         n+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUlr56qJBtCwV6mW6s2dNK5KIV1Q1uOt0Dk5nkNVoqJvD/PONmUIG5/FKlPIidVWTnoBD6O7/oCzo6S5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFWUlMmOTo/qvu38sf1Ygb/pY/GBM+AXNSvXvpcmfkudMa7y4k
	xWsrSVtmh7pkg8SLrvOTX14p7Ys6AA+mgOlqQqfDm3oUqdaSDo4rOumYhO8FmAwIQnw=
X-Gm-Gg: ASbGncspQSGCYiWgCkmdcH27z0EwkwPQREJfHbvYRyrUeOMCBsapmVQo8t71PVVZAWM
	c6h+r41pmcXzbEYDieJI4Z5U+rPwcpXLANl9q9gcCIt1G/3pBgnRprHL+deOngd2knm4bu19pBk
	i1LsegQiGJd6E0KrF4Ej4cbcgKlvFqQ1B5QSS+ryL4VqdfwhDmlWg+yvslShlvUzs8nMpL8Lx3E
	V4TRJ0HOwhzRgq11tDlnDLLrgL9vJYhumCTRCWmMt50NBmX1PBdTiAwyG4TVIhQkoxbR4KuU/lC
	pz8zK7jOlyNwO/DVlPRJo/3W+tvSnLpYBnDWjeAUGKwNvh2wMf2ykYBrh1wQQ/U6rWgtNTs1UpS
	4IV4Acst7FBDawlZ5Qkq/KQTyM1qf4hUdNm4lnu6r7BJqtihe3RVA78V/RQ==
X-Google-Smtp-Source: AGHT+IFmrp2wvx6BT0KyJb8OkHRj5zkFsyk74vrJoJEn0B8TRag/YIYDZNX5MR7sI4EZ9patSQYdRQ==
X-Received: by 2002:a05:600c:4714:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-454f4254765mr5662365e9.3.1752214584185;
        Thu, 10 Jul 2025 23:16:24 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm37076735e9.12.2025.07.10.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 23:16:23 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 11 Jul 2025 08:16:22 +0200
Message-Id: <DB908AUW6N76.3SYAGIFGCDJ27@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled faults to VS
 mode
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>, <cleger@rivosinc.com>,
 <anup@brainfault.org>, <atish.patra@linux.dev>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250710133030.88940-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250710133030.88940-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_231626_119156_9F7AA1D7 
X-CRM114-Status: UNSURE (   7.63  )
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

MjAyNS0wNy0xMFQyMTozMDozMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+Ogo+IERlbGVnYXRlIGZhdWx0cyB3aGljaCBhcmUgbm90IGhhbmRsZWQgYnkga3ZtIHRvIFZT
IG1vZGUgdG8gYXZvaWQKPiB1bm5lY2Vzc2FyeSB0cmFwcyB0byBIUyBtb2RlLiBUaGVzZSBmYXVs
dHMgaW5jbHVkZSBpbGxlZ2FsIGluc3RydWN0aW9uCj4gZmF1bHQsIGluc3RydWN0aW9uIGFjY2Vz
cyBmYXVsdCwgbG9hZCBhY2Nlc3MgZmF1bHQgYW5kIHN0b3JlIGFjY2Vzcwo+IGZhdWx0Lgo+Cj4g
VGhlIGRlbGVnYXRpb24gb2YgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCBpcyBwYXJ0aWN1bGFy
bHkgaW1wb3J0YW50Cj4gdG8gZ3Vlc3QgYXBwbGljYXRpb25zIHRoYXQgdXNlIHZlY3RvciBpbnN0
cnVjdGlvbnMgZnJlcXVlbnRseS4gSW4gc3VjaAo+IGNhc2VzLCBhbiBpbGxlZ2FsIGluc3RydWN0
aW9uIGZhdWx0IHdpbGwgYmUgcmFpc2VkIHdoZW4gZ3Vlc3QgdXNlciB0aHJlYWQKPiB1c2VzIHZl
Y3RvciBpbnN0cnVjdGlvbiB0aGUgZmlyc3QgdGltZSBhbmQgdGhlbiBndWVzdCBrZXJuZWwgd2ls
bCBlbmFibGUKPiB1c2VyIHRocmVhZCB0byBleGVjdXRlIGZvbGxvd2luZyB2ZWN0b3IgaW5zdHJ1
Y3Rpb25zLgoKKFRoaXMgb3B0aW1pemF0aW9uIHdpbGwgYmUgZXZlbiBtb3JlIHNpZ25pZmljYW50
IHdoZW4gbmVzdGluZywgd2hlcmUgaXQKIHdvdWxkIGN1cnJlbnRseSBnbyAtPiBIUzAgLT4gSFMx
IC0+IEhTMCAtPiBWUzEsIGluc3RlYWQgb2YgLT4gVlMxLikKCj4gVGhlIGZ3IHBtdSBldmVudCBj
b3VudGVycyByZW1haW4gdW5kZWxldGVkIHNvIHRoYXQgZ3Vlc3QgY2FuIHN0aWxsIGdldAo+IHRo
ZXNlIGV2ZW50cyB2aWEgc2JpIGNhbGwuIEd1ZXN0IHdpbGwgb25seSBzZWUgemVybyBjb3VudCBv
biB0aGVzZQo+IGV2ZW50cyBhbmQga25vdyAnZmlybXdhcmUnIGhhcyBkZWxlZ2F0ZWQgdGhlc2Ug
ZmF1bHRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFt
aWNyby5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
