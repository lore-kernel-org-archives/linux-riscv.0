Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867ABC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 20:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGnKTZLHqjD/A6/ezb+wrSZDjjQU924WslAehe5azsg=; b=tiMBJmkpd0VNdZ
	mdjrZcsRQlRusU5MnNJI1kGKxKF4Fa62QKlJ7JiQw+648cU6goUZ/yXym7AQYMujzWM/UZnbY6Xw7
	2fJvEyKobkFKdfW039nzuiozxvTU8JR8dYKsmaQRpSrHjioGINmoNjvyzUwjgIsg+EbaelNlSDzQr
	QqZVzF//kzL4ZfKhhCBoHJCxjVPeqc07LdB2OtnY6rJ9TSSlu0CnpqKurnkiFxuggojPmlA4LtjNp
	mkx4ZHRo/sRMGc++s7PC3QWjxDESQzFy5Q3fxSdcbovj+vdSVzSjvqeg2ESnBit+3n7x8auITKFbS
	1z5EiC3kLvf1q65YKSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2y99-0000000BjhP-3k6f;
	Thu, 10 Apr 2025 20:05:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2y97-0000000BjgO-2rQl
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 20:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 720B05C55F2;
	Thu, 10 Apr 2025 20:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B75C4CEDD;
	Thu, 10 Apr 2025 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744315508;
	bh=xB7QH4zV/fAt4x4V8OQZt+unZinWPyFzE/DZ9S08CzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mHDg6yklmXjpIP2lBpFmq7w1JPCrJyco893jnpEneeUkLfsH9yXBrLuOHirArcy1m
	 umbu8TTKoIFMjoNULXKYLxvn3dlcAZLVc9LVZ/Q25ZXwKRX6jl1L9WDGFaX4e3gKxq
	 EvlaoZyriJASeInMqsZTdklfccraC1o73hMUYnrb5YQ0r/Z6tQVdogbVVHRSDg6IN5
	 FPSMgUQM++VE0xJwH1fjY9p5BCCRxfMYKPYROSkYtKGqleIaD4NXoB63WpQWO54PUr
	 XsO6gli/s4rWyblrdq5Vzx2SGgGKxk3BAcOhw6smqhqzHu0k/KASMwv49HJmTG9AUF
	 giLEECzZQIrJA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
 alexghiti@rivosinc.com, palmer@dabbelt.com, Steven Rostedt
 <rostedt@goodmis.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Evgenii Shatokhin
 <e.shatokhin@yadro.com>, Nathan Chancellor <nathan@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Puranjay
 Mohan <puranjay@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,  Alexandre Ghiti <alex@ghiti.fr>,
 paul.walmsley@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v4 01/12] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
Date: Thu, 10 Apr 2025 22:05:04 +0200
Message-ID: <871ptz940f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_130509_776171_8859F33D 
X-CRM114-Status: UNSURE (   6.11  )
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

KFRyaW1taW5nIHRoZSBDYzotbGlzdCBhIGJpdCkKCkhpIEFuZHkhCgpBbmR5IENoaXUgPGFuZHli
bmFjQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZp
dmUuY29tPgouLi4KCihPaCwgaWYgeW91IHNlbmQgYW5vdGhlciByZXZpc2lvbiwgcGxlYXNlIGFk
ZCBhIGNvdmVyLCBzbyBpdCdzIGVhc2llciB0bwpjb21tZW50IGFyb3VuZCB0aGUgZnVsbCBzZXJp
ZXMuKQoKVGhhbmtzIGEgbG90IGZvciBkb2luZyB0aGUgbGlvbiBwYXJ0IG9mIHRoaXMgc2VyaWVz
LCBBbmR5ISBXaXRoIHRoaXMgaW4KcGxhY2UsICpmaW5hbGx5KiBzdG9wIG1hY2hpbmUgd2F5IG9m
IHRleHQgcGF0Y2hpbmcgaXMgcGFzdCB1cywgYW5kIHdlCmNhbiBtb3ZlIFJJU0MtViBvdXQgZnJv
bSB0aGUgMjB0aCBjZW50dXJ5LiA7LSkKCkkgYXBwbGllZCB5b3VyIHNlcmllcywgYW5kIFN0ZXZl
bidzIHNlcmllcyBbMV0gdG8gWzJdLCBhbmQgcmFuIHRoYXQgb24KUUVNVSAocmlzY3Y2NCwgflJW
QTIzKSwgYW5kIG9uIE1pbGstViBKdXBpdGVyIChTcGFjZW1pdCBLMSkgd2l0aDoKICogQ09ORklH
X0ZUUkFDRV9TVEFSVFVQX1RFU1QKICogZnRyYWNlIGtzZWxmdGVzdAoKTm8gdmlzaWJsZSByZWdy
ZXNzaW9ucywgYW5kIG5vdyB0aGUgZnRyYWNlIGtzZWxmdGVzdCBjYW4gYWN0dWFsbHkKY29tcGxl
dGUhIEZvciB0aGUgc2VyaWVzOgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA5MTUxNTQ5
Ljc4ODA2ODkxMUBnb29kbWlzLm9yZy8KWzJdIGNvbW1pdCAzYjA3MTA4YWRhODEgKCJNZXJnZSB0
YWcgJ2xpbnV4X2tzZWxmdGVzdC1maXhlcy02LjE1LXJjMicgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3NodWFoL2xpbnV4LWtzZWxmdGVzdCIpCgoKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
