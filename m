Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55F1C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I81ffLJBRyvUGaclGRMnpTqeCls3KIhYflSPhJgntrA=; b=hCxdnBOlBI6t7t
	/sLchbOOHvE1dQOii2RNrGuCyE3mG4/zmXzswgch+vVf5irWRYj6UzVBP+mzeUCFGztP/MnP0a/J/
	wDUhn93uQHlT9l/B1H/T/qUX79SupQu2Vf258BZ7OObMwYhAB4elocBg7967Jme5DJLv3TixNB2zC
	bNIaHsusgZL6mipbA8Jxy/rTzTXrcorZT6XUKxj9g9PfBWoa/OGgcvCKj1s3/bs9bAta9i36mg7JJ
	IZYWwbkX/mIVdIoCVKhp7G1SIrWRLIou175e9svxuml3Temi8nW9Uwbm3rPRCvGUdPHBPShCm9fIm
	8ubuBqPlZXHU6hiJscBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW1fc-0000000DcSg-1lv3;
	Fri, 02 Feb 2024 22:06:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW1fZ-0000000DcQj-2cHd
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 22:05:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a26f73732c5so391697666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 14:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706911555; x=1707516355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=KQt/wQ9vYCuAUBcmaY1T0oOv109Bau7C4RU4cAVesXNwghO0Z3qABLURzryktYvWx2
         GHCvOzpAIWUhtkf3OTjSAiEVxlCtZh6EMPqveB4vW4lS7+one08DA0oz7pURxTgtY4Hx
         x7vMzVbzt3M+OMEnm+bzr1gKslWBjKahZPOLSBhC2Nw350drFqzZKZ5XoiwBEilVI/7x
         Su7IHXKbxbJgQUAoW1aEPiae0GvILVhsluDTPufMB1lXE9lVRZDEaA5uCX1lTt9EEr8i
         cJus06su5SCs3+yOZSKjZdah2JmVc69jGCmELSRTp5t5fY8kr/Ge7agXd4yEmEwIAeon
         RFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911555; x=1707516355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=EjjJL7RWZHdxy0UHFFcxpeCqDVRzkYOQVKlzjhk8M93ztyo6SDWLK71qWiK/8YjbyC
         HaoyAWOEPgQyOSfDmtK8Dec/l7+iee323uIDhLnUB1bo9CJIYOpePM8Q7dFatXxTC5At
         +gVT0gXtY3Y9iP2miNb5nitbbkR+7u5XyyzMZVCPMe84ZZM/Imvf4ztfQevQIaQVfwpA
         x2YKjPUwyleccPf0LQ9KlTBaaV4d29MDMepuVJq/X0BO11x/3R7VboRUiwUgPG62Kdtr
         npI/0fnz3pPpZnO7Qe5yP+5EU5AN0zvHFF0lk7f+5xZJkpSJHaPh0oiIWL6sqPi9Z08X
         UHAA==
X-Gm-Message-State: AOJu0YwLgaO4EMimiygq9wGwa86DcHwwzviNcATF+29Mq4mR+l536U36
	CD7dKmGEakS/SkYmi//I7Un64rxHNTfu05CdoAukEMtmhgHYY6nkdg3JXByv4HKi/DEe7dT5Hbl
	5pUQA/msEaiePwrH7S/S6nihp/MDz+snPbphhWQ==
X-Google-Smtp-Source: AGHT+IEdra/txPxsHeiEZSIqeLcoax0q8b5/TdMlKdrQpsLC9Bhy0DO41JjMt0QszL6IyZw4hoGkwwrYDp1u0lZqAvA=
X-Received: by 2002:a17:906:2455:b0:a2e:94a0:93b4 with SMTP id
 a21-20020a170906245500b00a2e94a093b4mr4841883ejb.61.1706911555736; Fri, 02
 Feb 2024 14:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea> <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
In-Reply-To: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 23:05:44 +0100
Message-ID: <CAHVXubjzpTru3Tn+nmv=GwG0YWxnkeYYT1KOJW5a27H2EDAZ0Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings with Svvptc
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_140557_890198_F335CE8A 
X-CRM114-Status: GOOD (  19.69  )
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

