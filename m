Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3404AC71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7olHmQcRJpIXKodUbrXuGq09K5CkAIQU10no54E1WW0=; b=C5V6wewWOIWi0A
	oEWtwQQDtbbqX5je6crV/ibrfphGBJU5bORnQnyDVDCML/MFg03Nevo5cDt7NXZBunv7XyMbkNO7O
	TAlENHhw/+FqsSULMqJPI77HM/RQaiAhoUVRxzXqZAtVJk0NnN30xM5SKecnarsg+JYZaxL+1yDNT
	V/DliNFf9SChnCuHRraUn23VDGZCI+usgkFzuLOVNdn+RwwcX2LKwMcfkL3PMZqgHUg/Ocjtruv8D
	SDxCnm5nnESJ2GShhVPod+7ajWS2Th8M9TWQreopFglws2i8FxyaA0yovIpwrRMTlhkkOezgg5I3Y
	Kv4TvDwCXoliLEPrQ2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnoT-0000000EFvg-0fBp;
	Thu, 12 Jun 2025 19:42:13 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhx8-0000000DS2s-3CgA
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:26:48 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3ddf2993103so3613635ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734806; x=1750339606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=xwKLbet28ZIObFYEPo7VA7ZzeZwdVXsx8tbZaFwelwjkPVHVpo6fOpqqbA/K0c0STZ
         JtCt0j961G6tzvE3h4s9eghOGZMUv4iLHSJNAeOcY2kY83WbExEsmgYrtgweKpw3VEhU
         mthwT0avceUTNzAIzPMYnSjYojZcu2DSzc4tWc3NV1w85L1O4BI2fiLXhKLMxK7ORGhu
         pZ/UorMKT+TqKi3MnjcwoU3KUznxUSDadrpxndH9og6R+yNiONiXOGaPEVf9PayIY9Ik
         OC3dBx7fX77TUUXcjz9Q2I8B4jHgfCWb2/oFU9cVaQer4Pz/xhIjCjaRsYvC5a7hBDMX
         CQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734806; x=1750339606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=OMKdWrTXKyZ9YfxhiCM1PB18QEeTKfv1YWNw516M0KHr1sWHkBgVt6Iawndjshn/+Z
         oQDAFSbwIGd7XGtUTPHbU1ZgFFKoG0AOAyl0E4C68CxJ1QBdkC+1RMVrfsemmJH8OMxy
         TrEHUS2/gGzA+rNpnmrN1x+tCCmSw8J/sNssfytjy3H66piBVYSfwoi3rXwWHp5b4PXA
         qbUXFlVoAW1yNwu4qphK2AqHiMYo67P4uPv7x3eeoAtawlzkK1no0PVZKdTFyIyvJvjN
         mgywdN0iyuHboXqV9cGa57n9wbKhDc11iFL2Fh5RUeFR8LlEXvfLBICtl2tlguVqeXa0
         Um1g==
X-Forwarded-Encrypted: i=1; AJvYcCUtvxh+RA1g461yO23dLy/cNKIuG7N5GS1c/J1decNin2CG4sFuh7z1KwHJasAVuLvZSh9ZUuM0sSmTRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzktiQ37o6O0HIAP85NtQJJTLJaQ+BVildQxfE8S+FiZjfIxK0k
	oNT7Y0iziHIoK3B8WH638m2JGKqI48dIQTSbsOwPPDTNt5aETf2NZGCkJKcoSmcq+hP1vqR6z36
	cZSyo6bayHl/nnCFhxSLm8ozFy+pOIQ5XgJZhMy4MKA==
X-Gm-Gg: ASbGncuD+VKhPBTjfgWip28hmuEASHhWTBoPOPWjn/Ja+3Y6rgM1VAYDw7RAFb1hwWx
	ChtAilICDa/royRJlimR4wqvTC3BD2e8cOsJTkeuYVsNtq1G46bFLjpU9bCYx9O/bps9gMAuLZ8
	6riqKULdJGEwWcoyaEyvdgciwN4To+rhXGt2ohKW0XUHc7
