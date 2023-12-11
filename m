Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5278EC10F05
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 05:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogbCEN4111QuJVCrc07hcJU3BdPcO0xpJbnSn3NCP6U=; b=2xpaJK1oKxJCb/
	PQWvP9HekHWHrHx4ZNeVE2nxu2Z9ZblRwfJhjvpn3vQcCNDXlt62cmLjKBoJhd5Jiv5G442rSINa+
	OU6KCwMZlg2uVKn0C2jxy2TwgtaWVhoxD+Iuz836WqIkM0WhbN2YdXt0m0D2t+NzCjFZBD/TgnQF4
	OtG5yPaucCUykYw00+oTLu3kIIwb5Mt4p4oq12cJiXdk2UAERjGVU8hHSx7JEOSJwz6zieDyAmQv1
	oxc9EWHLYD+/kzgPYaOCgEuRkoyqQ+4DVWuQM280yYmzPl+b+KpxJPfWb7Aq9lTVKKPEZT1KsfHwr
	T8nMNBr3b8tRI7u5UQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZDI-0046Om-1v;
	Mon, 11 Dec 2023 05:52:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZDE-0046NT-1o
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 05:52:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-334b2ffaa3eso3715272f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Dec 2023 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702273934; x=1702878734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHJV2PGMjruAfWeCQ41TtmWURkmDfN3OTSvooiPRx+Y=;
        b=sKJ3AW10shbXMsIraiFLHuWx4dQfF+1fq05mRvZprz5Df0hjD8gp04O7C7CcCANzF5
         Tab8x1axtKtwexbvD9fe8Om3NoJPSu240pEFbBvLfUWTsOdyBdNhAvePXctEdX/aruJl
         xilSwObnjii6iV9YoHE0C0O/J6kaFR4Uhn6ZZ8+dgbQgDfdbdHoSo9epXnwilGue43wf
         xl/zNwp6/69/FdVN2V3E1Bq5+En5uAIZbFsoc/OFSoA9tiqHYN2GfnzKbU+GHLZKkxav
         7fTGpxc1DrE7owded7Zo9AXLo7EH4B+OlUunZChOFvw+1V4yE8SwgmI/FBWNPgjZJ3s3
         3uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702273934; x=1702878734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHJV2PGMjruAfWeCQ41TtmWURkmDfN3OTSvooiPRx+Y=;
        b=awk1oprxRLvDo6jYUFr1VujhJJDGIlRSbBPDWyNs02ujJVsmafyLoWpoxpUnKuhmKL
         U5uxozfMXKrSWnMnbeVo99YVKrONvq1MZeYwk53DNEShxnmTjZuXu3mOAKNIsBeaYCBW
         QH1weVdacMt2umaGFfrApnD4xQ3eO3D6Da1WRyrFGSCD0i7eVkQ8KpOhhnSSIqNIGUb0
         mKDJZwKLQL5+yK+ZJ63QTL1S4dci+t+7FWg5XJSoyMCEY4v3WFu5ly5g06WtYw/qfiJ7
         k+sHT3NvA7O0S2nN+9cx9NCQJwW0ZqCOfixB6ockYN8nLQV3kolQbSduNhKA4OuUgCPV
         xGHQ==
X-Gm-Message-State: AOJu0YwwWjsXl2F5c3q9F9opTBQWvpCBGjJfqMOMP4PkDDP1mVUIe3Ra
	qzewfs2mbFswvk9D6x3zELuyAIaDHTsUrqjqex2fgg==
X-Google-Smtp-Source: AGHT+IEjOKGFDA2vI+3U82Soa8M47/BlWX+5s44Eg4L1nrXQr5ZUb04KeSpBoC4PSdGVYVSTPrqI1PAj4/mx9UCkEPc=
X-Received: by 2002:a05:6000:1104:b0:333:4a78:c5ed with SMTP id
 z4-20020a056000110400b003334a78c5edmr1900351wrw.19.1702273934069; Sun, 10 Dec
 2023 21:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20231208151036.2458921-1-guoren@kernel.org>
In-Reply-To: <20231208151036.2458921-1-guoren@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 11 Dec 2023 06:52:02 +0100
Message-ID: <CAHVXubjfuKZ1PBYQ8By41OX65YpAma3_kmSL7urT8L0PmMxFnQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, willy@infradead.org, david@redhat.com, 
	muchun.song@linux.dev, will@kernel.org, peterz@infradead.org, rppt@kernel.org, 
	paulmck@kernel.org, atishp@atishpatra.org, anup@brainfault.org, alex@ghiti.fr, 
	mike.kravetz@oracle.com, dfustini@baylibre.com, wefu@redhat.com, 
	jszhang@kernel.org, falcon@tinylab.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_215216_818931_A418D794 
X-CRM114-Status: GOOD (  23.69  )
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

