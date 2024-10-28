Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6ED10C0B
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRNWmajRys6QmVnkg3Duhq6Lm2FIiHGftYl3fhEwPsg=; b=u5H3c5Ehxyyda6
	WLYv8gmd4PoyPJ+7oD4zdCrbQ10+EYft/J+HVzlgXy9T8EAZxixVRWurLPcxqJ4Fi7T1rPoX6CgLA
	c2VNp1+bgv7tHmY8ZW8cblvFj5/4tPC5dfeQ/b872nuUbK6lMskibBHZ6HrBHMihfk+RvHMetmmTi
	xqoVMogdzQKqkaCTehNUmjBy1XiLGWP+dlXiSCnuCyQJ/nVV2yVHl67NT1u/KubJCX2WVtDucp8N7
	9nWvv93s8mbymPgb2luZcDNUO5FCSLv6B2D/vJ17mXrX2zTAlGva8UpnUGBdJCgCaI5QCL/63tfl6
	szBBP2wcZHQSsHWjls5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P9Q-0000000Ap04-1ID2;
	Mon, 28 Oct 2024 12:47:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P0f-0000000AmUa-1L3w;
	Mon, 28 Oct 2024 12:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A52D85C58DF;
	Mon, 28 Oct 2024 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D312C4CEE8;
	Mon, 28 Oct 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119092;
	bh=V1JXJL1vWwx7XP9YK/J1MZBdP+aQk/vvq7BuTE22XGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pPcuanI4L/9WHLvcEeESZlfco46yDS+cvw01ROOOs6ZBpPWbDhX7bdzaNH4kIZHWi
	 u/Tc+1Lq56F6vDPKvI84Ub7g2Iq6FU9LUmZNwydfWyyMk5XROv1P+ngdZ22truySCI
	 8M2kw96x8tdQfqGPyfDHCGAXb3nRv0K2D5TkZpzCwjDKWGte0QR9r1itWqW0EMxIRv
	 RGiWOeG6SHr9fE/b3LYUgUxwt6fn8bNlPM6mnM71QNBL8B5HdB7mArKp5RI4MubYpN
	 ku6exlDFjc3Fwpvdr+sE5TjHoHWOpBb2AWHyzv+Qv5ikzNwNXTOp30UINpKOmVsXRj
	 HLtI5d+Z52QWA==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7180e07185bso1858674a34.3;
        Mon, 28 Oct 2024 05:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOdERm34R6gEMA1665LPPzYwkrcNs2Y6nSlEk8QW6nJj8M72GQZfX0mFw2y3URcpHZGZUnKz1HrTJpSVaZDInD@lists.infradead.org, AJvYcCV/omwxNxNXQd18fwKOIfQ67tZ5PWQCuc2JpzLuO1esruWwAh0cL3JQAxlrzYW2cpoK6wcDf7LA+J9FiCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYRdy0Cu/W+qKCEgA7dPqh6NAhY+4/34q12h7hMFGmBOPOvsig
	vOlcH5gxHII9hm93vyaOd1hJXFoFLzG4WbJf9WlK2mz40B4IZgVmga2AizdnYdggYqjaXeu+jus
	W4jlIrPRpBKbZ9dG7hUU2KbjyWUE=
X-Google-Smtp-Source: AGHT+IHcPpA8PwSHFKyy4jVsSoWz0exQdbIJ/BCQr8AmaXDfJKdcACxok+MuRtE7oJfCfUQ19KdoW2248k6Yc5vVjzs=
X-Received: by 2002:a05:6870:3310:b0:25e:23b4:cf3e with SMTP id
 586e51a60fabf-29051e30582mr6787713fac.44.1730119091651; Mon, 28 Oct 2024
 05:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241028105200.1205509-1-pierre.gondois@arm.com>
In-Reply-To: <20241028105200.1205509-1-pierre.gondois@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 28 Oct 2024 13:37:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g=Q0aYEZUdy+F-bmptOvLVRxAs5gzGpbgrbCoFxMpcZQ@mail.gmail.com>
Message-ID: <CAJZ5v0g=Q0aYEZUdy+F-bmptOvLVRxAs5gzGpbgrbCoFxMpcZQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: CPPC: Make rmw_lock a raw_spin_lock
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jeremy Linton <jeremy.linton@arm.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Steffen Persvold <spersvold@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Reinette Chatre <reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, 
	Yury Norov <yury.norov@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053813_476812_96726156 
