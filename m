Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65232CD80A3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fqQfMShs5WoPS4h1hFop8wLoQ04YY4XpuBbdRxKjaU=; b=Q1dg2zeB54xi1r
	Nc3uVmaWaSx/xjjEN3F9p2kMFdx5dPT+bfs68nEfw80reMbC3uxESnreBFx4UjniUbMLdu1kiCbzd
	5U0xew7LBhYrefdCxaREJz4gsGWJSugExhBKzdJAPz5d61XfdXI+2/nd08WqPo6tZCUsr2LFsQMan
	0ZR4wPv1y/t5wU3t9MR0DOnOMvankor8S6Goh6sac1RXymR5tLut4JG0zjFS9hw6JlMXkg86WUowm
	BOTOJ+80vrYw/BUbhaFn05oqCvvILCj0TdV/Q5tLjKaltye6VeTpXDBlMagTzU3VvHqmSINddlzrL
	vyQebOmuDNn9FU3sutKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqAEA-00D4y5-2t;
	Tue, 10 Oct 2023 10:44:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqAE7-00D4xP-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 10:44:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5046bf37daeso7185729e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696934672; x=1697539472; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8krybOc6g910su2+ON5yPkcreK7Yjzpo8nXIRPrTeb0=;
        b=Sim05Oy9BS08pIkPRbXMsJ3oVRFY3EAUzvslFVgLQYoUILVG4zhVeIHwLbog/5Nl7q
         N8tRiTwBoaJtEChPMLE5TUJbExBnbn0DgK7acHZPI/DmoXakIdxJYmQyByGOanzDLx7I
         j3LW+0+KGZFqpP5UcjZnhjF8Bj9Ctn0A0VB+Ly8ElSBQkYsmoUWdeVeoVK9pyAgP2TrD
         ubchv0FWaLQPbwAdrIZdb4DJdNXur4t2AySM/nNtOMcFspjeFLrqdyDCk8YVHkMVdfaB
         2TUxf2AzjJA34omiu0jwQne77gir01bOuTVr51VIkA8x5aD+DAJwc5fX29vo4OQArx/R
         cwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696934672; x=1697539472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8krybOc6g910su2+ON5yPkcreK7Yjzpo8nXIRPrTeb0=;
        b=uUJDmKUKZGLWxxKSp7LlPBGf65zMgZ4Idm3zeSt/kh9tXa+cnwOFrlhdfnnXbDVWVi
         ck6+HjKvJv9sXYZv7k34n56RcxTavRWbbvfXm0HGRdHzdfIxi7GI//3/fmdrtW0l8qfU
         qk/GYUlWHu5Q3L42UBpt5yH/IsYGaVwMEPBv3vQ2A44wpSYXK4YA50gXSe2b8Ib7Ufm/
         iABXmZgMe16Rs4tgeeFsXnwPypApUx46YkCE+Szl6j82f8vgx/NTxvEsV3ERRA8te2oG
         BlvFXp8qbEfFDrEMVwY/d0VG3jfDAjGEY+zf8QHa02BvgoZsgMir5FnzH9iIEOWp6bgL
         kTFQ==
X-Gm-Message-State: AOJu0YyQ5RV6ZGUPb11CmYOFJQVQyN65EtIvWPvJDxQOVoTH0xS42DQD
	9KQQZ8HxN3OqDTVRP/vpxV1TVg==
X-Google-Smtp-Source: AGHT+IEpH9RbARezv0Z3LgYZMAUnOPNPGB2a+w71G2uvWNmFh3ieAv7Ky7jQy/xI8Uojo05/AhOmnQ==
X-Received: by 2002:a05:6512:3488:b0:503:28ed:143b with SMTP id v8-20020a056512348800b0050328ed143bmr12089131lfr.18.1696934672154;
        Tue, 10 Oct 2023 03:44:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id by1-20020a0564021b0100b005224f840130sm7401280edb.60.2023.10.10.03.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 03:44:31 -0700 (PDT)
