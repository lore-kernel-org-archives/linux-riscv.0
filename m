Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E4D149C6
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AKYw6n2qLyIraHE8AWmhXER0GDiwuc+fVuP56gdl8Y=; b=uJ545ZwoHx8jfS
	x02AuExOwXFcnzezvu12m+94El+QC/Ha3i+nRtlilpoIhjqzEm7JaStVO81YTu/lKfG8uJAMtcx8l
	LGWMHIdnWje77gheEzsngi2c9EdvK4q/2L5+dsucH1OYRFSN6MVs1Wz7OiaYzC8YmtnbMT6B7ckAI
	Er6NFWuGVuuE+FfnVpsF5gOkiFqNbXbvbrN2Dx6itDz2f4rTty54RiMdFRf31bGf6EjgoNixz12mU
	rOF4rGyrq4OZBXb+ZSrukNwBTkLdXvxbVWrR421y4rDMvGEVRtNgBI/SkmtDdJU7MxLK0JjK8Ha7T
	noztO213qjTCXUi5dFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NFc-00000004S3b-3rS8;
	Fri, 25 Oct 2024 16:33:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NEt-00000004Rwr-0NTR
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 16:32:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so28698935e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1729873956; x=1730478756; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXeTo7Ai0eUmikHGglFs9Z6xKx+weNQarzYjxtYNU8s=;
        b=R9C74qb3pdRheMq37Rh2rdY5wwZOR20LDZQa/iywDMaPqh0hlWLW7qtdQBPqG2EI70
         fsj/v+K3rbYAqhT5ZC2H8C07cYOFiBIHi6SIc14SJx/5eBguaQSbKY/H+3uZQdbsu78z
         msG/Z2xxqus3COX08E51/X9FSQCSD3mVYhfNOxZpnDumnpiAbn7IGVzRqYP16gRAujju
         jjZlK4zQf5sNS11K4WR+Cz1/iSYXpUsy8MaLhM9wG4UKaxSjoh88KC/2eBUQiTLQEUiG
         0TD0RBQFuoQ1uXrlD/eotxb6CaqS7r7NkeTbYH4YG2h4DxPezS4SH5P7vrO41DK00Ir0
         ZkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729873956; x=1730478756;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXeTo7Ai0eUmikHGglFs9Z6xKx+weNQarzYjxtYNU8s=;
        b=MGeZ2eQiGzZszvK/O9L1VpLoE0wJEC6/lElgsI2NKUqcILIEC2Kx2F/L9p0aoRKL7I
         igY7GTWQwHp+X0GAGbXPDduyDkLMY1EkxQbEQYcuMCzZOX3VV5rGiX8bWzW8WEDtEQwL
         AcgTOFZ8ypqHqTlOoPRhQ1UOBUXv/OHlqUUJcLmx7mW4sLdI5mKjDTUYAWN/z3dXC12X
         RNeLVS2+3cuG2bZmeAeHSMtE5TlONsew1fkeEwbZwkxHAyOYahheQhLfaAoFbu2VI1fM
         xSDDm1aLlCiEiMdkFi1vAR4nmS0ZL6YgEnsRsSBs7Wz+jyCVxUz/vmzBSEV1/SClqyaQ
         NiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYLG8S6Mr3L6KHb3BJAAzHrf5Mpuh5xfw/sAsQMT40hPY1d2cYi5U4mB8gzjjFnXgb5dPFzZuvThWC6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHRBArCqS+amQAWkIV9hH9Bo6b9CRqv4NWRWC+AGtvZoOLyCDJ
	4tzFmq1UcXXHIy4/DxcKu2X/tu8UkBEeWhgUMf200rIt7Ta1Mib1TY3P+L5f5UTAfSRMNu+o4jD
	FS9c=
X-Google-Smtp-Source: AGHT+IFzsde/CLy2eKazkH1v7HLp95coK36e2ucRf+AtuaN3885jE1bDkPSHOXdWnud0uPfx4xpq7A==
X-Received: by 2002:a05:600c:1c92:b0:431:604d:b22 with SMTP id 5b1f17b1804b1-4318421133amr122043805e9.16.1729873955703;
        Fri, 25 Oct 2024 09:32:35 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360cc2esm22175455e9.44.2024.10.25.09.32.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:32:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] RISC-V: Enable Zicbom in usermode
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20241025-puritan-sank-b8a828ef5872@spud>
Date: Fri, 25 Oct 2024 17:32:24 +0100
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
 punit.agrawal@bytedance.com,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 cleger@rivosinc.com,
 charlie@rivosinc.com,
 evan@rivosinc.com,
 samuel.holland@sifive.com,
 andybnac@gmail.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <3CCBB0AB-169D-4677-9A44-53E4148908D5@jrtc27.com>
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
 <20241025-puritan-sank-b8a828ef5872@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_093240_596701_836660E2 
X-CRM114-Status: GOOD (  19.03  )
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

