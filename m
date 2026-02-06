Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0472EE2084
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5eNsyRUmONpopaME2vtZMCNJkhspGLdlGNmzR8/CVY=; b=45Ehw8lYiCienG
	IAKOBMFyWe5t0Anc1l2S2UQtq28tsDtQyWyqPwrUYuvbTFIVJZQtyY/qkBA35EXv/UUVoxjuKGMrA
	L/4UZ+V/z0ypYCc09IADp5LOlQqEf/W+GZqkmwA4+Ba+pD3vmpOMjHXPFQ/r3h/D1Jp5INB8zF0uS
	yy2qOz3wmPq2dP0qbs9e6LCMM4zv1RtVdHFdaRloPAg5uvcB0/15yJGA7oXCpfsMOnYjfA7Df9/n3
	QeWUJhoWkmql6hHiqgO3Wdo6gp6EzvZSipqWb3T8CL14gsNPz51gPq9eeeaO8O2cL07Nr5K1BkVId
	X6dZKsD6SLSMedm3RhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKjQ-0000000BHvE-0H8v;
	Fri, 06 Feb 2026 12:14:40 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKjK-0000000BHuk-3ce3
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:14:38 +0000
Received: from [192.168.1.209] (unknown [27.19.236.155])
	by APP-05 (Coremail) with SMTP id zQCowABX7A8A24VpBSObBw--.44121S2;
	Fri, 06 Feb 2026 20:13:54 +0800 (CST)
Message-ID: <9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
Date: Fri, 6 Feb 2026 20:13:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
 Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Jason Montleon <jmontleo@redhat.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
 <87v7gk8r5x.fsf@posteo.net>
Content-Language: en-US
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
In-Reply-To: <87v7gk8r5x.fsf@posteo.net>
X-CM-TRANSID: zQCowABX7A8A24VpBSObBw--.44121S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry5Kr18tr13Zw48Wr4xXrb_yoWfCwcEga
	sayr4qkw48Aa18A3WDJF4rCFZFgw4DCa45Xw4DGw4j9r9Iqrs8XF1q9Fyvv347KrW3Jasa
	grs3Ww4UX34SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j6BT5UUUUU=
X-Originating-IP: [27.19.236.155]
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_041435_292307_3BA5056A 
X-CRM114-Status: UNSURE (   5.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/29/26 21:49, Charalampos Mitrodimas wrote:

> I'm under the impression that the `!RUST ||` guard here doesn't
> actually prevent the `$(bindgen-backend-option,...)` call from being
> executed. `$(...)` shell expansions should happen during the textual
> substitution phase, before symbol dependency evaluation occurs, check
> documentation at kconfig-macro-language.rst lines 228-229.

I suppose this is unavoidable if we decide to probe options rather than 
rely on version numbers.

Similar issue also occurs in `cc-option`, for example:

	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)

For 64-bit builds, `-march=rv32imv` will still be probed; for 32-bit 
builds, `-march=rv64imv` will still be probed.

I agree with Nathan that this trivial waste is worth it for the sake of 
simplicity.

Best regards,
Asuna


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
