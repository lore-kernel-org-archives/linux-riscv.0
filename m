Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D39C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TLOdhwH5WeRJG5RhkndAX4lJt1cJjfzpth4ZExn+zU=; b=gxhW4kGbtIVZs1
	HZd1lprAbEFJHpHj/bIgR5lGB8UFFK/sxdjGD2LrymUmNGGpwKqD5qVvu0hVG3JI9gFlebUl2vjwy
	KmzaT0lk0T7Fau55bHWxkPuGxu12U1u901qwcN+jnQldTUcgR04kja4Xaw2ZY3AkZSQ+oxfo1wndz
	KupG3BiW4y6dXHgK+BdsxpnrERIkLRlmiQlMWjxUT41lmXlMSQWuLu2Q7tEqLtiNjc6b9RQdXHOhE
	BxnvA6cxRmCNzEfZaDz31BKet4VHjUk1kZYSc7e/uxJCE1RywADiM/6mmOn7Olv8OQT/ZaU0S6O6i
	WL2bGvaybjJ2K2zrde+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sis9e-0000000AW5S-1IB2;
	Tue, 27 Aug 2024 09:06:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sis9a-0000000AW3x-3Lem
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 09:06:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37198a6da58so3659534f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724749576; x=1725354376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=rd8diBL2ofxvJcjAhjnGXELr+QszPAiHrctrxClMcGsFjRwqwf0+sHYVzwSCOG0/ji
         BVrx/TYF+V7i6q8esDsL1FlAuQsRmo76tk+yuWpTL7gPajh1qaRACb7h57fpLVZTWO/O
         hgVP5KjGebe+ETDOFQ/GOrFR/EXAkd/6BdSLkZ9Wnv42p0yIUqnkL9xuq0S+HtMFZhqb
         Jxi2jpuZi5ZuayWMIsqUzTiHsGoYpM67uTzKm7WGxMZsLmDWB/ZaOCHx6xAJYvxlNzPC
         hY6NrWuHifUADtvG/gGv5TDSuHutsXEpZocYO0XkfBWJwsfsN6+muwEfW4Tp8rd1l4vc
         Q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749576; x=1725354376;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=Wlk+klLthYqVRMJOsz3Uio38vDTzZnFJ+WkT3fPZHRKN3Vvr6Bbv35wEzoe1KVJVr3
         9CepzMKBl3pTqYh+R93MQqEo9V3VzZJqT6efPdhATNC+PQoZn66vLTNtdE6OFg87ZFW/
         Fp2dQ56VxMDYsLPK4k9PMXJHZ+5hXFNjV9hjrcZiyrgDR4zBq5ALfWRD+xblbj41KP0O
         vEjnB0CwBMr8QOzkBJqpFRbkqB3ZZQOH63/x44vdiGa7fKz/kPvNSmsj9NK2Y9ihQ8Xv
         rUGtjfqVVtM3uURXZKIAb60u545ECt2ssjtnSVm1PwkX7Q6Jzad7y4VNLYdjh2qtNA8s
         J44A==
X-Forwarded-Encrypted: i=1; AJvYcCUdCpEeqdHLeJpYWOZFesqRSishLYbcucdfObEv0ODsiLP0I7z//ZazESCx8lnOrNMiNfVdz+fAyaIG4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3QUO5VU9Rq+LbDWCe95oasn016B8r6hJP3VTB4hFVZS+V4cWd
	OJiU1vyempE0/hkHtecjW6xQHRqGIv75vs34GUAwgKZT/G4pis51pvO0YBwYla8=
X-Google-Smtp-Source: AGHT+IE+VDn5FOe01bWlunlr3Q/efu0PB9LC4RFl5VPjT0A0kz6PEXEkfZYstnAt53OJLkCDA/f1HA==
X-Received: by 2002:adf:b311:0:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-37311840050mr9300691f8f.6.1724749575912;
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730826a3f7sm12533503f8f.112.2024.08.27.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 507E15F7A2;
	Tue, 27 Aug 2024 10:06:14 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:09 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
