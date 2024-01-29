Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04462C47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOgHqbvNaaZv66X7EwiHN1+hslHjpkh5EzdrWlFiZUY=; b=HypQwwVJ/OXKGn
	T7WI7QcbfEdVES4bRxm8R+XczfnQqysw8cJYctTPW4Eh3nyo6JW3QwCeGgRh3w5gP0faCuDdaZUy1
	nI5ig6kP8U9cEse9Lje/NN8A+8sP1QJDdAiD3rUrOpCUnWiOorBUPn7ryHb7Sn+spz5OuxEbuiKpU
	D9zIeBUl6/pr4jTuW79FyW2Dy4xGLzEczMcJ2vgN+jVhRPF4MMBi/eVgENjQiFhoCfM7JyxAgz3zk
	9Fd7uSop9svkZF817li1ydd42Ax+c+g8PdBR4Zi0UAADEagNPdtIrcFel7MxqeraIdNE36nC3Kb8x
	LbLrCZ6Maw4znxiVOVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUGTq-0000000Aw8v-0p5k;
	Mon, 29 Jan 2024 01:30:34 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUGTm-0000000Aw8G-3hgh
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 01:30:32 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21428d99395so1487411fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jan 2024 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706491763; x=1707096563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ADClRzg4AS1tsrl/EnTtXjRsNE1syTriY+hJ47tGK8=;
        b=DrzvsQykcM3CtQCn3U4lg2VgtAemYk1+OCzn0timhYoPU78yVrL+K+mS4Oks7VD11x
         8FETQg6Ohtcc1jirFWNFt01yriekqKFS2JkdY4W3rTqc8jDH4OHMPXQAuflmusjlrYC7
         yJSu1BXgjoJqHzNqwDaM+4gJhKNxeZi6JgW68mxrNckBQVXP/9xw3N3W1V7RT7S7uVoZ
         d3Fwydkllou4J9lS9vAo663Ak7ZpshnC5kzOVRNkGh0ekmfL0AFZ1grT5Adzh3IuNtxm
         notvW0Lc6m6sdVyZqIsGVuvkWzJnoPa4WpDdLBL3VtNnbmOe8q+YjDfJ9P65qjEHV7FA
         bnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706491763; x=1707096563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ADClRzg4AS1tsrl/EnTtXjRsNE1syTriY+hJ47tGK8=;
        b=rh0jF3LFvRLvd9+qISFMWgdr3CkzKz2vId4ZjgbQ4S0iY2paeLtONxKXMjd/VQauYk
         KHPwMSFw5bZoxqjidkmG2bja0hBpDF9gl4PmDlYpnrQSTlVwwc9ZORdr7nUXQ9BC3b7u
         vfjiVcEr1t04ZNwOWeeVaiOmZueS5KtWPe3YRIcFjJ8Yp0jHCdxrvsnQarFya5DC9ID4
         wlza4TMHMt4onCScW+6Gyw0Hu0JTAVlYxnzuNcEFgSaInA5XRePwtDO+00ve+zVqraeZ
         B84dJXv4HN5QUjFHi4MH7sQqybf7b50DevPMW4loxUscWW1dJ4hAIv9XTLUp+j+mEtXN
         d5qQ==
X-Gm-Message-State: AOJu0Yzwh63ckL1pd5gthJhDBE00eyoRO/n6j6BKt6xqFip6MigNxHC+
	u7+b8jsi5/Rv+kMV9bYyiIha7ttu0G8rqQaKbWTCDKVITKZGl8ABIhldG1uSOpaCV35dS8Yqlk4
	DvDiUPAyPuR0i6Y2HQCi3nJ6RnKVW3mj9BgiUSA==
X-Google-Smtp-Source: AGHT+IHxOmZo5QvFvZVHbFICSOQ9hCxlC30D35e6G9303kFUISqid3pEYinYw80ReoUbB+cY47+J7zU5l3qDTKldn/I=
X-Received: by 2002:a05:6871:6ac:b0:206:6110:ff59 with SMTP id
 l44-20020a05687106ac00b002066110ff59mr1659533oao.27.1706491763016; Sun, 28
 Jan 2024 17:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20240125062044.63344-1-cuiyunhui@bytedance.com> <CA+V-a8s4No=U1S-KzLAmOLYa6vXd7repFP4HH1=SraLB2=qHRQ@mail.gmail.com>
In-Reply-To: <CA+V-a8s4No=U1S-KzLAmOLYa6vXd7repFP4HH1=SraLB2=qHRQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 29 Jan 2024 09:29:12 +0800
Message-ID: <CAEEQ3wmVT_Lo3Jsoj-yp-3RCEfu=D7QKJq110sN-2a-wV+R59w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor flush_tlb_range() support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, dylan@andestech.com, 
	sergey.matyukevich@syntacore.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	jszhang@kernel.org, apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_173030_967973_68997615 
X-CRM114-Status: GOOD (  11.82  )
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

SGkgUHJhYmhha2FyLAoKT24gU2F0LCBKYW4gMjcsIDIwMjQgYXQgMTo0MuKAr0FNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEph
biAyNSwgMjAyNCBhdCA2OjIz4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+ID4KPiA+IEFkZCBzdXBwb3J0IGZvciBmbHVzaF90bGJfcmFuZ2UoKSB0byBp
bXByb3ZlIFRMQiBwZXJmb3JtYW5jZSBmb3IKPiA+IFVQIHN5c3RlbXMuIEluIG9yZGVyIHRvIGF2
b2lkIHRoZSBtdXR1YWwgaW5jbHVzaW9uIG9mIHRsYmZsdXNoLmgKPiA+IGFuZCBodWdldGxiLmgs
IHRoZSBVUCBwYXJ0IGlzIGFsc28gaW1wbGVtZW50ZWQgaW4gdGxiZmx1c2guYy4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0t
LQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8ICA2MSArKysrKystLS0t
Cj4gPiAgYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICstCj4gPiAgYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMTk1ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDEwMiBk
ZWxldGlvbnMoLSkKPiA+Cj4gQm9vdCB0ZXN0ZWQgd2l0aCBkZWZjb25maWcgKyByei9maXZlIGVu
YWJsZWQsIG5vIGlzc3VlcyBzZWVuIG9uCj4gUlovRml2ZSBTTUFSQyBFVksuCj4KPiBUZXN0ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KPgoKVGhhbmsgeW91IGZvciB0ZXN0aW5nICEKClRoYW5rc++8jApZdW5odWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
