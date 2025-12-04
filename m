Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF7D1D866
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 05:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1q2VpDL7sNalKbeyLeybWZNPySQMm07EM8Mx0pybSg=; b=huy3S+nXUGrvho
	iB3r4E1+4L3meaCmOoPwd7jYAWAIwrNPzL4vunIlOW5zc4g3U1oxdZksSP3pvJztdYoLCb+pGY0i1
	YiVjociymfQKwUEkoMsGTNCaP3UJhS71ddRcZCvbmN9UPOxJCJhTlDcBVXHMBI/WmNeBesgvpRYng
	4vo6AUnQ9lc7UyE5wlH7is+HJyes+tEHqQQVgOuIA84fe0Xl++oCwDwIq3Wj/hQ21/8W9ldynl54T
	S1eobTTksarNICXIEMZfmxfb6VN8uimlOc0j/wgDw07DbNZUJGoIssI7pTlmwNFFT/TK23FzP+gm/
	2HY66YSuoWEwnDF3avmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1tk-00000007V7a-3Gpn;
	Thu, 04 Dec 2025 05:29:00 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1ti-00000007V6b-1toc
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 05:28:59 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-657523b5db0so136121eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 21:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764826137; x=1765430937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGcGdJQ4d2lSMQGLwi6l+oRPZTLZMjA9uQc8WfswYHM=;
        b=YkGFFSQxDPTy6HF4xU6FU7hqAFjdRlDmdjxim6KAY+iDfz2jJsvE1eb1g5nwXsyV53
         QjpX+v3SCuDoQSbtuOjBtJPmCBmB4VhFHtb1edEK5kEuXWmbeVgqkzzY3JLWlK2DLUUx
         QdWnft95SWJO87d/VrL7yLOfCIFpR4DtSJcjnvhet/IqGCJIcQUsTMwdAm5gvsVewbTr
         XA3T4Fi7bmH/oNOLMpP4r8xP31z6sEEvtACCNs36BMEHS9OqLUBZchCcjesvHCRg3zqu
         RpnrMsn6QF3wTB6NmxNPMKSHmlXiNaoIaflaRCcYlt0cCbcYMVQQudjjF+/DpZwxQefp
         uBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764826137; x=1765430937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGcGdJQ4d2lSMQGLwi6l+oRPZTLZMjA9uQc8WfswYHM=;
        b=WJ6od2ISdqs+NU3VHEXTtnoqKwfGKSVac+Rvq3GIgWnMb6xLUvsv5B+npWTmaFwjbl
         jaKTiKQYuy4PKPRU8gd/e25w8QZZ6r+ybc7iRAu5wt7i+ZrHoubtPiM+ccdTTMbtX2mt
         iXU19wdGX0Q0C2OGipExLsPGONNRtxJFg36g5zAU+Q0ED/tLhPWlIVfvZnUkj+dKbFJj
         3ojUvCr2z6QY3tzzPKfG1+jgLFAMxpuwvGs4Bm+1cePZSOeGQAhf8YSYEC+/1rS7N18+
         WA/EXQaJYKj/8y6D4EUQLOaqd8IKJos3AMeSB8lR52umOhAzqqm21iV0qumbxPcqrhrp
         LEZw==
X-Forwarded-Encrypted: i=1; AJvYcCVCKEDyR8I0FN7uah/eWBegaZs7XLnwJCx+5m/xj7rPdqSgmJxjE6qmFceYlrIbPck/mn+8BfPG3zI6jA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2pmuL+5IJB9glFHEfQFNI9IJkqYc8tI3tQsVUIlZkNbymqAJ
	U7u4QEe/K2HOJ/uas00fUbHi2qI8aVlnyZmaMntCUWTuYm19LicF+5zceQAPHI/ooHE4z+Vkk0c
	GNzSpOZ533Cbi1BRnsUBrRk20ZJD2XZeCjFLr6S6iRx9D0cnVOX+X77QvyKHl
