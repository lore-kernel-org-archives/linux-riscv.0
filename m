Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9D5C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+wuTFlZWWKVRRhakAZo+71dMi+ni1V7UP/FiThNEic=; b=mS0rw2wIDzPjbT
	ugEfyosMaDrYTZAOGMF/fyowNXtTFS6UNJcdi2gE5TBSpRGy++Qw1u5mpAAklJX5JPUt7j7557EH3
	tpInoQq7wBuagfZL9HvlvoGxRjiKtj1BWsFvDllPUPVv34sRp07D6FJXY5RzQllwrMXUDU8oUaNOz
	o2pfAx1g9yq0iBXvjUknVdD8ChyH8m/wWLV56O/kyCLqbUUWxpNctD5ZqCu3vXgXrRviEF3kKzrdr
	iQxsntSo3KGDWA1e+0GJrwA9D5T524BLc/Mqcsj4gLZFLTwX/4U0AZ6OCQOe3WXhm/9cK89l641SQ
	15XAeobqDsSgdOQ9O/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIR-003VFs-1x;
	Fri, 28 Jul 2023 13:14:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIM-003VD2-18
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690550055; x=1722086055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z0fwAPNzFg8lhlVnwCKJCYD81rl4C9MhpAaVh5wSuOo=;
  b=GlKxS0T6tEHh+LzngXD5SmNOn+E4jjT4TsXlFBswBbZFVQ0KRwWDPvy/
   /vfVRgCWLETlH3WXrVlLluEs7a3ey+YGl3KUHF08NjlC5/fpYHRkE+W3m
   v/vAmbGNCs8dvnZ/kX0uZnJen1SsI/WKXJe4bKcPHrigpsdH/fpcbf5uE
   gyUY98eGHjwPtY378F+8ao4FyAuMi3as6f+OkHumJraOOq15UkB7ZDyAa
   Yd0KOwbj0zA48cJIuQc2n87pN9tVMsRYq5u3PplLTHNMlD8x6JAPpALW6
   aBRp407sWu74BY6A36YsAaXXiS0alakDb5o6hKEZzXMQabA+FJhLWChlK
   w==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="222752993"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 06:14:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 06:14:05 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 06:14:04 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 0/7] PCI: microchip: Fixes and clean-ups
