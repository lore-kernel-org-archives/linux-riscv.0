Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A49C369DC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrRlH+fPlgXxmLCmxGU7B5Bs8DhlazO24MdrvtlT6d4=; b=fB30YuESqC+JGk
	m1gfkUvzMRQlBaKeGN2Yi7Q4Pijb9YR68Xh2k1q5LYzPd/9257ifM2f+vBEL/sHUnQXBkd9WwOFlR
	rDoIpeNq4kmrgAmfwDR877Etw9bm2zP50JviCfvksPxt3ai2T2GFEtsBa7UJ9ee7vVQ5DRDpJ8+OY
	wEGjXfRb3xlUECDVYRaZnLMqhHuJOytzJkqbdFOWXZ7/Me41p64Ewp3l6gq5tyuqG5QxCtQV4o/ze
	ykQCA5zblFgOZ8hV3ZMtXGFR4Jw2a4O0UrjmTdmeU7fh7h3qOlMZJvDP3syJmqB7uB7g26ZfvkP03
	k2KXY0Mr8ARZuymVyi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Smp-000000079rK-317t;
	Mon, 28 Apr 2025 18:00:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Smn-000000079qR-1Eqn
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 18:00:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39d94327297so623423f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745863256; x=1746468056; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZwXwtzXWmeQYckV0YYno1wNCKBMqM9oV5/JyBASh3g=;
        b=OmipBDJlB9udCxMhmglIz9Vr2w507SOZBXobXXvWiF5GtbbV/rLGlkrOjXfi8Ic00h
         CAcnA6I06/tor0vkY7DNohd40SOEvft50oLeiIDEgBsHOtigtAU9oSYIavkOZsUqsJPI
         6+TZ+66YczyMLZsdXHz0J1PHnK9KAJJX9O89cMZyyjMgS3Ef4u3mM4ZEYuxjyyJVGXtT
         xRbOyOpZIvxjREFR/Wop7JkTErlOu886/NOqf6faGkcDs78DRR7q+MvM6tVqwAWSIeTh
         n8+3hBuqe8sBET+0ug7ICyFFW+G5NHiEaRWqtVULE65A2IFr3RRCpWNwri8X5SZPi3Qp
         emkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863256; x=1746468056;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZwXwtzXWmeQYckV0YYno1wNCKBMqM9oV5/JyBASh3g=;
        b=dIg11NnS2nyF2IRVWWQ4PDoTq2984SBht3evbhS0v3ebnDK+UWVxjbzHNOq4R3mM1a
         28i7QMYbnLkOJVmh4gNT3EwWy+sXsmRYkMGhzHHtJSToosJqk+G7RflfCedMGE3WkYBL
         IFJ29gYESZGC8rgSH6NkFShEfX6UrW+U64SkRhNShV1+SGYakeiY+SOImUqeuOZl+SyS
         EM0bl0Fg+EXPsHhy6TjzClEDxQdAmh6fA/rNRQX+TIsXfMawE4LP37r1camT6TVlV1XN
         zmTx0ZrIfmZbvbDiiDWwtiflBSPXay74vipHzckHbST8BwuH0izQHbcokZpcelhMOlkc
         0u4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDz6iEFY0UVpa93KFcLhp9qQj5CPoZx261rFNYSAIBZe+5Fe4dBIIJPZjQYIngBKRhYshmmZLdg9YKGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0e2cEdXpBH2qiMcLUuKH1jc2++GxwWUcUU8bhAVVfenMKRt6n
	eVELE0SroptVSNmLADaklnM0E85qpNu0LfHux+PExaA519esSwAnZqBYKj9dhHI=
X-Gm-Gg: ASbGncsyG7EG1Hipoilspj1ahblXa34Nr+UEq8IpLt2kvcD+vq+oKEySvZlcI6nmysk
	U8CMgbh3cjO6JDSHqyFicJzuaM+FpOfX2d/ZEcRxgR3wI3d6Lt4Pdg6XA967akndeK/RyZBeu60
	HB5UYmAqmnUJNdad0jkcg5NMl8Z3uDhWoVwU6NoJjk3UgvHDcHKuQYPiXLIKEg9DDyMio6D70PU
	dhvhp0fOGQJ4m5W733xzXWDYePPQF3hlgrFt+AEoPlI4rMTolqkDT+mlonle+wAT4agBkVZ6MNI
	CpspV5V+LCRR5H1J19nzZ+3aaJ4XqvXho51ntmlzvOemmiE=
X-Google-Smtp-Source: AGHT+IEoLn0qfVLaHBdPIxVZ7lJCgR2On0y4jpuci39/L3rmNtHaRZ20QzdrYfwyAYvWF7jRY9MHSQ==
X-Received: by 2002:a05:6000:1886:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a08a3438camr79148f8f.12.1745863255647;
        Mon, 28 Apr 2025 11:00:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbdb78sm11569680f8f.41.2025.04.28.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:00:55 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 20:00:54 +0200
