Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BC6C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBZUme7pxMqZNQoWYSzWEiWBYAGx1YAS4ZTaEBSsxyY=; b=r1Ky2PJSgXufkF
	0RUgFXuRtpwy1i99skOSigG5DjUJzhNMT0SqJTJr1UB+KF0yrzRUnoEn/i/3MH2mJzb4IAhTYJra9
	e955S05BeEmvLHVhDuJ9bnmI/PjCMU/ZHBcK2UJP5DYtwn9FAYlRCuStbRrbBlGcW96/4TngXdl13
	o0TnXuJwqDuP8ctFa0nxo9tqZ/yRvCjXRHPgG6d5j1BN2tbnlfEPJVeAhkTkGey/M4uGb+MmgB3Ps
	9dg93XUbhK1SNk98xnzYnunAyTicTR/mlntlqn+0lbbS5JfnluGY4ZSQNFO6oUe8JqUmqvHJaLgKq
	r5Vwv/IbzLe3uJNh3xhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHJy-006fYK-1Z;
	Wed, 19 Apr 2023 23:34:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHJw-006fXs-0J
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 23:34:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-24704a7bf34so281459a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681947278; x=1684539278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42V/4d2g4SmvVdtXXthexb+5Ubl/6v371AotGfmaixU=;
        b=lgrWN3ZYYUvxafsTOzwbZWiNtrbe8XhcGEd/r4vVw8GtLnvll+Mvinro9WIVnR7cdr
         +Lt9LcEQFlrJuCxKy5W0tkjkWAFuV2ex9CCpzHsX848xUdkxfhWlrizQarsdW2RFRqP6
         Nf/+gtcblODAJ/oIEwPw4g6tRzhkn6C6Q46r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681947278; x=1684539278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42V/4d2g4SmvVdtXXthexb+5Ubl/6v371AotGfmaixU=;
        b=UPjiA6h3R60AQzaeQI1Jd9ozygikLoETkvg2vNH+8WorP/JaV156gX7k5BhgIRHCy3
         ZC3EtW79v+9C0JmszKLrsl90y56um3D/8HelyUwBL6N8sX+AG8P+dENFoL8Yg2umAQvD
         b7yZ9TsTyingwyJDQWEFYJkCP4TTGwCQtF0eUQFjpOTZA3gvlQFyV9fiudZ9CjelJiXg
         WpAhydgT2JvVrkMMmO6y0i8NSappoj+75tqdPqloXXEnZ0eN+7il69tC0l2PWCros9Zq
         yOpOdXeWOK4qDAdIp9lSqvOKgiUkqsCj6jxWehX0n/zL9sv14JWVnKXjmyssmEo63IxE
         1s2Q==
X-Gm-Message-State: AAQBX9fDwJx7ATJDHlfBkcZjjvmqAOXl4KyIMIbueZ/K/W5XNE61mktS
	eII5puEn8J415iKVECyMu5uyw0bORPdd2MdfzRvQ
X-Google-Smtp-Source: AKy350aBH0VEPcP2Qh/Eoox3kPORS1HQObKPOJMrnSxK+FdPS8mYZv3TNtyW5xMB6xiXuJwilswkqt/c7AoWpmH4+5o=
X-Received: by 2002:a17:90b:180f:b0:247:eae:1787 with SMTP id
 lw15-20020a17090b180f00b002470eae1787mr4273120pjb.36.1681947278172; Wed, 19
 Apr 2023 16:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org> <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop> <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
 <ZCvJpnNZYzrIcfPe@sunil-laptop> <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
 <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
