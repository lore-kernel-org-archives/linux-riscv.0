Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67099606A329
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXE9vpUn;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=r3kJx5iu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kpbaQc6UgKPsthkiJrImaRg1yRHxMjilJz4yq0Kl9gM=; b=FXE9vpUneqR5i/CfUkt4eFSQ3o
	K6jiMWroYVgy63mTC36zB5bv92eC+MuY1kSYvMthrn1nmAopolp/CEHerH84+l+WCCA0WZ6sKmIPP
	Cl6Qu8EqmbHBVgt8RPpezO2KdZrIABaoH8uO3A1UFSkiZ/q9Tx1iSC5K+UdvghByeJ7ksIkBjiXgA
	LSmhWr6iwSiJcJY85+00WZVddEfkVL64a1GyVTkuIucXhbnL3PKkl6rIlDsXxWBFHJV6FB+xE/qN2
	9uSuGycQPUg4xcqFiOEnYSjejTZtGwSv439UGS8NUdaf0l6rF9Syc5J+govFqB4ecnXZ7wnN4Ri+m
	+kRDJqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFbx-0000000AVPm-2e2E;
	Wed, 25 Nov 2026 16:12:45 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFbq-0000000AVNP-1hCC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 16:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795623158; x=1827159158;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=CnhhFMklWzjd95oYOPU/3D5K5rD8MM8uGI8AKlVW5kQ=;
  b=r3kJx5iuDsDGSSjPq20w/KBHW/Ggc0n6gSTxoSKXSZaLS4Y4sPLYNS01
   bUfblM6WsuDBhhrzu+tadM2XFINz6D2VluxMYKdCYgIkoJiHzgHMv4RyN
   J4tN8BvakOJyYDOTzl0mhHGU03t2PoALydmOxsSG3Eb5/py41IWTIX8xI
   M2PdEgeqeNyECyAhRaMgnDw+LTMuTAYarMTNTdOSfd2Jh0RAx3dVbkx9A
   4pmUk0ceYu3BBY8EoM4mSPuybPbEVUfmObEd0OCQjYPHy4iN0b1iaBFuO
   g0/+5CSrS1pYd0AbtHO/+XZZymc9lokIqaLA3uUHefx5A5W2sATYqLlZr
   g==;
