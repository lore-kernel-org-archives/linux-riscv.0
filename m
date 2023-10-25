Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC6EC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcQbyaOUBQew2ZzOTrFkM1R++oGESRqJdaCYLRa9kc4=; b=Y14xbqlccxbbYx
	0jDuPD3stwjTP2zUU6TUTYQI2hXV4i8YJwCvnp/YYG9othQiv5V6hZ9fwpJH2qicans4T56SIv1xP
	C1GJ3t6mri9f6q3H+VDtsDKisw9Y208sBM8yew/SJIbmAuJ8+4H7W35BlyV8sZhZVziiWQEY4aKCC
	6WiHbMgFM+xrTEE0v1r/slO+0Rw5qEBVgZS2DFR7iv/TIOoWn2mBHSApkB8mpBD7Z5KhrOdwPhU4F
	xKjN0StRgaGdxG0okyCd2qpp8kSZ8nDWdWUbfogaTIFOogjeL3Llx5gGaQnOk6tzIKIn8nzw+Tc18
	dUZpDRS3kyXwPglNqt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvevB-00CWgH-2J;
	Wed, 25 Oct 2023 14:31:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvev8-00CWeo-1e
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:31:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cace3e142eso38564135ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698244299; x=1698849099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ5KMjXB468aEBKF9WSiVgBHVpR3dfOc9lss4H+jYhs=;
        b=VfT+u7FidsDWO611jSPP6bgFCcw8JkMloRC5wbOpzZXSOFVfR9sPy7DXj8/3TElADp
         vDguXbVAH+TGhgREMVy+E8adRTAKc+dzVOUPHlBZ1jRO6GscO5fxDQH8hy/TxTd8NAkx
         hzCsyB8GIylnz0fwsnh52MLrjJzjX3E8Dx1F2kvClkd+Gw3HyKp0UDs67hwizwZi6r/Y
         2acm7zZkMTpck+mg2l/cHyZNqQc9qtKmG7w86actJuECYxD1mZhNW8IoVGf9MgVQzy0k
         Mgix6atk75qmO0YbDLUBza5cdActIhBfoTHHI5E4BqJ5JJ+rcg3jy06Krm2ot6KkmfRM
         E8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244299; x=1698849099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ5KMjXB468aEBKF9WSiVgBHVpR3dfOc9lss4H+jYhs=;
        b=SrsGZN6FQ8XEtDwf708WEYjd8u+LNC16UeLdmPNYjjejq83XR0+1oZTwxzYN9eNHBn
         iPIuubmUiPKtXheANksUtGFeUXEugVbVlYPcwUUAV1i7TsMxcinBjrl9oNIQHY0gSnTT
         ReTBNcrPi1qZRRS36aQp7irTZJXwGrbjQxUNB+mJYW36JtksuQPF2Jj0/kpeEBkwq7gg
         Pl/VK0xEACh/RsdZOigf/B6L3D910OLE2XPl6SptdwOt1kAw3yA1MiA8RjX4K2Db4m5Z
         eczOP7xTVObS+JVSyjcJ07aj6EdRPmpWyjpAy1bt2/mC5a9QTeOallFybMWuBcyrf8Bx
         CAaQ==
X-Gm-Message-State: AOJu0YwFoGehfDVNkZ9PEfBCK924/upp6OXqgj4TWAHjLwk/zzf9x5Vi
	SyqKatiqbsHiSbWL88WdxviQhmSZqu4B9WtkQedMpg==
X-Google-Smtp-Source: AGHT+IF7tK7NfgRXXBPos0ywzXuU86jChm+AWmtZlA6vYIo4J7cbqAiHmW1rfAYJAfDBMxaRs+5k+PsdcZyeZeyJr4k=
X-Received: by 2002:a17:90b:4d8e:b0:27d:515d:94f0 with SMTP id
 oj14-20020a17090b4d8e00b0027d515d94f0mr11823715pjb.24.1698244298909; Wed, 25
 Oct 2023 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231025142820.390238-1-apatel@ventanamicro.com>
In-Reply-To: <20231025142820.390238-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 25 Oct 2023 20:01:27 +0530
Message-ID: <CAK9=C2UrDELsQpM2S5h9Qd9SJWrFmuGGCT-zYJgHL3E0S-DkUA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Linux RISC-V AIA Preparatory Series
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_073142_547598_88EA122E 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgNzo1OOKAr1BNIEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBmaXJzdCB0aHJlZSBwYXRj
aGVzIG9mIHRoZSB2MTEgTGludXggUklTQy1WIEFJQSBzZXJpZXMgY2FuIGJlCj4gbWVyZ2VkIGlu
ZGVwZW5kZW50bHkgaGVuY2Ugc2VuZGluZyB0aGVzZSBwYXRjaGVzIGFzIGFuIGluZGVwZW5kZW50
Cj4gcGVycGFyYXRvcnkgc2VyaWVzLgo+IChSZWZlciwgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvZGV2aWNldHJlZS9tc2c2NDM3NjQuaHRtbCkKPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFs
c28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2FpYV9wcmVwX3YxIGJyYW5jaCBhdDoKPiBodHRwczov
L2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IEFudXAgUGF0ZWwgKDMpOgo+ICAgUklT
Qy1WOiBEb24ndCBmYWlsIGluIHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoKSBmb3IgZGlzYWJsZWQg
SEFSVHMKPiAgIG9mOiBwcm9wZXJ0eTogQWRkIGZ3X2Rldmxpbmsgc3VwcG9ydCBmb3IgbXNpLXBh
cmVudAo+ICAgaXJxY2hpcC9zaWZpdmUtcGxpYzogRml4IHN5c2NvcmUgcmVnaXN0cmF0aW9uIGZv
ciBtdWx0aS1zb2NrZXQgc3lzdGVtcwoKQXMgbWVudGlvbmVkIG9uIHRoZSBwYXRjaHdvcmsgY2Fs
bCwgdGhlc2UgYXJlIHRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzCm9mIHRoZSB2MTEgTGludXggQUlB
IHNlcmllcy4KClBsZWFzZSBjb25zaWRlciB0aGlzIGZvciB0aGUgTGludXgtNi43IG1lcmdlIHdp
bmRvdy4KCj4KPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgIHwgMTEgKysrKysr
LS0tLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIHwgIDcgKysrKy0tLQo+
ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgICAgICAgICAgICAgfCAgMiArKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzQuMQo+
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