X-CRM114-Status: GOOD (  19.49  )
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMTE6NTLigK9BTSBQaWVycmUgR29uZG9pcyA8cGllcnJl
LmdvbmRvaXNAYXJtLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZm9sbG93aW5nIEJVRyB3YXMgdHJpZ2dl
cmVkLiBzdWdvdl91cGRhdGVfc2hhcmVkKCkgbG9ja3MgYQo+IHJhd19zcGlubG9jayB3aGlsZSBj
cGNfd3JpdGUoKSBsb2NrcyBhIHNwaW5sb2NrLiBUbyBoYXZlIGEgY29ycmVjdAo+IHdhaXQtdHlw
ZSBvcmRlciwgdXBkYXRlIHJtd19sb2NrIHRvIGEgcmF3X3NwaW5sb2NrLgo+Cj4gQWxzbyBzYXZl
IGlycSBzdGF0ZS4KPgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gWyBCVUc6IElu
dmFsaWQgd2FpdCBjb250ZXh0IF0KPiA2LjEyLjAtcmMyLVhYWCAjNDA2IE5vdCB0YWludGVkCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBrd29ya2VyLzE6MS82MiBpcyB0cnlpbmcg
dG8gbG9jazoKPiBmZmZmZmY4ODAxNTkzMDMwICgmY3BjX3B0ci0+cm13X2xvY2speysuKy59LXsz
OjN9LCBhdDogY3BjX3dyaXRlKzB4Y2MvMHgzNzAKPiBvdGhlciBpbmZvIHRoYXQgbWlnaHQgaGVs
cCB1cyBkZWJ1ZyB0aGlzOgo+IGNvbnRleHQtezU6NX0KPiAyIGxvY2tzIGhlbGQgYnkga3dvcmtl
ci8xOjEvNjI6Cj4gICAjMDogZmZmZmZmODk3ZWY1ZWM5OCAoJnJxLT5fX2xvY2spey0uLS59LXsy
OjJ9LCBhdDogcmF3X3NwaW5fcnFfbG9ja19uZXN0ZWQrMHgyYy8weDUwCj4gICAjMTogZmZmZmZm
ODgwMTU0ZTIzOCAoJnNnX3BvbGljeS0+dXBkYXRlX2xvY2spey4uLi59LXsyOjJ9LCBhdDogc3Vn
b3ZfdXBkYXRlX3NoYXJlZCsweDNjLzB4MjgwCj4gc3RhY2sgYmFja3RyYWNlOgo+IENQVTogMSBV
SUQ6IDAgUElEOiA2MiBDb21tOiBrd29ya2VyLzE6MSBOb3QgdGFpbnRlZCA2LjEyLjAtcmMyLWc5
NjU0YmQzZTg4MDYgIzQwNgo+IFdvcmtxdWV1ZTogIDB4MCAoZXZlbnRzKQo+IENhbGwgdHJhY2U6
Cj4gICBkdW1wX2JhY2t0cmFjZSsweGE0LzB4MTMwCj4gICBzaG93X3N0YWNrKzB4MjAvMHgzOAo+
ICAgZHVtcF9zdGFja19sdmwrMHg5MC8weGQwCj4gICBkdW1wX3N0YWNrKzB4MTgvMHgyOAo+ICAg
X19sb2NrX2FjcXVpcmUrMHg0ODAvMHgxYWQ4Cj4gICBsb2NrX2FjcXVpcmUrMHgxMTQvMHgzMTAK
PiAgIF9yYXdfc3Bpbl9sb2NrKzB4NTAvMHg3MAo+ICAgY3BjX3dyaXRlKzB4Y2MvMHgzNzAKPiAg
IGNwcGNfc2V0X3BlcmYrMHhhMC8weDNhOAo+ICAgY3BwY19jcHVmcmVxX2Zhc3Rfc3dpdGNoKzB4
NDAvMHhjMAo+ICAgY3B1ZnJlcV9kcml2ZXJfZmFzdF9zd2l0Y2grMHg0Yy8weDIxOAo+ICAgc3Vn
b3ZfdXBkYXRlX3NoYXJlZCsweDIzNC8weDI4MAo+ICAgdXBkYXRlX2xvYWRfYXZnKzB4NmVjLzB4
N2I4Cj4gICBkZXF1ZXVlX2VudGl0aWVzKzB4MTA4LzB4ODMwCj4gICBkZXF1ZXVlX3Rhc2tfZmFp
cisweDU4LzB4NDA4Cj4gICBfX3NjaGVkdWxlKzB4NGYwLzB4MTA3MAo+ICAgc2NoZWR1bGUrMHg1
NC8weDEzMAo+ICAgd29ya2VyX3RocmVhZCsweGMwLzB4MmU4Cj4gICBrdGhyZWFkKzB4MTMwLzB4
MTQ4Cj4gICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAo+Cj4gRml4ZXM6IDYwOTQ5YjdiODA1NCAo
IkFDUEk6IENQUEM6IEZpeCBNQVNLX1ZBTCgpIHVzYWdlIikKPiBTaWduZWQtb2ZmLWJ5OiBQaWVy
cmUgR29uZG9pcyA8cGllcnJlLmdvbmRvaXNAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3Bp
L2NwcGNfYWNwaS5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvY3BwY19hY3Bp
LmMgYi9kcml2ZXJzL2FjcGkvY3BwY19hY3BpLmMKPiBpbmRleCAxYTQwZjA1MTRlYWEuLmU3ZTRi
ZjkzMmUyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvY3BwY19hY3BpLmMKPiArKysgYi9k
cml2ZXJzL2FjcGkvY3BwY19hY3BpLmMKPiBAQCAtMTEyNyw3ICsxMTI3LDcgQEAgc3RhdGljIGlu
dCBjcGNfd3JpdGUoaW50IGNwdSwgc3RydWN0IGNwY19yZWdpc3Rlcl9yZXNvdXJjZSAqcmVnX3Jl
cywgdTY0IHZhbCkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiAg
ICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2
ZSgmY3BjX2Rlc2MtPnJtd19sb2NrLCBmbGFncyk7Cj4gKyAgICAgICAgICAgICAgIHJhd19zcGlu
X2xvY2soJmNwY19kZXNjLT5ybXdfbG9jayk7CgpUaGlzIHdvbid0IGFwcGx5IGJlY2F1c2UgdGhl
IGN1cnJlbnQgY29kZSBpcwoKc3Bpbl9sb2NrKCZjcGNfZGVzYy0+cm13X2xvY2spOwoKYW5kIGFu
YWxvZ291c2x5IGJlbG93LiAgSSB0aGluayB0aGF0IGl0IG5lZWRzIHRvIGJlCnJhd19zcGluX2xv
Y2tfaXJxc2F2ZSgpLCB0aG91Z2guCgpCZXNpZGVzLCBhIHJhdyBzcGluIGxvY2sgbmVlZHMgdG8g
YmUgZGVjbGFyZWQgYXMgc3VjaC4KCj4gICAgICAgICAgICAgICAgIHN3aXRjaCAoc2l6ZSkgewo+
ICAgICAgICAgICAgICAgICBjYXNlIDg6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcHJldl92
YWwgPSByZWFkYl9yZWxheGVkKHZhZGRyKTsKPiBAQCAtMTE0Miw3ICsxMTQyLDcgQEAgc3RhdGlj
IGludCBjcGNfd3JpdGUoaW50IGNwdSwgc3RydWN0IGNwY19yZWdpc3Rlcl9yZXNvdXJjZSAqcmVn
X3JlcywgdTY0IHZhbCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X3ZhbCA9IHJlYWRx
X3JlbGF4ZWQodmFkZHIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgICAgICAgICBkZWZhdWx0Ogo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJhd19zcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZjcGNfZGVzYy0+cm13X2xvY2ssIGZsYWdzKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICByYXdfc3Bpbl91bmxvY2soJmNwY19kZXNjLT5ybXdfbG9jayk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gICAgICAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgICAgdmFsID0gTUFTS19WQUxfV1JJVEUocmVnLCBwcmV2X3ZhbCwgdmFs
KTsKPiBAQCAtMTE3NSw3ICsxMTc1LDcgQEAgc3RhdGljIGludCBjcGNfd3JpdGUoaW50IGNwdSwg
c3RydWN0IGNwY19yZWdpc3Rlcl9yZXNvdXJjZSAqcmVnX3JlcywgdTY0IHZhbCkKPiAgICAgICAg
IH0KPgo+ICAgICAgICAgaWYgKHJlZy0+c3BhY2VfaWQgPT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVN
X01FTU9SWSkKPiAtICAgICAgICAgICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNw
Y19kZXNjLT5ybXdfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgICAgICAgICByYXdfc3Bpbl91bmxv
Y2soJmNwY19kZXNjLT5ybXdfbG9jayk7Cj4KPiAgICAgICAgIHJldHVybiByZXRfdmFsOwo+ICB9
Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
