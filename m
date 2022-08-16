Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F764C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MRVWbidVopeG4ETaTEFVBzF5CM3oALGOWjaI5sTD9L4=; b=14BWhYpG+mRAsjQd1GpPEWOZDu
	Xj1AhNafuUyZ0saYWbJw1mHNClPqwKC46sKQMzkf53NrNQk5TdpDT2vXLKzOdaVj5jarS3q5yH8zb
	RC8GIWsS4L/2I/eqi4rsJQBI4paDhaGpSK6WOy18tRs62tSyUbqbnJbb5siJb34r/p9f1uxSNQu/p
	tbCtXkQGvNeNiH67u3bnTb1yVH4E4wYUibYMLl4MxWo0UVwX4WqTifGkHnz752W25MC5QJNapYSma
	4vY22I8/E4hRskA11V+xxr3ix+iuHn36JXAMfQ4b3Qh4vGz7KOA9xQdDC9Qbc7f5R/AN/Hy3RhRi4
	yyObkwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNw9h-002Ypd-P9; Tue, 16 Aug 2022 12:58:49 +0000
Received: from outbound-ss-761.bluehost.com ([74.220.211.250])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNw9Q-002YNX-E9
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 12:58:34 +0000
Received: from cmgw13.mail.unifiedlayer.com (unknown [10.0.90.128])
	by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id A4C5810072FAC
	for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 12:57:48 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id Nw8iot5PYG7RFNw8ioEa2T; Tue, 16 Aug 2022 12:57:48 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=EscXEQQA c=1 sm=1 tr=0 ts=62fb944c
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=biHskzXt2R4A:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=-GqyaLa-nqB5LIZqXYsA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iI72it6rjb9t6Js3YsGMXuBYdjTZpYfpW/f7d5hD9eo=; b=UGYNIORmZDeS5faj1tNqHEyDLz
	5PCQgERnSM6mNSCdhi01l+LBpQmsUJ7JV4iwv15fd7GJ8i22i/Ye3TxGNdTUvAULTh7hWGLWhTc22
	C7fAX3eBZpwZ9RjIIBGqCEHjqUsZW/Bwa9w8516benIV0K/EftxNJK6DU2k8vghtZTYiNUXRan5+d
	Z8gftmofHAs2hBrc34On23L2U4KV4WSZh8DLUSdJZySK+MnjZ2ToFzJCknsUamGaz85V2h2VK16F7
	oVpK//etQbNd1+isaLD3biHCFRTVFCxdbqCDxtSMXtpviglR+NHf6S0LeeoPQiWP409eajkMlGuoH
	bSlXJ9kQ==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:40252 helo=[10.0.1.48])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1oNw8h-000sVf-ST;
	Tue, 16 Aug 2022 06:57:47 -0600
To: linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, palmer@rivosinc.com, daolu@rivosinc.com,
 heiko@sntech.de
