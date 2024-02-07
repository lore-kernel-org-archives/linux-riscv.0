Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473EC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zRpPOdOZgiHn23hWdiPeLeN3wKxZpyu6MSoJUNKJSs=; b=wp+hxvOOWEmo86
	E2GQWd+C5aiadjST9ZdBm7p0wUrHkb4XONTqbUFNA1LhwpVht5VqCS6nRZrGk+jTUBepI5i/1mZNu
	PDm895FlmmZL3SAXMyzIS6GS5iwcKWV5RCn4rWk6y+xsbPv6CI+btKwNvfx/oUYQtlpzaSbf8UAPr
	gqpo27EIv7Vx21rUTEJh61pkrxEb/6WwvPq7PgNTxYJT15/RjB0NyztRv4f/BOzhInrzhegnpJnYD
	FUdOn5GQhEVhqPEEA1ClK6fd6XC3JHAPLsehpyunxsgV8d05RphysVzcGbJLpGDMlyMYaEx23QAPH
	LlHNYZ1tEwtM0l8m+hSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcOf-00000009wqU-1n7k;
	Wed, 07 Feb 2024 07:31:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcOc-00000009wq5-1S68
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 07:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAC2E60AE9;
	Wed,  7 Feb 2024 07:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB2DC43390;
	Wed,  7 Feb 2024 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707291061;
	bh=peaUftXrWic18CddrBoaXETZSCSrNh8TslugLOSvkCc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GGp0VCw2X51EtMDNXx1G6fetOHUR7yDlPXgybkXspa9fS369foFEpGFgJmBCAfLLN
	 SHsFXrJ9QaywGjYulhRdz/cR3nol8JMP7xgQ1PX3W1Uu+nwSi3t4myf0cNYyiC/jJP
	 eej6At8hHcdrcJFtZd37r5xRmbMofe4oPOPOVnqMVeZi1NNsNRVC90il6VzPDp3YeV
	 2z8eafu6s1V5ip8CJmmfRc7zE+P7ebFN63VNcDYVRvcyhp2vr/vtiFqzZCP6IFN4kb
	 aYkQLKXHRM6Y6ASUGzpZ0b2u4vvR0i6q1Wnp/PqAlIDXen5BCTMVn34UFbdDZMlh8N
	 Tmf01WrbqJieQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBl?=
 =?utf-8?B?bA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH] riscv: Fix text patching when icache flushes use IPIs
In-Reply-To: <20240206204607.527195-1-alexghiti@rivosinc.com>
References: <20240206204607.527195-1-alexghiti@rivosinc.com>
Date: Wed, 07 Feb 2024 08:30:58 +0100
Message-ID: <87v87091e5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_233102_450788_36E0A6E3 
X-CRM114-Status: UNSURE (   7.86  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEZvciBu
b3csIHdlIHVzZSBzdG9wX21hY2hpbmUoKSB0byBwYXRjaCB0aGUgdGV4dCBhbmQgd2hlbiB3ZSB1
c2UgSVBJcyBmb3IKPiByZW1vdGUgaWNhY2hlIGZsdXNoZXMsIHRoZSBzeXN0ZW0gaGFuZ3Mgc2lu
Y2UgdGhlIGlycXMgYXJlIGRpc2FibGVkIG9uIGFsbAo+IGNwdXMuCj4KPiBTbyBpbnN0ZWFkLCBt
YWtlIHN1cmUgZXZlcnkgY3B1IGV4ZWN1dGVzIHRoZSBzdG9wX21hY2hpbmUoKSBwYXRjaGluZwo+
IGZ1bmN0aW9uIHdoaWNoIGVtaXRzIGEgbG9jYWwgaWNhY2hlIGZsdXNoIGFuZCB0aGVuIGF2b2lk
cyB0aGUgdXNlIG9mCj4gSVBJcy4KPgo+IENvLWRldmVsb3BlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0
aUByaXZvc2luYy5jb20+CgpGV0lXLCB0aGUgQlBGIHNlbGZ0ZXN0cyBwYXNzIG5pY2VseSB3aXRo
IHRoaXMgKGVzcGVjaWFsbHkgdGhlCmZlbnRyeS9mZXhpdCB0ZXN0cyA7LSkpLiBJIGRvbid0IGtu
b3cgaWYgaXQncyB3b3J0aCBtdWNoIHNheWluZyB0aGF0CnlvdXIgb3duIHN0dWZmIHdhcyB0ZXN0
ZWQsIGJ1dCBoZXJlIGdvZXM6CgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
