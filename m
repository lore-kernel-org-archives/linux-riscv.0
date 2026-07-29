Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77C2C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXE473wpjtsIXScW9cSV2jenxRonviluJDlXFF1Cq5s=; b=rQ8ip8LfXniiza
	cXavZC2aPVBGcXKGsQHPXrVhn1HH+LWddfm725XpJp+RcUssYzsV17f/stzu3lWshsWB+V9zS1PeA
	knwNlbkf21vV/3JtfZoWGiOQSSh4Qj1LrRBKv7Djt/vqbmLwUVh5hdUQXkbe27O+DanBGxUWMeXPw
	R6xJka5WeAJg8pwlxV+huajiM0YrvFV2NEr5hsZ1iR+IaDZcovLEeN8cH/Mpk0lp3hXpRJ778PiVa
	JJtCN3K8WAOgBTdij4ZGEABsCAzCazV3BhoCO6Sc5yCT2zj+gCmHhUPaqV7BlFa45wJFC2YZyfKLQ
	CHtgMrT43vyvrtf2AQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3je-00000007xb0-0k4m;
	Wed, 29 Jul 2026 12:50:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3ja-00000007xZN-3XWd
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:50:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so985395f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329405; cv=none;
        d=google.com; s=arc-20260327;
        b=HcWVIvBhH1mEsK3V94Pa2HGwsVcYinxco1wQyVuZmqaqGc6ng76poscYEk1J5/iM2x
         LUnCP9H2AtYvtx1TcRKZOgDue+40Lk7dqsxncasHU//+LJ3Ejqn+Fk0ywp0YzclYzbzA
         NWQh/EgbIqFly7nMY5i3TjwsxPBFNH4WSKGafh4V9QbrfdohQE1AfjYGX1B2Jc9v0gf/
         LB/8WDywAVG/FU9bDuEcSOXsiyanNxoDGntDVkdytsJzP9Zkcr7W6o9LKriFxzAQZEng
         xE4XsKnp+G8lchFyVnlBhfdgICJj8v2LutbjXttl3bfaZWyxDfioLjjxXUK+RV6eTVwb
         iHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        fh=hGub2Bgi1pt5CS8LHccfl4/Rib29VfIfbMPQpBYlZJQ=;
        b=KzWzE0T+zFcaWSdDPmD0KIOdLMtjIvuXCLENBtHQ1nfyU7ZifmYPX/ihmhQ6o/KLvG
         xdY/aikm7lHoZuaKb5EvuWD2miI6IG4TTbV+wJfsuOqq3NlEi1gJN3zuQEYQ54uqRC4C
         f5++764UX68NZrwabKcTJhSS/Q5byX44Be/7AwpoeXFOzu2ZjrcdJC5VYbsQ+vUzCH5v
         ZDqbYejjodz1SjVr4KjUyc974aoabEQ+SoQNCbyDAMm3mH13sYe3cKFuv9iRwZILCQ5+
         QF/vPab/IUMJ+UNKHhhTFEM476FSMLVYhicVmLyYHWEgC8/banx+tFHqMlJdMLON0SOB
         G2eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329405; x=1785934205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=uhRDVPVv1NCEEAGf9kuo8snPPyr4Vu1Jf6Z3fFLK5DiGpy7bScuJB0unHOEjKF5yci
         1Ek2dbB2OokTpZD+CNML9HZyef6rxRy55Hnd+g58iwnouI4GLtNX2qoritf8/biVRdW5
         Z55vBbeOAF53YdImvl5yyOpj7BIXtHLmV+9NaxdbM3o0H9UW0Bmu5DRD9WNkH+xAEpSr
         EgPUx+MwnN5x3yv5zTkeGC18LYRyj7p4x+Qzjbj3qahlgS08JltufC0Pc79RhmkQ2P2a
         N/WGg//v2309AwrUAm5p0wMP1ZIu3TDZ1xiBhccDGSdVJExvxzYvMvw6gSB/Yx45caYQ
         F62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329405; x=1785934205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=a0lhmGnCcRhxKmoa0NmqSba66mcl9jzr8H9skos+IwgZ2YDhDuhIavKNmUgALW9nqC
         AYF9JHRfui9EtRSI+th6+wIKbTFcV8cNI6sMuZKAXlgMnxCLYat7cacqtkdA2pmWodBJ
         VGRUhLwgWCxsiLdVUFiVRMdOrNDOK8UXAatQ7GR/LKkmmMnM0KsiC+2myOL/W5+g4hYZ
         4I/9Z3li3V97Cf6iCyg7D/ZgPHDxmLlnQCmcHc4LlHP2mvUvzFnvEvDLao2WqPkvH5Jp
         8yX1g38vV9QfFVIbMj3KijbONKRB7LzQNPtkVkWv/sX2KKgwO/soIXh3pPSyDmw49EEf
         6WMA==
