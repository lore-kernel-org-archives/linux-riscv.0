Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69967C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kgv8GJXt+k0Zv9LBpU0fFbtnaEyCF6WzSXQ+kcPYS5A=; b=TIcahIU/NQuZWT
	feIqdKU2TWzvVUalz1nRKGLDK3iJLC8DvwRJLrVRfU6dyjTv48D4fDlxicNN2QXCRFDXdzYhprZky
	Em/ugvfWdlwhdVsKiePzLBfTicgio0OpmwsVkzlHR3Kk3KDmPqIMtYpuZnYkkOCZbGl8zY75yy52/
	QeiT0+v+5XoiSeuqqk+cdECvw7L/RwDbwAyNE10ccTZo2V52ZFNSLcC6iP29i/z/YUKCX9szY9KCX
	j4FadNhnUKik3SE7XQm87VCNwtqprkmybRdDFj78ZvbVl/ZBYlQImmBf75Y75njRwr8wSreIgDpXl
	BkquF8fJQGWLNoUiqNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDibS-00HQ12-11;
	Thu, 14 Dec 2023 10:06:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDibP-00HQ0M-1D
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:06:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3364a657564so198774f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702548357; x=1703153157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDsPjfWnGKr9KSejE8QyzgD6e/he63cgsRUn3ctxThw=;
        b=aRt/gc5NX6+8xF3suPDKoWpr7ivTNyPvluWi73/CHQn2fF8cGvdFRPT15x0xGTi09w
         poKUjK7ajqefDKZktOsJMWtZ6RnryyIfOiyrp5va6AQq2zv7unEZkyadNeUL9/oPINf8
         CSbQ+Mm3upKJ1Xpy0UnKGaaOwZksf6CCSPjeKdI2HOQ8gZ1bFKZSXmWISfvYKGuvtPso
         WMHC1v4Ez4JN0czrhiAFq/RViHEC5Xk5r7b31Ucu8RqjotTWMcxPZQ5GWKnBbmUHMsMK
         p4WMjf357MEgQ0L5STfJBur+439Q61aHLQBx6w9QtCSBGsJw80t4cHZXdrYU6EPi0dOp
         FmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548357; x=1703153157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDsPjfWnGKr9KSejE8QyzgD6e/he63cgsRUn3ctxThw=;
        b=GoTCna2x8QuQWME0Co8SxOJTnzYD5S9lU3EvnyihhbuprqMKVfjKzR6FuqWUWSf9pe
         T4WNOcj7W54yKZSVkS6A5aa3gH+UnOyt6ViD2AHp8GiFQBLhIAAKntb2KfQd1BKLuWRl
         JkimpSZzodSGPrv0naSRMqnK8s0FwsAIqK+Ophwth89Wf1Pf4m9q62SXGQfsVy7AO6My
         w70WxCVHey8smXW9GWaZ2cpAuj5HbYJAjtMM2O3RCc/4zIZfR+gpzbmwxkyIpeEfiLlZ
         VH+lkzeBjIpJIo+ip7EYhpfxEYjXzThtf/ntNIWfEAohUFdSLP2JvzRBGYWp52mA9afq
         b0YQ==
X-Gm-Message-State: AOJu0YwZQOR9f0Dp2xOfvz+qBNOlHZu+1dUUrV9N7L8IkQbDg/mP1aWC
	K89YHKMssiRR13jvUI5m8gAA/lJCWecoSPOwSpY8Jg==
X-Google-Smtp-Source: AGHT+IFEj1d/zLkTSnTJxcMNp0WFx5qH7ufZ2AUcgoEC8MazG17uK9uacSlHh7g+oQWF1dkQvaBGJsNH94VyLR3Ch7Q=
X-Received: by 2002:adf:e053:0:b0:333:2fd2:2f08 with SMTP id
 w19-20020adfe053000000b003332fd22f08mr4447760wrh.129.1702548357302; Thu, 14
 Dec 2023 02:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
 <20231213-excretory-ashen-03a34f3a4c90@spud> <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
