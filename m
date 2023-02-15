Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC71AC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 22:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2yilUa5P25wPy6PY1xSRelSXwhmjK8h77E1DF1HfZE=; b=m3yzWnmVQ4TdDE
	y2fyCf0b+lxO14Io3ASnTlt83FNGEW9AaOqkVCIfQlbSrBtImCjJd/gi04eL+6V/jc6bFTPSOQhKx
	RiZM+0QB0/3A9yYtUcjRbiWcK5pOW9YMH6arGgDravEXvtF03gwlnLa7QOq55wpWGUO5a3PP+VW2n
	mPB+JwG2lZEFdOwDNuuPMfdqPMBLEOQOf/UoGw+90tHFvDPDaYPX8weqpPLN5BPJHPI7xr02TfCRW
	mqZvyGFUosHB/jFiQtZJeAmwyjBwisyyr9J69yjBoEhy9BTYQJL1IlntrLP6XDdMCJu09+Ey6D9EJ
	qspP8zk+bRLPPW6OxtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSQV9-007ioR-JT; Wed, 15 Feb 2023 22:43:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSQV6-007inZ-Ha
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 22:43:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m10so196748wrn.4
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 14:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nXdn4YzDoM0iF73Zmjo9+E9vHioH6H+aNis+Nm9tKQ=;
        b=PQnDiG2mGCPp4v/7j0ZmtNBwITcIvFmkjw5yT5SMk5SXcMwDq890BR6Kziw95pom06
         YSykh6oEIJ0xmLwL2LHzbZe5lO9Kxrqk5hoR1p4A7FuSErCF2tsxCsPXX/SExNetMDJi
         Q6tZ/1FEnacXaWUontH2YRie6Ae1jT+D2/961qfdOACLHNTzWlaDHzs3RVEThl6GJDxG
         gpZp7DjYRE/JjFy81ePgsBWSRdwz1k0ESwtNXiChzw+ozgUpLlKgrp2jtPeY2zJqGstA
         vPjF3V5yLb8Udr1GEnH+Bwi3Z2jH/3nUsHFWjJ0QhoQ57LcncKTnTSZPZstEdGIfVqgk
         6iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nXdn4YzDoM0iF73Zmjo9+E9vHioH6H+aNis+Nm9tKQ=;
        b=1qwxnwcw2DiWrVsH8MxQQftLgLNzV3+XKGFn4GgVS5mu6twHHQ4bhgSq6yLTIPNBPY
         FfiwAxWS0FM6jRjzsRUF1m3f4wMotma9RbaSk6HjZRyf6fQvyQqZl4U/xnWjgrk/eR8G
         QW310zqhCP3Yu94CszHEJOWeuVANII+518sHku3TkzP+cC/Vbbdwxka4dQLMDSd4zN19
         bwVBdJQVaNFz+bKEja5WrxY8FyJvAL7Gy5Ji5qm6K39u2Y5Sb0wrkILr5OyFq+ssMq0w
         I+NDoenOOF08Bt0CnTm63gvjNikprBlJQzrCv5KVchEOJVKK6pPEPHRbfUrzTvU39Gjb
         uk8A==
X-Gm-Message-State: AO0yUKWp8GmWAt+rbqwfSQWro4q8SJk+tNGu1hn9pVy2GBDdvbyuh0Xm
	GMfv+07jYlN5EWquy4pLuStAuw==
X-Google-Smtp-Source: AK7set98K5jOTFHXvTnJFhewS8kQNi6s1VNOzQfcaEUH0oYmf+Z3IJxRq5HqzV+LOohnSOiuZeHFjA==
X-Received: by 2002:adf:e4c9:0:b0:2c5:7c7a:78f7 with SMTP id v9-20020adfe4c9000000b002c57c7a78f7mr239350wrm.45.1676501021541;
        Wed, 15 Feb 2023 14:43:41 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d6dcf000000b002c3f9404c45sm16991637wrz.7.2023.02.15.14.43.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2023 14:43:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
