Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40524ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdjvyojFMFnLHY6PGM9vUzxExdqVtQJ5Ug+xFssmcUM=; b=FUwGs0aGK73aAF
	q/JoNR+uBKZ92+SDz/i012pb8g3yk43uHgzQGPuYkLogSJuPepAOZGU1BZ/jAmgI945JW59Llwq4T
	3NOk/MRi6CYJiCgtiAi1K7ceTgmb9PlqWHpLPBUEZ8tAGJ1Z8LEj4BXlC9D77aS7mN8wX9PKjWNsb
	+0w+6hSbvTuUI+cySYFdqPP202F/W8Y6BVy+irJvvCWnKFDws/L88OorfN4kAHBrquqOwiNXolJKc
	sS4Rg4t8AUIqgt6/cxy8oYSuvbhTq49hEtodraKhsSU2jlQV8UnH3SrtWb/Xe2YdmX7SGWAupboEF
	BcRUe7xXrjn8RLaB/C5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWd2J-00FyiJ-1y; Fri, 09 Sep 2022 12:23:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWd2G-00Fygt-5I
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 12:23:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD77FB82348;
	Fri,  9 Sep 2022 12:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F001C433D7;
	Fri,  9 Sep 2022 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662726181;
	bh=f/MBk4DuV+ezF4qXmdCJCjmryA6nTjeI9XVb4sRPRn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fl65HRPASBnRey7QziwpTTh++x1s075YBaImqSA2XFii2ys0KOSOxu4LXRJFmue+1
	 zTNQlcg2Lt35tZzXHX7tQ6aCugsDvKfnidzQTkiahJbbTuaH3KTyOQKDDquC6Ip2i0
	 iCb0nhC/Jj5sFUJwMt9VGnBtVdgP1EQRzEtoh8HSutp930G7nb67pu5jUDyqjGA16I
	 37jw3n60ubTVjXuRmLbu1hDiZr3QDo7rtNUjFPdvpY1nshUWOAwnNEcz9rgvQa4jg4
	 a3gzW9x1+BxRdV4h67haa3Et9KQK0qoEXOjYc6YR64IoEYdMcVPgddxHnjmDlv8TZq
	 wVLmEcCXIDehA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oWd2M-0001Xo-Nt; Fri, 09 Sep 2022 14:23:10 +0200
Date: Fri, 9 Sep 2022 14:23:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Tobias Klauser <tklauser@distanz.ch>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Kevin Cernekee <cernekee@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Message-ID: <YxswLiOaHQ5ajeOi@hovoldconsulting.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_052304_518235_CC9E2639 
X-CRM114-Status: GOOD (  14.03  )
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

T24gV2VkLCBTZXAgMDcsIDIwMjIgYXQgMDE6MTY6MjNQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cgo+IEFsc28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHNlZSBpdCB1bnJlYWRh
YmxlIHdoZW4gdGhlIGFjdHVhbCBjb2RlIGlzIAo+IG91dCBpbiB0aGUgb3BlbiBpbiB0aGF0IG1h
Y3JvLiBJdCdzIGZvcm1hdHRlZCBtdWNoIGJldHRlciB0aGFuIGUuZy4gCj4gcmVhZF9wb2xsX3Rp
bWVvdXQoKSBpZiB5b3Ugd2FudCBhbiBleGFtcGxlIG9mIHNvbWV0aGluZyB0aGF0IGlzIGhhcmRs
eSAKPiByZWFkYWJsZSA7LSkuIEkgYWdyZWUgdGhvdWdoIHRoZXJlJ3MgYSBsZWFybmluZy1jdXJ2
ZSwgYWxiZWl0IHNtYWxsLCB0aGF0IAo+IGl0IGFjdHVhbGx5IGNyZWF0ZXMgYSBmdW5jdGlvbiBi
dXQgdGhhdCBkb2Vzbid0IHNlZW0gdG8gbWUgYXMgYmlnIG9mIGFuIAo+IG9ic3RhY2xlIHlvdSBz
ZWVtIHRvIHRoaW5rLgoKVGhlcmUncyBhIGh1Z2UgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBwcm9w
b3NlZCBtYWNybyB3aXRoIGl0cwpJLWxvc3QtY291bnQtb2YtaG93LW1hbnkgYXJndW1lbnRzIGFu
ZCBsZXZlbHMgb2YgaW5kaXJlY3Rpb24gYW5kCnNvbWV0aGluZyBsaWtlIHdhaXRfZXZlbnQoKSB3
aGljaCB0YWtlIG9uZSBjb25kaXRpb24gYW5kIGhhcyBhCmRlc2NyaXB0aXZlIG5hbWU6CgoJd2Fp
dF9ldmVudChkZXZpY2UtPm1pc2Nfd2FpdCwgYXRvbWljX3JlYWQoJmRldmljZS0+YXBfcGVuZGlu
Z19jbnQpID09IDApOwoKdnMKCglzdGF0aWMgREVGSU5FX1VBUlRfUE9SVF9UWF9IRUxQRVJfTElN
SVRFRChhbHRlcmFfanRhZ3VhcnRfZG9fdHhfY2hhcnMsCgkJdHJ1ZSwKCQl3cml0ZWwoY2gsIHBv
cnQtPm1lbWJhc2UgKyBBTFRFUkFfSlRBR1VBUlRfREFUQV9SRUcpLAoJCSh7fSkpOwoKSW4gdGhl
IGZvcm1lciBjYXNlLCB5b3UganVzdCBuZWVkIHRvIGxvb2sgYXQgdGhlIGNvZGUgdG8gdW5kZXJz
dGFuZCB3aGF0CmlzIGdvaW5nIG9uLCB2ZXJ5IG11Y2ggdW5saWtlIGluIHRoZSBsYXR0ZXIgY2Fz
ZS4KCkpvaGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
