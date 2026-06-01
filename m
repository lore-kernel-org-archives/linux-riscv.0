Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5270CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RtWEHp4/CiZJtlQ5Ca2C5J1PiJNhac6We03DGVZkt8=; b=dQ6oCtURE1e+yc
	GVn0DhgbjKF0wkumZ3UGOwnlh44o62cobTlrd7Lz5lMhMM1G+SSakCemHz1LKl9CN2EfPdlAHUPMT
	1KDrbDNIqNXO8SEulpY4rEhBNZS55MikhLPu/Db3E5fr2LETvJ6ApnJ9Mlmvm17r+9cH3lXT0PqFB
	JG8OTfcXJvISWdzeFh3UK08tCfl5XyCMi53UEdDLPs7HcaC3m3m/pqO+uNexm7Vn9dMtBBTBtvi4D
	Isn4LIED3dFg113THwMYjlREUMtZprOhh3MFcLSZpPpJAyvBMGEJb6s0QEyPJD2hQmuXBieobxgGA
	4JfYtD3Z8lA1FMHGb/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3b-0000000ACQ1-35cJ;
	Mon, 01 Jun 2026 06:23:27 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3Y-0000000ACOI-3cD7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:23:26 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-69d92dbc420so5440339eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295004; cv=none;
        d=google.com; s=arc-20240605;
        b=L5YMa+ONmtL7Rcsf/0e7D2oYSzjfA3WtShCyPWBYYBPiw8mZw5Q6ygBN1I7KJXkfwq
         E6g38YBEyAaV5Es89dEziYb+XQmFylXq/iu4KgqMDNRTqv1plI7Z2dW3xzFKpNSyiIXu
         nVXKCGDZUPWefFUQVmcHXs8fw6GGk/s0EYO6y7mhZ3z4cllt/QZ1zb375kMiRUAiYw61
         pjfWPXcc2hzw2arteXMoaCVDJqGcoG8YPfXrnlZEAovImuzMMfpZMALyaANhZyWzhu3M
         a6zUWl+PrcL8X4AR5Uq0fXeXnydtSNVUYcfFD0NfjD/ZRKNdd+5IuIdfmOmMwWB8LP6l
         Dn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        fh=Z4fgseITk3NkNucUQLsyf3Ra12UEanm68W5HGz3eHr8=;
        b=Ad25E4SiDSpHaCwziHY3O6b5e/ISlH4Y7BcnJaNAI1ZHh6AY0to808+5fDJYcF10EE
         dlAEMpK5u9+anHRFb6HiLkasaNomD4baaXG1txvEsFfqLsey9eCD40Kl3bJdjpaJmjoz
         3Yd9VjXSdFSEWngDA885jO5Mf2s6FnB14Z21b21xpxlFkgilSVQbrGSFRXurtRt+DWbM
         f+N4YjhRZFj+LCYGdue4FcKrDj317PCySKjQ99mn3M85lAvk+5HzcdPajNUHHJmvNQtZ
         NAvz8+2zDFD7NArk1Pqz3ZXmqeSi3si+UNWPlW82cmz7M0983KMU4GnwSFNW3kmHwWV8
         FM9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780295004; x=1780899804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        b=TbT/jLD0dv5JjmjkLgisN2xriJggJ2/DYTeQO0moknaBZApTj3e+8FS3An8okAgmK+
         g1AiniM3cvZouUghcL0QB6H9TOyN+j5/tOXSKaVKsm68IgxcdOp2nYtQx92692y/C7H9
         OU7lkYaP5zY/oudjhLVxhfBF/CwpJV0/ZG/YQwo61DavPwyRz1bIkBdQAUwWDik3CyFE
         F427XmTKEffj1+1qi7+I8lsfdUHCfB7W2tQH9m03OuuobAqvfKL9usmlfNN9uA0r7mEJ
         kZ7vMT13WRBjm/QQPO06CKyQzuc8WlA9k7Lk30Xshzgix8SN9V76q3fUJQIT1Dxb7HqY
         ujIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295004; x=1780899804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        b=aG54MFXbovawpP4SUQ6yixkUuskEMf78vaKUoxUFgjzzwuNl+ba+aKYEu4wokB+KOr
         pkXoEsQ0/nyg5+XVJGe7H98yzPUvKiALue2mtqXk3mTk5i+rCw4f/AANAigkhNlEpcKc
         KYDnwAySQVM7FL/D+noSQN2aoRcBv5zez+fdxyZl+40PFcnPV4fj7Y46Ik1h8JVbuowU
         8xNEk2heT5sjt+h77vkftoC+BC/TCd4Saqaqey08M/w2w9zfL8O0P+PZdZ39le4l7Dkn
         LGWUZn6nKaHLG9Pbg1t/OcL/0bIqC5tZ0K4QDyHFB0e0Hpny84Acj3ZtaLQPa+yztrkP
         qVoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mnVJMHBO3Tl5tEflRDFVT88YuDPKJd8I/3aPDcfYS//keGH0xIsbstjSmrtBSyi1Vr98gyVzdR+yOwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJQ0yc9tEhuBUpU6x2kQUVmwcWTXlhJNlRaeHXbC3Lfl0p+3Vv
	sbWBE2K9zlTOypguZVy3CWQWIu4m5NenCU/m13fN3W3jvTdqwOpCcZ34GfSxTcrIW2TS1mcYrov
	NETmGDQA0M/Q4efzI5JlO01hCXZjXiyMp4BiBybsX6w==
