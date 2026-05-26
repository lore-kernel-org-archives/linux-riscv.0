Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7A8CD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aByUC0hiAsQhscn0+m/2KDrGN7KHXZg+jXutcQCeV3I=; b=usiCeH9FFSEqzb
	4Ukga5pLKB7ryKSb2MqCmIjQA+l9HujMC9PyKZ02cJx1OKXuDhRGpvSa8RSlH5M3zy5AuUz5mSWVI
	PT4wggGs68YJZAN1qPnOkkUhxw/Rq3zNcWMb+nLvkag8wvIiMzIDpwpe+wUWvx6PIlV2A7NjmqCIK
	ppZ8NaVrI4/uEOyma8Mocy+ZdYX0xNePtb0lY9fh7WYYGuZ5x7pGQdI4rWhYdXzriLdD7Cf44Qc6l
	AftmGshFljTBSdwTEsTnvoNpH0g08FkZgpavlPEJYmFda0Un3ZEbqpdrYmL9apjx1+d+AazUDyvjc
	oj7LmIqxd5wnq+BnEywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxQW-00000002u9f-0ntF;
	Tue, 26 May 2026 19:26:56 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxQR-00000002u8q-3WFN
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 19:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1779823611; x=1811359611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aaLEXkMrgcqFKZQO/F24LufxbjfS0rWy8m2vfX1bBRc=;
  b=rrTDjV7wKh7SgMsFFK/nKpmmgn7tmsoon/tMTF279gzzIaz20BCIhwDA
   cbbemCZvvOlr9eDS1J0BC5F1ThJ2Q5rqKxF0kFbXBeaacVUV8QdbTdn1G
   ChgnTnLPvESx+MNHEGsRtfIDgArDVvF/wwf3oWpHXc61OIfXKR6gRS1hF
   LHfWcO6QA2dLzfDR/cqjmGJQtBWhgcCNr8fsZIlowt/7AJptRmKRRx00L
   Y+3o4nHfQUZRAzPpuoC5oeA/ueIb+8owjYYT1qpg6E4v5CUqUnBlAA7jx
   EXJuTl6PKpW5igL0iaFVDpwAXut0JLRFFmczKu4r4oD8I55NN+T9f+rtb
   A==;
X-CSE-ConnectionGUID: I5jAkgQHTROWJW0T355jWA==
X-CSE-MsgGUID: lXatkgkmQluhUB0YJj3j6Q==
X-IronPort-AV: E=Sophos;i="6.24,170,1774310400"; 
   d="scan'208";a="20011972"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:26:47 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:27631]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.115:2525] with esmtp (Farcaster)
 id 890ef666-4454-4689-899c-6e5a77486ddb; Tue, 26 May 2026 19:26:46 +0000 (UTC)
X-Farcaster-Flow-ID: 890ef666-4454-4689-899c-6e5a77486ddb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:26:46 +0000
Received: from dev-dsk-gyokhan-1b-83b48b3c.eu-west-1.amazon.com (10.13.234.1)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:26:44 +0000
From: Gyokhan Kochmarla <gyokhan@amazon.de>
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
CC: <pulehui@huawei.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alexghiti@rivosinc.com>, <rostedt@goodmis.org>,
	<mhiramat@kernel.org>, <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, kernel test robot <lkp@intel.com>,
	"Gyokhan Kochmarla" <gyokhan@amazon.de>
Subject: [PATCH 6.12] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
Date: Tue, 26 May 2026 19:26:35 +0000
Message-ID: <20260526192636.83171-1-gyokhan@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.13.234.1]
X-ClientProxiedBy: EX19D036UWC001.ant.amazon.com (10.13.139.233) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_122654_115653_B18FA14D 
X-CRM114-Status: GOOD (  10.11  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCmNvbW1pdCBlOGViOGUxYmRhZTk0
YjllMDAzZjU5MDk1MTlmZDMxMWQwOTM2ODkwIHVwc3RyZWFtLgoKQ3VycmVudGx5LCBmZ3JhcGgg
b24gcmlzY3YgcmVsaWVzIG9uIHRoZSBpbmZyYXN0cnVjdHVyZSBvZgpEWU5BTUlDX0ZUUkFDRV9X
SVRIX0FSR1MuIEhvd2V2ZXIsIERZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBtYXkgYmUKdHVybmVk
IG9mZiBvbiByaXNjdiwgd2hpY2ggd2lsbCBjYXVzZSB0aGUgZW5hYmxlZCBmZ3JhcGggdG8gYmUg
YWJub3JtYWwuClRoZXJlZm9yZSwgbGV0J3Mgc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJB
Q0VSIGRlcGVuZHMgb24KSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MuCgpGaXhlczogYTNl
ZDQxNTdiN2Q4ICgiZmdyYXBoOiBSZXBsYWNlIGZncmFwaF9yZXRfcmVncyB3aXRoIGZ0cmFjZV9y
ZWdzIikKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTAzMTYwODIwLmR2
cU1wSDBnLWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1
YXdlaS5jb20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAzMTcwMzEyMTQuNDEzODQzNi0x
LXB1bGVodWlAaHVhd2VpY2xvdWQuY29tClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogR3lva2hhbiBLb2NobWFybGEg
PGd5b2toYW5AYW1hem9uLmRlPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA5ZTg2NjdhNTIzZDUu
LjFjNzU3NTgxNjc5NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwpAQCAtMTQzLDcgKzE0Myw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBI
QVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTCiAJc2VsZWN0IEhBVkVfRFlOQU1J
Q19GVFJBQ0VfV0lUSF9BUkdTIGlmIEhBVkVfRFlOQU1JQ19GVFJBQ0UKIAlzZWxlY3QgSEFWRV9G
VFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAhWElQX0tFUk5FTAotCXNlbGVjdCBIQVZFX0ZVTkNUSU9O
X0dSQVBIX1RSQUNFUgorCXNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUiBpZiBIQVZF
X0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUwogCXNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX0ZS
RUdTCiAJc2VsZWN0IEhBVkVfRlVOQ1RJT05fVFJBQ0VSIGlmICFYSVBfS0VSTkVMICYmICFQUkVF
TVBUSU9OCiAJc2VsZWN0IEhBVkVfRUJQRl9KSVQgaWYgTU1VCi0tIAoyLjQ3LjMKCgoKCkFtYXpv
biBXZWIgU2VydmljZXMgRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApUYW1hcmEtRGFu
ei1TdHIuIDEzCjEwMjQzIEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdG9mIEhlbGxt
aXMsIEFuZHJlYXMgU3RpZWdlcgpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyB1bnRlciBIUkIgMjU3NzY0IEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMzY1IDUzOCA1
OTcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
