Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1F5C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Usl72JidqlFapnUg3yxoRpTCEjpIaqoR0kTvE5kD1q4=; b=FOybuTMT1HYgO6
	TpKxt5yHrSddO8MKuHagt2Aq1/BDUoPajkhPHPxwqTrAHvx7hYY/dWLmmXjkLipH9H4iYRuwd+54A
	OlqtIicD4xVoHQmWMSjbabQCQs7zwNWYs1g5sfvMIziHHnG7ZD9r9tLDiz6wCHi7H0fIZu7UJJyf6
	uC86bwrb9ZOJiojBozHHJAY5uZayKdVTTf6T7p/qLzWgMHhS+FOQ0yAlwcJ7UI4SeloMvRrsuUKuJ
	+gEyhqycA+zxmuDgyFcrFtW1RGB1gynbHL91f+eraFP3KjNwaN/I1qenw+VOVUKHQ8bbiY3CGxaw6
	bCNE4OUXBPsjI9bevGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYi7-00H8Ru-2I;
	Mon, 31 Jul 2023 19:37:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYi4-00H8Qa-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 19:37:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-314172bac25so4340926f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1690832256; x=1691437056;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7uwEzlRP4+mthnZWfhTuzziq4CFxBm7M91f+ZmwKXs=;
        b=SwPzih8iRWN4rPibGLwjv1Ii3dnjPqG8CSPKQ06PccPtss6AwN2JkMvpuwV9zl4UtV
         W9q5KknSXsecflaQvizPn9qnzmFW6z/TIamLkyc/x9TwMLyKp7XMUKITxBdcMhmpD2hF
         sA84/3kiR8K5oqHf5Fsw0hjWKTUiuq/CWjDKquiu7n6oDbpaGdN3E+YEIq/FhzsfkSRQ
         k4wn1/E/EpCK2Dg6lKKb91aRqmafaeqpiv2u8ulpdTZFFbD5cU1N+tIXHPcl8F45pdyx
         O2O+ev4vpdwp4p8E3kQJ1WA2T8jDgt0YXInCu5mAYnkL9eEkKgTn4gfTi33Bftg5SsWu
         6pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690832256; x=1691437056;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7uwEzlRP4+mthnZWfhTuzziq4CFxBm7M91f+ZmwKXs=;
        b=FGuwIxDfp9KZ72vjDvVRpl0ddz7JTXYPDDKunjIk1DMlsNyRFQoBzedQ9C4mqVbhag
         D7vlmq7AzpT0dqQpHCPwEzDz1bhnOeKqTAn2+E4VkLjTmdUtk+dM1iZH1gj1V3ydHYs2
         o0w0hvxhNjQ7yCiv/lzrqUpgOzMykxSsjpC75C04F0tlavuM3ir5ONqx0K5gG7Im4Jjt
         f7eHn2diYSPHWRZLv+aLXeF+iZ3yaAxrLIBDwjU8V3/Litl66lSPdl5+hZIySzAmt/Oy
         SYwzqHOxSetZV95lI42yd3rTtpOy5boPMwmCGdQjHj2BVIOmoPOFqOd8tbaMid3DtYO/
         S8zQ==
X-Gm-Message-State: ABy/qLZSVoNcdHjGHQtL0EXNTtHaO93LDckWwn1HUhvkw2G0Fl6tt8CU
	BJOJjlN2xDi0zeJ4L2KH5J3TUQ==
X-Google-Smtp-Source: APBJJlF2ToddA8wgn58G3MLiexQHKqLAt4xSzrHHHVz3bukGSKzr1533OUsywQMPb0lND6ZYc3cf1Q==
X-Received: by 2002:adf:e7ce:0:b0:317:5bde:e6de with SMTP id e14-20020adfe7ce000000b003175bdee6demr615220wrn.8.1690832256236;
        Mon, 31 Jul 2023 12:37:36 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id k13-20020a056000004d00b003176bd661fasm13829076wrx.116.2023.07.31.12.37.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Jul 2023 12:37:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAHVXubjhM9C1fw_Us=8+RuSJbW0pacFAk9gp7j2=BtMUPy_Byw@mail.gmail.com>
Date: Mon, 31 Jul 2023 20:37:24 +0100
Cc: Ian Rogers <irogers@google.com>,
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
Message-Id: <3736D0AC-C87B-45D8-AB20-3A5A55D4FA64@jrtc27.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com>
 <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
 <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
 <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
 <CAHVXubjhM9C1fw_Us=8+RuSJbW0pacFAk9gp7j2=BtMUPy_Byw@mail.gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_123740_565766_FEB55BE6 
X-CRM114-Status: GOOD (  18.71  )
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

