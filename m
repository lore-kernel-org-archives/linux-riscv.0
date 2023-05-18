Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7034AC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5u1RSb6fvvEj4IN/0HOiptXGsdiHjuLfWkqUBuaRHzE=; b=ilbMyA6vgUYnXU
	BLtvp2UPFA5y3XrWdEafi3p1G2Te83GF/HL5LhLls8mRPvIP15yUjHaHAeDEFMFD3UzTDMIdYRw6F
	OZ3mSxjvl1qnqIvqvUraabUElHMwdZV7ah3xj9RsUIK1cZyotNk7NDv+tOnp+51hVvrO5bpKANx+B
	0H+guzH/gXgu4oAw5gOTh8jozSH4L/9X/xGvdnHEt/8P0LDQtsDhiTGWL5pIGeQc0gG62AD2DZq0J
	jCHADxiYoLCYl18QW71+EucPpGfW+2afiXOh+mxgKSlyhUKj6I/MU8+XM9uE9w/yhrnIiuwSMCyoh
	upkRV3I4OcEUlPrZHSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdR1-00D2Xn-1T;
	Thu, 18 May 2023 13:12:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQy-00D2Wv-31
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:12:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8099364F54;
	Thu, 18 May 2023 13:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F63AC4339E;
	Thu, 18 May 2023 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415563;
	bh=K6yzC4DxTrto6TIigKOf2HSRiKwOssJzxGPb5qsG5uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXJAwAIukQyUqKfJu7LCrvsuxh/2lr7uu5dOljJseAAxlywm7yBd0VVked85CNfjq
	 IuuSjQ3DcQgJRFeh45p3dQgYfRpVz2tNQolXVKu9rK0sZ2MgE0882A/1QHYou7eh07
	 4XNgn+8fsLlgrSHNcB3MocDEWrzhpRblVSC8K2jrSn0CbS7jrAdUasfwC32+By7tc0
	 7f/1X9uwq+ZwYRbv8qHiTjboPIJEija8peqdWLq59oc44Q9Ca+TaUuK8KWZYNnf5Hd
	 dl7nEC2nrfl05jQzwP2H1hXitACGVH5WlldFt/AFHIws3dqz6Xaxb08Lxc3x8D3btO
	 j29hJzbTHERLA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 10/22] riscv: s64ilp32: Enable user space runtime environment
