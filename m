Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BE2CD6E7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsA8OAdwb/RVmP9j+NDnx9L/bjVMjOZz3Fam5ERlp9M=; b=LehIK/BkjMj0zk
	cfT9nc7K6M0S7/I5xmFmOE1Lb+2vt7eZZFDIJmflNkg2MZJZZGwNRlSRgm2L2lm+qOhp2VE98ztZH
	vNXN9Af3sDWOLGtR+GWqLtiwfrz1s9chyYH+hwB2rTjUJkYmm6GBY9fAFaU6muLilms4jAHRHblvU
	QS8kqDJOEGVYM4G5VeZwKHslzaj8k69d/TWTq4PoFBosz5V+tCIC63xF34ItL51z6JoehdDWZx2Z7
	jY4izabbCKzeKRuF4J0Fu7KbpS5O9e76Camwks8LjX1QVZIlOOAT6RoOg7mMj7laNUARMYMle6ucm
	Lafsnw6rtsUEWEq3kESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWVo-00000000pDf-2MLR;
	Fri, 05 Jun 2026 15:31:08 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWVm-00000000pCc-0M29
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 15:31:07 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-44104dac6f5so1864066fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673464; cv=none;
        d=google.com; s=arc-20240605;
        b=WosH3yQOTlvFiW7wPsYcSrj9uA/Y71+YzVXUAAD2otUEIekuQ1FTo84MnOr4BBqBKS
         bUnzF7nEi5RomjXpfDDcLM6qBt7XOLq+B/fCePI/N4nCOM29u4YEfPSqxhXSy3XXjwe3
         qC6m2oHMi7X1Qb9453pfKqlRT4JdUdcP1avxpuNCtqtktvsoB//On/zJCz3KeDCCk6Dh
         x/b+CForpkFkQObsLbMP4I6huHqYiFwTPwmDQbDRTIktNztCM4MsN702RkZyAlGphimS
         7uh1k+AdYng6/a4g++KUHXmxyDRQwxt0HXnjG0XJCEDmUmktNhnE+34KzNgSeUq+r9Rq
         2G1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        fh=DECq0wWgjDLDQm0PQtbpD28KDh8GQs8wR6QiCgEp+5w=;
        b=cdqqe/SoP9LkhHi8dwD3C+pUwyqntCpyNRIDq49Hch+PRpyQzQxgzraBT6pLuIOi67
         RPXMtChzYqW3JymIAnAJnOggh/lwwQmu0gd2Crj4B/wTrc/GjlpsFO5bINWbeh+BbJOK
         9LdjyMm27fqOMFM0ky89vsNLQ1BFmopbsOJdgCy4Y78fkU494Q5dNLC9Ehvi6mnAlXOw
         +xhmbgGx7J+Jm7LcGxaNhkQpupiAdLhEJpPA2ipUfZd4mVL/dpVqsZ8iBudKnO3ECCuk
         qJ/EqWD424NzKxryiVmJXU1ane4A5RhfdA/0I6+Hm1YNhdFRLKIEXo6L8bvsaBFdVVV6
         YdeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780673464; x=1781278264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=HsMHkm6/+qUt4DBp1tlvhlTKGDRG56hXUEsC9mrkMq5C/J2F22Fu0izBNN/sRBIID/
         HBhDns2ZVGO0DpH2rHd0e0Unr3kFSuFH49EoST/xyaTY1Y416teMWSnKhHpgOYgHQSbW
         P+QZQSW/i/ilN6lSvZjEd6fWKc4HtO84gKvS3sQABB5vMnF4rdHxnxUsTZwK8WpR9/Zs
         I3PM4R4WXjtycOLaMaXEPC8dzYWdVX2K9FD7EKqSboh7XwGEDhYN5VTuhLlr1wZzvdqm
         e9KutWNzfP4K2m5PNIhKQhqslFbO7Y4AqKMLAfsDa+JIvJWyyvqZ31qhFS6Aw5N3hZbM
         uFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673464; x=1781278264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=oHr3tUp/ewcSZ08TYG7QgMzHYbCwHXr2/eUJfvmNdB0e7Tof+bNyfGfMtrfg8xQ5t/
         9mS0D5UncXHcoHsDjNID4fw7VkZ6WYtCJiANU4x80zVjH6yhahXSAju4X/EPRrOlJHkA
         IVqAkZXl5aHCeSnptj62C4gKLkjKihZuAmOKhOoyMwJq3jFLrlhsten3nI6JBSLBWMO5
         r8nB5XxDQTDLsXIQ8VdHJaGLZZBDL4KKnDJpJpdRwRWIrAIF2DyRzSnY6j1RkGO4iNYg
         uiYuxgUvpkKLSJH/fE3uHsU28lb8GUeK+8rb8OR/83T49lGEBvBwJcWa+0bHet8gGlvW
         SXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AgQv15nzpBjHUut43p8t9qlwZYNKSGfruxTHF18SvNT9LxUiPGGLxVJCPj/a+cpKevH8XuqoGVPEckA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdlgJJqgYm6GWyPTcUIxHCLp+icuxJkT49eI3ZHFJlBssnrxPK
	y+UYhRejSUAuRjQV1q1oRD8xSZFrBOee0BnnZbe12CfZ0oyK5Gp6uYHGsJ6LVRjNV4rBOZnbow7
	bc2XTblahljUNx+DTU8JRvk0dBj2VKgkc50tdWoBjAQ==
