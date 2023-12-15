Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D576C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMeEXvF8hQwNuI+Fv+TGb4EdnZZdjenxxCAzWQSoeEU=; b=wXO8zVetPyf8kt
	UnwY5KJxt2Z4LDIU4rgcrlKRht5jGi0TDzOUUnF4IvN2lVT8Ypl1fIFNPYxh7iSwf3ZN2mtmhkZoC
	SdqxZKUnISe9NyR1vwPj5i5wdmT7o7XwGfQYEVIOD9oK27jsH6mhaROef8Q795KhVBeB6h9Pmfo6j
	UMsoiYzWGg6bp7z25UppQw8zoX6P5f11c2j/8lV0k84Pie7es5FpyexVQoNgr2mAAcjGWWKTb4YEU
	v0rhzFxgNOBlbMpiLwPqbSjrb1yQg7irg6plaF2ViexKm1iUuwqh98Xn+PcBL1tjVpgVOMl1ujbiz
	U+GTUjBc0j9+Sab0QhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Af-002Z4G-30;
	Fri, 15 Dec 2023 09:07:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Ad-002Z1g-0n
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 09:07:48 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28abca51775so68173a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 01:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702631264; x=1703236064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeNy5WoYNimz0qlJYnYNhVgKjfHasDk0kNBc3x9neVY=;
        b=dhY32zPWcaFOzYCGdhiWWhBZdywwA6fPwYy2L4CDfwUf0coEeghhItqLIa2q+WyeGS
         ogwySbOF72cWzXnUogEgTIr3wHdUNZenf3avAMtk9QzuK6GO6D5vv8Ke1EGsc1omrZQu
         f6dh0FhNReW8X0vFpN3uy0UVs1IlI2ZPpENIL/dtuOcOVtqWkouu9d5CIG2w4PUB6XTM
         vYbUQKTTUMsGRwyJzne/zK/MqgCs1Qon0C1xsCh+p0vjnmo1GNsOKJiS70ytgdAv70PK
         pmjs0Q3FpvTGSQameSLEe6a9BQ5sHyx5HherhkVQ/hQv4UaIVQAdofyaGqr/1vIBiYQp
         QrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702631264; x=1703236064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeNy5WoYNimz0qlJYnYNhVgKjfHasDk0kNBc3x9neVY=;
        b=ITX1xuVjlLM57dcUh7t/uuAcstpIa8s77Q6w0RQOvtBsE3m8ffgdD/9NMe5vlSXhk6
         diJJvDBGU+wyFftHR9DtMXCsL+8BM3MyO/LznXaWecuuxp7XyVJlCkyWVPSVgs1gpNcA
         zthSuBOAc/+FCWBLNaZb2HaIqh1CfUz0rzqnT7ZeeH9iHdJdNCIzgzexz1yUHqBltVsz
         6g6tB/ldtAHAFOm18wLKqr65X/Idg4cIrYDu94hwBxA7IAM5YWgOYC4bveQ8bspWgyry
         UTHulpo5S8SITWNlgmRjVDQCo1sy1OcV+qIpBxqy+jALaOnOGDSelodCUv+ZVOGAa5dd
         EptQ==
X-Gm-Message-State: AOJu0Yy+T2xvf3RCJjuum4k//w86zxGbQCe7XFLVVEvxxeYiqrbXemI1
	amIsICSSFODPV5n89ztPcm/hkcz4GKJ3PklIv8/uNA==
X-Google-Smtp-Source: AGHT+IHVKBYLQc96eIs84OQQuU8ObCe40O4pE2+IdlKa0U42LtO6XbDGby2kqSphbcTpeEo8AEAGzB//CC3g+x1X8iM=
X-Received: by 2002:a17:90a:c257:b0:28a:eac8:a4b2 with SMTP id
 d23-20020a17090ac25700b0028aeac8a4b2mr1691973pjx.60.1702631264120; Fri, 15
 Dec 2023 01:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-21-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-21-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:37:32 +0530
