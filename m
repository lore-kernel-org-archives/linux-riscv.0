Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1AFCC6B19
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 06:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9Naczp4Wl7j0VjUY+LXK0fo3UqZcScq9bKZ/GzK46I=; b=0YmRuUhGPPk0NA
	X61yF7r4zcsar18NxcilhxB6DrarurqtfEMgdeuxXEDsI65StQ06ELGHAavEMFnuzC9LK3+3cXXxc
	V2uBpXEcVFuuq8bNhLfyJtJknAUvG8kJk8+EyM79YlT3hSq/zS5qiHE013i9Xjc/uWgyzeOgtvwTW
	2X4NanjfZ6uPHY1jSLt+kurQNauzsdsw3qo/7nbXchcvc93dZECo1VKQ0EJfNHwcDiXps1O3YenMI
	kphe0rAGkLnBmdqasLms1c5cjDb9AVxYjnt7UtHiJYxbP9sKkUfwsSPm4h/8L+wbRPIUha5DI1jWt
	bSZN7uE+/Ce0d+9IwLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGs4H-0000000Ea3y-0zAu;
	Wed, 14 Oct 2026 06:02:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGs4B-0000000Ea38-0NaQ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 06:02:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791957737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=si3mE0eRKr/xYwk7ohydIp+CfI4jcCVfH5Df7/z8yWA=;
	b=2+65GIWBbmH2MKPWbnZD77itcuBDd4BAX7KlKqeCjHvaxCeJirzoUXxl5qFDY5SRCm+me2
	pAMxaAm1vHXDZi7kDVcmEYoSMqKmkbYfiFDguWKWPMoabHYMRP1Oic+AeJkz/p9OtiW2EX
	B039yOHG+cwC0i8LUKiWX1Vzjz2PzeLW0xUdv4wFBB+TSlbzSDqWUlAWw9DW2TIKqe5A4w
	waYBPq+Oljl8f78GRRjPhAP/SC7s/oQcJMAjz9AbkcMd523fR6pLfcWwziUi4J9ozdsj0M
	QK5UwyUk175dWQSfMjmGlJPFBBTtYdTi2SNnbsswQkr7/oNhEnIRrt1VZ93kIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791957737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=si3mE0eRKr/xYwk7ohydIp+CfI4jcCVfH5Df7/z8yWA=;
	b=PCNeA3VAYZkl4o5Vm0VlYeF5x1OF/Snk+2v53eKQvu+3IxTowRfzTzgjaa5ifQay8usn1P
	9fJDE+7lt73ek1Ag==
Date: Wed, 14 Oct 2026 08:02:01 +0200
Subject: [PATCH] riscv: vdso: Don't use && to chain compound cmd
 definitions
MIME-Version: 1.0
Message-Id: <20261014-riscv-vdsold-errors-v1-1-91392fe3dba0@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQqDQAyF4atI1gYcqQpepbgYTMYGimMTHQri3
 R3U5ffg/TsYq7BBX+ygnMQkzhmuLGD8+HliFMqGuqpbV7kXqtiYMJHFLyGrRjUM1PqOukDsG8j
 PRTnI/6q+h9vKvy3H12c8jhOG0MHKegAAAA==
X-Change-ID: 20261014-riscv-vdsold-errors-fd6a7d7fdea5
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791957734; l=3205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NzUuIXQnPqKxjmVowDKFUAH5aj7tvNlvr0pmtvbb7Js=;
 b=D7n2aTRp2Af4DwkdGPo99Hjfd7afTlubcas/CJEhoxRCfH/PTyFvkGNjGP1bGCn1fexobIHIo
 YZ2KAco2wpAAke5i2JHJvC7K5W997mIEPIdiKAsRuS8zRHTW6VDTCwB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_230219_565130_FDF14C79 
X-CRM114-Status: UNSURE (   9.09  )
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

