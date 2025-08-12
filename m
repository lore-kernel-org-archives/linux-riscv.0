Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D93C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GEl04kJNwkZgdtRbFDZxHBUSkj3sSMTv1CRUJvOr6w=; b=nxCZC9NRMA4PPf
	qtTd9NSL7gF7SpqPAx4MQgwnKojnxzhgi3zf6PPwDHziwgNDr5sACXgl/smW0PF2O2U+4GQ6R4kwi
	uR4HkvSLUcZHblLnqqZBfd1N+wRojIM5YiLpje3GTU4O+vBpFVmDz5UCbcBNiZmu161ZHB7KWd/lZ
	G8tI8IRrXl62LQpKz9JvVeFgmO49FTxVD0Co+q5b/RIJMfAMbVVW06yaDboO5XmYt1cCncVP5hZ3y
	69BhStSyrNrkyE4cLYginy87iuz/8vk/C1KMkaV/nJtrc5kqljApJtloLeZ3liSODbeuLrj8YJwF8
	H2YjeIvdpqlojoE9d1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsqU-0000000Ba4d-2Aab;
	Tue, 12 Aug 2025 17:31:34 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloZ0-0000000Aqqh-33ty
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 12:57:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso4972498b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755003433; x=1755608233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CQwup3JJa1ayhdQThgOgG4MUx5X/EUx4Tii1T+qif0=;
        b=ZHfvIb2W0wVUDnPnmdRYEDbUrer53eVb4ljgU3Pios+S15mh4hJcVaAcdjsnFpf7f6
         X8hr4z3EkXlDX6hjQz4RHwTjqO7EctOwd3qps3haO4LIHRcAeiDac274MHA2Zpsr+IiY
         7qYj/YQKG+CQgg9hbY6fYERP2MFOMeitiSv94VIDV6/GkCzkZLU6sWamVp8MRpGI42il
         d16W6auBIZrQEAFwGjo+HfvMDH+ou+FmEsdIx+o7trJzBdUHsysbUBlp7qNNzw90yH0i
         07F601+6YSezKntMphJpn7DJcedFiYp+FBshZhVuIZnlsiNGO62fMo6itLQGEtnFtCDi
         r7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755003433; x=1755608233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CQwup3JJa1ayhdQThgOgG4MUx5X/EUx4Tii1T+qif0=;
        b=joDKFmtvx5FfDNvzcotYFQCIxEAHWalkYD2Vk83j5yCsmmm1l7eng4I0UTAx54Tzr/
         8aAJj3oi2IzpbYJ6Ab25IBgSA6zVqo8mMWiQuJL3eAhiT4ceCrAPHMeVAEhj6RNCdpTD
         QgTbGlpb566ffSj559BFvYKSAFA6+AtPr85tulwIwLNQ8OKZ51nwaxOUhymlpptxLVxV
         rpx6qwc0SN7JzferyS5sVfHNSaJGeVJbbotl3DiGy1bTwWeJ4W4zsT+374D3dYf4Pqy1
         gYSfMAmQtQJQNu8zY7AfmefLqJR+Fzkf4dDtGwLB0Boh57VZbsct1zwjoRHpk1zMejrQ
         XccA==
X-Forwarded-Encrypted: i=1; AJvYcCUXMrq5B7Saa6IoTd165c1mxUroIjTlBekryRR1JakdrTI7DFF3M2P/HKL61YInIsoS11OpO/N6w8jPEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6oH3xGF7kscWZuN0Fae8N3MX+IFVB/Fyky5ALytkNvUp/Bfw6
	RikuYmMy7NvKCvq7dTjTmE/pxeFldprMSWa4PTgmt29qSRDztsvM41mzi27tPeMAoqk=
