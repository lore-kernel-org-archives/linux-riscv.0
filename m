Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FFCD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iBV4Y8bOri5e5Bcswzxly/mWe7M4X8X7M0f40h3sJQ=; b=S/989T+THcZUZv
	d16iVXE48gviS0IJRUCyoKxaGndX1LHZNtIYqp7AhhHIeu2G89fiUyqMgqP0+XFn8B/Eoeo60Pz9L
	x+MrRHV9kvMI0csP2qjOHIno4RLzNS6x0N3GeuOpz58yJ1repx5B1h8umgRQoZ7udfVSFd/osXqL5
	7TgAIXVRSPZp+i2bJ/I44TV+kMjL4Kt2XidDC2gn/y+yCwwwuF5cTDl3tGUz6DsYUzl0cilP7fXOV
	qOoPtzpFKsFmBFt0dl7Ffx/1zQXwv4KkcFzUS0hHbqdqfnyGT+ureeTt9CL008Y3QuBvNmwuIhy4U
	GKwCPUeGvFCRTEI5wdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqHHk-00Dw0G-2z;
	Tue, 10 Oct 2023 18:16:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqHHg-00Dvzd-1z
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 18:16:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5041335fb9cso7621758e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696961799; x=1697566599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hk9SwMR88JMFwRJz+djfLXKYapDC2RjUys/bs9HzW9I=;
        b=e+PTHFfAL1pvhxkV0twVFjEAk7fMPO/OOdDNw9NOd3ogAXHMPIFiO25YEI2aRmUQPC
         ni0PS49fJ50/nnL02vz2Fit/atUhV2Jbh3NEAk5i14IASu1vAGiyZU1OMg4quuKI8rd7
         yf24xuhJvKHsiyitMy9VfXFac25LrDkDSpY81AlhBnkhqZduKWtLYfltHxM1aq+dCnlb
         8nFaEuyMc+actev67LM0szPNh/6kA+6qxwdnmlX5oBb/kgd0Bg7y39ORe1VxnbkyV34s
         ICuKP5SaWh3hv/XJV7tdgbL96gnbmgxzUe/hHJzLhi/f1u89NElBFahKBVsYRr4GqpPh
         CtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696961799; x=1697566599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hk9SwMR88JMFwRJz+djfLXKYapDC2RjUys/bs9HzW9I=;
        b=ZHW2B+lFb4zTNCV5IH4pAxl9WGILEJXFPCNysD9qoAajqsbqe/rNDLK+DD31Rr02Po
         y/6kD4UnhZnCvjcSWBRHKXCQs2q6/h75xBp7t2M5+ozOcwelKwyP1w/KZR8VnYWpfQsh
         HmVmC8IbaQewrc15x4z282Zp+PkDyeslc1HsirItkgFc5C6Xpt2K0NXNKtlJwdMVmAia
         7dQ2RGi47AizF4YmsmLNqsaQHCW2DMmKu1sTIAW7QJQgzbZhxSIcF3IjyAYlr7pkfk87
         4z7fNtsxU559WWpBr99UgACDGESee8bUtKCbZBK1PFlXJ9uwOGs/Svo63ywjwZ91c2Ku
         vIMQ==
X-Gm-Message-State: AOJu0YyRRArqT5xHIO8YoWG5gpkj0nKtE5xvNhRFCk+CJaVK2JJJ540Z
	z2g4SAcvFUFjWoUl13kL5w4UhUS0t+Mnol6iloMOsA3QMragDPL4
X-Google-Smtp-Source: AGHT+IHBaIL056ATx7+QDHdvoX5mKkQRMB9X3/jeVHKBprEPjcfSgP/KWr1RL61ETL7III6oZ2S5W9nSjKYBi/fe4oA=
X-Received: by 2002:a05:6512:1242:b0:500:a378:db71 with SMTP id
 fb2-20020a056512124200b00500a378db71mr20960528lfb.57.1696961799540; Tue, 10
 Oct 2023 11:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010165101.14942-2-ajones@ventanamicro.com>
In-Reply-To: <20231010165101.14942-2-ajones@ventanamicro.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 10 Oct 2023 11:16:03 -0700
Message-ID: <CALs-Hsva7Jt5rn2i0Ys22fZxpF_rpq8Lp1ANpE_5fSyHd=OPBw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: hwprobe: Fix vDSO SIGSEGV
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_111644_969089_2913312F 
X-CRM114-Status: UNSURE (   7.92  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgOTo1MeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQSBod3Byb2JlIHBhaXIga2V5IGlzIHNpZ25lZCwg
YnV0IHRoZSBod3Byb2JlIHZEU08gZnVuY3Rpb24gd2FzCj4gb25seSBjaGVja2luZyB0aGF0IHRo
ZSB1cHBlciBib3VuZCB3YXMgdmFsaWQuIEluIG9yZGVyIHRvIGhlbHAKPiBhdm9pZCB0aGlzIHR5
cGUgb2YgcHJvYmxlbSBpbiB0aGUgZnV0dXJlLCBhbmQgaW4gYW50aWNpcGF0aW9uIG9mCj4gdGhp
cyBjaGVjayBiZWNvbWluZyBtb3JlIGNvbXBsaWNhdGVkIHdpdGggc3BhcnNlIGtleXMsIGludHJv
ZHVjZQo+IGFuZCB1c2UgYSAia2V5IGlzIHZhbGlkIiBwcmVkaWNhdGUgZnVuY3Rpb24gZm9yIHRo
ZSBjaGVjay4KPgo+IEZpeGVzOiBhYTVhZjBhYTkwYmEgKCJSSVNDLVY6IEFkZCBod3Byb2JlIHZE
U08gZnVuY3Rpb24gYW5kIGRhdGEiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZv
c2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
