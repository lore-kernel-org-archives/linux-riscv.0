Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8BBC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWt0kz4XEu/vW4qOcwUYQlDCHLssDHqnxD6jD0AEg68=; b=vfVgePF4D/aJh/
	8rNL5ZKxtgaaaM6szFBBi35/KFeN+lLF38oCQL7oTPkXP9ccttV4FKSpLmcTjaxdjYWVq3TqLTxd8
	a/yAWvSg5nQdXgXrHyVOiL4aznYkcjhrkXI9ZhJsKQRbqyYIE5CUUrU55wLf5H/M42u/pAWA3NWhE
	VVYsxW6BCOwaBjA+k7V7Vu0T4tHKn/KEPq+z+ZNX7YSgFZtJvx9qb0X+D9mncVfLjTVBexdYshP2C
	B6a+v/M079CxTq9oDsFnuOkp907VmnQttKD1nmepLyRTPx95beLe3rUu4f9/F5svXUkEBSK8GUVNZ
	eGXOVzEf4IKO0l8c/cEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGWU-00000005Fzu-3lqf;
	Wed, 31 Jan 2024 19:45:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGWS-00000005Fye-1RCN
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 19:45:25 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51117bfd452so171771e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1706730322; x=1707335122; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FnR8wIp1Vg1VItztyHVxYdev/8pOXB0lwFaWJxswpg=;
        b=O0YESDAtGRI14DCxq+rvBGQ4zbyInweKquOoprJasAZHlnwVmdFT1eB6jwpNYX2Xux
         cYs7swKI8z62EqeA3q8AMmjKx4iI3E8voIFghTfAiIlMDpRR57picUHEKc8pI0+nmzou
         DwW2+q5rl2Ks58Wdt6Aymp+JyAZwL2xVqn1IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730322; x=1707335122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FnR8wIp1Vg1VItztyHVxYdev/8pOXB0lwFaWJxswpg=;
        b=fr6NAC+lDK+0AX/fYL8vPSSR1bknMQ15A7KJUT/qKpedkkcrDOfj1lTYujXU7Lb/Bq
         59goBIpe8bdN46Da5rMX8+Rqoi5U/Yya/0pw2OLwRjbEiVA5cmA9m/5/CRGGLQDGgLJH
         ik4zxd6Ni+F80Z+G5WRa6UIISmhjboiA+0GBmr9G0qjTWXkkqjREzI/ySDQg0ccpDzUA
         3xTC3ftf7s/B7oi63i639jhpzopzSMdfR8RetrFMwaZQ3CO5UCmZ/NSwjeYPrUt8b7hO
         E/O/Jnp1vawRpqWMfD27zHhBKGcIvjpvZe/b+N8heAJwfTIYREvEmSCFpVOX5rNG43Ns
         BMbA==
X-Gm-Message-State: AOJu0YyW8ek6WzP0qQAnrWmKEGOJEdCXKDrtRVnzLpjoII66hcFMpkq6
	XWeKmW+pJt2d2xFo7kcj2/+F2+Rak/HQJuBlqQAJbjrBtpQ0O9x1CZFakDHeV9xmvPhkw+TDRVr
	z+I8N013JF5viTVMqgB/Zsk8zh37SZ/4fq5S4
X-Google-Smtp-Source: AGHT+IFhv0SStX5ohposhDSosjryjjRsHMq30WXFHBLQZ6AYpbu7PpuetqxbqPc+cNe7QypZUHMi+hNE+sIA/tF95DI=
X-Received: by 2002:a05:6512:2eb:b0:50e:8eff:3980 with SMTP id
 m11-20020a05651202eb00b0050e8eff3980mr301670lfq.30.1706730322271; Wed, 31 Jan
 2024 11:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20240131120511.200338-5-ajones@ventanamicro.com> <20240131120511.200338-7-ajones@ventanamicro.com>
In-Reply-To: <20240131120511.200338-7-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 31 Jan 2024 11:45:10 -0800
Message-ID: <CAOnJCUJ1taC-WWX3GrBC2LwSYgjY7a=phA+aNP4kfc1rQW4DdQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: paravirt: Use correct restricted types
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_114524_406037_31D3ABE3 
X-CRM114-Status: GOOD (  14.80  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNDowNeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gX19sZTMyIGFuZCBfX2xlNjQgdHlwZXMgc2hvdWxk
IGJlIHVzZWQgd2l0aCBsZTMyX3RvX2NwdSgpIGFuZAo+IGxlNjRfdG9fY3B1KCksIGFzIHNwYXJz
ZSBoZWxwZnVsbHkgcG9pbnRzIG91dC4KPgo+IEZpeGVzOiBmZGY2OGFjY2NmYzYgKCJSSVNDLVY6
IHBhcmF2aXJ0OiBJbXBsZW1lbnQgc3RlYWwtdGltZSBzdXBwb3J0IikKPiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwMTAxMTkzMy5oTDl6cW1Lby1sa3BAaW50ZWwu
Y29tLwo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgfCA0ICsrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGFy
YXZpcnQuYwo+IGluZGV4IDE1YzVkNDA0OGRiNS4uMGQ2MjI1ZmQzMTk0IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
YXJhdmlydC5jCj4gQEAgLTkxLDggKzkxLDggQEAgc3RhdGljIGludCBwdl90aW1lX2NwdV9kb3du
X3ByZXBhcmUodW5zaWduZWQgaW50IGNwdSkKPiAgc3RhdGljIHU2NCBwdl90aW1lX3N0ZWFsX2Ns
b2NrKGludCBjcHUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlfc3RhX3N0cnVjdCAqc3QgPSBw
ZXJfY3B1X3B0cigmc3RlYWxfdGltZSwgY3B1KTsKPiAtICAgICAgIHUzMiBzZXF1ZW5jZTsKPiAt
ICAgICAgIHU2NCBzdGVhbDsKPiArICAgICAgIF9fbGUzMiBzZXF1ZW5jZTsKPiArICAgICAgIF9f
bGU2NCBzdGVhbDsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIENoZWNrIHRoZSBzZXF1ZW5j
ZSBmaWVsZCBiZWZvcmUgYW5kIGFmdGVyIHJlYWRpbmcgdGhlIHN0ZWFsCj4gLS0KPiAyLjQzLjAK
PgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKLS0gClJl
Z2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
