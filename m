Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93ADEEF319
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJK4kfalX7RdbxNiQWepZekKFolQMVVKdwgKrq1rrnU=; b=U+HUhpIrx1hvCk
	irz2tC2ELXwen5U8DWDl3Pf0/rlYEe45jHywkFih6mmNyk3W7D/S6w+7sCR+0SWlYym6GLPSP2sBv
	7FKfoxETgqmz8xt7oDzLuSwUcgj0hwhCxy59M3viIMXHZDHxyHEXhHZQbtrXVMI7MCuzLFFtTyJ9i
	byXKoyIpTCUuGccahzEmJMbKkyYZz2Nd07sWW96txxfJl/Tjp5yGP+YxpcZ19ZYF8z7RCbrCNQgAp
	bDGDmzl6mDpV3rvBV9202YlrBoIhKVnNM9YfdurOujsNARQqC/v5+iGIvWtjHiwCGhS9aKpLfhFtH
	ty9B/qM0yhT1W1CzE2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oV-000000019pL-3gBM;
	Thu, 05 Mar 2026 08:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oS-000000019kg-0VJU
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA5A34430F;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78CBC2BCB1;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=jKNMW1Kppp086xhKb9OmDqM3phfapbkFQYsfGDjd564=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k4zk6MJUbMhYHdS4LxlVYCT/aH0EX994s2aGHdUF/lRA587ZjUzPJuBmqqTJNAL7X
	 +1B1MmfdBkXJTtQUT0a2XlENQ/9BwgIGF8NCfkceoIrEyRP+LSx12jjs2BYtFWSwbN
	 YEnvtjihc7FG2A4O3CHKQqulge3DKLRgt9ykDGo53g9Kv/tFf7FGxaqEK7hx57MfrE
	 PL+j+66cIr6pipAOGtfR6C8mWkvdnXHQylF4Vuax0zHx7wER+kUqBjz6Iyk9hWU2Lt
	 7jK/HKWZpvzazFVVV5zKWAx862pQABtO7yem94F5mGu+fdLYx2Tjcwf80rL0LH8ivS
	 /TcAabkl1Gjsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2E1EEF31C;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:30 -0800
Subject: [PATCH 2/4] selftests: riscv: Add braces around EXPECT_EQ()
MIME-Version: 1.0
Message-Id: <20260305-fix_selftests-v1-2-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=2373;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=7v3hKOxSt+L+8LtCfZh085q396U9Poj6cOIz6NZfRCU=;
 b=Sq295+AKQQFINYQEs3JVoWOvokFXidLJ16vqhMSgXrs+qeDEBg2Bsqzq3t3yeHAYLKFS8YzVI
 lMB1g2/JAyhBYHhOGkxarQsvqBREbStMSMkmw1hZ9HeKbCRxs/ZzXQ0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_001204_282926_A82E5936 
X-CRM114-Status: GOOD (  10.30  )
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