Date: Tue, 10 Oct 2023 12:44:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231010-baaa9fc9df51034c98fe0ea3@orel>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com>
 <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel>
 <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
 <20231005-5221bab223ee6d8a4c77b23d@orel>
 <20231009-26f43e41ddc98f0263f4258d@orel>
 <CALs-HsubfzKEzi3BBNH2UHj9Oa77FbkKBxT34P_kqV5gX2OwJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HsubfzKEzi3BBNH2UHj9Oa77FbkKBxT34P_kqV5gX2OwJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_034435_212063_D99A262A 
X-CRM114-Status: GOOD (  36.47  )
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

T24gTW9uLCBPY3QgMDksIDIwMjMgYXQgMDk6NTA6MDBBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDg6MznigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBh
dCAwODoxMToyNVBNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+IE9uIFRodSwgT2N0
IDA1LCAyMDIzIGF0IDEwOjEyOjE0QU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+ID4g
T24gVGh1LCBPY3QgNSwgMjAyMyBhdCA2OjIz4oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBTZXAgMjUs
IDIwMjMgYXQgMDk6MTY6MDFBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gLi4uCj4g
PiA+ID4gPiA+IFNvIGlmIEkgd3JpdGUgb3V0IHRoaXMgYWxnb3JpdGhtLCBJIGdldCBzb21ldGhp
bmcgbGlrZToKPiA+ID4gPiA+ID4gICogQ3JlYXRlIGFuIGFycmF5IG9mIGV2ZXJ5IHBvc3NpYmxl
IGtleSwgYW5kIGRlZHVwZSB0aGUgY2FsbGVyJ3MgbGlzdAo+ID4gPiA+ID4gPiBvZiBwYWlycyBp
bnRvIHRoaXMgYXJyYXkuCj4gPiA+ID4gPiA+ICAqIEZvciBlYWNoIHJlbWFpbmluZyBjcHUsIGdv
IHRocm91Z2ggdGhpcyBhcnJheSBhbmQgZWl0aGVyIGNvbmZpcm0KPiA+ID4gPiA+ID4gdGhlIGJp
ZyBhcnJheSdzIGVsZW1lbnQgbWF0Y2hlcyB0aGlzIGNwdSdzIHZhbHVlLCBvciBjbGVhciB0aGUg
Y3B1Cj4gPiA+ID4gPiA+IGZyb20gdGhlIHJlc3VsdCBzZXQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IEJ1dCB3aHkgZG8gd2UgZ28gdG8gYWxsIHRoZSBlZmZvcnQgb2YgZGUtZHVwaW5nIHRoZSBj
YWxsZXIncyBhcnJheSBvZgo+ID4gPiA+ID4gPiBwYWlycz8gQ2FuJ3QgdGhleSBkbyB0aGF0IHRo
ZW1zZWx2ZXMgKG9yIHBheSBhIHNtYWxsIHBlcmZvcm1hbmNlCj4gPiA+ID4gPiA+IHBlbmFsdHkg
Zm9yICJ5ZXMiIHJlc3VsdHMpPyBJbnN0ZWFkLCBjb3VsZG4ndCBpdCBiZSBzb21ldGhpbmcgbGlr
ZToKPiA+ID4gPiA+ID4gRm9yIGVhY2ggcGFpciBpbiB0aGUgdXNlcidzIHNldCwgZm9yIGVhY2gg
cmVtYWluaW5nIGNwdSBpbiB0aGUgc2V0LAo+ID4gPiA+ID4gPiBjb21wYXJlIHRoZSB2YWx1ZXMs
IG9yIGNsZWFyIHRoZSBjcHUgaW4gdGhlIHJlbWFpbmluZyBzZXQuCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IERvaW5nIHRoYXQgd291bGQgYWxzbyB0YWtlIHRoZSBydW50aW1lIGZyb20gTyhrZXlz
cGFjZSAqIG5jcHVzKSB0bwo+ID4gPiA+ID4gPiBPKHF1ZXJ5X2xlbmdoICogbmNwdXMpLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEkgd2FudCB0byBkZS1kdXBlIGZvciB0d28gcmVhc29uczoKPiA+ID4g
PiA+ICAqIHF1ZXJ5X2xlbmd0aCBpcyB1bmJvdW5kZWQsIGJ1dCBrZXlzcGFjZSBpcyBib3VuZGVk
IChhbmQgaXMgY3VycmVudGx5Cj4gPiA+ID4gPiAgICBzbWFsbCkKPiA+ID4gPgo+ID4gPiA+IE9r
LCBidXQgcmVtZW1iZXIgdGhhdCBpZiB3ZSBzaGlwIHRoaXMgYmVoYXZpb3IgdG9kYXksIHdlJ3Jl
IGNvbW1pdHRlZAo+ID4gPiA+IHRvIGl0IGZvcmV2ZXIuIFRoZSBrZXlzcGFjZSBpcyBsaWtlbHkg
dG8gZ3JvdywgaXQgd291bGQgYmUgdW5mb3J0dW5hdGUKPiA+ID4gPiBpZiB0aGlzIHN0ZXAgc3Rh
cnRlZCB0byBjYXVzZSBhIG5vdGljZWFibGUgcGVyZm9ybWFuY2UgZGVsYXkuCj4gPiA+Cj4gPiA+
IE1heWJlIGl0J3Mgbm90IHRvbyBsYXRlIHRvIHB1dCBhIGJvdW5kIG9uIHBhaXJzLCBpLmUuIHBh
aXJfY291bnQgZ3JlYXRlcgo+ID4gPiB0aGFuIHNvbWUgbnVtYmVyIHNob3VsZCByZXR1cm4gRTJC
SUcuCj4gPiA+Cj4gPgo+ID4gU2NyYXRjaCB0aGlzIGlkZWEuIEkgd2VudCBsb29raW5nIGZvciBw
cmVjZWRlbnQgZm9yIGxpbWl0aW5nIHRoZSBsZW5ndGggb2YKPiA+IGlucHV0IGFycmF5cyB0byBz
eXNjYWxscywgYnV0IGNvdWxkbid0IGZpbmQgYW55LiBUbyB0aGUgY29udHJhcnksIEkgZm91bmQK
PiA+IHRoYXQgbW92ZV9wYWdlcygpIHVzZWQgdG8gcmV0dXJuIEUyQklHIHdoZW4gdGhlcmUgd2Vy
ZSAidG9vIG1hbnkgcGFnZXMgdG8KPiA+IG1vdmUiLCBidXQgaXQgaGFzbid0IGRvbmUgc28gc2lu
Y2UgMi42LjI5IGFuZCwgZXZlbiB0aGVuLCBpdCBhcHBlYXJzIHRoZQo+ID4gY29uY2VybiB3YXMg
bXVsdGlwbGljYXRpb24gb3ZlcmZsb3csIG5vdCBoYXZpbmcgInRvbyBtdWNoIiB3b3JrLiBTbywg
d2UKPiA+IHNob3VsZCBsZWF2ZSB0aGUgbnVtYmVyIG9mIHBhaXJzIHVuYm91bmRlZCwgYnV0LCB0
b28gbWUsIHRoYXQgbWVhbnMgd2UKPiA+IHNob3VsZCBkZS1kdXBlLCBzaW5jZSB3ZSBjYW4gZG8g
dGhlIGNvcHlfZnJvbV91c2VyKCkgb25jZSBmb3IgZWFjaCBhdCB0aGF0Cj4gPiB0aW1lLCBhbmQg
YW55IHVzZXIgd2hpY2ggZGVjaWRlcyB0byBwcm92aWRlIGVhY2ggYml0IHNlcGFyYXRlbHkgZm9y
IGVhY2gKPiA+IGJpdG1hc2sga2V5IHR5cGUgc2hvdWxkIGdldCB0aW55IHNwZWVkdXAuCj4gCj4g
SSBzdGlsbCBkb24ndCBnZXQgdGhlIHVzZWNhc2Ugd2hlcmUgdXNlcm1vZGUgaXMgZ29pbmcgdG8g
YmUgc3VibWl0dGluZwo+IHRoaXMgbGFyZ2UganVtYmxlIG9mIGtleXMsIHJlcGxldGUgd2l0aCBt
YW55IGR1cGxpY2F0ZXMuIEFuZCBldmVuIGlmCj4gc3VjaCBhIGNhc2UgZGlkIGV4aXN0LCB3aHkg
c2hvdWxkIHRoZSBrZXJuZWwgYmUgdGhlIG9uZSBkZWR1cGluZywKPiBkcmFnZ2luZyBpbiBhIHJ1
bnRpbWUgcGVuYWx0eSBmb3IgYWxsIG90aGVyIGNhbGxlcnMgdGhhdCBkaWRuJ3Qgc3VibWl0Cj4g
ZHVwbGljYXRlcy4gVXNlcm1vZGUgY291bGQgZGUtZHVwZSBvbiB0aGVpciBvd24gSSdkIHRoaW5r
LgoKSXQncyBub3QgYWJvdXQgdXNlY2FzZXMsIGJ1dCBhYm91dCBiZXN0IGhhbmRsaW5nIG9mIGFs
bCBhbGxvd2VkIGlucHV0cy4KCklmIGNhbGxlcnMgZG9uJ3Qgc3VibWl0IGR1cGxpY2F0ZXMgb3Ig
bWFrZSB0aGUgY2FsbCB3aXRoIGEgc21hbGwKcGFpcl9jb3VudCwgdGhlbiB0aGUgZGUtZHVwZSBs
b29wIHdvdWxkIGhhdmUgbmVnbGlnaWJsZSBvdmVyaGVhZCBpbgp0ZXJtcyBvZiB0aW1lLiBIb3dl
dmVyLCB0aGlua2luZyBhYm91dCB0aGlzIHNvbWUgbW9yZSwgd2UgY2FuIGF2b2lkCmlzc3Vpbmcg
Y29weV9mcm9tX3VzZXIoKSBtdWx0aXBsZSB0aW1lcyBieSBsb29waW5nIG92ZXIgY3B1cyB3aXRo
aW4KdGhlIGxvb3Agb3ZlciB1c2VyIGlucHV0IHBhaXJzLiBXZSdsbCBkbyBjcHVtYXNrX3NldF9j
cHUoKSBhbmQKY3B1bWFza19jbGVhcl9jcHUoKSBvbiB0aGUgb25lX2NwdSBjcHVtYXNrIG1vcmUg
dGltZXMgaW5zdGVhZCwgYnV0CnRoYXQncyBqdXN0IGEgY291cGxlIGxvYWRzIGFuZCBzb21lIGFy
aXRobWV0aWMuIEkgdGhpbmsgdGhpcyB3b3VsZApiZSB0aGUgYmV0dGVyIGFwcHJvYWNoLCBub3Qg
YmVjYXVzZSBvZiB0aW1lIG92ZXJoZWFkLCBidXQgYmVjYXVzZQp3ZSB3b24ndCBoYXZlIHRvIHN0
b3JlIHBhaXJzIGF0IGFsbCwgYXZvaWRpbmcgbWVtb3J5IGFsbG9jYXRpb24gb3IKdGhlIGFzc3Vt
cHRpb24gdGhhdCB3ZSBjYW4gc3RvcmUgYSBwYWlyIHBlciBwb3NzaWJsZSBrZXkgb24gdGhlIHN0
YWNrLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
