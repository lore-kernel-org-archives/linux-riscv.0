Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22C9CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suLg30v6auzZSJTSGvJDqZs7H2TkJCD2SdEM6tEafXw=; b=L+fJxN2sLHT40U
	3TJNhiUZL//NTYoIL4bZIIUc5pMU4/JLcg3IKIT+nQxYGhPBe/Eq20Y/Eu5BP0tEpuq13ArMoQgkv
	EEBknv+vyJipRa3SnF+SaxXl+Ir9dwy9rcuwfKSq6FNCqtoY9h7FLnYrBca3tv7ChPrO/mh4c9WJg
	gMc0Jh5LLqqsA4orAIy3XbGWi7iQjne+0A9K8MhHtLCWOs+Bse8EP53jBjwgyyuVhIDbVUo97sOW/
	d3ons4QLopNaezKQqhMCJyfGYxSlqKocUPkuhFW0cIXxnqLG4rXXpyKrd8VS8/bFxeQKGd3Z9U7Do
	H/keZ4XPwp2zSqOwNsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgJ8-0000000EVlg-3ZYY;
	Wed, 03 Jun 2026 07:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgJ7-0000000EVkp-0f03
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 07:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=; b=rbvIVbT9HXjcuc3Ga2Dybu58ud
	bR/pwuGchxjz42ODWK5J8rrWKdjoHz7A7Oaso/J1lKOELeuU8EHE5yRyoeTGgw+hG2azJRKaU/+Fw
	vAb1iP/ZgbsXAiTdoiXwIvMXjh2owRJ1L4Bd5M3cdaqIqG1lrno3kGyAUVwTd6EFfaCE2u24eX39r
	Mz6t1REwYJkAe0d+pt3/ZFjA7aQ9o+8nXHIoVUS2EoIzZKlLujiaXcxDF2eqAyJz/tDe7LcIslY3f
	78OWaonBCUJsudQ7KmCpyGfgP02XKCY+ZYi9MIcRTVrlMJoIpcM+CsAadLzlefEQCvAQwN5mn2miA
	EiBf4Oow==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgJ4-0000000BTHq-0uA9
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:46:32 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e6d991991dso1300614a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472787; cv=none;
        d=google.com; s=arc-20240605;
        b=WH7b9oawA3TabIJZz031AQhP8rf3dIaXUPblh2Pio1n89FkgF85KMGgMzfIJo+MRqU
         /zD6B3yWuezeaUt28W6pB2tBsgS3DlpdjvBIfOoBC7Pi7GD+qp29PCyrqjIGTfMX4BoO
         KVG0TMRMHLS9vdJYHw1rFo8bR9C9Lj17BL9XIikCu8dG+BQKas3TPJ7h+pW/1+Y4ILJ4
         gAzPnjmbKFNBm/jbqLZsj+qFtluvqubPhZaKM0+H7t1611RgXZHaonkhMmBP/sYZOhXD
         BB7/KBJP7LZnIWRtRunMSZyQJvDBikUrcegGI3ZSUk6dyP2agHyBtNnSRG8lPdnf+RcX
         5POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        fh=oZ3HkGnp33Q8n0c2lop9NhiXjC3IDE5bSzW0zFPOo4k=;
        b=BhNxBDIQrmwD5xahQtpvkx+rDpcxkp+1guo249LjLeRj8m7hJPpFdDVq1mswcg5F53
         0xNj2ik0vJXlpPex4nnCAP7ONlUjd54b5b+M00NfGwdaf/XQ0wPhRYx3JqyUjPUgB+ls
         4DjkP0rMQ/vgLIukd/rcRHZT1V/1kLpcJeXarb/OOZmnTaOSJbLzZ76rH4Epssjvgz5c
         JObGjuEVImPOMAt+b0+qzDObXPeie7+9aEzd/wIZ3lhM943UtxBTyHskjC8MMWNGhOdU
         KDYiDM+8eCfFWIauASeetlPHUaetgJj63uGfUZgNK5L/9kRvcWrsLkZI3SR2pogvDglZ
         /4gQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472787; x=1781077587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=yMdfA573b4Rl+JLvXEfbmzB6r2za4AYrtcbvI22t9Wl8dr71IR5JN+RnOjBh740kC8
         P67bX24xJmRvDmvhX8qX/miWS+ExS43lBQdXBka1/z69XM3pK8MvAlHXvt1w+AiXBUWa
         1kJ0TdGmy2VeFyQg/siS90KAKx1mi54ycHSbipItpe38h5zsdt9dkFO9n5tUBR7f+Nv/
         NMW9wx6oJDKi88vFHTR6JJIIwfnv1EDXN7n/Ibz4ViAsJrzZkFc34Dl+3j/tVzCMJBHC
         HUJTBN5kMD7yraSIRFiiqAy5ch9eWqDgDjZ3tqI663G5+xkUnRFJoX35znDghXy993gh
         MS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472787; x=1781077587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=Xa32BY/b2yqywR1JKjxZeR7wwrfE37I2J5Bjk3/+jGqbNDcgRHT4nBQSuWoUP6sWzL
         6hXOo5xL8KAN1mt49O6bnyCRHk9bngFmVhOX6w72yhhOPw03CW+xqBQy15Ek1ObzTKqA
         5TFgj8rFxPP73P4QquyiKI+RY9S80sPtuUT2ebU6RROMCjI6h69prIz4VfsIJS14qRoh
         09c0q9b7XfdLFGvUSg0Ir5yP7AGYNjQPT/AuG9nb4M6FOr0u40OGIm2PmWiXnNhQF3v/
         0nvtyK8XC+8XUdffTuEbJf0rGHVEIKYZq4IkxoKqVUsX3YqBY5JRFG+YCBeDKtmAERPh
         gJiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R6Zutw3iksV7fs/Q7kVs0aJqfZnBPNbkjn5Qv8wBtxKC93uvJYA/gbWPslIt+8Ehi5Q0+i7vraFx+fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSHMcxOfxqvbAnK74xnRwsJPciS+LQ441cr3Kb7y6+7rHNShBu
	i2MGy5OJiojI7gHoZTURKn1l9U89+uIfRNhn6Nfn3vmWMLSlV5MsCAg/hSQcSnwitf1QjkIKdcC
	PofKubK1Z/nxM1Op9sQhLd+cl+K0SNVPiHMbVNDqHrQ==
