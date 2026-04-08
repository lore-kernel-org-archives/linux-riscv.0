Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959FFFF513A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 02:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoUlgpwvLcC4FmmM4WG6CQWhxcck5R3xy5pOliM9V7A=; b=rCDtGUl5u4JBcd
	LGQubnVJgar0NTW0gZha/xbWKs+3WLp4XyrsecTyK79NV8mO+DOORNHmp5lns8s71i5ouZhiyBdV9
	oy7jgxCzKE7BBbKYYCrKjCXBJotzy/q9GbXVRDt9SY7GZYgEKXRONJE0q5DYMjoN5ND5hy6LK0XA6
	OXYr0ovJeMcCVKJiYGta76hw+pJN0ndhhuQ1TuWfqqzKgfjiBOMCKFv+Cx3KxA4pN353kxg+iJezT
	b+V9EVBHBGU8KvZjY3Q8PqbwIQSf/h9uALWupUH0vcAd2A4EfShrRodSOSPGFNpw0oaP4jpwZquEr
	rr0a2rxRPkEXGhvmKr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIyy-000000088zB-2Nkp;
	Wed, 08 Apr 2026 02:49:32 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIyu-000000088y0-2AFp
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 02:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775616502;
	bh=yidXhTBb2zJgYkyCk0CYWabO2JRCWHqEgQlmxubluYo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=atl3iZzki/j71RL0gSmeLB+ZGLs6QOJDHAzrbfmcNL5awRN+UokYdbdjqL+PBttms
	 EeHqSySVR+D+7rannCfXEUEUfU1t3WOvuZiR3dyDLxl0YLIKhAblIt7gvFVkOT6vAy
	 KI8u84YCQbYDVGFhBkxDtwle+hKirFTOvWV0Skcw=
X-QQ-mid: zesmtpsz4t1775616493t5df3e19c
X-QQ-Originating-IP: UWGoQnXfI+aa6PWQBmbxd+UL7yVcZdzn5VqUhKeqiMo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Apr 2026 10:48:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8140302945074531097
EX-QQ-RecipientCnt: 11
Mime-Version: 1.0
Date: Wed, 08 Apr 2026 10:48:11 +0800
Message-Id: <DHNFIJBTZQI8.C1RI1XWDRL3Q@linux.spacemit.com>
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for
 the SpacemiT P1 chip
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vincent Legoll" <legoll@online.fr>, <linux-kernel@vger.kernel.org>,
 "Lee Jones" <lee@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Yixun Lan" <dlan@gentoo.org>,
 <linux-i2c@vger.kernel.org>, "Aurelien Jarno" <aurelien@aurel32.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401165437.1048786-3-aurelien@aurel32.net>
 <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
 <adPUTRAlzGBs2wQG@aurel32.net>
 <bbd2e57f-3107-46cc-a8a7-ee717e577d6e@online.fr>
In-Reply-To: <bbd2e57f-3107-46cc-a8a7-ee717e577d6e@online.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXdazUCb/CBOkLJDmIC8M8bgAvWpoDUUVwSBSDgEz8pGQhMdR25Q2gZN
	X492gJrHD4HOyPINe/n+qPincr25l65Z/vtZbQ/XQA/1Jeb7mIE+Rm51JYJ7K2co9IOqI3S
	lSMmIpJh4WWRrmv7AN1fkZ9IfItmVccXaAXDPgHVsJeNqn2G1QM11JbicweYhPhWHNUX5NP
	AhwI1o8yuxBgKEmc+ZlhjGBAXyXLOC+QWbeqp5cMIfKjwDWSAR+SYoQ6jN5w/Xzfb/AgEMd
	Zuic+v0npbf9pD3K9/qa3u+5FqP8DdVc7QJSOaMo7JPYY3P6ubL94r6otFwQsJ1pBC8r4Io
	3PKB7TuA37S43JG/1K5gV1roM01/+vsI3eluNfPNbiQdtOaIu13CVcSkJqHHEyqOluXyO4V
	GiQVbYFzt+KS0+JROdI0dmsPHENSya1sRifZ0gicDRnhR0g4imN02Cuu2CjvTZxLbcMs0hh
	eLSn8bmJ22c8Ko6B8/vvreL3lUWedAq1YBzop+LPD5iFmnd1p6v1/J84lufW3o2nLnwomQF
	egFSw+vg/Tuw1MKqfn1UuspYFaY1lwxBsgLbNxP9YMPby/to3aJLZtUM6bxs7x5g00/VQNq
	c1C6+1tYYH/C5YcynNWTiNnBmb+PwQ4e66LkyzZlEMr4XYjUVut1MPKRtN4S6XyHq6Ei7X4
	bt0G83eDUB2O6E1ahqXkTTA97EobVHFZXF67BDat+Ui1HO5bTUm6preW3dqAjI5Y+Q/D7bO
	rwE0rrgprxD4tPFdnOam8ALoX82+TrX5OQBebsTemLtVxXLDb/UCQpz+2M8FbuYEgKZ4qoJ
	MxWmco3ZrBfF9Fgeubnwh6R8KPYVoJSJ9oLd5XbLFEhmrfxi+mLJJgR/z4EiO4if9rZqx1n
	fKkTduRhaYC7zjjMqTpUnKSSVk3e121A9sJhT7uvzyudzKVVvRe1EZOw2GQVqIIp8hBTYwy
	CfyVcKg9WrrjTRpo6R5H2eoiawG+GtxUjaEYhKA0VRU+LjmE8855aNMx55Y1VzVquDxH2qI
	yYqFr5cnsZEjzYwUAGUz0/O7I6YfJlm12oUQ7aGH/+V7ULvxfvJGQu2BBlsSDyr7yv3IiYp
	+wlVrSzw+wKZlrzfrNOTAq6vzYOouMpB8n3WCcEsM05h/5/U6WuCrZ8Vo3aMppjTg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_194929_633899_4F7DF2ED 