Date: Wed, 15 Feb 2023 22:43:40 +0000
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-doc@vger.kernel.org,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 slewis@rivosinc.com,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Tobias Klauser <tklauser@distanz.ch>,
 Andrew Jones <ajones@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Dao Lu <daolu@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ruizhe Pan <c141028@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 guoren <guoren@kernel.org>
Message-Id: <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
 <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
To: Evan Green <evan@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_144344_701930_7C098117 
X-CRM114-Status: GOOD (  27.40  )
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

T24gMTUgRmViIDIwMjMsIGF0IDIxOjE0LCBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4gCj4gT24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMTo1NyBBTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPj4gCj4+IE9uIE1vbiwgRmViIDYsIDIwMjMsIGF0IDIx
OjE0LCBFdmFuIEdyZWVuIHdyb3RlOgo+Pj4gV2UgZG9uJ3QgaGF2ZSBlbm91Z2ggc3BhY2UgZm9y
IHRoZXNlIGFsbCBpbiBFTEZfSFdDQVB7LDJ9IGFuZCB0aGVyZSdzIG5vCj4+PiBzeXN0ZW0gY2Fs
bCB0aGF0IHF1aXRlIGRvZXMgdGhpcywgc28gbGV0J3MganVzdCBwcm92aWRlIGFuIGFyY2gtc3Bl
Y2lmaWMKPj4+IG9uZSB0byBwcm9iZSBmb3IgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLiAgVGhpcyBj
dXJyZW50bHkganVzdCBwcm92aWRlcwo+Pj4gbXthcmNoLGltcCx2ZW5kb3J9aWQsIGJ1dCB3aXRo
IHRoZSBrZXktdmFsdWUgcGFpcnMgd2UgY2FuIHBhc3MgbW9yZSBpbgo+Pj4gdGhlIGZ1dHVyZS4K
Pj4+IAo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4+
IAo+PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIHdpdGgKPj4gQVRfSFdD
QVAuIFdoaWxlIHRoZSBiaXRzIGluIEFUX0hXQ0FQIGFuZCBBVF9IV0NBUDIKPj4gYXJlIGxpbWl0
ZWQsIEkgZG9uJ3Qgc2VlIHVzIHJ1bm5pbmcgb3V0IG9mIG5ldwo+PiBBVF8qIHdvcmRzIHRvIHVz
ZSBmb3IgYWRkaXRpb25hbCBiaXRzLiBQcmVzdW1hYmx5Cj4+IHRoZSBrZXJuZWwgd291bGQgYWxy
ZWFkeSBoYXZlIHRvIGtub3cgYWJvdXQgdGhlCj4+IG5hbWUgb2YgZWFjaCBzdXBwb3J0ZWQgSFcg
ZmVhdHVyZSBhbmQgY291bGQgYXNzaWduCj4+IGEgdW5pcXVlIGJpdCBudW1iZXIgdG8gdGhlbS4K
PiAKPiBQYWxtZXIgY2FuIHByb2JhYmx5IHNwZWFrIHRvIHRoaXMgd2l0aCBtb3JlIGF1dGhvcml0
eSwgYnV0IG15Cj4gdW5kZXJzdGFuZGluZyBhYm91dCB0aGUgbW90aXZhdGlvbiBmb3IgYW4gYXBw
cm9hY2ggbGlrZSB0aGlzIGdvZXMKPiBzb21ldGhpbmcgbGlrZToKPiAqIFdpdGggdGhlIG5hdHVy
ZSBvZiBSSVNDLVYsIHdlIGV4cGVjdCBhIGxvdCBvZiB0aGVzZSB0eXBlcyBvZiBiaXRzCj4gYW5k
IGJvYnMsIG1hbnkgbW9yZSB0aGFuIHdlJ3ZlIHNlZW4gd2l0aCB0aGUgbGlrZXMgb2YgeDg2IGFu
ZCBBUk0uCgpXZeKAmXJlIGFscmVhZHkgYXQgKEkgdGhpbmspIDUxIHN0YW5kYXJkIHVzZXItbGV2
ZWwgZXh0ZW5zaW9ucyB0aGF0IExMVk0Ka25vd3MgYWJvdXQuCgo+ICogV2UgYWxzbyBleHBlY3Qg
aW4gc29tZSBjYXNlcyB0aGVzZSB2YWx1ZXMgdG8gYmUgaW5jb25zaXN0ZW50IGFjcm9zcyBDUFVz
LgoKVGhhdOKAmXMgYWxzbyB0cnVlIG9mIHNvbWUgQXJtIFNvQ3MuCgo+ICogV2hpbGUgd2UgY291
bGQgY29weSBhbGwgdGhhdCBkYXRhIGludG8gdGhlIGF1eCB2ZWN0b3IgZXZlcnkgdGltZSwKPiBp
dCBzdGFydHMgdG8gbG9vayBsaWtlIGEgbG90IG9mIGRhdGEsIG5vdCBhbGwgcHJvZ3JhbXMgY2Fy
ZSBhYm91dCBhbGwKPiBvZiBpdCwgYW5kIGEgbG90IG9mIGl0IGlzIHN0YXRpYywgbWFraW5nIGFs
bCB0aGUgY29weWluZyB3YXN0ZWZ1bC4KCkJpdHZlY3RvcnMgYXJlIHByZXR0eSBjaGVhcCwgdGhp
cyBpcyBuZWdsaWdpYmxlLgoKPiAqIEFub3RoZXIgb3B0aW9uIHRoYXQgd291bGQgc29sdmUgbW9z
dCBvZiB0aGlzIHdvdWxkIGJlIHRvIHBvaW50IHRvIGEKPiB2RFNPIGRhdGEgYXJlYSBmcm9tIHRo
ZSBhdXggdmVjdG9yLiBUaGlzIHNvbHZlcyB0aGUgY29weSBjb21wbGFpbnRzLAo+IGJ1dCBtYWtl
cyB0aGF0IHZEU08gZGF0YSBBQkksIGFuZCByZXF1aXJlcyBpdCBhbGwgdG8gYmUga25vd24gdXAK
PiBmcm9udC4KClRoYXQgZG9lc24ndCBzZWVtIGxpa2UgYSBodWdlIGRlYWwsIG90aGVyIHRoYW4g
bXkgdXN1YWwgcG9pbnQgb2YKbmVlZGluZyBhIHN0YW5kYXJkaXNlZCBwb3J0YWJsZSBjcm9zcy1w
bGF0Zm9ybSBBUEkgZm9yIHRoaXMsIHNvIHRoYXQKc2hvdWxkbuKAmXQgYmUg4oCcdGhl4oCdIGdl
bmVyaWMgaW50ZXJmYWNlIHByb2dyYW1tZWQgYWdhaW5zdCBieSBhcHBsaWNhdGlvbnMuCgo+ICog
U28sIGEgc3lzY2FsbCB3aXRoIGEgdkRTTyBmdW5jdGlvbiBpbiBmcm9udCBvZiBpdCBzZWVtZWQg
bGlrZSBhCj4gZ29vZCBjb21iaW5hdGlvbiBvZiBzcGVlZCBhbmQgZmxleGliaWxpdHkuCj4gCj4g
WW91J3JlIGNlcnRhaW5seSByaWdodCB0aGF0IEhXQ0FQbiB3b3VsZCB3b3JrIGZvciB3aGF0IHdl
J3JlIGV4cG9zaW5nCj4gdG9kYXksIHNvIHRoZSBxdWVzdGlvbiBwcm9iYWJseSBjb21lcyBkb3du
IHRvIG91ciByZWxhdGl2ZSBwcmVkaWN0aW9ucwo+IG9mIGhvdyB0aGlzIGRhdGEgd2lsbCBncm93
LgoKVGhlIG90aGVyIGJpZyBwcm9ibGVtIGlzIHZlbmRvciBleHRlbnNpb25zLgoKSmVzcwoKPiAt
RXZhbgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
