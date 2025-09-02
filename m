Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71021CA1009
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuARkrPlWBIMoA85seFbMZRwFuSlP5SPM9USX4rRSlQ=; b=oDG1xltFSqpCEw
	al/k4J59DpYBNyMxYGydET8nQ6mDlFLNQe92rOuhaKcHtD9lV3oVIiYkMjPKnj7XGa9b6MpgvAXxe
	PbEN4iOu0AmFL04QbWM/ciNldECDLeCWmh880C8q7vMheAi5NOGsx2ZLzMJCpepIQoveFadx9XQbC
	xgTRW9m0wHX3BNCEbIWcywnFYOpcxlWdkfvTmcxxuvtpZvh5RI5ZTJ6ERSOlwG5deKAF1GOmf2Yy0
	FKk0HGmby/8MJTPa8jyMi9TnXXoF96FSimiEKlz740Gi8QGArU0aGm8BVPBvVU93iDOqnn4SOTV7A
	Iqvp0QG5ElC1VYf9nnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYo3-00000002DB4-25m8;
	Tue, 02 Sep 2025 21:44:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUQV-000000016Ga-31Ym
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 17:04:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7724cacc32bso2127162b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756832649; x=1757437449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7Rb+Gc4bzsX0WrGoFt7okZVsdi4ux/eNHzNp2DsalU=;
        b=Hy4q1AaJGVtZC2x9ORqm5TsiEg2Z4rR5q5trOwuc5tz1rY7bM7QNGS1cr27w4m06mg
         7FDxK+Xlkh0j/bACNlIjz/AMsy9qC5OmOX2LxJxu/1a+h51k/j/6X53cHIODAsBZlU/p
         3VjyiYYLjDxB37ZvY4mAz+2/5/vvwvXFrl3I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832649; x=1757437449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7Rb+Gc4bzsX0WrGoFt7okZVsdi4ux/eNHzNp2DsalU=;
        b=nTHnPf4vXUu6YSV+CmaPtEeU5lDp9fSOkMiJEiz8qOIDBjvpJQlp1FVxkXhlfLAb27
         pSUCUttypsP+xDAZNG/lkEVkSbsP5Hb7MZrEwnswZcLIIRCRAxFnaPBvIyNgEhNPbg0/
         D0PqcPtq3haKMC91kqC8MW5tZ6csnHNtXLpdx78c0wIhN3ziNfDXd2Tb70c8tznXeAvU
         uhB2n668B010s7fp0cq0X4DLeCjkP8JKeHR4h3ffPoabu+0TihaofYRjklBAS671fHgL
         Fp2WDiYgxhCoVhX9yP4HNfB0ckKFFs56MReW6CUwwSj1IRLvCo0h8AG7ZkGetf7LP9kQ
         BoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu4yDDojackD6+H/ms360lEntFjxJ+8ijI+HQg2GnspEkFIH0Qpd0X2b+KgWb4vKvpmM8Qgzbo2fT9bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAy7zceBBwSW7Z7lOACtRgCUEGyHYVqRskdQiPfYp5m2Siygrz
	3kJIeD/pWOikNnw265epqOYXLhKzOf9/KmEOOurmE9zPKEsq/6ogdmiNT6eqdtCGcWEVsrL0cJs
	JMcs=
X-Gm-Gg: ASbGnctLpew3paXHvHLnwXIuFLIDAuGK09Un815RJh9o2A3U7Nn0wDNvtFNRBgAEQ+Z
	ORYlCYMINFDi0BDlZrowBf9VxCt31L+kFwkuLdSuiJXbMEh/oz4x5pJq1o6mTOADLJCxXkATdD7
	MQH3ZQdRMKy9XE8QlM10gLSMok5Veyzr3i+uImq4/mcRuI8hz3E0ULkW3MaxsmIyXrLMnqhBC8V
	1vUJ5emotKM6iFw9CJNZezXeomFycb1y7CF/963H5/G2DQKiOSpqKBikCTsKyxoMCwe07Y0C/f0
	cJZypZrZJqIsA9PK0994HVbgtH0IqBR9DLvtQQBFMSQ1gHJc8HdybruCQI9V5aqNyvC2KPXC80m
	IS/Uu83G+UgvcF48hh7/3gxB1NXl86Obxg7KjPNrniirWovWFUlc39BmH/x1gFWRO5Q==
