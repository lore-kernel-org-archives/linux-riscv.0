Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5CFD20680
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg3UnwLBwS3ry+xAnMZX1lbhzTgCSGJWngkTnk2KkEs=; b=V+TPOBgty4Q/Nb
	+iO76jXNbH+CHfNuEkUdD6XPv9ZhCkQMcIoIoCverEGcSepUj05CHkTApd7McRP9z1W20ppcUFCcC
	JUppHiX0Dn0tFdcX5nCYmZ9ckC2EjWXhDYNSigR5X7SkQko/sXoeh3jomeI4TPr3UCy7880hKm93A
	h+dLgsmb1JJmjND+KX4d+Qrwb6iUkGnX5CFP9gVTAUQuiCbUpSyr+DYxKPQUCvqo4wG/rDNwXEHbA
	G0lBBOMmS++so7ENjuuKKua190yjaxn9nk2kwRMBkC+qDZkCyKhIfQRmTp97RbKrtRHix44pQKko9
	sJsPsCWhiq2Q/VmGhDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9CB-000000082X5-0fAY;
	Thu, 04 Dec 2025 13:16:31 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9C9-000000082Vi-0RV1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 13:16:30 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-345658375c7so96098a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764854188; x=1765458988; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG0EewGU/m3seu0dnYeXl0q+SbDSXR6KqjikfXMh8A4=;
        b=fNPXXJSkVyVvKSCxa90mAcmgSccSkjNNNSAcWfEtND/Y4CyFsp5BpdsOR8OcimeUi8
         qISTIOkKgrcMMy3TMOKYlxFvkntbLT/qr0EfmL3UYszENRlqTtFQjTXRwxhS0UwdG4Ce
         vTrK8/Ix1pajMTVF0auN01yedCtRWxGqxK/IKCpvqUWSyUrkA3EOaoMuGYbfh5FlXWFA
         NDLyEaAirQwzYdk8/Vk1d0VVH9u7i1XbIkDsFNAQFBcURhbt0Xql5B/VDrRr1QWY3HXI
         TpNht0PZfX66+7iQCqx0tTsKCHluc2aOXxvDZjwc4iSztfBSYaRpATtkcHHu9VLly+62
         9S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854188; x=1765458988;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG0EewGU/m3seu0dnYeXl0q+SbDSXR6KqjikfXMh8A4=;
        b=ZEzH2fqJJz0xs7HQpIqyrYDP3iZ0jAnU/LtOB86DNDgEUxkhysNu6E+w/VxwR6uWKl
         zBh+8r06ItvR55N+nVtXMGOF+FqugxsVeEJK7cv/WrbJyRDxds0rDN1o3GwzfQsOC9xP
         PhPrg1GUyCzKA02zHIJsVk6YdZYY7GbnwCswQduLiEgRqr+TznXTN5VAjAyVVHDkCJxd
         PiaPxOrcVnJdA6eKXrGLd6O4ktPEkAQX1N6efwInhH2qF0p9sWRvwT8vbDOKPXDWcwAk
         mOtKbTc9bdbKEqxMXgUYjHKdiC6pScbvrY1Na4WC+4MHpLFQN4vxXoSJCPTTW879wuPY
         HB1w==
X-Forwarded-Encrypted: i=1; AJvYcCUewuCb4xxB35zXkSbx08d7UGFmIuDmFe8etuAjcqIlRS0odthD74LjMmQwqjoyfjEd8ENZnRda+EGAAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgwZMbz4SkX30Y7yIa63JiR+A8R4dT0/tBYA49wbZZ79wBZn0d
	tqeXw1ZLHMwQunkpqXiP8gdTO7P9HuU55Odu7ZUUwiXR61j8FMn9Wwc4UWRihFATRKs=
X-Gm-Gg: ASbGncsrLeENb8RPKPk2Opqwhhh6o2GT3snoeBy/iAcmQD01Lw/zfN6e4Gogt/5Icqg
	Wh4zGQaaZ80AESZ2a7vOEVATlnGOFTU2uVev1O8OizSDjYN/AjGG32njKB/txtskXoGNMFom2Gw
	5KQC6itzkR6Au3IUpTbRBcl4EH4Z/KnCCutwkmATTKNjbgW9oL0oV/CJzccIe6LGqigZ6FVfYyM
	oqpqvrlBlUd8ndusDy0L1kW4jLZaeP77sfQi8zCGsl5YgD68El4VLfIBlw5fciXgWF/Nv80o1Fz
	nSH3kaDUI8/8kIqVNSZjGeDnVweIWl9gYAM9rH6SbhsNd+bR/TWeOOvj2etnGxsWYJL7awzzMhb
	4GYt7MEh4JdBtmp1uHM5TVLXKcfwZ94vRSOImnbf0wX42GibDqqiSzOBr2+H0zNQ4BIzGTcyzr0
	UAlHiqfcp5JQWENZ94gWwjzXE=
X-Google-Smtp-Source: AGHT+IFrB7/13g+70t+q6Tfh05eJRWVooKVrov8IamBiYIRpay1PS4xRXZ4UfhLRB6v8AGDznuHK1g==
X-Received: by 2002:a17:90b:1c0a:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-34921072ea4mr3001865a91.1.1764854188145;
        Thu, 04 Dec 2025 05:16:28 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3494f38a27asm1890893a91.4.2025.12.04.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:16:27 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 04 Dec 2025 22:16:24 +0900
