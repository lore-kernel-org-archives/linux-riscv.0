Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B6ACCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/E+ZoIYsRobRnuf78NqHhvRP+dpvGHwX3l32vKGAek=; b=uRX7wUHB9JTmFT
	9V/htW1ZuX3Vq4BGM4yzS6uU3GoxJg9whyUibCMU0cD9g9mVJeP/D8AS769YMzVAVeNKBBLtounvE
	jGj6pJ/P5eNg1b8JibEnZ5SrvMK+I+NmDUBJxXUDrIEtQPRCv0Uc2jTJ42tmv8/AbvuBxcOmaGOtF
	vne+/5k72e/KNiLdyGmsmL1JAJwTvFOuW2wsJrwWo4dMasc9gdDdzQwS+Z8/zGVjuXjX1hkYUTkho
	UdRRd4UG2EjOQqw+JrdgAoN2zwbyYJ43V0ukRNOnGextUn8fhnXrEV5h/Qh0XGMjZ9kjoP/j+inwr
	8yG0B74iZtscr+NzLYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfWy-00000002zyn-15mN;
	Sat, 08 Nov 2025 09:46:48 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfWv-00000002zxc-2pkJ
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 09:46:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso235350166b.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762595203; x=1763200003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=LRS+PxKbcx0I22zb3AfN74ZKRzMe4oTb2F18PLq0KCERv84G0wTJ03wfIIvq4GhgGZ
         m7hpvPq1hv5kvcd5SNLeSPxEPWz19oPNEqC39O/8BFeHK/pVznymHd3eX7foUjVQrBlO
         1CIZEzv6rwiMgIFqCSrC91KFrLfrPao/BadQuxzNxzHv6cktrwiAaSORIAp3e/LL65a3
         DiGy2S84HuYttKrHFFKfv+mQ9JM3Mu566jvAf+gVvc+loHxcRan6O89mZvuaWeu1H09P
         i9m+BqEcH1x+V2XHHAILHrHQUPHv1MLTnEpmEvW5afbnIorzobdl9mT+KWQevO/e5o+n
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762595203; x=1763200003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=Sfs0T6dIwgIL7JHeaplioceZX+F+5TNTCHIvrtxjsPO874tyrSqEeMYWAEl0GX3BZ5
         Wwoc6z0aWtElHBjqaYYPFk90J4gMPD5k+6HlGnwhm2TA/dMyuwQECdtkuD5YSDqTn7dc
         PXDvgbm51roXfIDH0bhsgD6Vy6z3okZy2jcpbRl06XOgiJ9MtZTJnwhsg1rLkLj9sfPQ
         xTucTpGnyeaWT5Q0h5XqGybwx/DsLQPuWd3TvWyupf/ZxNp2K6Fs5EuvSNEZgSdQnBxU
         78X5YrXXlt5jIrFYbcihXKzJVRWaREKO3uASJ4Q6bEdbym63gQtEDbAZTEOiSfjJ45YK
         F49A==
X-Gm-Message-State: AOJu0YwbGx16bW6Zck3DxHA90n/0+QX7JRaQJucHZYRFAMmHIncwQQmw
	8y/Fko7YNneoS84I0EEdy9nyg+YqT9YIy0vtKb5mMtgfiqXoVxTF4QUG
X-Gm-Gg: ASbGncuTpRu9mrQezpphE/evTw+V81OmYIrvImxRlr3XPLz9L+wx9Oennh/j/PFJ960
	2nMBCOG9rttbj+5ZDA//4B8IqM/WcXhpgrATUc0nlxMzgu2VxtSOWGOfMLAJn53EwL+nc+saebS
	Hh9nZTn4kqT8d9+xtQ98ebhJpdMGRqp0doQvRvt5tqsyItSnRzIBCy6QZ9ATjFHWpw9w7jAI113
	2Qq6FZAeecYqoWyS2uLS6vNqqfwttWM9iMFhJPGgr9XWQ3Ba0WTw4P7TToXNATCrnVVbYMoYktK
	EseG67PCpw9zGcTdIXAa3UY6LeJSHDOXxGsmVrmOtYOQ8vMORUt8xgP4AfXHsAb18uqxgmntiD7
	QbEJg83PXP7vzYFMrhDtbX0hfJPOahtwvbqOB90VXgmqj7ySWpzVF5ia6cR0wKgTNmdYHRvv7Wn
	Tdul3UYtGIa77D+4GPlMyJQw==
