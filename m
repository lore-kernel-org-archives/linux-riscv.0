Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BC1E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5l4i6M7tA2RE+IWlfSHpD6CoGxPSr/3O4QSdhQ1uF88=; b=cI02mr0cphgswo
	Rm4TcMb0dwDK3a5nHk7RUXBtVKmJ58F/PH7uLRQW7hOsl4o1KNlbvpD38jo22Jo24c43y9jEFbK/u
	CPXOqqh5PALGB22+UIEFHtVSoIwRESKMvqI6To92cjN9lvyoJa9afzOlmnYg8XjJVZNe4xWsgAoby
	85ulk5opkr2hM0rfwG6TPoTzVvnfWbtk4tsLISv/tnxiQuMXOIxvMzonANWOQwrfUrmi/ZHDaInqb
	6dADk2olydcjLFBtUmUiNPe8afF1SwauP/XdEdLSjssml7svXtkWvgew66wZxYTn/ePQQSGO0ipyX
	/auPA5anc6EaLH0xRStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4XG-00000003pzH-3GOH;
	Tue, 07 Jan 2025 08:01:58 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Ud-00000003pLX-1bMG
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 07:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736236755; x=1767772755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+e67DkeUVPkZicopwTlBfVGta3FJLTOXv3gUbRrxS8=;
  b=V0WaGCncojFR4htQTKS6zBSYaFH7JWssh0ncYcFGZWx/xZlZkMW88OYW
   o7OpJxa2ccOQbYfr7xqzzE5hghc5cZ2JBFCtemTPcw1pH2x1FnzCU9V1l
   Ms1n3R1TrYZSBknEqglSTMwDVebJMdFyCNImJcB4OP0p1Bgujhe5PEN40
   1hjy1LqcWLN9LTpWk7G2VmSDSqN01SliJn0q42uCe7HAK0aC3t0OkeDSZ
   gHUQoQey8CNZ9gjYFzoHDmsR3iJlDGpipmsLPfuBnz/8ADzcO4IYBEHMy
   AOwiIpVNCqEiYyN+8MOGGcyR78KK/mip7Ev2VDbEcAiXOvN1HXaNL/o65
   A==;
X-CSE-ConnectionGUID: JoHGUEqwTRmW2M1c00aqNA==
X-CSE-MsgGUID: RqYCCVbLRnelYRUA7Ourpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:59:07 +0200
X-CSE-ConnectionGUID: FYYNcb5ZStmr7odO8qDWnA==
X-CSE-MsgGUID: fvveeh8CSXCeDoQnmO8UqA==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces02_data.me-corp.lan with SMTP; 07 Jan 2025 09:59:04 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Tue, 07 Jan 2025 09:59:05 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH v3 2/2] irqchip/riscv-aplic: add support for hart indexes
Date: Tue,  7 Jan 2025 09:58:35 +0200
Message-ID: <20250107075835.1421602-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
 <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_235915_730975_A06E9FA4 
X-CRM114-Status: GOOD (  18.81  )
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

UmlzYy1WIEFQTElDIHNwZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFdOgoK
V2l0aGluIGEgZ2l2ZW4gaW50ZXJydXB0IGRvbWFpbiwgZWFjaCBvZiB0aGUgZG9tYWlu4oCZcyBo
YXJ0cyBoYXMgYQp1bmlxdWUgaW5kZXggbnVtYmVyIGluIHRoZSByYW5nZSAwIHRvIDJeMTQg4oiS
IDEgKD0gMTYsMzgzKS4gVGhlIGluZGV4Cm51bWJlciBhIGRvbWFpbiBhc3NvY2lhdGVzIHdpdGgg
YSBoYXJ0IG1heSBvciBtYXkgbm90IGhhdmUgYW55CnJlbGF0aW9uc2hpcCB0byB0aGUgdW5pcXVl
IGhhcnQgaWRlbnRpZmllciAo4oCcaGFydCBJROKAnSkgdGhhdCB0aGUKUklTQy1WIFByaXZpbGVn
ZWQgQXJjaGl0ZWN0dXJlIGFzc2lnbnMgdG8gdGhlIGhhcnQuIFR3byBkaWZmZXJlbnQKaW50ZXJy
dXB0IGRvbWFpbnMgbWF5IGVtcGxveSBlbnRpcmVseSBkaWZmZXJlbnQgaW5kZXggbnVtYmVycyBm
b3IKdGhlIHNhbWUgc2V0IG9mIGhhcnRzLgoKRnVydGhlciwgdGhpcyBkb2N1bWVudCBzYXlzIGlu
ICI0LjUgTWVtb3J5LW1hcHBlZCBjb250cm9sCnJlZ2lvbiBmb3IgYW4gaW50ZXJydXB0IGRvbWFp
biI6CgpUaGUgYXJyYXkgb2YgSURDIHN0cnVjdHVyZXMgbWF5IGluY2x1ZGUgc29tZSBmb3IgcG90
ZW50aWFsIGhhcnQgaW5kZXgKbnVtYmVycyB0aGF0IGFyZSBub3QgYWN0dWFsIGhhcnQgaW5kZXgg
bnVtYmVycyBpbiB0aGUgZG9tYWluLiBGb3IKZXhhbXBsZSwgdGhlIGZpcnN0IElEQyBzdHJ1Y3R1
cmUgaXMgYWx3YXlzIGZvciBoYXJ0IGluZGV4IDAsIGJ1dCAwIGlzCm5vdCBuZWNlc3NhcmlseSBh
IHZhbGlkIGluZGV4IG51bWJlciBmb3IgYW55IGhhcnQgaW4gdGhlIGRvbWFpbi4KClN1cHBvcnQg
YXJiaXRyYXJ5IGhhcnQgaW5kZXhlcyBzcGVjaWZpZWQgaW4gb3B0aW9uYWwgQVBMSUMgcHJvcGVy
dHkKInJpc2N2LGhhcnQtaW5kZXhlcyIgdGhhdCBzaG91bGQgYmUgYXJyYXkgb2YgdTMyIGVsZW1l
bnRzLCBvbmUgcGVyCmludGVycnVwdCB0YXJnZXQuIElmIHRoaXMgcHJvcGVydHkgbm90IHNwZWNp
ZmllZCwgZmFsbGJhY2sgaXMgdG8gdXNlCmxvZ2ljYWwgaGFydCBpbmRleGVzIHdpdGhpbiB0aGUg
ZG9tYWluLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhCgpTaWduZWQt
b2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXll
LmNvbT4KLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5jIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLWRpcmVjdC5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3Qu
YwppbmRleCA3Y2Q2YjY0Njc3NGIuLmVhNjEzMjlkZWNiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3QuYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLWRpcmVjdC5jCkBAIC0zMSw3ICszMSw3IEBAIHN0cnVjdCBhcGxpY19kaXJl
Y3QgewogfTsKIAogc3RydWN0IGFwbGljX2lkYyB7Ci0JdW5zaWduZWQgaW50CQloYXJ0X2luZGV4
OworCXUzMgkJCWhhcnRfaW5kZXg7CiAJdm9pZCBfX2lvbWVtCQkqcmVnczsKIAlzdHJ1Y3QgYXBs
aWNfZGlyZWN0CSpkaXJlY3Q7CiB9OwpAQCAtMjE5LDYgKzIxOSwyMSBAQCBzdGF0aWMgaW50IGFw
bGljX2RpcmVjdF9wYXJzZV9wYXJlbnRfaHdpcnEoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgaW5k
ZXgsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgYXBsaWNfZGlyZWN0X2dldF9oYXJ0X2lu
ZGV4KHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGxvZ2ljYWxfaW5kZXgsCisJCQkJICAgICAgIHUz
MiAqaGFydF9pbmRleCkKK3sKKwlzdGF0aWMgY29uc3QgY2hhciAqcHJvcF9oYXJ0X2luZGV4ID0g
InJpc2N2LGhhcnQtaW5kZXhlcyI7CisJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHRvX29mX25v
ZGUoZGV2LT5md25vZGUpOworCisJaWYgKCFucCB8fCAhb2ZfcHJvcGVydHlfcHJlc2VudChucCwg
cHJvcF9oYXJ0X2luZGV4KSkgeworCQkqaGFydF9pbmRleCA9IGxvZ2ljYWxfaW5kZXg7CisJCXJl
dHVybiAwOworCX0KKworCXJldHVybiBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgcHJv
cF9oYXJ0X2luZGV4LAorCQkJCQkgIGxvZ2ljYWxfaW5kZXgsIGhhcnRfaW5kZXgpOworfQorCiBp
bnQgYXBsaWNfZGlyZWN0X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpy
ZWdzKQogewogCWludCBpLCBqLCByYywgY3B1LCBjdXJyZW50X2NwdSwgc2V0dXBfY291bnQgPSAw
OwpAQCAtMjY1LDggKzI4MCwxMiBAQCBpbnQgYXBsaWNfZGlyZWN0X3NldHVwKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdm9pZCBfX2lvbWVtICpyZWdzKQogCQljcHVtYXNrX3NldF9jcHUoY3B1LCAmZGly
ZWN0LT5sbWFzayk7CiAKIAkJaWRjID0gcGVyX2NwdV9wdHIoJmFwbGljX2lkY3MsIGNwdSk7Ci0J
CWlkYy0+aGFydF9pbmRleCA9IGk7Ci0JCWlkYy0+cmVncyA9IHByaXYtPnJlZ3MgKyBBUExJQ19J
RENfQkFTRSArIGkgKiBBUExJQ19JRENfU0laRTsKKwkJcmMgPSBhcGxpY19kaXJlY3RfZ2V0X2hh
cnRfaW5kZXgoZGV2LCBpLCAmaWRjLT5oYXJ0X2luZGV4KTsKKwkJaWYgKHJjKSB7CisJCQlkZXZf
d2FybihkZXYsICJoYXJ0IGluZGV4IG5vdCBmb3VuZCBmb3IgSURDJWRcbiIsIGkpOworCQkJY29u
dGludWU7CisJCX0KKwkJaWRjLT5yZWdzID0gcHJpdi0+cmVncyArIEFQTElDX0lEQ19CQVNFICsg
aWRjLT5oYXJ0X2luZGV4ICogQVBMSUNfSURDX1NJWkU7CiAJCWlkYy0+ZGlyZWN0ID0gZGlyZWN0
OwogCiAJCWFwbGljX2lkY19zZXRfZGVsaXZlcnkoaWRjLCB0cnVlKTsKLS0gCjIuNDMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
