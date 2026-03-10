Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2FBFCC9A4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJK4kfalX7RdbxNiQWepZekKFolQMVVKdwgKrq1rrnU=; b=098db+EFAU2B7b
	s/nlOcX73N+Wd8Dvl38gCJ5O0QaaL3MxHJYt/8xT6Kss1uWU5QWkLnTdfbKchGnSx86Ae6FfLNAH/
	V5kOjw54VHvNSNS4d/jUfGxiord+4yb3jx4ny6h/fVVsNoQ/2RUerDzMzkzG1lZsgBjEzGz3CmpGK
	y6QW+AFaxUe4T7KJQVFzOdC/btHtc3v6DW/RD/0QVSimczChXBph8Y+GJj9Jyl0FEHzbyo+WPJ2fe
	rcKIwFC6w6XICyKNhuoP2TsQEPAT+X6GqBXLi3ls+XvMKS8aE0RK5xyV6sec4TUXN4ZqSUGJGEsTI
	1IDPpUYwH5+9jCVkxVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGk-00000008VXV-2kGl;
	Tue, 10 Mar 2026 01:52:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGi-00000008VWb-3Q7v
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 919A2600AE;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CD8DC2BCAF;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GRolZoT/3lA+J+mDh+PZkIBLqUrY5Ps/rKs56UKlapNkRFs7DU4IVWvFUNHG4TPY5
	 r1EiBHvW9rMBCoXQxH63rmshPR1EMNSvmsJLHgrJkEroA018APIM/FFpPPLOyILISj
	 u5WjFVkXa6AUlnxoSfnPbtAX0if6s7cWBT8ci9VADZB1tdx8xCuWDpZKSGac4WGG9/
	 m4cHfqjX28FYf1+ghdL5YhI1bHfdKcPFQkoQIuOulReV5ok1yg9tBM/jJSfjyGs58U
	 m38Srt4Imu4YUDC5USHH26E2MUJeFrsiyutANeyLOWH7bLkdoAUxx/HZ9fLN/chL66
	 QQvL/VqH584Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCEAFCC9AA;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:11 -0700
