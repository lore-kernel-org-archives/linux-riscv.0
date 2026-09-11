Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE4AC88E45
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2szB/hliDPkPtToE9Whgu/4/jSvtOYBsO06FyEiRjbI=; b=M3EsEOlgKzUrFe
	+/8Om/0JFuH9tD3Eqn/LZXNfMVUuSYowmio7bdUmE53pwaENTqClJXyaO1YC7lMzpl+XHL5o5gBp7
	K+8lh/OngfxD2Z+cORemJoOUmsVCQ3uWCD/5D5vuJGzhECGoMjRK+TTcLkHti9cVBdRstJizKBsNO
	QkXVvlL6CbdU/BZKQjmlOzuUbFb/ksFe6W3mEl3/dFgVpKbnGxKK6sGvVMQPTnOuGHOFi+hwoGuV1
	wK/bAr4KYEHpXJVnZPL2TyEwJbIpBZBsLJeJOS7NB4IvGhPMO7dpVCYprogS/3BvOqcoJw+dBhzfM
	TJOZKzidSBRRNY2NsWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcp-0000000G0yb-0zX2;
	Fri, 11 Sep 2026 07:24:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcm-0000000G0w8-146L
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48436216a98so336519f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111478; cv=none;
        d=google.com; s=arc-20260327;
        b=pXIC6T4FFylFTqZcFrdP9F0sJYY0sX49aV5Wae8D+rdPzZyH6D1zsPoFw2k+0nGRN9
         HWv4WUVmcWWyYF6yZf8qA9Q1luFZeORP9ifTN1ap2mrbFMGj9G5sMot/C6xN/ZAC2rRO
         9sHoO2xdtMUHPyXeTXKID3opG0ZG1F4kAbNW7/oxXzWU69gdasdbs4MeWPPbwls29HdN
         9FrgQyNF8c9KyoQ7Sgk2d0qwseb6KLT55R62N9MAxEvzPKyXw8wAnGEcCRuwmJhFnZX4
         Qt3MenYwhF/YOMGSBopvqdXNyaoqVGbXFXzJRts1602beHba/lsJAVDG3+EOQu+ADnq+
         eNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        fh=bm87SBwIhIMpAArfyZ+etUp8q4YqsbODGET3woNobcI=;
        b=a7nPFE/JDRG5gj5UQUgr97Zp5t7mCLbO2Baw0woIgkQ04gPvgR3alIF7OuEvl4vO9b
         grELDX1ho62kCAFFGi8fZ9r8tL/bhZkltyBCtvRDnkYa0ZEqmxFn8mtH1C+ofKh9wTQt
         I/AuQ4VQicuVM6xhs61bXEHu1z+d2/pltILeU2YorznCRuI2pT9UjuDVlhJW3tClBC9w
         Odb69aM73XzIB9svVGIUAn0SJMNnOGVXcvml/AfBSp0TlUXVBC4NjC/qto7G3xvlNSbh
         1/RFzk1laVHH9ND1A/BHru/eDqABJgXezMvvquhhr8Ymt5N3XjRGkRFc1LOV4xXt76PZ
         cubg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789111478; x=1789716278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=U0JvGDzeGsslVqBcmTgaz2nvSwJszExjP1uRkUQPJyY2DezQ9+yNPcOYimD6hR+kQ2
         HnDQ+E1geBmjxlQVUK+0Oy9e1JufaMTIxJ6QdC5ezPEUoI8z1nLuGKL0NaRVQxuhbwqg
         CR762DT1N4rlFugrba3ro1QMjcwkltzn9TMpvyWHSz3CTey/z3cBjI0AEpZtgR7UJ3A7
         VCb8wz4eV4HEytpMiBagiCLbQ3ufw/w4xU9tJfFPv6vOa6lrAOWZJSGGIna9yAtk6NEP
         D4NiyqBpbMn6p6+H5v1T3tHMWEkCu4WjQbm4OBCLxnJ4J80fyUy7H9+AVYXgsoxWX5H4
         LTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111478; x=1789716278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=ZBRlujtCAEL78Qxixc6CW41u3UqTT2btfg8IepftD9wsHE7OV03awXsQ2ONhTRAMcM
         o5WoOkgwwaahWj9kvgmBmH3WoBUBk9uxj8zijCGSXZ44aBsQaHd5h0n2b0+9pDsqNeyo
         WmIPApgGURFIHAkwRbGiMFAQS2/pLU7ZebPdE+WkZtJVuTTsc76C2mR9p9O67YFzg/KN
         bvAS2jFdJNNeuHAhUY8oUJj9wLSxNiVSfGHWf5GZ2u5kfW6OXJyPkDQcTGkHHCKhRMBk
         Fq1dSjO5X8CzM1Pzj2mmWvtfhQZLRVG/b04oSLxy4VIG5bjlN18O+FqJEBu1RugBNLDR
         0wcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYUzWQqpCnxgg/f2n99KT1YD95be4EWHmX43x6V7CSDMZUkGQpln/lPLJWccpfXjLIvLnMMGFrYWtUQQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kbER+jPys4YVfrYhIgVQC1L4o0jqsPp7N1zhvJI4dc124tT1+K
	80AZrHr1YfrMlJNLZGeK0jxdZm81onIS3KGMoUZus1ncD5ZZdoSDJK97yi+fa/AdPPP+Kej86vP
	0gfs1HqY7hpxmxEub3LQQeQBK2KUZL3YKCSjmF3y7dQ==
