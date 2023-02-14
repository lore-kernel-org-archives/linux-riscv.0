Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783CAC05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVF4N1DzRm4ApB7ZRBEGqh9M4+YzJiDGfNTgF7s5ELY=; b=KCvAKVCXoj1vjX
	0iH391YMcyzW+/G19WBBGCUlvFthEkDecWmTpqw3jv8MBl0P6cRpiU/gh0aV98P9FbccxftC/vsmc
	oLgBKUqYsfOpXmu9YuDjhpeR/ctXCtR+cIkbEOpduSnr8vaiGPHR4+3UTyRjOem2LdbedczKkwoyy
	QKHRGHC3rITqApI2Bcyu/7ufvmvjBg3DCtRRZAs7EA3QoXnSbHj3arbhlZ8JSG6Vz7IkTvKMA3Yeu
	I5ykTct5dTBQnCOB4H33SkEtLDcc2WfAsBuUNF6/bNQN99F72k/ICWIx9lNuh5KXYecImVnguSCcc
	H61l9ALM95PokgOGx9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyWC-002u0G-N4; Tue, 14 Feb 2023 16:51:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyW9-002tyd-5a; Tue, 14 Feb 2023 16:50:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7ED2EB81E23;
	Tue, 14 Feb 2023 16:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEEBC433EF;
	Tue, 14 Feb 2023 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676393454;
	bh=+9E7Tqas2/JykgI0ScHyuFBVkpuRb5O4ER6iJ0JOtcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k5zbhWh3OOZcPt2A0J12+DRrPnyvVAyQta5Ct5b1A2vWRj/6RJRXswQC74ywJpkDu
	 T05HTqv22RYv2LHiGis+Rn8+YdWEwvv6pxn/Vlx+iMLv6iiu5QlqNncfF1KP6EVnI+
	 SzvvljFmPy6TsUWIcCAdH5esqkuep7zZiSu+EMhLP+6kymCvr2QzoWr7jKEV7p+kb7
	 GTrAn+57A+PsT+hA7rBCEe+sRgRKIs+tzfizhYRb0AzDp6fqsuz5bEvbyghXnbZBGO
	 xmhjodxoZGYHoYxOzqwUErbfbhILbFzaGW7RgDRHxT4MxnO9mhIHNtiVLWArnV6vXV
	 DC0ZMLiE27BLA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 greentime.hu@sifive.com, guoren@linux.alibaba.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones
 <ajones@ventanamicro.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Li Zhengyu
 <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
 <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