T24gMzEgSnVsIDIwMjMsIGF0IDE3OjA2LCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgSnVsIDMxLCAyMDIzIGF0IDU6MTDigK9QTSBJ
YW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+PiAKPj4gT24gTW9uLCBKdWwg
MzEsIDIwMjMgYXQgMzoyN+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+PiAKPj4+IE9uIE1vbiwgSnVsIDMxLCAyMDIzIGF0IDEyOjE14oCvUE0g
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+PiAKPj4+
PiBIaSBJYW4sCj4+Pj4gCj4+Pj4gT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNzo1M+KAr1BNIElh
biBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBPbiBUaHUs
IEp1bCAyNywgMjAyMyBhdCA3OjI44oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPiB3cm90ZToKPj4+Pj4+IAo+Pj4+Pj4gcmlzY3Ygbm93IHN1cHBvcnRzIG1tYXBp
bmcgaGFyZHdhcmUgY291bnRlcnMgc28gYWRkIHdoYXQncyBuZWVkZWQgdG8KPj4+Pj4+IHRha2Ug
YWR2YW50YWdlIG9mIHRoYXQgaW4gbGlicGVyZi4KPj4+Pj4+IAo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pj4+Pj4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+Pj4+PiBSZXZp
ZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+Pj4+PiAtLS0KPj4+
Pj4+IHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
Cj4+Pj4+PiAKPj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWIvcGVyZi9tbWFwLmMgYi90b29s
cy9saWIvcGVyZi9tbWFwLmMKPj4+Pj4+IGluZGV4IDBkMTYzNGNlZGY0NC4uMzc4YTE2M2YwNTU0
IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4+Pj4+PiArKysgYi90
b29scy9saWIvcGVyZi9tbWFwLmMKPj4+Pj4+IEBAIC0zOTIsNiArMzkyLDcxIEBAIHN0YXRpYyB1
NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIpCj4+Pj4+PiAKPj4+Pj4+
IHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gcmVhZF9zeXNyZWcoY250
dmN0X2VsMCk7IH0KPj4+Pj4+IAo+Pj4+Pj4gKyNlbGlmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+Pj4+
PiAKPj4+Pj4gVGhpcyBpcyBzb21ldGhpbmcgb2YgYW4gb2RkIGd1YXJkLCBwZXJoYXBzOgo+Pj4+
PiAjZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+Pj4+PiAKPj4+
Pj4gVGhhdCB3YXkgaXQgaXMgbW9yZSBpbnRlbnRpb24gcmV2ZWFsaW5nIHRoYXQgdGhpcyBpcyBy
aXNjdiBjb2RlLiBDb3VsZAo+Pj4+PiB5b3UgYWRkIGEgY29tbWVudCByZWxhdGluZyB0byB0aGUg
X19yaXNjdl94bGVuID8KPj4+PiAKPj4+PiBJIGd1ZXNzIEFuZHJldyBhbnN3ZXJlZCB0aGF0IGFs
cmVhZHkuCj4+Pj4gCj4+IAo+PiBOb3Qgc3VyZS4gSSBzdGlsbCB0aGluayBpdCBsb29rcyB3ZWly
ZDoKPj4gLi4uCj4+ICNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18p
Cj4+IC4uLgo+PiAjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQo+PiAuLi4KPj4gI2VsaWYgX19y
aXNjdl94bGVuID09IDY0Cj4+IC4uLgo+PiAjZWxzZQo+PiBzdGF0aWMgdTY0IHJlYWRfcGVyZl9j
b3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyIF9fbWF5YmVfdW51c2VkKSB7IHJldHVybiAwOyB9
Cj4+IHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gMDsgfQo+PiAjZW5k
aWYKPj4gCj4+IFRoZSBmaXJzdCB0d28gYXJlIGNsZWFybHkgI2lmZGVmLWluZyBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgYXNzZW1ibHkKPj4gY29kZSwgdW5kZXIgd2hhdCBjb25kaXRpb25zIEkgZ2V0
IFJJU0MtViBjb2RlICDCr1wo44OEKS/CryBBdCBsZWFzdCB3b3J0aAo+PiBhIGNvbW1lbnQgbGlr
ZSAiY3NyciBpcyBvbmx5IGF2YWlsYWJsZSB3aGVuIHlvdSBoYXZlIHhsZW5zIG9mIDY0Cj4+IGJl
Y2F1c2UgLi4uIgo+IAo+IF9fcmlzY3ZfeGxlbiBpbmRpY2F0ZXMgcmlzY3Y2NCwgd2hpY2ggaXMg
dGhlIG9ubHkgdGFyZ2V0IG9mIHRoaXMKPiBwYXRjaHNldC4gQnV0IGlmIHlvdSBwcmVmZXIsIEkg
ZG9uJ3QgbWluZCBhZGRpbmcgYmFjayB0aGUKPiBkZWZpbmVkKF9fcmlzY3YpIGlmIEkgcmUtc3Bp
biBhIG5ldyB2ZXJzaW9uLgoKSSBtZWFuLCAtV3VuZGVmIGlzIGEgdGhpbmcgdGhhdCB3aWxsIHNj
cmVhbSBhdCB5b3UgaWYgeW91IGV2YWx1YXRlIGEKbWFjcm8gdGhhdOKAmXMgdW5kZWZpbmVkIGFu
ZCBnZXQgYW4gaW1wbGljaXQgMCwgYW5kIHBhcnRzIG9mIHRoZSBsaW51eApidWlsZCBzZWVtIHRv
IGVuYWJsZSBpdC4gU28gSSB3b3VsZCBzdHJvbmdseSByZWNvbW1lbmQgYWdhaW5zdAooYWIpdXNp
bmcgdGhhdCBmZWF0dXJlIG9mIHRoZSBwcmVwcm9jZXNzb3IsIGVzcGVjaWFsbHkgd2hlbiBpdCBh
bGlnbnMKd2l0aCBncmVhdGVyIGNsYXJpdHkuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
