Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E46C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 00:55:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C191A20B1F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 00:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgVGHv5n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="gaSWRhfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C191A20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=hwbqgjLcjOjPHOTeUfD4WvsI88mhH+oSrUxa7dj3n3w=; b=YgVGHv5nCy0VkE/bBJgj47pYV
	XKkJ08DPeF2uZFrWAwj57uD8Im34ViVMgTeOiwhctlLwwWyojZatkJUsXodfMebeXPnmQsw0zCPoA
	vjquLcOIIUSTOEqewUa2SkY6n7mtpLOwpxi1nmII0lYjDm8vZDovoQy47cM8o5eQmAuV/Y/D8yVzi
	pmRQmGzE4O7+nKq3HFCTavdflog4g/OzgYelbmJlhSFuPfa384Y+6VKYnTYh7/g9jj32uuNil03dj
	7a6C9UN/gCS/wbXh23i8gLVLyqsmR319bDFFZA0Pyv5CLLeWIWCvY+haQBm4zfRccRXb6AWZZwdSV
	EQ+fvlzRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxgYe-0000Cr-5Q; Tue, 21 Jul 2020 00:55:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgYa-0000BV-Pj
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 00:54:57 +0000
Received: by mail-pl1-x643.google.com with SMTP id m16so9490773pls.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 17:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=M1/nNQUlC3p1OgwkpyQMYQP0TLTmza76AXl+zBZku18=;
 b=gaSWRhfTKtLQiNJjcQdeA8o8zWYk7T1qmERoxtWZ4kx2XqxX2PHeXC9tQqb8Lwu1Mn
 HwrWeUUsrqKzehQCx0iXEIbK+5s9luPoI7jFJ8fOxWwIm0rhLcwlX/r8FGoP/W34Edb6
 vQVYh5SYDHXPUn20krgDRHnSi9/F8rkV98jYLieD/akpgVmFJo3bLWpIyYs08VeEHmZm
 e1jQ3OYUsd29inRPKUQSj0nS+WNXKpMpDXinQOdhfX4iVxMYtg/moc5G686ZiQIDB7KQ
 KItkjj/rTc4C11rDxhbnpg58LdtKhsQdEJH3036P3JAiJSve/n3W6OZNymEeWAXuF/cc
 Hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=M1/nNQUlC3p1OgwkpyQMYQP0TLTmza76AXl+zBZku18=;
 b=N39jtijEo759m9soOCEime2luJyvdFuAV5MHXN8l5h089EG/zu6/Ppk8tgqjPYtro8
 sV2HTQjBrH5E4INFCHurn3wloBFcnn8U6IQHPLAUhd1ayIiBJvrdvw1CW9yv6x72+uUG
 DH5nGrRECmmOU9r0tb+uC6auU9wRNR+L5x8iI2a10zP+E5TUTL88xhEybhpMUnPfWb28
 D/jx7VuXPaXq7kaNZDqmjro1FyLEMpoY9ZM9NBIB6T5vUqg8t7ZyEWWnxUmcWYCJElwl
 wi5XP5m0fjwAWlgKt1TAmdTZG5JBMDnxhIT6AsCn07Nf3it/3rx8TzXkKLCQ5GPyfj1p
 Vejg==
X-Gm-Message-State: AOAM533nW2XLvEhBQbjRoEYryIGQnP6bMEByYwkUibbgB2V9Gw12zixA
 YvlXxX9hK6Jkp3h7u1872z2oThlos8o=
X-Google-Smtp-Source: ABdhPJwG0ruIrvDBUX0N5KwKDNj5fAcarRafFRT8Y5sq9niXCCoRfkgVAm6ZnFu8qeqEW3bd0bTjvQ==
X-Received: by 2002:a17:90a:cf:: with SMTP id v15mr1933321pjd.14.1595292892778; 
 Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u188sm18429358pfu.26.2020.07.20.17.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
Date: Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 17:51:57 PDT (-0700)
Subject: Re: [PATCH v3 1/2] riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64
 relocs
