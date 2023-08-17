Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1ACEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBZQNNpAvN2yfBoRZqymgTuv6srxalVkQ9HSJ1uBc/E=; b=tkx6gCBafNb8Kz
	PNLT6JI0BM3SsSFJ72IBYmvuc256IMKgkGXUlI4GBnQHNvHdS1B4kp/XQr1SeR+hPBWQybKG2eqis
	HTW24nxYdM5xcqjmUBYw6w3a0jiEjyAwI8jpBbkv/UGUHG1q35afyIAoMwU2YfPqcLrqiv5yzWokt
	b/jMwzAKhz6ZQRots9lahh5/4OoeQR93hB7s0GQGPi51V/rgTUy5bWbYygd5jcH2KEBBDkE7KnFbL
	HrDKifzUGSITLZJDxcsoW1jvonOICgY5EjZ14GYwgaOQXrXFjuj1XvE+bzRcTcx/j4P3yF1HyX2Mf
	PCrYq5qEEtHm7rcw7uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYIo-005oXE-0N;
	Thu, 17 Aug 2023 08:24:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYIl-005oW9-0N
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 08:24:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so39537205e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692260651; x=1692865451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHsD7c/QF0ePInwcDmMHhFZY69gdO9z9rXTXoYzHVCI=;
        b=lr8w5VkvPcCfBoy7LCTlpwGmQxof97HkBqgFQZftmfiHg9+MhTl08oNkvUSah2azdy
         fzJXUBjFT8E7v671+gCUEZqr2SnUvo7tyK2aWBWnyndbQDa2MqJqJI4oxWRgGBxmEgJ5
         I28APSwnQk/wmB0t/it8mOksGxuf1A0LSo95Yjh93AGhIwZhdKeBltOgahyd8STe1d5Z
         7ZzCIDCPdn85Pzyy+S+XcCpRLyDs87vko57ZSQAT6Ophj4yjZmFzg5QmXXFdOsCe+KGm
         9PuYnPDFNsAGYAQu3ONdzyZ3mBK7F6SnNSKmWhYoF+2lxwYBbDEWip7gWtjqF+ELCeRE
         r1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692260651; x=1692865451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHsD7c/QF0ePInwcDmMHhFZY69gdO9z9rXTXoYzHVCI=;
        b=fG9W7/iFQzg2IbJBsaIbG67jRf6tWCryoi+q9O9OblcimHdyJABPaSGXRf0Bd8XtVQ
         t9a3S73zXZi4fV4ZSHGHSBrFihH/xsQh8UKsrEnaG8mleepRD/8Uv+/OuCvlmrTcSr83
         IPd3ISGVkhvhEjQxDwiBy5UsgysYPB9zCqu2RReQYGGmqP4CEN0OCiZ37TnB3o/zz1If
         BtE0m2agE4A0IsJLOBXNfnZR+U156Cy2/MWv+25HbmMpPtOr357Zrl/5VYIqZ9uy3iVD
         LO6U+amAYzoWvZtekszFa5rJt76cBFTfzJUDUuCs3ey13hajhkoSglSA1d4SR+XgFGx3
         LYAQ==
X-Gm-Message-State: AOJu0Ywubu+r8N0v8q1SL4fcBN2/g3RIMyUzgccSBS7Dr8dog0RePVRY
	5KJdtPKOiBGl2q2pxhN84Cw23f0e9ywprcP3ts1EGg==
X-Google-Smtp-Source: AGHT+IFSX3sJrVRBaVxg8X+3Xw+j2/M3SsmQbpjPaHp7usUDL4glZ/nHbwzfEferrc1Arhz3/d/+MZUDg1FpNnLEnm4=
X-Received: by 2002:adf:e7c4:0:b0:317:f70b:3156 with SMTP id
 e4-20020adfe7c4000000b00317f70b3156mr3131091wrn.28.1692260650973; Thu, 17 Aug
 2023 01:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230329082950.726-1-cuiyunhui@bytedance.com> <87v8dfqays.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v8dfqays.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 17 Aug 2023 16:23:59 +0800
Message-ID: <CAEEQ3w=MgH82+BMpwmUHnUevMJsJUqgeBRWSZnU_iizMLK37UQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] riscv: Dump user opcode bytes on fatal faults
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: conor.dooley@microchip.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, peterz@infradead.org, mpe@ellerman.id.au, 
	jpoimboe@kernel.org, mark.rutland@arm.com, svens@linux.ibm.com, 
	guoren@kernel.org, jszhang@kernel.org, ebiederm@xmission.com, 
	bjorn@rivosinc.com, heiko@sntech.de, xianting.tian@linux.alibaba.com, 
	mnissler@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_012419_157338_7DFA4F22 
X-CRM114-Status: GOOD (  11.52  )
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

SGkgQmrDtnJuLAoKT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMTE6MTHigK9QTSBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIFl1bmh1aSwKPgo+IFdha2luZyB1
cCB0aGUgZGVhZCEgOy0pCj4KCj4KPiBYODYncyBzaG93X29wY29kZXMoKSBpcyB1c2VkIGJvdGgg
Zm9yIGtlcm5lbCBvb3BzOmVzLCBhbmQgdXNlcmxhbmQKPiB1bmhhbmRsZWQgc2lnbmFscy4gT24g
UklTQy1WIHRoZXJlJ3MgZHVtcF9rZXJuZWxfaW5zdHIoKSBhZGRlZCBpbiBjb21taXQKPiBlYjE2
NWJmYThlYWYgKCJyaXNjdjogQWRkIGluc3RydWN0aW9uIGR1bXAgdG8gUklTQy1WIHNwbGF0cyIp
Lgo+Cj4gV2R5dCBhYm91dCByZXdvcmtpbmcgdGhhdCBmdW5jdGlvbiwgc28gdGhhdCBpdCB3b3Jr
cyBmb3IgdXNlcmxhbmQgZXBjIGFzCj4gd2VsbD8gSSB0aGluayBpdCdzIHVzZWZ1bCB0byBoYXZl
IHRoZSBzdXJyb3VuZGluZyBpbnN0cnVjdGlvbiBjb250ZXh0LAo+IGFuZCBub3QganVzdCBvbiBp
bnN0cnVjdGlvbi4KCk9rYXksICBCYXNlZCBvbiB5b3VyIHN1Z2dlc3Rpb24sIEknbSBnb2luZyB0
byByZW5hbWUgZHVtcF9rZXJuZWxfaW5zdHIKdG8gZHVtcF9pbnN0ci4gTGlrZToKc3RhdGljIHZv
aWQgZHVtcF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQp7
Ci4uLgogICAgICAgICAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkKICAgICAgICAgICAgICAg
ICAgICAgICAgYmFkID0gZ2V0X3VzZXJfbm9mYXVsdCh2YWwsICZpbnNuc1tpXSk7CiAgICAgICAg
ICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICAgICAgICAgIGJhZCA9IGdldF9rZXJuZWxfbm9m
YXVsdCh2YWwsICZpbnNuc1tpXSk7Ci4uLgp9CgpXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcywK
WXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
