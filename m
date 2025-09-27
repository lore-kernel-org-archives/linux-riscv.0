Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D685DCAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0O9GBvD1HLVdbYD1VV5OQ0To/4w0kLe6betQGnjLZY=; b=xCGj5jR2HP716S
	7DgyJ7jvC6DgZ318ckVVMTuspIvf0yb6ef/1YVYXGtZv49DmY9Ee7ks/nIC5tL8GdKHMSxqQ66UqQ
	oyT3dDZs2i4qcvwhsD3XviSkruFU3EWlcNzyzI0rydfvIf0nMmhkorW2HN8JbAgw2ki7Iaf95umXo
	OFt9ZvqXczV0ggMB88YvUer6mzJnFkIcfRDv2KcqpI+UgrR9JeZkWl3L7diu8IjynVzgc8ZrXfnIS
	lZLyHKpRJW4iaZ306odhhzWNRHOX/9maEw7ys30kPyHeHnzBQnwpD7Blfa75BlX7wKD3NB0TdHrlq
	RKNvSeagNibo0t8xmVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2MBc-00000006shz-09M3;
	Sat, 27 Sep 2025 04:05:28 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2MBa-00000006sfh-06n9
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 04:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758945877;
	bh=dOmDpWGWjAIcXaD2K4pnaMnVFW35Nhm0axjf6jjkM94=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=UX+GXElLT6vMpIUCtKCP8d4WgsQAPMzOoEJ0LXIk8ZbPsTqw6Wj/9QAQe5IV0VzQF
	 Ujg3J2L3GceEI0o8OxoUWmVSx3FeMXIIwHvYCfQAQ7d0vLw4e5Kw0PPBFAXKQdBLbI
	 9ueoLXq8A5Pz1mbdlnJxd6Ky3XKmHZJ1T65084yo=
X-QQ-mid: zesmtpip3t1758945870tf42e45f4
X-QQ-Originating-IP: Loc1WRX0yOLpBxWTT4vSk7P4W5l8b/UGyhQf8IANPZ8=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 12:04:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8734647494709726555
EX-QQ-RecipientCnt: 9
Date: Sat, 27 Sep 2025 12:04:28 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927014547-GYA1336612@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: No4GWyI4cWt6yq7nsa2Z3T+dRhiHdHb2o95Jy8Vez7Eu1mpPog4IaybQ
	F94BrRltarg9U94Z4iG74LtXAgn6U/J+ZjAxaZsIRzCtZFFz0xtUydnG6wyUswFduybVGsr
	+gzNFgMvEs7NAi0j/TKgDVB2hYNTAtlwwhjRP5ntS8pWx69lLJ7dJwLeEUQxsfPDigq7bVZ
	yN+uvXtu7XEFnf4xdhEElPQmPNtNkk1TNZ40cQHo8k30R44w2rrOQNJk7XFz59L0umJmfy2
	mCgLLnF5Kcpe8tCu9ozfCLIxYKUzzIaytM2w5M5iYQQTxO4lOjfHSJN3RyNaOrks2m8U/5N
	0aWL8xsFlkG8SHSViPqEpsCubdpDkzT5wH1XN7uTjKPDn8bhvho8wJqWHzjfcSeMODcZVrl
	4yMylXCmjkoCCJNOH+anITlvfQQM1HSCR5AAhVmxZ6JhoO4C8idQ116YzMo/P94XgF+YIpF
	vDVg7ij0d4B4zGz8XxncRiPO469fOmVPRKmFfHpE4zJVmOfVOT2lXEM1OMOf0UqY3m2/ssB
	5geM9aG5q6vUVeXxJnGLdbuXz44Sw0Uql9mL7CnJSdJ7Ql+JGsmH2lLkbh2GMx8WVkDd4/T
	R+GZ++JMjRdjdysiY7kTlu1HPwES7tkoWWGtaifFukwNthSfBVzBHUl8fmRw9bzehi6BESi
	u1DA4Hy3xk4q1bQ6hQGWJC3m0JrQTjuDLLqHDKBHNEdSeTmcTDQkLldB/iFuEdROwjBGF64
	VyrofMpsw+L2KjgLmaWXXnUcOeynAOsloofmHiDzMoE2NUz1UpfaEVlTdEstYc/lizRh5U1
	rOnXjtRk0dFfILVMykKy45Y11TLOX4DYAojL8Gvi7+Yy+8oLZ7yif3I+QTx6boErf++zhFa
	VHmEGQ71jH45eOT0UeFeJVJ89odeHmc92YSnaqz/wPaItnI5PwrnCvZXgFPJidYdXIpr5mw
	lgWGHMv2PDh/aIGk5K62ewXQkqwldMGwWNMbVosfwph96JWbdPam3q567yc8XvIo5B5dvVF
	9nnZ5JWA6oSYVdDQs3HgCHGhHuPmuDR3ozgr+T+L3+cllSgTCcUExxOOf6lVY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_210526_438644_294D893A 