X-Google-Smtp-Source: AGHT+IG2iBZqXBZpblYqqV1CfizkbcXBVYuUqCYGloOAj0H2lvAJwOXwnS5XNnZkQ46BncD7OmhOhE+Hobvx1RtA1UQ=
X-Received: by 2002:a05:6e02:1807:b0:3dd:8663:d182 with SMTP id
 e9e14a558f8ab-3ddf42c5b4dmr72461125ab.13.1749734805782; Thu, 12 Jun 2025
 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:56:33 +0530
X-Gm-Features: AX0GCFtHBaD1dkadFboJHCaCDko1UoltJB37LuW30sdZ0j57mmaziXXBSUbao7Y
Message-ID: <CAAhSdy1qnRYOh0ka4PeJDf5ybviMrf+bpYaOOka3BXVmwAPSoQ@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062646_813001_9DEFA3D5 
X-CRM114-Status: GOOD (  17.82  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMzo1M+KAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQklfRldGVF9NSVNBTElHTkVEX0RFTEVHIG5lZWRz
IGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8gZGVsZWdhdGUKPiBtaXNhbGlnbmVkIGxvYWQvc3Rv
cmUgZXhjZXB0aW9ucy4gU2F2ZSBhbmQgcmVzdG9yZSBpdCBkdXJpbmcgQ1BVCj4gbG9hZC9wdXQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4gUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFJldmlld2Vk
LWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KClF1ZXVlZCB0aGlzIHBhdGNo
IGZvciBMaW51eC02LjE3CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMK
PiBpbmRleCBiMGY2NmM3YmYwMTAuLjY3NzBjMDQzYmJjYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPiBAQCAtMTQsNiArMTQsOCBAQAo+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+Cj4KPiArI2RlZmluZSBNSVNf
REVMRUcgKEJJVF9VTEwoRVhDX0xPQURfTUlTQUxJR05FRCkgfCBCSVRfVUxMKEVYQ19TVE9SRV9N
SVNBTElHTkVEKSkKPiArCj4gIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSB7Cj4gICAgICAg
ICAvKioKPiAgICAgICAgICAqIEBpZDogRmVhdHVyZSBJRAo+IEBAIC02OCw3ICs3MCw0NiBAQCBz
dGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0
dXJlX3QgZmVhdHVyZSkKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gK3N0YXRpYyBi
b29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2Fu
X2RlbGVnYXRlKCk7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbWlz
YWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNv
bmYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2
Y3B1LT5hcmNoLmNmZzsKPiArCj4gKyAgICAgICBpZiAodmFsdWUgPT0gMSkgewo+ICsgICAgICAg
ICAgICAgICBjZmctPmhlZGVsZWcgfD0gTUlTX0RFTEVHOwo+ICsgICAgICAgICAgICAgICBjc3Jf
c2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+ICsgICAgICAgfSBlbHNlIGlmICh2YWx1ZSA9
PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIGNmZy0+aGVkZWxlZyAmPSB+TUlTX0RFTEVHOwo+ICsg
ICAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX0hFREVMRUcsIE1JU19ERUxFRyk7Cj4gKyAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFN
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBTQklfU1VDQ0VTUzsKPiArfQo+ICsK
PiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gK3sKPiArICAg
ICAgICp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVERUxFRykgJiBNSVNfREVMRUcpID09IE1JU19E
RUxFRzsKPiArCj4gKyAgICAgICByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4gK30KPiArCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiArICAg
ICAgIHsKPiArICAgICAgICAgICAgICAgLmlkID0gU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVM
RUcsCj4gKyAgICAgICAgICAgICAgIC5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25l
ZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPiArICAgICAgICAgICAgICAgLnNldCA9IGt2bV9zYmlf
ZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICsgICAgICAgICAgICAgICAuZ2V0ID0g
a3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4gKyAgICAgICB9LAo+ICB9
Owo+Cj4gIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqCj4gLS0KPiAyLjQ5LjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
