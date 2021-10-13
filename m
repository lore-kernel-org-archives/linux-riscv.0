Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB658C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD2260F94
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AD2260F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hmc7WIB+epu0pOFM7efvkoJxnSiKD7uEQ4zJhkh68Ok=; b=ipImtyXdcKo3IbZksnuav+lE8q
	0Tf+fCljvMIjdG85w4NQYxJOE23LE7L9U80/CB2hmXaESBT9TGM9XWY5hJIVJ1iz/YEpTi+RF2c7v
	OuNHcNDa3qTOj+5S7nRLQONAKioow5T97LwmLRpJSf035YHLfXZtY9AtQF8fusgJrAsi014niAXn9
	l+vOWQ/1x3mr+cuo1Loa7uu+akMypluQyKqxLm990U9eD4D8iPZQ5Qlbs6+p7I1Dh2zYtaoYxLbSU
	pCu5ej0FRO33XDwi4ly+ZLqeCaoczx7narWZAt90b8+tYfLcjMOuPsK+TBuPvEi9FPDCIHhm6p3fg
	bC4McENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mabhg-00G40C-CC; Wed, 13 Oct 2021 10:41:44 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZj2-00Fb0u-Ae
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 08:35:02 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrfYNmw_1634114093; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrfYNmw_1634114093) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 16:34:55 +0800
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
To: Miroslav Benes <mbenes@suse.cz>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
 <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
 <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
 <alpine.LSU.2.21.2110131022590.5647@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <861d81d6-e202-09f3-f0be-6c77205f9d34@linux.alibaba.com>
Date: Wed, 13 Oct 2021 16:34:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110131022590.5647@pobox.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_013500_592959_3627D104 
X-CRM114-Status: UNSURE (   8.87  )
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

CgpPbiAyMDIxLzEwLzEzIOS4i+WNiDQ6MjUsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+Pj4gU2lk
ZSBub3RlLi4uIHRoZSBjb21tZW50IHdpbGwgZXZlbnR1YWxseSBjb25mbGljdCB3aXRoIHBldGVy
eidzIAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTI5MTUyNDI5LjEyNTk5
NzIwNkBpbmZyYWRlYWQub3JnLy4KPj4KPj4gU3RldmVuLCB3b3VsZCB5b3UgbGlrZSB0byBzaGFy
ZSB5b3VyIG9waW5pb24gb24gdGhpcyBwYXRjaD8KPj4KPj4gSWYga2xwX3N5bmNocm9uaXplX3Ry
YW5zaXRpb24oKSB3aWxsIGJlIHJlbW92ZWQgYW55d2F5LCB0aGUgY29tbWVudHMKPj4gd2lsbCBi
ZSBtZWFuaW5nbGVzcyBhbmQgd2UgY2FuIGp1c3QgZHJvcCBpdCA6LVAKPiAKPiBUaGUgY29tbWVu
dCB3aWxsIHN0aWxsIGJlIG5lZWRlZCBpbiBzb21lIGZvcm0uIFdlIHdpbGwgaGFuZGxlIGl0IGRl
cGVuZGluZyAKPiBvbiB3aGF0IGdldHMgbWVyZ2VkIGZpcnN0LiBwZXRlcnoncyBwYXRjaGVzIGFy
ZSBub3QgcmVhZHkgeWV0LgoKT2ssIHRoZW4gSSdsbCBtb3ZlIGl0IGJlZm9yZSB0cnlsb2NrKCkg
aW5zaWRlIGtscF9mdHJhY2VfaGFuZGxlcigpIGFueXdheS4KClJlZ2FyZHMsCk1pY2hhZWwgV2Fu
ZwoKPiAKPiBNaXJvc2xhdgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
