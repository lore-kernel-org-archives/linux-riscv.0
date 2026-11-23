Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B2606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 04:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nT2A0J4G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izvBsfLu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n7Y+NRh+JsDhO6a3Df1pyimcl8S2GeuEK6eQ7Pz0+Ic=; b=nT2A0J4G74z8Q3tNg5Ei/veWLA
	aEA3s4PZZGEmTKXNriv7SM+2cQQya5mfay08gmKl5yE+a5nlNRHgBzFMAiaK7OEVA34pFcrMgR3Sa
	TfRHy+NJM9GcXBkmZy1qzBgkyqxDSMjWx6oQbl9wEErtQFHGchvoNLc5vtgpHEJRcQXnr6IEqXZKv
	NHqpXbx29Wix/o6rkn1Mhn++FoFmvVMuCsI8oz3OUFDKgn6igWmDpD0i3HmDDWgMVLcPqcuOO3+EL
	XrvFLELKzE73AKN3IN8mxb5wdnY+IYKx+SgfLRDoLMkCBJ2NEsIw9+tyJkM18XiZ2fe5gerEsU82g
	6ghOPeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLse-00000002GCB-2W4T;
	Mon, 23 Nov 2026 04:42:16 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLsW-00000002GBe-0hW2
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 04:42:14 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38692f62b22so1192694eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408927; x=1796013727; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=izvBsfLuduVlf6TVLskqIsFWUEwqiprtGChn+X6yfojjo/xeVzPnUq+5BbYyiL5nqi
         30h49RsBWXr9cX9RvUqVxYwJxvNHx+5YOm0eKK+XkhGey8nQtEJCE+RqDH7DVPomdCmG
         0Eh/UQxLTcxXnI/27+IJeI2HwF/4TUX+63xoqz75dc5dty12X3RiW+BPhlfU4ns2lspv
         VBKxgdxGtMQL0qhxKmEFfRCg2cHZpVoEMjl3Ohri4c7jdtcMgRW5iza86F1gCAL3pxfP
         FVvTBG7dbLRDA0XHtnmYhu4fUd2LKQwTnM3RoaIXkm1Yh3n78I0FwW9HdrWnA5HXRj5x
         Q79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408927; x=1796013727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=yRQyC+YfnFm+21+/AjjhRFjueJzbYOp9/KXzn6Ls0aXThApGzmtVcFvxIvU8NYvO/h
         X/jI8XSMRkGQ13Mp/7SqiBiOzNrBRDUmn8HmOBV0YVoT70Sv6b2crB61zZa+Xr1DI8RO
         SxqgXnLcDfvEnoNTvNo+s00bk1GBkpRnY6M6GFAP4sr9mroF1FhEhDJxc2uuo29peAzM
         xqMkPRwqZ8bFxRCrdSH23Degfvj4ev1Fo9aPKr+UjwAlbhRFqjBMuUDvuCbbdU1IeLqC
         zN5pASxT35+Qi3DLBL0JuK9SfLOSkfugC6G684w9l1L8EE+7icSs2Zl5TFysk6sDhF5m
         nc8Q==
X-Forwarded-Encrypted: i=1; AL+hErGnBFE14Nz+yvIrMsN/fWGsPBoxoaNI6wU/J0D52PYKweRbJm7SkjJvYHLiCTaU+9xcLSey264tvW0tFg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/VK/09CXnPWbfS53beUHP4Yz2K7kpbCUqvnylNljvseeLf7K4L
	Vaua4u9paO4v+/AnAYmr9r/mGFcyZjU7x7KP59lhj2Bu7V55tbx4ZsIE