In-Reply-To: <CAFiDJ5-7qY2vQvbcTU7QPLmqrbCmXWkCxmswO4OqeYtsNOiOFw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 20 Apr 2023 05:04:26 +0530
Message-ID: <CAOnJCUJT+kdFRn=3nZA6P6JatyN0anbKd0ufbQ_Zs9DSAoaC6A@mail.gmail.com>
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
To: Ley Foon Tan <lftan@kernel.org>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, llvm@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_163440_134320_A626D9D0 
X-CRM114-Status: GOOD (  25.78  )
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

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTozOOKAr1BNIExleSBGb29uIFRhbiA8bGZ0YW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciA2LCAyMDIzIGF0IDEwOjQ14oCvQU0gQXRp
c2ggS3VtYXIgUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPgo+ID4gPiA+
Cj4gPiA+ID4gSGkgU3VuaWwKPiA+ID4gPgo+ID4gPiA+IE9uZSBxdWVzdGlvbiByZWdhcmRpbmcg
UE1VIGluIEFDUEkgZmxvdy4KPiA+ID4gPgo+ID4gPiA+IFdlIHVzZSBEVCB0byBkZWNvZGUgdGhl
IHN1cHBvcnRlZCBIUE0gY291bnRlcnMvZXZlbnRzIGZvciB0aGUKPiA+ID4gPiBkaWZmZXJlbnQg
cGxhdGZvcm1zIG5vdy4KPiA+ID4gPiBIb3cgZG8gd2UgZW5hYmxlIFBNVSAoZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYykgd2hlbiB1c2luZyBBQ1BJIG1ldGhvZD8KPiA+ID4gPiBOb3RlLCB0
aGlzIG1pZ2h0IGJlIGluIHNlcGFyYXRlIHBhdGNoIHNlcmllcy4KPiA+ID4gPgo+ID4gPiBIaSBM
YXkgRm9vbiwKPiA+ID4KPiA+ID4gVGhpcyBkcml2ZXIgdXNlcyBTQkkgY2FsbHMgYW5kIGhlbmNl
IHNob3VsZCB3b3JrIGluIGNhc2Ugb2YgQUNQSSBhbHNvLgo+ID4gPgo+ID4gPiBUaGVyZSBpcyBv
bmUgbWlub3IgY2hhbmdlIHJlcXVpcmVkIGluIHRoaXMgZHJpdmVyIGZvciBvdmVyZmxvdwo+ID4g
PiBpbnRlcnJ1cHQuIEkgaGF2ZSBhIHBhdGNoIGZvciB0aGF0IGluIGZ1dHVyZSBzZXJpZXMuCj4g
Pgo+ID4gSnVzdCB0byBhZGQgZnVydGhlciBjbGFyaWZpY2F0aW9uOiBPcGVuU0JJIHdpbGwgY29u
dGludWUgdG8gdXNlIHRoZQo+ID4gZGV2aWNlIHRyZWUgc28gdGhhdAo+ID4gdGhlIGZpcm13YXJl
IHdpbGwgaGF2ZSBhY2Nlc3MgdG8gYWxsIHRoZSBQTVUgZGV0YWlscy4KPiA+Cj4gU29ycnkgZm9y
IHRoZSBsYXRlIHJlcGx5LCBtaXNzZWQgb3V0IG9uIHRoaXMgZW1haWwgaW4gbXkga2VybmVsLm9y
ZyBtYWlsYm94Lgo+Cj4gRG8geW91IG1lYW4gT3BlblNCSSBzdGlsbCB1c2luZyB0aGUgZGV2aWNl
IHRyZWUsIGJ1dCBFREsgSUkgYW5kIExpbnV4Cj4gdXNpbmcgdGhlIEFDUEkgdGFibGU/IE5vcm1h
bGx5IExpbnV4IHNob3VsZG4ndCBtaXggYmV0d2VlbiBBQ1BJIGFuZAoKWWVzLiBGb3IgTGludXgs
IGl0IHdpbGwgb25seSBiZSBBQ1BJLiBPdGhlcndpc2UsIHdlIGhhdmUgdG8gZGVmaW5lIGFsbAp0
aG9zZSBiaW5kaW5ncyBpbiBBQ1BJIGFzIHdlbGwuCkluIHRoZSBmdXR1cmUsIHdlIHdpbGwgaGF2
ZSBzdXBlcnZpc29yIGNvdW50ZXIgZGVsZWdhdGlvbiBJU0EKZXh0ZW5zaW9uKGluIHByb2dyZXNz
KSB0aGF0IGFsbG93cyB0aGUga2VybmVsIHRvIGRpcmVjdGx5IHByb2dyYW0KdGhlIGhwbWV2ZW50
cyAmIG1vZGlmeSBjb3VudGVycyB3aXRob3V0IG5lZWRpbmcgU0JJIFBNVSBleHRlbnNpb24uCgoK
PiBkZXZpY2UgdHJlZS4KPgoKCj4gUmVnYXJkcwo+IExleSBGb29uCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKCi0tIApSZWdhcmRzLApB
dGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
