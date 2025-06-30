Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01452C7EE39
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+Ib91gi33xwmVOqtBx67fx1+XRO8kQZ1HgGbdIb9IY=; b=bDRyD0IhY+X41O
	gX63mMc7uQpBjKe3xp9FZK6NpAyZljNiAonumYdhshc6DxwXdmLFfP4Ks4v48dm+7Gc9fQU5gFT++
	s3NuikBC9sOqepahAUR2OXHExrqKB01R2IDGNrlH7KlzwKCT7G/ATpiHy70iaPRLi+EfFlApx8PS2
	2Z9Rr5AJUXtQym8mVB+210klQresmigJ2sQQDlTrTiHv9GWvtdbUMW8xNZjPy1pVzQUoV0fqOAlRB
	EQuvpPZgsURaFbcIV2ZuRPFrEIFCDLzm30gqtQULbtlDJeOt9EbVcf//ACBaBDv22g78+b28QW0lG
	5727ebdizu1U985DdvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCw5-000000024t4-347p;
	Mon, 30 Jun 2025 11:44:33 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCcL-0000000213k-0tM7
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 11:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1751282649; x=1782818649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MiWhWsU6Nk+nyhYaGOjRyY5dkxoKOJRqdg6QZYyp45U=;
  b=aIPZ3yrCLeQmvHait8Fh6UqlOvXnb5dK40bfjkmh/ngfkbNmK+zfB4Tm
   ZjvCr4J7sNE54xC/jGFV19O6IWhrYUhKCkUZbr2SrnnlJXRtqDOC+3EYg
   4+WUG5DVMyoKrz4jIvR4H/K+hc4U3W+zsez9wmhf0xJc21Zq7zqlO0kN1
   aH4liUnOJMzzSenlJYvZmsGWh+bsC/O0X1TqsUHQmLeN6BHioDheUVTap
   bUjbRia54Xzy+cqyKX6rMqK1JkzD9RX+qxMNbxuuJ+iry6dnbnun348OS
   VVMGLKU4m7fUHP5ZxK6uaem4y2rnTauIEIgbDT8DIEXNm29PoJX8DuPcy
   w==;
X-CSE-ConnectionGUID: OZc/P2bnQ6q5XPyz242BWQ==
X-CSE-MsgGUID: wZpqWIciQhe14+AnKPjUFQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:24:02 +0300
X-CSE-ConnectionGUID: pMAH1rCrQJa5kQD9iN+fzw==
X-CSE-MsgGUID: q/P7gEazQMSWGOq4CdiiSA==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 30 Jun 2025 14:24:00 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Mon, 30 Jun 2025 14:24:01 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: bjorn@kernel.org
Cc: alex@ghiti.fr,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 0/1] Fix for riscv vmcore issue
Date: Mon, 30 Jun 2025 14:21:28 +0300
Message-ID: <20250630112309.97162-2-pnina.feder@mobileye.com>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
References: <20250409182129.634415-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_042409_703120_F01FE2F7 
X-CRM114-Status: GOOD (  13.04  )
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

V2UgYXJlIGNyZWF0aW5nIGEgdm1jb3JlIHVzaW5nIGtleGVjIG9uIGEgTGludXggNi4xNSBSSVND
LVYgc3lzdGVtIGFuZCBhbmFseXppbmcgaXQgd2l0aCB0aGUgY3Jhc2ggdG9vbCBvbiB0aGUgaG9z
dC4KVGhpcyB3b3JrZmxvdyB1c2VkIHRvIHdvcmsgb24gTGludXggNi4xNCBidXQgaXMgbm93IGJy
b2tlbiBpbiA2LjE1LgoKVGhlIGlzc3VlIGlzIGNhdXNlZCBieSBhIGNoYW5nZSBpbiB0aGUga2Vy
bmVsOgpJbiBMaW51eCA2LjE1LCBjZXJ0YWluIG1lbWJsb2NrIHNlY3Rpb25zIGFyZSBub3cgbWFy
a2VkIGFzIFJlc2VydmVkIGluIC9wcm9jL2lvbWVtLgpUaGUga2V4ZWMgdG9vbCBleGNsdWRlcyBh
bGwgUmVzZXJ2ZWQgcmVnaW9ucyB3aGVuIGdlbmVyYXRpbmcgdGhlIHZtY29yZSwgc28gdGhlc2Ug
c2VjdGlvbnMgYXJlIG1pc3NpbmcgZnJvbSB0aGUgZHVtcC4KCkhvd2V2ZXIsIHRoZSBrZXJuZWwg
c3RpbGwgdXNlcyBhZGRyZXNzZXMgaW4gdGhlc2UgcmVnaW9uc+KAlGZvciBleGFtcGxlLCBmb3Ig
SVJRIHBvaW50ZXJzLgpTaW5jZSB0aGUgY3Jhc2ggdG9vbCBuZWVkcyBhY2Nlc3MgdG8gdGhlc2Ug
bWVtb3J5IGFyZWFzIHRvIGZ1bmN0aW9uIGNvcnJlY3RseSwgdGhlaXIgZXhjbHVzaW9uIGJyZWFr
cyB0aGUgYW5hbHlzaXMuCgoKUG5pbmEgRmVkZXIgKDEpOgogIHJpc2N2OiBDaGFuZ2UgbWVtYmxv
Y2sgcmVzZXJ2ZWQgbmFtZSB0byBiZSByZWNvZ25pemVkIG9uIGtleGVjCgogYXJjaC9yaXNjdi9r
ZXJuZWwvc2V0dXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
