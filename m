Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8490CC3DA4B
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYn1rCSKhL7cGupvvgg68N8SHGG0BmB6fzI5EDD2CtU=; b=zFKjiXlyunFiUK
	qKbGHPettWMFGD5s7T/kdpkVTI0HgWdzoFhWADynGkioQIs+QSZSvMU7pIkPqd/lkpoR5AOJqaSKE
	Asfil78y3ZX5u4tozZZifh5V+RBmCneeamYE1CSSjWY9oMi6Qz5c8gRunc0wCqk+ak38UchQ1bcny
	mamtcwWpxSpY7j9AMFsd8vBknLWe4xph6Z1w9SN73BuirGzbj9Xyb052wdEOKdeBIRD0yRqicg7gn
	X1+XtBoCSvTOY4C4O2zc3FZd54IPTkuVT5XO34u/ltbpsZkz2Ldos63m2d5fwm3eUe6aJzTMHWKTW
	wALcD99g4H60p7Xye5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTLHc-000000077g8-1K3j;
	Mon, 15 Jul 2024 12:58:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTLG2-0000000770F-33Fb
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 12:56:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a77c9c5d68bso507512166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721048205; x=1721653005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxfNNMp1rG3SXkek7cMYvB8iok7DNluaUVkXIU0Xf14=;
        b=OLhUFrkCS0rdc9JCIGa4JTgHT/vbmZb3R2EtVNJwqQMLKllQXpv6jS/9Rl5H3Pt4cr
         gWveewJGSZu9i61g048OoLvoYoBnu8MDn51Scu/uMqW1oY7mgfkdvQ18WcuDA2bSXBln
         pkY0PJrzWIK8QkkE3oKYm6+qQ2zpoT6ZUcFawf4NFDEAM387ar4k0YN+xMWniTvTONYy
         JVcRKrzvDTsOFNGhMkdsRonfy4oYfwzcwuMGsHWZcBE1yiESqJTZ8I+6yNNa3dqLsvdJ
         oIT4PH7LbW0aC2uL+gYR9ti9ngIZIj9iEQcm+89FtvV2CSEPXw1boQBq/qe1lnzX1iRx
         +Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048205; x=1721653005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxfNNMp1rG3SXkek7cMYvB8iok7DNluaUVkXIU0Xf14=;
        b=nL8w9kR/3sUg79eVy8wq0fNIe4uFX6I4aZek9pj4k4k2pklAOJKt7kwqhjxtmK/yRL
         DyXc/3oQSDAnBbhc7aRtu/9S+kCbFK0C4PH0cqD2Os+GdfuJSJVgWT/A1MbSLcAQOUv0
         zgXoiIpCbFZ3adSPfU2ZOEK1/q5K3NCKJA8ZLaekWoZ1JFXncrb5kt9piPQLTXqhmv4c
         NyHYvGPCm+WDCEDyC+jjXhADXheyu3D39rcNzobGQ5Or2W65CIYrpLm7uNxSnbAlNRfL
         mZNpId8ampd9M3l0hsRudtkaUNaox/xA7yLXovup7VdwqwK/dtLsZjZvZkXKVzb+Zn04
         p58g==
X-Forwarded-Encrypted: i=1; AJvYcCXbUaRgj4SOLa/0AlfsEMYJbXV1mHXL/8Ymy2WZI3CBxgG5Ja4RbN+fjD1/uF3K/dqvXT3BDP8py5X1RIlvnaKWjHYGAyZvi3/o5YPYOWh7
X-Gm-Message-State: AOJu0YzmuTK3OGZZZpV5rk86usu6hFexMnbGNF27InmaAab5YaspcUSg
	Liu94+IcfV7JXUPYQ17CFteg9yWYdSZz2FEPDZzXHOGYRsUBKsfFYwlRC33conTZSaMty/jvYNg
	YhT2MyhAyRrfRBDH0iQRldkGF4e+Ah0GM8hY6bw==
X-Google-Smtp-Source: AGHT+IEQxCwmk3v9bZId3rguAE4ZhEMOX7OQcvnvy46JJ2wjs4mq+MuCAlAfeu4173n5ppDi6qdRzxNLjJYPZQTWSyo=
X-Received: by 2002:a17:906:fa08:b0:a72:b811:4d43 with SMTP id
 a640c23a62f3a-a780b883462mr1101581166b.59.1721048205077; Mon, 15 Jul 2024
 05:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com> <Zn1StcN3H0r/eHjh@andrea>
 <1cd452af-58cd-468c-9bb6-90f67711d0b0@ghiti.fr> <Zo3NBHUEMMec/6uD@andrea>
