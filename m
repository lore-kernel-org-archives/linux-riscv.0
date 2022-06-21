Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3173C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E+ivA8b+9C09pbSv1O8SYmoB0x9q8t9d1gp/IwwpsKM=; b=ZHMS7D19Zwa9Sh
	scaDh2SZLwya9DaHey7SDH/aYq8kTuhQ7iBt7TTZq2hoBqptroLpu4DxXAUvZMrvdOFTwqxsG9pZr
	3a08iOuNhtDIgZwm2PsmG/5FCR4AdvhcL/Fzt8vqLg00L/9eZ/5s15O57/jG+jR+BCZ8qWHBNUSiJ
	X0ZnAyD61kSEZ0e03FIp3BGXyBwTcQd/aat6xEBWaJh6l0qhyI4l2UPHi7PAl/wvUSFcTYEQKttDK
	MSyCUxo1Qt90i2ROrpAHG3nflr9EuaPvmoPbkPGC2gzCIHaO3qe0OcPfyVeFPGEGbj9DwQ2f5TNAS
	exDpV3ewPtRofh+DtxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCR-005yV2-EO; Tue, 21 Jun 2022 14:49:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCN-005yTN-Ni
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:49:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C79AAB8197E;
	Tue, 21 Jun 2022 14:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C0EC3411C;
	Tue, 21 Jun 2022 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655822983;
	bh=SZKgLW9pCUpPaA4Q2joB2cVjf3OSIICpzQIzPOyXTmo=;
	h=From:To:Cc:Subject:Date:From;
	b=q3170b0IF27mRdU22SwhXmvvuiW+lv6RfPUKC1/YwQ4Ho7JMBxwbRmQuZYUrsMHPt
	 PYt/B2QlsCF3wEgBFDFj4GFRalU92JO1gDLagjBG98kJMgHSCHBzAfIZjNYf1GpNuO
	 xfyyfhOrjq1Jn32cEfJHzhiJiWXSuKxp767ldZNTkL8RRWE/DhsjZq8qEphgzxXKb0
	 oCK9qancnHuOBA2xgGxwj/ltUMXLIrGDl5qyhtZ2EkvZH6m6IfhR3z1HSC5NTQd1h3
	 mBywDwuXt9j14wU1huTls2Bq9UYbxTvVyGwQ604q+hEsZvNvtpYbO4yE4V0oqFO7cl
	 NE2N6pqaMUADw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	peterz@infradead.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	Conor.Dooley@microchip.com,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	r@hev.cc,
	shorne@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 0/2] riscv: Support qspinlock with generic headers