X-Gm-Gg: Acq92OGCqzANv2CtqoNzua54GsBY7Ew+jCZr5yNHsY1DNrrIjkR5pFKEfhndVehpiUG
	IUTy+z2q6ld6khUNX5+argK47KOwaFMt2HjVrm/KYC/TarwP2IYpW5yk1zOXFzwE3RRrG3r/Fsi
	kPQs9SuwWLmfRZwTa2HpfWenlvsD/3qCA7uIX/bo9xxplbEwJX47ORWlxi8zV9W+JoRXMXoW3S2
	KE4MHaNurFSCQ6N862In+bvq74KRfi02HBrWFesUc03J1ulms9k178QNjH6jrYWFsmOOhVqoc/e
	1DWqYE4hFncrxN9oZYd+sTL3lLdf9tPI9DidW+LXTVhfCuizJDk/6SBLrDcHpsUBcwEgAulfFN5
	tA7inpS46H7Nm/sJNQHrhHeRCFWqRtwZm+wdzgQ==
X-Received: by 2002:a05:6820:2d4a:b0:69e:2c0:8485 with SMTP id
 006d021491bc7-69e105a8b63mr5036974eaf.45.1780295003702; Sun, 31 May 2026
 23:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn> <20260429173534386Dfz8RALJT73-jMfif0nSb@zte.com.cn>
