Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3B9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMSFoLd87nfJpO7e9FLHny0N0zT6DheiXYTPGvNmq1w=; b=qfD3Sy+HFjVZ57
	IiTgoeHb/Gr/cT7QrpgV1gGwfEppI0kDpXMYIDNtKkgARMQF5VZC4/pTapKUk67z1xVCLgFw67AVh
	1UHa/EAie+1BEMsFi6I4ZyFEUYHwuXHwaFyfxAC0OWHu26n9wlUv+29Ln6pIzHSCqZAZruyTu2oYy
	90e27TydsDbzd5wJxyNoeTbpOgfxvOgtLwgLkJRx+omb/ZKBE1j7JyBWU5C/F89LzNw/e0aHfExOE
	mSYPM73hA8cMjEAEUnexGnRMY0mwkKfXMqHEBILo+bPOOR5XhdE/TLmRFrUCrBu+Yb4qB7PdoYeDq
	q1Pib2hXbyze9cLxPl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyxqS-00BsKA-1S;
	Fri, 03 Nov 2023 17:20:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyxqO-00BsJI-2i
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 17:20:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c515527310so32454451fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699032025; x=1699636825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPIRAs6IKearV/HlPloxs9uSioewdEyeDfpLIvYB2SI=;
        b=h0XStHeCKbZw2bmXWZb98NG3AcwiXP2vKl3t0M4S7d39r7D6gfQTnAC8BccB0zoOuu
         QHB8n8GGbmOu2CVz2fweiAAYvYMIMgU3FEmSOzPAyaU+FPVs+BNKbc2dSGza+QDB3kK+
         2Yt9o2eM0IWzBTIyLr4ioKPRrAhi+3zTK83DMNQiYV+ubh0oIE+/jgz81c0QVehEoF/e
         dMwfSt7g/Q7YYmco2loeBGFZq1vCxNM2a6MJU7KMglj+jPW5pVqWuaN7ZGA4hdbikOv3
         aIh5oRf1XG83InFQdxI83Dh+hCLubIZXTJjffgMrktG3lBTmC9w4dCUFwDOXp7DM1Ebq
         fcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699032025; x=1699636825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPIRAs6IKearV/HlPloxs9uSioewdEyeDfpLIvYB2SI=;
        b=qO8m1ismkap7m6GSEDILI7ja8sZwj9BUKYL3DsOwRckB1/zJquXZZdaHaE/FJBm82V
         omfV1TBlfKpcfF3usFJ0tk/ByvgwUA9S8tfJjVCQumW/F5+rd23NA4IlXzlBXtzpZNK4
         pxvu8lZvgly1Lug/JsZSfRgdU1lfbyanPtmI4FJQ3nIxQjpBoCaIET8XvKLJtfi31kvH
         N0QeQHQOWvggqng6+npbr/1BpBd8Ci3NttRdg9sqcTrwDl66KR18mouBq2LKMA8dCv16
         pUdXEN/pB/B/cEmcQcfLlKx/kRJLHRZ9nRsKpvmT3ED6J32DOUqr1b4KDcPO0xaGxRNJ
         4Kew==
X-Gm-Message-State: AOJu0Yw/FAuR2aP8q1BRsnEuZgQVLAUbNor5N4gsczL41K5c0gYZlo+Y
	iRX9p0Fqee5aopXNiUg2RRU+Fo2ACq8Be2WAzpp8hQ==
X-Google-Smtp-Source: AGHT+IHHvI0yWyWTmTZxJSBb4hBVJaWR7tQhbozKtNK6TQ9P86h/V0qEi/HQFY4wjPUcfQr4WcN8LPAOgR2NixMFPzE=
X-Received: by 2002:a05:651c:78a:b0:2bc:b557:cee9 with SMTP id
 g10-20020a05651c078a00b002bcb557cee9mr16535728lje.43.1699032025654; Fri, 03
 Nov 2023 10:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231031143521.441-1-jszhang@kernel.org> <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker> <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker> <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de> <20231103-army-gloater-af710df04628@spud>
 <20231103082411.f_ZU1E7V@linutronix.de>
In-Reply-To: <20231103082411.f_ZU1E7V@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 Nov 2023 10:19:49 -0700
Message-ID: <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_102029_199721_F695021A 
X-CRM114-Status: GOOD (  13.95  )
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

