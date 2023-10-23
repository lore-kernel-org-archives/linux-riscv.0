Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50554C004C0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGPyMPm9m0rIvF2JMfEIa6USDoa1PmKCphe+m94c1gY=; b=VMDVgVPKyGuRiF
	W4RTVM5vM8ee9d/GlFiZBwO+6qGYgbWmKh9dVmTCYEhAprDBz3zUI059uFc3f4S6jcef33LIfOpCd
	6bCsdJFZkGpmp8fq3Wcm/09Jpc6cx4UBoVMUSlf2y+WWJYzuv1pMqmpIaILEWu9v/L2Bn5q+V1yz1
	kcTFxF4WGuufYEN548gOs+wi/pdeck6v3tZCcTa0rexLR3ZmMy4ScejsezHxqOyB46B1EPaWfCt8k
	rTs2kmASCf4Kx2dpGp5Mmp4iYLWBvt45l5W+oetDPeFnN32sNyttiDRPLOr60Od8CD4dAM0Y0m+yv
	d5QUMXgt46lcvQ9AsOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxgx-007owA-30;
	Mon, 23 Oct 2023 16:22:11 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxgv-007ov1-1O
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 16:22:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso50334221fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698078125; x=1698682925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvcxBfUwTMvPmDC6TsZGUmIpxz3bHu9zv5qH2J4V6xE=;
        b=rtQ0eQwojD/MZVGlUiCk0MU7tXfcDfX0fAFcVD0fE6fUIMtKkHEXVpdnpQq28o0PcT
         vZ4GH6R1vCMVQWGINCCJ7q0CMZ48Ixhzac7F9aLZney++AMYE9kvy8bKAp4jIjy28Aud
         qnxnfkLKOdt5ReOQQVZyo6jGENBYj1Gr7cz8qUmqB2FeutCwjs4ce+0i6G0TeFEuBKyQ
         BgTDSMsydFj+rwj4zgCI3w3hdxgJRBeP8yqbJ/dDMamBqHx/XpDalivZKzIXXG6eQB3K
         0msR5+9Va6FghkaWPU0JYbhAs1hKAwzDCZ+DMQctHZ/1Bfq8qEAxUDpbT3q0WFOa81au
         nbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698078125; x=1698682925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvcxBfUwTMvPmDC6TsZGUmIpxz3bHu9zv5qH2J4V6xE=;
        b=nKioCtcn/rZCV/6gCJ0DxcqU/v0q8ENKHJF9sIA43AMM+pj7nxiqhKxsmohSTtUTfn
         DSflaiZG+3wO7nA/1NjyQM3BDAVCVj+w6O7CBoeyFS0YKDcR5Fis2mdLam3wp8cJjioh
         AWV3w9D6pCoyYED8iIWKEpkx3toXpmJcVcdmiaLSAm4t3irMDcwWc3Soeyl0SKF0qV3X
         4S7t+vjGoPAcWPvveJypaaEuIjoi4kpiIcQLVBerMC/UHrfbViZHH2Y6SvwgNlSez3W0
         uh3JiSHjtW0qjpTg4macg8bg3YK+TDFQ3rFDdrf73hA3OK7bAFUNc+/hdUFYGrv9RJOP
         cwtQ==
X-Gm-Message-State: AOJu0Yx5J/nHL6FyY9oSmh/S4cU4U4dZJBPHm92OmdFqsbFdNcAlcUqT
	+1vvN4RIM3qhSBimt50tdPjUJEXK6HKRGAcQRQf5Ug==
X-Google-Smtp-Source: AGHT+IEP51JeurMrSnMxRP4SCcBBFFsO16Z3a/gjoXi+83Wq0Fjd6byKKpI/lH8LyKcnrolzQSYWFeD5i8xlSchTYy0=
X-Received: by 2002:a05:651c:1038:b0:2c5:1bd9:f95c with SMTP id
 w24-20020a05651c103800b002c51bd9f95cmr6122574ljm.53.1698078124702; Mon, 23
 Oct 2023 09:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-3-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-3-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 23 Oct 2023 09:21:28 -0700