Date: Tue, 14 Feb 2023 17:50:51 +0100
Message-ID: <873578faxg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_085057_533236_9B125CDD 
X-CRM114-Status: GOOD (  23.97  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBIZXkgQmrDtnJuLAo+
Cj4gT24gVHVlLCBGZWIgMTQsIDIwMjMgYXQgMjo0MyBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPj4gU28sIHR3byBjaGFuZ2VzOgo+Pgo+PiAxLiBEaXNhbGxvdyBW
LWVuYWJsZW1lbnQgaWYgdGhlIGV4aXN0aW5nIGFsdHN0YWNrIGRvZXMgbm90IGZpdCBhIFYtc2l6
ZWQKPj4gICAgZnJhbWUuCj4gVGhpcyBjb3VsZCBwb3RlbnRpYWxseSBicmVhayBvbGQgcHJvZ3Jh
bXMgKG5vbi1WKSB0aGF0IGxvYWQgbmV3IHN5c3RlbQo+IGxpYnJhcmllcyAod2l0aCBWKSwgSWYg
dGhlIHByb2dyYW0gc2V0cyBhIHNtYWxsIGFsdCBzdGFjayBhbmQgdGFrZXMKPiB0aGUgZmF1bHQg
aW4gc29tZSBsaWJyYXJpZXMgdGhhdCB1c2UgVi4gSG93ZXZlciwgZXhpc3RpbmcKPiBpbXBsZW1l
bnRhdGlvbiB3aWxsIGFsc28ga2lsbCB0aGUgcHJvY2VzcyB3aGVuIHRoZSBzaWduYWwgYXJyaXZl
cywKPiBmaW5kaW5nIGluc3VmZmljaWVudCBzdGFjayBmcmFtZSBpbiBzdWNoIGNhc2VzLiBJJ2Qg
Y2hvb3NlIHRoZSBzZWNvbmQKPiBvbmUgaWYgd2Ugb25seSBoYXZlIHRoZXNlIHR3byBvcHRpb25z
LCBiZWNhdXNlIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQKPiB0aGUgc2lnbmFsIGhhbmRsZXIgbWF5
IG5vdCBldmVuIHJ1bi4KCkkgdGhpbmsgd2UgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgdmlld3MgaGVy
ZS4gQSBwcm9jZXNzIGhhcyBhIHByZS1WLCBhIGFuZApwb3N0LVYgc3RhdGUuIElzIGFsbG93aW5n
IGEgcHJvY2VzcyB0byBlbnRlciBWIHdpdGhvdXQgdGhlIGNvcnJlY3QKcHJlY29uZGl0aW9ucyBh
IGdvb2QgaWRlYT8gQWxsb3cgdG8gcnVuIHdpdGggViB0dXJuZWQgb24sIGJ1dCBub3QgYWJsZQp0
byBjb3JyZWN0bHkgaGFuZGxlIGEgc2lnbmFsICh0aGUgc3RhY2sgaXMgdG9vIHNtYWxsKT8KClRo
aXMgd2FzIHRoZSBzYW1lIGFyZ3VtZW50IHRoYXQgdGhlIEludGVsIGZvbGtzIGhhZCB3aGVuIGVu
YWJsaW5nCkFNWC4gU3VyZSwgQU1YIHJlcXVpcmVzICpleHBsaWNpdCogZW5hYmxlbWVudCwgYnV0
IHNhbWUgcnVsZXMgc2hvdWxkCmFwcGx5LCBubz8KCj4+IDIuIFNhbml0aXplIGFsdHN0YWNrIGNo
YW5nZXMgd2hlbiBWIGlzIGVuYWJsZWQuCj4gWWVzLCBJJ2QgbGlrZSB0byBoYXZlIHRoaXMuIEJ1
dCBpdCBtYXkgYmUgdHJpY2t5IHdoZW4gaXQgY29tZXMgdG8KPiBkZWNpZGluZyB3aGV0aGVyIFYg
aXMgZW5hYmxlZCwgZHVlIHRvIHRoZSBmaXJzdC11c2UgdHJhcC4gSWYgViBpcwo+IGNvbW1vbmx5
IHVzZWQgaW4gc3lzdGVtIGxpYnJhcmllcyB0aGVuIGl0IGlzIGxpa2VseSB0aGF0IFYgd2lsbCBi
ZQo+IGVuYWJsZWQgYmVmb3JlIGFuIHVzZXIgc2V0IGFuIGFsdHN0YWNrLiBTYW5pdGl6aW5nIHRo
aXMgY2FzZSB3b3VsZCBiZQo+IGVhc3kgYW5kIHN0cmFpZ2h0Zm9yd2FyZC4gQnV0IHdoYXQgaWYg
dGhlIHVzZXIgc2V0cyBhbiBhbHRzdGFjayBiZWZvcmUKPiBlbmFibGluZyBWIGluIHRoZSBmaXJz
dC11c2UgdHJhcD8gVGhpcyBjb3VsZCBoYXBwZW4gb24gYSBzdGF0aWNhbGx5Cj4gcHJvZ3JhbSB0
aGF0IGhhcyBoYW5kLXdyaXR0ZW4gViByb3V0aW5lcy4gVGhpcyB0YWtlcyB1cyB0byB0aGUgMXN0
Cj4gcXVlc3Rpb24gYWJvdmUsIHNob3VsZCB3ZSBmYWlsIHRoZSB1c2VyIHByb2dyYW0gaW1tZWRp
YXRlbHkgaWYgdGhlCj4gYWx0c3RhY2sgaXMgc2V0IHRvbyBzbWFsbD8KCkZvciBtZSBpdCdzIG9i
dmlvdXMgdG8gZmFpbCAoYWx3YXlzKSAiaWYgdGhlIGFsdHN0YWNrIGlzIHRvbyBzbWFsbCB0bwpl
bmFibGUgViIsIGJlY2F1c2UgaXQgYWxsb3dzIHRvIGV4ZWN1dGUgViB3aXRob3V0IHByb3BlciBw
cmVjb25kaXRpb25zLgoKUGVyc29uYWxseSwgSSBwcmVmZXIgYSBzdHJpY3RlciBtb2RlbC4gT25s
eSBlbnRlciBWIGlmIHlvdSBjYW4sIGFuZAphZnRlciBlbnRlcmluZyBpdCBkaXNhbGxvdyBjaGFu
Z2luZyB0aGUgYWx0c3RhY2suCgpUaGVuIGFnYWluLCB0aGlzIGlzICpteSogb3BpbmlvbiBhbmQg
Y29uY2Vybi4gV2hhdCBkbyBvdGhlciBwZW9wbGUKdGhpbms/IEkgZG9uJ3Qgd2FudCB0byBzdGFs
bCB0aGUgc2VyaWVzLgoKPj4KPj4gT3RoZXIgdGhhbiB0aGUgYWx0c3RhY2sgaGFuZGxpbmcsIEkg
dGhpbmsgdGhlIHNlcmllcyBpcyBhIGdvb2Qgc3RhdGUhIEl0Cj4+IHdvdWxkIGdyZWF0IGlmIHdl
IGNvdWxkIHNlZSBhIHYxNCBsYW5kIGluIC1uZXh0Li4uCj4gVGhhbmtzLiBJIGFtIHJlZm9ybWlu
ZyB0aGUgdjE0IHBhdGNoIGFuZCBob3BpbmcgdGhlIHNhbWUgdG8gaGFwcGVuIHNvb24gdG9vIQoK
VGhhbmsgeW91IGZvciB5b3VyIGhhcmQgd29yayEgSXQgd291bGQgYmUgYXdlc29tZSB0byAqZmlu
YWxseSogaGF2ZQp2ZWN0b3Igc3VwcG9ydCBpbiB0aGUga2VybmVsIQoKCkJqw7ZybgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