T24gMjUgT2N0IDIwMjQsIGF0IDExOjE2LCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDI1LCAyMDI0IGF0IDA1OjE1OjI3UE0gKzA4MDAsIFl1bmh1
aSBDdWkgd3JvdGU6Cj4+IExpa2UgWmljYm96LCBieSBlbmFibGluZyB0aGUgY29ycmVzcG9uZGlu
ZyBiaXRzIG9mIHNlbnZjZmcsCj4+IHRoZSBpbnN0cnVjdGlvbnMgY2JvLmNsZWFuLCBjYm8uZmx1
c2gsIGFuZCBjYm8uaW52YWwgY2FuIGJlCj4+IGV4ZWN1dGVkIG5vcm1hbGx5IGluIHVzZXIgbW9k
ZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2Uu
Y29tPgo+PiAtLS0KPj4gYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArLQo+PiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPj4gaW5kZXggMTk5MmVhNjQ3ODZlLi5iYzg1MDUxOGFiNDEgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gQEAgLTkyNCw3ICs5MjQsNyBAQCB1bnNpZ25lZCBs
b25nIHJpc2N2X2dldF9lbGZfaHdjYXAodm9pZCkKPj4gdm9pZCBfX2luaXQgcmlzY3ZfdXNlcl9p
c2FfZW5hYmxlKHZvaWQpCj4+IHsKPj4gaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHko
UklTQ1ZfSVNBX0VYVF9aSUNCT1opKQo+PiAtIGN1cnJlbnQtPnRocmVhZC5lbnZjZmcgfD0gRU5W
Q0ZHX0NCWkU7Cj4+ICsgY3VycmVudC0+dGhyZWFkLmVudmNmZyB8PSBFTlZDRkdfQ0JJRSB8IEVO
VkNGR19DQkNGRSB8IEVOVkNGR19DQlpFOwo+IAo+IEkgYmVsaWV2ZSB3ZSBwcmV2aW91c2x5IGRl
Y2lkZWQgdGhhdCB1c2Vyc3BhY2Ugc2hvdWxkIG5vdCBiZSBhbGxvd2VkIHRvCj4gdXNlIHppY2Jv
bSwgYnV0IHRoYXQgbm90IHdpdGhzdGFuZGluZyAtIHRoaXMgaXMgd3JvbmcuIEl0IHNob3VsZCBi
ZQo+IGNoZWNraW5nIGZvciBaaWNib20sIG5vdCBaaWNib3ouCgpBbGxvd2luZyBjbGVhbi9mbHVz
aCBpcyBzYWZlIGJ1dCBoYXMgdGhlIHNhbWUgcHJvYmxlbXMgYXMgZmVuY2UuaSB3aXRoCnJlZ2Fy
ZHMgdG8gbWlncmF0aW5nIGJldHdlZW4gaGFydHMuIEFsbG93aW5nIGludmFsaWRhdGUsIHVubGVz
cyBtYXBwZWQKdG8gZmx1c2gsIGlzIG5vdCBzYWZlIGluIGdlbmVyYWwgdW5sZXNzIHRoZSBrZXJu
ZWwgZG9lcyBhIGxvdCBvZgpmbHVzaGluZyB0byBhdm9pZCB1c2Vyc3BhY2UgYWNjZXNzaW5nIGRh
dGEgaXQgc2hvdWxkbuKAmXQgYmUgYWJsZSB0byBzZWUuCgpBbHNvLCBFTlZDRkdfQ0JJRSBpcyBh
IG1hc2sgZm9yIGEgbXVsdGktYml0IGZpZWxkLCB3aGljaCBoYXBwZW5zIHRvCmhhdmUgdGhlIHNh
bWUgdmFsdWUgYXMgRU5WQ0ZHX0NCSUVfSU5WIChpLmUuIHJlYWxseSBpcyBtYWtpbmcgY2JvLmlu
dmFsCmJlIGFuIGludmFsaWRhdGUpLiBJIG5vdGUgdGhhdCB0aGUgS1ZNIGNvZGUsIHdoaWNoIHRo
aXMgbGlrZWx5IGNvcGllZApmcm9tKD8pLCBtYWtlcyB0aGUgc2FtZSBtaXN0YWtlLCBidXQgdGhl
cmUgdGhhdCBpcyB0aGUgaW50ZW5kZWQKYmVoYXZpb3VyLCBpZiBtaXNsZWFkaW5nIGFib3V0IHdo
YXQgdGhlIGZpZWxkIHJlYWxseSBpcy4KClNvLCB3aXRoIHN1aXRhYmxlIGNhdmVhdHMsIGFsbG93
aW5nIGNsZWFuL2ZsdXNoIGNvdWxkIGJlIGEgcmVhc29uYWJsZQp0aGluZyB0byBkbyAobWF5YmUg
dXNlZnVsIGZvciB1c2Vyc3BhY2UgZHJpdmVycyBzbyBsb25nIGFzIHRoZXkgcGluCnRoZW1zZWx2
ZXMgdG8gYSBzcGVjaWZpYyBoYXJ0PyksIGJ1dCBpbnZhbGlkYXRlIHNob3VsZCBvbmx5IGV2ZXIg
YmUKYWxsb3dlZCBpZiBtYXBwZWQgdG8gZmx1c2guCgpKZXNzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
