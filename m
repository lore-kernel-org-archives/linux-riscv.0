Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730D606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QqA7uUZy;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=LRuRzDS2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/DbAmtbzvMPiwk/+wn4eOUFGrbuMgcgudpaV51pS5dE=; b=QqA7uUZydkA3RNMtFSfzQypDxA
	gWJ0QR2jzSv2LUP//zAFhSnnU90ZjffUjD4dhUTBg0QIujVMhKtkKp9yMiwAq6X2wvMxXY90fbXht
	RLBQERG51r+X8SPaLO0PcK64YiogWUs656e2a35SbG53ObmBvmKWY/5B1TB99xQCBru02bphfhrHk
	MOuSxdSk1amIlGZFCs/4Ne0BVc5SsSd5JpGwzkhzA3UNW3uVzLRUBYaj5zqwr59dY8QFdf7f2ag2F
	KHqlntrbho/RbMa50VUbL9YK/H+b8fUjDXKhhO5ND5W6nbpaQGN0IqopCjS4TuTmgo6GP7LFjcOX7
	OOkr9WTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRdD-00000009Rw4-03uZ;
	Thu, 12 Nov 2026 10:02:11 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRd3-00000009Rum-14Xz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794477721; x=1826013721;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=mMjEjjNBNeQ3hphvJgHcDnn3rGQSMsTx89cdVFhbk/I=;
  b=LRuRzDS2t3jE7Qy7H3KR+n3eDuDy+MPxtcLXDT8lePtKjl9VsM7x6dK+
   Kp8c1Ng9hiRPJw5KjcXivSRk3Sl2gqI++zJhaIKsuiUKu9GnHGSg1aDKT
   HkVGyZ3Kya8Wvsq8zjk/PTN8W65ITxagjo/TpUUQYm/+cWsrfuTJOrQQc
   XZU75dTXlN3ssBWxVeejB9SrrCb8wawRCUOWqE7O/PMQt4ziSNSzNlKkQ
   2qDApDAne6mDeKennYpw5WIjMtDA9IoUe+PzefhW66igccbuN8z1/pcxs
   wgkPvsS0HextWqvSyFsvAC+B5t+QbGSN7ALXtQdW25HmEaL11tIh4LTT6
   g==;
X-CSE-ConnectionGUID: rUNqhAMySHap40T7AiPgZQ==
X-CSE-MsgGUID: xMUSzfxcSrWWuth1BjYn4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:01:59 +0200
X-CSE-ConnectionGUID: tqG99rijSfOKtEoICM7JmA==
X-CSE-MsgGUID: FJ0d8Z2lTPmSSo5/ZwY//Q==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 12 Nov 2026 12:09:55 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Nov 2026 12:01:57 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 0/2] riscv: probes: reject probes inside an LR/SC
 sequence
