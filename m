Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C29C3DA5E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNkYuXH/sQ3wUbi8GslhYguDFHWZ/rq/JXxYvY+M6fE=; b=s7rqCYpB462zyi
	WgHzK2G2xBB75mREyCSxLFOrqxUPySqq/Zu369aF8V1LYdw7W6O7kRjwhO4M+4nTBH+xDI4n60MWh
	fiM6rbYcQlyILqIvB68PJtN2pagQ0v9IVPbM1TRv5HL7CMqL+mxgaUFK97jOW066yl6xH9DjS8ZPW
	jfKA7xXzDJbs123Jl92nlyL9CC0g5rSntogtvBS9y+4rGmvFa0Klul4/l+xMOPZviCS7AU1wNEBS4
	CTwJKvJT8Gu6sMN8QGJ6/awnzVS6kNwi41vCZQWsYA9jbY7Q+vWUWXyutU/B/elPkgeOxulVmXbjN
	Q8mVTS5O9EVtZMELHCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKDO-00000006vB0-3Euq;
	Mon, 15 Jul 2024 11:49:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKCc-00000006uoj-0Ww5
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 11:49:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a6fd513f18bso445638866b.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721044148; x=1721648948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWUt7fUeOslaf3J86kT2EHlZPfYeTYeze0uqvoVnIhg=;
        b=phm13hQ8E0MPF9XydF79A0pYAJf9wCCGOVkDr/TkL8TZ2S8Bzu8+npH4q831TEeeX4
         ryUlSmi6x5f3sXZwNDIrGr419C5lhZdevNFrxKKTW7KAQzphVJzYskbRwopx89yFebuP
         rd2JcTUt5I+EUqtXLL1V2Enos8ISoTfZQ0iOBhbLfaR75MLenxYnCfjzVX8SugYyNwFm
         pS+ni6JNKMWfL8YsL8KrXohXfe8NCYrzSzttcwhqk5E7ePaMnJyaU6wY5s6YMtPtqawf
         MMx7O9tvxWx1k+f8gxYQvti/UbGky0M5oIyMOUSS7hy5/2y+RywvmhmMar4ui8WlKOmq
         osXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721044148; x=1721648948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWUt7fUeOslaf3J86kT2EHlZPfYeTYeze0uqvoVnIhg=;
        b=V5H4YEcE2sqAzIOq3VdOqU7ZXvKkp7pzM3JaKLus0i2ddoTsMrrM+0K0Rrc8JAr2Xp
         BGkTgNcwVut42TAudiZKxo/SkZ3mJnV0kkFgK5muXZ/G7HmagIVsUBJRPD3lxiYD01jP
         50Gnxa4Ki5zsHbxtooiChh8YvJuEpgPy9/mnAkcJQZ0fD8XPkuMAIJTUmXp/xbM38EDi
         pRgroMzFjTxfjhV/mptQEiJ9lNWPuSPFYE2yUax1mfM36T2GphlfuNJ8r8qdE5s8pM5B
         CP6yuubfGt4rBMf8KNE23+PtIpoUNRtQFr59iB84bErx3bD1IVKU2k/zDlECozxDrIGP
         EDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWPwiNJs3knGpufe6D9IUvN3eeK3+6pW+6bcO5s0q/2NqRwlwnJw5cpdwcG6dXFslfNVTCjgibtrFKQtkrUMIWyKza8KrlRzfgTTGS5El3
X-Gm-Message-State: AOJu0Yx51JaA4az1C3Gwu11KEdBHYxPRT6wWNcEqnue4UrG52lzemxjm
	QAQCafaBU3P/DiQjE76VafbHp2hYi1Xt8IwH8Iu8QbILEd4L/RejAwrl2XaXFzubrJR/TPGevod
	hsgtMOfUzXqzDhdSf1NV0FytuF0exUEyAKXEffQ==
X-Google-Smtp-Source: AGHT+IGUcPUU2RIzFJtJOINEci/osf15ph1Bg+CJXHIaSjFd2XfYUaMENDIEhkpgMuT9oddToIRteMCL4WHc0Fj1gu0=
X-Received: by 2002:a17:906:1388:b0:a72:428f:cd66 with SMTP id
 a640c23a62f3a-a780b705222mr1125612266b.39.1721044148245; Mon, 15 Jul 2024
 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-2-alexghiti@rivosinc.com> <Zn1Hwpcamaz1YaEM@andrea>
 <4008aeca-352f-489e-ba07-7a11f5ab7ccb@ghiti.fr> <Zo3MH8idihW4o+6Z@andrea>
In-Reply-To: <Zo3MH8idihW4o+6Z@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 15 Jul 2024 13:48:57 +0200
Message-ID: <CAHVXubiLJWtAit9T6OYx00qHu2QOVNqYRZZiOZHtmDBrDoW5Ew@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_044910_461401_BB4C8492 
X-CRM114-Status: GOOD (  24.52  )
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