Date: Tue, 21 Jun 2022 10:49:18 -0400
Message-Id: <20220621144920.2945595-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_074948_068312_13E479A2 
X-CRM114-Status: GOOD (  13.52  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKRW5hYmxlIHFzcGlubG9j
ayBhbmQgbWVldCB0aGUgcmVxdWlyZW1lbnRzIG1lbnRpb25lZCBpbiBhOGFkMDdlNTI0MGM5Cigi
YXNtLWdlbmVyaWM6IHFzcGlubG9jazogSW5kaWNhdGUgdGhlIHVzZSBvZiBtaXhlZC1zaXplIGF0
b21pY3MiKS4KClJJU0MtViBMUi9TQyBwYWlycyBjb3VsZCBwcm92aWRlIGEgc3Ryb25nL3dlYWsg
Zm9yd2FyZCBndWFyYW50ZWUgdGhhdApkZXBlbmRzIG9uIG1pY3JvLWFyY2hpdGVjdHVyZS4gQW5k
IFJJU0MtViBJU0Egc3BlYyBoYXMgZ2l2ZW4gb3V0CnNldmVyYWwgbGltaXRhdGlvbnMgdG8gbGV0
IGhhcmR3YXJlIHN1cHBvcnQgc3RyaWN0IGZvcndhcmQgZ3VhcmFudGVlCihSSVNDLVYgVXNlciBJ
U0EgLSA4LjMgRXZlbnR1YWwgU3VjY2VzcyBvZiBTdG9yZS1Db25kaXRpb25hbApJbnN0cnVjdGlv
bnMpOgpXZSByZXN0cmljdGVkIHRoZSBsZW5ndGggb2YgTFIvU0MgbG9vcHMgdG8gZml0IHdpdGhp
biA2NCBjb250aWd1b3VzCmluc3RydWN0aW9uIGJ5dGVzIGluIHRoZSBiYXNlIElTQSB0byBhdm9p
ZCB1bmR1ZSByZXN0cmljdGlvbnMgb24KaW5zdHJ1Y3Rpb24gY2FjaGUgYW5kIFRMQiBzaXplIGFu
ZCBhc3NvY2lhdGl2aXR5LiBTaW1pbGFybHksIHdlCmRpc2FsbG93ZWQgb3RoZXIgbG9hZHMgYW5k
IHN0b3JlcyB3aXRoaW4gdGhlIGxvb3BzIHRvIGF2b2lkIHJlc3RyaWN0aW9ucwpvbiBkYXRhLWNh
Y2hlIGFzc29jaWF0aXZpdHkgaW4gc2ltcGxlIGltcGxlbWVudGF0aW9ucyB0aGF0IHRyYWNrIHRo
ZQpyZXNlcnZhdGlvbiB3aXRoaW4gYSBwcml2YXRlIGNhY2hlLiBUaGUgcmVzdHJpY3Rpb25zIG9u
IGJyYW5jaGVzIGFuZApqdW1wcyBsaW1pdCB0aGUgdGltZSB0aGF0IGNhbiBiZSBzcGVudCBpbiB0
aGUgc2VxdWVuY2UuIEZsb2F0aW5nLXBvaW50Cm9wZXJhdGlvbnMgYW5kIGludGVnZXIgbXVsdGlw
bHkvZGl2aWRlIHdlcmUgZGlzYWxsb3dlZCB0byBzaW1wbGlmeSB0aGUKb3BlcmF0aW5nIHN5c3Rl
beKAmXMgZW11bGF0aW9uIG9mIHRoZXNlIGluc3RydWN0aW9ucyBvbiBpbXBsZW1lbnRhdGlvbnMK
bGFja2luZyBhcHByb3ByaWF0ZSBoYXJkd2FyZSBzdXBwb3J0LgpTb2Z0d2FyZSBpcyBub3QgZm9y
YmlkZGVuIGZyb20gdXNpbmcgdW5jb25zdHJhaW5lZCBMUi9TQyBzZXF1ZW5jZXMsIGJ1dApwb3J0
YWJsZSBzb2Z0d2FyZSBtdXN0IGRldGVjdCB0aGUgY2FzZSB0aGF0IHRoZSBzZXF1ZW5jZSByZXBl
YXRlZGx5CmZhaWxzLCB0aGVuIGZhbGwgYmFjayB0byBhbiBhbHRlcm5hdGUgY29kZSBzZXF1ZW5j
ZSB0aGF0IGRvZXMgbm90IHJlbHkKb24gYW4gdW5jb25zdHJhaW5lZCBMUi9TQyBzZXF1ZW5jZS4g
SW1wbGVtZW50YXRpb25zIGFyZSBwZXJtaXR0ZWQgdG8KdW5jb25kaXRpb25hbGx5IGZhaWwgYW55
IHVuY29uc3RyYWluZWQgTFIvU0Mgc2VxdWVuY2UuCgplZzoKU29tZSByaXNjdiBoYXJkd2FyZSBz
dWNoIGFzIEJPT012MyAmIFhpYW5nU2hhbiBjb3VsZCBwcm92aWRlIHN0cmljdCAmCnN0cm9uZyBm
b3J3YXJkIGd1YXJhbnRlZSAoVGhlIGNhY2hlIGxpbmUgd291bGQgYmUga2VwdCBpbiBhbiBleGNs
dXNpdmUKc3RhdGUgZm9yIEJhY2tvZmYgY3ljbGVzLCBhbmQgb25seSB0aGlzIGNvcmUncyBpbnRl
cnJ1cHQgY291bGQgYnJlYWsKdGhlIExSL1NDIHBhaXIpLgpRZW11IHJpc2N2IGdpdmUgYSB3ZWFr
IGZvcndhcmQgZ3VhcmFudGVlIGJ5IHdyb25nIGltcGxlbWVudGF0aW9uCmN1cnJlbnRseSBbMV0u
CgpUaGUgZmlyc3QgdmVyc2lvbiBvZiBwYXRjaCB3YXMgbWFkZSBpbiAyMDE5LjEgWzJdLgoKWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvYmxvYi9tYXN0ZXIvdGFyZ2V0L3Jpc2N2L2lu
c25fdHJhbnMvdHJhbnNfcnZhLmMuaW5jClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDE5MDIxMTA0MzgyOS4zMDA5Ni0xLW1pY2hhZWxqY2xhcmtAbWFjLmNvbS8jcgoK
Q2hhbmdlIFY2OgogLSBGaXh1cCBDbGFuZyBjb21waWxlIHByb2JsZW0gUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90CiAgIDxsa3BAaW50ZWwuY29tPgogLSBDbGVhbnVwIGFzbS1nZW5lcmlj
L3NwaW5sb2NrLmgKIC0gUmVtb3ZlIGNoYW5nZWxvZyBpbiBwYXRjaCBtYWluIGNvbW1lbnQgcGFy
dCwgc3VnZ2VzdGVkIGJ5CiAgIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tCiAtIFJlbW92ZSAi
ZGVmYXVsdCB5IGlmIE5VTUEiIGluIEtjb25maWcKCkNoYW5nZSBWNToKIC0gVXBkYXRlIGNvbW1l
bnQgd2l0aCBSSVNDLVYgZm9yd2FyZCBndWFyYW50ZWUgZmVhdHVyZS4KIC0gQmFjayB0byBWMyBk
aXJlY3Rpb24gYW5kIG9wdGltaXplIGFzbSBjb2RlLgoKQ2hhbmdlIFY0OgogLSBSZW1vdmUgY3Vz
dG9tIHN1Yi13b3JkIHhjaGcgaW1wbGVtZW50YXRpb24KIC0gQWRkIEFSQ0hfVVNFX1FVRVVFRF9T
UElOTE9DS1NfWENIRzMyIGluIGxvY2tpbmcvcXNwaW5sb2NrCgpDaGFuZ2UgVjM6CiAtIENvZGlu
ZyBjb252ZW50aW9uIGJ5IFBldGVyIFppamxzdHJhJ3MgYWR2aWNlcwoKQ2hhbmdlIFYyOgogLSBD
b2RpbmcgY29udmVudGlvbiBpbiBjbXB4Y2hnLmgKIC0gUmUtaW1wbGVtZW50IHNob3J0IHhjaGcK
IC0gUmVtb3ZlIGNoYXIgJiBjbXB4Y2hnIGltcGxlbWVudGF0aW9ucwoKR3VvIFJlbiAoMik6CiAg
YXNtLWdlbmVyaWM6IHNwaW5sb2NrOiBNb3ZlIHFzcGlubG9jayAmIHRpY2tldC1sb2NrIGludG8g
Z2VuZXJpYwogICAgc3BpbmxvY2suaAogIHJpc2N2OiBBZGQgcXNwaW5sb2NrIHN1cHBvcnQKCiBh
cmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDggKysrCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL0tidWlsZCAgICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jbXB4Y2hnLmggICAgICB8IDE3ICsrKysrCiBpbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2Nr
LmggICAgICAgIHwgOTAgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvYXNtLWdl
bmVyaWMvc3BpbmxvY2tfdHlwZXMuaCAgfCAxNCArKy0tCiBpbmNsdWRlL2FzbS1nZW5lcmljL3Rz
cGlubG9jay5oICAgICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRl
L2FzbS1nZW5lcmljL3RzcGlubG9ja190eXBlcy5oIHwgMTcgKysrKysKIDcgZmlsZXMgY2hhbmdl
ZCwgMTQ2IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvYXNtLWdlbmVyaWMvdHNwaW5sb2NrLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2FzbS1nZW5lcmljL3RzcGlubG9ja190eXBlcy5oCgotLSAKMi4zNi4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
