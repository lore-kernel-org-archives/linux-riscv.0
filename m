Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6729FC7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+K8vvV4oO94zFbjtOGJzU2erPys4XCTjZgagSnVpeOE=; b=POrSNmtapis+4K
	yQwveKcIaqBLfMvH1rjUP1RXXDZd3smcA6xjtD6xQypgmzn5yehQ8L/gFkOFCnzZz5fLkjS2g6bha
	a6pukfR0Ogbnt4mkWVE88tBhvwaXUfCjsnwKDs59NIUMKpEA+0Z+rqwYYxrTzLqFxkKgRpB443nC+
	evHILL/+cShIS2tPQUHJ4iq9EK8jFDGLssZXrVP6c9uO5KeP+tL+yad5mJOtoi/EXBWg20mQbMLEG
	MUOtt6lmm/0gEMBcpvobeLljjES7/l1mxUpL5lNoEu9OsSb0yEfBgMzuHE0ll9uQs25lTIqBeWzsB
	BLp8z+ENq8I+IEWwsCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeMD-00000002L3N-32Zk;
	Mon, 23 Jun 2025 10:24:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdtD-00000002Fs8-2Pi0
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 09:55:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4530e6f4db4so1558745e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750672497; x=1751277297; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=gg++P37CblgwovUyd2ovQEaRUWC7M//CIPSvIr2Gd9qrCQNF1rFRLMPxFQjNJKOwkd
         IKfJcFMRLamSMP+jm8ZUrHCkis0QYifbhsEwR4AAvQfUBDo96MCYw4JZrFD2bPpooZT7
         B5jpaVXUF13qiU9BoroND1SR1+dcHY/p7BALNc4s2XmFy3QDHOK7EFlrpPjgRENKWlWL
         YfiFf7r0RK20dh8TnxelD2gq+Qq2vRohx5pFbnVJSPPzOrgvZhlj0TSopPFHGdnkQgws
         ZkdXgICAPJjXC/xz+X7WCT9aBs0gFdzlxKj3YOW1JK+j4OEO/mCmK0CTC+9hiP68bjhf
         3UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672497; x=1751277297;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=Uls3QLdK4A4XlzD875rXa+IL0bEvV/ootjosl376wPhh4x54xyW6rqCzxMF2LMjHvn
         jfyR5IvYjWEQy4EnJ/tC7Ad9B0kiRDDNlTRuWhdO2e82jjoVoo6p+SXtz16i3esThsoW
         qIqtf2q2Pu2Apnp8dDUaA1EfZlreinZ/cJEyHH3eF2lVRUO4Dc+KYG/l73vOpfk6wTyx
         A+rACq+jCKH00YucqCy1FOf4MQaQgEta9SrLwVEI1VV+0GEaYxrlKZJ7JXZaIWA3URsk
         YF8akqh0xLKbW1tXN1Ufw1SuaVn4m4eB8D4EYOSaZsxP064N0qJLyAPh7J/fLSgRr9y4
         CvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFbxfx+DE3Y4tqFvUry9X0RnYLAFWXxSQFQoCIfbKzXRptLzzxsnU42reLprBt0445K0ayY4ukqzup+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB1qp3lrPUbad3Qs6zYZkSsvyG3ylB6yA6jwFsc8zYbYjsR7kE
	EUgqwOCBnnTOqpiE3KC71BgdyvOjAWK/i7FxgVVv4zEVKH9VUiCLWxDTIzOCnE9TxGQ=
X-Gm-Gg: ASbGncsuqPbmThsM4UK4JhBZveHM6uPEbBTJvYlxBr7YzCz3OWq5SlL2osYGE0gm5db
	44CQu9CCUBF1DQHrwxfwovdEAi4YVvlgXTlYFJIWQl/gBw4GuW71FFDtWEQjA8rykppnGeNz4Qq
	Gl0J5DeA0FnfCWSWBxkbc3uxAvkM53rKnITiB1XALZn1autZWHkN2of3r60SXiq007Vs5XM5wQJ
	NT6pabmAF2ixm0mgsx9xlLU2Pb9pqG6sfFCckM+mubif5ctsPPnL2dsE8nRSj1J1/1mtnSeFj9I
	JIaViBSxun4paWH6WShjhDkme9+hM2GoMR5M8YfERDnOJUO4Mbjtr84X8/vNIbCnhFU=
X-Google-Smtp-Source: AGHT+IFkDuNZbXec7bV7lPuMQ95q5Ol9D1Ng0Rhf3YsBGcD5BWQyx/AdkT7xTPlkQyoHbl04rNQmfg==
X-Received: by 2002:a05:600c:1d02:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-453653c105emr39996555e9.3.1750672497513;
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10502sm9198663f8f.18.2025.06.23.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 23 Jun 2025 11:54:56 +0200
Message-Id: <DATTLU8NTTUV.1L05K3TTMV29X@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Xu Lu"
 <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
In-Reply-To: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025459_623377_1571569F 
X-CRM114-Status: UNSURE (   8.29  )
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

MjAyNS0wNi0yM1QxMDowNDo0NSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBPbiAyMC8wNi8yMDI1IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+
IEFuZCB3aHkgbm90IGRlbGVnYXRlIHRoZSBvdGhlcnMgYXMgd2VsbD8KPj4gKEVYQ19MT0FEX01J
U0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1MsCj4+ICBFWENf
U1RPUkVfQUNDRVNTLCBhbmQgRVhDX0lOU1RfQUNDRVNTLikKPgo+IEN1cnJlbnRseSwgT3BlblNC
SSBkb2VzIG5vdCBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGV4Y2VwdGlvbiBieSBkZWZhdWx0IGFuZAo+
IGhhbmRsZXMgbWlzYWxpZ25lZCBhY2Nlc3MgYnkgaXRzZWxmLCB0aGlzIGlzIChwYXJ0aWFsbHkp
IHdoeSB3ZSBhZGRlZAo+IHRoZSBGV0ZUIFNCSSBleHRlbnNpb24gdG8gcmVxdWVzdCBzdWNoIGRl
bGVnYXRpb24uIFNpbmNlIHNvbWUgc3VwZXJ2aXNvcgo+IHNvZnR3YXJlIGV4cGVjdCB0aGF0IGRl
ZmF1bHQsIHRoZXkgZG8gbm90IGhhdmUgY29kZSB0byBoYW5kbGUgbWlzYWxpZ25lZAo+IGFjY2Vz
c2VzIGVtdWxhdGlvbi4gU28gdGhleSBzaG91bGQgbm90IGJlIGRlbGVnYXRlZCBieSBkZWZhdWx0
LgoKWWVhaCwgSSBmb3Jnb3QgYWJvdXQgeW91ciBwYXRjaGVzIHRoYXQgY29uZmxpY3Qgd2l0aCB0
aGUgY2hhbmdlLCB0aGFua3MuCgooVGhlIGN1cnJlbnQgS1ZNIGV4Y2VwdGlvbiBoYW5kbGVyIG9u
bHkgZm9yd2FyZHMgYWxsIHRoZSBsaXN0ZWQKIGV4Y2VwdGlvbnMsIHNvIHRoZSBvbmx5IG9ic2Vy
dmFibGUgZGlmZmVyZW5jZSB0aGlzIGNoYW5nZSB3b3VsZCBtYWtlIGlzCiB0aGF0IHRoZSBLVk0g
U0JJIFBNVSBldmVudCBpcyBub3QgY291bnRlZC4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