T24gRnJpLCBGZWIgMiwgMjAyNCBhdCA0OjQy4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIEFuZHJlYSwKPgo+IE9uIFRodSwgRmViIDEs
IDIwMjQgYXQgNDowM+KAr1BNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgMDQ6NTk6MjlQTSArMDEwMCwg
QWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiBUaGUgcHJldmVudGl2ZSBzZmVuY2Uudm1hIHdl
cmUgZW1pdHRlZCBiZWNhdXNlIG5ldyBtYXBwaW5ncyBtdXN0IGJlIG1hZGUKPiA+ID4gdmlzaWJs
ZSB0byB0aGUgcGFnZSB0YWJsZSB3YWxrZXIgYnV0IFN2dnB0YyBndWFyYW50ZWVzIHRoYXQgeFJF
VCBhY3QgYXMKPiA+ID4gYSBmZW5jZSwgc28gbm8gbmVlZCB0byBzZmVuY2Uudm1hIGZvciB0aGUg
dWFyY2hzIHRoYXQgaW1wbGVtZW50IHRoaXMKPiA+ID4gZXh0ZW5zaW9uLgo+ID4KPiA+IEFGQUlV
LCB5b3VyIGZpcnN0IHN1Ym1pc3Npb24gc2hvd3MgdGhhdCB5b3UgZG9uJ3QgbmVlZCB0aGF0IHhS
RVQgcHJvcGVydHkuCj4gPiBTaW1pbGFybHkgZm9yIG90aGVyIGFyY2hzLiAgV2hhdCB3YXMgcmF0
aW9uYWxlIGJlaGluZCB0aGlzIFN2dnB0YyBjaGFuZ2U/Cj4KPiBBY3R1YWxseSwgdGhlIEFSQyBo
YXMganVzdCBjaGFuZ2VkIGl0cyBtaW5kIGFuZCByZW1vdmVkIHRoaXMgbmV3CgpUaGUgd29yZGlu
ZyB3YXMgaW5jb3JyZWN0IGhlcmUsIHRoZSBBUkMgZGlkIG5vdCBzdGF0ZSBhbnl0aGluZywgdGhl
CmF1dGhvciBvZiBTdnZwdGMgcHJvcG9zZWQgYW4gYW1lbmRlZCB2ZXJzaW9uIG9mIHRoZSBzcGVj
IHRoYXQgcmVtb3Zlcwp0aGlzIGJlaGF2aW91ciBhbmQgdGhhdCdzIHVuZGVyIGRpc2N1c3Npb24u
Cgo+IGJlaGF2aW91ciBmcm9tIHRoZSBTdnZwdGMgZXh0ZW5zaW9uLCBzbyB3ZSB3aWxsIHRha2Ug
c29tZSBncmF0dWl0b3VzCj4gcGFnZSBmYXVsdHMgKGJ1dCB0aGF0IHNob3VsZCBiZSBvdXRsaW5l
cnMpLCB3aGljaCBtYWtlcyByaXNjdiBzaW1pbGFyCj4gdG8geDg2IGFuZCBhcm02NC4KPgo+ID4K
PiA+Cj4gPiA+IFRoaXMgYWxsb3dzIHRvIGRyYXN0aWNhbGx5IHJlZHVjZSB0aGUgbnVtYmVyIG9m
IHNmZW5jZS52bWEgZW1pdHRlZDoKPiA+ID4KPiA+ID4gKiBVYnVudHUgYm9vdCB0byBsb2dpbjoK
PiA+ID4gQmVmb3JlOiB+NjMwayBzZmVuY2Uudm1hCj4gPiA+IEFmdGVyOiAgfjIwMGsgc2ZlbmNl
LnZtYQo+ID4gPgo+ID4gPiAqIGx0cCAtIG1tYXBzdHJlc3MwMQo+ID4gPiBCZWZvcmU6IH40NWsK
PiA+ID4gQWZ0ZXI6ICB+Ni4zawo+ID4gPgo+ID4gPiAqIGxtYmVuY2ggLSBsYXRfcGFnZWZhdWx0
Cj4gPiA+IEJlZm9yZTogfjY2NWsKPiA+ID4gQWZ0ZXI6ICAgODMyICghKQo+ID4gPgo+ID4gPiAq
IGxtYmVuY2ggLSBsYXRfbW1hcAo+ID4gPiBCZWZvcmU6IH41NDZrCj4gPiA+IEFmdGVyOiAgIDcx
OCAoISkKPiA+Cj4gPiBUaGlzIFN2dnB0YyBzZWVtcyB0byBtb3ZlL2FkZCB0aGUgImJ1cmRlbiIg
b2YgdGhlIHN5bmNocm9uaXphdGlvbiB0byB4UkVUOgo+ID4gUGVyaGFwcyBpbnRlZ3JhdGUgdGhl
IGFib3ZlIGNvdW50cyB3LyB0aGUgcGVyZiBnYWlucyBpbiB0aGUgY292ZXIgbGV0dGVyPwo+Cj4g
WWVzLCBJJ2xsIGNvcHkgdGhhdCB0byB0aGUgY292ZXIgbGV0dGVyLgo+Cj4gVGhhbmtzIGZvciB5
b3VyIGludGVyZXN0IQo+Cj4gQWxleAo+Cj4gPgo+ID4gICBBbmRyZWEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
