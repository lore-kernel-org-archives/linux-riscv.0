Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A99EC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 07:29:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15AC20767
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 07:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hk/qzOv/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYqakm73"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15AC20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tdSQsfOTMsAB5NkP7EaUtibg144sMyx+gdLnSSDCpFw=; b=Hk/qzOv/VPpLZnn6x4t8FiuY3l
	vo7RH3ixx8fCLy1xjEcFg9Dhe1LSWA3ljtngcNU/C9a1slD6q+kbhkjDc7FK3iAwITeyTnU0Zeakr
	wzmq8M8GegWDjIruFbhmSU8RpBFL9ApepuWYuG8ywWYmUO9OPJPVGrIKCqejtpWYNlvm57BiM3h/w
	SePyxisZRag/Xf4IsEcY/RXFZ/murlUKjrejE9NoXpl4ni6GDgbvgzwJOM3clsXvKtekblxk4AVyB
	aAMpluESLfGf/fYF2loqfQUvMdAzrgU6B7mDLVj6xcK9RaC8t0SzQ86eT+ugzmvuyz8LUkLJX3leI
	dBqCWyiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQza-0002oD-6H; Thu, 09 Jul 2020 07:29:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQzY-0002nk-9b
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 07:29:13 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80B5D2074A;
 Thu,  9 Jul 2020 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594279751;
 bh=V9g8SE10fROyxVg2xxAPC4nQBmidhZEFaboABYn9Htk=;
 h=From:To:Cc:Subject:Date:From;
 b=HYqakm73YTt3Ru7/XNbqXC5fUrM78k3XcqblzC/fAdEF44bKcaRgRlmPOV2aOHWWO
 Cmkf4rz4O4mQEIfAWxR4F+dSbPFtRAwbOe/iY6flTAMG8yybHCFYmb5ivXMEPpzk/Q
 3TtUAZKz3srf2utcx6F2AfdVcUdgAhfOE+i/oGfo=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com