X-Gm-Gg: ASbGncv9IqyRPqxCC3g6NfmmKurgUKdmJq54G3aDQC4ED4wC+FeBQyRnJ5iskQhT4ck
	1nbqqEVeBjWw7a6S9brZYkOO8X99z4kyM9Tuo98fdfYL0gvL5iTf4mIJsiHEKq4aYQVwhlZc7Df
	ranTZjncqBQrIgncb1y4XYjnXjOhk270ljFpVuC4aXBrAG7ISeWeoatNddh9ohueJkE8+EXON48
	RFRmgd9sl9UZHFY20flszvyEapWeOmWH+F8mTkgG2j/5TWPuzPeJ0hKr6V2TLu3TNszdf9WinHp
	QlJvLSXhI77ZoIjZwDqft04OECA6jb/Rei15ZaB2c866vxzkq9kOcrf8ZlbEYH1Erp9QpxHnne/
	ztIfglFR0v1+WvNP1bV2n1QW3Jhv61lCUJj9nBBKg3xQwULiXo0PFV9AV+XVXZfbzbVwxY3vTe7
	Nt9A==
X-Google-Smtp-Source: AGHT+IHLx2NmNN4eIHAGhJaj/DxTDLbTh85qThe6wdpXJOc29/KjHDsxypcCoyrdkW0QCjfRPpKYfQ==
X-Received: by 2002:a05:6a00:2d7:b0:76b:cf2b:18bf with SMTP id d2e1a72fcca58-76c4603e0c4mr17297275b3a.2.1755003433445;
        Tue, 12 Aug 2025 05:57:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd98csm29222812b3a.67.2025.08.12.05.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:57:12 -0700 (PDT)
Message-ID: <56c18c70-ebb9-4018-b8b6-9041337bb3c3@rivosinc.com>
Date: Tue, 12 Aug 2025 14:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v6 3/5] drivers: firmware: add riscv SSE
 support
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
 <20250808153901.2477005-4-cleger@rivosinc.com>
 <CAEEQ3wmUvQRx3HLG=i7fk60-wf1AtYmjV20Xbe2c5_RHi1c1gw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAEEQ3wmUvQRx3HLG=i7fk60-wf1AtYmjV20Xbe2c5_RHi1c1gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_055714_906951_5D1DB5A2 
X-CRM114-Status: UNSURE (   9.05  )
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

CgpPbiAxMi8wOC8yMDI1IDE0OjU0LCB5dW5odWkgY3VpIHdyb3RlOgo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHJlZmVycmVkX2hhcnQp
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZXJyX2V2ZW50X2ZyZWU7Cj4+ICsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY3B1ID0gcmlzY3ZfaGFydGlkX3RvX2NwdWlkKHByZWZlcnJlZF9oYXJ0KTsK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3NlX2dsb2JhbF9ldmVudF91cGRhdGVfY3B1KGV2
ZW50LCBjcHUpOwo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNzZV9zYmlf
cmVnaXN0ZXJfZXZlbnQoZXZlbnQsIGV2ZW50LT5nbG9iYWwpOwo+PiArICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocmV0KQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX2V2ZW50X2ZyZWU7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHNzZV9vbl9lYWNoX2NwdShldmVudCwgU0JJX1NTRV9FVkVOVF9S
RUdJU1RFUiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9T
U0VfRVZFTlRfRElTQUJMRSk7Cj4+ICsgICAgICAgICAgICAgICB9Cj4gSXQgaXMgbmVjZXNzYXJ5
IHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWU7IG90aGVyd2lzZSwgdGhlIGV2ZW50IG1pZ2h0Cj4g
YmUgcGFzc2VkIGFzIGEgdmFsaWQgdmFsdWUgdG8gc3Vic2VxdWVudCBsb2dpYywgc3VjaCBhcwo+
IHNzZV9ldmVudF9lbmFibGUoKS4KPiAKPiAKCkhpIFl1bmh1aSwKCkluZGVlZCwgbmljZSBjYXRj
aC4gSSdsbCBmaXggdGhhdC4KClRoYW5rcywKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