From: Ron Economos <re@w6rz.net>
Subject: Regression on Linux 6.0-rc1
Message-ID: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
Date: Tue, 16 Aug 2022 05:57:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1oNw8h-000sVf-ST
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.48]) [73.162.232.9]:40252
X-Source-Auth: re@w6rz.net
X-Email-Count: 1
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_055832_604899_559098FA 
X-CRM114-Status: UNSURE (   2.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGZvbGxvd2luZyBPb3BzIG9jY3VycyBvbiBMaW51eCA2LjAtcmMxIG9uIHRoZSBIaUZpdmUg
VW5tYXRjaGVkLiBUaGlzIAppcyB3aXRoIGdjYyAxMS4yLjAgYW5kIGJpbnV0aWxzIDIuMzggKGZy
b20gCmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1jb2xsYWIvcmlzY3YtZ251LXRvb2xjaGFpbiku
CgpCZWdpbjogTG9hZGluZyBlc3NlbnRpYWwgZHJpdmVycyAuLi4gW8KgwqAgMTQuNzc0NzQ4XSBV
bmFibGUgdG8gaGFuZGxlIAprZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNz
IGZmZmZmZmZmODEzY2RjOTAKW8KgwqAgMTQuNzgxOTc2XSBPb3BzIFsjMV0KW8KgwqAgMTQuNzg0
MTYzXSBNb2R1bGVzIGxpbmtlZCBpbjogcmFpZDZfcHEoKykgbGliY3JjMzJjIHJhaWQxIHJhaWQw
IAptdWx0aXBhdGggbGluZWFyIGRhOTA2M19yZWd1bGF0b3IKW8KgwqAgMTQuODAwNzYzXSBDUFU6
IDEgUElEOiAyNDggQ29tbTogbW9kcHJvYmUgTm90IHRhaW50ZWQgNi4wLjAtcmMxICMxClvCoMKg
IDE0LjgwNjc0N10gSGFyZHdhcmUgbmFtZTogU2lGaXZlIEhpRml2ZSBVbm1hdGNoZWQgQTAwIChE
VCkKW8KgwqAgMTQuODEyMzA3XSBlcGMgOiBqdW1wX2xhYmVsX21vZHVsZV9ub3RpZnkrMHgxYmMv
MHgyNzAKW8KgwqAgMTQuODE3NDMwXcKgIHJhIDoganVtcF9sYWJlbF9tb2R1bGVfbm90aWZ5KzB4
MTlhLzB4MjcwClvCoMKgIDE0LjgyMjU1NV0gZXBjIDogZmZmZmZmZmY4MDFiODA0YyByYSA6IGZm
ZmZmZmZmODAxYjgwMmEgc3AgOiAKZmZmZmZmYzgwNDI0YmMwClvCoMKgIDE0LjgyOTc2Nl3CoCBn
cCA6IGZmZmZmZmZmODFhMmQ3YjggdHAgOiBmZmZmZmZkODk1YWUxOTgwIHQwIDogCmZmZmZmZmQ4
ODA2N2UyMApbwqDCoCAxNC44MzY5NzVdwqAgdDEgOiA2ZjFkOTg1ODU4OTgxODNmIHQyIDogZmZm
ZmZmZGJmZWQxOWU1OCBzMCA6IApmZmZmZmZjODA0MjRiYzAKW8KgwqAgMTQuODQ0MTg1XcKgIHMx
IDogZmZmZmZmZmY4MTNjZGM4OCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOiAKMDAwMDAwMDAw
MDAwMDAwClvCoMKgIDE0Ljg1MTM5NF3CoCBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiBmZmZm
ZmZmZjAxYzc3MDAwIGE0IDogCjAwMDAwMDAwMDAwMDAwMApbwqDCoCAxNC44NTg2MDJdwqAgYTUg
OiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMGZmMDAwMCBhNyA6IAowMDAwMDAwMDAw
MDAwMjEKW8KgwqAgMTQuODY1ODEyXcKgIHMyIDogZmZmZmZmZmYwMWM3MzAwMCBzMyA6IGZmZmZm
ZmZmMDFjNzQwYzAgczQgOiAKZmZmZmZmZDg4MDY3ZTgwClvCoMKgIDE0Ljg3MzAyMV3CoCBzNSA6
IGZmZmZmZmZmMDFjNzMwMTAgczYgOiAwMDAwMDAwMDAwMDAwZGMwIHM3IDogCmZmZmZmZmZmODEz
Y2RmMApbwqDCoCAxNC44ODAyMzBdwqAgczggOiBmZmZmZmZkODgwNjdlMjgyIHM5IDogZmZmZmZm
ZmYwMWM3MzAwOCBzMTA6IAowMDAwMDAwMDAwMDAwMDIKW8KgwqAgMTQuODg3NDM5XcKgIHMxMTog
ZmZmZmZmYzgwNDI0YmQ1MCB0MyA6IGUyNmNiOTU5MmEwZThhNjkgdDQgOiAKMDAwMDAwODAwMDAw
MDAwClvCoMKgIDE0Ljg5NDY0OV3CoCB0NSA6IDAwMDAwMGZmMDAwMDAwMDAgdDYgOiBmZmZmZmZk
ODgxOWFjNGEwClvCoMKgIDE0Ljg5OTk0NV0gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFk
ZHI6IGZmZmZmZmZmODEzY2RjOTAgY2F1c2U6IAowMDAwMDBmClvCoMKgIDE0LjkwNzg1M10gWzxm
ZmZmZmZmZjgwMDQwNTVhPl0gCmJsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW5fcm9idXN0KzB4
NzIvMHg4ClvCoMKgIDE0LjkxNTA2MV0gWzxmZmZmZmZmZjgwMGExZGZjPl0gbG9hZF9tb2R1bGUr
MHgxN2JjLzB4MWU5OApbwqDCoCAxNC45MjA1MzFdIFs8ZmZmZmZmZmY4MDBhMjcxOD5dIF9fZG9f
c3lzX2Zpbml0X21vZHVsZSsweDk4LzB4MTAwClvCoMKgIDE0LjkyNjYxMV0gWzxmZmZmZmZmZjgw
MGEyN2E0Pl0gc3lzX2Zpbml0X21vZHVsZSsweDI0LzB4MzAKW8KgwqAgMTQuOTMyMTcwXSBbPGZm
ZmZmZmZmODAwMDNjYTY+XSByZXRfZnJvbV9zeXNjYWxsKzB4MC8weDIKW8KgwqAgMTQuOTM3Njgw
XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KU2VnbWVudGF0aW9uIGZhdWx0
CgpNYW51YWxseSBiaXNlY3RlZCB0byB0aGlzIGNvbW1pdDoKCmFyY2gvcmlzY3Y6IGFkZCBaaWhp
bnRwYXVzZSBzdXBwb3J0CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD04ZWIwNjBlMTAxODVjZmM5N2Vm
MDIwMGQxOTdlYzI0NmJhMGY5ZjhjCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