Date: Tue, 27 Aug 2024 10:06:14 +0100
Message-ID: <875xrme3nd.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_020618_883053_EEFA3151 
X-CRM114-Status: GOOD (  17.04  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gYXJtNjQg
Zm9sa3MsIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBhcmUgYnVnIGZpeGVzLCBidXQgSSBoYXZlIHZl
cnkgbG93Cj4gY29uZmlkZW5jZSB0aGF0IHRoZXkgYXJlIGNvcnJlY3QgYW5kL29yIGRlc2lyYWJs
ZS4gIElmIHRoZXkgYXJlIG1vcmUgb3IKPiBsZXNzIGNvcnJlY3QsIEkgY2FuIHBvc3QgdGhlbSBz
ZXBhcmF0ZWx5IGlmIHRoYXQnZCBtYWtlIGxpZmUgZWFzaWVyLiAgSQo+IGluY2x1ZGVkIHRoZW0g
aGVyZSB0byBhdm9pZCBjb25mbGljdHMsIGFuZCBiZWNhdXNlIEknbSBwcmV0dHkgc3VyZSBob3cK
PiBLVk0gZGVhbHMgd2l0aCBNVEUgdGFncyB2cy4gZGlydHkgbG9nZ2luZyB3aWxsIGltcGFjdCB3
aGF0IEFQSXMgS1ZNIG5lZWRzCj4gdG8gcHJvdmlkZSB0byBhcmNoIGNvZGUuCj4KPiBPbiB0byB0
aGUgc2VyaWVzLi4uICBUaGUgVEw7RFIgaXMgdGhhdCBJIHdvdWxkIGxpa2UgdG8gZ2V0IGlucHV0
IG9uIHR3bwo+IHRoaW5nczoKPgo+ICAxLiBNYXJraW5nIGZvbGlvcyBkaXJ0eS9hY2Nlc3NlZCBv
bmx5IG9uIHRoZSBpbnRpYWwgc3RhZ2UtMiBwYWdlIGZhdWx0Cj4gIDIuIFRoZSBuZXcgQVBJcyBm
b3IgZmF1bHRpbmcsIHByZWZldGNoaW5nLCBhbmQgZG9pbmcgImxvb2t1cHMiIG9uCj4gIHBmbnMK
CkkndmUgZmluYWxseSBtYW5hZ2VkIHRvIGdldCB2aXJ0aW8tdnVsa2FuIHdvcmtpbmcgb24gbXkg
QXJtNjQgZGV2Ym94CndpdGggYW4gQU1EIGdyYXBoaWNzIGNhcmQgcGx1Z2dlZCBpbnRvIHRoZSBQ
Q0kuIEknbSBjb25maWRlbnQgdGhhdCB0aGUKZ3JhcGhpY3MgcGF0aCBpcyB1c2luZyB0aGUgZGlz
Y3JldGUgY2FyZCBtZW1vcnkgKGFzIGl0IGhhcyBiZWVuIG1hcHBlZAphcyBkZXZpY2UgbWVtb3J5
IHdpdGggYWxpZ25tZW50IGhhbmRsZXJzIHRvIGRlYWwgd2l0aCB0aGUgYnJva2VuIEFsdHJhClBD
SSkuIEhvd2V2ZXIgYXNpZGUgZnJvbSBydW5uaW5nIGdyYXBoaWNzIHdvcmtsb2FkcyBpbiBLVk0g
Z3Vlc3RzIGlzCnRoZWlyIGFueXRoaW5nIGVsc2UgSSBjYW4gY2hlY2sgdG8gc2VlIHRoaW5ncyBh
cmUgYmVoYXZpbmcgYXMgZXhwZWN0ZWQ/CgpUaGUgcHJlZGVjZXNzb3Igc2VyaWVzIGRpZCBicmVh
ayBsYXVuY2hpbmcgc29tZSBLVk0gZ3Vlc3RzIG9uIG15IHg4NgpzeXN0ZW0gYnV0IHdpdGggdGhp
cyBzZXJpZXMgbGF1bmNoaW5nIGd1ZXN0cyB3b3JrcyBmaW5lIGFuZCBJIGhhdmVuJ3QKbm90aWNl
ZCBhbnkgd2VpcmRuZXNzLgoKU28gZm9yIHRob3NlIGNhdmVhdHMgeW91IGNhbiBjZXJ0YWlubHkg
aGF2ZSBhOgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
CgpIb3dldmVyIGlmIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgSSBjYW4gZG8gdG8gZnVydGhlciBz
dHJlc3MgdGVzdCB0aGlzCmNvZGUgZG8gbGV0IG1lIGtub3cuCgotLSAKQWxleCBCZW5uw6llClZp
cnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
