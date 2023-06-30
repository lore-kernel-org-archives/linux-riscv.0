Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/qXq/+VfnPieHWfsY5IJUkv3OuSC0y7o8++SaxrUx4=; b=IU+j8W+cohalka
	9jcJfhMq7pffnSO8Mg5hFUktcVVue7WNrve9bZ3+HD41tf+aT0FUB+n3qHSakvfsNTXdUCFXXx8OG
	sTlfCt4jomlTKG9uR31vKtWbaDrh9zmMR1nP9GYHeFsUjt7FLr0F1eELGGwHGFItd71yWRVCJZ1pC
	hHAr1T8mtLpQSQoPZ2LPgIVmQw/0TLt+5YIwKy1Pob0/pnFH+jKTd73ttg0pvg0RpBiIn9bHxV3EQ
	/cEzeCfnheGOld1b+x2Wp1bzNFIQ9cuxbnI8nMqp09w6scfvxWPtjSa/osfy45ET4w/IndrOHjNC6
	blU/3zcjaZUCzrFBIgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGMz-003yk1-0F;
	Fri, 30 Jun 2023 15:49:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGMv-003yiw-13
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 15:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688140149; x=1719676149;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Azy4tEc4ZZFt8M62Y/BZ47WSbxYTHrOJJk6YOf3OYes=;
  b=KkalMw2bRXKMKBQaX/zgzgrwix+MJFRRGL/DbLe5+9mQUlf1ZEpWR72O
   hr3NY07tF9MsUnx4cTCaTgwlATKePwKKp3NfzQpvqgoNHfwJL75vXgNLj
   2lZjku5ZPTuf9QcowYi8zw2qb6Lg5Qawkoz2pEpmpRpoSyFoPBa1p6kt6
   aBvsSeqSq6ArBy9Le6bW/Lg4TyXoQ/Wek3KVdALVUO/rI8zeai2H5CvEt
   7aTeX5l5aSJPDYznYWNLD51czUcgze+bklv2o5s/5t5IY0qP2YqlNwOWr
   9/iJO2f6WCicA2jbrYTwzXM6GKCYnZDhloMuiKBOi9wquba96HNekN5jd
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="159339669"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2023 08:49:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 30 Jun 2023 08:49:04 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 30 Jun 2023 08:49:02 -0700
From: <daire.mcnamara@microchip.com>
To: <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 0/8] PCI: microchip: Fixes and clean-ups
Date: Fri, 30 Jun 2023 16:48:51 +0100
Message-ID: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_084909_619186_437FF028 
X-CRM114-Status: UNSURE (   9.92  )
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

RnJvbTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CgpUaGlz
IHBhdGNoIHNlcmllcyBjb250YWlucyBmaXhlcyBhbmQgY2xlYW4tdXBzIGZvciB0aGUgTWljcm9j
aGlwIFBvbGFyRmlyZSBTb0MgUENJZSBkcml2ZXIKClRoZXNlIHBhdGNoZXMgYXJlIGV4dHJhY3Rl
ZCBmcm9tIHRoZSBsaW5rIGJlbG93IHRvIHNlcGFyYXRlIHRoZW0gZnJvbSB0aGUgb3V0Ym91bmQg
YW5kIGluYm91bmQKcmFuZ2UgaGFuZGxpbmcgd2hpY2ggaXMgdGFraW5nIGNvbnNpZGVyYWJsZSB0
aW1lLgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDExMTEy
NTMyMy4xOTExMzczLTEtZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbS8KClRoZXNlIHBhdGNo
ZXMgYXJlIHJlZ2VuZXJhdGVkIG9uIHY2LjQtcmM2LgoKTWFpbiBDaGFuZ2VzIGZyb20gdjE6Ci0g
RHJvcHBlZCAiUmVtb3ZlIGNhc3Qgd2FybmluZyBmb3IgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0
KCkiLiBUaGlzCiAgaGFzIGJlZW4gb3ZlcnRha2VuIGJ5IGEgcGF0Y2ggc2VyaWVzIGZyb20gS3J6
eXN6dG9mIFdpbGN6eW5za2kuCi0gSW1wcm92ZWQgdGhlIGNvbW1lbnQgZm9yICJFbmFibGUgYnVp
bGRpbmcgZHJpdmVyIGFzIGEgbW9kdWxlIiB0bwogIGNsYXJpZnkgd2hhdCBlbmFibGVzIGJ1aWxk
aW5nIHRoZSBkcml2ZXIgYXMgYSBtb2R1bGUuCi0gU3BsaXQgIkdhdGhlciBNU0kgaW5mb3JtYXRp
b24gZnJvbSBoYXJkd2FyZSBjb25maWcgcmVnaXN0ZXJzIiwKICBmb3IgY2xhcml0eSwgaW50bzoK
ICAgLSAiR2F0aGVyIE1TSSBpbmZvcm1hdGlvbiBmcm9tIGhhcmR3YXJlIGNvbmZpZyByZWdpc3Rl
cnMiIHB1cmVseQogICAgICBjaGFuZ2luZyB0aGUgb2Ygc291cmNlIG9mIE1TSS1yZWxhdGVkIGlu
Zm9ybWF0aW9uIChOdW0gTVNJcyBhbmQKICAgICAgTVNJIGFkZHJlc3MpIGZyb20gI2RlZmluZXMg
KHdoaWNoIGNhbiBiZSBpbmNvcnJlY3QpIHRvIEZQR0EKICAgICAgY29uZmlndXJhdGlvbiByZWdp
c3RlcnMgKHdoaWNoIGlzIHRoZSB1bHRpbWF0ZSBzb3VyY2Ugb2YgdHJ1dGgpLAogICAgICBhbmQg
YQogICAtICJSZW5hbWUgYW5kIHJlZmFjdG9yIC4uLiIgcGF0Y2ggYXMgYSBmdW5jdGlvbidzIGNv
ZGUgaXMgbm93IGNsZWFybHkKICAgICAgdW5yZWxhdGVkIHRvIGl0cyBjdXJyZW50IG5hbWUuCgpj
YzogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KY2M6IExvcmVuem8g
UGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+CmNjOiAiS3J6eXN6dG9mIFdpbGN6ecWE
c2tpIiA8a3dAbGludXguY29tPgpjYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KY2M6
IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CmNjOiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCgpEYWlyZSBNY05h
bWFyYSAoOCk6CiAgUENJOiBtaWNyb2NoaXA6IENvcnJlY3QgdGhlIERFRCBhbmQgU0VDIGludGVy
cnVwdCBiaXQgb2Zmc2V0cwogIFBDSTogbWljcm9jaGlwOiBFbmFibGUgYnVpbGRpbmcgZHJpdmVy
IGFzIGEgbW9kdWxlCiAgUENJOiBtaWNyb2NoaXA6IEFsaWduIHJlZ2lzdGVyLCBvZmZzZXQsIGFu
ZCBtYXNrIG5hbWVzIHdpdGggaHcgZG9jcwogIFBDSTogbWljcm9jaGlwOiBFbmFibGUgZXZlbnQg
aGFuZGxlcnMgdG8gYWNjZXNzIGJyaWRnZSBhbmQgY3RybCBwdHJzCiAgUENJOiBtaWNyb2NoaXA6
IENsZWFuIHVwIGluaXRpYWxpc2F0aW9uIG9mIGludGVycnVwdHMKICBQQ0k6IG1pY3JvY2hpcDog
R2F0aGVyIE1TSSBpbmZvcm1hdGlvbiBmcm9tIGhhcmR3YXJlIGNvbmZpZyByZWdpc3RlcnMKICBQ
Q0k6IG1pY3JvY2hpcDogUmVuYW1lIGFuZCByZWZhY3RvciBtY19wY2llX2VuYWJsZV9tc2koKQog
IFBDSTogbWljcm9jaGlwOiBSZS1wYXJ0aXRpb24gY29kZSBiZXR3ZWVuIHByb2JlKCkgYW5kIGlu
aXQoKQoKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAy
ICstCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlwLWhvc3QuYyB8IDQwMiAr
KysrKysrKysrKy0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIzOCBpbnNlcnRpb25zKCspLCAx
NjYgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDg1OGZkMTY4YTk1YzViOTY2OWFhYzhkYjZj
MTRhOWFlYWI0NDYzNzUKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
