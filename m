Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EBC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDlXwUbZFDlLWVeDd7Nooai61/OZUFyXZNnFOHebp88=; b=eLKFz7infRmexc
	CgpE9tTZyccnTvDKM0SkFCD4yU7fQLu7zG+p00QV6j3I3kN740OiCYa2tzH2cdLaQbxbcwVT/c8Sx
	QkyXdGo5hKGLLgbbukvILHucq2xqfLzw411r0AppzGG5sAFZLXzNHAyJCE1UuS6uHziz1DqLnI4wp
	sJ3tupSFoTTkOHxo0poxunTPctNNJKw958neD/e7pYEmkiyjcrC/IRU9UIXIHn6a9ZzL+E3/s/v2v
	d9hFmJefw37zGHz6GfSkx5wzOuXQ37jddQOKA3nULjVwOXhDqLHzGTGou4SKABv34+wnGJGLQdMdb
	xTa6gL4hRglH7SUPySsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq60t-0000000H4Im-3IJT;
	Fri, 29 Mar 2024 06:46:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq60q-0000000H4HV-3hfq
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 06:46:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2039955a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711694809; x=1712299609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbaidfr8O89WQpFMQeYf+bI/yRRdxomnrj/0LkaKxhg=;
        b=KtG3CBPY+E4t3EdRKjKQXuTP0xNbd/orrTAn5H3i6qtw5cZtX9kxX3mYqf+c0a+wUR
         910kUC6RymgxrOtOtEUp/Ze20AtD9+vFB0uszF12YfoKA1V0ch1VJ4/ThVdW+VW20Fy5
         ccKddNqcvCqdKnXGY5fHBpGyL7V9qVs703zShInr2GlK1nYtwYh7I/AyPWAEuBzGbF4T
         KSpr0SA4x3AAuEsZ9MfpfyC34qIIZDDJkQ5PRGPfciFNeFIN4RZSk3nEG2f2GRQo9BaR
         EdGyeRHfuT6H2HFVbOgHiWQlZ/5xwyfd0C7YWoD64A2I/EnmHO9nvLosd6qC2nhOIwGQ
         mgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711694809; x=1712299609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sbaidfr8O89WQpFMQeYf+bI/yRRdxomnrj/0LkaKxhg=;
        b=ee+Jnvnsib5oIRoym2Vy7Hi+h2q72JOFUzgYJIZq6pNy3K06/IC4XQoo5wDMNsIXCe
         t/ynoDK9ulgbt361xm5KvBWydCu3E7r1WreRYwNysYVuJVDlWUNNkxbko6FnJDb/xuyW
         0gB+8gT6PAO/heyAqLaZmGE8Zn+n6R5rvb7B/lOMKQXaS1St0gg0+7ahhSKThY1xXWxX
         sD1tcvWQ1jNuH/d9ikG1WcXKfLtkPF+8AcZMjfxtuXTPWWUd0ThcaYHY5pZtMA4fkA8M
         kk8/zGV8emak3joOJMJi4Zoj1eUTPojVOxTmJleaQJFiE2MUzPQzFuRJad3BsaiWKpjq
         xokA==
X-Forwarded-Encrypted: i=1; AJvYcCW722KZBeGutAZ/LrjBLWBPY4NLyJh1JELaOcYZxilo3iSre9Cjy9qP3DdVySG14bvidtExLNiL0YniqPEGDe/OtMSS44r6Aax5RC73eQ5e
X-Gm-Message-State: AOJu0Yx9ZMlLp0snt1CNXaZQquLdQDaEzs8Y+VAuDHRlvNBiPIYG33hT
	j7NHtjK5Uvi0ep1O+f+PAbGl7KWrConYmbYsc948JBCNZaOe7xIZ7SZcP0cNIBEZoLufjCdbQo8
	BC8sFVDCzBMbU2AcewNliovWtC6v3DwTD1Ukf8A==
X-Google-Smtp-Source: AGHT+IGIM5oN8E1SXUfbdQUXvLRfq6l9HxvWmiPlknc/i1EvF2LPXuH3k7UYzgJ38hkGGxzmtOG3mTT4NQ325KA7Q/k=
X-Received: by 2002:a05:6402:40c2:b0:56b:ff72:e6bb with SMTP id
 z2-20020a05640240c200b0056bff72e6bbmr764831edb.40.1711694809292; Thu, 28 Mar
 2024 23:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <87ttkro3b5.fsf@all.your.base.are.belong.to.us> <20240327-irrigate-unread-d9de28174437@spud>