X-Google-Smtp-Source: AGHT+IEF4CkxscNYi/C2XNylHCh280mub3VhXy2YsQtWnD+IOuCk3xiDthoT6Cd2QfMZg0xUKQ0czw==
X-Received: by 2002:a17:906:6a27:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b72e028a602mr227544366b.3.1762595203327;
        Sat, 08 Nov 2025 01:46:43 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72d7996c4csm291514066b.5.2025.11.08.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 01:46:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Han Gao <gaohan@iscas.ac.cn>,
 Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Guodong Xu <guodong@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>, gaohan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/3] riscv: soc: re-organized allwinner
Date: Sat, 08 Nov 2025 10:46:41 +0100
Message-ID: <4692596.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <cover.1762588494.git.gaohan@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_014645_734371_E8DAFEB8 
X-CRM114-Status: UNSURE (   9.53  )
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

SGksCgpEbmUgc29ib3RhLCA4LiBub3ZlbWJlciAyMDI1IG9iIDA5OjIwOjIyIFNyZWRuamVldnJv
cHNraSBzdGFuZGFyZG5pIMSNYXMgamUgZ2FvaGFuQGlzY2FzLmFjLmNuIG5hcGlzYWwoYSk6Cj4g
RnJvbTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IAo+IEFsbHdpbm5lciBjdXJyZW50
bHkgb2ZmZXJzIGQxKHMpL3Y4MjEvdjg2MS92ODgxIG9uIFJJU0MtViwKPiB1c2luZyBkaWZmZXJl
bnQgSVBzLgo+IAo+IGQxKHMpOiBYdWFudGllIEM5MDYKPiB2ODIxOiBBbmRlcyBBMjcgKyBYdWFu
VGllIEU5MDcKPiB2ODYxL3Y4ODE6IFh1YW5UaWUgQzkwNwo+IAo+IEhhbiBHYW8gKDMpOgo+ICAg
cmlzY3Y6IHNvYzogcmUtb3JnYW5pemVkIGFsbHdpbm5lciBtZW51Cj4gICByaXNjdjogc29jOiBh
bGx3aW5uZXI6IGQxOiB1c2UgdGhlIEFSQ0hfU1VOWElfWFVBTlRJRQo+ICAgcmlzY3Y6IGRlZmNv
bmZpZzogZW5hYmxlIFNVTlhJX1hVQU5USUUgYW5kIFNVTlhJX0FOREVTCgpUaGlzIHNlcmllcyBp
cyBpbmNvbXBsZXRlLiBJdCBpbnRyb2R1Y2VzIEFSQ0hfU1VOWElfQU5ERVMgc3ltYm9sIGJ1dCBp
dCBpcwpuZXZlciB1c2VkLgoKQWRkaXRpb25hbGx5LCBwYXRjaGVzIGFyZSBub3Qgb3JnYW5pemVk
IHByb3Blcmx5LiBGaXJzdCwgeW91IHNob3VsZCBpbnRyb2R1Y2UKcmVvcmdhbml6YXRpb24gYW5k
IG9ubHkgdGhlbiBpbnRyb2R1Y2UgbmV3IGZlYXR1cmVzLiBBbHNvLCBub3QgYSBzaW5nbGUKcGF0
Y2ggc2hvdWxkIGJyZWFrIGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkgZm9yIGJpc2VjdGFiaWxpdHkg
cmVhc29ucy4gRmlyc3QKcGF0Y2ggYnJlYWtzIGNvbXBpbGF0aW9uIG9mIERUIGZpbGVzIHdoaWxl
IHNlY29uZCByZXN0b3JlcyB0aGF0LiBUaGlzIG11c3QKbm90IGhhcHBlbi4KCkJlc3QgcmVnYXJk
cywKSmVybmVqCgo+IAo+ICBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyAgICAgICAgICAgICAgICB8
IDIyICsrKysrKysrKysrKysrKysrLS0tLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5u
ZXIvTWFrZWZpbGUgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2NvbmZp
Z3MvZGVmY29uZmlnICAgICAgICAgICB8ICAyICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
