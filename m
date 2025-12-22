Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D019BD711D5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DkdxIJad3svMVOXvXveCk1lzJqdoqY+B7+BWwth7DM=; b=Y4fR8rIFWnX2Re
	hejbdJtGeAZDXYZHoxH19uoLFOwF6ZsXZda0c/K6BJJFts5f0Fh4Wu6KG0bIh8qOTyEQa4vdcn7+Y
	XN+3SNU0DlBxxrFP9S5VMZLwJFHdj+ANrWBeUAoFeY71aBOEuX+giO+gc96b9NytxOdAoCzApoxFG
	VEXYoj53yZEB9zojkIlt6ulA8W9uHfO9V0jKP1Nu9YA/13UGQrqrxFw4p4ovkWwMzssr/tyUYXid5
	n5WtfJXRRvKZrWEiCzeR3LbT8FbAs8mj7M81basSCxlqJjwnoCmXanMv7OisLnG6iDbP+v1zJnIyk
	KvcoEa8XHg83JrYucF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcM1-0000000DWlV-0NR6;
	Mon, 22 Dec 2025 09:37:25 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcLx-0000000DWkn-2etd
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 09:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766396164;
	bh=HsbEwL+a3ehQwaqo4UIyfPjDh/hFR3Gu+Q/uCtPiRcM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FeQN+0ivvzkZvaMy2YHQO7aBztQanzf01RZheYchbmsZ3KefH6IUtP+u6gBpaEIFD
	 oEqpS771fF0mK+wNMPJbUjfEelNpJRcixXjD4gyIAuG1AH1TTVYBXTsF46AUDD01Xk
	 n3pP33SbV6eUGWvtOtf8Qr9sINXowTPUZ/oiMKYc=