X-Gm-Gg: Acq92OEklpTke2N2zYM4rdp7gKOuzhtLqgUU0Un8eaHVlrgHLVVVsmeRF5Urvc6ZUoO
	5EP6kAT44JQ/+5bxTLNyQfTY1mib6Xg7ty1hum2e1hjfaJXg9C/B4jLFVeW/sP7voH6i8of1Zg2
	aASt4y8GYo40O2z6O+muBlfCEfCnWz0YGevFC6o2iX2wg//BKJx+fcaQCCZs302F5uYj1NVHQnO
	VXbgJJgiC8Omk1EwHqAmEjnSuxzgyYugRmEc+h3x3ZsoG1KoLSC2YrFBNQfcOMmjT5GlPna3ePJ
	0qgiJ2zFTIti4wQKYS5wBl+nF32bF8OhMppRs/8j983DIm36tjcQpX37FRtEI5J4mCPC9ZgA2jr
	l2v5dFAXsRX5S/QYdXaoa0NJabEaBOIqZEoLa
X-Received: by 2002:a05:6820:570a:10b0:69e:7061:1ad7 with SMTP id
 006d021491bc7-69e7061218amr765816eaf.11.1780673464357; Fri, 05 Jun 2026
 08:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:00:52 +0530
X-Gm-Features: AVVi8Cce39tEXaZNh-7VPeh51marCJL4-w1WK5dzfxiMGfPYAU1071UHao6Z9nE
Message-ID: <CAAhSdy0m+ZpxBznL-gx5ozpbyLzU7rO6zZnnB=5eZt=eLvV+sA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after
 setting feature value
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083106_124721_90F5206B 
X-CRM114-Status: GOOD (  13.00  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBNYXJrIHRoZSB2Q1BVIENTUnMgYXMgZGlydHkg
YWZ0ZXIgc3VjY2Vzc2Z1bGx5IHNldHRpbmcgYW4gRldGVCBmZWF0dXJlCj4gdmFsdWUuIEZXRlQg
ZmVhdHVyZXMgbWF5IG1vZGlmeSBDU1JzIChlLmcuLCBwb2ludGVyIG1hc2tpbmcgbW9kaWZpZXMK
PiBoZW52Y2ZnLlBNTSksIGFuZCBmYWlsaW5nIHRvIG1hcmsgdGhlbSBkaXJ0eSBjYW4gbGVhZCB0
byB0aGUgZ3Vlc3QKPiBvYnNlcnZpbmcgc3RhbGUgQ1NSIHN0YXRlIGFmdGVyIHZDUFUgc2NoZWR1
bGluZyBvciBtaWdyYXRpb24uCj4KPiBGaXhlczogMTMyM2E1Y2ZlNTJjICgiS1ZNOiByaXNjdjog
U2tpcCBDU1IgcmVzdG9yZSBpZiBWQ1BVIGlzIHJlbG9hZGVkIG9uIHRoZSBzYW1lIGNvcmUiKQo+
Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNv
bT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3
ZnQuYwo+IGluZGV4IDJlYWIxNTMzOTY5NC4uNWU0YWFmYjBjYmYxIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYwo+IEBAIC01MjEsNiArNTIxLDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9m
d2Z0X3NldF9yZWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0K
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIDI6Cj4gICAgICAgICAgICAg
ICAgIHJldCA9IGNvbmYtPmZlYXR1cmUtPnNldCh2Y3B1LCBjb25mLCB0cnVlLCB2YWx1ZSk7Cj4g
KyAgICAgICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0VOVDsKPgo+IC0tCj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