X-CRM114-Status: GOOD (  11.46  )
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

T24gVHVlIEFwciA3LCAyMDI2IGF0IDU6NTUgQU0gQ1NULCBWaW5jZW50IExlZ29sbCB3cm90ZToK
PiBIaSBBdXJlbGllbiwKPgo+IE9uIDQvNi8yNiAxNzo0MiwgQXVyZWxpZW4gSmFybm8gd3JvdGU6
Cj4+IE9uIDIwMjYtMDQtMDYgMTE6NDYsIFZpbmNlbnQgTGVnb2xsIHdyb3RlOgo+Pj4gVGVsbCBt
ZSBpZiB0aGVyZSdzIGEgbmV3IGl0ZXJhdGlvbiB0byB0ZXN0LCBhbmQvb3IgaWYgeW91IHdhbnQg
bWUgdGVzdGluZyBpdAo+Pj4gaW4gYSBkaWZmZXJlbnQgd2F5Lgo+PiBZZXMsIGFzIHdyaXR0ZW4g
aW4gdGhlIG9yaWdpbmFsIG1haWwsIHRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiBQSU8KPj4gc3Vw
cG9ydCBpbiB0aGUgc3BhY2VtaXQgSTJDIGRyaXZlcjoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDI2MDIwNy1iNC1rMy1pMmMtcGlvLXY3LTItNjI2OTQyZDk0ZDkxQGxpbnV4LnNw
YWNlbWl0LmNvbS8KPj4KPj4gV2l0aG91dCBpdCwgeW91IG1pZ2h0IGdldCB0aGlzIHdhcm5pbmcg
bWVzc2FnZSBhbmQgcmVib290IGlzIG5vdCAxMDAlCj4+IHJlbGlhYmxlLiBJIHN0aWxsIGJlbGll
dmUgaXQncyBiZXR0ZXIgdGhhbiBubyByZWJvb3Qgc3VwcG9ydCBhdCBhbGwuCj4KPgo+IE9LLCBJ
IHRlc3RlZCBhIG5ldyBzdGFjazogbmV4dC0yMDI2MDQwNiwgUElPIHBhdGNoc2V0LCByZXNldMKg
cGF0Y2hzZXTCoCYgCj4gVVNCwqBwYXRjaHNldDoKPgo+Cj4gJCBnaXQgbG9nIC0tb25lbGluZQo+
IDUwMzAzNjliMzJjNCAoSEVBRCAtPiBvcGlydjItcGlvLXJlc2V0LXVzYikgcmlzY3Y6IGR0czog
c3BhY2VtaXQ6IEVuYWJsZSAKPiBVU0IzLjAvUENJZSBvbiBPcmFuZ2VQaSBSVjIKPiA3MzI3NGNl
Mzc0NDEgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IERlZmluZSB0aGUgUDEgUE1JQyByZWd1bGF0b3Jz
IGZvciAKPiBPcmFuZ2VQaSBSVjIKPiBjZGExMmI4YmRiZmUgcmlzY3Y6IGR0czogc3BhY2VtaXQ6
IEVuYWJsZSBpMmM4IGFkYXB0ZXIgZm9yIE9yYW5nZVBpIFJWMgo+IDY4Y2U0MDkzNTFjNiAob3Bp
cnYyLXBpby1yZXNldCkgbWZkOiBzaW1wbGUtbWZkLWkyYzogYWRkIGEgcmVib290IGNlbGwgCj4g
Zm9yIHRoZSBTcGFjZW1pVCBQMSBjaGlwCj4gMjQ1ZTBiOGU4YTkxIGkyYzogc3BhY2VtaXQ6IGlu
dHJvZHVjZSBwaW8gZm9yIGsxCj4gYTU4OGQ3NTY2MjFkIGkyYzogc3BhY2VtaXQ6IG1vdmUgaTJj
X3hmZXJfbXNnKCkKPiA4MTZmMTkzZGQwZDkgKHRhZzogbmV4dC0yMDI2MDQwNiwgbmV4dC9tYXN0
ZXIsIG5leHQvSEVBRCkgQWRkIGxpbnV4LW5leHQgCj4gc3BlY2lmaWMgZmlsZXMgZm9yIDIwMjYw
NDA2Cj4KPiBUaGlzIGJvb3RzIGFuZCByZXNldCBwcm9wZXJseSB3aXRob3V0IHRoZSBwcmV2aW91
cyBXQVJOLgo+Cj4gU28gaWYgYW55IG9mIHRob3NlIHRob3NlIHNlcmllcyBuZWVkIGFkZGVkIFQt
QnMsIHRoZW4gaGVyZSdzIG1pbmU6Cj4KPiBUZXN0ZWQtYnk6IFZpbmNlbnQgTGVnb2xsPGxlZ29s
bEBvbmxpbmUuZnI+ICMgT3JhbmdlUGktUlYyCkknbGwgdGFrZSB0aGlzIHRhZyB0byBteSBQSU8g
cGF0Y2hzZXQuIFRoYW5rcyEKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
