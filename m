Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6FDC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0RQrM59W6j0auDVtyWhlnuNr1PjDEFMp9agxEYBG6g=; b=leCp8lZYVQXkp+
	s1vs4XEOPQvas2Fxi6jAe/yk9OhuHVpIbjam+buKnffBBsfSbAg2LVu7AuvfTsUZOkQIHGmMWAZFj
	4l64MO8+EY4cDiXHn46Pg30fCOA9l1Vkq0xQJdEkb3aa+4ji4gSMGPvg0KWblbE8Bb+aTQq4RO90Z
	Pa1QizKyjKBhCF0weXw47CWNLkTea0Bh9e0c1PT1gzjmhqMM0gowykmECYPQ63Owv18dhwen54ALu
	gl4cG34FjldQdUDUvNzyHJGJT3ch2RQbJuhKjasgg66xaBSjsRjE3wfym4aVgnUaF7IPwRfho4F/i
	iqCUPUlz8eQQcejiOHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQmC-0000000AWyM-0CRM;
	Thu, 17 Jul 2025 15:44:04 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQGk-0000000ATvs-3jt5
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:11:36 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ab81d016c8so16019081cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765094; x=1753369894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=QUhMCCbx+/ddloNpJ+X2eBos84hSmqMWRL1XgxWnff28LRXONAazCSmt1PcUYNmoo3
         tnTHMfixJp1YbV6W4Nmxgsyw96mutsJWrFiOkXrGKt99nSp58i+FR/OZ0C/iDT2uQjfe
         mA08e0WqaS7WQJVludntvMm7lP9Ovoi65DA7rnfMMfzHAz0H6Ul8CxXnZoGOrDN/qFXO
         3TtZ+eaWO0e2/6G31yjEQaokfyQ82J94T1UV39pJUB0vrZPOxaOvYB2nr82CgCJwsZV9
         WXUp8+7CFOiKFOJ7Jrio2o1PfGkvjP8+NW6gCD0a3B68Agpnfc94cQVqxY5DLjvL5bux
         GxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765094; x=1753369894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=CtAI4gLUg/IjlAQpoofVevrF9N+QeTOWy8nGn4mSMtq6k9lRPFeCaeiaK40Y1pXdTs
         rmlm+QmaZMwikieWXHNvOU6FSxKBIsM6lbtrWMVnsrTgmNWzoWOFJlM2faFkFVm3Uav0
         QnVZkKdQ4bXpe4BvOYuzPEwcOJdeURP6qPTsRp4DJujWzp3+h7s0lYzZto8c8ooHPJig
         mvJL/kuXHf+OojsxyOcjH3FUIVfQDVJMHlO8A1FfK+6sGvduA/ibSzh4ii82RXtyklQj
         49htSl3XuUoSfBBL72/gHZTM/Ddyt7aAqP0udQEtBWrjdpTtX8FvZS74CS7adXQImCdo
         NmDA==
X-Forwarded-Encrypted: i=1; AJvYcCX4thYfyQaLL+f+Ey+gxRfWxUZWJQfNyIH4pEJZ4A4rMnNiRPCYgy6kpsS0d2wmMFCWNIQL/N33kylMmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt2Gf/2AheaAay3uaTRqb+28x0+Mtm/kJmGGiVVx0HMllzpW+y
	AP3mK2YLNU6hU9nDz7FLkpWHZ9pzt3dErSdVARWrfQizNHLFXo1H6KQS1+M4OUiG8yBiVzObQlz
	ODv+wAv//57NAyBBGKp8BlaYEM2iVMw/8nqGrkSxBww==
X-Gm-Gg: ASbGncv02GqVbiDIZoVBTQAUVKjSLYd/wguTSc/eazo69nu1Yn91TtV3kAZfQJQcQAx
	qQLrTCSZvNHeDsy0deI6zl/fuI8zvSrauJRnI8RHTHmeB3euB5m17HDtv0wR8xAkubwG8rriWp2
	uOy80RUaHpueCPYUHG0xXCoZR3BtjaUOT0Wmhh6c3/+c4fFCRH9ngAbpXG6hZEClOgiifX5TyAM
	SnQLrII