Date: Thu, 12 Nov 2026 12:01:43 +0200
Message-Id: <20261112-probes-in-lrsc-v3-0-a95089852a17@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIeO9WoC/33NQQ6CMBAF0KuQrh1DC1Rw5T2MC9pOpQYoabGRE
 O5uizsTnd1P/n+zEo/OoCfnbCUOg/HGjjEUh4zIrh3vCEbFTFjOOI0Hk7MCPZgReucllFIq5FL
 osuAkjiaH2rx28Hr7ZP8UD5RzUlKjM362btk/Bpp6P/FAgUKpm0YpbCvN68tghelxwaO0A0l+Y
 P8FBjkIVrFKnJBijV/Ctm1vFN9chAMBAAA=
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_020202_920691_943D31EA 
X-CRM114-Status: GOOD (  13.24  )
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
IHByb2JlcyBpbnNpZGUgdGhlIExSL1NDIHNlcXVlbmNlLiBUaGlzIGNvbW1pdCB3YXMKc3VibWl0
dGVkIGFzIHBhdGNoIDEgb2YgdGhlIHNlcmllcyBbMV0uCkRldGFjaGluZyBpdCBmcm9tIHRoYXQg
c2VyaWVzIHdpdGggc2xpZ2h0bHkgZWRpdGVkIGNvbW1pdCBtZXNzYWdlLApiZWNhdXNlIGl0IGlz
IG5vdCBkZXBlbmRpbmcgb24gb3RoZXIgc3R1ZmYuCgpbMV0gaHR0cHM6Ly9wYXRjaC5tc2dpZC5s
aW5rLzIwMjYxMTEwLWxyc2Mtb25seS12Ni0wLWJhZmMzY2MwZmNhZUBtb2JpbGV5ZS5jb20KCi0t
LQpDaGFuZ2VzIGluIHYzOgotIEZpeCBsci9zYyBsb29wIGRldGVjdGlvbiBsb2dpYyBmb3IgbHIg
YXQgcHJvYmUgcG9zaXRpb24KLSBBZGQgIkZpeGVzIiB0cmFpbGVycyBhcyBzdWdnZXN0ZWQgYnkg
c2FzaGlrby1ib3RAa2VybmVsLm9yZwotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI2MTExMS1wcm9iZXMtaW4tbHJzYy12Mi0wLWIyNTI1YjdlMWU4ZUBtb2JpbGV5ZS5j
b20KCkNoYW5nZXMgaW4gdjI6Ci0gQWxsb3cga3Byb2JlIG9uIHRoZSBMUiBpdHNlbGYgdW5sZXNz
IGl0IGlzIHBhcnQgb2YgdGhlIExSL1NDIGxvb3AuCi0gRml4IGVycm9yIChyZXBvcnRlZCBieSBz
YXNoaWtvLWJvdEBrZXJuZWwub3JnKSB3aGVyZQogIGFyY2hfcHJlcGFyZV9rcHJvYmUoKSByZXR1
cm5zIC1FSUxTRVEgZm9yIExSL1NDIHByb2Jlcy4KICBNYWtlIGNvZGVzIHJldHVybmVkIGJ5IGFy
Y2hfY2hlY2tfa3Byb2JlIHRvIGluZGljYXRlIC1FSU5WQUwKICBpZiBwcm9iZSBmYWxscyB3aXRo
aW4gdGhlIExSL1NDIGxvb3AsIGNvbnNpc3RlbnQgd2l0aCB0aGUgY2FzZSB3aGVuCiAgSU5TTl9S
RUpFQ1RFRCByZXR1cm5lZCBieSByaXNjdl9wcm9iZV9kZWNvZGVfaW5zbgotIGFkZCBwYXRjaCBm
aXhpbmcgb3V0LW9mLWJvdW5kcyByZWFkIGluIHJpc2N2X3Byb2JlX2RlY29kZV9pbnNuKCkKICBy
ZXBvcnRlZCBieSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIChhcyBwYXRjaCAxKQotIExpbmsgdG8g
djE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTExMS1wcm9iZXMtaW4tbHJzYy12MS0x
LTRmOTlkZGVhNWY2OEBtb2JpbGV5ZS5jb20KClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVs
Lm9yZz4KVG86IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQg
T3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4KVG86IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+ClRvOiBPbGVn
IE5lc3Rlcm92IDxvbGVnQHJlZGhhdC5jb20+ClRvOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+ClRvOiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KVG86IFBla2thIEVu
YmVyZyA8cGVuYmVyZ0BrZXJuZWwub3JnPgpUbzogUGF0cmljayBTdMOkaGxpbiA8bWVAcGFja2ku
Y2g+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC10cmFjZS1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNj
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5
OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4K
Ci0tLQpWbGFkaW1pciBLb25kcmF0aWV2ICgyKToKICAgICAgcmlzY3Y6IGtwcm9iZXM6IGZpeCBv
dXQtb2YtYm91bmRzIHJlYWQgaW4gcmlzY3ZfcHJvYmVfZGVjb2RlX2luc24KICAgICAgcmlzY3Y6
IHByb2JlczogcmVqZWN0IHByb2JlcyBpbnNpZGUgYW4gTFIvU0Mgc2VxdWVuY2UKCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2luc24uaCAgICAgICAgICB8IDI4ICsrKysrKysrKysrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvZGVjb2RlLWluc24uYyB8IDkxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9kZWNvZGUtaW5zbi5oIHwg
IDcgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jICAgICB8IDI5ICsrKysr
KystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jICAgICB8IDMxICsrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKLS0tCmJhc2UtY29tbWl0OiBjMDNjMWExNDUwN2RmYWY4Yjg1NmMyNjA4ZjlhYzIxNjAyMWZj
MjIyCmNoYW5nZS1pZDogMjAyNjExMTEtcHJvYmVzLWluLWxyc2MtNGNjZGU2Y2JmNDM2CgpCZXN0
IHJlZ2FyZHMsCi0tICAKVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBt
b2JpbGV5ZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