Subject: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
MIME-Version: 1.0
Message-Id: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=2373;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=7v3hKOxSt+L+8LtCfZh085q396U9Poj6cOIz6NZfRCU=;
 b=S2N9TZ8zWVgCVD+QvRzprkQEUmAHkc0wdE0k32fG4zPv1gMn1F6ZCLgFxIaK3ZXubqJTZ9voc
 cIxu3B7Sm6hBEdbeQLlyIRpfWbeEc6tgeXvqabXhadGrbzqNGjA6diN
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+CgpFWFBF
Q1RfRVEoKSBleHBhbmRzIHRvIG11bHRpcGxlIGxpbmVzLCBicmVha2luZyB1cCBvbmUtbGluZSBp
ZgpzdGF0ZW1lbnRzLiBUaGlzIGlzc3VlIHdhcyBub3QgcHJlc2VudCBpbiB0aGUgcGF0Y2ggb24g
dGhlIG1haWxpbmcgbGlzdApidXQgd2FzIGluc3RlYWQgaW50cm9kdWNlZCBieSB0aGUgbWFpbnRh
aW5lciB3aGVuIGF0dGVtcHRpbmcgdG8gZml4IHVwCmNoZWNrcGF0Y2ggd2FybmluZ3MuIEFkZCBi
cmFjZXMgYXJvdW5kIEVYUEVDVF9FUSgpIHRvIGF2b2lkIHRoZSBlcnJvcgpldmVuIHRob3VnaCBj
aGVja3BhdGNoIHN1Z2dlc3RzIHRoZW0gdG8gYmUgcmVtb3ZlZDoKCnZhbGlkYXRlX3ZfcHRyYWNl
LmM6NjI2OjE3OiBlcnJvcjog4oCYZWxzZeKAmSB3aXRob3V0IGEgcHJldmlvdXMg4oCYaWbigJkK
CkZpeGVzOiAzNzg5ZDVlZWNkNWEgKCJzZWxmdGVzdHM6IHJpc2N2OiB2ZXJpZnkgc3lzY2FsbHMg
ZGlzY2FyZCB2ZWN0b3IgY29udGV4dCIpCkZpeGVzOiAzMGViMTkxYzg5NWIgKCJzZWxmdGVzdHM6
IHJpc2N2OiB2ZXJpZnkgcHRyYWNlIHJlamVjdHMgaW52YWxpZCB2ZWN0b3IgY3NyIGlucHV0cyIp
CkZpeGVzOiA4NDlmMDVhZTFlYTYgKCJzZWxmdGVzdHM6IHJpc2N2OiB2ZXJpZnkgcHRyYWNlIGFj
Y2VwdHMgdmFsaWQgdmVjdG9yIGNzciB2YWx1ZXMiKQpTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEpl
bmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdmFsaWRhdGVfdl9wdHJhY2UuYyB8IDE1ICsrKysrKysrKy0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdmFsaWRhdGVf
dl9wdHJhY2UuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92YWxpZGF0
ZV92X3B0cmFjZS5jCmluZGV4IDI1N2RlMzYyNzRlOS4uNTcyNGU2ZWIzMzA5IDEwMDY0NAotLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdmFsaWRhdGVfdl9wdHJhY2Uu
YworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdmFsaWRhdGVfdl9w
dHJhY2UuYwpAQCAtMjkxLDEwICsyOTEsMTEgQEAgVEVTVChwdHJhY2Vfdl9zeXNjYWxsX2Nsb2Ji
ZXJpbmcpCiAKIAkJLyogdmVyaWZ5IGluaXRpYWwgdnNldHZsaSBzZXR0aW5ncyAqLwogCi0JCWlm
IChpc194dGhlYWR2ZWN0b3Jfc3VwcG9ydGVkKCkpCisJCWlmIChpc194dGhlYWR2ZWN0b3Jfc3Vw
cG9ydGVkKCkpIHsKIAkJCUVYUEVDVF9FUSg1VUwsIHJlZ3NldF9kYXRhLT52dHlwZSk7Ci0JCWVs
c2UKKwkJfSBlbHNlIHsKIAkJCUVYUEVDVF9FUSg5VUwsIHJlZ3NldF9kYXRhLT52dHlwZSk7CisJ
CX0KIAogCQlFWFBFQ1RfRVEocmVnc2V0X2RhdGEtPnZsZW5iLCByZWdzZXRfZGF0YS0+dmwpOwog
CQlFWFBFQ1RfRVEodmxlbmIsIHJlZ3NldF9kYXRhLT52bGVuYik7CkBAIC02MjAsMTAgKzYyMSwx
MSBAQCBURVNUX0Yodl9jc3JfaW52YWxpZCwgcHRyYWNlX3ZfaW52YWxpZF92YWx1ZXMpCiAKIAkJ
LyogdmVyaWZ5IGluaXRpYWwgdnNldHZsaSBzZXR0aW5ncyAqLwogCi0JCWlmIChpc194dGhlYWR2
ZWN0b3Jfc3VwcG9ydGVkKCkpCisJCWlmIChpc194dGhlYWR2ZWN0b3Jfc3VwcG9ydGVkKCkpIHsK
IAkJCUVYUEVDVF9FUSg1VUwsIHJlZ3NldF9kYXRhLT52dHlwZSk7Ci0JCWVsc2UKKwkJfSBlbHNl
IHsKIAkJCUVYUEVDVF9FUSg5VUwsIHJlZ3NldF9kYXRhLT52dHlwZSk7CisJCX0KIAogCQlFWFBF
Q1RfRVEocmVnc2V0X2RhdGEtPnZsZW5iLCByZWdzZXRfZGF0YS0+dmwpOwogCQlFWFBFQ1RfRVEo
dmxlbmIsIHJlZ3NldF9kYXRhLT52bGVuYik7CkBAIC04MjgsMTAgKzgzMCwxMSBAQCBURVNUX0Yo
dl9jc3JfdmFsaWQsIHB0cmFjZV92X3ZhbGlkX3ZhbHVlcykKIAogCQkvKiB2ZXJpZnkgaW5pdGlh
bCB2c2V0dmxpIHNldHRpbmdzICovCiAKLQkJaWYgKGlzX3h0aGVhZHZlY3Rvcl9zdXBwb3J0ZWQo
KSkKKwkJaWYgKGlzX3h0aGVhZHZlY3Rvcl9zdXBwb3J0ZWQoKSkgewogCQkJRVhQRUNUX0VRKDVV
TCwgcmVnc2V0X2RhdGEtPnZ0eXBlKTsKLQkJZWxzZQorCQl9IGVsc2UgewogCQkJRVhQRUNUX0VR
KDlVTCwgcmVnc2V0X2RhdGEtPnZ0eXBlKTsKKwkJfQogCiAJCUVYUEVDVF9FUShyZWdzZXRfZGF0
YS0+dmxlbmIsIHJlZ3NldF9kYXRhLT52bCk7CiAJCUVYUEVDVF9FUSh2bGVuYiwgcmVnc2V0X2Rh
dGEtPnZsZW5iKTsKCi0tIAoyLjUyLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