In-Reply-To: <20200714074044.10031-1-kernel@esmil.dk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernel@esmil.dk
Message-ID: <mhng-958787bd-3f34-43eb-b2fd-3eeb7ff325bd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_205456_879810_A4259092 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernel@esmil.dk, corbet@lwn.net, Bjorn Topel <bjorn.topel@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNCBKdWwgMjAyMCAwMDo0MDo0MyBQRFQgKC0wNzAwKSwga2VybmVsQGVzbWlsLmRr
IHdyb3RlOgo+IFRoZXNlIGFyZSBuZWVkZWQgZm9yIHRoZSBfX2p1bXBfdGFibGUgaW4gbW9kdWxl
cyB1c2luZwo+IHN0YXRpYyBrZXlzL2p1bXAtbGFiZWxzIHdpdGggdGhlIGxheW91dCBmcm9tCj4g
SEFWRV9BUkNIX0pVTVBfTEFCRUxfUkVMQVRJVkUgb24gNjRiaXQga2VybmVscy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4gUmV2aWV3
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KClRoZXNlIGFyZSBvbiBmb3It
bmV4dC4gIFRoYW5rcyEKCj4gLS0tCj4gVGVzdGVkIG9uIHRoZSBIaUZpdmUgVW5sZWFzaGVkIGJv
YXJkLgo+Cj4gTm8gY2hhbmdlcyBzaW5jZSB2Mi4KPgo+IFRoaXMgcGF0Y2ggaXMgbmV3IGluIHYy
LiBJdCBmaXhlcyBhbiBlcnJvciBsb2FkaW5nIG1vZHVsZXMKPiBjb250YWluaW5nIHN0YXRpYyBr
ZXlzIGZvdW5kIGJ5IEJqw7ZybiBUw7ZwZWwuCj4KPiAgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxl
LmMgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9tb2R1bGUuYwo+IGluZGV4IDcxOTEzNDJjNTRkYS4uMTA0ZmJhODg5Y2Y3IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvbW9kdWxlLmMKPiBAQCAtMjYzLDYgKzI2MywxMyBAQCBzdGF0aWMgaW50IGFwcGx5
X3JfcmlzY3ZfYWRkMzJfcmVsYShzdHJ1Y3QgbW9kdWxlICptZSwgdTMyICpsb2NhdGlvbiwKPiAg
CXJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBhcHBseV9yX3Jpc2N2X2FkZDY0X3JlbGEo
c3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCj4gKwkJCQkgICAgRWxmX0FkZHIgdikK
PiArewo+ICsJKih1NjQgKilsb2NhdGlvbiArPSAodTY0KXY7Cj4gKwlyZXR1cm4gMDsKPiArfQo+
ICsKPiAgc3RhdGljIGludCBhcHBseV9yX3Jpc2N2X3N1YjMyX3JlbGEoc3RydWN0IG1vZHVsZSAq
bWUsIHUzMiAqbG9jYXRpb24sCj4gIAkJCQkgICAgRWxmX0FkZHIgdikKPiAgewo+IEBAIC0yNzAs
NiArMjc3LDEzIEBAIHN0YXRpYyBpbnQgYXBwbHlfcl9yaXNjdl9zdWIzMl9yZWxhKHN0cnVjdCBt
b2R1bGUgKm1lLCB1MzIgKmxvY2F0aW9uLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMg
aW50IGFwcGx5X3JfcmlzY3Zfc3ViNjRfcmVsYShzdHJ1Y3QgbW9kdWxlICptZSwgdTMyICpsb2Nh
dGlvbiwKPiArCQkJCSAgICBFbGZfQWRkciB2KQo+ICt7Cj4gKwkqKHU2NCAqKWxvY2F0aW9uIC09
ICh1NjQpdjsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50ICgqcmVsb2NfaGFu
ZGxlcnNfcmVsYVtdKSAoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCj4gIAkJCQlF
bGZfQWRkciB2KSA9IHsKPiAgCVtSX1JJU0NWXzMyXQkJCT0gYXBwbHlfcl9yaXNjdl8zMl9yZWxh
LAo+IEBAIC0yOTAsNyArMzA0LDkgQEAgc3RhdGljIGludCAoKnJlbG9jX2hhbmRsZXJzX3JlbGFb
XSkgKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0aW9uLAo+ICAJW1JfUklTQ1ZfUkVMQVhd
CQkJPSBhcHBseV9yX3Jpc2N2X3JlbGF4X3JlbGEsCj4gIAlbUl9SSVNDVl9BTElHTl0JCQk9IGFw
cGx5X3JfcmlzY3ZfYWxpZ25fcmVsYSwKPiAgCVtSX1JJU0NWX0FERDMyXQkJCT0gYXBwbHlfcl9y
aXNjdl9hZGQzMl9yZWxhLAo+ICsJW1JfUklTQ1ZfQURENjRdCQkJPSBhcHBseV9yX3Jpc2N2X2Fk
ZDY0X3JlbGEsCj4gIAlbUl9SSVNDVl9TVUIzMl0JCQk9IGFwcGx5X3JfcmlzY3Zfc3ViMzJfcmVs
YSwKPiArCVtSX1JJU0NWX1NVQjY0XQkJCT0gYXBwbHlfcl9yaXNjdl9zdWI2NF9yZWxhLAo+ICB9
Owo+Cj4gIGludCBhcHBseV9yZWxvY2F0ZV9hZGQoRWxmX1NoZHIgKnNlY2hkcnMsIGNvbnN0IGNo
YXIgKnN0cnRhYiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