T24gRnJpLCBOb3YgMywgMjAyMyBhdCAxOjI04oCvQU0gU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lv
cgo8YmlnZWFzeUBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIDIwMjMtMTEtMDMgMDg6MTQ6
MDEgWyswMDAwXSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gSSdtIGRvbid0IHRoaW5rIHRoYXQg
cHJvYmxlbXMgYXJlIHJlc3RyaWN0ZWQgdG8gYSB0cmVlIGNvbnRhaW5pbmcgRXZhbidzCj4gPiBw
YXRjaCBmb3IgcGFyYWxsZWwgY2hlY2tzLiBGb3IgZXhhbXBsZToKPgo+IEkgc2F3IGNoZWNrX3Vu
YWxpZ25lZF9hY2Nlc3MoKSBiZWluZyBpbnZva2VkIGZyb20gYXJjaF9pbml0Y2FsbCgpLwo+IGNo
ZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9vdF9jcHUoKSB3aGljaCBpcyBmaW5lLiBUaGUgb3RoZXIg
aW52b2NhdGlvbgo+IGZyb20gc21wX2NhbGxpbigpIChzZWNvbmRhcnkgYnJpbmcgdXApLiBUaGlz
IGlzIG5vdC4gRXZhbidzIHBhdGNoIG1ha2VzCj4gdGhlbSBhbGwgaGFwcGVuIGZyb20gU01QLWZ1
bmN0aW9uIGNhbGwgd2hpY2ggaGFwcGVucyBhbHdheXMgd2l0aAo+IGRpc2FibGVkIGludGVycnVw
dHMuCgpIaSBTZWJhc3RpZW4sCkNvdWxkIHlvdSBlbGFib3JhdGUgYSBsaXR0bGUgb24gdGhlIHJ1
bGUgdmlvbGF0aW9uIGhlcmU/IFRoZQpkb2N1bWVudGF0aW9uIGZvciBHRlBfTk9XQUlUIHNheXM6
Cgo+IElmIHRoZSBhbGxvY2F0aW9uIGlzIHBlcmZvcm1lZCBmcm9tIGFuIGF0b21pYyBjb250ZXh0
LCBlLmcgaW50ZXJydXB0Cj4gaGFuZGxlciwgdXNlIGBgR0ZQX05PV0FJVGBgLgoKd2hpY2ggc2Vl
bXMgbGlrZSBpdCBiYXNpY2FsbHkgZml0cyBteSBzaXR1YXRpb24uIElmIEkgZG8gYSBzZWFyY2gg
Zm9yCkdGUF9OT1dBSVQgdG8gaHVudCBmb3IgaW5zdGFuY2VzIG9mIGFsbG9jYXRpbmcgd2l0aCBp
bnRlcnJ1cHRzCmRpc2FibGVkLCBJIHNlZSBhdCBsZWFzdCB0aGUgZm9sbG93aW5nIGV4YW1wbGVz
IChtb3JlIGF2YWlsYWJsZSB1cG9uCnJlcXVlc3QpOgoKW2t6YWxsb2NdIGFyY2gvc3BhcmMva2Vy
bmVsL2FkaV82NC5jOiBhbGxvY190YWdfc3RvcmUoKQpba3phbGxvY10gYmxvY2svYmxrLWNncm91
cC5jOiBibGtnX2NyZWF0ZSgpCltpZHJfYWxsb2NdIGRyaXZlcnMvYWNjZWwvZHJtX2FjY2VsLmM6
IGFjY2VsX21pbm9yX2FsbG9jKCkKW2t6YWxsb2NdIGRyaXZlcnMvYmxvY2svbG9vcC5jOiBsb29w
X3F1ZXVlX3dvcmsoKQpbaWRyX2FsbG9jXSBkcml2ZXJzL2Jsb2NrL3VibGtfZHJ2LmM6IHVibGtf
YWxsb2NfZGV2X251bWJlcigpCgpGaW5kaW5nIHRoZSBkb2N1bWVudGF0aW9uIHRoYXQgc3RhdGVz
IHRoaXMgaXMgaWxsZWdhbCBtaWdodCBoZWxwIG1lCnVuZGVyc3RhbmQgd2hhdCBJIHNob3VsZCBi
ZSBkb2luZyBpbnN0ZWFkLiBGb3IgZXhhbXBsZSwgSSdtIGZ1enp5IG9uCnNvbWV0aGluZyB0aGF0
J3MgZGlzYWxsb3dlZCB3aGVuIGludGVycnVwdHMgYXJlIGRpc2FibGVkIGJ1dCBvayBpbgpzbXBf
Y2FsbGluKCkuCgpPbmUgb3B0aW9uIGlzIHRvIGRvIGFsbCB0aGUgYWxsb2NhdGlvbnMgaW4KY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpLCBhbmQgcGFzcyB0aGVtIGluLCBidXQgdW50
aWwgSSBjYW4KZmluZCB0aGUgcnVsZXMgaXQncyBoYXJkIHRvIHZlcmlmeSB0aGF0J3MgYSBjb3Jy
ZWN0IGZpeC4gSXQncyBhbHNvIGEKbGl0dGxlIGNsdW5reSwgYW5kIHdvdWxkbid0IGFwcGx5IHRv
IHRoZSBob3RwbHVnIHBhdGgsIHNvIEkgd2FudCB0bwptYWtlIHN1cmUgaXQncyBuZWNlc3Nhcnkg
YW5kIHN1ZmZpY2llbnQgYmVmb3JlIGVtYmFya2luZyBvbiB0aGF0CmpvdXJuZXkuCgotRXZhbgoK
Pgo+IFNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
