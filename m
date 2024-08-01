Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC962C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dyarhd1f7xT4WjV2OYwdi+AmYhdCB6xkibcGSEDTihE=; b=ElMQWhuzOtlwKV
	iB0MIkoj6sFzbwBthLPiLC9t8rN0tSLAoaY8d+JVsTTU1tNOHsg7NOTC0fWbE2uIktbU/WryW4Gr9
	Vo2GDsg0VXG459EaLrilcQUh/f67p5Jv8fZQpIZA3YSm5SLSyYuNtJOBxjIGvPK54EBZQTlTJtFlX
	P7aXm1sKRaEWE8xtSXVGklKQGoC/OPatE5hKlg4uFc6sbREJDoWHm9FBvUSd8bhaw2vDrrHmdu6q3
	v2z6LBJbZ3odWBck56xgPd6/JzXTJqV6Y2w5HJRj1ev9rIGPAnIsi2NzVba2LJMGI/QJOx3xSO0fQ
	cOt2lyK1PHYg68wl6tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRjP-00000004SyP-2eLa;
	Thu, 01 Aug 2024 09:04:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRix-00000004Suk-2X1Y
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Aug 2024 09:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=; b=kS/emODTW+PpEIvVDBuqDNR7uX
	ql2H+osipHmmK0RmdgCh+yMHAwM8zSw5c6jqmfjp0kkIvlyDQTMYGFcW0k5hO+Kdr0cjP+gV9FAnw
	InBCGPN0As0t9p8Rd7wr6jnRGhCDXx8LhA8vA4SgkdxhYuBs9Zkmu7ebBriawiqAw66pn3ucxfScr
	3cchGyZ5rljQJqwD3Y5TjDaqn5TOAFkjb1OnR6A2HyQm7MsXSnSvo6rm+IftvBebpwMgDaUSS01Kx
	mQhsSSg05Q4y+wcIu8ub/WrYVW5mgTk6MCH7pj6Gd5NfSvrIhqvyX/vV16QNOVgGSWC2pAwAnDBHu
	nWEBovyQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRis-00000005Qbm-1TEw
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:03:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a7d26c2297eso823959366b.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722503022; x=1723107822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=ZnMIz6X/xW3BnMiOVooMDJiXU0Ky+90UlOqUEq46s/GO0FmDUem7bLiEMnk/tYWHmM
         al0SjnDhVxEajJVPrj/u6UUrgGxxX2IDhIAgg5ljFgiBy5SoZiGlLOX6qU76yN0t1uOV
         vqwrj+27HfQThPJW2MQI10YOcDzneRUVi0RyoZrpr9DJIMGRwymTlccBqVAZNRe5nSj4
         YsjPpQJo7popXCxql0+osDI6j4AfGRZ+wC3YI4nm1u+6f4wRCtM4bpbOOknD4heSffar
         BxYVeWWr5sbhmQJgiejBqkvyryTFHmZUAuCX61aHtzS7X1GTf1p/qBUW1qezf1cpXD6p
         sMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503022; x=1723107822;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=Xb2kdU+iTfs/Q9R1Abwc0S3MJo3HH16PCVxPOrk+JFnJru5tB+BtqldSXcT3kYlhZe
         x5q9dveE8h0gz3JFFWyIfaPIUFZjlhxDh/GY8piSqFbCVj3Lz5z2ua9RrKcow+68uywd
         +/bCxem6i2nhpqBEtadd8w24S6EbPO5WryJDBjP5GbhGGN2c4CYRj2tejzSbGguJuvzb
         3hJfBw/LXJzWnwsDMZ+NMud3jESJN8Y+H09itBRxuoslFfmR+CqnNaQd7NactSKZcg3k
         57UN0yQWYJ7gs88A9zTEWrAPiW/TmEsZYhtfhShraCltaSeb4D7zBRDuMhZpqx/kfVck
         QSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWet8UGECrj731PdTkso2TykT3jxVlgqN/sJ5R4OkcU40+IjTNveFeOvcS/GNicQS4UXAThU7UQLwp/LPtjLTu1MpW6aHD1oSVGpkmfeJs7
X-Gm-Message-State: AOJu0Yy3wjMPR2/qjERknDsxfB9LGKhz+vY8JnJB0sgfRed2Y3UWU4E4
	2kZJb62aipVQZdfYvAI99T5IJdQ3mkkDvFwb9gpO4BKy9zE1OLPhuaQU6+2i+pI=
X-Google-Smtp-Source: AGHT+IHhni1Uh+bJITVWfhi2vAVjvXUzKzH/nw0taqtk6cxicA1yt55vq2KJXrilVInru0VfNsUVMQ==
X-Received: by 2002:a17:907:a4c:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a7daf4c7df7mr132037366b.22.1722503021389;
        Thu, 01 Aug 2024 02:03:41 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm878292566b.146.2024.08.01.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:03:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36EF35F80C;
	Thu,  1 Aug 2024 10:03:38 +0100 (BST)
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
Subject: Re: [PATCH v12 04/84] KVM: Allow calling
 kvm_release_page_{clean,dirty}() on a NULL page pointer
In-Reply-To: <20240726235234.228822-5-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:13 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-5-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:03:38 +0100
Message-ID: <871q38fwd1.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_100346_514134_15511728 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gQWxsb3cg
cGFzc2luZyBhIE5VTEwgQHBhZ2UgdG8ga3ZtX3JlbGVhc2VfcGFnZV97Y2xlYW4sZGlydHl9KCks
IHRoZXJlJ3Mgbm8KPiB0YW5naWJsZSBiZW5lZml0IHRvIGZvcmNpbmcgdGhlIGNhbGxlcnMgdG8g
cHJlLWNoZWNrIEBwYWdlLCBhbmQgaXQgZW5kcyB1cAo+IGdlbmVyYXRpbmcgYSBsb3Qgb2YgZHVw
bGljYXRlIGJvaWxlcnBsYXRlIGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRl
Y2ggTGVhZCBAIExpbmFybwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
