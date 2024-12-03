Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1385AE64AB6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9V55lBFnFFRT7a+r1HEeUPBLLhg5qFZPGL/mNiaDwqQ=; b=yGRnWj5qXdoNOI
	w9J7Sbi5Lv9o2nfq5dmR859eMygX4w9+/MyMegNPaMDEf9xK25FnsNkPEig5H9JO1I94CmqVZuKlV
	JxqkvskKXpPSt9cKxI/ekgCqm4KkFnLwlgL5UKqncf8tXuAOPGJrqbzi5aYZKHuTFVwTpFo2W0DHH
	8TnAqGmomN5lJv37RD4OCzsrpEF2WFSUbR1oUVng9dUXRBsNbTFdQTZQWAiU7KmDWctxpTn4cgqW2
	0xDcHUQePxJ0/I3rKLWqraiFTLJvJzdG9xR9LV0ayJNPffFHVRaQEPmXjRaksINnjvfLDcxoZ9zi0
	wEHtztxNetG8Dp9LbpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIU8l-00000009oo7-0VoP;
	Tue, 03 Dec 2024 14:44:39 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIU8h-00000009on4-1qSq
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 14:44:37 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 47C23E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1733237067; bh=yZe/rHto/yJINXzpM0VYaXBnEXiTAtPyuKao0ifLMUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=F/xs/DWxB9Q2xFJTiRE+BRDiKHj8Xg2JNDNpNKatEFAPn6Sq07CSqnIlkmho4PfwY
	 i4n8ckL5a3UEcYTNOdpkqLXDKZBfkd7+wWE0mfifon8WjKC8MyRJDp03drsPHit5qs
	 YQ9JnPohpFjFSsvMm/cRC4ssbK1H5e16wHHOhNFvdjZdWNGq1Um3S0RFtcZhc9MLLx
	 JI6jMOpobs78O2XmE6kLtD4ZuLeOTprjTa1H/Bj57GLN36L35e6RvCsN1uEfiK+MmH
	 xw0PDm5poqRVGxc5JxpvzQd/rZMdMmLU2C+NBl1lHNHgIe0+HD+RrzjY70tqcVWiiQ
	 4I9yvZTO/OnBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1733237067; bh=yZe/rHto/yJINXzpM0VYaXBnEXiTAtPyuKao0ifLMUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=fWTohsPr10f9KWPbfxCVvIwt69HevffSbsXqEZwu0WmT/iJSr6Wx4XOMh6Tw4Ad+T
	 q5eZ4Qizq7Ej1Yh2GCmzHd3vuVmhdLUhUkUpFEGb1BNl1+/gC7sjTpWuMv1FRKZXEk
	 lvtHtuet3zGS8CLJjXx3dc/4KJ1DhZTBy7XOFhii3mdZNcrDl+JORThtZRey7sxPIa
	 ElFPQLxavdFMRreKNyLlsIV+jRBOXPYHkmHEGB2PyhLbKxMQihpOo+SnmtNBOSg7a3
	 SjEGQJVx/l1YViUNgBV2f9s43som2T4UPePX0ueYyz1oFITpw/l1a2GcyHg2MwNnAg
	 Cx9inGVCixcLg==
Message-ID: <7e5ce1ce-e30a-46c5-80fb-eb52e59e4dc2@yadro.com>
Date: Tue, 3 Dec 2024 17:44:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v3 1/7] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
CC: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Mark Rutland
	<mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Andy Chiu <andybnac@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <llvm@lists.linux.dev>,
	<bjorn@rivosinc.com>, <puranjay12@gmail.com>, <alexghiti@rivosinc.com>,
	<yongxuan.wang@sifive.com>, <greentime.hu@sifive.com>, <nick.hu@sifive.com>,
	<nylon.chen@sifive.com>, <tommy.wu@sifive.com>, <eric.lin@sifive.com>,
	<viccent.chen@sifive.com>, <zong.li@sifive.com>, <samuel.holland@sifive.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-2-andybnac@gmail.com>
 <87wmghotth.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <87wmghotth.fsf@all.your.base.are.belong.to.us>
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_064436_335148_C89D5E0F 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAwMy4xMi4yMDI0IDE1OjA1LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IAo+IEFuZHkg
Q2hpdSA8YW5keWJuYWNAZ21haWwuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IEFuZHkgQ2hpdSA8
YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4+Cj4+IFNvbWUgY2FsbGVyLXNhdmVkIHJlZ2lzdGVycyB3
aGljaCBhcmUgbm90IGRlZmluZWQgYXMgZnVuY3Rpb24gYXJndW1lbnRzCj4+IGluIHRoZSBBQkkg
Y2FuIHN0aWxsIGJlIHBhc3NlZCBhcyBhcmd1bWVudHMgd2hlbiB0aGUga2VybmVsIGlzIGNvbXBp
bGVkCj4+IHdpdGggQ2xhbmcuIEFzIGEgcmVzdWx0LCB3ZSBtdXN0IHNhdmUgYW5kIHJlc3RvcmUg
dGhvc2UgcmVnaXN0ZXJzIHRvCj4+IHByZXZlbnQgZnRyYWNlIGZyb20gY2xvYmJlcmluZyB0aGVt
Lgo+Pgo+PiAtIFsxXTogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Q2ODU1OQo+Pgo+PiBSZXBv
cnRlZC1ieTogRXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4KPj4gQ2xv
c2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi83ZTdjNzkxNC00NDVkLTQy
NmQtODlhMC01OWE5MTk5YzQ1YjFAeWFkcm8uY29tLwo+PiBBY2tlZC1ieTogTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPgo+IAo+IEZpeGVzIHRhZz8KCkFzIGZhciBhcyBJIHVuZGVyc3Rh
bmQgaXQsIEZ0cmFjZSBmb3IgUklTQy1WIGhhcyBoYWQgdGhpcyBwcm9ibGVtIHNpbmNlIApzdXBw
b3J0IGZvciBGVFJBQ0VfV0lUSF9SRUdTIHdhcyBhZGRlZC4gRlRSQUNFX1dJVEhfQVJHUyBpbmhl
cml0ZWQgaXQuCgpTbywgaXQgc2hvdWxkIHByb2JhYmx5IGJlIGFzIGZvbGxvd3M6CgpGaXhlczog
YWVhNGM2NzFmYjk4ICgicmlzY3YvZnRyYWNlOiBBZGQgRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdT
IHN1cHBvcnQiKQoKSXQgaXMgbW9yZSBvZiBhIHdvcmthcm91bmQgcmF0aGVyIHRoYW4gYSBmaXgg
dGhvdWdoLCBiZWNhdXNlIGl0IGlzIHN0aWxsIAp1bmRlY2lkZWQgd2hlcmUgdGhlIHByb2JsZW0g
aXMsIGluIHRoZSBrZXJuZWwgb3IgaW4gTExWTS9jbGFuZy4gVGhhdCAKZGlzY3Vzc2lvbiB3ZW50
IG5vd2hlcmUsIHVuZm9ydHVuYXRlbHksIHNvIGl0IGlzIGJldHRlciB0byB1c2UgYSAKd29ya2Fy
b3VuZCBhbmQgbW92ZSBvbiwgSU1PLgoKPiAKPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IAoKUmVnYXJkcywKRXZnZW5paQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
