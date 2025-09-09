Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C4CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOHYo1LYQY4w6T5BT7zioAM2icIUjD44CDWfO8fjhLc=; b=VpyvxpoDriA19/
	kcaZWF7M0J7WdX3MQhm/lTc3dL+X4C/78TlMXdjBo5xcHHjxA3fEE+GCmgDcgHPBfaGY0cIQWFyvy
	tbKjoLmU+BGRQ4pPhLQSYFk1eOfymI1q9Kb4RdaliV5VFEpORVoBpA5SDRU7gg3xWhK0I3StSYv3e
	nWPDapa06tpzi6rNVDeMF05VHlPtEsZnscekxpPZyrmk8F/bDyAz0A5V7v8cTu0bcvAs45dQWAt5P
	SR4R8FQGRBWFvP3QSCwJMZ3M3lXaqmFltshZ3hbLBuV4COhVcLKYr34mQOrvOTs1JQ3/E5Yll7W09
	M8hsjCejwaSqjlaV90Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuod-000000062Zx-3Kl6;
	Tue, 09 Sep 2025 09:39:07 +0000
Received: from mail.bizosto.pl ([151.80.59.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsug-00000005DsX-1Jwn
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:37:15 +0000
Received: by mail.bizosto.pl (Postfix, from userid 1002)
	id C081D24111; Tue,  9 Sep 2025 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizosto.pl; s=mail;
	t=1757403430; bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=;
	h=Date:From:To:Subject:From;
	b=eX6cj7ASSwS5nXDXLjzOpE16yYQRAYnJFbMihMMiAX7hK++aPxdkYiN3yP+81BM0J
	 FjWN8qsXDus038bp7xuSUgODPiLmUzV0PLgWTB2PEQ+jVlpagk+wMJ7cfpuIKpooB4
	 8X33r+j20jcJU43y+auVQKzyZ3Tf0e7W82pjz+YlKucO2UNDGy0PDjOskNYzF2Umyx
	 KX4NCnkvmqNfnsKVzKbjtADDnDqrdN3CGfGgoew0ZfjT160lKlbD1fSxbJ4UAzz1TS
	 gl27ejbWb2g78kwVjU3ogxO8YwucoiyepL8yL31eQ1zrsNckXiIIE1RueUwYqHHz0w
	 qeAKqP/VnkQUA==
Received: by mail.bizosto.pl for <linux-riscv@lists.infradead.org>; Tue,  9 Sep 2025 07:35:43 GMT
Message-ID: <20250909064500-0.1.3u.19xrl.0.oz779x1a3j@bizosto.pl>
Date: Tue,  9 Sep 2025 07:35:43 GMT
From: "Kamil Nakielski" <kamil.nakielski@bizosto.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zatrudnienie nowej osoby
X-Mailer: mail.bizosto.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_003714_626745_F8A92443 
X-CRM114-Status: UNSURE (   1.24  )
X-CRM114-Notice: Please train this message.
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB3IHNwcmF3aWUgemF0cnVkbmllbmlhIHBy
YWNvd25pa8OzdyB6IFVrcmFpbnkgdyBQYcWEc3R3YSB6YWvFgmFkemllLgoKU3RhbGUgb2JzxYJ1
Z3VqZW15IGZpcm15IHByb2R1a2N5am5lIHcgdHltIHRlbWFjaWUuIEplxZtsaSBwb3RyemVidWpl
Y2llIFBhxYRzdHdvIGRvZGF0a293ZWdvIHBlcnNvbmVsdSBkbyBwcmFjeSwgcHJvc3rEmSBvIHdp
YWRvbW/Fm8SHLiAKCgpQb3pkcmF3aWFtCkthbWlsIE5ha2llbHNraQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