X-Gm-Gg: AZFdTZeomGuTECh81sLO6o5hfUgBqjcyu9qPxgalVvemRZEbodq7SQMTTHylQU92nwK
	2P7Z8m3bvvlpK43K5A5f6zRG5Y3KT7BHnHEm2tkNLI26fpzqUezLZDHItKQg131aHiln/JDdHsT
	vu/xTvmmHJ0MGV228ZUiSMydq+5NaMtyWWhQEf/2wK9CSj5UvQK+rnFNX1aSwxru0U/4yl1YuxN
	o97IxVx92Ys5p7rw0nM8DsEpaUkZr+URCFsGg0teD/JAq2STbVimpPi4hMvZl1ThDM8SmBdEOGZ
	MFuvNoyxBmxUFo8B2bo+3w5307xsGTiWyI0nBXGRAW6orSiXHj10/1EPyqQ7wcRgSfIIs/DsT7r
	5B4FwFzMeMIvw9TsZAtd8oXag8y0eesjUH7esjDC+EkK8k7fzegaLJCsNystUfVIpSTls81XDRh
	9CG8TvAaLAjnvBBFiDexNar3CDIILbjg+4dZq1OsVDbtV9Qy1FweN3hcBtn9GHKO2iFbDMpNgLl
	cfkO0Tq/kcjo1ryMvjHdBMElMke13ShjYHmwQioG2k56yjqXhG9h2y6SE12DRjMdT7tZYznVByR
	74Fd6AkjlVr978H23+OzHp413WiL3Q9o12dQFsgDqN3gkA==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr12512979eec.3.1795408926522;
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
Received: from morise.tail.syca.top ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm28404929eec.2.2026.11.22.20.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Date: Mon, 23 Nov 2026 12:41:58 +0800
Message-ID: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Change-ID: 20261122-fix-bpf3-eeprom-51ba6e0f110a
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795399932; l=3631; i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id; bh=ZpyjTSTFUIhS0d4tphn4fxfvTbp3zPacKqQQgrGQ+so=; b=RvNnAQ77qPUL5wCgqMI0kl7NMSKeS+xd2E3WmHM8XdDNor4jB0xPQE80VkQtY8z2Q6PBXTRUT 1YOHKj+G7HsB/mXpwQGVEf7btPUIUdiskkCZ3EEir7npCKQCDgS9U+z
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519; pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_204208_207456_408C2ECF 
X-CRM114-Status: GOOD (  13.86  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIGJhbmFuYXBpLWYzIGNhcnJpZXMgYW4gQVQyNEMwMiBjb21wYXRpYmxlIEVFUFJPTSBHVDI0
QzAyQiBbMV06CjI1NiBieXRlcyB3aXRoIGFuIDgtYnl0ZSB3cml0ZSBwYWdlLCB3aGljaCBjYW4g
YmUgZm91bmQgaW4gc2NoZW1hdGljWzJdLgpUaGUgZGV2aWNlIHRyZWUgZGVjbGFyZXMgcGFnZXNp
emUgPSA8MTY+LCB3aGljaCBkb2VzIG5vdCBtYXRjaCB0aGUKZWVwcm9tIGNoaXAgZGF0YXNoZWV0
IHdoaWNoIGRlY2xhcmVzIHBhZ2VzaXplIDggYnl0ZXMuCkVFUFJPTSBwYWdlc2l6ZSBvZiBrMS1i
YW5hbmFwaS1jbTYtaW9bM10gYW5kIGsxLW9yYW5nZXBpLXJ2Mls0XSBjaGFuZ2VkCnRvZ2V0aGVy
LCBiYXNlZCBvbiB0aGUgY2hpcCBtb2RlbCBzaG93biBpbiB0aGUgc2NoZW1hdGljIGRpYWdyYW0u
CgpUaGUgVExWIEVFUFJPTSBvbiB0aGlzIGJvYXJkIGhvbGRzIHRoZSBiYXNlIE1BQyBhZGRyZXNz
IGFuZCB0aGUgTUFDIGNvdW50LApzbyBhIGNvcnJ1cHRlZCB3cml0ZSBsZWF2ZXMgYm90aCBFdGhl
cm5ldCBwb3J0cyB3aXRob3V0IGEgTUFDIGFkZHJlc3MsCndoaWNoIGlzIGhvdyB0aGlzIHdhcyBm
b3VuZC4KCkxpbms6IGh0dHBzOi8vd3d3LmdpYW50ZWMtc2VtaS5jb20vdXBsb2Fkcy8yMDIzMDQx
NC9HVDI0QzAyQi5wZGYgWzFdCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2Qv
MTlpTEo1eG5DQl9vSzhWZVFqa1BHanpBbjM5V1l5eWx2L3ZpZXc/dXNwPXNoYXJpbmcgWzJdCkxp
bms6IGh0dHBzOi8vcGFuLmJhaWR1LmNvbS9zLzEzVVRZX3FNNGdHdVZ4c1o5VTdfWHB3P3B3ZD04
ODg4IFszXQpMaW5rOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZHJpdmUvZm9sZGVycy8xcGNJ
X1UwQzNWSktUQ2c4QTF6ajA4Q3dOYm9obk9OU1I/dXNwPXNoYXJpbmcgWzRdCkZpeGVzOiBiZmNl
NzVlMjM0NWYgKCJyaXNjdjogZHRzOiBzcGFjZW1pdDogYWRkIDI0YzAyIGVlcHJvbSBvbiBCUEkt
RjMiKQpGaXhlczogNDZhOGMwMTcwMGFjICgicmlzY3Y6IGR0czogc3BhY2VtaXQ6IGsxOiBBZGQg
QmFuYW5hIFBpIEJQSS1DTTYgSU8gYm9hcmQiKQpGaXhlczogYWM0MzZlNjg3OWY1ICgicmlzY3Y6
IGR0czogc3BhY2VtaXQ6IGVuYWJsZSBvbmJvYXJkIGVlcHJvbSBmb3IgT3JhbmdlUGkiKQpTaWdu
ZWQtb2ZmLWJ5OiBaaXhpYW4gWmVuZyA8c3ljYW1vcmVtb29uMzc2QGdtYWlsLmNvbT4KLS0tCkEg
VExWIHdyaXRlIHRocm91Z2ggdS1ib290J3MgaTJjX2VlcHJvbSBkcml2ZXIgc2NyYW1ibGVkIHRo
ZSBFRVBST00KY29udGVudHMgYW5kIGxlZnQgYm90aCBwb3J0cyB3aXRob3V0IGEgTUFDIGFkZHJl
c3Mgb24gYmFuYW5hcGktZjMuCkkgY2hlY2tlZCBib2FyZHMgc2NoZW1hdGljIGFuZCBlZXByb20g
Y2hpcCBkYXRhc2hlZXQgb2YgYmFuYW5hcGktZjMsCndob3NlIGxpbmtzIGNhbiBiZSBmb3VuZCBp
biBjb21taXQgbWVzc2FnZS4gQWZ0ZXIgY2hhbmdpbmcgcGFnZXNpemUKdG8gOCwgVExWIHdyaXRl
IGFuZCByZWFkIHdvcmtzIGFzIGV4cGVjdGVkLgoKT3RoZXIgazEgYm9hcmRzIHdoaWNoIGluY2x1
ZGVzIGsxLWJhbmFuYXBpLWNtNi1pbyBhbmQgazEtb3JhbmdlcGktcnYyCmNoYW5nZWQgdG9nZXRo
ZXIuIEhvd2V2ZXIsIEkgZG9u4oCZdCBoYXZlIHRoZXNlIHR3byBib2FyZC4gQmUgZ3JhdGVmdWwK
aWYgc29tZW9uZSBjb3VsZCB0ZXN0IGl0LiBTY2hlbWF0aWMgb2YgazEtb3JhbmdlcGktcjJzIG5v
dCBmb3VuZCwKc28ga2VlcCBpdCBhcyBpdCBpcywgYnV0IHRydWUga25vd2xlZGdlIGNvbWVzIGZy
b20gcHJhY3RpY2UuCi0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFw
aS1jbTYtaW8uZHRzIHwgMiArLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMgICAgIHwgMiArLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1v
cmFuZ2VwaS1ydjIuZHRzICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1iYW5hbmFwaS1jbTYtaW8uZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1p
dC9rMS1iYW5hbmFwaS1jbTYtaW8uZHRzCmluZGV4IDJjMmQ3OGFlZTk4YS4uMjNhMTMyM2RmMzBk
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWNt
Ni1pby5kdHMKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1j
bTYtaW8uZHRzCkBAIC0xMDEsNyArMTAxLDcgQEAgZWVwcm9tQDU0IHsKIAkJY29tcGF0aWJsZSA9
ICJhdG1lbCwyNGMwOCI7CiAJCXJlZyA9IDwweDU0PjsKIAkJdmNjLXN1cHBseSA9IDwmYnVjazNf
MXY4PjsKLQkJcGFnZXNpemUgPSA8MTY+OworCQlwYWdlc2l6ZSA9IDw4PjsKIAkJc2l6ZSA9IDwx
MDI0PjsKIAl9OwogfTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMKaW5kZXggNTgwMzVkODg2YmY2Li4xZGI4OTY1MzYyNTYgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCisrKyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCkBAIC0xOTUsNyAr
MTk1LDcgQEAgZWVwcm9tQDUwIHsKIAkJY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwMiI7CiAJCXJl
ZyA9IDwweDUwPjsKIAkJdmNjLXN1cHBseSA9IDwmYnVjazNfMXY4PjsgLyogRUVQUk9NX1ZDQzFW
OCAqLwotCQlwYWdlc2l6ZSA9IDwxNj47CisJCXBhZ2VzaXplID0gPDg+OwogCQlyZWFkLW9ubHk7
CiAJCXNpemUgPSA8MjU2PjsKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1vcmFuZ2VwaS1ydjIuZHRzCmluZGV4IDc5MDIzNGYzNTUwYS4uOGZkOTVjOGY5ZGIyIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW9yYW5nZXBpLXJ2Mi5kdHMK
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCkBA
IC0xODUsNyArMTg1LDcgQEAgJmkyYzIgewogCWVlcHJvbUA1MCB7CiAJCWNvbXBhdGlibGUgPSAi
YXRtZWwsMjRjMDIiOwogCQlyZWcgPSA8MHg1MD47Ci0JCXBhZ2VzaXplID0gPDE2PjsKKwkJcGFn
ZXNpemUgPSA8OD47CiAJCXNpemUgPSA8MjU2PjsKIAkJcmVhZC1vbmx5OwogCQl2Y2Mtc3VwcGx5
ID0gPCZidWNrM18xdjg+OwoKLS0tCmJhc2UtY29tbWl0OiA0ODQzZjY4NzNmN2M0ODM1ZTYyZjJj
NzNiYTBmZDUzOGU1N2EyZjIyCmNoYW5nZS1pZDogMjAyNjExMjItZml4LWJwZjMtZWVwcm9tLTUx
YmE2ZTBmMTEwYQoKQmVzdCByZWdhcmRzLAotLSAgClppeGlhbiBaZW5nIDxzeWNhbW9yZW1vb24z
NzZAZ21haWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