Date: Fri, 28 Jul 2023 14:13:54 +0100
Message-ID: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_061414_452236_AAECA813 
X-CRM114-Status: UNSURE (   9.93  )
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
NTMyMy4xOTExMzczLTEtZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbS8KClJlc2VuZGluZyB3
aXRoIGNvcnJlY3QgZS1tYWlsIGFkZHJlc3MgbGlzdAoKVGhlc2UgcGF0Y2hlcyBhcmUgcmVnZW5l
cmF0ZWQgb24gdjYuNS1yYzMuCgpNYWluIGNoYW5nZXMgZnJvbSB2MjoKLSBSZXdvcmtlZCAiR2F0
aGVyIE1TSSBpbmZvcm1hdGlvbi4uLiIgYXMgc3VnZ2VzdGVkIGJ5IEJqb3JuCi0gbWVyZ2VkICdH
YXRoZXIgTVNJIEluZm9ybWF0aW9uLi4uIiBhbmQgIlJlbmFtZSBhbmQgcmVmYWN0b3IiIGFzIHN1
Z2dlc3RlZCBieSBCam9ybgotIFJlLWdlbmVyYXRlZCBvbiB2Ni41LXJjMwoKTWFpbiBDaGFuZ2Vz
IGZyb20gdjE6Ci0gRHJvcHBlZCAiUmVtb3ZlIGNhc3Qgd2FybmluZyBmb3IgZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KCkiLiBUaGlzCiAgaGFzIGJlZW4gb3ZlcnRha2VuIGJ5IGEgcGF0Y2ggc2Vy
aWVzIGZyb20gS3J6eXN6dG9mIFdpbGN6eW5za2kuCi0gSW1wcm92ZWQgdGhlIGNvbW1lbnQgZm9y
ICJFbmFibGUgYnVpbGRpbmcgZHJpdmVyIGFzIGEgbW9kdWxlIiB0bwogIGNsYXJpZnkgd2hhdCBl
bmFibGVzIGJ1aWxkaW5nIHRoZSBkcml2ZXIgYXMgYSBtb2R1bGUuCi0gU3BsaXQgIkdhdGhlciBN
U0kgaW5mb3JtYXRpb24gZnJvbSBoYXJkd2FyZSBjb25maWcgcmVnaXN0ZXJzIiwKICBmb3IgY2xh
cml0eSwgaW50bzoKICAgLSAiR2F0aGVyIE1TSSBpbmZvcm1hdGlvbiBmcm9tIGhhcmR3YXJlIGNv
bmZpZyByZWdpc3RlcnMiIHB1cmVseQogICAgICBjaGFuZ2luZyB0aGUgb2Ygc291cmNlIG9mIE1T
SS1yZWxhdGVkIGluZm9ybWF0aW9uIChOdW0gTVNJcyBhbmQKICAgICAgTVNJIGFkZHJlc3MpIGZy
b20gI2RlZmluZXMgKHdoaWNoIGNhbiBiZSBpbmNvcnJlY3QpIHRvIEZQR0EKICAgICAgY29uZmln
dXJhdGlvbiByZWdpc3RlcnMgKHdoaWNoIGlzIHRoZSB1bHRpbWF0ZSBzb3VyY2Ugb2YgdHJ1dGgp
LAogICAgICBhbmQgYQogICAtICJSZW5hbWUgYW5kIHJlZmFjdG9yIC4uLiIgcGF0Y2ggYXMgYSBm
dW5jdGlvbidzIGNvZGUgaXMgbm93IGNsZWFybHkKICAgICAgdW5yZWxhdGVkIHRvIGl0cyBjdXJy
ZW50IG5hbWUuCgpjYzogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
Y2M6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+CmNjOiAiS3J6eXN6
dG9mIFdpbGN6ecWEc2tpIiA8a3dAbGludXguY29tPgpjYzogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KY2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CmNjOiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3Jn
CgpEYWlyZSBNY05hbWFyYSAoOCk6CiAgUENJOiBtaWNyb2NoaXA6IENvcnJlY3QgdGhlIERFRCBh
bmQgU0VDIGludGVycnVwdCBiaXQgb2Zmc2V0cwogIFBDSTogbWljcm9jaGlwOiBFbmFibGUgYnVp
bGRpbmcgZHJpdmVyIGFzIGEgbW9kdWxlCiAgUENJOiBtaWNyb2NoaXA6IEFsaWduIHJlZ2lzdGVy
LCBvZmZzZXQsIGFuZCBtYXNrIG5hbWVzIHdpdGggaHcgZG9jcwogIFBDSTogbWljcm9jaGlwOiBF
bmFibGUgZXZlbnQgaGFuZGxlcnMgdG8gYWNjZXNzIGJyaWRnZSBhbmQgY3RybCBwdHJzCiAgUENJ
OiBtaWNyb2NoaXA6IENsZWFuIHVwIGluaXRpYWxpc2F0aW9uIG9mIGludGVycnVwdHMKICBQQ0k6
IG1pY3JvY2hpcDogR2F0aGVyIE1TSSBpbmZvcm1hdGlvbiBmcm9tIGhhcmR3YXJlIGNvbmZpZyBy
ZWdpc3RlcnMKICBQQ0k6IG1pY3JvY2hpcDogUmUtcGFydGl0aW9uIGNvZGUgYmV0d2VlbiBwcm9i
ZSgpIGFuZCBpbml0KCkKCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcgICAgICAgICAg
ICAgICB8ICAgMiArLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0
LmMgfCAzOTMgKysrKysrKysrKystLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMzMgaW5zZXJ0
aW9ucygrKSwgMTYyIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA2ZWFhZTE5ODA3NjA4MDg4
NmI5ZTdkNTdmNGFlMDZmYTc4MmY5MGVmCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
