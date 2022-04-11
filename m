Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA2FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg4Y1ebyYX1no8MvpqLzsp5KxsLnqMzA4w9aRItvnEA=; b=GqHdmA4DYtAyYo
	eilFLVGDbXnFtOmNrJSWdTxe8QkCvx7cw+V/SPID7EC0dkDucn9KagtRuiBWUrQQSfO1Hs3/6kGxp
	hllcprxTSVPdFTwStTAiK2HgHyQex0g04KQXOWFK0q+aafP/PdPDiN7irwsh9Py0DB6cqgAqhJuuH
	zN4v8g8E9tKM8Em71niTiRcXq1k1f2ObiIlbZ42FY1GZJ2hqsWfiIsm/sWg1jELiYbyDKG95G06iD
	CQrhzxUUAu3KZF9wEmiVSZKWLnePUAT8/jb/o0VrJaHUucxmDf2Xr6vQGMNPbOr2UKfcBShcnnWF+
	tK5ZQOav1e9Y0bncUtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrgX-008Wdz-LA; Mon, 11 Apr 2022 10:54:17 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrgS-008Wah-IS
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 10:54:14 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8BED81F38D;
 Mon, 11 Apr 2022 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649674447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j1s/ljyl7zRa3Wwc8LKTq4IIoQmYHWi7pP4k8x7uAGE=;
 b=UTiDDmUHwjaSsgqSy4T6CE3RTR8l+AnaXBjXW2ap/oDIsan5ZsvNBm2HM/XMMiOftaqqrK
 A8lEUQKIGeOmYFOU9L4oju9eMuMTurRmqIStodrOOkwJh4c/F3KHeJKmDOUh4E0DAMmp3A
 8iKjxbiu1viVQPm3c0vm7LW//vNl1Q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649674447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j1s/ljyl7zRa3Wwc8LKTq4IIoQmYHWi7pP4k8x7uAGE=;
 b=91vAcOt5z+ytrUcuWk8bvmToYhRU/F6vOBRZ9r7aVzeI9ni048a5Le5rVB3bf0VrRSxahD
 rYPIYAwSuBxUe4Bg==
