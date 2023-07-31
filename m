Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE83C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrqDJ7h70FGIOIZrnTqY8iP1oQ31xEJ4ofSwGSZRRJg=; b=vFZSPJK2MfLwqm
	LGe3vs/JVGPABAdjyQvbkrUokdQaQ03iKNapwgwjRBifj8QFKHwAkMOV2eTbzUyA30Iyn/vUp4NIL
	Qn+tVZkFtcos8jeF7Vg3La90ufNbixS/U6dI7SNooGXmhOv/RzCFDXClYYJObNK33Fsw94RyVNE+a
	t+LqTX7kvBMJf1LU4KIZl5/wPKSdMLNavPGllyu+9lMyJqD4lNVl9i5xVPQOAReKVgatYZFY0iOf1
	ibv/t7Fcodg7pw4K3VhoMgZthtVfEsDDR6LfDBgfe6jXW0n9eHzit9Ykiy6zeCEgLkLRQL+QD+adE
	J08P6mnTm7UWSF9juxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQa7j-00HLpE-0P;
	Mon, 31 Jul 2023 21:08:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQa7f-00HLkQ-1h
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 21:08:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso46059295e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1690837661; x=1691442461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNCGPjrbiEcyOtFfnoUVJfAnHPG+PuJqCkOivI0dKrA=;
        b=FXyIWqpqhN+jTLM7VoB9X8KH9YGhO3BdVRbPbL+PqDUSp4+sviIuBIY/Rvv02m/PBA
         OnULbqTAvH7W4XDTR6e8EQa0mMDiOhc4hPLf94ek9tER+nUJ74XdGiM7Hgjlhwp5TGsK
         BHCfbC1lvxYVlSsXlfSDvTe2mgW/GDyVERsPc0MUkS7KSQvhSG0+WvVDNp02prlogtz3
         U6NjH3bUOIHxcNto+k5TNole3bbMs0gx5RIibAPmBjwg/8GwthgOZzOPFo63b4htdzXM
         lZJtxm13vuKhLuqzyzJC8ldXvCiFLon4KJY1ATFOEgtSl3IGVU3+3Z9vPHPWtu0i0gae
         bjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690837661; x=1691442461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNCGPjrbiEcyOtFfnoUVJfAnHPG+PuJqCkOivI0dKrA=;
        b=JXsdPJ346HrtYvq7tpgfG/Ks1RSTR+Sk4FMXiWNRhYZT2FmBmIVl+5L2IE9ddIj6O/
         1fjLPb0X20QWwdi0eTGnF6C70u5BlTDFdKQJlJTUAPDEUI/t1zwoUZZtHCY23IrodA01
         Tm6jBemp9MIBh/oBd9n4QeslO4LslkI8aa1nYNqFCWLPXGYQR3T97tqzpopQ/VqDfVF8
         ujDNMQpDjw5lRTTkcGrAqRF5LADfPcAUuTMJLZsOk9sl9xy87X6u1Kx7cKYgIde/73+7
         leHdAYSJhJNqMZtvQ2F3rCPk7ie8MGR+ELA/s5UpivoE2/DBMHfRPm+kumA/SiAGvHSu
         C/6g==
X-Gm-Message-State: ABy/qLaBIEzqzDxgqehL2uGunnCXXHAG1v2fyyO/N6gEaWfPYw6HfUOl
	cXoV1+CkZw5DyNr9jsrR69dg/Q==
X-Google-Smtp-Source: APBJJlGHTwVNWd//PZQ9JNGaGWYFnzIoYEDoehkWWJ7bscA0fSlZcXrSVnZcugVxt0+DshWg2nS0QA==
X-Received: by 2002:a05:600c:2213:b0:3fe:2102:8083 with SMTP id z19-20020a05600c221300b003fe21028083mr741960wml.26.1690837660761;
        Mon, 31 Jul 2023 14:07:40 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id k17-20020adfe8d1000000b003143867d2ebsm14090234wrn.63.2023.07.31.14.07.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Jul 2023 14:07:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <ZMgP6hhD/k7QNQ3t@casper.infradead.org>
Date: Mon, 31 Jul 2023 22:07:28 +0100
Cc: Ian Rogers <irogers@google.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Brendan Sweeney <brs@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?utf-8?Q?R=C3=A9mi_Denis-Courmont?= <remi@remlab.net>,
 linux-doc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Atish Patra <atishp@rivosinc.com>
Message-Id: <4A8F40EA-0322-4E52-B806-AE93B5D7CFAE@jrtc27.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com>
 <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
 <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
 <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
 <CAHVXubjhM9C1fw_Us=8+RuSJbW0pacFAk9gp7j2=BtMUPy_Byw@mail.gmail.com>
 <CAP-5=fUbiaVwSAhTbymyhdUPcVAXHiQZZexAOnrqid0LsPmfpw@mail.gmail.com>
 <ZMgP6hhD/k7QNQ3t@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_140811_581310_B8D16F2B 
X-CRM114-Status: GOOD (  23.97  )
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