Message-Id: <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Cc: <conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com>
 <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
In-Reply-To: <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051629_151287_6E931FB6 
X-CRM114-Status: GOOD (  14.28  )
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

MjAyNS0xMi0wNFQxMzoyODo0NSswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMjowN+KAr1BN
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4g
MjAyNS0xMS0yN1QyMDo1MzowMiswODowMCwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+PiA+IFVzZSBOTUkgaW5zdGVhZCBvZiBJUEkgZm9yIENQVSBzdG9wIGlmIFJJU0Mt
ViBTU0UgTk1JIGlzIHN1cHBvcnRlZC4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+PiA+IC0tLQo+PiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUv
cmlzY3YvcmlzY3Zfc3NlX25taS5jCj4+ID4gQEAgLTU4LDYgKzU4LDcgQEAgc3RhdGljIGludCBs
b2NhbF9ubWlfaGFuZGxlcih1MzIgZXZ0LCB2b2lkICphcmcsIHN0cnVjdCBwdF9yZWdzICpyZWdz
KQo+PiA+ICAgICAgIHR5cGUgPSBhdG9taWNfcmVhZCh0aGlzX2NwdV9wdHIoJmxvY2FsX25taSkp
Owo+PiA+Cj4+ID4gICAgICAgTk1JX0hBTkRMRShMT0NBTF9OTUlfQ1JBU0gsIGNwdV9jcmFzaF9z
dG9wLCBjcHUsIHJlZ3MpOwo+PiA+ICsgICAgIE5NSV9IQU5ETEUoTE9DQUxfTk1JX1NUT1AsIGNw
dV9zdG9wKTsKPj4KPj4gUGxlYXNlIGRvY3VtZW50IHRoZSBpbnRlbmRlZCBwcmVlbXB0aW9uIGRl
c2lnbiBmb3IgYWxsIFNTRSBldmVudHMsCj4+IGJlY2F1c2UgaXQgd2lsbCBiZSBhIG5pZ2h0bWFy
ZSBpZiB3ZSBmb3JnZXQgc29tZSBhc3N1bXB0aW9ucyBpbiB0aGUKPj4gY29taW5nIHllYXJzLiAg
KFRoYXQgaW5jbHVkZXMgdGhlIHJlbGF0aXZlIHByaW9yaXRpZXMgb2YgUkFTL1BNVS8uLi4pCj4K
PiBBY3R1YWxseSwgTE9DQUxfTk1JX0NSQVNILCBMT0NBTF9OTUlfU1RPUCwgTE9DQUxfTk1JX0JB
Q0tUUkFDRSwKPiBMT0NBTF9OTUlfS0dEQiwgLi4uIGFyZSBhbGwgaW1wbGVtZW50ZWQgdmlhIHRo
ZSBzaW5nbGUgU1NFIGV2ZW50Cj4gU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RF
RC4gUGVyIHRoZSBTU0UgZGVzaWduLCBubwo+IHByZWVtcHRpb24gd2lsbCBvY2N1ciBhbW9uZyBD
UkFTSCwgU1RPUCwgQkFDS1RSQUNFLCBhbmQgS0dEQiBldmVudHMuCgpUaGF0IGlzIGhvdyBpdCBp
cy4gIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXQgbXVzdCBiZSBsaWtlIHRoYXQuCgpGb3IgZXhh
bXBsZTogUE1VX09WRVJGTE9XIGhhcyBsb3dlciBldmVudF9pZCB0aGFuIFNPRlRXQVJFX0lOSkVD
VEVELCBzbwppdCB3aWxsIGN1cnJlbnRseSBpbnRlcnJ1cHQgTk1JX0NSQVNIIGFzIHRoZXkgYm90
aCBoYXZlIHByaW9yaXR5IDAsCmFsdGhvdWdoIE5NSV9DUkFTSCBwcm9iYWJseSBzaG91bGRuJ3Qg
YmUgbWFza2VkIGJ5IGFueXRoaW5nLCBhbmQgc2hvdWxkCnByZWVtcHQgZXZlcnl0aGluZy4KTk1J
X0JBQ0tUUkFDRSwgb24gdGhlIG90aGVyIGhhbmQsIHByb2JhYmx5IHNob3VsZG4ndCBoYXZlIHRo
YXQgaGlnaApwcmlvcml0eSBhcyB0aGVyZSBzZWVtIG1vcmUgaW1wb3J0YW50IGV2ZW50cyAoZS5n
LiBSQVMgYW5kIE5NSV9DUkFTSCkuCgpUaGUgaXNzdWVzIGNhbiBiZSBhdm9pZGVkIGJ5IGV2ZW50
IHByaW9yaXRpZXMsIG1hc2tpbmcsIG9yIGRlZW1lZCBhcwpub24taXNzdWUsIGJ1dCBJIHRoaW5r
IGl0IHdvdWxkIGJlIGJlbmVmaWNpYWwgdG8gcHJvdmlkZSBzb21lIHJlYXNvbmluZwpiZWhpbmQg
dGhlIGRlc2lnbiwgYXMgdGhlIGNob2ljZXMgZG9uJ3Qgc2VlbSBvYnZpb3VzIHRvIG1lLgoKVGhh
bmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