X-Gm-Gg: AYBFou1kFNPdyXNVHBsBNdmSxBPnBtDpOM5Ixw8qy8AUvUgFbfiC68LO72QVSGdhYeK
	3+0/70nuMnjXyvnlScoaf7vlo+chvFZNQTzcKsqG1sWEEqv9AvlcEhJd6JHiPnyuYZMe503pJyG
	ZZeISMCvKjOZh2jiXEqJsOGdCqWIKW1Dsfy281xX0rL0OO9EcR+Wv80PmoPa1+tMecellRaecTS
	Km8Gpzhuy9APQn5reFxD5IiGeFOD6dqpkXocrZyD8FCTO8NbQmYDyU35oRMXEGWw+wtK6TSyBS5
	6wpLl6TbgdpYqmx1mTIbmUboyK44RWNl6Pwrvpvn8QcyEfcyJ2sOtmbPanWaufu4EtOjBrhDFKt
	HunWnrKZpCqYbXz7cHNiACr6dArANVJDtBT3sc8xfJaBsftzZZAYhKvOisNbarxRfuX6gjC8vLw
	==
X-Received: by 2002:a05:6000:2005:b0:485:9233:a5ae with SMTP id
 ffacd0b85a97d-486eafd5eb0mr3126572f8f.3.1789111478364; Fri, 11 Sep 2026
 00:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786512671.git.pengpeng@iscas.ac.cn> <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Sep 2026 12:54:26 +0530
X-Gm-Features: AcwNN1UilFvQBMBFE1D37iU-TcFZA6Ymj5ixovFg4tSLMmtpRh77_3nZieaFccc
Message-ID: <CAAhSdy2gxgY6yjQRVhgwV2kLB8ZGwsuseOVPWF6KJsjPOLeP_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Guo Ren <guoren@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002440_315931_057133C8 
X-CRM114-Status: GOOD (  15.38  )
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTE6MDnigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEtWTV9FTkFCTEVfQ0FQKEtWTV9DQVBfVk1fR1BBX0JJ
VFMpIGFsbG93cyB1c2Vyc3BhY2UgdG8gcmVkdWNlIHRoZQo+IHN0YWdlLTIgR1BBIHdpZHRoIHdo
aWxlIGEgVk0gaGFzIG5vIHZDUFVzIG9yIG1lbW9yeSBzbG90cy4KPgo+IEFJQSBpbml0aWFsaXph
dGlvbiBjYW4gc3RpbGwgY29tcGxldGUgd2l0aCBhbiBBUExJQyBhbmQgbm8gdkNQVXMgb3IKPiBt
ZW1vcnkgc2xvdHMuICBJbiB0aGF0IHN0YXRlLCB0aGUgQVBMSUMgTU1JTyBkZXZpY2UgaGFzIGFs
cmVhZHkgYmVlbgo+IHJlZ2lzdGVyZWQsIGJ1dCB0aGUgZXhpc3RpbmcgY2hlY2tzIGFsbG93IHVz
ZXJzcGFjZSB0byBzaHJpbmsgdGhlIEdQQQo+IHdpZHRoIGJlbG93IGl0cyBhZGRyZXNzLgo+Cj4g
UmVqZWN0IEdQQS13aWR0aCBjaGFuZ2VzIGFmdGVyIEFJQSBpbml0aWFsaXphdGlvbi4gIEJvdGgg
cGF0aHMgaG9sZAo+IGt2bS0+bG9jaywgc28gdGhlIGNoZWNrIGFsc28gY2xvc2VzIHRoZSByYWNl
IGJldHdlZW4gZmluYWwgQUlBIGFkZHJlc3MKPiB2YWxpZGF0aW9uIGFuZCBwdWJsaWNhdGlvbi4K
Pgo+IEZpeGVzOiA3MjYzYjRmZGIwYjIgKCJSSVNDLVY6IEtWTTogUmV1c2UgS1ZNX0NBUF9WTV9H
UEFfQklUUyB0byBzZWxlY3QgSEdBVFAuTU9ERSIpCj4gU2lnbmVkLW9mZi1ieTogUGVuZ3Blbmcg
SG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZtLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdm0uYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZtLmMKPiBpbmRleCBhOWYwODNmZWViNzYuLjY2ZWRmYWE4NjI0MyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdm0uYwo+
IEBAIC0yNTAsNyArMjUwLDggQEAgaW50IGt2bV92bV9pb2N0bF9lbmFibGVfY2FwKHN0cnVjdCBr
dm0gKmt2bSwgc3RydWN0IGt2bV9lbmFibGVfY2FwICpjYXApCj4gICAgICAgICAgICAgICAgIG11
dGV4X2xvY2soJmt2bS0+bG9jayk7Cj4gICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJmt2bS0+
c2xvdHNfbG9jayk7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKGt2bS0+Y3JlYXRlZF92Y3B1cyB8
fCAha3ZtX2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSkKPiArICAgICAgICAgICAgICAgaWYg
KGt2bS0+Y3JlYXRlZF92Y3B1cyB8fCAha3ZtX2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSB8
fAo+ICsgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXplZChrdm0pKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHIgPSAtRUJVU1k7Cj4gICAgICAgICAgICAgICAgIGVs
c2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9IG5ld19s
ZXZlbHM7Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
