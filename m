Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BCC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZp8wXrKTtUHcDjXXVT5R2QBU4RAVMeiX4KhUgvSs8Q=; b=BeFqkU5GE97tTx
	HpShnpRI7n1Mw6K0xS+ZUaypqlaj6Vm/NU73bLUFriq+Bwqp3FeEO2OT8DgVMNCLjoJ/e4TCm1d/X
	09B47foq3HnWuuHMeDQuL8WcsPgZEGK+W15EIR20R4D3K74dGmEqBE6jnTa4u2Eo91l6LAwyz9a93
	LaGz7h3vx66uueyq/i3aZF6Qx9ZOuTD/8O4PFZmyYTyeZvrY8a9Ar54Xp98hKPoQO+sZ5kM31YN0O
	sn/Alim1+/gLir/90H9kghlgTSHFaSGS3HmKx9zmyIYgQ3987SMq5CxTUBRj8Zc0dEOkH2iHZQLXX
	3tyde0herMgEXBqzgP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRugy-0000000AaqE-0v1K;
	Wed, 18 Jun 2025 15:27:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt1Z-0000000AKlV-2Yjd
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=crYKm76o7xrNY+G6KV9/tF3PVZHJnWgwFllJxx/P2sc=; b=X89jvI1zxckXrqwlYZl/b8a6Dq
	k0S+s32y+pDiCD9+EJbAM2ekynScp84Eth9C9mG9jjDvpuBFCnPbfJBi479/qmru2Usb+B3pebhMS
	2PrAxvJLJMgRxGiblbe/p10Nb6CJ7b6syxbBSJ77V19RcIBHtLdKvdq3xErykdjz9tUYM6ql7oqdF
	4N/kcrPC7HRDALKI0i14w3gKKr6+opyuCUyUxLyi7vwF7g4r0ZingkiUBzLMm0TfsEJxMzp5HVLT6
	M2YKlf2+EjIq6FDILK8BCT4+mM7Gx70eLgBv0dNzSIbM6z4Ni2eG51w1kOrqt2cdYDvJ/JS9Uy0dc
	BhPjPcRg==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt1X-000000043vt-1VZe
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:40:21 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553b82f3767so4571034e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254016; x=1750858816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crYKm76o7xrNY+G6KV9/tF3PVZHJnWgwFllJxx/P2sc=;
        b=fnuCUV4m5iOvw/AbVC2Qj0TMogygnURTyu76BDh7hj/chjv+ZlEi/egYbCBo4RLFer
         6NkOKLsJ106IT/kQI/CnYMSNWOx6e5OkSLTO5nSB/qkSupiPMTnpGkHljhOWDt+H7hys
         auiVNrGP3qSt7P+kJPN5OGIzJMWkx14jvLld5zUIcKzc9n0XT25toEwYLqgdUsWbWuqY
         IHpYTkR6UUD9zi6+gKbt9QEuNdl3MI6v4QIVxtTZFvHtCZrYtnMpAJPNF6gHquTh0JhB
         9rtPgZkLKUfv3WYd84tA1P6VZst26F+2cZ2GgmgyjLXxBNeSL67Xa6HIvXTouiIxme/1
         vlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254016; x=1750858816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crYKm76o7xrNY+G6KV9/tF3PVZHJnWgwFllJxx/P2sc=;
        b=CcNt7XlMknUrOp6ieTSwJIsB4xxkQ0GJ/X+3aEbbqHu3JQ6FOa1DcD6T96laHYdUCe
         daFbiTa70vdZD8zXNkoa8uNS+s8e7niVREvE+TnCQqMjYsfbnIDDtPz2VlmZxrzL8jaY
         UUHxcnUhXMFUyKFQlLk7M1/bSeUY8/l+0NhGKbVoQYpLaMaXg2CRsBxtfXS9ZWzIYgpC
         H9B2fisrya0PJnPppqgdIU3gcBQeQFvXkqaLtZ6VoLFxN87bZcNRcH8DZkKzG75QkdXb
         YpTU8QS46OplJ8V86pDrhd1qnVbfqVbne5Y4caLssnQBhUqi/VYXpYADmRYb7kd6Oi55
         +1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeiT0LMfvCswgiWFYyuxMHnJz37a/ZIVbm8iesxOHyFisCMbT+fDG8FebR1WzihsisoehIPI7oz7xlOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgXtG4SA7cXhLZVoO6XDuJWz15NuVoBvF0hkeiqYdqw+osWvp
	VX3HbqMB3Ty/p+5GauZATrgINTyWJ+Wv+809OSD0mR++ROqDbp7TsdLgt2PW9F43MLCkvrfS3ee
	n88D7Xl5pkUoT6VLEMywHNr4WkxHsJSR9304qaKrGOA==
