Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C17C25B75
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 03:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlAa704SdgSzZYtiWZzL9mbS1Ttm7gWAhKTp0w1MgCE=; b=vMeBTGOYB2EroW
	OEff6gSigaA8tCIUWCouMhK+jr0/b8VNNcmmgDSZWjt+voWd3SbT3/5c5hoWKW3vf6m/E1BovH5kp
	UF0pcrKVUG0C+eFpQco8RqeDrEoZ2jdP96XzLWgQBECMEiTqFfYQgKt38PBqu/6lIumBVYnLSUiig
	F+MPpGvH42hzadAxNuzV8LAB6F1JWcsO4dKz9yKgbfag8adbum94fmRaTSnOrnXu36pXnRZJyAEcs
	CXZ/8Kl2088i8OtqXxcRGV6LNBisIYKfpPLStpytJfuKJO9gXZ9or0ZWMKmeqJ8PHtZaHDQztPKsN
	RkmKrm11ldls1DDYfXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDF6F-0000000BsGJ-0oSV;
	Sat, 01 Jun 2024 03:08:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDF6C-0000000BsFw-2ntQ
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 03:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48A0F62E72
	for <linux-riscv@lists.infradead.org>; Sat,  1 Jun 2024 03:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD97C116B1
	for <linux-riscv@lists.infradead.org>; Sat,  1 Jun 2024 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717211278;
	bh=cqaO2mscY2nvy4zNayXNs9Wfa7beJ4b5F0q/LUYBUJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V+c4GBFq+AJHHmirAvekwH+/IsgVpXuVDd6U1UGAeXUfuzeuc1NLSIlYjMaCq3cmJ
	 vlysgvnRMYy6fbCPsjSDGEREJMBNvVr81YevgCzJPCPgOGhSQCTgtx5PvWT8CHBY1v
	 /yPwdx4NIBGx43SaBnJ8nQ9nGajK39IW4a7wr+Httdk1IK8Q807TYGra/c1vqiYYzZ
	 pmZbGJIe1+3iSk1eWZI8wofiJQlwGYEJ3OY6dOzqBmhN0cAena1h98Ora+uQUZpL3X
	 6LyKqzRejUYZUofbj2uZTfVapENfSC8tIJ0Ld6KeJ5ieHKyE2y5+Wyg4HZYorIkJQ6
	 ooYqqYUIs87/A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so33378051fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 20:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhUfUdl19kZbVMhMFoHS8VysFcAExYD5B9DKVC1JjaQZKkVI8rk+ZHQNafOaryUv96EjoEJsPkOuom0ciSoWG3r56k1oIYaq4OyZxFIEaF
X-Gm-Message-State: AOJu0Yy4kXpps9vugElOuVQy3MCdWcIoKOTrKE9zVvPbh8YIiZwuoztX
	n6Enic8gv0Tg/YZRmhVSg1TRLvhgwkd+GWaDfwv1h6AB9ZN+TFrTrJt+q/xIRZxpof6Ui4cQ0+F
	AyKzLAdTJxZALE80JLVK3csYUx9Q=
X-Google-Smtp-Source: AGHT+IFeCE4qyDl4YzuCOe6hydlRibgFllVHhxftqrceEaiCEbO5cuy+v8E7x8MdzPi9PQ5s4gSuJfAumWwUV24KUA8=
X-Received: by 2002:ac2:5dc3:0:b0:52b:88db:a554 with SMTP id
 2adb3069b0e04-52b89564ffcmr2258561e87.8.1717211277004; Fri, 31 May 2024
 20:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB4953BA3638A0839FCB0EF86BBBF32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAJF2gTRu8WUkjOOzH4MZvinZv=0cgF988c7HyzP5jw0p3w+MWQ@mail.gmail.com> <20240531-reseal-sabbath-4994673eb98c@spud>
In-Reply-To: <20240531-reseal-sabbath-4994673eb98c@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 1 Jun 2024 11:07:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQYT+2Q4K4jPoD3X=JArKReD6O8uF4Q1o2fGqYXb2RPWw@mail.gmail.com>
Message-ID: <CAJF2gTQYT+2Q4K4jPoD3X=JArKReD6O8uF4Q1o2fGqYXb2RPWw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: thead: th1520: Add PMU event node
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_200804_807171_73839A85 
X-CRM114-Status: UNSURE (   9.30  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTE6MDPigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMDk6NDM6MDBBTSAr
MDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IExHVE0hIFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPgo+IFBsZWFzZSBwcm92aWRlIHRhZ3Mgb24gYSBuZXcgbGluZSBzbyB0
aGF0IHRvb2xpbmcgcGlja3MgdGhlbSB1cC4KPiBJIGhhZCB0byBhbWVuZCB0aGlzIGNvbW1pdCBj
b3MgSSBmb3Jnb3QgYSBzaWdub2ZmLCBzbyBJIGFkZGVkIGl0LgpPa2F5LCBUaHggZm9yIHRlbGxp
bmcuCgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