In-Reply-To: <CAHVXubga7Q6X-zW_qztS2V_Z8TBp0gm2UV_GAj2O-5nn-_yCyA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 14 Dec 2023 11:05:46 +0100
Message-ID: <CAHVXubhN3GQ1hu7uVof2RSByVzAGCeT_-_YvNpgaDOKuZL2fBw@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_020559_416442_A94AA2EE 
X-CRM114-Status: GOOD (  15.71  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMjozM+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjU3
4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBU
dWUsIERlYyAxMiwgMjAyMyBhdCAwOTowMToxN0FNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4gPiA+IEhpIFJhbmR5LAo+ID4gPgo+ID4gPiBPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAx
MDoxN+KAr1BNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBPbiAxMi8xMC8yMyAyMjoyNSwgU3RlcGhlbiBS
b3Rod2VsbCB3cm90ZToKPiA+ID4gPiA+IEhpIGFsbCwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFu
Z2VzIHNpbmNlIDIwMjMxMjA4Ogo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IG9uIHJpc2N2MzI6
Cj4gPiA+ID4KPiA+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMy
LWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBp
biBmdW5jdGlvbiBgLkw0JzoKPiA+ID4gPiBwYXRjaC5jOigudGV4dCsweGJlKTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9iZWdpbicKPiA+ID4gPiAvb3B0L2Nyb3NzdG9vbC9n
Y2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRj
aC5jOigudGV4dCsweGMyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9iZWdp
bicKPiA+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4
L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5j
dGlvbiBgLkwxMic6Cj4gPiA+ID4gcGF0Y2guYzooLnRleHQrMHhkMik6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+ID4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4y
LjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50
ZXh0KzB4ZDYpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2VuZCcKPiA+ID4g
PiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNj
djMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5jdGlvbiBgLkwx
NSc6Cj4gPiA+ID4gcGF0Y2guYzooLnRleHQrMHgxZWEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX2V4aXR0ZXh0X2JlZ2luJwo+ID4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9s
aWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDcnOgo+ID4gPiA+IHBhdGNoLmM6KC50ZXh0KzB4MWVl
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9iZWdpbicKPiA+ID4gPiAvb3B0
L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxp
bnV4LWxkOiBwYXRjaC5jOigudGV4dCsweDFmZSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9f
ZXhpdHRleHRfZW5kJwo+ID4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jp
c2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNo
Lm86IGluIGZ1bmN0aW9uIGAuTDIyJzoKPiA+ID4gPiBwYXRjaC5jOigudGV4dCsweDIwMik6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+ID4gPiA+IC9vcHQvY3Jvc3N0
b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6
IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGBfX3BhdGNoX2luc25fd3Jp
dGUnOgo+ID4gPiA+IHBhdGNoLmM6KC50ZXh0KzB4NDEwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgX19leGl0dGV4dF9iZWdpbicKPiA+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5v
bGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4dCsw
eDQxNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfYmVnaW4nCj4gPiA+ID4g
L29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlzY3YzMi1saW51eC9iaW4vcmlzY3Yz
Mi1saW51eC1sZDogcGF0Y2guYzooLnRleHQrMHg0MjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX2V4aXR0ZXh0X2VuZCcKPiA+ID4gPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGli
Yy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4dCsweDQy
OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+ID4gPiA+IC9vcHQv
Y3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGlu
dXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDQ2JzoKPiA+
ID4gPiBwYXRjaC5jOigudGV4dCsweDUzYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhp
dHRleHRfYmVnaW4nCj4gPiA+ID4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEzLjIuMC1ub2xpYmMvcmlz
Y3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2guYzooLnRleHQrMHg1NDApOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+ID4gPiA+IC9vcHQvY3Jv
c3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgt
bGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDQ4JzoKPiA+ID4g
PiBwYXRjaC5jOigudGV4dCsweDU1MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRl
eHRfZW5kJwo+ID4gPiA+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzIt
bGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50ZXh0KzB4NTU0KTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9lbmQnCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IEZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLgo+ID4gPgo+ID4gPiBXZSBjYW4gaWdu
b3JlIHRoaXMgb25lIGFzIENPTkZJR19YSVAgaXMgZW5hYmxlZCBhbmQgd2UgYWdyZWVkIGF0IExQ
Qwo+ID4gPiB0aGF0IEknbGwgcmVtb3ZlIHRoaXMgc29vbi4KPiA+Cj4gPiBJIGRvbid0IHRoaW5r
IHdlIGNhbiAoZXZlbiBpZiBwZW9wbGUgaGFkbid0IHNlbnQgcGF0Y2hlcyB5ZXN0ZXJkYXkgZm9y
Cj4gPiBYSVApIGFjdCBhcyBpZiBYSVAgYmVpbmcgcmVtb3ZlZCBpcyBhIGZvcmVnb25lIGNvbmNs
dXNpb24uCj4KPiBPaywgdGhlIGZpeCBpcyBlYXN5IGVub3VnaCBmb3IgbWUgdG8gc2VuZCBpdCBy
aWdodCBub3csIHNvIEknbGwgZml4IHRoYXQgOikKClRoZSBmaXggaXMgaGVyZQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyMzEyMTQwOTE5
MjYuMjAzNDM5LTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KYW5kIEkgYXNrZWQgUGFsbWVyIHRv
IHJlcGxhY2UgdGhlIHYxIGhlIGFscmVhZHkgaGFkIGluIC1maXhlcyB3aXRoCnRoaXMgbmV3IHZl
cnNpb24sIGhvcGVmdWxseSBpdCB3aWxsIGxhbmQgaW4gcmM2LgoKVGhhbmtzLAoKQWxleAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
