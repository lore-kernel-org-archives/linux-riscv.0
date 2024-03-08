Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3DC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWMpEHrfd+ihVo44iezcLrPtKVcpVpXeMmA3m2oEU8I=; b=PQnqiKefUf2+uW
	DDzbVdfAPRl13yOPI/gAU/Id2KNKFAoONb5ujPJ3CBtB9cqkgSpKgNXt0UwXUesOf/8Xs71dLrD2g
	ltzodEeu8EI1tSpR6vIuq8HT4Z+wo0kxBK0hbCUn0aCOs8d0VLKyoWThsHeodsOaxqfOJabKnXtv1
	fvjtFOSGDhAHYWgAlm8D4D5+FaubunOdKUN/dl49CrQCPz1j47bYzXxDpTp1xERN35BA4tkIcNvt5
	Qh1XMaDbWW2I2jasU0G+gZ+0eAxGfcfOn5cR4Cqp4AqoTTbgjvppC9H8JWDe8KrNESt9TZ6UD8hPY
	oI4OYqA8BbeS/TBWtf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riY8q-00000008u3E-0xQg;
	Fri, 08 Mar 2024 11:11:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riY8j-00000008tzc-27fi;
	Fri, 08 Mar 2024 11:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9371661DBC;
	Fri,  8 Mar 2024 11:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4968C433C7;
	Fri,  8 Mar 2024 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709896307;
	bh=VObxaL0t5qKtJJ8GQluFyj0qWx/502F8HOOdmlaZLOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O/WC80qGQcYPK/zi3+6WT1dlOUKe/lBgfWzU6gkZf78kgo2cMet4Z9crddF8q4OXo
	 CKHOnqrUWNNF3XAO/0zpfcfxLDqrPpZiApNa7b6+jyP8T4MJxkK5BdvuwLDNtsPshG
	 Xay2Td2slg9EIjXIAL6jVmsRuFHU08LPInXAs8BIMU3PCzKsMWJKCdim0vrKeE6zIu
	 FC9sHJzcCDRnhVICUyo/FwFwpWcvL85AISByTVzTsfjh0eER1pgBooNNrHQRfI3RJA
	 clacMvW8NKi3YJIc2pxDT/R03w8a6lgNWXmDX9gmND3HuDYFzw/QpiThl0/AvK0bKv
	 JgtaeLe6Lzy4A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v16 0/9] Linux RISC-V AIA Support
In-Reply-To: <20240307140307.646078-1-apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
Date: Fri, 08 Mar 2024 12:11:44 +0100
Message-ID: <87edclou4v.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_031149_617801_4F0CD17F 
X-CRM114-Status: UNSURE (   6.47  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIFJJU0Mt
ViBBSUEgc3BlY2lmaWNhdGlvbiBpcyByYXRpZmllZCBhcy1wZXIgdGhlIFJJU0MtViBpbnRlcm5h
dGlvbmFsCj4gcHJvY2Vzcy4gVGhlIGxhdGVzdCByYXRpZmllZCBBSUEgc3BlY2lmY2F0aW9uIGNh
biBiZSBmb3VuZCBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL3JlbGVh
c2VzL2Rvd25sb2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKCkl0J3MgYmVlbiBhIGJl
ZW4gYSBsb25nIHJpZGUsIGFuZCBJIGdvdCBpbiBsYXRlICh2MTApLi4uIFRoYW5rcyBmb3IgdGhl
CmhhcmQgd29yaywgQW51cCEKCk5vdGUgdGhhdCBBbGV4JyB0ZXh0LXBhdGNoaW5nL0lQSSBzZXJp
ZXMgWzFdIG5lZWRzIHRvIGdvIGludG8gdGhlIFJWCnRyZWUgYXQgcm91Z2hseSB0aGUgc2FtZSB0
aW1lIGFzIEFJQS4KCkkndmUgbm90IGNhdWdodCBhbnkgcmVncmVzc2lvbnMgZm9yIGtzZWxmdGVz
dHMgb24gcWVtdSBmb3IgdGhpcyB2ZXJzaW9uCih3aXRoIEFsZXgnIHNlcmllcyBhcHBsaWVkKS4g
SSBoYXZlIG5vdCBydW4gaXQgb24gcmVhbCBoYXJkd2FyZS4KCkZvciB0aGUgc2VyaWVzOgoKVGVz
dGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