Subject: [PATCH v2 1/2] riscv: Add STACKPROTECTOR supported
Date: Thu,  9 Jul 2020 07:28:16 +0000
Message-Id: <1594279697-72511-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_032912_453737_B2FFC464 
X-CRM114-Status: GOOD (  15.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-riscv@lists.infradead.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIC1mc3RhY2stcHJv
dGVjdG9yICYgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIGZlYXR1cmVzIGFyZSBmcm9tCmdjYy4g
VGhlIHBhdGNoIG9ubHkgYWRkIGJhc2ljIGtlcm5lbCBzdXBwb3J0IHRvIHN0YWNrLXByb3RlY3Rv
cgpmZWF0dXJlIGFuZCBzb21lIGFyY2ggY291bGQgaGF2ZSBpdHMgb3duIHNvbHV0aW9uIHN1Y2gg
YXMKQVJNNjRfUFRSX0FVVEguCgpBZnRlciBlbmFibGluZyBTVEFDS1BST1RFQ1RPUiBhbmQgU1RB
Q0tQUk9URUNUT1JfU1RST05HLCB0aGUgLnRleHQKc2l6ZSBpcyBleHBhbmRlZCBmcm9tICAweDdk
ZTA2NiB0byAweDgxZmIzMiAob25seSA1JSkgdG8gYWRkIGNhbmFyeQpjaGVja2luZyBjb2RlLgoK
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBQYXVsIFdhbG1zbGV5
IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFi
YmVsdEBnb29nbGUuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNj
OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgpDYzogQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgpDYzogR3JlZW50aW1lIEh1IDxncmVlbi5odUBnbWFp
bC5jb20+CkNjOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N0YWNrcHJvdGVjdG9yLmggfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8ICA2ICsrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdGFja3Byb3RlY3Rvci5oCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGY5MjdhOTEuLjRiMGUz
MDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKQEAgLTYzLDYgKzYzLDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEhBVkVfUEVSRl9FVkVO
VFMKIAlzZWxlY3QgSEFWRV9QRVJGX1JFR1MKIAlzZWxlY3QgSEFWRV9QRVJGX1VTRVJfU1RBQ0tf
RFVNUAorCXNlbGVjdCBIQVZFX1NUQUNLUFJPVEVDVE9SCiAJc2VsZWN0IEhBVkVfU1lTQ0FMTF9U
UkFDRVBPSU5UUwogCXNlbGVjdCBJUlFfRE9NQUlOCiAJc2VsZWN0IE1PRFVMRVNfVVNFX0VMRl9S
RUxBIGlmIE1PRFVMRVMKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2tw
cm90ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uOGUxZWYyYwotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaApAQCAtMCwwICsxLDMz
IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworCisjaWZuZGVmIF9B
U01fUklTQ1ZfU1RBQ0tQUk9URUNUT1JfSAorI2RlZmluZSBfQVNNX1JJU0NWX1NUQUNLUFJPVEVD
VE9SX0gKKworI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4L3ZlcnNp
b24uaD4KKyNpbmNsdWRlIDxhc20vdGltZXguaD4KKworZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19z
dGFja19jaGtfZ3VhcmQ7CisKKy8qCisgKiBJbml0aWFsaXplIHRoZSBzdGFja3Byb3RlY3RvciBj
YW5hcnkgdmFsdWUuCisgKgorICogTk9URTogdGhpcyBtdXN0IG9ubHkgYmUgY2FsbGVkIGZyb20g
ZnVuY3Rpb25zIHRoYXQgbmV2ZXIgcmV0dXJuLAorICogYW5kIGl0IG11c3QgYWx3YXlzIGJlIGlu
bGluZWQuCisgKi8KK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBib290X2luaXRfc3RhY2tf
Y2FuYXJ5KHZvaWQpCit7CisJdW5zaWduZWQgbG9uZyBjYW5hcnk7CisJdW5zaWduZWQgbG9uZyB0
c2M7CisKKwkvKiBUcnkgdG8gZ2V0IGEgc2VtaSByYW5kb20gaW5pdGlhbCB2YWx1ZS4gKi8KKwln
ZXRfcmFuZG9tX2J5dGVzKCZjYW5hcnksIHNpemVvZihjYW5hcnkpKTsKKwl0c2MgPSBnZXRfY3lj
bGVzKCk7CisJY2FuYXJ5ICs9IHRzYyArICh0c2MgPDwgMzJVTCk7CisJY2FuYXJ5IF49IExJTlVY
X1ZFUlNJT05fQ09ERTsKKwljYW5hcnkgJj0gQ0FOQVJZX01BU0s7CisKKwljdXJyZW50LT5zdGFj
a19jYW5hcnkgPSBjYW5hcnk7CisJX19zdGFja19jaGtfZ3VhcmQgPSBjdXJyZW50LT5zdGFja19j
YW5hcnk7Cit9CisjZW5kaWYgLyogX0FTTV9SSVNDVl9TVEFDS1BST1RFQ1RPUl9IICovCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMKaW5kZXggODI0ZDExNy4uNjU0ODkyOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwpAQCAtMjQs
NiArMjQsMTIgQEAKIAogcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBncF9pbl9nbG9iYWwgX19hc21f
XygiZ3AiKTsKIAorI2lmZGVmIENPTkZJR19TVEFDS1BST1RFQ1RPUgorI2luY2x1ZGUgPGxpbnV4
L3N0YWNrcHJvdGVjdG9yLmg+Cit1bnNpZ25lZCBsb25nIF9fc3RhY2tfY2hrX2d1YXJkIF9fcmVh
ZF9tb3N0bHk7CitFWFBPUlRfU1lNQk9MKF9fc3RhY2tfY2hrX2d1YXJkKTsKKyNlbmRpZgorCiBl
eHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmsodm9pZCk7CiBleHRlcm4gYXNtbGlu
a2FnZSB2b2lkIHJldF9mcm9tX2tlcm5lbF90aHJlYWQodm9pZCk7CiAKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