SGkgQW5kcmVhLAoKT24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMTo0N+KAr0FNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gSXMgdGhpcyBzZWNvbmQg
SVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pBQ0FTKSBjaGVjayBhY3R1YWxseSBuZWVkZWQ/
Cj4gPiA+IChqdXN0IHdvbmRlcmluZyAtIG5vIHJlYWwgb2JqZWN0aW9uKQo+ID4KPiA+IFRvIG1l
IHllcywgb3RoZXJ3aXNlIGEgdG9vbGNoYWluIHdpdGhvdXQgemFjYXMgc3VwcG9ydCB3b3VsZCBm
YWlsIHRvCj4gPiBhc3NlbWJsZSB0aGUgYW1vY2FzIGluc3RydWN0aW9uLgo+Cj4gVG8gZWxhYm9y
YXRlIG9uIG15IHF1ZXN0aW9uOiAgU3VjaCBhIHRvb2xjaGFpbiBtYXkgYmUgYWJsZSB0byByZWNv
Z25pemUKPiB0aGF0IHRoZSBibG9jayBvZiBjb2RlIGZvbGxvd2luZyB0aGUgemFjYXM6IGxhYmVs
IChhbmQgY29tcHJpc2luZyB0aGUKPiBhbW9jYXMgaW5zdHJ1Y3Rpb24pIGNhbid0IGJlIHJlYWNo
ZWQvZXhlY3V0ZWQgaWYgdGhlIGZpcnN0IElTX0VOQUJMRUQoKQo+IGV2YWx1YXRlcyB0byBmYWxz
ZSAoZHVlIHRvIHRoZSBnb3RvIGVuZDsgc3RhdGVtZW50KSwgYW5kIGNvbnNlcXVlbnRseSBpdAo+
IG1heSBjb21waWxlIG91dCB0aGUgZW50aXJlIGJsb2NrL2luc3RydWN0aW9uIG5vIG1hdHRlciB0
aGUgcHJlc2VuY2Ugb3IKPiBub3Qgb2YgdGhlIHNlY29uZCBJU19FTkFCTEUoKSBjaGVjay4gIElP
Vywgc3VjaCBhIHRvb2xjaGFpbi9jb21waWxlciBtYXkKPiBub3QgYWN0dWFsbHkgaGF2ZSB0byBh
c3NlbWJsZSB0aGUgYW1vY2FzIGluc3RydWN0aW9uIHVuZGVyIHN1Y2ggY29uZmlnLgo+IEluIGZh
Y3QsIHRoaXMgaXMgaG93IHRoZSBjdXJyZW50IGdjYyB0cnVuayAod2hpY2ggZG9lc24ndCBzdXBw
b3J0IHphY2FzKQo+IHNlZW1zIHRvIGJlaGF2ZS4gIEFuZCB0aGlzIHZlcnkgc2FtZSBvcHRpbWl6
YXRpb24vY29kZSByZW1vdmFsIHNlZW1zIHRvCj4gYmUgcGVyZm9ybWVkIGJ5IGNsYW5nIHdoZW4g
Q09ORklHX1JJU0NWX0lTQV9aQUNBUz1uLiAgSUFDLCBJJ2QgYWdyZWUgaXQKPiBpcyBnb29kIHRv
IGJlIGV4cGxpY2l0IGluIHRoZSBzb3VyY2VzIGFuZCBrZWVwIGJvdGggb2YgdGhlc2UgY2hlY2tz
LgoKSW5kZWVkLCBjbGFuZyB3b3JrcyBmaW5lIHdpdGhvdXQgdGhlIHNlY29uZCBJU19FTkFCTEVE
KCkuIEknbGwgcmVtb3ZlCml0IHRoZW4gYXMgdGhlIGNvZGUgaXMgY29tcGxleCBlbm91Z2guCgpU
aGFua3MsCgpBbGV4Cgo+Cj4KPiA+ID4gV2h5IHRoZSBzZW1pY29sb24/Cj4gPgo+ID4gVGhhdCBm
aXhlcyBhIGNsYW5nIHdhcm5pbmcgcmVwb3J0ZWQgYnkgTmF0aGFuIGhlcmU6Cj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDUyODE5MzExMC5HQTIxOTY4NTVAdGhl
bGlvLTM5OTBYLwo+Cj4gSSBzZWUuICBUaGFua3MgZm9yIHRoZSBwb2ludGVyLgo+Cj4KPiA+ID4g
VGhpcyBpcyBiZWNhdXNlIHRoZSBjb21waWxlciBkb2Vzbid0IHJlYWxpemUgX19yZXQgaXMgYWN0
dWFsbHkKPiA+ID4gaW5pdGlhbGl6ZWQsIHJpZ2h0PyAgSUFDLCBzZWVtcyBhIGJpdCB1bmV4cGVj
dGVkIHRvIGluaXRpYWxpemUKPiA+ID4gd2l0aCAob2xkKSAod2hpY2ggaW5kaWNhdGVzIFNVQ0NF
U1Mgb2YgdGhlIENNUFhDSEcgb3BlcmF0aW9uKTsKPiA+ID4gaG93IGFib3V0IHVzaW5nIChuZXcp
IGZvciB0aGUgaW5pdGlhbGl6YXRpb24gb2YgX19yZXQgaW5zdGVhZD8KPiA+ID4gd291bGQgKG5l
dykgc3RpbGwgd29yayBmb3IgeW91Pwo+ID4KPiA+IEJ1dCBhbW9jYXMgcmQgcmVnaXN0ZXIgbXVz
dCBjb250YWluIHRoZSBleHBlY3RlZCBvbGQgdmFsdWUgaW4gb3JkZXIgdG8KPiA+IGFjdHVhbGx5
IHdvcmsgcmlnaHQ/Cj4KPiBBZ3JlZWQuICBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgo+
Cj4gICBBbmRyZWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
