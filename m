Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD1606A8B2
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DSfu9oXD;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=iu9h/mGc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dtESt1gtErfFrY6ora9uSCJfraQoXlCIJmAUHxUXM4M=; b=DSfu9oXD1NO9LjkME1gfraiK6T
	uBOUAOpOT1BSsqBiZM9kvUde0kcHisMbjUHE+pDrMRuPUP3rWahaig2PxYkrbqgO8klIAkDigfcFi
	0+YhjH3s2j5simiwwNAGhJb8UxdwIqypFCU26wiPV+gygZUlXHHgmWzxdaN9pugajwqLKMbl/4YHr
	bpoPtv3ytp9MOoEwbgouXaXkAlj0UbOEVre8ktdziQWo/mDYxG53EhZF8WTnVKRD/RPEmeZpuOB3/
	qQL1ShnxkzHr6W0gv3/TUNkdMkk+d/xkJZMU2llRt8cGJ9BOX8144CPCZHXe9uDMQH20PvrmwYpkQ
	3AEQR9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVU-0000000HWSh-1zkJ;
	Sun, 15 Nov 2026 12:38:52 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVP-0000000HWQm-3DUB
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 12:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794746328; x=1826282328;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=w9+PrJPy3C6TaGPCLLB+9hxO8eYoyLxHkknQ9247xUM=;
  b=iu9h/mGcoufftdN+FJbPaCBVxzBdJPMO1r7ueRx84kvxfTy74ONl8LY1
   wRT4XfiSoqzk+mEdH8TtFGNLZ2EHdmMfll6Md25BD6l7IOPgLkQAu7CjX
   pBqrXVmHSV65Y6QrmMfOUkQdxE97SZ8DvFDtvexGDR8YK0akyBuFs/axt
   HjaXvQV30bwNWYOOpoN6vc10uI/Vg8SfaAA66vzxa7k31wAEVjmKiBDWi
   U2KvHvMUbL4L+LEOjoS+xJhXbevFQL+G3zh4k25xncT7CyJTH2Xg2oFpT
   GDSesRadtON+O6giqpkcc/6BNTL+i+9wzxuRHXlogiClZD7X99OO31uNJ
   A==;
X-CSE-ConnectionGUID: WHhyA4eNR9mGKRxVdeu0/A==
X-CSE-MsgGUID: gG9QOfiKQ0OJHJYUnEBEZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:38:42 +0200
X-CSE-ConnectionGUID: i/UPQMHlS4mBh7ry+NDfJw==
X-CSE-MsgGUID: iBpeRpW/QY+HIX4idDwMhg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 15 Nov 2026 14:46:58 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 15 Nov 2026 14:38:41 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v4 0/3] riscv: probes: reject probes inside an LR/SC
 sequence
Date: Sun, 15 Nov 2026 14:37:32 +0200
Message-Id: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIyn+WoC/33NTQ6CMBAF4KuQrh1DCy3FlfcwLmgZpAYoaZFIC
 He34Mb4N7uXvPfNTDw6g54copk4HI03tgsh3UVE10V3QTBlyITFTNBw0Dur0IPpoHFeQ6p1iUK
 rKk0ECaPeYWXuG3g6P7O/qSvqYVXWRm38YN20fRzp2vuJjxQopFWelyUWvBLy2FplGpxwr21LV
 n9k/wUGMSjGGVcZUpT4RUheBfYhJEEoch7LXHJW0OxNWJblAZUsMB9FAQAA