Message-Id: <D9IGVF0OY4WJ.1O1BX0M2LWUVM@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
 <CAAhSdy1RSpVCUzD+Aqbhh7aiQPmC2zdvuQfuOsmYNJrF3HxCsA@mail.gmail.com>
In-Reply-To: <CAAhSdy1RSpVCUzD+Aqbhh7aiQPmC2zdvuQfuOsmYNJrF3HxCsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_110057_332611_D9DAE49F 
X-CRM114-Status: GOOD (  16.00  )
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

MjAyNS0wNC0yOFQxNzo0NjowMSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU0JJIHJlc2V0IHN0YXRl
IGhhcyBvbmx5IHR3byB2YXJpYWJsZXMgLS0gcGMgYW5kIGExLgo+PiBUaGUgcmVzdCBpcyBrbm93
biwgc28ga2VlcCBvbmx5IHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24uCj4+Cj4+IFRoZSByZXNl
dCBzdHJ1Y3R1cmVzIG1ha2Ugc2Vuc2UgaWYgd2Ugd2FudCB1c2Vyc3BhY2UgdG8gY29udHJvbCB0
aGUKPj4gcmVzZXQgc3RhdGUgKHdoaWNoIHdlIGRvKSwgYnV0IEknZCBzdGlsbCByZW1vdmUgdGhl
bSBub3cgYW5kIHJlaW50cm9kdWNlCj4+IHdpdGggdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2UgbGF0
ZXIgLS0gd2UgY291bGQgcHJvYmFibHkgaGF2ZSBqdXN0IGEKPj4gc2luZ2xlIHJlc2V0IHN0YXRl
IHBlciBWTSwgaW5zdGVhZCBvZiBhIHJlc2V0IHN0YXRlIGZvciBlYWNoIFZDUFUuCj4KPiBUaGUg
U0JJIHNwZWMgZG9lcyBub3QgZGVmaW5lIHRoZSByZXNldCBzdGF0ZSBvZiBDUFVzLiBUaGUgU0JJ
Cj4gaW1wbGVtZW50YXRpb25zIChha2EgS1ZNIFJJU0MtViBvciBPcGVuU0JJKSBvciBwbGF0Zm9y
bQo+IGZpcm13YXJlcyBhcmUgZnJlZSB0byBjbGVhciBhZGRpdGlvbmFsIHJlZ2lzdGVycyBhcyBw
YXJ0IHN5c3RlbQo+IHJlc2V0IG9yIENQVS4KPgo+IEFzIHBhcnQgb2YgcmVzZXR0aW5nIHRoZSBW
Q1BVLCB0aGUgaW4ta2VybmVsIEtWTSBjbGVhcnMgYWxsCj4gdGhlIHJlZ2lzdGVycy4KClllcywg
YnV0IGluc3RlYWQgb2YgZG9pbmcgYSBzaW1wbGUgbWVtc2V0KDApLCBLVk0gY2FycmllcnMgYXJv
dW5kIGEgbG90Cm9mIGRhdGEgd2l0aCBtaW5pbWFsIGluZm9ybWF0aW9uIHZhbHVlLiAgUmVzZXQg
aXMgbm90IHJlYWxseSBhIGZhc3QKcGF0aCwgc28gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRv
IGhhdmUgdGhlIGNvZGUgdGhlcmUgYXMgc2ltcGxlIGFzCnBvc3NpYmxlLgoKPiBUaGUgc2V0dGlu
ZyBvZiBQQywgQTAsIGFuZCBBMSBpcyBvbmx5IGFuIGVudHJ5IGNvbmRpdGlvbiBkZWZpbmVkCj4g
Zm9yIENQVXMgYnJvdWdodC11cCB1c2luZyBTQkkgSFNNIHN0YXJ0IG9yIFNCSSBTeXN0ZW0gc3Vz
cGVuZC4KClRoYXQgaXMgd2h5IHRoaXMgcGF0Y2ggaGFzIHRvIGFkZCBrdm1fdmNwdV9yZXNldF9z
dGF0ZSwgdG8gcmVtZW1iZXIgdGhlCnN0YXRlIG9mIHBjIGFuZCBhMS4gIChhMCBpcyBoYXJ0IGlk
IGFuZCBjYW4gYmUgZmlndXJlZCBvdXQuKQoKPiBXZSBzaG91bGQgbm90IGdvIGFoZWFkIHdpdGgg
dGhpcyBwYXRjaC4KClRoaXMgcGF0Y2ggb25seSBkb2VzIHJlZmFjdG9yaW5nLiAgRG8geW91IHRo
aW5rIHRoZSBjdXJyZW50IHJlc2V0CnN0cnVjdHVyZXMgYXJlIGJldHRlcj8KClRoYW5rcy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