X-Forwarded-Encrypted: i=1; AHgh+Roq4BzTO6HrJ5gzZN5EVzULLUVOphOY7yT/il7+WKpe6repX6z0aCDsreSaTDRnwfiyiJTi/6/MQqEdkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb2BMLW3GkLvLdeWo80G9tZCKMWjAoh377y0k7Y4PvQsX+5Mu5
	HufP1HRo/BeANq+MMfxonqJfoNQ2Ts7VtjBlIPnl84qDKvpzXJ+6lCXCeZxxTCVsE9T4By2dV5Y
	cHlf1sBofVNrb0YaWg6wI54Ok8xgXu7RI/ZSpk03u/A==
X-Gm-Gg: AR+sD12j+rAkBT+EMquDgV9u+sxLiuLS0hzEMkfkfST2v2xTaUOPG+FHJ/JXU6yapPD
	xnceKyvXM4n7E6sts6jSSsi225nO1AvNBQQrxwgxejzGP60CQ7jfaULf0ob2Me0DY0tlOOOTh3v
	11oTeDA/QFJosy2KKtxJOqjNThnw3QdC2l/wPDsZqyKcn60ZRzzRANVZWzUgieVllz7BcHHWG0G
	93JzG2qSMKLYd+pFxSjwPyayJu7MacmcE6wFNE3mc/MkMftFgVAenl4e63VNfC/EsVZru607x7f
	xS4xgY+dv+qR9ebRWCChzTTQCpM3r8bE/8jzJmZNaQAIlnp6NilJSeEiJmjJcH145L0RC/Mn0aI
	V27gbXCOSlXY363Wvvmenxu71obISq9P9mJVfSBOYJ0ELIFIXXWURGGJBacqUh3Q=
X-Received: by 2002:a05:6000:4310:b0:473:6e8d:7f3 with SMTP id
 ffacd0b85a97d-47fb1e8282emr8113564f8f.1.1785329404905; Wed, 29 Jul 2026
 05:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-4-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:19:53 +0530
X-Gm-Features: AUfX_mxIAIAYLjpHcgaD3ozqXoaXRQtjaEsHbcis5uT8wvm3w9BPM7ZLbion2z0
Message-ID: <CAAhSdy2xe7DBRY0bhM1S0G-6ebEEi5y0x9fS3YFUC6D7bN32LA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_055006_894204_C4157A5D 
X-CRM114-Status: GOOD (  12.51  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBhcnJh
eSB0byBhbGxvdyBLVk0gdXNlcnNwYWNlIHRvCj4gZGV0ZWN0IGFuZCBlbmFibGUgWmljZmlzcy9a
aWNmaWxwIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVu
ZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5A
aXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5h
Yy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgg
fCAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL2lzYS5jICAgICAgICAgICAgICB8IDIgKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmgKPiBpbmRleCA3YmJlYTg4MTJkOTIuLmEyN2RlODUwZmE0YyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiBAQCAtMTk5LDYgKzE5OSw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9F
WFRfSUQgewo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkNMU0QsCj4gICAgICAgICBLVk1f
UklTQ1ZfSVNBX0VYVF9aSUxTRCwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBTEFTUiwK
PiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0ZJTFAsCj4gKyAgICAgICBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUNGSVNTLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2lzYS5jIGIvYXJjaC9yaXNjdi9rdm0vaXNh
LmMKPiBpbmRleCAxMTMyZDkwOWNjMjUuLjk4NTJhOTFmZGVjYyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9pc2EuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2lzYS5jCj4gQEAgLTY1LDYg
KzY1LDggQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7
Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklDQk9QKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaSUNCT1opLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0NSU0UpLAo+ICsgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0ZJTFApLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJ
Q0ZJU1MpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ05UUiksCj4gICAgICAgICBLVk1f
SVNBX0VYVF9BUlIoWklDT05EKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaSUNTUiksCj4g
LS0KPiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