VGhlIHZEU08gbGlua2luZyBjb25zaXN0cyBvZiBtdWx0aXBsZSBjb21tYW5kcyBleGVjdXRlZCBh
cyBwYXJ0IG9mIGEKc2luZ2xlIGtidWlsZCAnY21kJy4gQ3VycmVudGx5IHRoZXNlIGNvbW1hbmRz
IGFyZSBjaGFpbmVkIHdpdGggc2hlbGwKJyYmJyBvcGVyYXRvcnMgdG8gbWFrZSBzdXJlIHRoYXQg
dGhlIGxhdGVyIGNvbW1hbmRzIGFyZSBvbmx5IGV4ZWN1dGVkCndoZW4gdGhlIGVhcmxpZXIgb25l
cyBzdWNjZWVkZWQuIEhvd2V2ZXIga2J1aWxkIGFscmVhZHkgcHJvdmlkZXMgdGhpcwplYXJseSBh
Ym9ydCBieSB1c2luZyAnc2V0IC1lJyBiZWZvcmUgZWFjaCBjb21tYW5kIGludm9jYXRpb24uCkZ1
cnRoZXJtb3JlIHRoZSAnJiYnIGNoYWluaW5nIHByZXZlbnRzIHRoZSAnc2V0IC1lJyBmcm9tIHBy
b21vdGluZyB0aGUKZmFpbHVyZSBvZiBhIHNpbmdsZSBjb21tYW5kIHRvIGEgZmFpbHVyZSBvZiB0
aGUgb3ZlcmFsbCBjb21tYW5kLgoKSWYgb25lIG9mIHRoZSBzdWJjb21tYW5kIGZhaWxzLCBrYnVp
bGQgd2lsbCBub3Qgbm90aWNlIGFuZCBjb250aW51ZSB0aGUKYnVpbGQsIHBvdGVudGlhbGx5IGxl
YWRpbmcgdG8gY29uZnVzaW5nIGZvbGxvdy11cCBlcnJvcnMuCgpTd2l0Y2ggdG8gcGxhaW4gJzsn
IGJhc2VkIHNlcXVlbmNlcyBvdmVyICcmJicgb25lcy4KClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLWFsbC8yMDI2MTAxMzE2MTMuQnBPaTZWUHAtbGtwQGludGVsLmNvbS8KU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Ci0tLQpCZXN0IHZpZXdlZCB3aXRoICdnaXQgc2hvdyAtLXdvcmQtZGlmZiAtLXdvcmQtZGlmZi1y
ZWdleD0uJwotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlIHwgNCAr
Ky0tCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlICAgICAgICB8IDYgKysrLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlCmluZGV4IDI0ZTM3ZDFlZjdlYy4uYzRlZDc0ZGZl
OTk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZQor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZQpAQCAtNjMsOCArNjMs
OCBAQCBpbmNsdWRlL2dlbmVyYXRlZC9jb21wYXRfdmRzby1vZmZzZXRzLmg6ICQob2JqKS9jb21w
YXRfdmRzby5zby5kYmcgRk9SQ0UKICMgVGhlIERTTyBpbWFnZXMgYXJlIGJ1aWx0IHVzaW5nIGEg
c3BlY2lhbCBsaW5rZXIgc2NyaXB0CiAjIE1ha2Ugc3VyZSBvbmx5IHRvIGV4cG9ydCB0aGUgaW50
ZW5kZWQgX19jb21wYXRfdmRzb194eHggc3ltYm9sIG9mZnNldHMuCiBxdWlldF9jbWRfY29tcGF0
X3Zkc29sZCA9IFZEU09MRCAgJEAKLSAgICAgIGNtZF9jb21wYXRfdmRzb2xkID0gJChDT01QQVRf
TEQpICQobGRfZmxhZ3MpICQoQ09NUEFUX0xEX0ZMQUdTKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0Us
JF4pIC1vICRALnRtcCAmJiBcCi0gICAgICAgICAgICAgICAgICAgJChPQkpDT1BZKSAkKHBhdHN1
YnN0ICUsIC1HIF9fY29tcGF0X3Zkc29fJSwgJChjb21wYXRfdmRzby1zeW1zKSkgJEAudG1wICRA
ICYmIFwKKyAgICAgIGNtZF9jb21wYXRfdmRzb2xkID0gJChDT01QQVRfTEQpICQobGRfZmxhZ3Mp
ICQoQ09NUEFUX0xEX0ZMQUdTKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pIC1vICRALnRtcDsg
XAorICAgICAgICAgICAgICAgICAgICQoT0JKQ09QWSkgJChwYXRzdWJzdCAlLCAtRyBfX2NvbXBh
dF92ZHNvXyUsICQoY29tcGF0X3Zkc28tc3ltcykpICRALnRtcCAkQDsgXAogICAgICAgICAgICAg
ICAgICAgIHJtICRALnRtcAogCiAjIGFjdHVhbCBidWlsZCBjb21tYW5kcwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28v
TWFrZWZpbGUKaW5kZXggYzAyMzA0NmEzZmQ3Li5kMmViZGMwNDhlZmIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9NYWtlZmlsZQpAQCAtOTcsNyArOTcsNyBAQCBpbmNsdWRlL2dlbmVyYXRlZC8kKHZkc29fb2Zm
c2V0cyk6ICQob2JqKS8kKHZkc29fc29fZGJnKSBGT1JDRQogIyBUaGUgRFNPIGltYWdlcyBhcmUg
YnVpbHQgdXNpbmcgYSBzcGVjaWFsIGxpbmtlciBzY3JpcHQKICMgTWFrZSBzdXJlIG9ubHkgdG8g
ZXhwb3J0IHRoZSBpbnRlbmRlZCBfX3Zkc29feHh4IHN5bWJvbCBvZmZzZXRzLgogcXVpZXRfY21k
X3Zkc29sZF9hbmRfY2hlY2sgPSBWRFNPTEQgICRACi0gICAgICBjbWRfdmRzb2xkX2FuZF9jaGVj
ayA9ICQoTEQpICQoQ0ZJX0ZVTEwpICQobGRfZmxhZ3MpIC1UICQoZmlsdGVyLW91dCBGT1JDRSwk
XikgLW8gJEAudG1wICYmIFwKLSAgICAgICAgICAgICAgICAgICAkKE9CSkNPUFkpICQocGF0c3Vi
c3QgJSwgLUcgX192ZHNvXyUsICQodmRzby1zeW1zKSkgJEAudG1wICRAICYmIFwKLSAgICAgICAg
ICAgICAgICAgICBybSAkQC50bXAgJiYgXAorICAgICAgY21kX3Zkc29sZF9hbmRfY2hlY2sgPSAk
KExEKSAkKENGSV9GVUxMKSAkKGxkX2ZsYWdzKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pIC1v
ICRALnRtcDsgXAorICAgICAgICAgICAgICAgICAgICQoT0JKQ09QWSkgJChwYXRzdWJzdCAlLCAt
RyBfX3Zkc29fJSwgJCh2ZHNvLXN5bXMpKSAkQC50bXAgJEA7IFwKKyAgICAgICAgICAgICAgICAg
ICBybSAkQC50bXA7IFwKICAgICAgICAgICAgICAgICAgICAkKGNtZF92ZHNvX2NoZWNrKQoKLS0t
CmJhc2UtY29tbWl0OiA0MDU2YjNjOWQzYzkyZWE0NTk1NTY0MWRiYWZlYjliOTYwZTE0NmVmCmNo
YW5nZS1pZDogMjAyNjEwMTQtcmlzY3YtdmRzb2xkLWVycm9ycy1mZDZhN2Q3ZmRlYTUKCkJlc3Qg
cmVnYXJkcywKLS0gIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