In-Reply-To: <Zo3NBHUEMMec/6uD@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 15 Jul 2024 14:56:34 +0200
Message-ID: <CAHVXubjCdse-3z3hKR81VpdvjxVaxPUZdmTwc4fvHordcfHVng@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
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
X-CRM114-CacheID: sfid-20240715_055647_123505_80EA862E 
X-CRM114-Status: GOOD (  19.23  )
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

SGkgQW5kcmVhLAoKT24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMTo1MeKAr0FNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gSSBhZG1pdCB0aGF0IEkg
Zm91bmQgdGhpcyBhbGwgcXVpdGUgZGlmZmljdWx0IHRvIHJlYWQ7IElJVUMsIHRoaXMgaXMKPiA+
ID4gbWlzc2luZyBhbiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkFDQVMpIGNoZWNrLgo+
ID4KPiA+IEknbSBub3Qgc3VyZSB3ZSBuZWVkIHRoZSB6YWNhcyBjaGVjayBoZXJlLCBzaW5jZSB3
ZSBjb3VsZCB1c2UgYSB0b29sY2hhaW4KPiA+IHRoYXQgc3VwcG9ydHMgemFiaGEgYnV0IG5vdCB6
YWNhcywgcnVuIHRoaXMgb24gYSB6YWJoYS96YWNhcyBwbGF0Zm9ybSBhbmQgaXQKPiA+IHdvdWxk
IHdvcmsuCj4KPiBPbmUgc3BlY2lmaWMgc2V0LXVwIEkgd2FzIGNvbmNlcm5lZCBhYm91dCBpcyBh
cyBmb2xsb3dzOgo+Cj4gICAxKSBoYXJkd2FyZSBpbXBsZW1lbnRzIGJvdGggemFiaGEgYW5kIHph
Y2FzCj4gICAyKSB0b29sY2hhaW4gc3VwcG9ydHMgYm90aCB6YWJoYSBhbmQgemFjYXMKPiAgIDMp
IENPTkZJR19SSVNDVl9JU0FfWkFCSEE9eSBhbmQgQ09ORklHX1JJU0NWX0lTQV9aQUNBUz1uCj4K
PiBTaW5jZSBDT05GSUdfUklTQ1ZfSVNBX1pBQkhBPXksIHRoZSBmaXJzdCBhc20gZ290byB3aWxs
IGdldCBleGVjdXRlZAo+IGFuZCwgc2luY2UgdGhlIGhhcmR3YXJlIGltcGxlbWVudHMgemFjYXMs
IHRoYXQgd2lsbCByZXN1bHQgaW4gYSBub3AuCj4gVGhlbiB0aGUgc2Vjb25kIGFzbSBnb3RvIHdp
bGwgZ2V0IGV4ZWN1dGVkIGFuZCwgc2luY2UgdGhlIGhhcmR3YXJlCj4gaW1wbGVtZW50cyB6YWJo
YSwgaXQgd2lsbCByZXN1bHQgaW4gdGhlIGogemFiaGEuICBJbiBjb25jbHVzaW9uLCB0aGUKPiBh
bW9jYXMgaW5zdHJ1Y3Rpb24gZm9sbG93aW5nIHRoZSB6YWJoYTogbGFiZWwgd2lsbCBnZXQgZXhl
Y3V0ZWQsIHRodXMKPiB2aW9sYXRpbmcgKHRoZSBzZW1hbnRpY3Mgb2YpIENPTkZJR19SSVNDVl9J
U0FfWkFDQVM9bi4gIElJVUMsIHRoZSBkaWZmCj4gSSd2ZSBwb3N0ZWQgcHJldmlvdXNseSBpbiB0
aGlzIHRocmVhZCBzaGFyZWQgYSBzaW1pbGFyIGxpbWl0YXRpb24vYnVnLgoKU28geW91IG1lYW4g
dGhhdCB3aGVuIGRpc2FibGluZyBaYWNhcywgd2Ugc2hvdWxkIGFjdHVhbGx5IGRpc2FibGUKKmFs
bCogdGhlIENBUyBpbnN0cnVjdGlvbnMsIGV2ZW4gdGhlIFphYmhhIG9uZXMuIEl0IG1ha2VzIHNl
bnNlIGFuZAphbGxvd3MgZm9yIGEgc2luZ2xlIHdheSB0byBkaXNhYmxlIHRoZSBDQVMgaW5zdHJ1
Y3Rpb25zIGJ1dCBrZWVwaW5nCnRoZSBvdGhlciBhdG9taWMgb3BlcmF0aW9ucy4KCkknbGwgZml4
IHRoYXQgYW5kIGFkZCBhIGNvbW1lbnQuCgpUaGFua3MsCgpBbGV4Cgo+Cj4gICBBbmRyZWEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