X-CSE-ConnectionGUID: oPj5FK7mSXq0/qMkICZeWg==
X-CSE-MsgGUID: 63q0F0GhQbCAjAGDbOgKmg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 18:12:34 +0200
X-CSE-ConnectionGUID: YCXxgs58RB2YjqznLCUEEg==
X-CSE-MsgGUID: J1QBbANCSGSym1h8odoI2g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 25 Nov 2026 18:20:56 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 25 Nov 2026 18:12:32 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 0/3] riscv: probes: check for LR/SC sequence
Date: Wed, 25 Nov 2026 18:12:16 +0200
Message-Id: <20261125-probes-in-lrsc-v5-0-38a32e53fcc2@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOAIB2sC/33NTQ7CIBAF4KsY1o4pFBBceQ/jogNTxWgxoI3G9
 O5S3Rj/ZveS9765sUwpUGaLyY0l6kMOsStBTSfMbZtuQxB8yUxUQvNycEwRKUPoYJ+yA+mcJ+2
 wlbVmZXRM1IbLA1ytnzmfcUfuNCpjYxvyKabr42PPx95PvOfAQbbWek+NarVZHiKGPV1p5uKBj
 X4v/gsCKkChhMI5cTL0RahfBfEh1EVorKqMNUo0fP5FkK+C+hBkEaRBi1Wt0XP/JgzDcAdhrwS
 LhwEAAA==
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
X-CRM114-CacheID: sfid-20261125_081238_949727_F87AED79 
X-CRM114-Status: GOOD (  16.56  )
X-Spam-Score: -2.4 (--)
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
ZmYuCkRvIGEgQ2FsbCBGbG93IEdyYXBoIGFuYWx5c2lzIHRvIGNvcnJlY3RseSBkZXRlY3QgcmVh
Y2hhYmxlIFNDCmluc3RydWN0aW9ucwoKUGF0Y2ggMyBhZGRzIEtVbml0IHRlc3QsIHN1Z2dlc3Rl
ZCBieQpYaWFvZmVuZyBZdWFuIDx5dWFueGlhb2ZlbmdAZXN3aW5jb21wdXRpbmcuY29tPiBpbiBb
Ml0KClsxXSBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjExMTAtbHJzYy1vbmx5LXY2LTAt
YmFmYzNjYzBmY2FlQG1vYmlsZXllLmNvbQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNjEwMTkxMzQxMjEuMTc2My0zLXl1YW54aWFvZmVuZ0Blc3dpbmNvbXB1dGlu
Zy5jb20vCgotLS0KQ2hhbmdlcyBpbiB2NToKLSBhZGQgS1VuaXQgdGVzdHMgZm9yIHRleHQgbGl0
ZXJhbHMgaW5zaWRlIGNvZGUgYW5kIGV4aXQgYnJhbmNoZXMgaW4gdGhlCiAgTFIvU0MgbG9vcCwg
Ym90aCBmb3J3YXJkIGFuZCBiYWNrd2FyZCAocGF0Y2ggMykKLSBEbyBhIENvbnRyb2wgRmxvdyBH
cmFwaCBhbmFseXNpcyB0byBjb3JyZWN0bHkgZGV0ZWN0IHJlYWNoYWJsZSBTQwogIChwYXRjaCAy
KQotIGFsbG93IGJhY2t3YXJkIGJyYW5jaCBpbnNpZGUgTFIvU0Mgc2VxdWVuY2UsIGl0IGNhbiBi
ZSBvbiBleGl0CiAgcGF0aCBvZiB0aGUgdmFsaWQgTFIvU0Mgc2VxdWVuY2UKLSBmaXggTFIvU0Mg
bG9vcCBtYXhpbXVtIHNpemUgKHBhdGNoZXMgMiBhbmQgMyksIHJlcG9ydGVkIGJ5CiAgWGlhb2Zl
bmcgWXVhbiA8eXVhbnhpYW9mZW5nQGVzd2luY29tcHV0aW5nLmNvbT4KLSBMaW5rIHRvIHY0OiBo
dHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjExMTUtcHJvYmVzLWluLWxyc2MtdjQtMC00OGI5
YjAzNmJkMWRAbW9iaWxleWUuY29tCgpDaGFuZ2VzIGluIHY0OgotIEFkZCBLVW5pdCB0ZXN0IGFz
IHN1Z2dlc3RlZCBieSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4sIGJhc2VkIG9uCiAgd29y
ayBieSBYaWFvZmVuZyBZdWFuIDx5dWFueGlhb2ZlbmdAZXN3aW5jb21wdXRpbmcuY29tPgotIFNj
YW4gZm9yIFNDIHVwIHRvIG1heGltdW0gcG9zc2libGUgc2VxdWVuY2UgbGVuZ3RoLiBDUFUgZG9l
cyBub3Qga25vdwogIGFib3V0IHN5bWJvbHMsIGl0IGlzIG5vdCBjb3JyZWN0IHRvIHN0b3Agc2Nh
bm5pbmcgYXQgdGhlIGVuZCBvZgogIHN5bWJvbC4gR2xvYmFsbHkgdmlzaWJsZSBzeW1ib2wgcGxh
Y2VkIHdpdGhpbiBMUi9TQyBzZXF1ZW5jZSBzaG91bGQKICBub3QgdHVybiBwcm9iZSB3aXRoaW4g
dGhlIHNlcXVlbmNlIGludG8gYWNjZXB0YWJsZS4KLSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNo
Lm1zZ2lkLmxpbmsvMjAyNjExMTItcHJvYmVzLWluLWxyc2MtdjMtMC1hOTUwODk4NTJhMTdAbW9i
aWxleWUuY29tCgpDaGFuZ2VzIGluIHYzOgotIEZpeCBsci9zYyBsb29wIGRldGVjdGlvbiBsb2dp
YyBmb3IgbHIgYXQgcHJvYmUgcG9zaXRpb24KLSBBZGQgIkZpeGVzIiB0cmFpbGVycyBhcyBzdWdn
ZXN0ZWQgYnkgc2FzaGlrby1ib3RAa2VybmVsLm9yZwotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MTExMS1wcm9iZXMtaW4tbHJzYy12Mi0wLWIyNTI1YjdlMWU4ZUBt
b2JpbGV5ZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gQWxsb3cga3Byb2JlIG9uIHRoZSBMUiBpdHNl
bGYgdW5sZXNzIGl0IGlzIHBhcnQgb2YgdGhlIExSL1NDIGxvb3AuCi0gRml4IGVycm9yIChyZXBv
cnRlZCBieSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnKSB3aGVyZQogIGFyY2hfcHJlcGFyZV9rcHJv
YmUoKSByZXR1cm5zIC1FSUxTRVEgZm9yIExSL1NDIHByb2Jlcy4KICBNYWtlIGNvZGVzIHJldHVy
bmVkIGJ5IGFyY2hfY2hlY2tfa3Byb2JlIHRvIGluZGljYXRlIC1FSU5WQUwKICBpZiBwcm9iZSBm
YWxscyB3aXRoaW4gdGhlIExSL1NDIGxvb3AsIGNvbnNpc3RlbnQgd2l0aCB0aGUgY2FzZSB3aGVu
CiAgSU5TTl9SRUpFQ1RFRCByZXR1cm5lZCBieSByaXNjdl9wcm9iZV9kZWNvZGVfaW5zbgotIGFk
ZCBwYXRjaCBmaXhpbmcgb3V0LW9mLWJvdW5kcyByZWFkIGluIHJpc2N2X3Byb2JlX2RlY29kZV9p
bnNuKCkKICByZXBvcnRlZCBieSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIChhcyBwYXRjaCAxKQot
IExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTExMS1wcm9iZXMtaW4t
bHJzYy12MS0xLTRmOTlkZGVhNWY2OEBtb2JpbGV5ZS5jb20KClRvOiBQYXVsIFdhbG1zbGV5IDxw
andAa2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRv
OiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8
YWxleEBnaGl0aS5mcj4KVG86IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+
ClRvOiBPbGVnIE5lc3Rlcm92IDxvbGVnQHJlZGhhdC5jb20+ClRvOiBQZXRlciBaaWpsc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+ClRvOiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KVG86
IFBla2thIEVuYmVyZyA8cGVuYmVyZ0BrZXJuZWwub3JnPgpUbzogUGF0cmljayBTdMOkaGxpbiA8
bWVAcGFja2kuY2g+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC10cmFjZS1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmls
ZXllLmNvbT4KCi0tLQpWbGFkaW1pciBLb25kcmF0aWV2ICgzKToKICAgICAgcmlzY3Y6IGtwcm9i
ZXM6IGZpeCBvdXQtb2YtYm91bmRzIHJlYWQgaW4gcmlzY3ZfcHJvYmVfZGVjb2RlX2luc24KICAg
ICAgcmlzY3Y6IHByb2JlczogcmVqZWN0IHByb2JlcyBpbnNpZGUgYW4gTFIvU0Mgc2VxdWVuY2UK
ICAgICAgcmlzY3Y6IGtwcm9iZXM6IGFkZCBLVW5pdCB0ZXN0IGZvciBMUi9TQyBzZXF1ZW5jZSBy
ZWplY3Rpb24KCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCAgICAgICAgICAgICAgICAg
ICAgICB8ICAyOSArKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvZGVjb2RlLWluc24uYyAg
ICAgICAgICAgICB8IDE3MSArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy9kZWNvZGUtaW5zbi5oICAgICAgICAgICAgIHwgICA3ICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMgICAgICAgICAgICAgICAgIHwgIDM5ICsrKy0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jICAgICAgICAgICAgICAgICB8ICAzMSArKysrCiBh
cmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rlc3Qta3Byb2Jlcy1hc20uUyB8IDE0OCAr
KysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Rlc3RzL2twcm9iZXMvdGVzdC1r
cHJvYmVzLmMgICAgIHwgIDMyICsrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Rlc3RzL2twcm9iZXMv
dGVzdC1rcHJvYmVzLmggICAgIHwgICA2ICsKIDggZmlsZXMgY2hhbmdlZCwgNDUzIGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGMwM2MxYTE0NTA3ZGZhZjhi
ODU2YzI2MDhmOWFjMjE2MDIxZmMyMjIKY2hhbmdlLWlkOiAyMDI2MTExMS1wcm9iZXMtaW4tbHJz
Yy00Y2NkZTZjYmY0MzYKCkJlc3QgcmVnYXJkcywKLS0gIApWbGFkaW1pciBLb25kcmF0aWV2IDx2
bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