X-Gm-Gg: ASbGncsVBs0KNtw5K0CiTHOR63/DpFftA8zM+izdeOLbe8FNevwe+p/0F47Kq4e8ukw
	jdHrKg+ZG5+OCd1uogLJ8tAXY7eXIDKypeGCdo9O9lPrizWhJDwckliWbBOUAh4LI707PfgO+yC
	g+6g5nQnRaCBWuPM7bMBnR5lvkjDytdboGKdezPJpCiWWPEZX3hvx2xS4NY7NRQ6gWE/5nULEXC
	nSC+fK8vnlp6ZDs/7xFCY0Yogxr8bhl2lWGR6EOTYco2BrG/9BTVuTsLt7tVg0NAmRLeeAV8nk=
X-Google-Smtp-Source: AGHT+IHPXO4mJt6XFTl0jVeuamRWHb5DefXnFnY2jPbicVsNKKRdQsCgbNBsmbzVUe+uXweaiUokpDpWwGHff2RkRUM=
X-Received: by 2002:a05:6808:10d5:b0:450:44b9:68e0 with SMTP id
 5614622812f47-4536e3de274mr2882636b6e.11.1764826137356; Wed, 03 Dec 2025
 21:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
In-Reply-To: <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:28:45 +0800
X-Gm-Features: AWmQ_blKLNMUWj4oLV3fkP9gPW-qpOON3cyf_xYq6m6lr9r97yBqEg-AEwpXlh4
Message-ID: <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_212858_499690_572F5FCD 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFkaW0sCgpPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDEyOjA34oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0xMS0yN1QyMDo1
MzowMiswODowMCwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Ogo+ID4gVXNl
IE5NSSBpbnN0ZWFkIG9mIElQSSBmb3IgQ1BVIHN0b3AgaWYgUklTQy1WIFNTRSBOTUkgaXMgc3Vw
cG9ydGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPgo+ID4gLS0tCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNj
di9yaXNjdl9zc2Vfbm1pLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZV9ubWku
Ywo+ID4gQEAgLTU4LDYgKzU4LDcgQEAgc3RhdGljIGludCBsb2NhbF9ubWlfaGFuZGxlcih1MzIg
ZXZ0LCB2b2lkICphcmcsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gICAgICAgdHlwZSA9IGF0
b21pY19yZWFkKHRoaXNfY3B1X3B0cigmbG9jYWxfbm1pKSk7Cj4gPgo+ID4gICAgICAgTk1JX0hB
TkRMRShMT0NBTF9OTUlfQ1JBU0gsIGNwdV9jcmFzaF9zdG9wLCBjcHUsIHJlZ3MpOwo+ID4gKyAg
ICAgTk1JX0hBTkRMRShMT0NBTF9OTUlfU1RPUCwgY3B1X3N0b3ApOwo+Cj4gUGxlYXNlIGRvY3Vt
ZW50IHRoZSBpbnRlbmRlZCBwcmVlbXB0aW9uIGRlc2lnbiBmb3IgYWxsIFNTRSBldmVudHMsCj4g
YmVjYXVzZSBpdCB3aWxsIGJlIGEgbmlnaHRtYXJlIGlmIHdlIGZvcmdldCBzb21lIGFzc3VtcHRp
b25zIGluIHRoZQo+IGNvbWluZyB5ZWFycy4gIChUaGF0IGluY2x1ZGVzIHRoZSByZWxhdGl2ZSBw
cmlvcml0aWVzIG9mIFJBUy9QTVUvLi4uKQoKQWN0dWFsbHksIExPQ0FMX05NSV9DUkFTSCwgTE9D
QUxfTk1JX1NUT1AsIExPQ0FMX05NSV9CQUNLVFJBQ0UsCkxPQ0FMX05NSV9LR0RCLCAuLi4gYXJl
IGFsbCBpbXBsZW1lbnRlZCB2aWEgdGhlIHNpbmdsZSBTU0UgZXZlbnQKU0JJX1NTRV9FVkVOVF9M
T0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRC4gUGVyIHRoZSBTU0UgZGVzaWduLCBubwpwcmVlbXB0aW9u
IHdpbGwgb2NjdXIgYW1vbmcgQ1JBU0gsIFNUT1AsIEJBQ0tUUkFDRSwgYW5kIEtHREIgZXZlbnRz
LgoKPgo+IFRoYW5rcy4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
