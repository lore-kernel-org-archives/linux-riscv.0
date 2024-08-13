Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5423BC52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GosQljPXho+D90yNrjuKO6TNK16t7dyu/guGyWQDJ3c=; b=DYD7GAZfWkNjGX
	lxVvHhrGHZ+u/tHuFpnrLsiN3QlDdJbWo0BBdPLVl240GmUHlhwDFSsOCeS+0/JctkJlXFqNneIJJ
	3QXu157bjtEZ6L+GmY2NrxZt318fWKU7poazh2jCQMs8A1lj4HZMowS226gWpjphC1LDFzt+LC7I8
	DoNO0LdSjQlVyGAu3VsJaqKf+OxoHb40k/BZ8JkderY31UgA2oN5QaKCZZjgAvo1pPm13dFHKK3AY
	YdWFr4g+thWxm8y7tfoY7UAV7hT6zCyep6k+4G/l2fFmxhqZhceRlkDdUfP8ZzyoB5CxNRC6dNlzm
	FkyKnr7rQyj+ukiRqULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpQx-00000003Sho-1xFH;
	Tue, 13 Aug 2024 11:11:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpQv-00000003ShP-0Wmi
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 11:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DF3861632;
	Tue, 13 Aug 2024 11:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EACC4AF0B;
	Tue, 13 Aug 2024 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723547479;
	bh=7vMHxHM8TbnXx+CW98SMeo13Ag/I/2RdZ+PSHBbBZcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OjCvZe0xH8EUIyX5H9zqZY2xV/EjiUon2wi6mGqbET0G465tITzVLs0SXkhMz+Ylh
	 hJqCx8/i9EtDCNb0GGgy+OFOsGk6W8elpacVMFYpr0Il+Emw0DDzJ8cBnA4M2I9Wxy
	 15M0FjO6wYzyGVymwnNy2PxtuvnZk5N/HCSh3Ubz6xn3pABNmdOoV61uiUU+lGqb3U
	 VU71eAge68VeHKcqu/66h50rdxu2wp/DOdKvWxpom5TM7gtavnZuZIZO6iMrr/2vij
	 JhvvFf1udeeMFBIyjj+eGyCB9ZUhUY6oYRf8EqhYwHMntAf0fa0PXbeoJv31NYVH4C
	 THdmz7rCl7yQA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li
 <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, Andy Chiu
 <andy.chiu@sifive.com>
Subject: Re: [PATCH v2 2/6] riscv: ftrace: align patchable functions to 4
 Byte boundary
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-2-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-2-1e5f4cb1f049@sifive.com>
Date: Tue, 13 Aug 2024 13:11:16 +0200
Message-ID: <8734n8ad9n.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_041121_230871_9CC020A0 
X-CRM114-Status: UNSURE (   9.15  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBXZSBhcmUgY2hhbmdp
bmcgZnRyYWNlIGNvZGUgcGF0Y2hpbmcgaW4gb3JkZXIgdG8gcmVtb3ZlIGRlcGVuZGVuY3kgZnJv
bQo+IHN0b3BfbWFjaGluZSgpIGFuZCBlbmFibGUga2VybmVsIHByZWVtcHRpb24uIFRoaXMgcmVx
dWlyZXMgdXMgdG8gYWxpZ24KPiBmdW5jdGlvbnMgZW50cnkgYXQgYSA0LUIgYWxpZ24gYWRkcmVz
cy4KPgo+IEhvd2V2ZXIsIC1mYWxpZ24tZnVuY3Rpb25zIG9uIG9sZGVyIHZlcnNpb25zIG9mIEdD
QyBhbG9uZSB3YXMgbm90IHN0cm9uZwo+IGVub3VuZ2ggdG8gYWxpZ24gYWxsIGZ1bmN0aW9ucy4g
SW4gZmFjdCwgY29sZCBmdW5jdGlvbnMgYXJlIG5vdCBhbGlnbmVkCj4gYWZ0ZXIgdHVybmluZyBv
biBvcHRpbWl6YXRpb25zLiBXZSBjb25zaWRlciB0aGlzIGlzIGEgYnVnIGluIEdDQyBhbmQKPiB0
dXJuIG9mZiBndWVzcy1icmFuY2gtcHJvYmlsaXR5IGFzIGEgd29ya2Fyb3VuZCB0byBhbGlnbiBh
bGwgZnVuY3Rpb25zLgo+Cj4gR0NDIGJ1ZyBpZDogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxs
YS9zaG93X2J1Zy5jZ2k/aWQ9ODgzNDUKPgo+IFRoZSBvcHRpb24gLWZtaW4tZnVuY3Rpb24tYWxp
Z25tZW50IGlzIGFibGUgdG8gYWxpZ24gYWxsIGZ1bmN0aW9ucwo+IHByb3Blcmx5IG9uIG5ld2Vy
IHZlcnNpb25zIG9mIGdjYy4gU28sIHdlIGFkZCBhIGNjLW9wdGlvbiB0byB0ZXN0IGlmCj4gdGhl
IHRvb2xjaGFpbiBzdXBwb3J0cyBpdC4KPgo+IFN1Z2dlc3RlZC1ieTogRXZnZW5paSBTaGF0b2to
aW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