X-QQ-mid: zesmtpsz4t1766396162te0c85235
X-QQ-Originating-IP: rk4yZ8PstRgyj0RWzoU0G3baXYfMJuIshSlWznk2Z4g=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 17:36:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11526639101067456687
EX-QQ-RecipientCnt: 16
Date: Mon, 22 Dec 2025 17:36:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, patchwork-bot+linux-riscv@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, dlan@gentoo.org,
	elder@riscstar.com, andi.shyti@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <5242B57B5E933BCD+aUkRAGxI5ABW-s3O@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
 <20251219112634.GJ9275@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219112634.GJ9275@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M2u8sn5kZ8jXvSoPKmPqxVlUuLICsF7PMKgBMBABQH+8lu97CgM3O6I2
	3eegY8p6eemlULXBPYWg4MsvYO7XwTq/KUMnu8gonrlFvE049f/FVESRhpwnRUhTgvQEAY+
	hNJrVC46dQUyRU1Ea0XnYNDN7dRTJMw2OoLYDbw6IPuO6owDvlY0ZXMIZ4B5h8qzc8eFVN8
	VBbrP3K6dA4zNRwKay9eb/C98roNVlPjrtL0vh20jTM9ai6RlHvIZiDvth8F9E7Pj5i6Y7l
	DL3oaD5jeKuBpgmH9v1+MO+cRR5eo7RvE+8EInYuBlyHgod4FdgS8+M7vXWmPPeMsOOBfJ9
	h8y0fR3lDF8PerdeTDgFtieBH+HuS6bKxw9qM7Mdmdb34hpxVEMOylLspj+w/mHnap1qmWj
	PSwBx0PqQipLkad3f4d0OFUMIqbxNcCTjtJ0QZpIA65+q17gB4Z20tr1hinyhxx43Vf/hBj
	o/MGKhgONpPkCBCVqLMo0zjZZM66Jp14MsklYmBS6g+ujo9j1NcPXc7vka+TdGb4HIqiM3h
	Jpwt+5y8SUDkG3X42j5rLFW7YhaG4lzv/s85uYt2Ls8wPGn44aulzGgnIvxjVz7+0GBS+U1
	CzHe5iMeWXSry9Cu5eUQTN5+34mo5NGEYI0AYUSwSfhbg6AgATlXmcJdE4H19pzjFxNoP/y
	4c22alXagbaXSAk3JNYzi9M4SS+5dauPUVer1ufgZM26WAVVx8j2bjraSRcEu3Ue66lFprV
	mXyxxUrL/TxI8yHTSi39GCJTPMNB18Pa0CWzIScmjlpYC3oxYPtQO5R2GNw/GxPm9mlsaei
	qKGmKbl+Dov5DEMvXlr+Bm3u3OG3rK0VGN+k4UXLI7wVVmzxZo1fGW9VmiOMEy8h8S+VLz9
	6G2IGww9AuvD7Tc5eEdr4+fqCc413d2qYeVaHBOX2bIO+vOnybxYDBjmgQnxNo7qsFqYCav
	O/h7fmdiMEainLQiC3PLOLuh9Jui/4UjWDXke70H0u1c1Yw0r+qtzJjkDKGuBfQPuy8tUaW
	xt8bZ+RRjyMYwx3j+n3OsDDS+ZY8EhQl7IrP1UEKC3ogGC623C/Gyy2Zk04G3nfgN4ivtW7
	VQBoL7vvBNlUEe09K+4krMBFH1xA7/haC/1cJ7MsXdZ
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_013722_144784_452FEB2C 
X-CRM114-Status: GOOD (  19.45  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTE6MjY6MzRBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEhpIEtvbnN0YW50aW4sCj4gCj4gPiBUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNj
di9saW51eC5naXQgKGZpeGVzKQo+ID4gYnkgQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjoKPiA+IAo+ID4gT24gVHVlLCAxOCBOb3YgMjAyNSAxNDowODow
NCArMDgwMCB5b3Ugd3JvdGU6Cj4gPiA+IFNpbmNlIFAxIEtjb25maWcgZGlyZWN0bHkgc2VsZWN0
cyBLMV9JMkMsIGFmdGVyIHRoZSBJMkMgSUxDUiBwYXRjaCB3YXMKPiA+ID4gbWVyZ2VkLCB0aGUg
ZHJpdmVyIHdvdWxkIGZhaWwgWzFdIHdoZW4gQ09NTU9OX0NMSyB3YXMgbm90IHNlbGVjdGVkLgo+
ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgZml4ZXMgdGhlIFAxIEtjb25maWcgYW5kIHJlc2VuZHMg
dGhlIEkyQyBJTENSIHBhdGNoKFRoaXMKPiA+ID4gcGF0Y2ggaGFzIHJldmVydGVkIGJ5IG1haW50
YWluZXIgWzJdKS4KPiA+ID4gCj4gPiA+IE5vdywgUDEgS2NvbmZpZyBwYXRjaCBoYXMgYmVlbiBt
ZXJnZWRbM10sIHNvIEkyQyBJTENSIHBhdGNoIGNhbiBiZQo+ID4gPiBtZXJnZWQgYXMgd2VsbC4K
PiA+ID4gCj4gPiA+IFsuLi5dCj4gPiAKPiA+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5r
czoKPiA+ICAgLSBbdjMsMS80XSBpMmM6IHNwYWNlbWl0OiBjb25maWd1cmUgSUxDUiBmb3IgYWNj
dXJhdGUgU0NMIGZyZXF1ZW5jeQo+ID4gICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gPiAgIC0g
W3YzLDIvNF0gcnRjOiBzcGFjZW1pdDogTUZEX1NQQUNFTUlUX1AxIGFzIGRlcGVuZGVuY2llcwo+
ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8xNmJkOTU0YzkzMzYKPiA+ICAg
LSBbdjMsMy80XSByZWd1bGF0b3I6IHNwYWNlbWl0OiBNRkRfU1BBQ0VNSVRfUDEgYXMgZGVwZW5k
ZW5jaWVzCj4gPiAgICAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiAKPiA+ICAgLSBbdjMsNC80XSBt
ZmQ6IHNpbXBsZS1tZmQtaTJjOiBhZGQgZGVmYXVsdCB2YWx1ZQo+ID4gICAgIChubyBtYXRjaGlu
ZyBjb21taXQpCj4gCj4gSSB3YXMganVzdCBhYm91dCB0byBzZW5kIGFub3RoZXIgc25vdC1vLWdy
YW0gYWJvdXQgcGVvcGxlIHBpY2tpbmcgdXAKPiBwYXRjaGVzIHdpdGhvdXQgdGhlIGNvcnJlY3Qg
QWNrcywgYnV0IEkganVzdCByZWFsaXNlZCB0aGlzIGlzIHRoZSBzYW1lCj4gUGF0Y2h3b3JrIGlz
c3VlIHdlIHNwb2tlIGFib3V0IGEgY291cGxlIG9mIHdlZWtzIGFnby4KPiAKPiBUaGlzIGZvcm1h
dHRpbmcgaXMgdmVyeSBjb25mdXNpbmcsIHNpbmNlIGF0IGZpcnN0IGJsdXNoIGl0IGxvb2tzIGFz
Cj4gdGhvdWdoIHRoZSB3aG9sZSBwYXRjaC1zZXQgd2FzIGFwcGxpZWQuCj4gCj4gUGxlYXNlIGNh
biB3ZSBvbmx5IGxpc3QgcGF0Y2hlcyB0aGF0IHdlcmUgbWVyZ2VkPwpJIGFncmVlLiBBdCBmaXJz
dCBnbGFuY2UsIEkgYWxzbyB0aG91Z2h0IHRoZSBlbnRpcmUgc2VyaWVzIHdhcyBhcHBsaWVkLgoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+ad
jueQvOaWr10KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