X-CRM114-Status: GOOD (  15.04  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDk6NDU6NDdBTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gCj4gT24gMTA6MDIgVGh1IDI1IFNlcCAgICAgLCBUcm95IE1pdGNoZWxs
IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIEkyQyBQSU8gZnVuY3Rpb25hbGl0eSBm
b3IgdGhlIFNwYWNlbWl0IEsxIFNvQywKPiA+IGVuYWJsaW5nIHRoZSB1c2Ugb2YgSTJDIHdpdGgg
aW50ZXJydXB0cyBkaXNhYmxlZC4KPiBJIGZlZWwgaXQncyBtb3JlIHByb3BlciB0byBzYXkKPiBz
L3dpdGggaW50ZXJydXB0cyBkaXNhYmxlZC9pbiBhdG9taWMgY29udGV4dC8KR29vZCBwb2ludC4K
Cj4gCj4gSSd2ZSBub3RpY2VkIHRoYXQgSzEgSTJDIGNvbnRyb2xsZXIgc3VwcG9ydCB0aHJlZSBk
aWZmZXJlbnQgdHJhbnNtaXNzaW9uIG1vZGU6Cj4gIG5vbi1maWZvLCBmaWZvIG1vZGUsIGRtYSBt
b2RlCj4gCj4gd2hpbGUgeW91IGFyZSB0cnlpbmcgdG8gaW1wbGVtZW50IHBpbyBzdXBwb3J0LCBJ
J2Qgc3VnZ2VzdCB0byB0aGluayBvbmUKPiBmdXJ0aGVyIHN0ZXAgaW4gdGhlIGxvbmcgcnVuIC0g
c3VwcG9ydCBtb3JlIGZpZm8vZG1hICsgbm9ybWFsL2F0b21pYyBmZWF0dXJlcywKSSB1bmRlcnN0
YW5kIHlvdXIgY29uY2VybiwgYnV0IEkgaGF2ZSByZXZpZXdlZCB0aGUgY29kZSBzdHJ1Y3R1cmUs
CmFuZCBhZGRpbmcgRklGTyBzdXBwb3J0IHdvdWxkIG5vdCBzaWduaWZpY2FudGx5IGFmZmVjdCB0
aGUgY3VycmVudCBQSU8gaW1wbGVtZW50YXRpb24uCgo+IAo+IFBlcnNvbmFsbHksIEknZCBsaWtl
IHRvIHNlZSBmaWZvIG1vZGUgaW1wbGVtZW50ZWQgYmVmb3JlIGFkZGluZyBwaW8KPiBzdXBwb3J0
LCBhcyBpdCB3aWxsIGJyaW5nIHF1aXRlIHNpZ25pZmljYW50IGNvZGUgY2hhbmdlcywgcmVxdWly
ZSBoZWF2eQo+IGNvZGUgcmV2aWV3IGVmZm9ydC4gQW5kIHllcywgdGhpcyB3aWxsIHB1dCBtb3Jl
IGRlbWFuZGluZyB3b3JrIG9uIHlvdXIgc2lkZQo+IGFuZCBtYXkgc2xvdyB0aGluZ3MgYSBiaXQu
LgpUaGF0IHNhaWQsIHdlIGRvbuKAmXQgaGF2ZSBhbnkgcGxhbnMgdG8gc3VwcG9ydCBGSUZPIGF0
IHRoaXMgcG9pbnQsCmFuZCBQSU8gZnVuY3Rpb25hbGl0eSBpcyBzb21ldGhpbmcgd2UgbmVlZCB1
cmdlbnRseS4KU28gSSB3aWxsIGNvbnRpbnVlIHRvIHB1c2ggdGhpcyBwYXRjaCAodG9tb3Jyb3cp
LgpUaGFua3MgZm9yIHlvdXIgdW5kZXJzdGFuZGluZy4gRm9yIGRldGFpbHMgb24gdGhlIGNvZGUg
Y2hhbmdlcywgcGxlYXNlIHNlZSBhYm92ZS4KCkluIGFkZGl0aW9uLCBpZiBhbnlvbmUgaXMgaW50
ZXJlc3RlZCBpbiBhZGRpbmcgRklGTyBzdXBwb3J0LCBJ4oCZZCBiZSBoYXBweSB0byBoZWxwLgoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKPgo+IAo+
IC0tIAo+IFlpeHVuIExhbiAoZGxhbikKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
