Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3BDC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYkf86oLTeSemMtjdiWkap/vBL2jSlV2y3GTFib3OEo=; b=etGJyOfvSM4UAb
	mtra/KOiYvfmc5DRuR4w1DLetJsYY2d8KQ2lz55I8npG7aSUvmkCER+jcpJqeQywwnaTATXRgPYe0
	VBfdAqcLSEEslESUZD+x0ohRkZJVKDzNyn9y+vw7suFnfne0cO7YD0YnUdlzirx8uX4r5sqekdn3m
	WQOLj4UjtDypcCKJkmqVTioGSMw0GqpUdAX/TFvKjN597NEDTce40ZhPB/e2tFhpiBjqisy+gTctH
	pCFOSrKpZlbc9yC1ivK+l75Ug6/48IMRNz3M1fdwRGHPcH6qUGQjT3nY3dNOrGaBTmUA9tIgXvg7a
	JWu/TEE1fzrcBWqI00fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAHO-003kru-0R;
	Fri, 15 Dec 2023 15:39:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAHL-003kr5-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 15:39:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50e239c49d0so116596e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702654745; x=1703259545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1wx0veFfXeSmAfDnA278dNhCsbl17nDzwAO+VoI2w0=;
        b=XTu8frWKX6Cwemr/IcAL5obJOICV5v7XpruS2EC+M92UNKuM+KW4ytuq1r7cqE837O
         feGcstFBWtMlk6x/JrdCc5/GEFqrf6IFVovR1O+v7I8Y1Ej9A83VdUmF5OBVv4gWOniz
         fmISepVcVxbZxf6ezs+UOn6BBo7Q4tyof2MwK4a4a6Vy3KU1r+axeQ+oLVmrCBXBFN6f
         3ZkyFpPrhbC3xLcw3KtqpdHAnVpI8fpSmq+zixlk8MWKCvEsAk3kxiQeekXTC0q34ipQ
         z2OeaoZuri34eIv8dmjyes08LH9blCYfh3JLZUpQuWYM30wtjZcrBPr8xpxJuLV0Ob6N
         IxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702654745; x=1703259545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1wx0veFfXeSmAfDnA278dNhCsbl17nDzwAO+VoI2w0=;
        b=tPWzh5IRg3gqMsmoxewmnEhwY3ESYTo2BfD4TGQoAHL/IkVZGrMF5sRglHmVhkxsP2
         u3Eznf/SlJhQrDzHgwtSEyrBHFvLNffrbUjnm/ee/S5qhdd8SOF0X4Mk41AagyrAI/dA
         Ybw5bPYbJ5vCbx7OCappUeT8jvQo8ANEvcaQt5lcZH+g/hm2ygpFXQvUn3YE9UIIHk9m
         JTuSLAV45T7i0haeSlrSRKBwynMfAHz4qArG7eay2+dQKIkya5znt9tlgh3WZTo6gseI
         ExFbfEXS1VjPIIx9/XJLsNsLPcnDR8yQMVSF6cokwbnG4+BSmL5NUNBRU+4Z9sm7S5oo
         wRFQ==
X-Gm-Message-State: AOJu0YxcpUhjtJkJT6a0+RvPMZHAQVpnuAbJaPcljimVA/ynK4PYvkoJ
	gFKGVC8qe/hR/u0KZxeS4SkPPYvgzQzQR/jn4Rpl8Q==
X-Google-Smtp-Source: AGHT+IFVf84s+w2EVCOTCKjPMQKAzPLEu/sj8rErG6Hri/y5+/DExF/6z86r7visnMaLcYRBdFU51p24A+PCS/md29U=
X-Received: by 2002:a05:6512:3b13:b0:50e:1660:bc42 with SMTP id
 f19-20020a0565123b1300b0050e1660bc42mr2166658lfv.50.1702654745275; Fri, 15
 Dec 2023 07:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu> <20231123185821.2272504-4-christoph.muellner@vrull.eu>
In-Reply-To: <20231123185821.2272504-4-christoph.muellner@vrull.eu>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 15 Dec 2023 23:38:53 +0800
Message-ID: <CABgGipW9mJ038R7WYWrFVCOzU6AiRU=B3k81YAO4R8UrGZGhsw@mail.gmail.com>
Subject: Re: [PATCH 3/5] tools: selftests: riscv: Add missing include for
 vector test
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_073907_868263_D59A2DA2 
X-CRM114-Status: GOOD (  14.38  )
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

T24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMjo1OOKAr0FNIENocmlzdG9waCBNdWVsbG5lcgo8Y2hy
aXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PiB3cm90ZToKPgo+IEZyb206IENocmlzdG9waCBNw7xs
bG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+Cj4gR0NDIHJhaXNlcyB0aGUgZm9s
bG93aW5nIHdhcm5pbmc6Cj4gICB3YXJuaW5nOiAnc3RhdHVzJyBtYXkgYmUgdXNlZCB1bmluaXRp
YWxpemVkCj4gVGhlIHdhcm5pbmcgY29tZXMgZnJvbSB0aGUgZmFjdCwgdGhhdCB0aGUgc2lnbmF0
dXJlIG9mIHdhaXRwaWQoKSBpcwo+IHVua25vd24gYW5kIHRoZXJlZm9yZSB0aGUgaW5pdGlhbGl6
YXRpb24gb2YgR0NDIGNhbm5vdCBiZSBndWVzc2VkLgo+IExldCdzIGFkZCB0aGUgcmVsZXZhbnQg
aGVhZGVyIHRvIGFkZHJlc3MgdGhpcyB3YXJuaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpSZXZpZXdlZC1ieTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCgo+IC0tLQo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMgfCAzICsrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVjX25vbGliYy5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVjX25vbGliYy5jCj4gaW5k
ZXggMmMwZDJiMTEyNmMxLi4xZjk5NjliZWQyMzUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVjX25vbGliYy5jCj4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVjX25vbGliYy5jCj4g
QEAgLTEsNCArMSw3IEBACj4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKPiArCj4gKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+Cj4gKwo+ICAjZGVmaW5lIFRISVNfUFJP
R1JBTSAiLi92c3RhdGVfZXhlY19ub2xpYmMiCj4KPiAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQo+IC0tCj4gMi40MS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
