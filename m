Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0225C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfGSl2ZeQwTSp/NDjTHy1Xzx/1KlS0NrG9TqwVZ7Lpo=; b=x+oiJRWguxMxY7
	6aE8xi/l3mfp0xR2UCEhpENhWppguwHWeEwuu1Lno8+3ggmTPlkEO3DogUhfLa/3ijHNBRuqt5dWP
	Hs+wdBsAuyo7Kr7WfAHFTqEGQhHSwGYz63qusG/U/9TrW78UznqAfm6oiXhiNM0v0IblzdafES7Hg
	BFmZNupufiuNiXc/ts0Qm5js5ylAR3KIAg1AWdONDCBsQ1l74YgSqijMbhStVGn5FnzitXKz+iVBL
	sHsCSpv8ZSbCMOpZp5Kwbv3MKOCZUqYnM21BJaKNj1Ij5pW8LceVZ4XLtCAYH7u3yj6vEQyBNsLSv
	H3djeKpS1hSjVNBctX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJMf-0000000DKB8-3lR4;
	Tue, 20 Feb 2024 06:12:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJMd-0000000DK9b-0ME7
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:12:24 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so39998351fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409541; x=1709014341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45sEQuqSChb4TFdk2aFCbPunV2X7Zp2Ggfs8QlVxLCE=;
        b=gQG1dsg8By29mVDseOvnugCldqAkvFQrZPi99kHvopQ/WIpPQha6YxqianFVgt0LWO
         SYxyiff7f45hhxvgXm6LlJlDYOeqdupSwYBPCg0AFp2P1DMu3SgfnJgIQdy2SadeLatH
         1lgmVkCm+wenTU8qZwiAXaVm50wkZmkKzTrDmP9GjVlPLB54IQEHW5ZTRZPh/nR1x8g9
         L6DAG/cCdugNi/xRCWNEuQLroY6Dh5GlElTBMKAM6oSjY93wJJ/hkXJUM95ookoc7Sw5
         r43MSzogVPRsuXz37A8hIs5sqe4Xc8Aa5GQK6tF2b2cgtmb2usdyqEwMWNfDTOftdnan
         JEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409541; x=1709014341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45sEQuqSChb4TFdk2aFCbPunV2X7Zp2Ggfs8QlVxLCE=;
        b=ma+Njo9ZnIuFVTq5CXN98fhBhAZ11X0SiolK9ITv4H55b2wRvwjarGROdfKaKvPCM6
         86/saJ3nHVkSy1hduNTF1tZtUzg6hOo1pqZ1La6+FaQgUazioynuzscSV8f8QSCYnceh
         AFKU/Y12Riwe/TDDbVkDBq5V6ncm6b08r6ERFLqLYgTD18/tA26fZB5eXUK/tYEbsath
         NQNjvHvs8eFyP4DfbgXkQJuea+sPh+zDIQHgyywldCDuWzq/5NVtEAPy/kIgAroOWHj+
         DhAPQ6eLzu9WZ1tpjZnwC8DJTHjhAJF271K37KWch+nj926owAxiDqCBcS3VRCztvDMz
         PSgA==
X-Forwarded-Encrypted: i=1; AJvYcCVgkVe5EvNyigA8pQZLH4R5yMMw1hcmo3scIzSijHA815JIqRsyWAbJwWz4aTW4EnA8tdGIu6A4N0Sv+H/3QTUM/IpBoui0+mWZOsDjFCKG
X-Gm-Message-State: AOJu0YxRCw9aW+1iGNIO86sfVOcW6D3uo8MewWwKKc7Pev2A7N6kbZcy
	6hnkKb2OrvTvXds9RRNy5DuA1ox16WgKJXhzL7CD2hA5t8gx2pjnE0A++o7uH+AN6b3JoJx3oP9
	PzVrezFdvj3jcdOqVUEi7/iQpCtLORfzrNsFk/NJVgLGG8N06AlI=
X-Google-Smtp-Source: AGHT+IHMJBI/oMtcWEZVPK92GP05YnjcAeWF8XgBIuxDTLOi4XZzV5Qx4HMrS5IUdIaPjB4EYUfB3IKgxGQZLGSs3mQ=
X-Received: by 2002:a2e:b8c8:0:b0:2d2:bd9:f100 with SMTP id
 s8-20020a2eb8c8000000b002d20bd9f100mr10605944ljp.20.1708409541306; Mon, 19
 Feb 2024 22:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com>
 <87bk8ig6t2.ffs@tglx> <CAK9=C2WsSSHgDF+7ruxx_QF0Lk+Dsx2F2Y-_NabnxrJ_qWhgGQ@mail.gmail.com>
 <87v86pcxcb.ffs@tglx> <87zfw0azmn.ffs@tglx>
In-Reply-To: <87zfw0azmn.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 11:42:09 +0530
Message-ID: <CAK9=C2W3cv0yd0faMrKjKwmSjGQ4zVVMkcbr=PtxJ1K0sn=SLQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_221223_147423_CB8CCDA6 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, "Ahmed S. Darwish" <darwi@linutronix.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMjozNeKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IEFudXAhCj4KPiBPbiBUaHUsIEZlYiAxNSAyMDI0IGF0
IDIwOjU5LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gPiBJJ20gZ29pbmcgb3ZlciB0aGUgcmVz
dCBvZiB0aGUgc2VyaWVzIGFmdGVyIEkgZGVhbHQgd2l0aCBteSBvdGhlciBwYXRjaAo+ID4gYmFj
a2xvZy4KPgo+IEFzaWRlIG9mIHRoZSBuaXRwaWNrcyBJIGhhZCwgdGhpcyBsb29rcyBwcmV0dHkg
cmVhc29uYWJsZS4KClRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpJIGhhdmUgc2VudCB2MTMgc2Vy
aWVzLiBQbGVhc2UgaGF2ZSBhIGxvb2suCgpSZWdhcmRzLApBbnVwCgo+Cj4gVGhhbmtzLAo+Cj4g
ICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