X-Google-Smtp-Source: AGHT+IHaFJ1sfqQyWiG9DiWncsz3p3oF6sF6SWaO0rxigj/urXDCJiahMXJIk9SDxHRXku+eh2bgCplK2qeaMk0aX54=
X-Received: by 2002:a05:620a:28c6:b0:7e2:77d0:f33d with SMTP id
 af79cd13be357-7e34356b8admr1012854085a.14.1752765092470; Thu, 17 Jul 2025
 08:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:41:21 +0530
X-Gm-Features: Ac12FXzdth30OveMxtaGx1W5ZBrjzTJj5_mIPZDmwmxiXuGuVRtL8fMgmMv9bXQ
Message-ID: <CAAhSdy1LVhWUovNLwfv2Y2eOzjewM005+gUENFDg-gqUaBuBgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drivers/perf: riscv: Add SBI v3.0 flag
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081134_923427_2E09BD50 
X-CRM114-Status: GOOD (  15.09  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBhcmUgbmV3IFBNVSByZWxhdGVkIGZlYXR1cmVz
IGludHJvZHVjZWQgaW4gU0JJIHYzLjAuCj4gMS4gUmF3IEV2ZW50IHYyIHdoaWNoIGFsbG93cyBt
aHBtZXZlbnRYIHZhbHVlIHRvIGJlIDU2IGJpdCB3aWRlLgo+IDIuIEdldCBFdmVudCBpbmZvIGZ1
bmN0aW9uIHRvIGRvIGEgYnVsayBxdWVyeSBhdCBvbmUgc2hvdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBpbmRleCA2OThkZThkZGY4OTUu
LmNmZDY5NDZmY2E0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
Cj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IEBAIC02Myw2ICs2Myw3IEBA
IFBNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZpZzowLTQ3Iik7Cj4gIFBNVV9GT1JNQVRfQVRU
UihmaXJtd2FyZSwgImNvbmZpZzo2Mi02MyIpOwo+Cj4gIHN0YXRpYyBib29sIHNiaV92Ml9hdmFp
bGFibGU7Cj4gK3N0YXRpYyBib29sIHNiaV92M19hdmFpbGFibGU7Cj4gIHN0YXRpYyBERUZJTkVf
U1RBVElDX0tFWV9GQUxTRShzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSk7Cj4gICNkZWZpbmUg
c2JpX3BtdV9zbmFwc2hvdF9hdmFpbGFibGUoKSBcCj4gICAgICAgICBzdGF0aWNfYnJhbmNoX3Vu
bGlrZWx5KCZzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSkKPiBAQCAtMTQ1Miw2ICsxNDUzLDkg
QEAgc3RhdGljIGludCBfX2luaXQgcG11X3NiaV9kZXZpbml0KHZvaWQpCj4gICAgICAgICBpZiAo
c2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkKPiAgICAgICAgICAgICAg
ICAgc2JpX3YyX2F2YWlsYWJsZSA9IHRydWU7Cj4KPiArICAgICAgIGlmIChzYmlfc3BlY192ZXJz
aW9uID49IHNiaV9ta192ZXJzaW9uKDMsIDApKQo+ICsgICAgICAgICAgICAgICBzYmlfdjNfYXZh
aWxhYmxlID0gdHJ1ZTsKPiArCj4gICAgICAgICByZXQgPSBjcHVocF9zZXR1cF9zdGF0ZV9tdWx0
aShDUFVIUF9BUF9QRVJGX1JJU0NWX1NUQVJUSU5HLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInBlcmYvcmlzY3YvcG11OnN0YXJ0aW5nIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtdV9zYmlfc3RhcnRpbmdfY3B1LCBwbXVfc2JpX2R5
aW5nX2NwdSk7Cj4KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