In-Reply-To: <20260429173534386Dfz8RALJT73-jMfif0nSb@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 11:53:10 +0530
X-Gm-Features: AVHnY4KcrK1-f9Gli02tgY1vU1JpDz19ta3d5NZ0oRcBHrYoMGeM9BX0ga_fxIc
Message-ID: <CAAhSdy2qqpZ6qucwsuRZWnKgno03Ok4czv8RTgpjA73i+yFhng@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_v2_2=2F3=5D_RISC=2DV=3A_KVM=3A_add_tracepoints_fo?=
	=?UTF-8?Q?r_guest_page_faults?=
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232324_912851_B9D890B4 
X-CRM114-Status: GOOD (  16.28  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMzowNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4KPiBBZGQgdGhlIGt2bV9wYWdlX2ZhdWx0IGV2ZW50IHRyYWNlcG9pbnRzIHRvIGNv
dW50IHRoZSBudW1iZXIgb2YgS1ZNCj4KPiBndWVzdCBwYWdlIGZhdWx0cy4KPgo+Cj4gU2lnbmVk
LW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpMb3Qgb2Yg
cmVkdW5kYW50IG5ld2xpbmVzIGluIHRoaXMgcGF0Y2guIExvb2tzIGxpa2UgdGhpcyBwYXRjaAp3
YXMgbm90IHNlbnQgdXNpbmcgImdpdCBzZW5kLWVtYWlsIi4KClJlZ2FyZHMsCkFudXAKCgo+Cj4g
LS0tCj4KPiAgYXJjaC9yaXNjdi9rdm0vdHJhY2UuaCAgICAgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKysrCj4KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAgMyArKysKPgo+ICAy
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3RyYWNlLmggYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4KPiBpbmRleCAzZDU0
MTc1ZDgwNWMuLjkwNTZjYzk4ODNjZiAxMDA2NDQKPgo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Ry
YWNlLmgKPgo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RyYWNlLmgKPgo+IEBAIC01Niw2ICs1Niwz
MSBAQCBUUkFDRV9FVkVOVChrdm1fZXhpdCwKPgo+ICAgX19lbnRyeS0+aHRpbnN0KQo+Cj4gICk7
Cj4KPgo+Cj4gKy8qCj4KPiArICogVHJhY2Vwb2ludCBmb3IgcGFnZSBmYXVsdC4KPgo+ICsgKi8K
Pgo+ICtUUkFDRV9FVkVOVChrdm1fcGFnZV9mYXVsdCwKPgo+ICsgVFBfUFJPVE8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1NjQgZmF1bHRfYWRkcmVzcywgdTY0IGVycm9yX2NvZGUpLAo+Cj4gKyBU
UF9BUkdTKHZjcHUsIGZhdWx0X2FkZHJlc3MsIGVycm9yX2NvZGUpLAo+Cj4gKwo+Cj4gKyBUUF9T
VFJVQ1RfX2VudHJ5KAo+Cj4gKyBfX2ZpZWxkKHVuc2lnbmVkIGludCwgICB2Y3B1X2lkKQo+Cj4g
KyBfX2ZpZWxkKHU2NCwgICAgICAgICAgICBmYXVsdF9hZGRyZXNzKQo+Cj4gKyBfX2ZpZWxkKHU2
NCwgICAgICAgICAgICBlcnJvcl9jb2RlKQo+Cj4gKyApLAo+Cj4gKwo+Cj4gKyBUUF9mYXN0X2Fz
c2lnbigKPgo+ICsgX19lbnRyeS0+dmNwdV9pZCAgICAgICAgPSB2Y3B1LT52Y3B1X2lkOwo+Cj4g
KyBfX2VudHJ5LT5mYXVsdF9hZGRyZXNzICA9IGZhdWx0X2FkZHJlc3M7Cj4KPiArIF9fZW50cnkt
PmVycm9yX2NvZGUgICAgID0gZXJyb3JfY29kZTsKPgo+ICsgKSwKPgo+ICsKPgo+ICsgVFBfcHJp
bnRrKCJ2Y3B1ICV1IGFkZHJlc3MgMHglMDE2bGx4IGVycm9yX2NvZGUgMHglbGx4IiwKPgo+ICsg
X19lbnRyeS0+dmNwdV9pZCwKPgo+ICsgX19lbnRyeS0+ZmF1bHRfYWRkcmVzcywKPgo+ICsgX19l
bnRyeS0+ZXJyb3JfY29kZSkKPgo+ICspOwo+Cj4gKwo+Cj4gICNlbmRpZiAvKiBfVFJBQ0VfUlNJ
Q1ZfS1ZNX0ggKi8KPgo+Cj4KPiAgI3VuZGVmIFRSQUNFX0lOQ0xVREVfUEFUSAo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9l
eGl0LmMKPgo+IGluZGV4IDBiYjBjNTFlM2M4OS4uMGNmYjAxNDlkYTlmIDEwMDY0NAo+Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPgo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfZXhpdC5jCj4KPiBAQCAtMTEsNiArMTEsNyBAQAo+Cj4gICNpbmNsdWRlIDxhc20vaW5zbi1k
ZWYuaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9tbXUuaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2t2
bV9uYWNsLmg+Cj4KPiArI2luY2x1ZGUgInRyYWNlLmgiCj4KPgo+Cj4gIHN0YXRpYyBpbnQgZ3N0
YWdlX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVu
LAo+Cj4gICAgICAgIHN0cnVjdCBrdm1fY3B1X3RyYXAgKnRyYXApCj4KPiBAQCAtNDMsNiArNDQs
OCBAQCBzdGF0aWMgaW50IGdzdGFnZV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9ydW4gKnJ1biwKPgo+ICAgfTsKPgo+ICAgfQo+Cj4KPgo+ICsgdHJhY2Vfa3Zt
X3BhZ2VfZmF1bHQodmNwdSwgZmF1bHRfYWRkciwgdHJhcC0+c2NhdXNlKTsKPgo+ICsKPgo+ICAg
cmV0ID0ga3ZtX3Jpc2N2X21tdV9tYXAodmNwdSwgbWVtc2xvdCwgZmF1bHRfYWRkciwgaHZhLAo+
Cj4gICAodHJhcC0+c2NhdXNlID09IEVYQ19TVE9SRV9HVUVTVF9QQUdFX0ZBVUxUKSA/IHRydWUg
OiBmYWxzZSwKPgo+ICAgJmhvc3RfbWFwKTsKPgo+IC0tCj4KPiAyLjQzLjUKPgo+Cj4KPgo+Cj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