X-Gm-Gg: ASbGncvNRjirtv0AJ0uWS3SlVXOTXqA2u9OgagGI1yc68QXQpBUoYllhPULlx6wkbvC
	CPvUGesy3qJ2vvPLqK6Sx6KmmpIsg9sbHVHTx8hc7nRh5vXqzrIDRX0yjPlLiFGswx9ng44hsVI
	CMls8khJFp1D07/855iJsalM+cJjytln/+YqVpTNghEnds26vtSsAr50WN11qXoOrw3OjX7isOa
	w==
X-Google-Smtp-Source: AGHT+IFad5ToM6J1+d0O4ioF2H0SvuVc8QUlMms8kkOXzKAtFkNQ7udNNIL4/h4trNzifK85LwmlcE1SddV80i2GLLM=
X-Received: by 2002:a05:6512:23a7:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-553b6e74f1bmr5037069e87.16.1750254015903; Wed, 18 Jun 2025
 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102226eucas1p112dacf9670f68b4a8581aa1a8b5ced9d@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:40:04 +0200
X-Gm-Features: AX0GCFtjm4Gei3EGyvZSnf2L-ltMUqIESaL5jfPbh7xGonqWZX6d4yY2Lh7mu5E
Message-ID: <CAMRc=MfQFc=MvGHpu1M4HO1-2RJh34UAXXCvVBZ2jU0rFDANJQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_144019_530146_34423878 
X-CRM114-Status: GOOD (  21.49  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTI6MjLigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEludHJvZHVjZSB0aGUgcHdyc2VxLXRo
ZWFkLWdwdSBkcml2ZXIsIGEgcG93ZXIgc2VxdWVuY2VyIHByb3ZpZGVyIGZvcgo+IHRoZSBJbWFn
aW5hdGlvbiBCWE0tNC02NCBHUFUgb24gdGhlIFQtSEVBRCBUSDE1MjAgU29DLiBUaGlzIGRyaXZl
cgo+IGNvbnRyb2xzIGFuIGF1eGlsaWFyeSBkZXZpY2UgaW5zdGFudGlhdGVkIGJ5IHRoZSBBT04g
cG93ZXIgZG9tYWluLgo+Cj4gVGhlIFRIMTUyMCBHUFUgcmVxdWlyZXMgYSBzcGVjaWZpYyBzZXF1
ZW5jZSB0byBjb3JyZWN0bHkgaW5pdGlhbGl6ZSBhbmQKPiBwb3dlciBkb3duIGl0cyByZXNvdXJj
ZXM6Cj4gIC0gRW5hYmxlIEdQVSBjbG9ja3MgKGNvcmUgYW5kIHN5cykuCj4gIC0gRGUtYXNzZXJ0
IHRoZSBHUFUgY2xvY2sgZ2VuZXJhdG9yIHJlc2V0IChjbGtnZW5fcmVzZXQpLgo+ICAtIEludHJv
ZHVjZSBhIHNob3J0IGhhcmR3YXJlLXJlcXVpcmVkIGRlbGF5Lgo+ICAtIERlLWFzc2VydCB0aGUg
R1BVIGNvcmUgcmVzZXQuIFRoZSBwb3dlci1kb3duIHNlcXVlbmNlIHBlcmZvcm1zIHRoZXNlCj4g
ICAgc3RlcHMgaW4gcmV2ZXJzZS4KPgo+IEltcGxlbWVudCB0aGlzIHNlcXVlbmNlIHZpYSB0aGUg
cHdyc2VxX3Bvd2VyX29uIGFuZCBwd3JzZXFfcG93ZXJfb2ZmCj4gY2FsbGJhY2tzLgo+Cj4gQ3J1
Y2lhbGx5LCB0aGUgZHJpdmVyJ3MgbWF0Y2ggZnVuY3Rpb24gaXMgY2FsbGVkIHdoZW4gYSBjb25z
dW1lciAodGhlCj4gSW1hZ2luYXRpb24gR1BVIGRyaXZlcikgcmVxdWVzdHMgdGhlICJncHUtcG93
ZXIiIHRhcmdldC4gRHVyaW5nIHRoaXMKPiBtYXRjaCwgdGhlIHNlcXVlbmNlciB1c2VzIGNsa19i
dWxrX2dldCgpIGFuZAo+IHJlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgpIG9uIHRoZSBjb25z
dW1lcidzIGRldmljZSB0byBvYnRhaW4gaGFuZGxlcwo+IHRvIHRoZSBHUFUncyAiY29yZSIgYW5k
ICJzeXMiIGNsb2NrcywgYW5kIHRoZSBHUFUgY29yZSByZXNldC4gIFRoZXNlLAo+IGFsb25nIHdp
dGggY2xrZ2VuX3Jlc2V0IG9idGFpbmVkIGZyb20gcGFyZW50IGFvbiBub2RlLCBhbGxvdyBpdCB0
bwo+IHBlcmZvcm0gdGhlIGNvbXBsZXRlIHNlcXVlbmNlLgo+Cj4gUmV2aWV3ZWQtYnk6IFVsZiBI
YW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBX
aWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gLS0tCgpUaGFua3MsIHRoaXMg
bG9va3MgbXVjaCBiZXR0ZXIgbm93LgoKW3NuaXBdCgo+ICsKPiArc3RhdGljIGludCBwd3JzZXFf
dGhlYWRfZ3B1X2Rpc2FibGUoc3RydWN0IHB3cnNlcV9kZXZpY2UgKnB3cnNlcSkKPiArewo+ICsg
ICAgICAgc3RydWN0IHB3cnNlcV90aGVhZF9ncHVfY3R4ICpjdHggPSBwd3JzZXFfZGV2aWNlX2dl
dF9kcnZkYXRhKHB3cnNlcSk7Cj4gKwo+ICsgICAgICAgaWYgKCFjdHgtPmNsa3MgfHwgIWN0eC0+
Z3B1X3Jlc2V0KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArCj4gKyAgICAg
ICByZXNldF9jb250cm9sX2Fzc2VydChjdHgtPmdwdV9yZXNldCk7Cj4gKyAgICAgICByZXNldF9j
b250cm9sX2Fzc2VydChjdHgtPmNsa2dlbl9yZXNldCk7CgpUaGVzZSBjYW4gc3RpbGwgZmFpbCwg
SSBzdWdnZXN0IGNoZWNraW5nIGFuZCBwcm9wYWdhdGluZyB0aGUgcmV0dXJuIHZhbHVlcy4KCj4g
KyAgICAgICBjbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShjdHgtPm51bV9jbGtzLCBjdHgtPmNs
a3MpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwoKW3NuaXBdCgo+ICsKPiArc3Rh
dGljIGludCBwd3JzZXFfdGhlYWRfZ3B1X21hdGNoKHN0cnVjdCBwd3JzZXFfZGV2aWNlICpwd3Jz
ZXEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRl
dikKPiArewo+ICsgICAgICAgc3RydWN0IHB3cnNlcV90aGVhZF9ncHVfY3R4ICpjdHggPSBwd3Jz
ZXFfZGV2aWNlX2dldF9kcnZkYXRhKHB3cnNlcSk7Cj4gKyAgICAgICBzdGF0aWMgY29uc3QgY2hh
ciAqY29uc3QgY2xrX25hbWVzW10gPSB7ICJjb3JlIiwgInN5cyIgfTsKPiArICAgICAgIHN0cnVj
dCBvZl9waGFuZGxlX2FyZ3MgcHdyX3NwZWM7Cj4gKyAgICAgICBpbnQgaSwgcmV0Owo+ICsKPiAr
ICAgICAgIC8qIFdlIG9ubHkgbWF0Y2ggdGhlIHNwZWNpZmljIFQtSEVBRCBUSDE1MjAgR1BVIGNv
bXBhdGlibGUgKi8KPiArICAgICAgIGlmICghb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5v
Zl9ub2RlLCAidGhlYWQsdGgxNTIwLWdwdSIpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiArCj4gKyAgICAgICByZXQgPSBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhkZXYtPm9mX25v
ZGUsICJwb3dlci1kb21haW5zIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICIjcG93ZXItZG9tYWluLWNlbGxzIiwgMCwgJnB3cl9zcGVjKTsKPiArICAgICAgIGlm
IChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIC8qIEFkZGl0
aW9uYWxseSB2ZXJpZnkgY29uc3VtZXIgZGV2aWNlIGhhcyBBT04gYXMgcG93ZXItZG9tYWluICov
Cj4gKyAgICAgICBpZiAocHdyX3NwZWMubnAgIT0gY3R4LT5hb25fbm9kZSB8fCBwd3Jfc3BlYy5h
cmdzWzBdICE9IFRIMTUyMF9HUFVfUEQpIHsKPiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQo
cHdyX3NwZWMubnApOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgIH0KPiAr
Cj4gKyAgICAgICBvZl9ub2RlX3B1dChwd3Jfc3BlYy5ucCk7Cj4gKwo+ICsgICAgICAgaWYgKGN0
eC0+Z3B1X3Jlc2V0IHx8IGN0eC0+Y2xrcykKPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
KwoKT25lIHRoaW5nIHRoYXQgYm90aGVycyBtZSBpcyB0aGF0IHRoaXMgaXMgc3RpbGwgYSBmcmFn
aWxlIGNvbnN0cnVjdC4gSQprbm93IHRoaXMgY2Fubm90IGhhcHBlbiBpbiB0aGlzIHBhcnRpY3Vs
YXIgZGVzaWduIGJ1dCBpbiB0aGVvcnksIHRoaXMKd291bGQgbm90IHdvcmsgaWYgdGhlcmUgd2Vy
ZSBtdWx0aXBsZSBzaW11bHRhbmVvdXMgY29uc3VtZXJzIG9mIHRoZQpBT04gcG93ZXIgZG9tYWlu
LiBNYXliZSBqdXN0IHRvIGJlIHN1cmU6IHN0b3JlIHRoZSBhZGRyZXNzIG9mIHRoZQpvZl9ub2Rl
IG9mIHRoZSBjb25zdW1lciAocHJlZmVyYWJseSBidW1waW5nIGl0cyByZWZlcmVuY2UgY291bnQp
IGFuZApjaGVjayBpdCB0byBtYWtlIHN1cmUgdGhhdCBvbmNlIGEgY29uc3VtZXIgYXNzb2NpYXRl
ZCB3aXRoIHRoaXMgbm9kZQppcyBjb25uZWN0ZWQsIHdlIG5vIGxvbmdlciBhbGxvdyBhbnkgb3Ro
ZXIgbm9kZXM/IFRoaXMgd2F5IHlvdSBjb3VsZAphbHNvIGp1c3QgZHJvcCB0aGlzIGlmIHJlcGxh
Y2luZyBpdCB3aXRoIGNoZWNraW5nIHRoZSBleGlzdGVuY2Ugb2YgdGhlCm9mX25vZGUuCgpbc25p
cF0KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