T24gMzEgSnVsIDIwMjMsIGF0IDIwOjQ3LCBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4gd3JvdGU6Cj4gCj4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDk6NDY6MDdBTSAtMDcw
MCwgSWFuIFJvZ2VycyB3cm90ZToKPj4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgOTowNuKAr0FN
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+PiBJIGhh
dmUganVzdCBoYWQgdGhlIGFuc3dlciBpbnRlcm5hbGx5ICh0aGFua3MgdG8gQEJyZW5kYW4gU3dl
ZW5leSk6Cj4+PiBjc3IgbW9kaWZpY2F0aW9ucyBjYW4gYWx0ZXIgaG93IHRoZSBtZW1vcnkgaXMg
YWNjZXNzZWQgKHNhdHAgd2hpY2gKPj4+IGNoYW5nZXMgdGhlIGFkZHJlc3Mgc3BhY2UsIHN1bSB3
aGljaCBhbGxvd3MvZGlzYWxsb3dzIHVzZXJzcGFjZQo+Pj4gYWNjZXNzLi4uKSwgc28gd2UgbmVl
ZCB0aGUgbWVtb3J5IGJhcnJpZXIgdG8gbWFrZSBzdXJlIHRoZSBjb21waWxlcgo+Pj4gZG9lcyBu
b3QgcmVvcmRlciB0aGUgbWVtb3J5IGFjY2Vzc2VzLgo+PiAKPj4gVGhlIGNvbmRpdGlvbnMgeW91
IG1lbnRpb24gc2hvdWxkbid0IGFwcGx5IGhlcmUgdGhvdWdoPyBFdmVuIGlmIHlvdQo+PiBhZGQg
YSBtZW1vcnkgYmFycmllciBmb3IgdGhlIGNvbXBpbGVyIHdoYXQgaXMgc3RvcHBpbmcgdGhlIGhh
cmR3YXJlCj4+IHJlb3JkZXJpbmcgbG9hZHMgYW5kIHN0b3Jlcz8gSWYgaXQgYWJzb2x1dGVseSBo
YXMgdG8gYmUgdGhlcmUgdGhlbiBhCj4+IGNvbW1lbnQgc29tZXRoaW5nIGxpa2UgIlRoZXJlIGlz
IGEgYnVnIGlzIHJpc2N2IHdoZXJlIHRoZSBjc3JyCj4+IGluc3RydWN0aW9uIGNhbiBjbG9iYmVy
IG1lbW9yeSBicmVha2luZyBmdXR1cmUgcmVhZHMgYW5kIHNvbWUgaG93IHRoaXMKPj4gY29uc3Ry
YWludCBmaXhlcyBpdCBieSAuLi4gIi4KPiAKPiBJZiB0aGUgaGFyZHdhcmUgZG9lc24ndCBrbm93
IHRoYXQgd3JpdGluZyB0byBhIGNzciBjYW4gY2hhbmdlIGhvdyBtZW1vcnkKPiBhY2Nlc3NlcyBh
cmUgZG9uZSBhbmQgcmVvcmRlcnMgbWVtb3J5IGFjY2Vzc2VzIGFyb3VuZCB0aGF0IGNzciB3cml0
ZSwKPiB5b3UndmUgZ290IGEgcmVhbGx5IGJyb2tlbiBwaWVjZSBvZiBoYXJkd2FyZSBvbiB5b3Vy
IGhhbmRzIC4uLgo+IAo+IEkga25vdyBub3RoaW5nIGFib3V0IHJpc2MtdiwgYW5kIG1heWJlIHRo
ZSBkZWZpbml0aW9uIHNheXMgdGhhdCB5b3UgbmVlZAo+IHRvIHB1dCBhIG1lbW9yeSBiYXJyaWVy
IGJlZm9yZSBhbmQvb3IgYWZ0ZXIgaXQgaW4gdGhlIGluc3RydWN0aW9uIHN0cmVhbSwKPiBidXQg
b24gYWxsIGhhcmR3YXJlIEknbSBmYW1pbGlhciB3aXRoLCB3cml0aW5nIHRvIGEgQ1NSIGlzIGFu
IGltcGxpY2l0bHkKPiBzZXJpYWxpc2luZyBvcGVyYXRpb24uCgpzYXRwIGhhcyBzb21lIHNwZWNp
YWwgcnVsZXMgZHVlIHRvIHRoZSBpbnRlcmFjdGlvbiB3aXRoIFRMQnMuIEVuYWJsaW5nCi8gZGlz
YWJsaW5nIHRyYW5zbGF0aW9uIGJ5IHRvZ2dsaW5nIGJldHdlZW4gQmFyZSBhbmQgbm9uLUJhcmUg
bW9kZXMKZG9lc27igJl0IHJlcXVpcmUgYW55IGtpbmQgb2YgZmVuY2UsIG5vciBkb2VzIGNoYW5n
aW5nIHRoZSBBU0lEIChpZiBub3QKcmVjeWNsaW5nKSwgYnV0IGFueSBvdGhlciBjaGFuZ2VzIHRv
IHNhdHAgKGNoYW5naW5nIGJldHdlZW4KU3YzOS9TdjQ4L1N2NTcgb3IgY2hhbmdpbmcgdGhlIHBh
Z2UgdGFibGUgYmFzZSBhZGRyZXNzKSBkbyByZXF1aXJlCmZlbmNlcyAobm90IHJlYWxseSBzdXJl
IHdoeSB0byBiZSBob25lc3QsIG1heWJlIHNvbWV0aGluZyBhYm91dCBoYXZpbmcKc2VwYXJhdGUg
a2VybmVsIGFuZCB1c2VyIHBhZ2UgdGFibGVzPy4uKS4gwqc1LjIuMSBTdXBlcnZpc29yCk1lbW9y
eS1NYW5hZ2VtZW50IEZlbmNlIEluc3RydWN0aW9uIG9mIHRoZSBwcml2aWxlZ2VkIHNwZWMgKHRo
ZSBvbmUgSeKAmW0KbG9va2luZyBhdCBpcyB2ZXJzaW9uIDIwMjExMjAzIGJ1dCBkYXRlZCBPY3Rv
YmVyIDQsIDIwMjIpIGRldGFpbHMgdGhpcy4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
