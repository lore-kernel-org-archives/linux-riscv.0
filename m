Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C26CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn4n9rCbgGNFvqqA4sYMcckHC4zURZa4twUPISotkoM=; b=3zhUKIV32+dJGq
	9r5ybrlZQsLSv0Bjklgk6VsP/FRYGsUjJ2y4GYFyq47n+285pxLdvfElazz5+J/kXzsBkFVg7Q5yY
	pdn0EOx2ZQGHB8QP2Rk9jCP7xPu0thRuVY894Lb5F6PlrR4uT/ohMkjM9DH4+bV+Aq2sPSOKa0nyP
	2dQwvijxzuhy3dxRvd6J7KbCP7sq5cKirJqDHz++dxHGMCS8kTBU+8Q567FmY2Ecd8XZDIE23/HUp
	zcny2LPc9gWiz549KPHkji/pPqST8L8H9qT9rmHRjU2zIQ+yDRnur2gCynBnJNLnU9EDujCXBKyDE
	z1fQGcrma6/T624VqtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDSR-00000005MHl-0iLE;
	Mon, 15 Sep 2025 17:57:43 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDSP-00000005MGw-0pdd
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:57:42 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-336b88c5362so46100461fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757959058; x=1758563858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g5EqZH2g7Gd2bpnH6sjBqOWSmyCjDfXt5XJiq7SJuE=;
        b=4ZrkEyNzVPKq/CCladL0XhqhxATwtzftu7Dq9DvAGVS81atUUIjkyDxEGtEwuLaIXL
         pN2Kho+MPaPny4gAV1422wC5JHwO03qx2N29F1QQvhAKsNqtCvIwZjYKUT1a2dL4RmHt
         SQ96ipcBbjAwg6AVBJI/rIF0+ma/cYy7wlzwRd+LN5m3kYDjU9zSXoUmxqKxbIq6cwRK
         jZp5RGqkH3zav2UZj693kHif1O9KoHEpDke18KKZo/EmUTIhWFBneHWICWI8Td/5ja8Q
         9gG6CZnN4H6Fn8D/HhL2xistIhO1K860ZALiUfkP/kZqO3UF2U1civ1dSbx6Eg5sjQ8K
         nMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757959058; x=1758563858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4g5EqZH2g7Gd2bpnH6sjBqOWSmyCjDfXt5XJiq7SJuE=;
        b=wdlXGohLMhtMwJPGM+sxXFlLMhxAxjgcZasGG4HpDnBYjR+fdcm1ahExFcOCzsvXwo
         9cZz7WXxdODIMJ8n/gHa8hn2A2QNPDMkhAt8/Vc3NZXm9dktqhPIdabHkdfWQgsIOtRi
         A1IqFbsV+MgYMN9k8UgIfuye6WNx2+L93Mfgvc9refRTheMo0xxUbzwQriFDqWZCB4Z0
         vBRxw8ebA7AC95D34MXWP1QTLdObAapmlzDfmFqKMMTQ3EtcXjHVXObqTfV7EuBgdlI/
         S0iP+fPNBaTFz4f5ED6ayKjxo/2s1Bd0mRtq0EaZTQaUOVjsSMk3T/TGd0+aTIyUfNmR
         DLHA==
X-Forwarded-Encrypted: i=1; AJvYcCWlMxkFyosOnTyCS5TMYnM8oJhz45NNzN0SCRt2YebaXr0Uw+ODu8oo4bmHA21dllOO+QGFzzlat9ging==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd73OY82NoqCtJcdT0+I/La6CozII3I73sU1bPcxJz23GjXrYE
	ORGxt2E7E9D+p58d3WVB1cwVLajkFJ/4sCFk8NoNquNc/0dYmafooa/zf/shA1QIA86ElnnC8El
	0MggCvHRQwQeCxJfb6k/ANdpkGDkIjySJ329mou75Z1eh/GHZhl88qDsO