Message-ID: <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar crypto
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_092209_475008_DEFC4871 
X-CRM114-Status: GOOD (  12.04  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5j
LmNvbT4KPgo+IFRoZSBTY2FsYXIgQ3J5cHRvIHNwZWNpZmljYXRpb24gZGVmaW5lcyBaayBhcyBh
IHNob3J0aGFuZCBmb3IgdGhlCj4gWmtuLCBaa3IgYW5kIFprdCBleHRlbnNpb25zLiBUaGUgc2Ft
ZSBmb2xsb3dzIGZvciBib3RoIFprbiwgWmtzIGFuZCBaYmssCj4gd2hpY2ggYXJlIGFsbCBzaG9y
dGhhbmRzIGZvciB2YXJpb3VzIG90aGVyIGV4dGVuc2lvbnMuIFRoZSBkZXRhaWxlZAo+IGJyZWFr
ZG93biBjYW4gYmUgZm91bmQgaW4gdGhlaXIgZHQtYmluZGluZyBlbnRyaWVzLgo+Cj4gU2luY2Ug
WmtuIGFsc28gaW1wbGllcyB0aGUgWmJrYiwgWmJrYyBhbmQgWmJreCBleHRlbnNpb25zLCBzaW1w
bHkgcGFzc2luZwo+ICJ6ayIgdGhyb3VnaCBhIERUIHNob3VsZCBlbmFibGUgYWxsIG9mIFpia2Is
IFpia2MsIFpia3gsIFprbiwgWmtyIGFuZCBaa3QuCj4gRm9yIGV4YW1wbGUsIHNldHRpbmcgdGhl
ICJyaXNjdixpc2EiIERUIHByb3BlcnR5IHRvICJydjY0aW1hZmRjX3prIgo+IHNob3VsZCBnZW5l
cmF0ZSB0aGUgZm9sbG93aW5nIGNwdWluZm8gb3V0cHV0Ogo+ICJydjY0aW1hZmRjX3ppY250cl96
aWNzcl96aWZlbmNlaV96aWhwbV96YmtiX3pia2NfemJreF96a25kX3prbmVfemtuaF96a3Jfemt0
Igo+Cj4gcmlzY3ZfaXNhX2V4dF9kYXRhIGdyb3dzIGEgcGFpciBvZiBuZXcgbWVtYmVycywgdG8g
cGVybWl0IHNldHRpbmcgdGhlCj4gcmVsZXZhbnQgYml0cyBmb3IgImJ1bmRsZWQiIGV4dGVuc2lv
bnMsIGJvdGggd2hpbGUgcGFyc2luZyB0aGUgSVNBIHN0cmluZwo+IGFuZCB0aGUgbmV3IGRlZGlj
YXRlZCBleHRlbnNpb24gcHJvcGVydGllcwo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBH
cmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVnZXJAcml2b3NpbmMuY29tPgoKTXkgdHJlZSBtaWdodCBiZSBvdXQgb2Ygc3luYywgYnV0
IGluIG15IHNlYXJjaCBmb3IgcmlzY3ZfaXNhX2V4dCwgSQphbHNvIGZvdW5kIGEgdXNlIGluIHBy
aW50X2lzYSgpIChjcHUuYykgd2hlcmUgd2UncmUgcmVhY2hpbmcgaW50bwpyaXNjdl9pc2FfZXh0
W10uaWQgYW5kIGFzc3VtaW5nIGl0J3MgYWx3YXlzIHZhbGlkLiBJZiB0aGF0J3Mgc3RpbGwgaW4K
dGhlcmUgd2UnbGwgd2FudCB0byBmaXggdXAgdGhhdCBzcG90IHRvbywgc2luY2Ugbm93IHdpdGgg
YnVuZGxlcyAuaWQKbWF5IG9yIG1heSBub3QgYmUgdmFsaWQuCgotRXZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
