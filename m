Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F716E77188
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly5V46GN9MvTuycWtk+zAxb2ukRPFQWxQa9hwts81lg=; b=DEcl0/aQQVSy5E
	CyVVTavFG3lwR8fmNRe3yz7/Z4ddn410wtMd2/dhlL5DXahp9kprG0N+rkWrJuHRREKvQ67fLjEsh
	vicC0iWyS9doKKs7G1CShwa0Jk4/ON2f4caEI+0pq9kwz3d8TLuezAWZtGtwgNnN0e0fmLLt/AS+b
	YG6bbi2iPznxfkbaEH9ig0oURyUkfb7uannNh010vE+/QaHfJTcruTTzcf5P3JfpLOtrIsYeaxJSk
	238D+E8QNSwL/5lhKHnXaEJ7hGfRvFPaRpxTR8QLmBI2zfSDswhy4DQ+mDnVT2PJjtwW147Hg/UIe
	UjOkYg5+CAwJztjq4VPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQo15-0000000FpxS-40QS;
	Thu, 26 Dec 2024 13:35:07 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQo13-0000000FpwU-2amg
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 13:35:07 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 8FAC872C8CC;
	Thu, 26 Dec 2024 16:35:00 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 489C37CCB3A; Thu, 26 Dec 2024 15:35:00 +0200 (IST)
Date: Thu, 26 Dec 2024 15:35:00 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrea Bolognani <abologna@redhat.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Eugene Syromyatnikov <evgsyr@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v4 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <20241226133459.GA30481@strace.io>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
 <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_053505_829664_365F3DEC 
X-CRM114-Status: GOOD (  13.93  )
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

T24gVGh1LCBEZWMgMjYsIDIwMjQgYXQgMDY6NTI6NTJQTSArMDgwMCwgQ2VsZXN0ZSBMaXUgd3Jv
dGU6Cj4gVGhpcyB0ZXN0IGNoZWNrcyB0aGF0IG9yaWdfYTAgYWxsb3dzIGEgc3lzY2FsbCBhcmd1
bWVudCB0byBiZSBtb2RpZmllZCwKPiBhbmQgdGhhdCBjaGFuZ2luZyBhMCBkb2VzIG5vdCBjaGFu
Z2UgdGhlIHN5c2NhbGwgYXJndW1lbnQuCj4gCj4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3Ug
PHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1
YW5AaXNjYXMuYWMuY24+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8dXd1QGNvZWxhY2FudGh1cy5u
YW1lPgpbLi4uXQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9h
YmkvcHRyYWNlLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcHRyYWNlLmMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAuLjAyMzY5NTM1MjIxNWJiNWRlM2Y5MWMxYTZmNWVhM2I0ZjkzNzNmZjkK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJp
L3B0cmFjZS5jClsuLi5dCj4gKwlpZiAocHRyYWNlKFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPLCBw
aWQsIFBUUkFDRV9TWVNDQUxMX0lORk9fRU5UUlksICZzeXNjYWxsX2luZm9fZW50cnkpKQo+ICsJ
CXBlcnJfYW5kX2V4aXQoImZhaWxlZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGVudHJ5XG4iKTsK
PiArCXJlc3VsdC0+b3JpZ19hMCA9IHN5c2NhbGxfaW5mb19lbnRyeS0+ZW50cnkuYXJnc1swXTsK
PiArCWlmIChwdHJhY2UoUFRSQUNFX0dFVF9TWVNDQUxMX0lORk8sIHBpZCwgUFRSQUNFX1NZU0NB
TExfSU5GT19FWElULCAmc3lzY2FsbF9pbmZvX2V4aXQpKQo+ICsJCXBlcnJfYW5kX2V4aXQoImZh
aWxlZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGV4aXRcbiIpOwo+ICsJcmVzdWx0LT5hMCA9IHN5
c2NhbGxfaW5mb19leGl0LT5leGl0LnJ2YWw7CgpJJ20gc29ycnkgYnV0IHRoaXMgaXMgbm90IGhv
dyBQVFJBQ0VfR0VUX1NZU0NBTExfSU5GTyBzaG91bGQgYmUgdXNlZC4KClBUUkFDRV9HRVRfU1lT
Q0FMTF9JTkZPIG9wZXJhdGlvbiB0YWtlcyBhIHBvaW50ZXIgYW5kIGEgc2l6ZSwKYW5kIGluIHRo
aXMgZXhhbXBsZSBpbnN0ZWFkIG9mIHNpemUgeW91IHBhc3MgY29uc3RhbnRzIDEgYW5kIDIsIHdo
aWNoCmVzc2VudGlhbGx5IG1lYW5zIHRoYXQgYm90aCBzeXNjYWxsX2luZm9fZW50cnktPmVudHJ5
LmFyZ3NbMF0gYW5kCnN5c2NhbGxfaW5mb19leGl0LT5leGl0LnJ2YWwgYXJlIG5vdCBnb2luZyB0
byBiZSBhc3NpZ25lZAphbmQgd291bGQganVzdCBjb250YWluIHNvbWUgZ2FyYmFnZSBmcm9tIHRo
ZSBzdGFjay4KCkFsc28sIFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPIG9wZXJhdGlvbiByZXR1cm5z
IHRoZSBudW1iZXIgb2YgYnl0ZXMKYXZhaWxhYmxlIHRvIGJlIHdyaXR0ZW4gYnkgdGhlIGtlcm5l
bCwgd2hpY2ggaXMgYWx3YXlzIG5vbnplcm8gb24gYW55ClBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZP
LWNhcGFibGUga2VybmVsLiAgSW4gb3RoZXIgd29yZHMsIHRoaXMgZXhhbXBsZQp3aWxsIGFsd2F5
cyBlbmQgdXAgd2l0aCBwZXJyX2FuZF9leGl0KCkgY2FsbC4KCkkgd29uZGVyIGhvdyB0aGlzIHRl
c3Qgd2FzIHRlc3RlZCBiZWZvcmUgdGhlIHN1Ym1pc3Npb24uCgoKLS0gCmxkdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