Received: from localhost.localdomain (unknown [10.100.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id F00D2A3B87;
 Mon, 11 Apr 2022 10:54:05 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jslaby@suse.cz>, Tobias Klauser <tklauser@distanz.ch>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] tty: TX helpers
Date: Mon, 11 Apr 2022 12:54:02 +0200
Message-Id: <20220411105405.9519-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_035412_796074_C909A9C5 
X-CRM114-Status: GOOD (  11.22  )
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

Rmlyc3QsIHRoaXMgc2VyaWVzIGRlcGVuZHMgb24gInR0eTogdmFyaW91cyBjbGVhbnVwcyIKKDIw
MjIwNDExMTA0NTA2Ljg5OTAtMS1qc2xhYnlAc3VzZS5jeikuCgpUaGlzIHNlcmllcyBpbnRyb2R1
Y2VzIHVhcnRfcG9ydF90eHssX2xpbWl0fSgpIFRYIGhlbHBlcnMuIFNlZSBQQVRDSAoxLzMgZm9y
IHRoZSBkZXRhaWxzLiBDb21tZW50cyB3ZWxjb21lLgoKVGhlbiBpdCBzd2l0Y2hlcyBkcml2ZXJz
IHRvIHVzZSB0aGVtLiBGaXJzdCwgdWFydF9wb3J0X3R4KCkgaW4gMi8zIGFuZAp0aGVuIHVhcnRf
cG9ydF90eF9saW1pdCgpIGluIDMvMy4KClRoZSBkaWZmc3RhdCBvZiBwYXRjaGVzIDIrMyBpcyBh
cyBmb2xsb3dzOgogMjcgZmlsZXMgY2hhbmdlZCwgMzMwIGluc2VydGlvbnMoKyksIDg4MyBkZWxl
dGlvbnMoLSkKd2hpY2ggYXBwZWFycyB0byBiZSBuaWNlLgoKQ2M6IFRvYmlhcyBLbGF1c2VyIDx0
a2xhdXNlckBkaXN0YW56LmNoPgpDYzogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGdt
YWlsLmNvbT4KQ2M6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4K
Q2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KQ2M6
IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tPgpDYzogVmxhZGlt
aXIgWmFwb2xza2l5IDx2ekBtbGVpYS5jb20+CkNjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVA
YXJtLmNvbT4KQ2M6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+CkNjOiBMb3Jl
bnpvIFBpZXJhbGlzaSA8bG9yZW56by5waWVyYWxpc2lAYXJtLmNvbT4KQ2M6IFNoYXduIEd1byA8
c2hhd25ndW9Aa2VybmVsLm9yZz4KQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25p
eC5kZT4KQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+
CkNjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkNjOiBOWFAgTGludXggVGVh
bSA8bGludXgtaW14QG54cC5jb20+CkNjOiAiQW5kcmVhcyBGw6RyYmVyIiA8YWZhZXJiZXJAc3Vz
ZS5kZT4KQ2M6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgpDYzogUnVz
c2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxm
LmZhaW5lbGxpQGdtYWlsLmNvbT4KQ2M6IGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNv
bS5jb20KQ2M6ICJQYWxpIFJvaMOhciIgPHBhbGlAa2VybmVsLm9yZz4KQ2M6IEtldmluIENlcm5l
a2VlIDxjZXJuZWtlZUBnbWFpbC5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPgpDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpDYzog
T3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNvbT4KQ2M6IEJhb2xpbiBXYW5nIDxiYW9saW4u
d2FuZzdAZ21haWwuY29tPgpDYzogQ2h1bnlhbiBaaGFuZyA8emhhbmcubHlyYUBnbWFpbC5jb20+
CkNjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KQ2M6IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKCkppcmkgU2xhYnkgKDMpOgogIHR0eTogc2Vy
aWFsOiBpbnRyb2R1Y2UgdWFydF9wb3J0X3R4eyxfbGltaXR9KCkgaGVscGVycwogIHR0eTogc2Vy
aWFsOiB1c2UgdWFydF9wb3J0X3R4KCkgaGVscGVyCiAgdHR5OiBzZXJpYWw6IHVzZSB1YXJ0X3Bv
cnRfdHhfbGltaXQoKSBoZWxwZXIKCiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvc2VyaWFsL2Ry
aXZlci5yc3QgfCAyOCArKysrKysrKysrKwogZHJpdmVycy90dHkvc2VyaWFsLzIxMjg1LmMgICAg
ICAgICAgICAgICAgIHwgNDAgKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2Fs
dGVyYV9qdGFndWFydC5jICAgICAgIHwgNDMgKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5
L3NlcmlhbC9hbHRlcmFfdWFydC5jICAgICAgICAgICB8IDQ3ICsrKysrKy0tLS0tLS0tLS0tLS0K
IGRyaXZlcnMvdHR5L3NlcmlhbC9hbWJhLXBsMDEwLmMgICAgICAgICAgICB8IDQwICsrKy0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hcGJ1YXJ0LmMgICAgICAgICAgICAgICB8IDM3
ICsrKy0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2F0bWVsX3NlcmlhbC5jICAgICAg
ICAgIHwgMzcgKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYmNtNjN4eF91YXJ0
LmMgICAgICAgICAgfCA0OCArKysrLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
ZnNsX2xwdWFydC5jICAgICAgICAgICAgfCA0OSArKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy90dHkvc2VyaWFsL2xhbnRpcS5jICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKy0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9scGMzMnh4X2hzLmMgICAgICAgICAgICB8IDUzICsr
KysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL21jZi5jICAgICAgICAgICAg
ICAgICAgIHwgMzUgKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9tcGM1Mnh4X3Vh
cnQuYyAgICAgICAgICB8IDU0ICsrKysrKystLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3Nl
cmlhbC9tcHMyLXVhcnQuYyAgICAgICAgICAgICB8IDQ0ICsrKysrKy0tLS0tLS0tLS0tLQogZHJp
dmVycy90dHkvc2VyaWFsL211eC5jICAgICAgICAgICAgICAgICAgIHwgNDggKysrKysrLS0tLS0t
LS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL212ZWJ1LXVhcnQuYyAgICAgICAgICAgIHwgNDcg
KysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL214cy1hdWFydC5jICAgICAg
ICAgICAgIHwgNDMgKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9vbWFwLXNl
cmlhbC5jICAgICAgICAgICB8IDUzICsrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkv
c2VyaWFsL293bC11YXJ0LmMgICAgICAgICAgICAgIHwgNDcgKysrKysrLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy90dHkvc2VyaWFsL3B4YS5jICAgICAgICAgICAgICAgICAgIHwgNDMgKysrKy0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9ycDIuYyAgICAgICAgICAgICAgICAgICB8IDM2
ICsrKystLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NhMTEwMC5jICAgICAgICAgICAg
ICAgIHwgNTAgKysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxf
Y29yZS5jICAgICAgICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy90dHkv
c2VyaWFsL3NlcmlhbF90eHg5LmMgICAgICAgICAgIHwgNDAgKysrLS0tLS0tLS0tLS0tLQogZHJp
dmVycy90dHkvc2VyaWFsL3NpZml2ZS5jICAgICAgICAgICAgICAgIHwgNDggKysrLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NwcmRfc2VyaWFsLmMgICAgICAgICAgIHwgNDEg
KysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3N0LWFzYy5jICAgICAgICAgICAg
ICAgIHwgNTEgKysrLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC92cjQxeHhf
c2l1LmMgICAgICAgICAgICB8IDQyICsrKy0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJp
YWwvdnQ4NTAwX3NlcmlhbC5jICAgICAgICAgfCA0NyArKysrKystLS0tLS0tLS0tLS0tCiBpbmNs
dWRlL2xpbnV4L3NlcmlhbF9jb3JlLmggICAgICAgICAgICAgICAgfCAgOSArKysrCiAzMCBmaWxl
cyBjaGFuZ2VkLCA0MjAgaW5zZXJ0aW9ucygrKSwgODgzIGRlbGV0aW9ucygtKQoKLS0gCjIuMzUu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