X-Gm-Gg: ASbGncutUaAHaWiQEAqmd2WSudF0T1mxJQuVSALCq7HfanKHP8xIjJgzxFtL1c6+C2I
	cRqx95UXpDZCqB/tvFy/C5SCU/8sjyFC4cJVuUOh034Zo3qenV1mVdDySWGXsGg8Vn5hoXsM0lI
	YdkVs1ZQuYAFNumgSwU0gnS2KIHRNrlKaM5LEmDs8kvcXJM5rm8d3wjR8Mp95GonJop/Q+b3QcH
	tzMGfMTa3pyfA==
X-Google-Smtp-Source: AGHT+IG7XuBOUF99pOsMzTEmuY+onO9zVaYoMU8lx7aRfbHGZI3ou7Ry7xA6KJQtNMG/3bvg8VLvzDwKkW7TyUfprHM=
X-Received: by 2002:a05:651c:2112:b0:336:80e3:b1aa with SMTP id
 38308e7fff4ca-35140ba5748mr38215271fa.40.1757959057855; Mon, 15 Sep 2025
 10:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com>
In-Reply-To: <20250724213130.3374922-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 15 Sep 2025 10:57:10 -0700
X-Gm-Features: Ac12FXz0ngQllsFkcY9Lb9qtH-WfMt8gI_Pux-WPgE-EKqIoqUpZI15M5XAT0NU
Message-ID: <CALzav=c0Wgcc60_dGJuYffS3f3vD9mpdSjFguaE00L1Zr-YcbA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Use $(SRCARCH) and share
 definition with top-level Makefile
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_105741_258240_5478C781 
X-CRM114-Status: GOOD (  11.38  )
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

T24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgMjozMeKAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgc3dpdGNoZXMgdGhlIEtWTSBzZWxm
dGVzdHMgTWFrZWZpbGUgdG8gdXNlICQoU1JDQVJDSCkKPiBpbnN0ZWFkIG9mICQoQVJDSCkgdG8g
Zml4IGEgYnVpbGQgaXNzdWUgd2hlbiBBUkNIPXg4Nl82NCBpcyBzcGVjaWZpZWQgb24KPiB0aGUg
Y29tbWFuZCBsaW5lLgo+Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI1MDQz
MDIyNDcyMC4xODgyMTQ1LTEtZG1hdGxhY2tAZ29vZ2xlLmNvbS8KPiAgLSBTcGxpdCBvdXQgdGhl
IHJldmVydCBvZiBjb21taXQgOWFmMDQ1MzlkNDc0ICgiS1ZNOiBzZWxmdGVzdHM6Cj4gICAgT3Zl
cnJpZGUgQVJDSCBmb3IgeDg2XzY0IGluc3RlYWQgb2YgdXNpbmcgQVJDSF9ESVIiKSBmcm9tIHRo
ZSByZW5hbWUKPiAgICB0byBTUkNBUkNICj4KPiBEYXZpZCBNYXRsYWNrICgyKToKPiAgIFJldmVy
dCAiS1ZNOiBzZWxmdGVzdHM6IE92ZXJyaWRlIEFSQ0ggZm9yIHg4Nl82NCBpbnN0ZWFkIG9mIHVz
aW5nCj4gICAgIEFSQ0hfRElSIgo+ICAgS1ZNOiBzZWxmdGVzdHM6IFJlbmFtZSAkKEFSQ0hfRElS
KSB0byAkKFNSQ0FSQ0gpCgpHZW50bGUgcGluZy4gUGFvbG8gYW5kIFNlYW4gZG8geW91IHRoaW5r
IHRoaXMgY291bGQgZ2V0IG1lcmdlZAp1cHN0cmVhbSBhdCBzb21lIHBvaW50PwoKR29vZ2xlJ3Mg
a2VybmVsIGJ1aWxkIHRvb2xzIHVuY29uZGl0aW9uYWxseSBzZXQgQVJDSD14ODZfNjQgd2hlbgpi
dWlsZGluZyBzZWxmdGVzdHMsIHdoaWNoIGNhdXNlcyB0aGUgS1ZNIHNlbGZ0ZXN0cyB0byBmYWls
IHRvIGJ1aWxkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
