Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66497C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6kofFkCx4IgNc3+BR1vR8/YMYIneTfcPAShJWZuhZXw=; b=oRTyiXA8NvtM8f
	DPZT1e8NhKhRklJ97WWetu4+T59AB5EPwHi0EwX8tO8q9tpwXzeJ5IC92/BoFVYYJghrhvj5yviyk
	V45dQsHdoxkORZx9GOzN4tKRsaXPInyeljgR7umcYlF9B3WKqpxLhag1HJnUfYV9OhGghxsOkTMhW
	6G+ciQjVqX9HLnpHgNd4Rn6+9NTOmPMRq3138I/xtSbM9zHgIoJEQjD2L9Cxni18XXPzToJElwDcp
	5WA0cfmgxmm5dtbFdBFOOxV29KUdRt59v/DiTNcipv7FWbz4yUfFIxUYfjV6Mzu5Kah8a5opJIX3V
	v9uDbDMlHeKL9t3o85eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIwC-00000004BvO-3q0E;
	Wed, 29 May 2024 13:01:52 +0000
Received: from mail.bizexpand.pl ([51.195.45.234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIwA-00000004Bv1-2sFo
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 13:01:52 +0000
Received: by mail.bizexpand.pl (Postfix, from userid 1002)
	id 24DA1A4DE2; Wed, 29 May 2024 14:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizexpand.pl; s=mail;
	t=1716987592; bh=hy7OL951zzMc4+HXkALzt9LRZiawYsmWYUx9WMj5lrk=;
	h=Date:From:To:Subject:From;
	b=o19yUSppulBHKT0hJ1JkyLSS/4KJegYHCQI0JUSG6iFlLYfTxDFqXb0pFFBNdxrdQ
	 dw7D+NsX59ZIokam9F2ZTLqLQXGtKAZKMW88sY1hwDulOWuoaOkd0x2oGsjYyL5Sr3
	 QlIHvJZMzaqlbkVpgHbhgga46PfUJnUnvjgztRZfpPW6oLfpXAt+yCoA61VmiOSS2T
	 wv3Jn5FrFKFLLXJO4Q3AAHAnOAHOf7WSIHSGh/oOqL8OWpcAXzl8dH6LJJAkwW2RjF
	 0GWABML8JQvavoNT2dfPDQwh8bRVv6Wt2Qq9hYOxYJN1BhSGsI8CUt8xdYYl39fzsZ
	 mq99igSBMlvQw==
Received: by mail.bizexpand.pl for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 12:51:18 GMT
Message-ID: <20240529144500-0.1.hw.23ebn.0.pm4jzr4y18@bizexpand.pl>
Date: Wed, 29 May 2024 12:51:18 GMT
From: "Agata Lorenc" <agata.lorenc@bizexpand.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Nowa karta
X-Mailer: mail.bizexpand.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_060150_960165_49447E3F 
X-CRM114-Status: UNSURE (   0.55  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGtvcnp5c3RhbGkgUGHFhHN0d28ga2llZHnFmyB6IHByemVkcMWC
YWNvbmVqIGthcnR5IGx1bmNob3dlaj8KCkN6eSB3aWVkesSFIFBhxYRzdHdvLCDFvGUgYWt0dWFs
bmllIGlzdG5pZWplIG1vxbxsaXdvxZvEhyB6d29sbmllbmlhIHogb3DFgmF0IFpVUyBhxbwgZG8g
NDUwIHrFgiBuYSBrYcW8ZGVnbyBwcmFjb3duaWthPwoKRG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dyBqZXN0IGtvcnp5c3RuZSBkbGEgb2J1IHN0cm9uLiBQcmFjb3duaWN5IG1vZ8SFIHRha8SFIGth
cnTEhSB6YXDFgmFjacSHIHphIHBvc2nFgmtpIHcgcmVzdGF1cmFjamFjaCwgeiBkb3N0YXfEhSBv
bmxpbmUsIGNhdGVyaW5nIHB1ZGXFgmtvd3ksIGN6eSBwb2RjemFzIHpha3Vww7N3IHcgbWFya2Vj
aWUuIEplZG5vY3plxZtuaWUga2FydHkgbHVuY2hvd2Ugc8SFIGRvc2tvbmHFgnltIG5hcnrEmWR6
aWVtIG1vdHl3YWN5am55bSBkbGEgemVzcG/FgsOzdyBwcmFjb3duaWN6eWNoLgoKVyB0ZW4gc3Bv
c8OzYiB6YWRiYWrEhSBQYcWEc3R3byBvIHpkcm93aWUgaSBkb2JyZSBzYW1vcG9jenVjaWUgc3dv
amVqIGthZHJ5LCB3ZHJhxbxhasSFYyByb3p3acSFemFuaWUsIGt0w7NyZSBwb3p5dHl3bmllIHdw
xYJ5bmllIG5hIGVmZWt0eXdub8WbxIcgYml6bmVzdS4KCkN6eSBtb2fEmSB6YXByZXplbnRvd2HE
hyBzcG9zw7NiLCB3IGpha2kgbW/FvG5hIHd5a29yenlzdGHEhyB0ZWdvIHR5cHUgYmVuZWZpdCB3
IGZpcm1pZT8KCgpQb3pkcmF3aWFtLApBZ2F0YSBMb3JlbmMKU2VuaW9yIEhSIE1hbmFnZXIKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