Message-ID: <CAAhSdy2tWPqoq=tZXtfkvsksAf4PPXeR3DOoKMvcfw-2YaDSvQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_010747_463019_6EF9D53C 
X-CRM114-Status: GOOD (  21.76  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gS1ZNJ3MgaW1wbGVtZW50YXRpb24gb2YgU0JJIFNU
QSBuZWVkcyB0byB0cmFjayB0aGUgYWRkcmVzcyBvZiBlYWNoCj4gVkNQVSdzIHN0ZWFsLXRpbWUg
c2hhcmVkIG1lbW9yeSByZWdpb24gYXMgd2VsbCBhcyB0aGUgYW1vdW50IG9mCj4gc3RvbGVuIHRp
bWUuIEFkZCBhIHN0cnVjdHVyZSB0byB2Y3B1X2FyY2ggdG8gY29udGFpbiB0aGlzIHN0YXRlCj4g
YW5kIG1ha2Ugc3VyZSB0aGF0IHRoZSBhZGRyZXNzIGlzIGFsd2F5cyBzZXQgdG8gSU5WQUxJRF9H
UEEgb24KPiB2Y3B1IHJlc2V0LiBBbmQsIG9mIGNvdXJzZSwgZW5zdXJlIEtWTSB3b24ndCB0cnkg
dG8gdXBkYXRlIHN0ZWFsLQo+IHRpbWUgd2hlbiB0aGUgc2hhcmVkIG1lbW9yeSBhZGRyZXNzIGlz
IGludmFsaWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCA2
ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAyICsrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jICAgICB8IDQgKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBpbmRl
eCAyMzBiODJjMzExOGQuLmIxMDAyNmZiNjQxMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmgKPiBAQCAtMjYzLDYgKzI2MywxMiBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7Cj4KPiAg
ICAgICAgIC8qICdzdGF0aWMnIGNvbmZpZ3VyYXRpb25zIHdoaWNoIGFyZSBzZXQgb25seSBvbmNl
ICovCj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnIGNmZzsKPiArCj4gKyAgICAgICAv
KiBTQkkgc3RlYWwtdGltZSBhY2NvdW50aW5nICovCj4gKyAgICAgICBzdHJ1Y3Qgewo+ICsgICAg
ICAgICAgICAgICBncGFfdCBzaG1lbTsKPiArICAgICAgICAgICAgICAgdTY0IGxhc3Rfc3RlYWw7
Cj4gKyAgICAgICB9IHN0YTsKPiAgfTsKPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hf
c3luY19ldmVudHMoc3RydWN0IGt2bSAqa3ZtKSB7fQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA2OTk1YjhiNjQxZTQu
LmZlYzRmNWZkMGZhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtODMsNiArODMsOCBAQCBzdGF0aWMgdm9pZCBr
dm1fcmlzY3ZfcmVzZXRfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICB2Y3B1
LT5hcmNoLmhmZW5jZV90YWlsID0gMDsKPiAgICAgICAgIG1lbXNldCh2Y3B1LT5hcmNoLmhmZW5j
ZV9xdWV1ZSwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVlKSk7Cj4KPiArICAgICAg
IHZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7Cj4gKwoKSSB0aGluayB3ZSBzaG91
bGQgYWxzbyBzZXQgbGFzdF9zdGVhbCB0byB6ZXJvIGFzIHdlbGwuCgpBbHNvLCBsZXQncyBhZGQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldCgpIGluIHZjcHVfc2JpX3N0YS5jCnRvIHJlc2V0
IFZDUFUgU1RBIHN0YXRlLgoKPiAgICAgICAgIC8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBo
b3RwbHVnIHVzZWNhc2UgKi8KPiAgICAgICAgIGlmIChsb2FkZWQpCj4gICAgICAgICAgICAgICAg
IGt2bV9hcmNoX3ZjcHVfbG9hZCh2Y3B1LCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3N0YS5jCj4gaW5kZXggZTI4MzUxYzk0ODhiLi4xNTdjMTk5YmUwYjQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9zdGEuYwo+IEBAIC0xMCw2ICsxMCwxMCBAQAo+Cj4gIHZvaWQga3ZtX3Jpc2N2X3Zj
cHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gKyAgICAg
ICBncGFfdCBzaG1lbSA9IHZjcHUtPmFyY2guc3RhLnNobWVtOwo+ICsKPiArICAgICAgIGlmIChz
aG1lbSA9PSBJTlZBTElEX0dQQSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICB9Cj4KPiAg
c3RhdGljIGludCBrdm1fc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCj4gLS0KPiAyLjQzLjAKPgoKQXBhcnQgZnJvbSB0aGUgYWJvdmUsIGl0IGxvb2tz
IGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
