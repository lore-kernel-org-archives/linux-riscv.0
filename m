Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921CCCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 01:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEpdno3fH8FosNxr1r86GpTMaHlur9VcJaCLV75yA/c=; b=UyxjiZgr+1ziOz
	rchJaxG0qsTWwxXoKtzc0oTomHmujRt7uWHIHGLt9rPI8Jfuv0dQ17Z2NW9B47Uk9Fylv2lQikqrv
	ORQPW/7ms1QZDHVL/6Gi8IaUJKsiuCgmXvHo/ENlBU6NHbJmAVcsnyAbK9aLlZOrtE5FZ8wEjjl/O
	z3r0qOTD0e1heONyBBTPt6QDKTdpxE4bZu3C1h0cvVfY+ksZ+gIgLD1goF/z+CNIzelU2i/rYH1fo
	hXeP2qVulNkiK/jm7RYkvJJlsn2ga+tsTC/+AfQ4O7HY0S4vObgOli1LfX2t6cQXAY655qJb9a+GA
	7ewm8OUbwievdhrZRY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBKD-0000000GVr6-0nRo;
	Fri, 07 Nov 2025 01:31:37 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBKA-0000000GVnx-1tof
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 01:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762479006;
	bh=35L+rrx9K1LdyqVcy5E43gyFYLFh2mo/NaELv+Hva9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=PzJNXuF2/g9WamuiFe2RPX2vTiFaipLMPXbNpof/2M6ddxauFk3RV3WD9l3jbJJ8R
	 LBIq9NQ5qm+A5u7mJIU/SMjB1m6ObToPTdZd0l9fFWLQH4Sg0I7339TWii5Dyn+9jq
	 rUnoWAPPOqTG1LfjEtM8D50l3WHIvcjIE+sYFuQM=
X-QQ-mid: esmtpsz18t1762478998t36cfe8cb
X-QQ-Originating-IP: XYy2puoEOwMWms+dhGae90A2kQraig8IBA6V6nniF3E=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 09:29:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13916769930896062852
EX-QQ-RecipientCnt: 14
Date: Fri, 7 Nov 2025 09:29:56 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
 <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mf2c2cXG8XEi7srU0LhC/T1EZfWbKzg7cytxOLQp1ZqFcZ8HEx+JxizT
	fqet0Wetv9T9LVlbSNxFnKSMnph+o2GQCszqIr3LJlartAHVmXzRd4DIkRNX2lQyVqrr4aH
	V52Q/z3w3CypHNywH4yQ31KZYR/3rZt+HKB7Wr0N8Hp9KBfLHrBP49d61WaA4Bdc8BVfxJT
	+uX4HDYE2AKMFeNTsTYWhZ1YijWFr0e0Lp4BSr2tMgIQaRAzsWuHrJyKOGsS8qfWLtRQueG
	EkZbVjOqP2TSf6MT1NJ2VDhjX++0sIANHSn7Smp1bmWmXl5YI2OymQov7AnyJDspa0Lj/tc
	1mkiFaVlxGGwM7KYy0DX3Ssc3YkGO+E6oH5utC/N9gIVfOh17+TwhDxy9gV/iDqfbIAEHJO
	+AyGeOCpZyWRl9FgApm4UN90SV9CVwFjA1+Ahf25892cOOqQGTdpF3imMMWGmlhpPMla2c/
	smu0Q1Tdg2VhiOhV86elLrawhU/RCwv/DC0PRZ2j2bf6GOuzsOaUxjf+ggK2AKJ7VFvJm16
	CeSBkCdm4WMfRD3FMV3cWhBG3G8rOaVfjQcX5xjSSATkypBjOoXWWlzeZhZsITUnZcujcMN
	LaWqC4wDZz6pv5N4+88fghlFadPa+X+hulSQvGKyuDDm+eX6PPuO1WVd5y7IeSAnwC5muHN
	CIEWg5UxpN+wCjzVhGKcrAXlzcPubth0baM+757m2cfnjiDI5VgH8UTIoUK67wMfWJ7astb
	95wdOgGBgXUu7CHzJfpjV4BQExP6OWJef4fnXTazama2qv8S5iDKAVpLH/Oz4Py2ws/Yx+w
	WxhjxHLnwLh718aJmUbTY9DANs74eYRk4NTYxf+GwRjxCQr8BFbyPvnijqVDsGGJeQchXeX
	+46UmU4SGmKxn90dhAMBqIPdegSTA0TqqZH7lH9Mw00JUqRbFQgjPQaP84lYRWmhfJdhf60
	8CTbrRkPYvVQomf2x1MBDVcNTPdqyKcrjttfGlQFYWWzBXswJXQ+pNGpjBMwplE4wCEH92b
	Nx2aBi/OvcQODfNR+tRguYfDA5MS6hzpY7M8nA+7mtLj/08uQUNgvAdCL4NTSUtmEI7S0sQ
	9n4qBwreKwO
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_173135_085670_7C526B47 
X-CRM114-Status: GOOD (  13.16  )
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