X-Gm-Gg: Acq92OFAm4PlKBOBmF8Ia08b0PzJM77/ZQW+DfF1k4U3UJ15CZvq8e3fIERnQCz9jgC
	spbqfNYtofk6coeoLs/4pfChazN9mnmZXD24I4RtkpKwOuRaTfbTxqT57tsNtO/9J8yTpNEWRc2
	FJm2ocNv/PC+QNHLYPtwtC+PpFQNrVFTMKvQpYYm0oJXZkdDXwrss8ryKdM6Uk7QEMYFe36h0ni
	sbFIggA+VhHv64eGcgdbCwLl2ckRUo1C8FwNA78WrAMq4Y1Nt0Gxb5ZRcCHUz0snRm2KJ+BABpV
	Sp4jPHnILZ9dNzdjCtkCAq06YJccMD+5oVKvSwQwN+/JAs+zoxiCZ5cqiRFuHz00Qwiu7c8OhRE
	DpdNBgLS8fqORAIupIxpHdLL/9nloFhg/UCKDHA==
X-Received: by 2002:a05:6820:a113:b0:67e:eb4:238f with SMTP id
 006d021491bc7-69e47ebb7c2mr1148163eaf.18.1780472787482; Wed, 03 Jun 2026
 00:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260601084336.2601675-1-inochiama@gmail.com> <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
In-Reply-To: <ah1pgb4S-UoSWhC_@inochi.infowork>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:16:14 +0530
X-Gm-Features: AVHnY4IXk6Xj-7gKzaesDTTCYZDI9ERPTRAVFn1Ta5l01WccpSIZ_xwI2pHLbD0
Message-ID: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Sergey Matyukevich <geomatsi@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084630_508745_83FDEA51 
X-CRM114-Status: GOOD (  13.90  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCA0OjQ24oCvUE0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAwMSwgMjAyNiBhdCAwNDo0MzozMlBN
ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVu
c2lvbiBhcnJheSB0byBhbGxvdyBLVk0gdXNlcnNwYWNlIHRvCj4gPiBkZXRlY3QgYW5kIGVuYWJs
ZSBaaWNmaXNzL1ppY2ZpbHAgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCj4gPgo+ID4gQXNzaXN0
ZWQtYnk6IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiA+IENvLWRldmVsb3BlZC1ieTogUXVh
biBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiA+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhv
dSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3Rv
IDxpbm9jaGlhbWFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIHwgMiArKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL2lzYS5jICAgICAgICAgICAg
ICB8IDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPgo+IEkg
aGF2ZSBmb3Jnb3QgdG8gYWRkIENTUl9TU1AgdG8gdGhlIGNvbnRleHQsIHdpbGwgYWRkIGluIHRo
ZSBuZXh0Cj4gdmVyc2lvbi4gQnV0IEkgaGF2ZSBhIHNtYWxsIHF1ZXN0aW9uIGZvciBpdDogY291
bGQgSSByZXVzZSB0aGUKPiBnZW5lcmljIHN1YnR5cGUgb3IgdXNlIGEgbmV3IENTUiBzdWJ0eXBl
Pwo+CgpBZGQgYW5vdGhlciBDU1Igc3VidHlwZSBmb3IgWmljZmlzcy4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
