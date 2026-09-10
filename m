Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D190C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD+NVCuz5R53VtywrxJkMxZ9wcBGuh1D0DI0Tb9jHoE=; b=rPYmJWk+SxZoBz
	oOof6oqYXDa0RIJXRzLDTZVGXYJ8MiOEIoJ4ocbgpewRP3zPTuF1DxIqNI0P8H4HxDxqnM/9Ve199
	VjVxaUtESO4xQKTvXCSREIu9OywqnGLVTBuXwZyZk5o2WV9fnB2wsMyEDn4HCIEb8H/J17lTCi+hN
	Tc2pE16inPjY2WfQGMad5Ihywmb8O8R0InCwq2McbzP9+nLP5Nz/+yTDjgjBT4TXVEc2Nf7uaowI6
	cVhxzFcmMslCdEgrhUgZvA0F401f9CY6T0l4cFGIqZm0fBgBOsqtrds35LNLhav/JLqCHuTslNYlB
	k6lCogVHQZOZV1iPgLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJJ-0000000EXg1-0Fbl;
	Thu, 10 Sep 2026 13:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJI-0000000EXfe-11MK
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=; b=qEdYF1PNrDv8RZFikQULs2FAih
	GB/Z23Jrap/9c7uuGf6f8kSBisGOS1tII9nqWae9ZpETGPPiTYHg+0Zs2YQWYrNLk5Q4r/OKo/0EV
	ey5nHM0fOPdjmtS99XxAQ02sodsByySkbpP7osMeXHkdVc5/RaUMumiBgKAHzQMHQqzcGMsMLuRdm
	qSjGvcWzJog8QofbCWeY8h83O+kl7L+Q9NwqompTJFXLxshQQT5rIYulEP6UiUzThg+lq4u0XhM8f
	AYhjmNK3R6N6Iaj+IvCsG3NV2Ltp5gM5YhzEQ1F+1a4sltEFjKBG4aSTReGuHBpXgw8AGHsJkKFVh
	NmRJEkPQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fJB-00000002ZPO-2GES
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:59:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47de0093c42so6582288f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048759; cv=none;
        d=google.com; s=arc-20260327;
        b=cpnMaQH50488XWXR7qd1EX9/B6i75NeBcY7vdh7NVeoM44f4eKqXA9LSMf9gDjilZu
         GQAjVpuWQTXNeZlutBzGYc345jYrq1B3iwNy2dcndF3XHCqscp7KFqR7m2GQKKo54anQ
         C2WFUVYy0YYKRngAxuJmn0v5HrmlQhl2ijUsnP0XVYAUzoCmadG9ewtDLhYdXLmkrGLT
         FytnH5ug+lquw06TOVvuZRCCciC9vFF9GbkS1oUJNCCg3H8CE6I037Q1qS+Epio8DNRR
         9U9QNwv9ARmotIsL1h847Fpxga/X/OhVLTiAMxPGMSi5vhJPsHC9wv9nvE6xDtrC8ae6
         BpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        fh=+4dHONYe7v7BUuc0qlai/6THs4mHxGSvgNzRIz9iOuA=;
        b=hLTRHZnk/M1jHu31l74z9BPwNNcLmYHJvI2bThoR6sdZzSZAsfYw45InVJS97iaolW
         8p237sh88U1zQkt1mQ7R8F/OLJvBfqgIGwHr81lRtWC8VuX6wuSV9Hjz6pZZ0Cn7UDsj
         5sx6d+O97mtHfZpSH5SqTQUhNZwGqr3F7YrvdL2fQEOEBg3RA7uQJlUnfAL4x+8jq1Mk
         +Ah0jTjZzwNf+SFC3uuFWZLF8uqbFersIz54Os+wTr3eQ0VoreVtZFemgpGZmvC9i/yP
         1oP3r0rNNsC60VDiXHZQj5VD7QzGzWku29jmBnIdu9qA3ScymZuUr2u8+qv0G5TDupJ9
         BRAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048759; x=1789653559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=KtjxKVODLf6f/lBO4oH/ABdUgWgbhLe0ppfPGAx6b55SKBJ4ZMj0haJvktXOMz7dtb
         GLTkqdEnXsFgQCC8oD/uNO3e/4tY49kc4lsg820BL0AhEnkUpe/wEPBUjXNePnuOWNDp
         9dLmT0vKOVUOHOoYdvNVh6TLY9kxYbohTeLuBedcNfDxovvn26TtVa5enF0nBdt1nlvA
         cw7Tk8uMekFO1U3cUV7DDZ7mDeaYguIxFhHI6zxQyvEFQodXBprPBgLe6jpSyMYQd7y0
         lwOJP7R1XIDduz/Lkow+ocm/k3/eIZ7YjQi8M1kxyEVCqPUVymh3rbIEJRR/u7kgR1EP
         6wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048759; x=1789653559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=XnNyzhmoAlFg+s2MKugTBftGje4I6wyrBoi4QQyPSOQdB5/1R+3bjIxu3K1z6t3+Sw
         v6yXKL1KJVaGo+twR7k9ujBXerDpDCF/e+3mVkTEC3AXhEViXRioQrkTClz7UuwVm13p
         W7s7ZPZ3po/srbS5Yd1vg8oqVUGvll+S3jChSSabWT6tmNdyK+/6EgbcSmiM3liLAI7V
         5UhJqarxoeAx1U4S2I7o1134HLfXKI7qYokgpNncz/4/n7qxPy9UPpaLywIelSuAtm5g
         KbhBVKDcM6WV0pbQbIxLMo0VkpVKwQms35a2aGKmwSH3LYiNg6SgyW4YDFVe7GSz4Wm7
         cYAw==