T24gVGh1LCBOb3YgMDYsIDIwMjUgYXQgMDQ6MDQ6MjFQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMjcgT2N0IDIwMjUgMTM6NDg6MDUgKzA4MDAsIFRyb3kgTWl0Y2hlbGwgd3Jv
dGU6Cj4gPiBzZWxlY3Qgd2lsbCBmb3JjZSBhIHN5bWJvbCB0byBhIHNwZWNpZmljIHZhbHVlIHdp
dGhvdXQgY29uc2lkZXJpbmcKPiA+IGl0cyBkZXBlbmRlbmNpZXMuIEFzIGEgcmVzdWx0LCB0aGUg
aTJjLWsxIGRyaXZlciB3aWxsIGZhaWwgdG8gYnVpbGQKPiA+IHdoZW4gT0Ygb3IgQ09NTU9OX0NM
SyBhcmUgZGlzYWJsZWQuCj4gPiAKPiA+IFRoZSByZWFzb24gZm9yIHJlbW92aW5nIEkyQ19LMSBp
bnN0ZWFkIG9mIGFkZGluZyBhIGRlcGVuZHMgb24gY29uZGl0aW9uCj4gPiBpcyB0byBrZWVwIHRo
ZSBwb3NzaWJpbGl0eSBmb3Igb3RoZXIgU29DcyB0byB1c2UgdGhpcyBQTUlDLgo+ID4gCj4gPiBb
Li4uXQo+IAo+IEFwcGxpZWQsIHRoYW5rcyEKPiAKPiBbMS80XSBtZmQ6IHNpbXBsZS1tZmQtaTJj
OiByZW1vdmUgc2VsZWN0IEkyQ19LMQo+ICAgICAgIGNvbW1pdDogZWNmNmJjNDc0YWU5N2M0MDRl
MjEyNWI0MTNlYjBlZjM2MjdiMDNjNQpIaSBMZWUsCgpJIHRoaW5rIHlvdSBkaWRuJ3Qgbm90aWNl
IHRoaXMgcmVwbHkgWzFdCihNYXliZSBiZWNhdXNlIGhlIHdhcyByZXBseWluZyB0byB0aGUgY292
ZXIgbGV0dGVyKS4KCkFzIEF1cmVsaWVuIG1lbnRpb25lZCwgdGhlIGN1cnJlbnQgc2h1dGRvd24v
cmVib290IChhbmQgcG9zc2libHkgdGhlIHJlZ3VsYXRvcgphcyB3ZWxsKSBpbnRlbmRzIHRvIHVz
ZSB0aGUgYGRlZmF1bHQgTUZEX1NQQUNFTUlUX1AxYC4KU28gaWYgdGhlcmXigJlzIG5vIGBkZWZh
dWx0IG0gaWYgQVJDSF9TUEFDRU1JVGAsCnRoZSBkZWZhdWx0IHZhbHVlIGluIHN1YmRldmljZXMg
bWF5IG5vdCBtYWtlIG11Y2ggc2Vuc2UuCgpCdXQgZG9u4oCZdCB3b3JyeSDigJQgdG8gbWFrZSB0
aGluZ3MgZWFzaWVyIGZvciB5b3UsIEnigJlsbCBzZW5kIGFuIGFkZGl0aW9uYWwKcGF0Y2ggYmFz
ZWQgb24geW91ciBicmFuY2ggKGluIHRoaXMgc2VyaWVzKS4KCkhvdyBkb2VzIHRoYXQgc291bmQ/
CgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYVA5SVZja0pULWsyX080S0BhdXJl
bDMyLm5ldC8gWzFdCj4gCj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
