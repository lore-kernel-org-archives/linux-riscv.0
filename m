Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C210CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 12:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjSfr8E6v2kcyn9av/CcevY9kB+9OdvtngJWtgipsrU=; b=I6fzkgXjyZZkN9
	SzhqBsMIoEfmj12fbZcBMPZoU/6dPAqHKpd/qXeqd28nFqSyd/pBwvb3ihcgpOIENuqL9tpCFtOYG
	GbEIveTUSc5lUMZnj7RfPftQKieVUW5eXLL/0FDMwizjTFLInJ6mDyBUmg2QfT4jm/gH1y+hcpZ77
	ynxttD6vNiu/De5STwUHPCKqAPoSPx5RRCtt0hJb1zxe3i/Kg+AettMYslUN+0L5FSsGUHjI5EPN0
	K+a11ZTf3TZGZdYygbV7IkRTHNjMJ7myG5qCdydNEfaBWdLtcHKS7OEix3jB7tuMUnIE4F2Nc8Ki6
	7YbEmxodJWRWG8sC+xuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtnmm-0000000FTHO-2udC;
	Mon, 08 Apr 2024 12:07:40 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtnmi-0000000FTDn-3gD0
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 12:07:39 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36a0e43afd8so11679545ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1712578055; x=1713182855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysPdkHofn0SsqVjUlorA7HM2PSEU9x+PNO7DRN4CxYo=;
        b=IuGvva8v/gMxEuWk3TQ1ae+r6RxP8lDvX6nBhjp5QFN24gRyhRGfORt7ASy3UULNV+
         0X5ANYUkJbVebKlJX9XXgMPogbKdmqGeLrqW2r+86Hn5OpySWxTiFpTl4cJHhS2mS++O
         pKLMRQr/NPR/WMas5NeZstB+++4Q1ZQODtOa9bD97w/tCvpf3D379FoVXGRtt1pZ+FaP
         LsexejqfyOnCO3H4URftih/UPFiqaXqhI6jxr9+WCqx6mP4FGlDfCe0uPBCM3k4MXq8L
         4D4cDP7pQHQUuhFxkE8BlFjFfz5eMpV0GdgxOko8v10MRzxCvu9//XAXbtLz80mMtqPj
         8VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712578055; x=1713182855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysPdkHofn0SsqVjUlorA7HM2PSEU9x+PNO7DRN4CxYo=;
        b=T3qsSvx1rDI7vyvdKkQ0fWLXPgQmRlV2OuTx0vBTmBhbAp/siR2GNYEBVfTUqZw8Zx
         S2zwzzabL9Dz5AcIn4WiVZ+ghV2YaNG5l0f4wHSq6HIzDLgUgfCCy5zl7LO4uLVYyeNE
         9RCC5pexbqnGF6ls7bOkgcsKC6HrAlnDQlBY/6v43qHCdzHUyLkRQSYVbGXcf8zlvNdK
         BrGtx2mqhdyZfFIRNXz+Zzd9vF1TGPCgWDg8nfM7NI/3KDv+SBUyBJZgAQIT/mOD1vAl
         u6F290M+Z5qDCaG6r+l1bhDjCHkHlhQdQ3lVaK/CY+8xixh7qMYMPDP6+L3AMT3u3Q8X
         dyZg==
X-Forwarded-Encrypted: i=1; AJvYcCWbU1CwFmbeQ7NGoR/IARaaSTF1DktSNQ+pkEblVKkig5ox7B16T6MOkHI1kGYB2O3zinJrel2sfj3AFqaWpDtlstbfanGX/RkQgu7nRM0F
X-Gm-Message-State: AOJu0YyFD9ILCfyDgdmV6ATGk4Ha9dBTynkQMhuB5oa4GY6DCMFVRgeh
	oZrQgShCRb2DnHMdpjVeo87k9L4MpQ0NXFnSe4x8LROCjO3+U0eYtGUAs/H8f4AxiESUNkIZ8TK
	s4flJguG/VtZGDhb2s6PSDdJ04qvyIkDh5pbB6g==
X-Google-Smtp-Source: AGHT+IHUq83zNBHTpl7MmDd5GJ1Gg5JdecBzvdbUwm0GbS2BKl2pv80jCI4+BNP4aYrjw+ttNoV+f0bZ5iomvms7YJo=
X-Received: by 2002:a05:6e02:1568:b0:36a:2872:90d4 with SMTP id
 k8-20020a056e02156800b0036a287290d4mr1779608ilu.26.1712578054731; Mon, 08 Apr
 2024 05:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240328031220.1287-1-liangshenlin@eswincomputing.com> <20240328031220.1287-2-liangshenlin@eswincomputing.com>