In-Reply-To: <20240327-irrigate-unread-d9de28174437@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 29 Mar 2024 07:46:38 +0100
Message-ID: <CAHVXubgMTe83sYaNO+SG=90=k5scaQrpApveTCO163MhUc1tdA@mail.gmail.com>
Subject: Re: RISC-V for-next/fixes (cont'd from PW sync)
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_234653_062083_F2824205 
X-CRM114-Status: GOOD (  23.96  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgOTozMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCAwODo1Nzo1MFBNICsw
MTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gSSBmaWd1cmVkIEknZCBw
dXQgc29tZSB3b3JkcyBvbiB0aGUgImhvdyB0byB1cGRhdGUgdGhlIFJJU0MtVgo+ID4gZm9yLW5l
eHQvZml4ZXMgYnJhbmNoZXMgWzFdIiB0aGF0IGNhbWUgdXAgb24gdGhlIHBhdGNod29yayBjYWxs
IHRvZGF5Lgo+ID4KPiA+IEluIFJJU0MtViBsYW5kLCB0aGUgZm9yLW5leHQgYnJhbmNoIGlzIHVz
ZWQgZm9yIGZlYXR1cmVzLCBhbmQgdHlwaWNhbGx5Cj4gPiBzZW50IGFzIGEgY291cGxlIG9mIFBS
cyB0byBMaW51cyB3aGVuIHRoZSBtZXJnZSB3aW5kb3cgaXMgb3Blbi4gVGhlCj4gPiBmaXhlcyBi
cmFuY2ggaXMgc2VudCBhcyBQUihzKSBiZXR3ZWVuIHRoZSBSQ3Mgb2YgYSByZWxlYXNlLgo+ID4K
PiA+IFRvZGF5LCB0aGUgYmFzZWxpbmUgZm9yIGZvci1uZXh0L2ZpeGVzIGlzIHRoZSBDVVJSRU5U
X1JFTEVBU0UtcmMxLCBhbmQKPiA+IGZlYXR1cmVzL2ZpeGVzIGFyZSBiYXNlZCBvbiB0aGF0Lgo+
ID4KPiA+IFRoaXMgaGFzIElNTyBhIGNvdXBsZSBvZiBpc3N1ZXM6Cj4gPgo+ID4gMS4gZml4ZXMg
aXMgbWlzc2luZyB0aGUgbm9uLVJJU0MtViBmaXhlcyBmcm9tIHJlbGVhc2VzIGxhdGVyIHRoYW4K
PiA+ICAgIC1yYzEsIHdoaWNoIG1ha2VzIGl0IGhhcmRlciBmb3IgY29udHJpYnV0b3JzLgoKVGhl
IHN5emJvdCByZXBvcnQgWzFdIHJlcXVpcmVzIGZpeGVzIGluIG1tIFsyXSwgaWYgd2UgZG9uJ3Qg
dXBkYXRlCmZpeGVzIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IC1yY1gsIHdlJ2xsIGtlZXAgaGl0dGlu
ZyB0aGlzIGJ1Zywgc28KcmViYXNpbmcgLWZpeGVzIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IC1yY1gg
aXMgbmVjZXNzYXJ5IHRvIG1lLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzAwMDAwMDAwMDAwMDcwYTI2NjA2MTRiODM4ODVAZ29vZ2xlLmNvbS9ULyN0ClsyXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMjYwNjMwMzYuNjI0Mi0xLW9zYWx2YWRvckBz
dXNlLmRlLwoKPiA+IDIuIGZvci1uZXh0IGRvZXMgbm90IGhhdmUgdGhlIGZpeGVzIGZyb20gUklT
Qy1WL3Jlc3Qgb2YgdGhlIGtlcm5lbCwKPiA+ICAgIGFuZCBpdCdzIGhhcmQgZm9yIGNvbnRyaWJ1
dG9ycyB0byB0ZXN0IHRoZSB3b3JrIG9uIGZvci1uZXh0IChidWdneSwKPiA+ICAgIG5vIGZpeGVz
LCBhbmQgc29tZXRpbWUgbWlzc2luZyBkZXBzKS4KPiA+Cj4gPiBJIHVzZWQgdG8gc3BlbmQgYSB3
aG9sZSBsb3Qgb2YgbWluZSB0aW1lIGluIHRoZSBuZXRkZXYgdHJlZSBvZiB0aGUKPiA+IGtlcm5l
bCwgYW5kIHRoaXMgaXMgaG93IHRoZXkgbWFuYWdlIGl0IChUaGFua3MgS3ViYSEpOgo+ID4KPiA+
IE5ldGRldiAoaGVyZSBleGNoYW5nZWQgdG8gUklTQy1WIHRyZWVzKSwgZmFzdC1mb3J3YXJkIGZp
eGVzLCBhbmQgdGhlbgo+ID4gY3Jvc3MtbWVyZ2UgZml4ZXMgaW50byBmb3ItbmV4dCAtLSBmb3Ig
ZXZlcnkgLXJjLgo+ID4KPiA+IEUuZy4sIHNheSBmaXhlcyBpcyBzdWJtaXR0ZWQgZm9yIC1yYzIg
dG8gTGludXMsIG9uY2UgaGUgcHVsbHMsIGRvOgo+ID4KPiA+ICAgZ2l0IHB1c2ggLS1kZWxldGUg
b3JpZ2luICRTT01FVEFHCj4gPiAgIGdpdCB0YWcgLWQgJFNPTUVUQUcKPiA+ICAgZ2l0IHB1bGwg
LS1mZi1vbmx5IC0tdGFncyBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0Cj4gPiAgIGJ1aWxkIC8gdGVzdCAvIHB1c2ggb3V0Lgo+
ID4KPiA+IFRoZW4gcHVsbCBmaXhlcyBpbnRvIGZvci1uZXh0Ogo+ID4KPiA+ICAgZ2l0IHB1bGwg
LS10YWdzIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNj
di9saW51eC5naXQgZml4ZXMKPiA+Cj4gPgo+ID4gUGVyc29uYWxseSAob2J2aW91c2x5IGJpYXNl
ZCksIEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBlYXNpZXIgZm9yCj4gPiBjb250cmlidXRvcnMuIEFu
eSBkb3duc2lkZXMgZnJvbSBhIFJJU0MtViBwZXJzcGVjdGl2ZT8KPgo+IEFmdGVyIHlvdSBsZWZ0
LCBQYWxtZXIgc2FpZCBoZSdkIGdvIGZvciBtZXJnaW5nIGhpcyBmaXhlcyB0YWcgaW50bwo+IGZv
ci1uZXh0IGFmdGVyIHRoZXkgZ290IG1lcmdlZCBieSBMaW51cy4gQXQgbGVhc3QgSSB0aGluayBp
dCB3YXMgdGhhdCwKPiByYXRoZXIgdGhhbiBMaW51cycgLXJjcy4uLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