SGkgR3VvLAoKT24gRnJpLCBEZWMgOCwgMjAyMyBhdCA0OjEw4oCvUE0gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IFdoZW4gY2hhbmdpbmcgZnJvbSBhbiBpbnZhbGlkIHB0ZSB0byBhIHZhbGlkIG9uZSBmb3Ig
YSBrZXJuZWwgcGFnZSwKPiB0aGVyZSBpcyBubyBuZWVkIGZvciB0bGJfZmx1c2guIEl0J3Mgb2th
eSBmb3IgdGhlIFRTTyBtZW1vcnkgbW9kZWwsIGJ1dAo+IHRoZXJlIGlzIGFuIE9vTyByaXNrIGZv
ciB0aGUgV2VhayBvbmUuIGVnOgo+Cj4gc2QgdDAsIChhMCkgLy8gYTAgPSBwdGUgYWRkcmVzcywg
cHRldmFsIGlzIGNoYW5nZWQgZnJvbSBpbnZhbGlkIHRvIHZhbGlkCj4gLi4uCj4gbGQgdDEsIChh
MSkgLy8gYTEgPSB2YSBvZiBhYm92ZSBwdGUKPgo+IElmIHRoZSBsZCBpbnN0cnVjdGlvbiBpcyBl
eGVjdXRlZCBzcGVjdWxhdGl2ZWx5IGJlZm9yZSB0aGUgc2QKPiBpbnN0cnVjdGlvbi4gVGhlbiBp
dCB3b3VsZCBicmluZyBhbiBpbnZhbGlkIGVudHJ5IGludG8gdGhlIFRMQiwgYW5kIHdoZW4KPiB0
aGUgbGQgaW5zdHJ1Y3Rpb24gcmV0aXJlZCwgYSBzcHVyaW91cyBwYWdlIGZhdWx0IG9jY3VycmVk
LiBCZWNhdXNlIHRoZQo+IHZtZW1tYXAgaGFzIGJlZW4gaWdub3JlZCBieSB2bWFsbG9jX2ZhdWx0
LCB0aGUgc3B1cmlvdXMgcGFnZSBmYXVsdCB3b3VsZAo+IGNhdXNlIGtlcm5lbCBwYW5pYy4KPgo+
IFRoaXMgcGF0Y2ggd2FzIGluc3BpcmVkIGJ5IHRoZSBjb21taXQ6IDdmMGIxYmYwNDUxMSAoImFy
bTY0OiBGaXggYmFycmllcnMKPiB1c2VkIGZvciBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbnMiKS4g
Rm9yIFJJU0MtViwgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQKPiBpbiB0aGUgc3BlYyB0byBndWFy
YW50ZWUgYWxsIHRsYiBlbnRyaWVzIGFyZSB2YWxpZCBhbmQgbm8gcmVxdWlyZW1lbnQgdG8KPiBQ
VFcgZmlsdGVyIG91dCBpbnZhbGlkIGVudHJpZXMuIE9mIGNvdXJzZSwgbWljcm8tYXJjaCBjb3Vs
ZCBnaXZlIGEgbW9yZQo+IHJvYnVzdCBkZXNpZ24sIGJ1dCBoZXJlLCB1c2UgYSBzb2Z0d2FyZSBm
ZW5jZSB0byBndWFyYW50ZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGlu
dXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNyArKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gaW5kZXggMjk0MDQ0NDI5ZThlLi4yZmFlNWE1NDM4ZTAgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+IEBAIC01MTEsNiArNTExLDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50
IHB0ZV9zYW1lKHB0ZV90IHB0ZV9hLCBwdGVfdCBwdGVfYikKPiAgc3RhdGljIGlubGluZSB2b2lk
IHNldF9wdGUocHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCkKPiAgewo+ICAgICAgICAgKnB0ZXAg
PSBwdGV2YWw7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIE9ubHkgaWYgdGhlIG5ldyBw
dGUgaXMgcHJlc2VudCBhbmQga2VybmVsLCBvdGhlcndpc2UgVExCCj4gKyAgICAgICAgKiBtYWlu
dGVuYW5jZSBvciB1cGRhdGVfbW11X2NhY2hlKCkgaGF2ZSB0aGUgbmVjZXNzYXJ5IGJhcnJpZXJz
Lgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAocHRlX3ZhbChwdGV2YWwpICYgKF9QQUdFX1BS
RVNFTlQgfCBfUEFHRV9HTE9CQUwpKQo+ICsgICAgICAgICAgICAgICBSSVNDVl9GRU5DRShydyxy
dyk7CgpPbmx5IGEgc2ZlbmNlLnZtYSBjYW4gZ3VhcmFudGVlIHRoYXQgdGhlIFBUVyBhY3R1YWxs
eSBzZWVzIGEgbmV3Cm1hcHBpbmcsIGEgZmVuY2UgaXMgbm90IGVub3VnaC4gVGhhdCBiZWluZyBz
YWlkLCBuZXcga2VybmVsIG1hcHBpbmdzCih2bWFsbG9jIG9uZXMpIGFyZSBjb3JyZWN0bHkgaGFu
ZGxlZCBpbiB0aGUga2VybmVsIGJ5IHVzaW5nCmZsdXNoX2NhY2hlX3ZtYXAoKS4gRGlkIHlvdSBv
YnNlcnZlIHNvbWV0aGluZyB0aGF0IHRoaXMgcGF0Y2ggZml4ZXM/CgpUaGFua3MsCgpBbGV4Cgo+
ICB9Cj4KPiAgdm9pZCBmbHVzaF9pY2FjaGVfcHRlKHB0ZV90IHB0ZSk7Cj4gLS0KPiAyLjQwLjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