In-Reply-To: <20240328031220.1287-2-liangshenlin@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Apr 2024 17:37:23 +0530
Message-ID: <CAAhSdy0DgW055iV7=_D6iOLr1iVeK9SZmG8hqBG0_hb1z=+07g@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISCV: KVM: add tracepoints for entry and exit events
To: Shenlin Liang <liangshenlin@eswincomputing.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_050737_018554_1444861E 
X-CRM114-Status: GOOD (  17.52  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgODo0OeKAr0FNIFNoZW5saW4gTGlhbmcKPGxpYW5nc2hl
bmxpbkBlc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gTGlrZSBvdGhlciBhcmNoaXRlY3R1
cmVzLCBSSVNDViBLVk0gYWxzbyBuZWVkcyB0byBhZGQgdGhlc2UgZXZlbnQKPiB0cmFjZXBvaW50
cyB0byBjb3VudCB0aGUgbnVtYmVyIG9mIHRpbWVzIGt2bSBndWVzdCBlbnRyeS9leGl0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogU2hlbmxpbiBMaWFuZyA8bGlhbmdzaGVubGluQGVzd2luY29tcHV0aW5n
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdHJhY2VfcmlzY3YuaCB8IDYwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAg
ICAgIHwgIDcgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS90cmFjZV9yaXNjdi5oCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdHJhY2VfcmlzY3YuaCBiL2FyY2gvcmlzY3Yva3ZtL3RyYWNl
X3Jpc2N2LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTg0
ODA4M2M3YTVlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RyYWNlX3Jp
c2N2LmgKPiBAQCAtMCwwICsxLDYwIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4gKy8qCj4gKyAqIFRyYWNlcG9pbnRzIGZvciBSSVNDLVYgS1ZNCj4gKyAqCj4gKyAq
IENvcHlyaWdodCAyMDI0IEJlaWppbmcgRVNXSU4gQ29tcHV0aW5nIFRlY2hub2xvZ3kgQ28uLCBM
dGQuCj4gKyAqCj4gKyAqLwo+ICsjaWYgIWRlZmluZWQoX1RSQUNFX1JTSUNWX0tWTV9IKSB8fCBk
ZWZpbmVkKFRSQUNFX0hFQURFUl9NVUxUSV9SRUFEKQo+ICsjZGVmaW5lIF9UUkFDRV9SU0lDVl9L
Vk1fSAoKcy9fUlNJQ1ZfL19SSVNDVl8vCgo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9p
bnQuaD4KPiArCj4gKyN1bmRlZiBUUkFDRV9TWVNURU0KPiArI2RlZmluZSBUUkFDRV9TWVNURU0g
a3ZtCj4gKwo+ICtUUkFDRV9FVkVOVChrdm1fZW50cnksCj4gKyAgICAgICBUUF9QUk9UTyhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpLAo+ICsgICAgICAgVFBfQVJHUyh2Y3B1KSwKPiArCj4gKyAgICAg
ICBUUF9TVFJVQ1RfX2VudHJ5KAo+ICsgICAgICAgICAgICAgICBfX2ZpZWxkKHVuc2lnbmVkIGxv
bmcsIHBjKQo+ICsgICAgICAgKSwKPiArCj4gKyAgICAgICBUUF9mYXN0X2Fzc2lnbigKPiArICAg
ICAgICAgICAgICAgX19lbnRyeS0+cGMgICAgID0gdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnNl
cGM7Cj4gKyAgICAgICApLAo+ICsKPiArICAgICAgIFRQX3ByaW50aygiUEM6IDB4JTAxNmx4Iiwg
X19lbnRyeS0+cGMpCj4gKyk7Cj4gKwo+ICtUUkFDRV9FVkVOVChrdm1fZXhpdCwKPiArICAgICAg
IFRQX1BST1RPKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBleGl0X3JlYXNv
biwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNjYXVzZSksCj4gKyAg
ICAgICBUUF9BUkdTKHZjcHUsIGV4aXRfcmVhc29uLCBzY2F1c2UpLAo+ICsKPiArICAgICAgIFRQ
X1NUUlVDVF9fZW50cnkoCj4gKyAgICAgICAgICAgICAgIF9fZmllbGQodW5zaWduZWQgbG9uZywg
cGMpCj4gKyAgICAgICAgICAgICAgIF9fZmllbGQodW5zaWduZWQgbG9uZywgZXhpdF9yZWFzb24p
Cj4gKyAgICAgICAgICAgICAgIF9fZmllbGQodW5zaWduZWQgbG9uZywgc2NhdXNlKQoKVGhpcyBp
cyBub3QgdGhlIHJpZ2h0IGNvbnRlbnRzIGRlc2NyaWJpbmcgYSBLVk0gZXhpdC4KClRoZSBmaWVs
ZHMgb3ZlciBoZXJlIHNob3VsZCBiZSBhbGlnbmVkIHdpdGggInN0cnVjdCBrdm1fY3B1X3RyYXAi
CnNvIHdlIHNob3VsZCBoYXZlIGZvbGxvd2luZyBmaWVsZHM6CiAgICBfX2ZpZWxkKHVuc2lnbmVk
IGxvbmcsIHNlcGMpCiAgICBfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIHNjYXVzZSkKICAgIF9fZmll
bGQodW5zaWduZWQgbG9uZywgc3R2YWwpCiAgICBfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIGh0dmFs
KQogICAgX19maWVsZCh1bnNpZ25lZCBsb25nLCBodGluc3QpCgo+ICsgICAgICAgKSwKPiArCj4g
KyAgICAgICBUUF9mYXN0X2Fzc2lnbigKPiArICAgICAgICAgICAgICAgX19lbnRyeS0+cGMgICAg
ICAgICAgICAgPSB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQuc2VwYzsKPiArICAgICAgICAgICAg
ICAgX19lbnRyeS0+ZXhpdF9yZWFzb24gICAgPSBleGl0X3JlYXNvbjsKPiArICAgICAgICAgICAg
ICAgX19lbnRyeS0+c2NhdXNlICAgICAgICAgPSBzY2F1c2U7Cj4gKyAgICAgICApLAo+ICsKPiAr
ICAgICAgIFRQX3ByaW50aygiRVhJVF9SRUFTT046MHglbHgsUEM6IDB4JTAxNmx4LFNDQVVTRTow
eCVseCIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19lbnRyeS0+ZXhpdF9yZWFzb24sIF9f
ZW50cnktPnBjLCBfX2VudHJ5LT5zY2F1c2UpCj4gKyk7Cj4gKwo+ICsjZW5kaWYgLyogX1RSQUNF
X1JTSUNWX0tWTV9IICovCj4gKwo+ICsjdW5kZWYgVFJBQ0VfSU5DTFVERV9QQVRICj4gKyNkZWZp
bmUgVFJBQ0VfSU5DTFVERV9QQVRIIC4KPiArI3VuZGVmIFRSQUNFX0lOQ0xVREVfRklMRQo+ICsj
ZGVmaW5lIFRSQUNFX0lOQ0xVREVfRklMRSB0cmFjZV9yaXNjdgo+ICsKPiArLyogVGhpcyBwYXJ0
IG11c3QgYmUgb3V0c2lkZSBwcm90ZWN0aW9uICovCj4gKyNpbmNsdWRlIDx0cmFjZS9kZWZpbmVf
dHJhY2UuaD4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdS5jCj4gaW5kZXggYjVjYTlmMmU5OGFjLi5lZDA5MzJmMGQ1MTQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
Cj4gQEAgLTIxLDYgKzIxLDkgQEAKPiAgI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+Cj4gICNp
bmNsdWRlIDxhc20va3ZtX3ZjcHVfdmVjdG9yLmg+Cj4KPiArI2RlZmluZSBDUkVBVEVfVFJBQ0Vf
UE9JTlRTCj4gKyNpbmNsdWRlICJ0cmFjZV9yaXNjdi5oIgo+ICsKPiAgY29uc3Qgc3RydWN0IF9r
dm1fc3RhdHNfZGVzYyBrdm1fdmNwdV9zdGF0c19kZXNjW10gPSB7Cj4gICAgICAgICBLVk1fR0VO
RVJJQ19WQ1BVX1NUQVRTKCksCj4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgZWNh
bGxfZXhpdF9zdGF0KSwKPiBAQCAtNzgyLDYgKzc4NSw4IEBAIGludCBrdm1fYXJjaF92Y3B1X2lv
Y3RsX3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgICAqLwo+ICAg
ICAgICAgICAgICAgICBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplKHZjcHUpOwo+Cj4gKyAg
ICAgICAgICAgICAgIHRyYWNlX2t2bV9lbnRyeSh2Y3B1KTsKPiArCj4gICAgICAgICAgICAgICAg
IGd1ZXN0X3RpbWluZ19lbnRlcl9pcnFvZmYoKTsKPgo+ICAgICAgICAgICAgICAgICBrdm1fcmlz
Y3ZfdmNwdV9lbnRlcl9leGl0KHZjcHUpOwo+IEBAIC04MjAsNiArODI1LDggQEAgaW50IGt2bV9h
cmNoX3ZjcHVfaW9jdGxfcnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgICAg
ICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4KPiArICAgICAgICAgICAgICAgdHJhY2Vfa3ZtX2V4
aXQodmNwdSwgcnVuLT5leGl0X3JlYXNvbiwgdHJhcC5zY2F1c2UpOwo+ICsKPiAgICAgICAgICAg
ICAgICAgcHJlZW1wdF9lbmFibGUoKTsKPgo+ICAgICAgICAgICAgICAgICBrdm1fdmNwdV9zcmN1
X3JlYWRfbG9jayh2Y3B1KTsKPiAtLQo+IDIuMzcuMgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