X-Forwarded-Encrypted: i=1; AKwUvBxoOVkJmmZCVERiwnqpVTfD9obM9xFa8PRA5lzZcVOPIr9PkycZ4oEz1wPn/yyB5ejz/Lub6Dcn7Hxu6g==@lists.infradead.org
X-Gm-Message-State: AFuF++mmqA8/dQxyYQlJnIqV2m6pVM1cQDvMWszKPSPnNeW6W1AY3R0W
	nsFZAs8KghE4Dc4GkIXHt21UapEZQHISWVpXOENK/ybcgI524P9upLOKPuOLiwbR8Qzk9JIoXjc
	jk657aEkpznldfTwnyCe4byBShdMnxdDHvgKWh/EpHg==
X-Gm-Gg: AYBFou1rFtoxyCXVnQV7MqGc7cdyTQN8KMVmiqjV87MshkMsWYfWQ+hjjyHAQ/yn5Og
	2Q9E5c+hg8TdS4fjhFZSyp8CCd+L4rVZSae5fcVDA8nBHloeGskboWb0XsIaPJFal+vFzOceR1P
	vTgOSjn3Ti+riep6lbkmqjTi22GfofPHQtgNKYuwWpl3dc2ow8+hjiacc7i4ZfxjcrDcK/yeLpg
	cCsqvSIGrNcAtRpqqkV1flFEpZwAZeCjsQ5LMeqCNC8IDFjCvGgScnAwenpTPsNmPY+QGqW61p4
	mz2rg2aohsHrjSNbnGltAossMlB9d96LJKcnS9pn2CYUYq5t/GH74ekQev61Ar99w3kntCPZy8r
	g8ik/mEwpq/t+fZ/IgrlQjmErfszVa1HmRQIG5fj85UkiSt3yMj7xqWvb5GBlPU2debS+ZDMjeQ
	==
X-Received: by 2002:adf:e19e:0:b0:485:8c16:5eef with SMTP id
 ffacd0b85a97d-4858c166088mr39391128f8f.41.1789048759310; Thu, 10 Sep 2026
 06:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-3-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-3-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:29:06 +0530
X-Gm-Features: AcwNN1W7Uqn-QGBR02QgV1a2VTJVT2tlA_caJMvDJlneztIk9EUK-XjvcF0ult4
Message-ID: <CAAhSdy2qxD9x-mvt=5yEKA+xoa8QJ9evnQkJot9n+rkxvOQukA@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] RISC-V: KVM: Propagate interrupted G-stage faults
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_145921_684964_FF9ECEC5 
X-CRM114-Status: GOOD (  17.06  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgMTA6NDbigK9BTSBYaWUgQm8gPHhiQHVsdHJhcmlzYy5j
b20+IHdyb3RlOgo+Cj4gX19rdm1fZmF1bHRpbl9wZm4oKSByZXBvcnRzIGFuIGludGVycnVwdGVk
IGhvc3QgcGFnZSBmYXVsdCB3aXRoCj4gS1ZNX1BGTl9FUlJfU0lHUEVORElORy4gUklTQy1WIGN1
cnJlbnRseSBoYW5kbGVzIGl0IGFzIGEgZ2VuZXJpYyBlcnJvciBQRk4KPiBhbmQgcmV0dXJucyAt
RUZBVUxULgo+Cj4gUmV0dXJuIC1FSU5UUiBmb3IgdGhlIHNpZ25hbC1wZW5kaW5nIHNlbnRpbmVs
IHNvIGNhbGxlcnMgY2FuIGRpc3Rpbmd1aXNoCj4gYW4gaW50ZXJydXB0ZWQgZmF1bHQgZnJvbSBh
biBpbnZhbGlkIHVzZXJzcGFjZSBtYXBwaW5nLiBEbyBub3QgbG9nIHRoZQo+IGV4cGVjdGVkIGlu
dGVycnVwdGlvbiBhcyBhIHZDUFUgZXhpdCBlcnJvci4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4Mzcg
KCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdlMiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFhpZSBCbyA8eGJA
dWx0cmFyaXNjLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGFzIGEgZml4IGZvciBMaW51eC03LjMtcmNYCgpUaGFu
a3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICB8IDIgKysKPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IGQxODlmZDUuLjNlOTU1ZDgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS9tbXUuYwo+IEBAIC03MDgsNiArNzA4LDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtYV9wYWdlc2hpZnQsIGN1cnJlbnQpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiArICAgICAgIGlmIChpc19zaWdw
ZW5kaW5nX3BmbihoZm4pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlRSOwo+ICAgICAg
ICAgaWYgKGlzX2Vycm9yX25vc2xvdF9wZm4oaGZuKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDg4ZTBjMzYuLjhkMzZlYjggMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X2V4aXQuYwo+IEBAIC0yODMsNyArMjgzLDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2V4
aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAg
fQo+Cj4gICAgICAgICAvKiBQcmludCBkZXRhaWxzIGluLWNhc2Ugb2YgZXJyb3IgKi8KPiAtICAg
ICAgIGlmIChyZXQgPCAwKSB7Cj4gKyAgICAgICBpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVJTlRS
KSB7Cj4gICAgICAgICAgICAgICAgIGt2bV9lcnIoIlZDUFUgZXhpdCBlcnJvciAlZFxuIiwgcmV0
KTsKPiAgICAgICAgICAgICAgICAga3ZtX2VycigiU0VQQz0weCVseCBTU1RBVFVTPTB4JWx4IEhT
VEFUVVM9MHglbHhcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5ndWVz
dF9jb250ZXh0LnNlcGMsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