Date: Thu, 18 May 2023 09:10:01 -0400
Message-Id: <20230518131013.3366406-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061245_049206_3BFF82F4 
X-CRM114-Status: GOOD (  12.84  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKUlY2NElMUDMyIHVzZXMg
dGhlIHNhbWUgc2V0dGluZyBmcm9tIENPTVBBVCBtb2RlIGZvciB0aGUgdXNlcgpzcGFjZSBydW50
aW1lIGVudmlyb25tZW50LiBUaGV5IGFsbCBoYXZlIHRoZSBzYW1lIDJHQiBUQVNLX1NJWkUuCgpT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3NyLmggICAgIHwgMiAtLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
fCA4ICsrKysrKystCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICB8IDQgKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oCmluZGV4IGFkYzNjODY2ZDM1My4uNzU1OGUwODA4YWY0IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKQEAgLTM2LDExICszNiw5IEBACiAjZGVmaW5lIFNSX1NECQlfQUMoMHg4MDAwMDAwMDAw
MDAwMDAwLCBVTEwpIC8qIEZTL1hTIGRpcnR5ICovCiAjZW5kaWYKIAotI2lmIF9fcmlzY3ZfeGxl
biA9PSA2NAogI2RlZmluZSBTUl9VWEwJCV9BQygweDMwMDAwMDAwMCwgVUxMKSAvKiBYTEVOIG1h
c2sgZm9yIFUtbW9kZSAqLwogI2RlZmluZSBTUl9VWExfMzIJX0FDKDB4MTAwMDAwMDAwLCBVTEwp
IC8qIFhMRU4gPSAzMiBmb3IgVS1tb2RlICovCiAjZGVmaW5lIFNSX1VYTF82NAlfQUMoMHgyMDAw
MDAwMDAsIFVMTCkgLyogWExFTiA9IDY0IGZvciBVLW1vZGUgKi8KLSNlbmRpZgogCiAvKiBTQVRQ
IGZsYWdzICovCiAjaWYgX19yaXNjdl94bGVuID09IDMyCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
CmluZGV4IDMzMDNmYzAzZDcyNC4uZDdiOGVmZjBhZGU5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaApAQCAtODMwLDI2ICs4MzAsMzIgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX2Ns
ZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCiAgKiAtICAgICAweDlmYzAwMDAwICh+Mi41R0IpIGZv
ciBSVjMyLgogICogLSAgIDB4NDAwMDAwMDAwMCAoIDI1NkdCKSBmb3IgUlY2NCB1c2luZyBTVjM5
IG1tdQogICogLSAweDgwMDAwMDAwMDAwMCAoIDEyOFRCKSBmb3IgUlY2NCB1c2luZyBTVjQ4IG1t
dQorICogLSAgICAgMHg4MDAwMDAwMCAoICAgMkdCKSBmb3IgQ09NUEFUIGFuZCBSVjY0SUxQMzIK
ICAqCiAgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBtdXN0IGV2ZW5seSBkaXZpZGUgVEFTS19TSVpF
IHNpbmNlICJSSVNDLVYKICAqIEluc3RydWN0aW9uIFNldCBNYW51YWwgVm9sdW1lIElJOiBQcml2
aWxlZ2VkIEFyY2hpdGVjdHVyZSIgc3RhdGVzIHRoYXQKICAqICJsb2FkIGFuZCBzdG9yZSBlZmZl
Y3RpdmUgYWRkcmVzc2VzLCB3aGljaCBhcmUgNjRiaXRzLCBtdXN0IGhhdmUgYml0cwogICogNjPi
gJM0OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBvciBlbHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24g
d2lsbCBvY2N1ci4iCiAgKi8KKyNkZWZpbmUgVEFTS19TSVpFXzMyCShfQUMoMHg4MDAwMDAwMCwg
VUwpIC0gUEFHRV9TSVpFKQorCiAjaWZkZWYgQ09ORklHXzY0QklUCiAjZGVmaW5lIFRBU0tfU0la
RV82NAkoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCiAjZGVmaW5lIFRBU0tfU0laRV9N
SU4JKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQogCiAjaWZkZWYgQ09ORklHX0NP
TVBBVAotI2RlZmluZSBUQVNLX1NJWkVfMzIJKF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJ
WkUpCiAjZGVmaW5lIFRBU0tfU0laRQkodGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAog
CQkJIFRBU0tfU0laRV8zMiA6IFRBU0tfU0laRV82NCkKICNlbHNlCiAjZGVmaW5lIFRBU0tfU0la
RQlUQVNLX1NJWkVfNjQKICNlbmRpZgogCisjZWxzZQorI2lmZGVmIENPTkZJR19BUkNIX1JWNjRJ
TFAzMgorI2RlZmluZSBUQVNLX1NJWkUJVEFTS19TSVpFXzMyCiAjZWxzZQogI2RlZmluZSBUQVNL
X1NJWkUJRklYQUREUl9TVEFSVAorI2VuZGlmCiAjZGVmaW5lIFRBU0tfU0laRV9NSU4JVEFTS19T
SVpFCiAjZW5kaWYKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IGFiMDFiNTFhNWJiOS4uZTAzM2RiZTVi
NWViIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0xMjUsMTMgKzEyNSwxNSBAQCB2b2lkIHN0YXJ0X3Ro
cmVhZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBwYywKIAlyZWdzLT5lcGMg
PSBwYzsKIAlyZWdzLT5zcCA9IHNwOwogCi0jaWZkZWYgQ09ORklHXzY0QklUCiAJcmVncy0+c3Rh
dHVzICY9IH5TUl9VWEw7CiAKKyNpZmRlZiBDT05GSUdfNjRCSVQKIAlpZiAoaXNfY29tcGF0X3Rh
c2soKSkKIAkJcmVncy0+c3RhdHVzIHw9IFNSX1VYTF8zMjsKIAllbHNlCiAJCXJlZ3MtPnN0YXR1
cyB8PSBTUl9VWExfNjQ7CisjZWxzZQorCQlyZWdzLT5zdGF0dXMgfD0gU1JfVVhMXzMyOwogI2Vu
ZGlmCiB9CiAKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