X-Change-ID: 20261111-probes-in-lrsc-4ccde6cbf436
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>, 
 Pekka Enberg <penberg@kernel.org>, 
 =?utf-8?q?Patrick_St=C3=A4hlin?= <me@packi.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Sashiko <sashiko-bot@kernel.org>, 
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_043848_225438_1DA09B32 
X-CRM114-Status: GOOD (  15.30  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UGF0Y2ggMSBmaXhlcyBwYWdlIGZhdWx0IHJlcG9ydGVkIGJ5IHNhc2hpa28tYm90QGtlcm5lbC5v
cmcgdGhhdApleGlzdGVkIGJlZm9yZSB0aGlzIHBhdGNoIHNlcmllcwoKUGF0Y2ggMiByZWplY3Rz
IHByb2JlcyBpbnNpZGUgdGhlIExSL1NDIHNlcXVlbmNlLiBUaGlzIGNvbW1pdCB3YXMKaW5pdGlh
bGx5IHN1Ym1pdHRlZCBhcyBwYXRjaCAxIG9mIHRoZSBzZXJpZXMgWzFdLgpEZXRhY2hpbmcgaXQg
ZnJvbSB0aGF0IHNlcmllcyBiZWNhdXNlIGl0IGlzIG5vdCBkZXBlbmRpbmcgb24gb3RoZXIgc3R1
ZmYuCgpQYXRjaCAzIGFkZHMgS1VuaXQgdGVzdCwgc3VnZ2VzdGVkIGJ5ClhpYW9mZW5nIFl1YW4g
PHl1YW54aWFvZmVuZ0Blc3dpbmNvbXB1dGluZy5jb20+IGluIFsyXQoKWzFdIGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MTExMC1scnNjLW9ubHktdjYtMC1iYWZjM2NjMGZjYWVAbW9iaWxl
eWUuY29tClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MTAxOTEz
NDEyMS4xNzYzLTMteXVhbnhpYW9mZW5nQGVzd2luY29tcHV0aW5nLmNvbS8KCi0tLQpDaGFuZ2Vz
IGluIHY0OgotIEFkZCBLVW5pdCB0ZXN0IGFzIHN1Z2dlc3RlZCBieSBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4sIGJhc2VkIG9uCiAgd29yayBieSBYaWFvZmVuZyBZdWFuIDx5dWFueGlhb2Zl
bmdAZXN3aW5jb21wdXRpbmcuY29tPgotIFNjYW4gZm9yIFNDIHVwIHRvIG1heGltdW0gcG9zc2li
bGUgc2VxdWVuY2UgbGVuZ3RoLiBTUFUgZG9lcyBub3Qga25vdwogIGFib3V0IHN5bWJvbHMsIGl0
IGlzIG5vdCBjb3JyZWN0IHRvIHN0b3Agc2Nhbm5pbmcgYXQgdGhlIGVuZCBvZgogIHN5bWJvbC4g
R2xvYmFsbHkgdmlzaWJsZSBzeW1ib2wgcGxhY2VkIHdpdGhpbiBMUi9TQyBzZXF1ZW5jZSBzaG91
bGQKICBub3QgdHVybiBwcm9iZSB3aXRoaW4gdGhlIHNlcXVlbmNlIGludG8gYWNjZXB0YWJsZS4K
LSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjExMTItcHJvYmVzLWlu
LWxyc2MtdjMtMC1hOTUwODk4NTJhMTdAbW9iaWxleWUuY29tCgpDaGFuZ2VzIGluIHYzOgotIEZp
eCBsci9zYyBsb29wIGRldGVjdGlvbiBsb2dpYyBmb3IgbHIgYXQgcHJvYmUgcG9zaXRpb24KLSBB
ZGQgIkZpeGVzIiB0cmFpbGVycyBhcyBzdWdnZXN0ZWQgYnkgc2FzaGlrby1ib3RAa2VybmVsLm9y
ZwotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTExMS1wcm9iZXMt
aW4tbHJzYy12Mi0wLWIyNTI1YjdlMWU4ZUBtb2JpbGV5ZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0g
QWxsb3cga3Byb2JlIG9uIHRoZSBMUiBpdHNlbGYgdW5sZXNzIGl0IGlzIHBhcnQgb2YgdGhlIExS
L1NDIGxvb3AuCi0gRml4IGVycm9yIChyZXBvcnRlZCBieSBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
KSB3aGVyZQogIGFyY2hfcHJlcGFyZV9rcHJvYmUoKSByZXR1cm5zIC1FSUxTRVEgZm9yIExSL1ND
IHByb2Jlcy4KICBNYWtlIGNvZGVzIHJldHVybmVkIGJ5IGFyY2hfY2hlY2tfa3Byb2JlIHRvIGlu
ZGljYXRlIC1FSU5WQUwKICBpZiBwcm9iZSBmYWxscyB3aXRoaW4gdGhlIExSL1NDIGxvb3AsIGNv
bnNpc3RlbnQgd2l0aCB0aGUgY2FzZSB3aGVuCiAgSU5TTl9SRUpFQ1RFRCByZXR1cm5lZCBieSBy
aXNjdl9wcm9iZV9kZWNvZGVfaW5zbgotIGFkZCBwYXRjaCBmaXhpbmcgb3V0LW9mLWJvdW5kcyBy
ZWFkIGluIHJpc2N2X3Byb2JlX2RlY29kZV9pbnNuKCkKICByZXBvcnRlZCBieSBzYXNoaWtvLWJv
dEBrZXJuZWwub3JnIChhcyBwYXRjaCAxKQotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNn
aWQubGluay8yMDI2MTExMS1wcm9iZXMtaW4tbHJzYy12MS0xLTRmOTlkZGVhNWY2OEBtb2JpbGV5
ZS5jb20KClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5
LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86IE1hc2FtaSBIaXJh
bWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+ClRvOiBPbGVnIE5lc3Rlcm92IDxvbGVnQHJlZGhh
dC5jb20+ClRvOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+ClRvOiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KVG86IFBla2thIEVuYmVyZyA8cGVuYmVyZ0BrZXJuZWwu
b3JnPgpUbzogUGF0cmljayBTdMOkaGxpbiA8bWVAcGFja2kuY2g+CkNjOiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC10cmFjZS1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyZGFiYmVsdEBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2
IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KCi0tLQpWbGFkaW1pciBLb25kcmF0
aWV2ICgzKToKICAgICAgcmlzY3Y6IGtwcm9iZXM6IGZpeCBvdXQtb2YtYm91bmRzIHJlYWQgaW4g
cmlzY3ZfcHJvYmVfZGVjb2RlX2luc24KICAgICAgcmlzY3Y6IHByb2JlczogcmVqZWN0IHByb2Jl
cyBpbnNpZGUgYW4gTFIvU0Mgc2VxdWVuY2UKICAgICAgcmlzY3Y6IGtwcm9iZXM6IGFkZCBLVW5p
dCB0ZXN0IGZvciBMUi9TQyBzZXF1ZW5jZSByZWplY3Rpb24KCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaCAgICAgICAgICAgICAgICAgICAgICB8IDI4ICsrKysrKysKIGFyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9kZWNvZGUtaW5zbi5jICAgICAgICAgICAgIHwgOTEgKysrKysrKysrKysr
KysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2RlY29kZS1pbnNuLmggICAgICAg
ICAgICAgfCAgNyArKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyAgICAgICAg
ICAgICAgICAgfCAyOCArKysrKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5j
ICAgICAgICAgICAgICAgICB8IDMxICsrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9r
cHJvYmVzL3Rlc3Qta3Byb2Jlcy1hc20uUyB8IDU4ICsrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2
L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rlc3Qta3Byb2Jlcy5jICAgICB8IDMyICsrKysrKysrCiBh
cmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rlc3Qta3Byb2Jlcy5oICAgICB8ICA2ICsr
CiA4IGZpbGVzIGNoYW5nZWQsIDI3NCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQotLS0K
YmFzZS1jb21taXQ6IGMwM2MxYTE0NTA3ZGZhZjhiODU2YzI2MDhmOWFjMjE2MDIxZmMyMjIKY2hh
bmdlLWlkOiAyMDI2MTExMS1wcm9iZXMtaW4tbHJzYy00Y2NkZTZjYmY0MzYKCkJlc3QgcmVnYXJk
cywKLS0gIApWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXll
LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