X-Google-Smtp-Source: AGHT+IFcVJjaNyDi2EUcpUQXWYM1A59y8Jcl8DKUJ3NZjRauTpRn4LIjQtr2Z5Lnh95tdmDRODySOQ==
X-Received: by 2002:a17:902:ecc6:b0:249:338d:b002 with SMTP id d9443c01a7336-24944873458mr168165665ad.2.1756832649471;
        Tue, 02 Sep 2025 10:04:09 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065899f3sm134914145ad.113.2025.09.02.10.04.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 10:04:07 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso4725616b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 10:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/fx6ChvfHT5t/6+0XJOlBRlxexaj+r/n+c2dQi0fAvq5i8l8cJryeYTMas93b78zqIqwgcfPKhkSacg==@lists.infradead.org
X-Received: by 2002:a17:903:384b:b0:240:84b:a11a with SMTP id
 d9443c01a7336-249448f24abmr161721465ad.17.1756832646700; Tue, 02 Sep 2025
 10:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Sep 2025 10:03:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
X-Gm-Features: Ac12FXykSrYm05H2zP7oRG7JrK-8ugSYBV29nSAU-8Tvd7BMAeSBbf3oz6aTBn8
Message-ID: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_100411_787017_58C73DD5 
X-CRM114-Status: GOOD (  21.09  )
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

SGksCgpPbiBTdW4sIEF1ZyAzMSwgMjAyNSBhdCAxMDo1N+KAr1BNIHl1bmh1aSBjdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIERvdWcsCj4KPiBPbiBTYXQsIEF1ZyAz
MCwgMjAyNSBhdCA1OjM04oCvQU0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
PiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiBXZWQsIEF1ZyAyNywgMjAyNSBhdCAzOjEw
4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBNb3ZlIHdhdGNoZG9nX2hsZC5jIHRvIGtlcm5lbC8sIGFuZCByZW5hbWUgYXJtX3BtdV9p
cnFfaXNfbm1pKCkKPiA+ID4gdG8gYXJjaF9wbXVfaXJxX2lzX25taSgpIGZvciBjcm9zcy1hcmNo
IHJldXNhYmlsaXR5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL2FybTY0L2tlcm5lbC9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICB8IDEgLQo+ID4gPiAgZHJpdmVycy9wZXJmL2FybV9w
bXUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ICBpbmNsdWRlL2xpbnV4L25t
aS5oICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ID4gPiAgaW5jbHVkZS9saW51eC9w
ZXJmL2FybV9wbXUuaCAgICAgICAgICAgICAgICAgfCAyIC0tCj4gPiA+ICBrZXJuZWwvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIHthcmNoL2FybTY0
L2tlcm5lbCA9PiBrZXJuZWx9L3dhdGNoZG9nX2hsZC5jIHwgOCArKysrKystLQo+ID4gPiAgNiBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+ICByZW5h
bWUge2FyY2gvYXJtNjQva2VybmVsID0+IGtlcm5lbH0vd2F0Y2hkb2dfaGxkLmMgKDk3JSkKPiA+
Cj4gPiBJJ20gbm90IGEgaHVnZSBmYW4gb2YgdGhlIHBlcmYgaGFyZGxvY2t1cCBkZXRlY3RvciBh
bmQgSU1PIHdlIHNob3VsZAo+ID4gbWF5YmUganVzdCBkZWxldGUgaXQuIFRodXMgc3ByZWFkaW5n
IGl0IHRvIHN1cHBvcnQgYSBuZXcgYXJjaGl0ZWN0dXJlCj4gPiBpc24ndCBteSBmYXZvcml0ZSB0
aGluZyB0byBkby4gQ2FuJ3QgeW91IHVzZSB0aGUgYnVkZHkgaGFyZGxvY2t1cAo+ID4gZGV0ZWN0
b3I/Cj4KPiBXaHkgaXMgdGhlcmUgYSBwbGFuIHRvIHJlbW92ZSBDT05GSUdfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9QRVJGPyBDb3VsZAo+IHlvdSBleHBsYWluIHRoZSBzcGVjaWZpYyByZWFzb25zPyBJ
cyB0aGUgY29tbXVuaXR5J3MgZnV0dXJlIHBsYW4gdG8KPiBmYXZvciBDT05GSUdfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9CVUREWT8KCkkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGFueSBjb25jcmV0ZSBw
bGFucywgYnV0IHRoZXJlIHdhcyBzb21lIGRpc2N1c3Npb24gaGVyZToKCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9DQUQ9RlY9V1dVaUNpNmJaQ3NfZ3NlRnBERFdOa3VKTW9MNlhDZnRFbzZX
N3E2alJDa2dAbWFpbC5nbWFpbC5jb20vCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
